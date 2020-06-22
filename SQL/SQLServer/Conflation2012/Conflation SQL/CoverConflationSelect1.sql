select Steward, SegID, routeid_1, orig_fid, invdir 
from geodev.sde.ConflationSegMidpointSJ 
WHERE join_count = 1

drop view vw_EndIntersection

create or replace view vw_EndIntersection as
select distinct e.orig_fid EndOrigFID, e.target_FID EndTargetID, e.join_FID EndJoinFID, e.intersection_ID endIntrID,  x.intersection_ID, x.on_route_id, x.on_route_measure
from geodev.sde.ConflationSegEndPtIntSJ e, geodev.sde.IM_INTXN_ROUTE_TABLE x
WHERE 1=1
AND e.intersection_ID = x.intersection_ID
order by on_route_id, on_route_measure

select * from vw_EndIntersection

drop view vw_BegIntersection

create or replace view vw_BegIntersection as
select distinct b.orig_fid BegOrigID, b.target_FID BegTargetID, b.join_FID BegJoinFID, b.intersection_ID begIntrID,  x.intersection_ID, x.on_route_id, x.on_route_measure
from geodev.sde.ConflationSegStartPtIntSJ b, geodev.sde.IM_INTXN_ROUTE_TABLE x
WHERE 1=1
AND b.intersection_ID = x.intersection_ID
order by on_route_id, on_route_measure

select * from vw_BegIntersection
where EndOrigID<1000

select m.con_surface, m.objectID, m.Steward, m.SegID, m.routeid_1, m.orig_fid, m.target_fid, m.join_fid, m.invdir, vb.on_route_measure BegMeas, ve.on_route_measure EndMeas
from geodev.sde.ConflationSegMidpointSJ m, vw_BegIntersection vb, vw_EndIntersection ve
WHERE 1=1
AND m.join_count = 1
AND m.orig_fid = ve.EndOrigfID
AND m.orig_fid = vb.BegOrigID
AND m.routeid_1 = vb.on_route_id
AND m.routeid_1 = ve.on_route_id
and m.invdir = 0
AND m.ObjectID <1000

drop view vw_SegConflation_ConSurface

create table sde.SegConflation_ConSurface as
select m.con_surface, m.objectID, m.Steward, m.SegID, m.routeid_1, m.orig_fid, m.target_fid, m.join_fid, m.invdir, vb.on_route_measure BegMeas, ve.on_route_measure EndMeas
from geodev.sde.ConflationSegMidpointSJ m, vw_BegIntersection vb, vw_EndIntersection ve
WHERE 1=1
AND m.join_count = 1
AND m.orig_fid = ve.EndOrigfID
AND m.orig_fid = vb.BegOrigID
AND m.routeid_1 = vb.on_route_id
AND m.routeid_1 = ve.on_route_id
AND m.invdir = '0'

Order By m.routeid_1, m.Steward, m.SegID


select Steward, SegID, orig_fid 
from geodev.sde.ConflationSegStartPt
WHERE join_count = 1
Order By Steward, SegID

select Steward, SegID, orig_fid 
from geodev.sde.ConflationSegEndPt






select
pt.Intersection_ID,  
tb.Intersection_ID,
tb.on_route_ID,
tb.on_route_measure
from geodev.sde.IM_INTERSECTION_POINT pt, geodev.sde.IM_INTXN_ROUTE_TABLE tb
where pt.Intersection_ID=tb.Intersection_ID
group by pt.Intersection_ID,  tb.Intersection_ID,tb.on_route_ID,tb.on_route_measure
order by tb.on_route_ID, tb.on_route_measure



Select * from 