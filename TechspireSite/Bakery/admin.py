from django.contrib import admin
from django.contrib.auth.models import User, Group
from django_reverse_admin import ReverseModelAdmin

from . import forms
from . import models


class TwentyPageAdmin(admin.ModelAdmin):
    list_per_page = 20
    save_on_top = True
    change_form_template = "admin/hide_inline.html"


class ReverseTwentyAdmin(ReverseModelAdmin):
    list_per_page = 20
    save_on_top = True
    change_form_template = "admin/hide_inline.html"


@admin.register(models.StoreProduct)
class MenuAdmin(TwentyPageAdmin):
    list_display = ["product", "store"]


@admin.register(models.Reward)
class RewardAdmin(TwentyPageAdmin):
    model = models.Reward
    list_display = ["reward_name", "point_cost", "display_discount", "reward_status", "date_added"]

    @admin.display(description='Discount', ordering="discount_amount")
    def display_discount(self, obj):
        return "$" + str(round(obj.discount_amount, 2))


@admin.register(models.Employee)
class EmployeeAdmin(ReverseTwentyAdmin):
    inline_type = "stacked"
    inline_reverse = ["location", ]
    widgets = {
        'phone_number': forms.PhoneForm
    }
    list_filter = ["employee_status"]
    list_display = ["first_name", "last_name", "email_address", "phone_number", "employee_status"]
    inlines = [forms.EmployeeCategoryForm, forms.EmployeeJobForm, forms.EmployeeSocialForm]

        




@admin.register(models.Customer)
class CustomerAdmin(ReverseTwentyAdmin):
    widgets = {
        'phone_number': forms.PhoneForm
    }
    list_filter = ["customer_status"]
    search_fields = ["email_address", "phone_number"]
    list_display = ["first_name", "last_name", "email_address", "phone_number"]
    inlines = [forms.CustomerCategoryForm, forms.CustomerSocialForm]
    inline_type = "stacked"
    inline_reverse = ["location", ]


@admin.register(models.Order)
class OrderAdmin(TwentyPageAdmin):
    list_display = ["customer", "store", "employee", "order_date", "display_original_total"]
    readonly_fields = ["original_total", "discount_amount", "final_total",
                       "points_consumed", "points_produced", "points_total", "eligible_for_points"]
    inlines = [forms.OrderLineForm, forms.RewardLineForm]
    change_form_template = 'admin/order_change_form.html'
    raw_id_fields = ("customer",)

    @admin.display(description='Total', ordering="original_total")
    def display_original_total(self, obj):
        return "$" + str(round(obj.original_total, 2))

    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js',
            '//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js',
            'Bakery/js/OrderChange.js',
        )

    def get_readonly_fields(self, request, obj=None):
        if obj:  # editing an existing object
            return self.readonly_fields + ["order_date", "customer", "store", "payment_type", "employee"]
        return self.readonly_fields

    def get_inlines(self, request, obj):
        if obj:
            return [forms.OrderLineFormRead, forms.RewardLineFormRead]
        return self.inlines

    def has_change_permission(self, request, obj=None):
        if obj:
            return False
        return True


@admin.register(models.Product)
class ProductAdmin(TwentyPageAdmin):
    list_filter = ["product_type", "product_status"]
    list_display = ["product_name", "product_type", "product_status", "display_product_price"]

    @admin.display(description='Price', ordering="product_price")
    def display_product_price(self, obj):
        return "$" + str(round(obj.product_price, 2))


@admin.register(models.StoreReward)
class StoreRewardAdmin(TwentyPageAdmin):
    list_filter = ["store"]
    list_display = ["reward", "store", "reward_assigned"]


@admin.register(models.Store)
class StoreAdmin(ReverseTwentyAdmin):
    inline_type = "stacked"
    inline_reverse = ["location", ]
    inlines = [forms.StoreSocialForm]


@admin.register(models.PointLog)
class PointLogAdmin(TwentyPageAdmin):
    list_display = ["customer", "reason", "points_amount", "created_date"]
    list_filter = ["reason"]


#Register all the models for bakery that don't have a custom admin model
def register_models():
    basic_admin_models = [models.ProductType, models.ProductStatus, models.CustomerStatus,
                          models.EmployeeStatus, models.RewardStatus, models.StoreStatus,
                          models.CustomerLabel, models.EmployeeLabel, models.EmployeeType,
                          models.Job, models.BanType, models.PointReason, models.SocialMediaType, models.PaymentType]
    for target_model in basic_admin_models:
        admin.site.register(target_model, )


register_models()
admin.site.unregister(User)
admin.site.unregister(Group)




