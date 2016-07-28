USE [Conflation]

--miles per county
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 0) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('I', 'U', 'K', 'L', 'M', 'R', 'C')
and [LRS_COUNTY_PRE] <> '000'
and [LRS_COUNTY_PRE] <> '800'
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]
ORDER BY  r.[LRS_COUNTY_PRE] ASC

--Mileage on State System City 
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 3) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('I', 'U', 'K')
--and [LRS_COUNTY_PRE] <> '000'
--and [LRS_COUNTY_PRE] <> '800'
and ([KDOT_MUNI_L]<>999 OR [KDOT_MUNI_R]<>999) 
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
--and LRS_URBAN_PRE is not NULL
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]

--Mileage on State System Rural
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 3) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('I', 'U', 'K')
--and [LRS_COUNTY_PRE] <> '000'
--and [LRS_COUNTY_PRE] <> '800'
and ([KDOT_MUNI_L]='999' OR [KDOT_MUNI_R]='999') 
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
--and LRS_URBAN_PRE is not NULL
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]

--Mileage on Rural Collectors Major
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 3) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('R')
--and [LRS_COUNTY_PRE] <> '000'
--and [LRS_COUNTY_PRE] <> '800'
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
--and LRS_URBAN_PRE is not NULL
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]

--Mileage on Rural Collectors Minor
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 3) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('M')
--and [LRS_COUNTY_PRE] <> '000'
--and [LRS_COUNTY_PRE] <> '800'
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
--and LRS_URBAN_PRE is not NULL
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]

--Mileage on Rural Collectors Local
select r.[LRS_COUNTY_PRE], [sde].[COUNTIES].[COUNTY_NAME], Round(SUM(r.[Shape].STLength())/5280, 3) MILES 
FROM [sde].[ROADCENTERLINES] r
left join [sde].[COUNTIES] 
ON r.[LRS_COUNTY_PRE]=[sde].[COUNTIES].[COUNTY_NO] 
WHERE 1=1
and [LRS_ROUTE_PREFIX] IN ('L')
--and [LRS_COUNTY_PRE] <> '000'
--and [LRS_COUNTY_PRE] <> '800'
and [KDOT_DIRECTION_CALC] = '0'
and [MILEAGE_COUNTED] is null
and [status] = 'OPEN'
and LRS_URBAN_PRE is NULL
and ([KDOT_COUNTY_L] = [LRS_COUNTY_PRE] OR [KDOT_COUNTY_R] = [LRS_COUNTY_PRE])
and (KDOT_MUNI_L = '999' or KDOT_MUNI_R = '999')
GROUP BY [sde].[COUNTIES].[COUNTY_NAME],  r.[LRS_COUNTY_PRE]
ORDER BY LRS_COUNTY_PRE