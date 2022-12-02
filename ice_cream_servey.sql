-- Creating and filling the icr cream table
CREATE TABLE ice_cream_survey (
    response_id integer PRIMARY KEY,
    office text,
    flavor text
);


COPY ice_cream_survey
FROM 'C:\Users\ricor\Desktop\bellabeat data\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

--Viewing the Data
SELECT *
FROM public.ice_cream_survey
ORDER BY response_id
LIMIT 5;

-- this generates a crosstab to check if chocolate is truley in the lead
SELECT *
FROM crosstab('SELECT office,
                      flavor,
                      count(*)
               FROM ice_cream_survey
               GROUP BY office, flavor
               ORDER BY office',

              'SELECT flavor
               FROM ice_cream_survey
               GROUP BY flavor
               ORDER BY flavor')

AS (office text,
    chocolate bigint,
    strawberry bigint,
    vanilla bigint);
