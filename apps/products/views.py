from django.shortcuts import render
from .models import Product, Category, ProductImage, Rate
from apps.blog.models import Post, Tag
from ..carts.models import WishList


def index(request):
    products = Product.objects.order_by('-id')
    categories = Category.objects.all()
    latest_products = products[:6]
    top_rated_products = products.order_by('-mid_rate')[:6]
    top_viewed_products = products.order_by('-views')[:6]
    blog_latest = Post.objects.order_by('-id')[:3]

    ctx = {
        'products': products[:8],
        'categories': categories,

        'latest_products': latest_products,
        'top_rated_products': top_rated_products,
        'top_viewed_products': top_viewed_products,
        'blog_latest': blog_latest
    }

    return render(request, 'index.html', ctx)
