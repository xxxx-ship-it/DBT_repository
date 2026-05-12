WITH BIKE AS (
SELECT 
distinct
start_STATIO_id as station_id,
start_STATION_name as station_name,
start_lat as station_lat,
start_lng as station_lng
FROM {{ ref('stg_bike') }}
where ride_id != 'ride_id'
)
select * from bike