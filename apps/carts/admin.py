from django.contrib import admin
from .models import WishList, Cart, CartItem, Order


class CartListInline(admin.TabularInline):
    model = CartItem
    extra = 1


class CartAdmin(admin.ModelAdmin):
    inlines = [CartListInline]
    list_display = ['client', 'get_cart_items', 'get_cart_total']


admin.site.register(WishList)
admin.site.register(Cart, CartAdmin)
admin.site.register(Order)
