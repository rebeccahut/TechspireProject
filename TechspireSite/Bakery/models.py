# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django import forms
from django.db.models import CheckConstraint
from django.db.models import Q
from phonenumber_field.modelfields import PhoneNumberField
from datetime import datetime
from decimal import Decimal
from .Owners import Owners


class MoneyField(models.DecimalField):
    def __init__(self):
        super().__init__(max_digits=19, decimal_places=4, default=0)

    def __str__(self):
        return "$" + super.__str__(self)

    widget = forms.Textarea


class DescriptiveModel(models.Model):
    id = models.AutoField(primary_key=True)
    description = "Blank Description"
    pk_desc = "Standard Auto-Increment PK"
    owner = Owners.TableOwner
    load_order = -1

    class Meta:
        abstract = True
        managed = False


# Used as an abstract parent for status codes
class StatusCode(DescriptiveModel):
    description = "Used to soft delete rows with a reason name and desc"
    status_name = models.CharField(max_length=40)
    status_desc = models.CharField(max_length=200, blank=True, null=True)
    is_active = models.BooleanField(help_text="Soft Delete Bool", default=True)
    load_order = 1

    def __str__(self):
        return self.status_name

    class Meta:
        abstract = True
        managed = False


# Used as an abstract parent for labels
class LabelCode(DescriptiveModel):
    description = "Allows for multiple named categories"
    type_name = models.CharField(max_length=40)
    type_desc = models.CharField(max_length=200, blank=True, null=True)
    load_order = 1

    def __str__(self):
        return self.type_name

    class Meta:
        abstract = True
        managed = False


class CustomerLabel(DescriptiveModel):
    description = 'Categorizes customers based on the opinion of the store owner.'
    owner = Owners.Rebecca
    category_name = models.CharField(max_length=40)
    category_desc = models.CharField(max_length=200, blank=True, null=True)
    load_order = 1

    class Meta:
        db_table = "CustomerCategory"
        verbose_name_plural = "Customer Category"
        managed = False

    def __str__(self):
        return self.category_name


class EmployeeLabel(DescriptiveModel):
    description = 'Categorizes employee based on the opinion of the store owner.'
    owner = Owners.Kyle
    category_name = models.CharField(max_length=40)
    category_desc = models.CharField(max_length=200, blank=True, null=True)
    load_order = 1

    class Meta:
        db_table = "EmployeeCategory"
        verbose_name_plural = "Employee Category"
        managed = False

    def __str__(self):
        return self.category_name


class EmployeeStatus(StatusCode):
    description = 'Defines whether an employee is currently active or inactive'
    owner = Owners.Alanna

    class Meta:
        db_table = "EmployeeStatus"
        verbose_name_plural = "Employee Status"
        managed = False


class CustomerStatus(StatusCode):
    description = 'Describes the current relationship between the customer and the business (are they an Active customer? are they an inactive customer?)'
    owner = Owners.Umair

    class Meta:
        db_table = "CustomerStatus"
        verbose_name_plural = "Customer Status"
        managed = False


class ProductStatus(StatusCode):
    description = 'Refers to whether a product is available or not. Not that it is unavailable but also if it is not offered anymore'
    owner = Owners.Srijana

    class Meta:
        db_table = "ProductStatus"
        verbose_name_plural = "Product Status"
        managed = False


class StoreStatus(StatusCode):
    description = 'Soft delete of store.'
    owner = Owners.Alanna

    class Meta:
        db_table = "StoreStatus"
        verbose_name_plural = "Store Status"
        managed = False


class RewardStatus(StatusCode):
    description = 'Defines whether a particular reward is active/inactive. Primary attributes: active, inactive'
    owner = Owners.Alanna

    class Meta:
        db_table = "RewardStatus"
        verbose_name_plural = "Reward Status"
        managed = False


class BanType(DescriptiveModel):
    description = "Describes why a specific product that is banned"
    owner = Owners.Alanna
    load_order = 1
    ban_name = models.CharField(max_length=40)
    ban_desc = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        db_table = "BanType"
        verbose_name_plural = "Ban Type"
        managed = False


class PointReason(DescriptiveModel):
    description = "Describes why points were added or removed"
    owner = Owners.Jade
    reason_name = models.CharField(max_length=40)
    reason_desc = models.CharField(max_length=200, blank=True, null=True)
    load_order = 1

    class Meta:
        db_table = "PointReasonType"
        verbose_name_plural = "PointReasonType"
        managed = False

    def __str__(self):
        return self.reason_name


class Country(DescriptiveModel):
    description = 'The nation that a particular entity (a store, a customer) is located in.'
    country_name = models.CharField(max_length=60)
    owner = Owners.Rebecca
    load_order = 1

    def __str__(self):
        return self.country_name

    class Meta:
        db_table = "Country"
        verbose_name_plural = "Country"
        managed = False


