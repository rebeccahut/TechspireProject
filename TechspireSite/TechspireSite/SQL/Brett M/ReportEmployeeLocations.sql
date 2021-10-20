--Brett Meirhofer
--Historical Employee Addresses
--The client can use this report to make decisions such as where to open a new store or which store to expand.
--Displays all employees, historical and current, along with their complete addresses.
--Row Num,First Name,Last Name,Zip Code,Address,City,State,Country,Status

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.employee_status_id, Employee.first_name) AS num_row, Employee.first_name, Employee.last_name, Location.zip_code, 
Location.address, Location.city, StateProvince.state_name, Country.country_name, EmployeeStatus.status_name
FROM Employee
INNER JOIN Location ON Employee.location_id = Location.id
INNER JOIN StateProvince ON Location.state_id = StateProvince.id
INNER JOIN Country ON StateProvince.country_id = Country.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id