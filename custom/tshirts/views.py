from django.shortcuts import render,render_to_response
from django.template import RequestContext
from shopping.forms import CostumProduct
from PIL import Image, ImageDraw , ImageFont
from shopping.models import Product
from urllib2 import urlopen
import io,os
from django.http import HttpResponseRedirect, HttpResponse ,Http404
from django.conf import settings
from django.core.files import File
from random import randint

var = {}
def costumize(request,pk):
    language = "es"
    if 'lang' in request.session:
        language = request.session['lang']
    pk = str(pk)
    return render_to_response("costumizeterms.html",{"pk":pk,"language":language},RequestContext(request))

def costumize_image(request):
    if request.method == "POST":
        product = CostumProduct(request.POST,request.FILES)
        if product.is_valid():
            prod=product.save()
            var["product"]= Product.objects.get(id=prod.id)
            var["prodid"]= prod.id
            return render_to_response("costumizeimage.html",var,RequestContext(request))
        else:
            return HttpResponse("INVALID FORM")
    else:
        form = CostumProduct()
    var["form"] = form
    return render_to_response("costumizeimage.html",var,RequestContext(request))

def costumize_text(request):
    return render_to_response("costumizetext.html",var,RequestContext(request))

def submit_text(request,color,context,font):
    return HttpResponseRedirect("/products/"+pk)

def gen_design(request,pk=1):
    mockup= os.path.join(settings.STATIC_PATH,"images/costum/mockup.jpg")
    mockup= Image.open(mockup)
    costum_image = Product.objects.get(id=pk)
    url = costum_image.fullsize.url[26:-5]
    costum_url= "https://dl.dropboxusercontent.com/s/"+url
    path = io.BytesIO(urlopen(costum_url).read())
    costum_image = Image.open(path)
    costum_image = costum_image.convert("RGBA")
    size = costum_image.size
    landscape = False
    if size[0]<size[1]:
        landscape = True
    if landscape:
        costum_image = costum_image.resize( [120,180] )
    else:
        costum_image = costum_image.resize( [180,120] )
    pixdata = costum_image.load()
    for y in xrange(costum_image.size[1]):
        for x in xrange(costum_image.size[0]):
            if pixdata[x, y] == (255, 255, 255, 255):
                pixdata[x, y] = (255, 255, 255, 0)
    random_number = str(randint(1,99))
    costum_image.save(os.path.join(settings.STATIC_PATH,"tmp/image"+random_number+".png"),"PNG")
    #half = 0.5
    #out = second.resize( [int(half * s) for s in second.size] )
    if landscape:
        mockup.paste(costum_image, (240, 120), costum_image)
    else:
        mockup.paste(costum_image, (200, 120), costum_image)
    response = HttpResponse(content_type="image/png")
    obj = Product.objects.get(id=pk)
    costum_image.save(os.path.join(settings.STATIC_PATH,"tmp/image"+random_number+".png"),"PNG")
    mockup.save(os.path.join(settings.STATIC_PATH,"tmp/thumb"+random_number+".png"),"PNG")
    mockup.save(response,"JPEG")
    f1 = open(os.path.join(settings.STATIC_PATH,"tmp/image"+random_number+".png"), 'r')
    f2 = open(os.path.join(settings.STATIC_PATH,"tmp/thumb"+random_number+".png"), 'r')
    obj.image = File(f1)
    obj.thumb = File(f2)
    obj.save()
    return HttpResponse(response,'image/jpg')

def gen_text(request, color, context, font , submit):
    template=os.path.join(settings.STATIC_PATH,"images/costum/mockup.jpg")
    fp = open(template, "rgb")
    im = Image.open(fp)
    font = ImageFont.truetype((os.path.join(settings.STATIC_PATH,"images/costum/fonts/"+font+".ttf")), 50)
    draw = ImageDraw.Draw(im)
    black = (0,0,1)
    conlen = len(context)
    fpos = 290-(10*conlen)
    text_pos = (fpos,180)
    text = context
    draw.text(text_pos, text, font=font, fill=color)
    del draw
    if submit == "False":
        response = HttpResponse(content_type="image/png")
        im.save(response,"JPEG")
        return HttpResponse(response,'image/jpg')
    else:
    	random_number = str(randint(1,99))
    	im.save(os.path.join(settings.STATIC_PATH,"tmp/thumb"+random_number+".png"),"PNG")
    	im.crop((150, 100, 420, 300)).save(os.path.join(settings.STATIC_PATH,"tmp/image"+random_number+".png"),"PNG")
    	p = Product.objects.create(title="CostumText")
    	obj = Product.objects.get(id=p.id)
    	f1 = open(os.path.join(settings.STATIC_PATH,"tmp/image"+random_number+".png"), 'r')
    	f2 = open(os.path.join(settings.STATIC_PATH,"tmp/thumb"+random_number+".png"), 'r')
    	obj.image = File(f1)
    	obj.thumb = File(f2)
    	obj.save()
    	return HttpResponseRedirect("/products/"+str(p.id))
