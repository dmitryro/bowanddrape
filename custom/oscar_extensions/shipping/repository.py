from oscar.apps.shipping import repository
from custom.oscar_extensions.shipping.methods import Standard
from custom.oscar_extensions.shipping.methods import Express
from django.utils.translation import ugettext_lazy as _

from oscar.apps.shipping.repository import Repository as CoreRepository
from oscar.apps.shipping.models import WeightBased

class Repository(CoreRepository):


    def get_shipping_methods(self, user,basket, shipping_addr=None, **kwargs):
        """
        Return a list of all applicable shipping method objects
        for a given basket.

        We default to returning the Method models that have been defined but
        this behaviour can easily be overridden by subclassing this class
        and overriding this method.
        """
        methods = [WeightBased()]
        return self.get_shipping_methods(basket, methods)


    def get_available_shipping_methods(
            self, basket, user=None, shipping_addr=None,
            request=None, **kwargs):
        methods = [WeightBased(),Standard(),Express()]
        if shipping_addr and shipping_addr.country.code == 'US':
            # Express is only available in the UK
            methods = [WeightBased(),Standard(),Express()]
        return methods
