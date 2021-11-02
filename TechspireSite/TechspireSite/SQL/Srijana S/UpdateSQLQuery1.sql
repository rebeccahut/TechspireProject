Declare @product_desc varchar (255) = 'Sweet eggless milk bread'
Declare @id int = 104
UPDATE Product 
SET product_desc = @product_desc 
where id = @id;




Declare @product_price int = 40
Declare @id int = 124
UPDATE Product 
SET product_price = @product_price
where id = @id