class StateProvince(DescriptiveModel):
    description = 'The state/province that a particular entity (a store, a customer) is located in.'
    state_name = models.CharField(max_length=60)
    country = models.ForeignKey(Country, on_delete=models.RESTRICT, default=233)
    owner = Owners.Rebecca
    load_order = 2

    def __str__(self):
        return self.state_name

    class Meta:
        db_table = "StateProvince"
        verbose_name_plural = "State/Province"
        managed = False


class Location(DescriptiveModel):
    description = "Represents a complete address for a location"
    zip_code = models.CharField(max_length=10, default="77339")
    city = models.CharField(max_length=35, default="Houston")
    address = models.CharField(max_length=100, default="3242 StreetName")
    state = models.ForeignKey(StateProvince, on_delete=models.RESTRICT, default=1407)
    country = models.ForeignKey(Country, on_delete=models.RESTRICT, default=233)
    owner = Owners.BrettM
    load_order = 3

    class Meta:
        db_table = "Location"
        verbose_name_plural = "Address"
        verbose_name = "Address"
        managed = False


class Tier(DescriptiveModel):
    description = 'Categories that loyalty customers are a part of based on number of points accummulated over time. Tiers such as bronze, silver, and gold tier for example.'
    owner = Owners.Umair
    tier_name = models.CharField(max_length=40)
    tier_desc = models.CharField(max_length=200, blank=True, null=True)
    min_points = models.IntegerField(default=0)
    load_order = 1

    class Meta:
        db_table = "Tier"
        verbose_name_plural = "Tier"
        managed = False

    def __str__(self):
        return self.tier_name


# Used as an abstract parent for people
class Person(DescriptiveModel):
    first_name = models.CharField(max_length=40)
    last_name = models.CharField(max_length=40)
    email_address = models.EmailField(max_length=254)
    phone_number = PhoneNumberField(max_length=15)
    birthdate = models.DateField()
    begin_date = models.DateField(auto_now_add=True)
    location = models.ForeignKey(Location, on_delete=models.RESTRICT, verbose_name="Address")
    comments = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True
        managed = False

    def __str__(self):
        return self.first_name + " " + self.last_name


class EmployeeType(LabelCode):
    description = 'The working type of an employee such as part-time or full-time. '
    owner = Owners.Kyle

    class Meta:
        db_table = "EmployeeType"
        verbose_name_plural = "Employee Type"
        managed = False


class Employee(Person):
    description = 'Person that works at the store and deals with either the store products or maintenance of said store.'
    end_date = models.DateField(blank=True, null=True)
    employee_status = models.ForeignKey(EmployeeStatus, on_delete=models.RESTRICT)
    employee_type = models.ForeignKey(EmployeeType, on_delete=models.RESTRICT)
    owner = Owners.BrettM
    load_order = 4

    class Meta:
        db_table = "Employee"
        verbose_name_plural = "Employee"
        managed = False


