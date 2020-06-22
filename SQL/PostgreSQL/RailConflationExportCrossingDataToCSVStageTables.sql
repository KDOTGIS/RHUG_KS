drop table operatingrailroadcompany

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, 
Max(measure) as MaxMeasure, 
Max(measure)-Min(measure) as Length, 
operatingrailroadcompany,
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by operatingrailroadcompany, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, 
Min(measure) as FromMeas, 
Max(measure) as MaxMeasure, 
Max(measure)-Min(measure) as Length, 
parentrailroadcompany,
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where parentrailroadcompany is not null
group by parentrailroadcompany, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\parentrailroadcompany.csv' With CSV HEADER


copy ( 
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, 
Max(measure) as MaxMeasure, 
crossingowner,
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where crossingowner is not null
group by crossingowner, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\crossingowner.csv' With CSV HEADER

elect routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as length, otherrrcompanyseperatetrack
from sde.ciims_crossingdata
roup by otherrrcompanyseperatetrack, routeID

copy (
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaduse1, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroaduse1 is not null
group by railroaduse1, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\railroaduse1.csv' With CSV HEADER


--otherrrcompanyseperatetrack2, 3, 4 is all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, otherrrcompanyseperatetrack4
--from sde.ciims_crossingdata
--where otherrrcompanyseperatetrack4 is not null
--group by otherrrcompanyseperatetrack4, routeID) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

--otherrrcompanysametrack2 2, 3, 4 all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, otherrrcompanysametrack4
--from sde.ciims_crossingdata
--where otherrrcompanysametrack4 is not null
--group by otherrrcompanysametrack4, routeID) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, totaltrains as totaltrains_daily, round(cast(totaltrains as DOUBLE PRECISION) *365) as totaltrains_annually
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where totaltrains is not null
group by totaltrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\totaltrains.csv' With CSV HEADER

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, daylightthrutrains as daylightthrutrains_daily, round(cast(daylightthrutrains as DOUBLE PRECISION) *365) as daylightthrutrains_annually
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where daylightthrutrains is not null
group by daylightthrutrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\daylightthrutrains.csv' With CSV HEADER

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, averagepassengertraincount as averagepassengertraincount_daily, round(cast(averagepassengertraincount as DOUBLE PRECISION) *365) as averagepassengertraincount_annually
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where averagepassengertraincount > '0'
group by averagepassengertraincount, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\averagepassengertraincount.csv' With CSV HEADER

--traintrafficcounttype is all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficcounttype
--from sde.ciims_crossingdata
--group by traintrafficcounttype, routeID
--order by routeid, Min(measure))
--to 'C:\Users\kyleg\SQL\Postgresql\traintrafficcounttype.csv' with csv

