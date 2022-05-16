from django.shortcuts import render
from .models import Product, Category, ProductImage, Rate


def index(request):
    products = Product.objects.all().order_by('-id')
    categories = Category.objects.all()
    latest_products = products[:6]
    top_rated_products = products.order_by('mid_rate')[:6]
    top_viewed_products = products.order_by('views')[:6]

    ctx = {
        'products': products,
        'categories': categories,

        'latest_products': latest_products,
        'top_rated_products': top_rated_products,
        'top_viewed_products': top_viewed_products,
    }

    return render(request, 'index.html', ctx)
