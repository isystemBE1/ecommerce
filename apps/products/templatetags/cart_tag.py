from django import template

from apps.carts.models import Cart

register = template.Library()


@register.simple_tag(takes_context=True)
def get_cart(context):
    request = context['request']
    user = request.user
    try:
        print('try')
        user_cart = Cart.objects.get(client=user, is_ordered=False)
    except Exception as e:
        print('except', e.args)
        user_cart = 0

    return user_cart
