CREATE VIEW SEGMENT_DESCRIPTION AS SELECT 
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
ON b.[ID] = e.[ID];
