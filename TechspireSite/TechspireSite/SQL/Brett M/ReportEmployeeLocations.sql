--Brett Meirhofer
--Active Employee Addresses
--The client can use this report as a historical record for employee information. This report could be generated regularly and stored physically for proper employee documentation.
--Displays all employees, historical and current, along with their complete addresses.
--Row Num,First Name,Last Name,Zip Code,Address,City,State,Phone Number, Email Address
--,,,,,,,phone,

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.employee_status_id, Employee.first_name) AS num_row, Employee.first_name, Employee.last_name, Location.zip_code, 
Location.address, Location.city, StateProvince.state_name, Employee.phone_number
AS PhoneNumber,
Employee.email_address
FROM Employee
INNER JOIN Location ON Employee.location_id = Location.id
INNER JOIN StateProvince ON Location.state_id = StateProvince.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
WHERE EmployeeStatus.is_active = 1