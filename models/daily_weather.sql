{{ config(materialized = "table") }}

WITH daily_weather as (

SELECT 
date(time) AS daily_weather,
weather,
temp,
pressure,
humidity,
clouds
FROM {{ source('demo', 'weather') }}
),
daily_weather_agg AS (
select
daily_weather,
weather,
round(avg(temp),2) AS temp,
round(avg(pressure),2) AS pressure,
round(avg(humidity),2) AS humidity,
round(avg(clouds),2) AS clouds
from daily_weather
group by daily_weather,weather
qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)
select *
from daily_weather_agg
order by daily_weather