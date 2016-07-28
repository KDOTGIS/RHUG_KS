
USE Conflation

select top 1000 
OBJECTID,
RouteID,
LRSKEY,
KDOT_LRS_KEY,
State_System_LRSKey,
Non_State_System_LRSKey,
RAMPS_LRS_KEY,
LRS_COUNTY_PRE, 
LRS_URBAN_PRE, 
LRS_ROUTE_PREFIX,
LRS_ROUTE_NUM,
LRS_ROUTE_NUM1,
LRS_ROUTE_SUFFIX, 
LRS_UNIQUE_IDENT, 
LRS_UNIQUE_IDENT1, 
LRS_ADMO, 
LRS_SUBCLASS,
LRS_DIRECTION,
LRS_PRIMARY_DIR,
rd.ToDate,
rd.FromDate,
rd.FMEAS, 
rd.TMEAS,
rd.Shape
from geo.RoadCenterlines_evw as rd
where 1=1
AND RAMPS_LRS_KEY is not null
AND LRS_DIRECTION in ('EB', 'NB')
AND LRS_PRIMARY_DIR > 0
AND LRS_DIRECTION in ('SB', 'WB')
--AND LRS_ROUTE_PREFIX = 'C'
AND KDOT_LRS_KEY is not null
--AND LRS_ROUTE_PREFIX is null
--AND RAMPS_LRS_KEY is not null