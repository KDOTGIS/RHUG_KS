--sql server database
---create view
---6/21/16
--------------------------

Use Conflation
------------------------
drop view CONFLATION_RDCENTERLINES
--------------------------------
create   view CONFLATION_RDCENTERLINES AS
SELECT  [OBJECTID]
        ,[UPDATEBY]  [LAST_EDITED_USER]
        ,[SURFACE]
        ,[LRSKEY] [LRS_KEY]
        ,[COUNTY_BEGIN_MP]  [LRS_BEG_CNTY_LOGMILE]
        ,[COUNTY_END_MP]  [LRS_END_CNTY_LOGMILE]
        ,[BEG_NODE]  [LRS_BEG_NODE]
        ,[END_NODE]  [LRS_END_NODE]
        ,[Shape]  [LINEARGEOMETRY]
           ,[PRD] [PRE_DIR]
           ,[RD] [STR_NAME]
        ,[STS] [STR_TYPE]
        ,[LRS_COUNTY_PRE]
        ,[LRS_ROUTE_PREFIX]
        ,[LRS_ROUTE_SUFFIX]
        ,[LRS_UNIQUE_IDENT]
        ,[LRS_DIRECTION]
        ,[MILEAGE_COUNTED]
        ,[LRS_ROUTE_NUM]
        ,[RouteID] [ROUTE_ID]
        ,[LRS_PRIMARY_DIR]
     
  FROM [Conflation].[sde].[ROADCENTERLINES]
------------------------------------


  select * from CONFLATION_RDCENTERLINES