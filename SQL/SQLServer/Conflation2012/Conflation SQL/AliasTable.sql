/****** Script for SelectTopNRows command from SSMS  ******/

use Conflation

SELECT substring(A_RD, 1, 1) as Indicator, 
ltrim(substring(A_RD, 2, 6)) 'Part2', 
PATINDEX('%[^0-9]%',ltrim(substring(A_RD, 2, 5))) 'Position of NonNumeric Character', 
[A_RD],
[KDOT_PREFIX],
[KDOT_CODE], 
[KDOT_ROUTENAME]
FROM [Conflation].[sde].[ROADALIAS] A
WHERE 1=1
AND substring(A_RD, 1, 1) in ('K', 'I', 'U') 
AND PATINDEX('%[^0-9]%',ltrim(substring(A_RD, 2, 5))) = 1

update [Conflation].[sde].[ROADALIAS] 
SET 
[KDOT_PREFIX] = substring(A_RD, 1, 1) ,
[KDOT_CODE] = ltrim(substring(A_RD, 2, 6)) 
WHERE 1=1
AND substring(A_RD, 1, 1) in ('K', 'I', 'U')
AND PATINDEX('%[^0-9]%',ltrim(substring(A_RD, 2, 5))) = 0

update [Conflation].[sde].[ROADALIAS] 
SET 
[KDOT_PREFIX] = substring(A_RD, 1, 1) ,
[KDOT_CODE] = ltrim(substring(A_RD, 3, 7)) 
WHERE 1=1
AND substring(A_RD, 1, 2) in ('US')
AND PATINDEX('%[^0-9]%',ltrim(substring(A_RD, 2, 5))) = 1
AND A_RD not like '%BUS'
AND A_RD not like '%ALT'

update [Conflation].[sde].[ROADALIAS] 
SET 
[KDOT_PREFIX] = substring(A_RD, 1, 1) ,
[KDOT_CODE] = concat(ltrim(substring(A_RD, 3, 2)), 'B') 
WHERE 1=1
AND substring(A_RD, 1, 2) in ('US')
AND PATINDEX('%[^0-9]%',ltrim(substring(A_RD, 2, 5))) = 1
AND A_RD like '%BUS'

