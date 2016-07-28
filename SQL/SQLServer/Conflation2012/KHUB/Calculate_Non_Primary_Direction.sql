USE Conflation

select r.[StateKey1], SUBSTRING(r.[StateKey1], 10, 2) AS ConfDirSt, r.[CountyKey1], SUBSTRING(r.[CountyKey1], 13, 2) AS ConfDirCn, r.[KDOT_DIRECTION_CALC] ,r.[GCID], n.[RID], SUBSTRING(n.[RID], 10, 2) as NPDIR, SUBSTRING(n.[CountyKey1],0,4) as JoinKey
from [sde].[ROADCENTERLINES] r
JOIN [sde].[NON_PRIMARY_DIVIDED_HIGHWAY] n 
on r.[GCID] = n.[GCID]
where 1=1 and r.[StateKey1]is not null

UPDATE [sde].[ROADCENTERLINES]
set [StateKey1]=n.[RID], [CountyKey1] = CONCAT(SUBSTRING(n.[CountyKey1],0,4), n.[RID]), [KDOT_DIRECTION_CALC]=1
from [sde].[ROADCENTERLINES] r
JOIN [sde].[NON_PRIMARY_DIVIDED_HIGHWAY] n 
on r.[GCID] = n.[GCID]
where 1=1 and r.[StateKey1]is not null