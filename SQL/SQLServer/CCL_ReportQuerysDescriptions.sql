
/* need to subtract minimum city mileage from mileage values to set for the city stationing*/
  SELECT TOP (1000)
	MIN([FromMeasure]) MinRIDF
	,CityJurisdiction
	,RouteID
    ,CONCAT(CityJurisdiction, SUBSTRING([RouteId], 4, 12)) CCL_LRS
	FROM [Khub_CCL].[TDSUser].[SA_CCL_W_GEOM]
	WHERE CityJurisdiction <> 999
	Group By CityJurisdiction, RouteID
    ORDER BY CityJurisdiction, RouteID


SELECT TOP (1000) s.[Id]
	  ,CONCAT(CityJurisdiction, SUBSTRING(s.[RouteId], 4, 12)) CCL_LRS
      ,s.[RouteId]
      ,s.[FromMeasure]
      ,s.[ToMeasure]
      ,s.[FunctionalClassification]
      ,s.[AccessControl]
      ,s.[CityJurisdiction]
      ,s.[MaintenanceResponsibility]
      ,s.[NumberLanesAggregated]
      ,s.[DominantFlag]
	  ,s.[ToMeasure]-s.[FromMeasure] SEG_LENGTH
	  ,(s.[ToMeasure]-s.[FromMeasure] )*s.[NumberLanesAggregated] LANEMILES
      ,s.[Shape]
      ,s.[GDB_GEOMATTR_DATA]
	  ,d.[Description]
      ,d.[Sequence]
  FROM [Khub_CCL].[TDSUser].[SA_CCL_W_GEOM] s
  inner join [geo].[CCL_SEGMENTDESCRIPTIONS] d
  ON s.Id = d.ID
  WHERE 1=1
  AND s.CityJurisdiction <> 999
  ORDER BY s.CityJurisdiction, d.Sequence

  SELECT TOP (1000) s.[Id]
	  ,CONCAT(CityJurisdiction, SUBSTRING(s.[RouteId], 4, 12)) CCL_LRS
      ,s.[RouteId]
      ,s.[FromMeasure]
      ,s.[ToMeasure]
      ,s.[FunctionalClassification]
      ,s.[AccessControl]
      ,s.[CityJurisdiction]
      ,s.[MaintenanceResponsibility]
      ,s.[NumberLanesAggregated]
      ,s.[DominantFlag]
	  ,s.[ToMeasure]-s.[FromMeasure] SEG_LENGTH
	  ,(s.[ToMeasure]-s.[FromMeasure] )*s.[NumberLanesAggregated] LANEMILES
      ,s.[Shape]
      ,s.[GDB_GEOMATTR_DATA]
	  ,d.[Description]
      ,d.[Sequence]
  FROM [Khub_CCL].[TDSUser].[SA_CCL_W_GEOM] s
  inner join [geo].[CCL_SEGMENTDESCRIPTIONS] d
  ON s.Id = d.ID
  WHERE 1=1
  AND s.CityJurisdiction <> 999
  ORDER BY s.CityJurisdiction, d.Sequence

  use khub_ccl;

  drop view geo.CCL_Report 

 Create View geo.CCL_Report as 
 SELECT
	 s.[Id]
	 ,ROW_NUMBER() OVER (PARTITION BY (CONCAT([CityJurisdiction], [RouteId])) ORDER BY [FromMeasure]) SEQUENCE
	  ,CONCAT(s.[CityJurisdiction], SUBSTRING(s.[RouteId], 4, 12)) CCL_LRS
	  ,	d.[Description]
      ,s.[RouteId]
      ,s.[FromMeasure]
      ,s.[ToMeasure]
      ,s.[FunctionalClassification]
      ,s.[AccessControl]
      ,s.[CityJurisdiction]
      ,s.[MaintenanceResponsibility]
      ,s.[NumberLanesAggregated]
      ,s.[DominantFlag]
	  ,s.[ToMeasure]-s.[FromMeasure] SEG_LENGTH
	  ,CASE 
		When Substring(s.RouteID, 4, 1) = '1' THEN 'I-'+SUBSTRING(SUBSTRING(s.RouteID, 5, 5), PATINDEX('%[^0]%', SUBSTRING(s.RouteID, 5, 5)+'.'), LEN(SUBSTRING(s.RouteID, 5, 5)))+'........' +cast(cast(Round(s.[ToMeasure]-s.[FromMeasure], 3) as decimal (8, 3)) as varchar) 
		When Substring(s.RouteID, 4, 1) = '2' THEN 'U.S. '+SUBSTRING(SUBSTRING(s.RouteID, 5, 5), PATINDEX('%[^0]%', SUBSTRING(s.RouteID, 5, 5)+'.'), LEN(SUBSTRING(s.RouteID, 5, 5)))+'.....' +cast(cast(Round(s.[ToMeasure]-s.[FromMeasure], 3) as decimal (8, 3)) as varchar) 
		Else									   'K-'+SUBSTRING(SUBSTRING(s.RouteID, 5, 5), PATINDEX('%[^0]%', SUBSTRING(s.RouteID, 5, 5)+'.'), LEN(SUBSTRING(s.RouteID, 5, 5)))+'........' +cast(cast(Round(s.[ToMeasure]-s.[FromMeasure], 3) as decimal (8, 3)) as varchar) 
	  END AS Legend
	  ,Round((s.[ToMeasure]-s.[FromMeasure] ), 3)*s.[NumberLanesAggregated] LANEMILES
      ,s.[Shape]
      ,s.[GDB_GEOMATTR_DATA]
  FROM [TDSUser].[SA_CCL_W_GEOM] s
  inner join [geo].[SEGMENT_DESCRIPTION] d
  ON s.Id = d.ID
  WHERE 1=1
  AND s.CityJurisdiction <> 999
  AND s.[NumberLanesAggregated] is not null

  GRANT SELECT ON [geo].[CCL_Report] TO READONLY
