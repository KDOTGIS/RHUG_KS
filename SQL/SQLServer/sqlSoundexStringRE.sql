/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 10000 
      [COUNTY_L]
      ,[COUNTY_R]
      ,[MUNI_L]
      ,[MUNI_R]
      ,[PARITY_L]
      ,[PARITY_R]
      ,[PRD]
      ,[STP]
      ,[RD]
      ,[STS]
      ,[POD]
      ,[POM]
      ,[LRS_RdNm_Soundex]
      ,[RDCLASS]
      ,[LRSKEY]
      ,[RID]
      ,[FMEAS]
      ,[TMEAS]
      ,[LRS_COUNTY_PRE]
      ,[LRS_URBAN_PRE]
      ,[LRS_ROUTE_PREFIX]
      ,[LRS_ROUTE_SUFFIX]
      ,[LRS_UNIQUE_IDENT]
      ,[LRS_ADMO]
      ,[LRS_SUBCLASS]
      ,[LRS_DIRECTION]
      ,[MILEAGE_COUNTED]
      ,[LRS_ROUTE_NUM]
      ,[RouteID]
      ,[LRS_ROUTE_NUM1]
      ,[LRS_UNIQUE_IDENT1]
      ,[LRS_PRIMARY_DIR]
  FROM [Conflation].[geo].[ROADCENTERLINES] as rd
  where 1=1
  AND 
  --AND rd.RD LIKE 'COUNTY ROAD % HALF'
  
update geo.RoadCenterlines
set LRS_RdNm_Soundex = SOUNDEX(rd.RD)
FROM [Conflation].[geo].[ROADCENTERLINES] as rd
where 1=1
and LRS_ROUTE_PREFIX = 'L' or LRS_ROUTE_PREFIX is null
and LRS_RdNm_Soundex = '0000' or LRS_RdNm_Soundex is null

update [Conflation].[geo].[ROADCENTERLINES]
set LRS_RdNm_Soundex = REPLACE(rd.RD, 'COUNTY ROAD ', '000')
FROM [Conflation].[geo].[ROADCENTERLINES] as rd
where 1=1
and rd.RD LIKE 'COUNTY ROAD %' 
and LEN(rd.RD)=13

update [Conflation].[geo].[ROADCENTERLINES]
set LRS_RdNm_Soundex = REPLACE(rd.RD, 'COUNTY ROAD ', '00')
FROM [Conflation].[geo].[ROADCENTERLINES] as rd
where 1=1
and rd.RD LIKE 'COUNTY ROAD %' 
and LEN(rd.RD)=14

update [Conflation].[geo].[ROADCENTERLINES]
set LRS_RdNm_Soundex = REPLACE(rd.RD, 'COUNTY ROAD ', '0')
FROM [Conflation].[geo].[ROADCENTERLINES] as rd
where 1=1
and rd.RD LIKE 'COUNTY ROAD %' 
and LEN(rd.RD)=15

update [Conflation].[geo].[ROADCENTERLINES]
set LRS_RdNm_Soundex = REPLACE(REPLACE(rd.RD, 'COUNTY ROAD ', '0'), rd.RD, ' HALF', '5')
FROM [Conflation].[geo].[ROADCENTERLINES] as rd
where 1=1
and rd.RD LIKE 'COUNTY ROAD % HALF' 
and LEN(rd.RD)=15

