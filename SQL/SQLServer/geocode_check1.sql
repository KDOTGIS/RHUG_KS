/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [LRS_COUNTY_PRE]--, count ([OBJECTID])
  FROM [Conflation].[sde].[ROADCENTERLINES]
  group by [LRS_COUNTY_PRE] having count([OBJECTID]) >200