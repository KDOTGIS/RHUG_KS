
USE Conflation

select top 100 * 
from sde.RoadCenterlines 
where 1=1
--AND State_System_LRSKey is not null
AND KDOT_LRS_KEY is not null

--SET the NG911 LRS Key to the KDOT_Conflation_Result_LRSKEY for State Highways
update sde.RoadCenterlines
set KDOT_LRS_KEY = State_System_LRSKey
where 1=1
AND State_System_LRSKey is not null
AND KDOT_LRS_KEY is null

--SET the NG911 LRS Key to the KDOT_Conflation_Result_LRSKEY for Non State Highways
update sde.RoadCenterlines
set KDOT_LRS_KEY = Non_State_System_LRSKey
where 1=1
AND KDOT_LRS_KEY is null
AND Non_State_System_LRSKey is not null

--SET the NG911 LRS Key to the KDOT_Conflation_Result_LRSKEY for Ramps
update sde.RoadCenterlines
set KDOT_LRS_KEY = RAMPS_LRSKEY
where 1=1
AND KDOT_LRS_KEY is null
AND Non_State_System_LRSKey is null
AND RAMPS_LRSKEY is not null

--PARSE the LRS Key filed to components for different ROUTE_PREFIX designations

-- FIRST parse the Route Prefix, this controls the parsing rules
update sde.RoadCenterlines
set LRS_ROUTE_PREFIX = SUBSTRING(KDOT_LRS_KEY, 4, 1)
where 1=1
AND LRS_ROUTE_PREFIX is null


-- Parse the fields for STATE HIGHWAY SYSTEM 
update sde.RoadCenterlines
set 
LRS_COUNTY_PRE = SUBSTRING(KDOT_LRS_KEY, 1, 3),
LRS_ROUTE_NUM = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_NUM1 = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_SUFFIX = SUBSTRING(KDOT_LRS_KEY, 10, 1),
LRS_DIRECTION = SUBSTRING(KDOT_LRS_KEY, 13, 2),
LRS_SUBCLASS = NULL,
LRS_ADMO = NULL,
LRS_UNIQUE_IDENT = SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_UNIQUE_IDENT1 = '0'+ SUBSTRING(KDOT_LRS_KEY, 11, 1)
where 1=1
AND LRS_ROUTE_PREFIX in ('I', 'U', 'K')

-- Parse the fields for NON_STATE_HIGHWAYS_URBAN_CLASSIFIEDS

--UPDATE THE COUNTY NUMBER IN LRS_COUNTY_PRE BY SPATIAL LOCATION
update sde.RoadCenterlines
set 
LRS_URBAN_PRE = SUBSTRING(KDOT_LRS_KEY, 1, 3),
LRS_ROUTE_NUM = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_NUM1 = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_SUFFIX = SUBSTRING(KDOT_LRS_KEY, 10, 1),
LRS_UNIQUE_IDENT = SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_UNIQUE_IDENT1 = '0'+SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_ADMO = SUBSTRING(KDOT_LRS_KEY, 12, 1),
LRS_SUBCLASS = SUBSTRING(KDOT_LRS_KEY, 13, 1),
FMEAS = NON_STATE_BEGIN_MP,
TMEAS = NON_STATE_END_MP
where 1=1
AND LRS_ROUTE_PREFIX = 'C'
AND FMEAS is null
and TMEAS is null

-- Parse the fields for NON_STATE_HIGHWAYS Rural Secondary
update sde.RoadCenterlines
set 
LRS_COUNTY_PRE = SUBSTRING(KDOT_LRS_KEY, 1, 3),
LRS_ROUTE_NUM = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_NUM1 = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_SUFFIX = SUBSTRING(KDOT_LRS_KEY, 10, 1),
LRS_UNIQUE_IDENT = SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_UNIQUE_IDENT1 = '0'+SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_ADMO = SUBSTRING(KDOT_LRS_KEY, 12, 1),
LRS_SUBCLASS = SUBSTRING(KDOT_LRS_KEY, 13, 1),
FMEAS = NON_STATE_BEGIN_MP,
TMEAS = NON_STATE_END_MP
where 1=1
AND LRS_ROUTE_PREFIX in ('R', 'M')
AND FMEAS is null 
AND TMEAS is null

-- Parse the fields for NON_STATE_HIGHWAYS Local Roads
update sde.RoadCenterlines
set 
LRS_COUNTY_PRE = SUBSTRING(KDOT_LRS_KEY, 1, 3),
LRS_ROUTE_NUM = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_NUM1 = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_SUFFIX = SUBSTRING(KDOT_LRS_KEY, 10, 1),
LRS_UNIQUE_IDENT = SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_UNIQUE_IDENT1 = '0'+SUBSTRING(KDOT_LRS_KEY, 11, 1),
LRS_ADMO = SUBSTRING(KDOT_LRS_KEY, 12, 1),
LRS_SUBCLASS = SUBSTRING(KDOT_LRS_KEY, 13, 1),
FMEAS = NON_STATE_BEGIN_MP,
TMEAS = NON_STATE_END_MP
where 1=1
AND LRS_ROUTE_PREFIX in ('L')
AND FMEAS is NULL
AND TMEAS is null

-- Parse the fields for RAMPS
update sde.RoadCenterlines
set 
LRS_COUNTY_PRE = SUBSTRING(KDOT_LRS_KEY, 1, 3),
LRS_ROUTE_NUM = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ROUTE_NUM1 = SUBSTRING(KDOT_LRS_KEY, 5, 5),
LRS_ADMO = SUBSTRING(KDOT_LRS_KEY, 12, 1),
LRS_UNIQUE_IDENT = SUBSTRING(KDOT_LRS_KEY, 10, 2),
LRS_UNIQUE_IDENT1 = SUBSTRING(KDOT_LRS_KEY, 10, 2),
--LRS_ROUTE_SUFFIX = '0',
FMEAS = 0
where 1=1
AND LRS_ROUTE_PREFIX in ('X')

update sde.RoadCenterlines
set LRS_PRIMARY_DIR = 0
where 1=1
AND LRS_PRIMARY_DIR is null

update sde.RoadCenterlines
set FromDate = CAST('1827-01-01' AS DATETIME)
where 1=1
AND FromDate is null

update sde.RoadCenterlines
set FromDate = CAST('2020-01-01' AS DATETIME)
where 1=1
AND STATUS IN ( 'Not Built', 'NOT BUILT')

update sde.RoadCenterlines
set ToDate = CAST('2014-01-01' AS DATETIME)
where 1=1
AND STATUS IN ( 'CLOSED', 'Closed')

update sde.RoadCenterlines
set RouteID = LRS_County_Pre+LRS_ROUTE_PREFIX+LRS_ROUTE_NUM1+LRS_ROUTE_SUFFIX +LRS_UNIQUE_IDENT1+LRS_PRIMARY_DIR
where 1=1
and LRS_ROUTE_PREFIX = 'L'
and RouteID is null

update sde.RoadCenterlines
set RouteID = LRS_County_Pre+LRS_ROUTE_PREFIX+LRS_ROUTE_NUM1+LRS_UNIQUE_IDENT1+LRS_PRIMARY_DIR
where 1=1
and LRS_ROUTE_PREFIX = 'X'
and RouteID is null

update sde.RoadCenterlines
set LRS_PRIMARY_DIR = 0
where 1 = 1
and LRS_ROUTE_PREFIX = 'C'
and LRS_PRIMARY_DIR is null


