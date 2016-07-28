use Conflation
ALTER TABLE sde.Roadcenterlines 

ADD 
KDOT_BEG_LOGMILE numeric(38,8) NULL, 
KDOT_END_LOGMILE numeric(38,8) NULL, 
KDOT_LRS_KEY nvarchar(50) NULL,
KDOT_DIRECTION_CALC nvarchar(2) NULL,
RID	nvarchar(50) NULL,
FMEAS numeric(38,8)NULL,
TMEAS numeric(38,8) NULL,
LRS_COUNTY_PRE	nvarchar(3) NULL,
LRS_URBAN_PRE	nvarchar(3) NULL,
LRS_ROUTE_PREFIX	nvarchar(1) NULL,
LRS_ROUTE_SUFFIX	nvarchar(1) NULL,
LRS_UNIQUE_IDENT	nvarchar(2) NULL,
LRS_ADMO	nvarchar(1) NULL,
LRS_SUBCLASS	nvarchar(1) NULL,
LRS_DIRECTION	nvarchar(2) NULL,
MILEAGE_COUNTED	nvarchar(2) NULL,
LRS_ROUTE_NUM	nvarchar(5) NULL,
KDOT_QA	nvarchar(255) NULL,
RouteID	nvarchar(24) NULL,
FromDate datetime2(7) NULL,
ToDate	datetime2(7) NULL,
LRS_ROUTE_NUM1	nvarchar(5) NULL,
LRS_UNIQUE_IDENT1	nvarchar(2) NULL,
LRS_PRIMARY_DIR	nvarchar(1) NULL,
LRS_RdNm_Soundex	nvarchar(20) NULL
