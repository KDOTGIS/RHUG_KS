/****** Script for SelectTopNRows command from SSMS  ******/
USE Conflation

UPDATE Conflation.sde.ROADCENTERLINES
SET [CountyKey1] = [Ramps_LRSKey]
WHERE 1=1
AND Ramps_LRSKey is not null

UPDATE Conflation.sde.ROADCENTERLINES
SET [CountyKey1] = [Non_State_System_LRSKey], [F_CNTY_1] = [NON_STATE_BEGIN_MP], [T_CNTY_1] = [NON_STATE_END_MP]
WHERE 1=1
AND [Non_State_System_LRSKey] is not null

UPDATE Conflation.sde.ROADCENTERLINES
SET [CountyKey1] = [State_System_LRSKey]
WHERE 1=1
AND [State_System_LRSKey] is not null

UPDATE Conflation.sde.ROADCENTERLINES
SET [StateKey1] = substring([State_System_LRSKey], 4, 12)
WHERE 1=1
AND [State_System_LRSKey] is not null

select * from Conflation.sde.ROADCENTERLINES
where [CountyKey1] is null

Select count(*) FROM Conflation.sde.ROADCENTERLINES
where [CountyKey1] is null