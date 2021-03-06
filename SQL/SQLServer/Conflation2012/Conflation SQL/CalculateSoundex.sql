/****** Script to Calculate Street Codes using Soundex for named roads  ******/

USE Conflation

--Update the SOUNDEX based on Road Name for non-highways

update sde.RoadCenterlines
set LRS_RdNm_Soundex = CONCAT(SOUNDEX(RD), SUBSTRING(STS, 1, 1))
where 1=1
AND LRS_ROUTE_PREFIX not like 'I' 
AND LRS_ROUTE_PREFIX not like 'U' 
AND LRS_ROUTE_PREFIX not like 'K'
AND LRS_ROUTE_PREFIX not like 'X'


--update the Soundex column for numbered streets
update sde.RoadCenterlines
set LRS_RdNm_Soundex = right('0000' +rtrim(CONCAT(left(RD, patindex('%[^0-9]%', RD+'.') - 1), SUBSTRING(STS, 1, 1))), 5)
where 1=1
AND LRS_RdNm_Soundex like '0000%' 
AND LRS_ROUTE_PREFIX not like 'X' 

update sde.RoadCenterlines
set LRS_RdNm_Soundex = CONCAT(SOUNDEX(RD), 'R')
where 1=1
AND LRS_RdNm_Soundex like '0000%' 
AND LRS_ROUTE_PREFIX = 'X' 

update sde.RoadCenterlines
set LRS_RdNm_Soundex = LRS_ROUTE_NUM1
where 1=1
AND LRS_ROUTE_PREFIX in ('I', 'U', 'K') 

update sde.RoadCenterlines
set LRS_RdNm_Soundex = LRS_ROUTE_NUM1+'0'
where 1=1
AND LRS_ROUTE_PREFIX in ('X') 




