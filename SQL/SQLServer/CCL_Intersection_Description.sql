/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [OBJECTID]
	,CAST(Round([DistanceBeg]/5280, 3) AS DECIMAL (9,3)) Miles
	,Concat(CAST(Round([DistanceBeg]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',[LABEL]) Described
      ,[Join_Count]
      ,[DistanceBeg]
      ,[Id]
      ,[RouteId]
      ,[FromMeasure]
      ,[ToMeasure]
      ,[ORIG_FID]
      ,[LABEL]
		,[NGKSSEGID]
  FROM [geo].[BEGDESCRIBED]
  WHERE RouteID = '04830004200'
  AND CityJurisdiction = 612
  ORDER BY RouteID, [FromMeasure]

SELECT Concat('From ', CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',b.[LABEL]) DescribedOrigin
,Concat('To ', CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',e.[LABEL]) DescribedTerminus
,Concat('From ', CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',b.[LABEL],' to ', CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',e.[LABEL]) Descrption
,b.ID
FROM [geo].[BEGDESCRIBED] b
INNER JOIN [geo].[ENDDESCRIBED] e
  ON b.[ID] = e.[ID]
    WHERE b.RouteID = '04830004200'
	  AND b.CityJurisdiction = 612


SELECT 
CASE WHEN CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)) >0.001 
THEN Concat('From ', CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',b.[LABEL]) 
ELSE Concat('From Intersection with ',b.[LABEL])
END DescribedOrigin
,CASE WHEN CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)) >0.001 
THEN Concat(' to ', CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',e.[LABEL]) 
ELSE Concat(' to Intersection with ',e.[LABEL])
END DescribedTerminus
,CONCAT(CASE WHEN CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)) >0.001 
THEN Concat('From ', CAST(Round(b.[DistanceBeg]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',b.[LABEL]) 
ELSE Concat('From Intersection with ',b.[LABEL])
END , CASE WHEN CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)) >0.001 
THEN Concat(' to ', CAST(Round(e.[DistanceEnd]/5280, 3) AS DECIMAL (9,3)), ' miles from Intersection with ',e.[LABEL]) 
ELSE Concat(' to Intersection with ',e.[LABEL])
END) Description
,b.ID
FROM [geo].[BEGDESCRIBED] b
INNER JOIN [geo].[ENDDESCRIBED] e
  ON b.[ID] = e.[ID]
    WHERE b.RouteID = '04830004200'
	  AND b.CityJurisdiction = 612
	  
	 
