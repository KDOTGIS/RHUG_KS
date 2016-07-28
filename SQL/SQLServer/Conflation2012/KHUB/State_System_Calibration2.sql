USE Conflation

select [GCID],[StateKey1],[F_CNTY_1],[T_CNTY_1],[F_STAT_1],[T_STAT_1] 
from [sde].[ROADCENTERLINES]
where 1=1
and [StateKey1] is not null
and [F_CNTY_1] is null

select distinct [GCID], [COUNTY_LRS], [MEAS_COUNTY], [CountyKey1]
from [sde].[START_COUNTY]
where 1=1
and [COUNTY_LRS] =[CountyKey1] 

select distinct [COUNTY_LRS], [MEAS_COUNTY], [GCID], [CountyKey1]
from [sde].[END_COUNTY]
where 1=1
and [COUNTY_LRS] =[CountyKey1] 

select distinct [STATE_LRS], [MEAS_STATE], [GCID] ,SUBSTRING([CountyKey1], 4, 13)
from [sde].[START_STATE]
where 1=1
and [STATE_LRS] =SUBSTRING([CountyKey1], 4, 13)

select distinct [STATE_LRS], [MEAS_STATE], [GCID], SUBSTRING([CountyKey1], 4, 13)
from [sde].[END_STATE]
where 1=1
and [STATE_LRS] =SUBSTRING([CountyKey1], 4, 13)


update [sde].[ROADCENTERLINES]
set [F_CNTY_1] = m.[MEAS_COUNTY]
from [sde].[ROADCENTERLINES] r
JOIN (select distinct [GCID], [COUNTY_LRS], [MEAS_COUNTY], [CountyKey1]
	from [sde].[START_COUNTY]
	where 1=1
	and [COUNTY_LRS] =[CountyKey1] ) m on r.[GCID] = m.[GCID]
where 1=1
and r.[StateKey1] is not null


update [sde].[ROADCENTERLINES]
set [T_CNTY_1] = m.[MEAS_COUNTY]
from [sde].[ROADCENTERLINES] r
JOIN (select distinct [COUNTY_LRS], [MEAS_COUNTY], [GCID], [CountyKey1]
	from [sde].[END_COUNTY]
	where 1=1
	and [COUNTY_LRS] =[CountyKey1] )m on r.[GCID] = m.[GCID]
where 1=1
and r.[StateKey1] is not null

update [sde].[ROADCENTERLINES]
set [F_STAT_1] = m.[MEAS_STATE]
from [sde].[ROADCENTERLINES] r
JOIN (select distinct [STATE_LRS], [MEAS_STATE], [GCID] 
	from [sde].[START_STATE]
	where 1=1
	and [STATE_LRS] =SUBSTRING([CountyKey1], 4, 13)) m on r.[GCID] = m.[GCID]
where 1=1
and r.[StateKey1] is not null

update [sde].[ROADCENTERLINES]
set [T_STAT_1] = m.[MEAS_STATE]
from [sde].[ROADCENTERLINES] r
JOIN (select distinct [STATE_LRS], [MEAS_STATE], [GCID]
	from [sde].[END_STATE]
	where 1=1
	and [STATE_LRS] =SUBSTRING([CountyKey1], 4, 13)) m on r.[GCID] = m.[GCID]
where 1=1
and r.[StateKey1] is not null