copy ( 
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficdate
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where traintrafficdate is not null
group by traintrafficdate, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\traintrafficdate.csv' With CSV HEADER

copy (
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, thrutrains, round(cast(thrutrains as DOUBLE PRECISION) *365) as thrutrains_annually
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where thrutrains > '0'
group by thrutrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\thrutrains.csv' With CSV HEADER

copy ( 
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, switchtrains,  round(cast(switchtrains as DOUBLE PRECISION) *365) as switchtrains_annually
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where switchtrains > '0'
group by switchtrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\switchtrains.csv' With CSV HEADER

--the next query is too convoluted.  There is likely not be a way to identify a specific train parameter with source with the date for each specific train count parameter, any source date could apply to any parameter,
--by assumption the count source date must apply to all count parameters

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, 
--totaltrains as totaltrains_daily, 
--round(cast(totaltrains as DOUBLE PRECISION) *365) as totaltrains_annually, 
--daylightthrutrains as daylightthrutrains_daily, 
--round(cast(daylightthrutrains as DOUBLE PRECISION) *365) as daylightthrutrains_annually,
--averagepassengertraincount as averagepassengertraincount_daily, 
--round(cast(averagepassengertraincount as DOUBLE PRECISION) *365) as averagepassengertraincount_annually,
--traintrafficdate
--from sde.ciims_crossingdata
--where totaltrains is not null
--group by totaltrains, routeID, traintrafficdate, daylightthrutrains, averagepassengertraincount
--order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( 
select 
row_number() over () as ObjectID, 
row_number() over () as EventID, routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalmaxspeedovercrossing 
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where typicalmaxspeedovercrossing > '0'
group by typicalmaxspeedovercrossing, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\typicalmaxspeedovercrossing.csv' With CSV HEADER


copy (
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalminspeedovercrossing 
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where typicalminspeedovercrossing > '0'
group by typicalminspeedovercrossing, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\typicalminspeedovercrossing.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, maxtimetablespeed
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where maxtimetablespeed > '0'
group by maxtimetablespeed, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\maxtimetablespeed.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, nearrailroadtimetablestation
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where nearrailroadtimetablestation is not null
group by nearrailroadtimetablestation, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\nearrailroadtimetablestation.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, passengerservicetype
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where passengerservicetype like 'AMTRAK%'
group by passengerservicetype, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\passengerservicetype.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
 routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadcontactphonenumber
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroadcontactphonenumber != '8000000000'
group by railroadcontactphonenumber, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\railroadcontactphonenumber.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, trackdownroad
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where trackdownroad = 'Yes'
group by trackdownroad, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\trackdownroad.csv' With CSV HEADER


copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, quietzone
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where quietzone != 'No'
group by quietzone, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\quietzone.csv' With CSV HEADER


copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
 routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, city
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by city, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\city.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, cityinnearindicator
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by cityinnearindicator, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\cityinnearindicator.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by fips_city, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\fips_city.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, county
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by county, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\county.csv' With CSV HEADER


copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city, city, cityinnearindicator, county
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by fips_city, city, cityinnearindicator, county, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\citycountynear.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaddivisionregion
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroaddivisionregion is not null
group by railroaddivisionregion, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\railroaddivisionregion.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadbranchlinename
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroadbranchlinename is not null
group by railroadbranchlinename, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\railroadbranchlinename.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadsubdivisiondistrict
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroadsubdivisiondistrict is not null
group by railroadsubdivisiondistrict, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\railroadsubdivisiondistrict.csv' With CSV HEADER

copy ( 
select row_number() over () as ObjectID, 
row_number() over () as EventID, 
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, power
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where power = 'Yes'
group by power, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\power.csv' With CSV HEADER
--hsrcorridorid, countymapid all null

copy (  
select row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotlinesegmentid
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
group by routeID, kdotlinesegmentid
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\kdotlinesegmentid.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidentnumber
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroadidentnumber is not null
group by routeID, railroadidentnumber
order by routeid, Min(measure)) to 'C:\temp\Postgresql\railroadidentnumber.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotcorridorid
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where kdotcorridorid is not null
group by routeID, kdotcorridorid
order by routeid, Min(measure)) to 'C:\temp\Postgresql\kdotcorridorid.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, maintracks
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where maintracks > '0' 
group by routeID, maintracks
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\maintracks.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, othertracks, upper(othertracksdescription) as otherdescription
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where othertracks > '0' 
group by routeID,othertracks, upper(othertracksdescription) 
order by routeid, Min(measure)) to 'C:\temp\Postgresql\othertracks.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidnumber
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where railroadidnumber is not null
group by routeID, railroadidnumber
order by routeid, Min(measure)) to 'C:\temp\Postgresql\railroadidnumber.csv' With CSV HEADER

copy ( 
select  row_number() over () as ObjectID, 
row_number() over () as EventID,
routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, development
, 
CAST('11/1/1867' as DATE) as LRS_From_Date,
CAST('12/31/2020' as DATE) as LRS_To_Date
from sde.ciims_crossingdata
where development is not null
group by routeID, development
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\development.csv' With CSV HEADER

