from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from .models import WishList
from ..products.models import Product, Category


def add_wishlist(request):
    pid = request.GET.get('_pid')
    user = request.user
    product = Product.objects.get(id=pid)
    wishlist_count = WishList.objects.filter(user=user, product=product).count()
    if wishlist_count < 1:
        wishlist = WishList.objects.create(user=user, product=product)
        data = {
            'success': True,
            'product': product.name
        }
    else:
        data = {
            'success': False,
            'error_message': 'Already added in your wishlist',
            'product': product.name
        }
    return JsonResponse(data)


@login_required(login_url='/accounts/login/')
def my_wishlist(request):

    my_wlist = WishList.objects.filter(user=request.user)
    categories = Category.objects.all()
    ctx = {
        'products': my_wlist,
        'categories': categories,
    }
    return render(request, 'my-wishlist.html', ctx)
