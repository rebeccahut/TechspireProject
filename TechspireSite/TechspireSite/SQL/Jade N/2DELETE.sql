DELETE FROM PointReasonType 
WHERE id > 5 -- deletes extraneous point types from insert

DELETE FROM CustomerSocialMedia
WHERE date_added < '2017-01-01' -- deletes any customer social media data before 2017 because this is, realistically, when she started her loyalty system