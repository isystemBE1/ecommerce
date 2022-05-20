from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from django.views.decorators.http import require_POST

from apps.carts.models import Cart, WishList
from apps.products.models import Product


def add_wishlist(request):
    pid = request.GET.get('product')
    user = request.user
    product = Product.objects.get(id=pid)
    wishlist_count = WishList.objects.filter(user=user, product=product).count()
    my_wishlist_count = WishList.objects.filter(user=user).count()
    if wishlist_count > 0:
        data = {'success': False, 'my_wishlist_count': my_wishlist_count}
    else:
        wishlist = WishList.objects.create(user=user, product=product)
        data = {'success': True, 'my_wishlist_count': my_wishlist_count}
    return JsonResponse(data)


def my_wishlist(request):
    user = request.user
    wishlist = WishList.objects.filter(user=user).order_by('-id')
    my_wishlist_count = WishList.objects.filter(user=user).count()
    print(my_wishlist_count)
    ctx = {
        'products': wishlist,
        'my_wishlist_count': my_wishlist_count,
    }
    return render(request, 'shop-grid.html', ctx)
