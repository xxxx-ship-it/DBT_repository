WITH trips as (
    select 
    ride_id,
    rideable_type,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
    start_statio_id AS start_station_id,
    end_station_id,
    member_csual as member_casual,
    TIMESTAMPDIFF(second,TO_TIMESTAMP(started_at),TO_TIMESTAMP(ended_at)) AS trip_duration_seconds,
    TO_TIMESTAMP(ended_at) - TO_TIMESTAMP(started_at) AS duration
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10
)
select *
from trips
