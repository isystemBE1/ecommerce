from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, get_object_or_404
from apps.carts.models import Cart, WishList, CartItem
from apps.products.models import Product, Category


def add_wishlist(request):
    pid = request.GET.get('product')
    user = request.user
    product = Product.objects.get(id=pid)
    wishlist_count = WishList.objects.filter(user=user, product=product).count()
    my_wishlist_count = WishList.objects.filter(user=user).count()
    if wishlist_count > 0:
        wishlist = WishList.objects.get(user=user, product=product).delete()
        data = {'success': False, 'my_wishlist_count': my_wishlist_count, 'product': product.name}
    else:
        wishlist = WishList.objects.create(user=user, product=product)
        data = {'success': True, 'my_wishlist_count': my_wishlist_count, 'product': product.name}
    return JsonResponse(data)


@login_required(login_url='/accounts/login/')
def my_wishlist(request):
    user = request.user
    wishlist = WishList.objects.filter(user=user).order_by('-id')
    my_wishlist_count = WishList.objects.filter(user=user).count()
    categories = Category.objects.all()
    pid = request.POST.get('product')
    if request.method == 'POST':
        product = Product.objects.get(id=pid)
        wishlist = WishList.objects.get(user=user, product=product).delete()
        # wishlist.delete()
        return JsonResponse({'success': True, 'message': 'Deleted', 'product': product.name})
    ctx = {
        'products': wishlist,
        'my_wishlist_count': my_wishlist_count,
        'categories': categories,
    }
    return render(request, 'my-wishlist.html', ctx)


def add_cart(request):
    pid = request.GET.get('product')
    user = request.user
    product = Product.objects.get(id=pid)
    my_cart, new_cart = Cart.objects.get_or_create(client=user, is_ordered=False)
    data = None
    if my_cart:
        cart_item = CartItem.objects.create(product=product, cart=my_cart)
        data = {'success': True, 'cart': 'exist', 'product': product.name}
    if new_cart:
        cart_item = CartItem.objects.create(product=product, cart=new_cart)
        data = {'success': True, 'cart': 'new', 'product': product.name}

    return JsonResponse(data)


def my_cart(request):
    user = request.user
    categories = Category.objects.all()
    cart, cart = Cart.objects.get_or_create(client=user, is_ordered=False)

    ctx = {
        'cart': cart,
        'categories': categories,
    }
    return render(request, 'shoping-cart.html', ctx)

