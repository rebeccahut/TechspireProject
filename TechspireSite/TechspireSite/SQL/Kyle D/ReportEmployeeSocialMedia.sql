-- Kyle Dela Pena
-- Employee Social Media
-- Selects all employees who have social media and displays their handle along with their address and contact information.
-- The client can use this report to contact active or inactive employees with social media and pay or ask them to promote the store using their social media accounts. Each employee has their address listed so that the client can see the scope of each employee’s influence. People usually have a lot of followers from the same city or area, so understanding the range of each employee’s social media influence can help the client choose the right employee to promote the business. 
-- Row Num, First Name, Last Name, Social Media Name, Email Address, Phone Number, Zip Code, City, State/Province
--,,,,,,,,,

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.last_name) AS 'Row Num', 
Employee.first_name AS 'First Name', 
Employee.last_name AS 'Last Name', 
SocialMediaType.social_media_name AS 'Social Media Name',
EmployeeSocialMedia.social_media_code AS 'Social Media',
Employee.email_address AS 'Email Address',
CONCAT(SUBSTRING(Employee.phone_number,1,2),'-', SUBSTRING(Employee.phone_number,3,3),
'-', SUBSTRING(Employee.phone_number,6, 3), '-', SUBSTRING(Employee.phone_number,9, 12)) 
AS 'Phone Number',
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
