from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from .models import WishList, Cart, CartItem
from ..products.models import Product, Category


def add_wishlist(request):
    pid = request.GET.get('_pid')
    user = request.user
    product = Product.objects.get(id=pid)
    wishlist_count = WishList.objects.filter(user=user, product=product).count()
    if wishlist_count < 1:
        WishList.objects.create(user=user, product=product)
        data = {
            'success': True,
            'product': product.name
        }
    else:
        WishList.objects.get(user=user, product=product).delete()
        data = {
            'success': False,
            'message': 'Already removed from your wishlist',
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


def add_cart(request):
    pid = request.GET.get('_pid')
    print(pid)
    user = request.user
    product = Product.objects.get(id=pid)
    my_cart, new_cart = Cart.objects.get_or_create(client=user, is_ordered=False)
    data = None
    if my_cart:
        CartItem.objects.create(product=product, cart=my_cart)
        data = {
            'success': True,
            'product': product.name,
        }
    if new_cart:
        CartItem.objects.create(product=product, cart=new_cart)
        data = {
            'success': True,
            'product': product.name,
        }
    return JsonResponse(data, status=201)
