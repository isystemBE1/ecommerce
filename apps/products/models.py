from django.contrib.auth.models import User
from django.db import models


class Timestamp(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class Category(Timestamp):
    title = models.CharField(max_length=221)

    def __str__(self):
        return self.title


class Product(Timestamp):
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=221)
    price = models.FloatField()
    description = models.TextField()

    def __str__(self):
        return self.name


class ProductImage(Timestamp):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    image = models.ImageField(upload_to='products')

    def __str__(self):
        return f'image of {self.product}'


class Rate(Timestamp):
    RATE = (
        (0, 0),
        (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (5, 5),
    )
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    rate = models.IntegerField(choices=RATE, default=0)

    def __str__(self):
        return f'rate of {self.user.username}'





