from django.contrib import messages
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from oscar.apps.checkout import views
from oscar.apps.payment import forms, models

from paypal.payflow import facade
from oscar.apps.checkout.views import PaymentDetailsView as CorePaymentDetailsView  # noqa
from oscar.apps.checkout.views import ThankYouView as CoreThankYouView  # noqa
from django.contrib import messages

from django.core.urlresolvers import reverse_lazy
from django.views.generic import FormView
from oscar.apps.payment.exceptions import RedirectRequired
from oscar.apps.checkout import views as oscar_views
from oscar.apps.payment.models import SourceType, Source

from forms import PaymentMethodForm
# Make sure OSCAR_REQUIRED_ADDRESS_FIELDS is set correctly for VAT
# assessment


class PaymentMethodView(oscar_views.PaymentMethodView, FormView):
    """
    Updated payment methods view.
    """
    template_name = "checkout/payment_method.html"
    step = 'payment-method'
    form_class = PaymentMethodForm
    success_url = reverse_lazy('checkout:payment-details')

    def get_context_data(self, **kwargs):
        """
        Add data for Paypal Express flow.
        """
        # Override method so the bankcard and billing address forms can be
        # added to the context.
        ctx = super(PaymentMethodView, self).get_context_data(**kwargs)
        ctx['payment_method'] = self.checkout_session.payment_method()
        return ctx


    def get_success_response(self):
        # No errors in get(), apply our form logic.
        # NOTE that the checks are not make in the post() call, but this is not a problem.
        # We can just store the payment method, and let the next view validate the other states again.
        return FormView.get(self, self.request, self.args, self.kwargs)

    def get_initial(self):
        return {
            'payment_method': self.checkout_session.payment_method(),
        }

    def form_valid(self, form):
        # Store payment method in the CheckoutSessionMixin.checkout_session (a CheckoutSessionData object)
        self.checkout_session.pay_by(form.cleaned_data['payment_method'])
        return super(PaymentMethodView, self).form_valid(form)


class PaymentDetailsView(views.PaymentDetailsView):
    """
    An example view that shows how to integrate BOTH Paypal Express
    (see get_context_data method)and Payppal Flow (the other methods).
    Naturally, you will only want to use one of the two.
    """

    def get_context_data(self, **kwargs):
        """
        Add data for Paypal Express flow.
        """
        # Override method so the bankcard and billing address forms can be
        # added to the context.
        ctx = super(PaymentDetailsView, self).get_context_data(**kwargs)
        ctx['bankcard_form'] = kwargs.get(
            'bankcard_form', forms.BankcardForm())
        ctx['billing_address_form'] = kwargs.get(
            'billing_address_form', forms.BillingAddressForm())
        ctx['payment_method'] = self.checkout_session.payment_method()     
        return ctx

    def post(self, request, *args, **kwargs):
        # Override so we can validate the bankcard/billingaddress submission.
        # If it is valid, we render the preview screen with the forms hidden
        # within it.  When the preview is submitted, we pick up the 'action'
        # parameters and actually place the order.
        if request.POST.get('action', '') == 'place_order':
            return self.do_place_order(request)

        bankcard_form = forms.BankcardForm(request.POST)
        billing_address_form = forms.BillingAddressForm(request.POST)
        payment_method = self.checkout_session.payment_method() 

        if not all([bankcard_form.is_valid(),
                    billing_address_form.is_valid()]):
            # Form validation failed, render page again with errors
            self.preview = False
            ctx = self.get_context_data(
                bankcard_form=bankcard_form,
                billing_address_form=billing_address_form,
                payment_method=payment_method)

            return self.render_to_response(ctx)

        # Render preview with bankcard and billing address details hidden
        return self.render_preview(request,
                                   bankcard_form=bankcard_form,
                                   billing_address_form=billing_address_form)

    def do_place_order(self, request):
        # Helper method to check that the hidden forms wasn't tinkered
        # with.
        bankcard_form = forms.BankcardForm(request.POST)
        billing_address_form = forms.BillingAddressForm(request.POST)
        if not all([bankcard_form.is_valid(),
                    billing_address_form.is_valid()]):
            messages.error(request, "Invalid submission")
            return HttpResponseRedirect(reverse('checkout:payment-details'))

        # Attempt to submit the order, passing the bankcard object so that it
        # gets passed back to the 'handle_payment' method below.
        submission = self.build_submission()
        submission['payment_kwargs']['bankcard'] = bankcard_form.bankcard
        submission['payment_kwargs']['billing_address'] = billing_address_form.cleaned_data
        return self.submit(**submission)

    def handle_payment(self, order_number, total, **kwargs):
        """
        Make submission to PayPal
        """
        # Using authorization here (two-stage model).  You could use sale to
        # perform the auth and capture in one step.  The choice is dependent
        # on your business model.
        facade.authorize(
            order_number, total.incl_tax,
            kwargs['bankcard'], kwargs['billing_address'])

        # Record payment source and event
        source_type, is_created = models.SourceType.objects.get_or_create(
            name='PayPal')
        source = source_type.sources.model(
            source_type=source_type,
            amount_allocated=total.incl_tax, currency=total.currency)
        self.add_payment_source(source)
        self.add_payment_event('Authorised', total.incl_tax)




class ThankYouView(CoreThankYouView):

    def get_context_data(self, **kwargs):
        ctx = super(ThankYouView,
                    self).get_context_data(**kwargs)

        # Oscar's checkout templates look for this variable which specifies to
        # break out the tax totals into a separate subtotal.
        ctx['show_tax_separately'] = True

        return ctx
