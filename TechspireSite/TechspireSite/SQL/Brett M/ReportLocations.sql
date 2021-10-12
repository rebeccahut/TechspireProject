--Row Number,State Name,Country Name

SELECT ROW_NUMBER() OVER(ORDER BY Country.country_name) AS num_row, StateProvince.state_name, Country.country_name
FROM "Location"
INNER JOIN StateProvince ON StateProvince.id = Location.state_id
INNER JOIN Country ON StateProvince.country_id = Country.id
