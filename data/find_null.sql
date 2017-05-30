SELECT *
FROM flowers
    where height_code is null or trim(height_code) = ''