class Customer(Person):
    description = 'Someone who potentially purchases an item/service from our client and whose general information has been collected by our loyalty system database.'
    create_employee = models.ForeignKey(Employee, on_delete=models.RESTRICT, blank=True, null=True)
    customer_status = models.ForeignKey(CustomerStatus, on_delete=models.RESTRICT)
    tier = models.ForeignKey(Tier, on_delete=models.SET_NULL, blank=True, null=True)
    location = models.ForeignKey(Location, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Julia
    load_order = 5

    class Meta:
        db_table = "Customer"
        verbose_name_plural = "Loyalty Customer"
        managed = False


class Job(DescriptiveModel):
    description = 'The type of role that an employee of a store holds such as cashier, manager, etc.'
    job_name = models.CharField(max_length=40)
    job_desc = models.CharField(max_length=200, blank=True, null=True)
    owner = Owners.BrettM
    load_order = 1

    class Meta:
        db_table = "Job"
        verbose_name_plural = "Job"
        managed = False

    def __str__(self):
        return self.job_name


class AssocEmployeeLabel(DescriptiveModel):
    description = 'Allows an employee to have multiple categories'
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    employee_category = models.ForeignKey(EmployeeLabel, on_delete=models.RESTRICT)
    owner = Owners.Kyle
    load_order = 5

    class Meta:
        db_table = "EmployeeEmployeeCategory"
        verbose_name_plural = "Employee Category"
        managed = False


class AssocCustomerLabel(DescriptiveModel):
    description = 'Allows a customer to have multiple categories'
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    customer_category = models.ForeignKey(CustomerLabel, on_delete=models.RESTRICT)
    owner = Owners.Rebecca
    load_order = 6

    class Meta:
        db_table = "CustomerCustomerCategory"
        verbose_name_plural = "Customer Category"
        managed = False


class PaymentType(LabelCode):
    description = 'The way a customer pays for a service or product such as cash, credit, Google Pay, etc.'
    owner = Owners.Umair

    class Meta:
        db_table = "PaymentType"
        verbose_name_plural = "Payment Type"
        managed = False


class Store(DescriptiveModel):
    description = 'A physical location where customers go to complete transactions.'
    store_name = models.CharField(max_length=40)
    phone_number = PhoneNumberField(max_length=15, blank=True, null=True)
    email_address = models.EmailField(max_length=254, blank=True, null=True)
    website_address = models.CharField(max_length=300, blank=True, null=True)
    location = models.ForeignKey(Location, on_delete=models.RESTRICT)
    store_status = models.ForeignKey(StoreStatus, on_delete=models.RESTRICT)
    start_date = models.DateField()
    end_date = models.DateField(blank=True, null=True)
    employees = models.ManyToManyField(Employee, through="EmployeeJob")
    owner = Owners.Srijana
    load_order = 4

    class Meta:
        db_table = "Store"
        verbose_name_plural = "Store"
        managed = False

    def __str__(self):
        return self.store_name


class EmployeeJob(DescriptiveModel):
    description = 'Allows an employee to have multiple jobs at the same or different stores.'
    assign_date = models.DateField(auto_now_add=True)
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    job = models.ForeignKey(Job, on_delete=models.RESTRICT)
    owner = Owners.BrettM
    load_order = 5

    class Meta:
        db_table = "EmployeeJob"
        verbose_name_plural = "Employee Job"
        managed = False


class Order(DescriptiveModel):
    description = 'The customer’s finalized transaction of products purchased. This order generates customer loyalty points based on the monetary total of the transaction.'
    order_date = models.DateField(auto_now_add=True)
    original_total = MoneyField()
    final_total = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    discount_amount = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    eligible_for_points = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    points_consumed = models.IntegerField(default=0)
    points_produced = models.IntegerField(default=0)
    points_total = models.IntegerField(default=0)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    payment_type = models.ForeignKey(PaymentType, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    owner = Owners.Torrey
    load_order = 6

    class Meta:
        db_table = "Order"
        verbose_name_plural = "Order/Transaction"
        managed = False

    def __str__(self):
        return str(self.store) + "-" + str(self.customer) + "-" + str(self.order_date)




class ProductType(DescriptiveModel):
    description = ' Identifying certain product types that are eligible to be purchased with points, versus products that are not eligible to earn points on; used to distinguish exclusions. '
    product_type_name = models.CharField(max_length=40)
    product_type_desc = models.CharField(max_length=200, blank=True, null=True)
    owner = Owners.Srijana
    load_order = 1

    class Meta:
        db_table = "ProductType"
        verbose_name_plural = "Product Type"
        managed = False

    def __str__(self):
        return self.product_type_name


class Product(DescriptiveModel):
    description = 'An item purchased by the customer in a transaction.'
    product_name = models.CharField(max_length=80)
    product_desc = models.CharField(max_length=200, blank=True, null=True)
    product_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    product_type = models.ForeignKey(ProductType, on_delete=models.RESTRICT)
    product_status = models.ForeignKey(ProductStatus, on_delete=models.RESTRICT)
    ban_reason = models.ForeignKey(BanType, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Srijana
    load_order = 2

    class Meta:
        db_table = "Product"
        verbose_name_plural = "Product"
        managed = False

    def __str__(self):
        return self.product_name


class OrderLine(DescriptiveModel):
    description = 'Represents information located on a singular line found on a receipt/invoice produced after a completed transaction that describes the customer’s transaction and product details (quantity, product type, total price for that order line).'
    quantity = models.IntegerField(default=0)
    ind_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    total_price = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    product = models.ForeignKey(Product, on_delete=models.RESTRICT)
    order = models.ForeignKey(Order, on_delete=models.RESTRICT)
    owner = Owners.Julia
    load_order = 7

    class Meta:
        db_table = "OrderLine"
        verbose_name_plural = "Order Line"
        managed = False


    def save(self, *args, **kwargs):
        self.ind_price = Product.objects.get(pk=self.product.id).product_price
        self.total_price = self.ind_price * self.quantity
        super(OrderLine, self).save(*args, **kwargs)


class Reward(DescriptiveModel):
    description = 'All benefits that are offered by the business ' \
                  'for being an active loyalty customer that can be ' \
                  'claimed by converting some of their earned points. ' \
                  '“Rewards” can be coupons ($5 off) or birthday reward ' \
                  '(does not need point conversion, it’s just a redemption code for a freebie)'
    reward_name = models.CharField(max_length=80)
    reward_desc = models.CharField(max_length=200, blank=True, null=True)
    reward_status = models.ForeignKey(RewardStatus, on_delete=models.RESTRICT)
    point_cost = models.IntegerField(default=0)
    reset_period = models.IntegerField(default=0, blank=True, null=True)
    discount_amount = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    free_product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True)
    tier = models.ForeignKey(Tier, on_delete=models.SET_NULL, blank=True, null=True)
    date_added = models.DateField(auto_now_add=True)
    date_disabled = models.DateField(blank=True, null=True)
    owner = Owners.Umair
    load_order = 3

    class Meta:
        db_table = "Reward"
        verbose_name_plural = "Reward"
        managed = False

    def __str__(self):
        return self.reward_name


class SocialMediaType(DescriptiveModel):
    description = 'The different types of social media that exist for use such as Instagram, Snapchat, etc.'
    social_media_name = models.CharField(max_length=40)
    social_media_desc = models.CharField(max_length=200, blank=True, null=True)
    owner = Owners.Torrey
    load_order = 1

    class Meta:
        db_table = "SocialMediaType"
        verbose_name_plural = "Social Media Type"
        managed = False

    def __str__(self):
        return self.social_media_name


class StoreSocialMedia(DescriptiveModel):
    description = 'Social media of the store.'
    social_media_code = models.CharField(max_length=60)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    date_added = models.DateField(auto_now_add=True)
    owner = Owners.Saja
    load_order = 5


    class Meta:
        db_table = "StoreSocialMedia"
        verbose_name_plural = "Store Social Media"
        managed = False


class EmployeeSocialMedia(DescriptiveModel):
    description = 'Employee social media.'
    social_media_code = models.CharField(max_length=60)
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    date_added = models.DateField(auto_now_add=True)
    owner = Owners.Saja
    load_order = 5

    class Meta:
        db_table = "EmployeeSocialMedia"
        verbose_name_plural = "Employee Social Media"
        managed = False


class CustomerSocialMedia(DescriptiveModel):
    description = 'Customer social media.'
    social_media_code = models.CharField(max_length=60)
    social_media_type = models.ForeignKey(SocialMediaType, on_delete=models.RESTRICT)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    date_added = models.DateField(auto_now_add=True)
    owner = Owners.Jade
    load_order = 6

    class Meta:
        db_table = "CustomerSocialMedia"
        verbose_name_plural = "Customer Social Media"
        managed = False


class StoreProduct(DescriptiveModel):
    description = 'Products that are either associated with or are offered at a specific store location.'
    product = models.ForeignKey(Product, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    product_assigned = models.DateField(auto_now_add=True)
    owner = Owners.Torrey
    load_order = 5

    class Meta:
        db_table = "StoreProduct"
        verbose_name_plural = "StoreProduct/Menu"
        managed = False


class StoreReward(DescriptiveModel):
    description = 'Rewards available to loyalty customers based on which specific store points are redeemed at.'
    reward = models.ForeignKey(Reward, on_delete=models.RESTRICT)
    store = models.ForeignKey(Store, on_delete=models.RESTRICT)
    reward_assigned = models.DateField(auto_now_add=True)
    owner = Owners.Saja
    load_order = 5

    class Meta:
        db_table = "StoreReward"
        verbose_name_plural = "Store Reward"
        managed = False


class CustomerReward(DescriptiveModel):
    description = 'Rewards available to a SINGLE loyalty customer to be redeemed, based on the amount of points they have accumulated to date. Available rewards that they (a single loyalty customer) has earned, based on their personal points. A points bank.'
    order = models.ForeignKey(Order, on_delete=models.RESTRICT, unique=True)
    reward = models.ForeignKey(Reward, on_delete=models.RESTRICT)
    point_cost = models.IntegerField(default=0)
    discount_amount = models.DecimalField(max_digits=19, decimal_places=4, default=0)
    free_product = models.ForeignKey(Product, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Julia
    load_order = 7

    class Meta:
        db_table = "CustomerReward"
        verbose_name_plural = "Customer Reward"
        managed = False

    def save(self, *args, **kwargs):
        target_reward = Reward.objects.get(pk=self.reward.id)
        self.free_product = target_reward.free_product
        self.discount_amount = target_reward.discount_amount
        self.point_cost = target_reward.point_cost
        super(CustomerReward, self).save(*args, **kwargs)


class PointLog(DescriptiveModel):
    description = ' Keeping track of a customers existing loyalty points and used points?'
    points_amount = models.IntegerField(default=0)
    created_date = models.DateField(auto_now_add=True)
    employee = models.ForeignKey(Employee, on_delete=models.RESTRICT)
    customer = models.ForeignKey(Customer, on_delete=models.RESTRICT)
    reason = models.ForeignKey(PointReason, on_delete=models.RESTRICT)
    order = models.ForeignKey(Order, on_delete=models.SET_NULL, blank=True, null=True)
    owner = Owners.Jade
    load_order = 7
    bulk_insert = False

    class Meta:
        db_table = "PointLog"
        verbose_name_plural = "Point Log"
        managed = False

