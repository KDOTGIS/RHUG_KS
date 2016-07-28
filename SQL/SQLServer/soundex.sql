update geo.RoadCenterlines
set LRS_RdNm_Soundex = SOUNDEX(rd.RD)
from geo.RoadCenterlines_evw as rd
where 1=1
and LRS_ROUTE_PREFIX = 'L' or LRS_ROUTE_PREFIX is null
and LRS_RdNm_Soundex = '0000' or LRS_RdNm_Soundex is null

--calc soundex on rows where lrs prefix is null, or unidentified
update geo.RoadCenterlines
set LRS_RdNm_Soundex = SOUNDEX(rd.RD)
from geo.RoadCenterlines as rd
where 1=1
and LRS_RdNm_Soundex is null


select top 1000 *
from geo.RoadCenterlines as rd
where 1=1
and LRS_ROUTE_PREFIX = 'L'
and LRS_RdNm_Soundex = '0000' 
