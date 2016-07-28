use conflation

select [State_System_LRSKey],[Non_State_System_LRSKey], [KDOT_DIRECTION_CALC],[CountyKey1], [StateKey1] from sde.ROADCENTERLINES 
WHERE 1=1
AND ([KDOT_DIRECTION_CALC] = 1 OR [StateKey1] like '%SB' OR [StateKey1]  like '%WB')
AND [StateKey1] is not null

select [State_System_LRSKey],[Non_State_System_LRSKey],[MILEAGE_COUNTED], [KDOT_DIRECTION_CALC],[CountyKey1], [StateKey1] from sde.ROADCENTERLINES 
WHERE 1=1
AND [State_System_LRSKey] is not null and [Non_State_System_LRSKey] is not null 