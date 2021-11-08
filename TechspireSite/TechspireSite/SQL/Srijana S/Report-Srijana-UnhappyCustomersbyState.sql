--Srijana Shrestha
--Unhappy Customers in Texas 
--The client can use this report to view customers that have been identified as "unhappy" within a certain state. In this case, because her stores are all located in Texas, this report views the customers only in Texas. This report is beneficial for the client because the client may want to reach out to her unhappy customers to resume business relations. 
--Displays only the customers that have been categorized as "unhappy" within the state of Texas. It is ordered by the state name. 
--State Name, Customer Full Name, Phone Number, Email Address

Declare
@customer_category INT
Select @customer_category = 3

Select "StateProvince".state_name,
"Customer".first_name + ' ' + "Customer".last_name AS "Customer_full_name",
"Customer".phone_number,
"Customer".email_address from "StateProvince"
inner join location on "StateProvince".id = "location".state_id
inner join Customer on "location".id = "Customer".location_id
inner join CustomerCustomerCategory on "Customer"."id" = "CustomerCustomerCategory".customer_id
inner join CustomerCategory on "CustomerCategory".id = "CustomerCustomerCategory".customer_category_id
where "CustomerCategory".id = @customer_category
order by "StateProvince".state_name;