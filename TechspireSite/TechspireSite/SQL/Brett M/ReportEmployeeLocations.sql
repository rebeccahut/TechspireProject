--Row Number,First Name,Last Name,State Name,City,Country Name,Status

SELECT ROW_NUMBER() OVER(ORDER BY Employee.first_name) AS num_row, Employee.first_name, Employee.last_name ,Location.city,StateProvince.state_name, Country.country_name, EmployeeStatus.status_name
FROM "Employee"
INNER JOIN "Location" ON Employee.location_id = Location.id
INNER JOIN StateProvince ON StateProvince.id = Location.state_id
INNER JOIN Country ON StateProvince.country_id = Country.id
INNER JOIN EmployeeStatus ON Employee.employee_status_id = EmployeeStatus.id
WHERE EmployeeStatus.is_active = 1