USE Conflation

SELECT * FROM SDE.COUNTYBOUNDARY

-- return road centerlines without a calculated county prefix
select * from SDE.ROADCENTERLINES
where LRS_COUNTY_PRE is null

-- return road centerlines without a calculated county prefix, 
-- where the county prefix is easly to calculate based on NENA county L/R attribute values
select RC.*, CB.*
from [sde].[ROADCENTERLINES] RC
inner join sde.COUNTYBOUNDARY CB
on RC.COUNTY_R = CB.COUNTY
where 
1=1
AND RC.COUNTY_L = RC.COUNTY_R
and RC.LRS_COUNTY_PRE is null

-- return road centerlines without a calculated county prefix, 
-- and spatial join the county polygon which intersects those road lines
-- if on a boundary, this inner join might not return correct results
SELECT RC.*, CB.* 
from [sde].[ROADCENTERLINES] RC
inner join [sde].[COUNTYBOUNDARY] CB with(Index([S5_idx]))
on RC.Shape.STIntersects(CB.Shape) = 1
WHERE
LRS_COUNTY_PRE is null

-- return road centerlines without a calculated county prefix, 
-- and spatial join the county which intersects those lines
-- if on a boundary, this inner join might not return correct results
-- use python/arcpy buffer/select/join/calculate method to calculate LRS_County for primary
-- LRS County spatial calculation based on West North rule 
-- python script saved at F:\Cart\projects\Conflation\py

--update the LRS County Prefix Code based on the county attribute in road centerlines
update RC
set RC.LRS_COUNTY_PRE = CB.KDOT_CountyNumStr
	from [sde].[ROADCENTERLINES] RC
		inner join sde.COUNTYBOUNDARY CB
		on RC.COUNTY_R = CB.COUNTY
	where 
	1=1
	AND RC.COUNTY_L = RC.COUNTY_R
	and RC.LRS_COUNTY_PRE is null

