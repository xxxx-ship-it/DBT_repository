WITH BIKE AS(
select
	RIDE_ID,
	REPLACE(STARTED_AT,'"') AS STARTED_AT,
	REPLACE(ENDED_AT,'"') AS ENDED_AT,
	START_STATION_NAME,
	START_STATIO_ID,
	END_STATION_NAME,
	END_STATION_ID,
	START_LAT,
	START_LNG,
	END_LAT,
	END_LNG,
	member_csual
    from {{ source('demo', 'bike') }}
    where ride_id != 'bikeid' and ride_id != '"bikeid"'
)
select *
from bike
