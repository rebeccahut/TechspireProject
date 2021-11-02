UPDATE CustomerSocialMedia
SET social_media_code = CONCAT('@',social_media_code)
WHERE social_media_type_id = 1 --facebook 

UPDATE CustomerSocialMedia
SET social_media_code = lower(social_media_code)