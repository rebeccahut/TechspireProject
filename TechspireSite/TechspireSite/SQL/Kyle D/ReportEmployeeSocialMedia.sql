-- Kyle Dela Pena
-- Employee Social Media
-- Selects all employees who have social media and displays their handle along with their address and contact information.
-- The client can use this report to contact active or inactive employees with social media and pay or ask them to promote the store using their social media accounts. Each employee has their address listed so that the client can see the scope of each employee’s influence. People usually have a lot of followers from the same city or area, so understanding the range of each employee’s social media influence can help the client choose the right employee to promote the business. 
-- Row Num,Employee Name,Social Media Name,Social Media,Email Address,Phone Number,Zip Code,City,State/Province
--,,,,,phone,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS 'Row Num', 
CONCAT(Employee.first_name, ' ', Employee.last_name) as 'Name',
SocialMediaType.social_media_name AS 'Social Media Name',
EmployeeSocialMedia.social_media_code AS 'Social Media',
Employee.email_address AS 'Email Address',
Employee.phone_number AS 'Phone Number',
Location.zip_code AS 'Zip Code', 
Location.city AS 'City', 
StateProvince.state_name AS 'State/Province'

FROM Employee
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
INNER JOIN EmployeeSocialMedia ON EmployeeSocialMedia.employee_id = Employee.id
INNER JOIN SocialMediaType ON SocialMediaType.id = EmployeeSocialMedia.social_media_type_id
INNER JOIN Location ON Employee.location_id = Location.id
INNER JOIN StateProvince ON Location.state_id = StateProvince.id

--WHERE EmployeeStatus.is_active = 1
