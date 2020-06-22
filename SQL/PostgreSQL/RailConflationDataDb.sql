drop table operatingrailroadcompany

copy (
select row_number() over () as ObjectID, 
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
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, parentrailroadcompany
from sde.ciims_crossingdata
where parentrailroadcompany is not null
group by parentrailroadcompany, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\parentrailroadcompany.csv' With CSV HEADER


copy ( 
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, crossingowner
from sde.ciims_crossingdata
where crossingowner is not null
group by crossingowner, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\crossingowner.csv' With CSV HEADER

elect routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as length, otherrrcompanyseperatetrack
from sde.ciims_crossingdata
roup by otherrrcompanyseperatetrack, routeID

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaduse1
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
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, totaltrains as totaltrains_daily, round(cast(totaltrains as DOUBLE PRECISION) *365) as totaltrains_annually
from sde.ciims_crossingdata
where totaltrains is not null
group by totaltrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\totaltrains.csv' With CSV HEADER

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, daylightthrutrains as daylightthrutrains_daily, round(cast(daylightthrutrains as DOUBLE PRECISION) *365) as daylightthrutrains_annually
from sde.ciims_crossingdata
where daylightthrutrains is not null
group by daylightthrutrains, routeID
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\daylightthrutrains.csv' With CSV HEADER

copy ( averagepassengertraincount as 
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, averagepassengertraincount as averagepassengertraincount_daily, round(cast(averagepassengertraincount as DOUBLE PRECISION) *365) as averagepassengertraincount_annually
from sde.ciims_crossingdata
where averagepassengertraincount > '0'
group by averagepassengertraincount, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

--traintrafficcounttype is all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficcounttype
--from sde.ciims_crossingdata
--group by traintrafficcounttype, routeID
--order by routeid, Min(measure))
--to 'C:\Users\kyleg\SQL\Postgresql\traintrafficcounttype.csv' with csv

copy ( traintrafficdate as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficdate
from sde.ciims_crossingdata
where traintrafficdate is not null
group by traintrafficdate, routeID
order by routeid, Min(measure)

copy ( thrutrains as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, thrutrains, round(cast(thrutrains as DOUBLE PRECISION) *365) as thrutrains_annually
from sde.ciims_crossingdata
where thrutrains > '0'
group by thrutrains, routeID
order by routeid, Min(measure)


copy ( switchtrains 
as select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, switchtrains,  round(cast(switchtrains as DOUBLE PRECISION) *365) as switchtrains_annually
from sde.ciims_crossingdata
where switchtrains > '0'
group by switchtrains, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

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

copy ( typicalmaxspeedovercrossing as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalmaxspeedovercrossing 
from sde.ciims_crossingdata
where typicalmaxspeedovercrossing > '0'
group by typicalmaxspeedovercrossing, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER


copy ( typicalminspeedovercrossing as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalminspeedovercrossing 
from sde.ciims_crossingdata
where typicalminspeedovercrossing > '0'
group by typicalminspeedovercrossing, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( maxtimetablespeed as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, maxtimetablespeed
from sde.ciims_crossingdata
where maxtimetablespeed > '0'
group by maxtimetablespeed, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( nearrailroadtimetablestation as 
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, nearrailroadtimetablestation
from sde.ciims_crossingdata
where nearrailroadtimetablestation is not null
group by nearrailroadtimetablestation, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( passengerservicetype as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, passengerservicetype
from sde.ciims_crossingdata
where passengerservicetype like 'AMTRAK%'
group by passengerservicetype, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroadcontactphonenumber as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadcontactphonenumber
from sde.ciims_crossingdata
where railroadcontactphonenumber != '8000000000'
group by railroadcontactphonenumber, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( trackdownroad as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, trackdownroad
from sde.ciims_crossingdata
where trackdownroad = 'Yes'
group by trackdownroad, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER


copy ( quietzone as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, quietzone
from sde.ciims_crossingdata
where quietzone != 'No'
group by quietzone, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER


copy ( city as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, city
from sde.ciims_crossingdata
group by city, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( cityinnearindicator as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, cityinnearindicator
from sde.ciims_crossingdata
group by cityinnearindicator, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( fips_city as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city
from sde.ciims_crossingdata
group by fips_city, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( county as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, county
from sde.ciims_crossingdata
group by county, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( county as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, city
from sde.ciims_crossingdata
group by city, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( citycountynear as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city, city, cityinnearindicator, county
from sde.ciims_crossingdata
group by fips_city, city, cityinnearindicator, county, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroaddivisionregion as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaddivisionregion
from sde.ciims_crossingdata
where railroaddivisionregion is not null
group by railroaddivisionregion, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroadbranchlinename as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadbranchlinename
from sde.ciims_crossingdata
where railroadbranchlinename is not null
group by railroadbranchlinename, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroadsubdivisiondistrict as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadsubdivisiondistrict
from sde.ciims_crossingdata
where railroadsubdivisiondistrict is not null
group by railroadsubdivisiondistrict, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( power as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, power
from sde.ciims_crossingdata
where power = 'Yes'
group by power, routeID
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER
--hsrcorridorid, countymapid all null

copy ( kdotlinesegmentid as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotlinesegmentid
from sde.ciims_crossingdata
group by routeID, kdotlinesegmentid
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroadidentnumber as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidentnumber
from sde.ciims_crossingdata
where railroadidentnumber is not null
group by routeID, railroadidentnumber
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( kdotcorridorid as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotcorridorid
from sde.ciims_crossingdata
where kdotcorridorid is not null
group by routeID, kdotcorridorid
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( maintracks as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, maintracks
from sde.ciims_crossingdata
where maintracks > '0' 
group by routeID, maintracks
order by routeid, Min(measure)
) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER
copy ( othertracksdescription as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, othertracks, upper(othertracksdescription) as otherdescription
from sde.ciims_crossingdata
where othertracks > '0' 
group by routeID,othertracks, upper(othertracksdescription) 
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( railroadidnumber as
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidnumber
from sde.ciims_crossingdata
where railroadidnumber is not null
group by routeID, railroadidnumber
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

copy ( development as 
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, development
from sde.ciims_crossingdata
where development is not null
group by routeID, development
order by routeid, Min(measure)) to 'C:\temp\Postgresql\operatingrailroadcompany.csv' With CSV HEADER

