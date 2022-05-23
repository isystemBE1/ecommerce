from django import template
from apps.carts.models import WishList

register = template.Library()


@register.simple_tag(takes_context=True)
def get_wishlist_count(context):
    request = context['request']
    count = WishList.objects.filter(user=request.user).count()
    return count