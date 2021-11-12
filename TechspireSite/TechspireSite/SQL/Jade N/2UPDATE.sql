--puts the '@' symbol in front of customer social media handles that are specifically from Twitter and Instagram; Facebook does not use the '@' symbol when referencing to a user's handle
UPDATE CustomerSocialMedia
SET social_media_code = CONCAT('@',social_media_code)
WHERE social_media_type_id = 1 --facebook 

--makes sure that all the text in an Instagram handle is lowercase, as it is the required format for Instagram handles; customers will have capitalizations corrected for Instagram handles
UPDATE CustomerSocialMedia
SET social_media_code = lower(social_media_code) 
WHERE social_media_type_id = 3 --lowercase for all userhandles