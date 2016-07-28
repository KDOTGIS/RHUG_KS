Use Conflation

select * from [sde].[ROADCENTERLINES]
where 1=1
AND [RouteID2] is null

update sde.ROADCENTERLINES
set LRS_UNIQUE_IDENT1 = '00'
where LRS_UNIQUE_IDENT1 is null

update sde.ROADCENTERLINES
set KDOT_DIRECTION_CALC = '0'
where LRS_ROUTE_PREFIX = 'X'

update sde.ROADCENTERLINES
set KDOT_DIRECTION_CALC = '0'
where KDOT_DIRECTION_CALC is null

update [sde].[ROADCENTERLINES]
set [RouteID2] = LRS_COUNTY_PRE+LRS_ROUTE_PREFIX+Substring(LRS_RdNm_Soundex, 1, 5)+LRS_UNIQUE_IDENT1+LRS_PRIMARY_DIR
where LRS_ROUTE_PREFIX = 'X'
and LRS_RdNm_Soundex is null

update [sde].[ROADCENTERLINES]
set LRS_RdNm_Soundex = right('0000' +rtrim(CONCAT(left(Substring(Ltrim(Str(ObjectID)),2,6), patindex('%[^0-9]%', Substring(Ltrim(Str(ObjectID)),2,6)+'.') - 1), 'R')), 5)
where 
1 = 1
and LRS_ROUTE_PREFIX = 'X'
and RouteID2 is null

Substring(Ltrim(Str(ObjectID)),2,6)
where 
1 = 1
and LRS_ROUTE_PREFIX = 'X'
and RouteID2 is null

update [sde].[ROADCENTERLINES]
set [RouteID2] = LRS_COUNTY_PRE+LRS_ROUTE_PREFIX+LRS_RdNm_Soundex+LRS_UNIQUE_IDENT1+KDOT_DIRECTION_CALC

select * from [sde].[ROADCENTERLINES]
where 1=1
and RouteID2 is null
and Ramps_LRSKey is null

select ObjectID, LRS_COUNTY_PRE,LRS_ROUTE_PREFIX, LRS_RdNm_Soundex, LRS_UNIQUE_IDENT1, KDOT_DIRECTION_CALC,RouteID2  from [sde].[ROADCENTERLINES]
where 1=1
and RouteID2 is null
order by LRS_RdNm_Soundex


'''


update [sde].[ROADCENTERLINES]
set [RouteID2] = LRS_COUNTY_PRE+LRS_ROUTE_PREFIX+Substring(LRS_RdNm_Soundex, 1, 5)+LRS_UNIQUE_IDENT1+LRS_PRIMARY_DIR
where LRS_ROUTE_PREFIX = 'X'