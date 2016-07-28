use Conflation

select * from [sde].[MUNICIPALBOUNDARY]

select * from [sde].[CITY_LIMITS]

select * from [sde].[ROADCENTERLINES]

update [sde].[MUNICIPALBOUNDARY]
set [KDOT_CITYNUM_STR] = y.[CITY_CD]
from [sde].[MUNICIPALBOUNDARY] m
JOIN [sde].[CITY_LIMITS] y on m.MUNI = y.CITY
where m.KDOT_CITYNUM_STR is null


update [sde].[ROADCENTERLINES]
set [KDOT_MUNI_L] = m.[KDOT_CITYNUM_STR]
from [sde].[ROADCENTERLINES] r
JOIN [sde].[MUNICIPALBOUNDARY] m on r.MUNI_L = m.MUNI
WHERE r.[KDOT_MUNI_L] is null

update [sde].[ROADCENTERLINES]
set [KDOT_MUNI_R] = m.[KDOT_CITYNUM_STR]
from [sde].[ROADCENTERLINES] r
JOIN [sde].[MUNICIPALBOUNDARY] m on r.MUNI_R = m.MUNI
WHERE r.[KDOT_MUNI_R] is null

update [sde].[ROADCENTERLINES]
set [KDOT_COUNTY_L] = c.[KDOT_CountyNumStr]
from [sde].[ROADCENTERLINES] r
JOIN [sde].[COUNTYBOUNDARY] c on r.COUNTY_L = c.COUNTY
WHERE r.[KDOT_COUNTY_L] is null

update [sde].[ROADCENTERLINES]
set [KDOT_COUNTY_R] = c.[KDOT_CountyNumStr]
from [sde].[ROADCENTERLINES] r
JOIN [sde].[COUNTYBOUNDARY] c on r.COUNTY_R = c.COUNTY
WHERE r.[KDOT_COUNTY_R] is null

