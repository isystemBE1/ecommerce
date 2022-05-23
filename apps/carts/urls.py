from django.urls import path
from .views import add_wishlist, my_wishlist, add_cart, my_cart

app_name = 'carts'

urlpatterns = [
    path('add-wishlist/', add_wishlist, name='add_wishlist'),
    path('my-wishlist/', my_wishlist, name='my-wishlist'),
    path('add-cart/', add_cart, name='add-cart'),
    path('my-cart/', my_cart, name='my-cart'),
]
