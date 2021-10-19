--Row Number,Type,First Name,Last Name,

SELECT ROW_NUMBER() 
OVER(ORDER BY Employee.first_name) AS num_row, Employee.first_name, Employee.last_name, Location.zip_code, 
Location.address, Location.city, StateProvince.state_name, Country.country_name
FROM Employee
INNER JOIN Location ON Employee.location_id = Location.id
INNER JOIN StateProvince ON Location.state_id = StateProvince.id
INNER JOIN Country ON StateProvince.country_id = Country.id
