use Conflation

select * from [sde].[ROADALIAS_KDOT]
where [KDOT_LRS_PRIMARY_DIR] = '1'

select * from [sde].[ROADCENTERLINES] r
WHERE r.[KDOT_DIRECTION_CALC] not like '0'

update [Conflation].[sde].[ROADALIAS_KDOT]
set [KDOT_LRS_PRIMARY_DIR] = 0
WHERE 1=1

update [Conflation].[sde].[ROADALIAS_KDOT]
set [ROADALIAS_KDOT].[KDOT_LRS_PRIMARY_DIR] = '1'
from [sde].[ROADALIAS_KDOT] a
JOIN [sde].[ROADCENTERLINES] r on a.[SEGID] = r.[GCID]
WHERE r.[KDOT_DIRECTION_CALC] > 0