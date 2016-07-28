USE Conflation

--number of rows per county
select distinct count (*) as COUNTOFROWS, 
rd.LRS_COUNTY_PRE
from geo.RoadCenterlines_evw as rd
where 1=1
group by rd.LRS_COUNTY_PRE
order by rd.LRS_COUNTY_PRE

--this query gives the highest number value in the Route Number fields for local class
USE Conflation
select distinct count (*) as THECOUNT, 
rd.LRS_COUNTY_PRE,
max(rd.LRS_ROUTE_NUM) as MaxRouteNum, 
max (rd.LRS_ROUTE_NUM1) as MaxRouteNum1
from geo.RoadCenterlines_evw as rd
where 1=1
AND rd.LRS_ROUTE_PREFIX = 'L'
group by rd.LRS_COUNTY_PRE
order by LRS_COUNTY_PRE

--soundex value for local class road name
USE Conflation
from geo.RoadCenterlines_evw as rd


