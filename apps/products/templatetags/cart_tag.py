from django import template
from apps.carts.models import Cart, WishList

register = template.Library()


@register.simple_tag(takes_context=True)
def get_user_cart(context):
    request = context['request']
    user = request.user
    cart = Cart.objects.get(client=user, is_ordered=False)
    return cart



@register.simple_tag(takes_context=True)
def get_user_wishlist(context):
    request = context['request']
    user = request.user
    wlist = WishList.objects.filter(user=user)
    wlist_products = [product.product.id for product in wlist]
    return wlist_products



