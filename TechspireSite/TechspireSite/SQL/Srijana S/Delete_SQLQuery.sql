Declare @product_type_name varchar(35) = 'Ice-cream'
Declare @id int = 20
DELETE from ProductType
where id = @id and product_type_name = @product_type_name



Declare @id int = 376
DELETE from product 
where id = @id;
