USE Conflation

select * from sde.ROADCENTERLINES
where LRS_ROUTE_PREFIX is null

select * from sde.ROADCENTERLINES
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS is not null
and RDCLASS not like ' '
and STATUS = 'OPEN'

select * from sde.ROADCENTERLINES
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'LOCAL%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'L'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'LOCAL%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'A'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'ALLEY%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'A'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'ALLEY%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'P'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'PRIVATE%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'X'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null
and RDCLASS like 'RAMP%'
and STATUS = 'OPEN'

update sde.ROADCENTERLINES
set LRS_ROUTE_PREFIX = 'O'
where 
1 = 1
AND LRS_ROUTE_PREFIX is null



