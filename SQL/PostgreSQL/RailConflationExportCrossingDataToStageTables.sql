copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, operatingrailroadcompany
from sde.ciims_crossingdata
group by operatingrailroadcompany, routeID
order by routeid, Min(measure)
)
to 'C:\Users\kyleg\SQL\Postgresql\operatingrailroadcompany.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, parentrailroadcompany
from sde.ciims_crossingdata
where parentrailroadcompany is not null
group by parentrailroadcompany, routeID
order by routeid, Min(measure)
)
to 'C:\Users\kyleg\SQL\Postgresql\parentrailroadcompany.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, crossingowner
from sde.ciims_crossingdata
where crossingowner is not null
group by crossingowner, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\crossingowner.csv' with csv;
elect routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as length, otherrrcompanyseperatetrack
from sde.ciims_crossingdata
roup by otherrrcompanyseperatetrack, routeID

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaduse1
from sde.ciims_crossingdata
where railroaduse1 is not null
group by railroaduse1, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroaduse1.csv' with csv;

--otherrrcompanyseperatetrack2, 3, 4 is all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, otherrrcompanyseperatetrack4
--from sde.ciims_crossingdata
--where otherrrcompanyseperatetrack4 is not null
--group by otherrrcompanyseperatetrack4, routeID;

--otherrrcompanysametrack2 2, 3, 4 all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, otherrrcompanysametrack4
--from sde.ciims_crossingdata
--where otherrrcompanysametrack4 is not null
--group by otherrrcompanysametrack4, routeID;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, totaltrains as totaltrains_daily, round(cast(totaltrains as DOUBLE PRECISION) *365) as totaltrains_annually
from sde.ciims_crossingdata
where totaltrains is not null
group by totaltrains, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\totaltrains.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, daylightthrutrains as daylightthrutrains_daily, round(cast(daylightthrutrains as DOUBLE PRECISION) *365) as daylightthrutrains_annually
from sde.ciims_crossingdata
where daylightthrutrains is not null
group by daylightthrutrains, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\daylightthrutrains.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, averagepassengertraincount as averagepassengertraincount_daily, round(cast(averagepassengertraincount as DOUBLE PRECISION) *365) as averagepassengertraincount_annually
from sde.ciims_crossingdata
where averagepassengertraincount > '0'
group by averagepassengertraincount, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\averagepassengertraincount.csv' with csv;

--traintrafficcounttype is all null

--select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficcounttype
--from sde.ciims_crossingdata
--group by traintrafficcounttype, routeID
--order by routeid, Min(measure))
--to 'C:\Users\kyleg\SQL\Postgresql\traintrafficcounttype.csv' with csv

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, traintrafficdate
from sde.ciims_crossingdata
where traintrafficdate is not null
group by traintrafficdate, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\traintrafficdate.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, thrutrains, round(cast(thrutrains as DOUBLE PRECISION) *365) as thrutrains_annually
from sde.ciims_crossingdata
where thrutrains > '0'
group by thrutrains, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\thrutrains.csv' with csv;


copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, switchtrains,  round(cast(switchtrains as DOUBLE PRECISION) *365) as switchtrains_annually
from sde.ciims_crossingdata
where switchtrains > '0'
group by switchtrains, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\switchtrains.csv' with csv;

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
--order by routeid, Min(measure);

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalmaxspeedovercrossing 
from sde.ciims_crossingdata
where typicalmaxspeedovercrossing > '0'
group by typicalmaxspeedovercrossing, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\typicalmaxspeedovercrossing.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, typicalminspeedovercrossing 
from sde.ciims_crossingdata
where typicalminspeedovercrossing > '0'
group by typicalminspeedovercrossing, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\typicalminspeedovercrossing.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, maxtimetablespeed
from sde.ciims_crossingdata
where maxtimetablespeed > '0'
group by maxtimetablespeed, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\maxtimetablespeed.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, nearrailroadtimetablestation
from sde.ciims_crossingdata
where nearrailroadtimetablestation is not null
group by nearrailroadtimetablestation, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\nearrailroadtimetablestation.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, passengerservicetype
from sde.ciims_crossingdata
where passengerservicetype like 'AMTRAK%'
group by passengerservicetype, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\passengerservicetype.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadcontactphonenumber
from sde.ciims_crossingdata
where railroadcontactphonenumber != '8000000000'
group by railroadcontactphonenumber, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroadcontactphonenumber.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, trackdownroad
from sde.ciims_crossingdata
where trackdownroad = 'Yes'
group by trackdownroad, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\trackdownroad.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, quietzone
from sde.ciims_crossingdata
where quietzone != 'No'
group by quietzone, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\quietzone.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, city
from sde.ciims_crossingdata
group by city, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\city.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, cityinnearindicator
from sde.ciims_crossingdata
group by cityinnearindicator, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\cityinnearindicator.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city
from sde.ciims_crossingdata
group by fips_city, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\fips_city.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, county
from sde.ciims_crossingdata
group by county, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\county.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, city
from sde.ciims_crossingdata
group by city, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\county.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, fips_city, city, cityinnearindicator, county
from sde.ciims_crossingdata
group by fips_city, city, cityinnearindicator, county, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\citycountynear.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroaddivisionregion
from sde.ciims_crossingdata
where railroaddivisionregion is not null
group by railroaddivisionregion, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroaddivisionregion.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadbranchlinename
from sde.ciims_crossingdata
where railroadbranchlinename is not null
group by railroadbranchlinename, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroadbranchlinename.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadsubdivisiondistrict
from sde.ciims_crossingdata
where railroadsubdivisiondistrict is not null
group by railroadsubdivisiondistrict, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroadsubdivisiondistrict.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, power
from sde.ciims_crossingdata
where power = 'Yes'
group by power, routeID
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\power.csv' with csv;

--hsrcorridorid, countymapid all null

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotlinesegmentid
from sde.ciims_crossingdata
group by routeID, kdotlinesegmentid
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\kdotlinesegmentid.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidentnumber
from sde.ciims_crossingdata
where railroadidentnumber is not null
group by routeID, railroadidentnumber
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroadidentnumber.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, kdotcorridorid
from sde.ciims_crossingdata
where kdotcorridorid is not null
group by routeID, kdotcorridorid
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\kdotcorridorid.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, maintracks
from sde.ciims_crossingdata
where maintracks > '0' 
group by routeID, maintracks
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\maintracks.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, othertracks, upper(othertracksdescription) as otherdescription
from sde.ciims_crossingdata
where othertracks > '0' 
group by routeID,othertracks, upper(othertracksdescription) 
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\othertracksdescription.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, railroadidnumber
from sde.ciims_crossingdata
where railroadidnumber is not null
group by routeID, railroadidnumber
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\railroadidnumber.csv' with csv;

copy (
select routeID, Min(measure) as FromMeas, Max(measure) as MaxMeasure, Max(measure)-Min(measure) as Length, development
from sde.ciims_crossingdata
where development is not null
group by routeID, development
order by routeid, Min(measure))
to 'C:\Users\kyleg\SQL\Postgresql\development.csv' with csv;

