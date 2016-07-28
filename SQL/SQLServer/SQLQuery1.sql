USE CANSYS_GIS_DEV

select * FROM CANSYS_GIS_DEV.shared.CMLRS

drop view SHARED.CountyHatch

SELECT CMLRS.LRS_KEY as LRSKEY, tblHund.Hundred as LOGMILE, 
CAST (ROW_NUMBER() OVER(ORDER BY CMLRS.LRS_KEY) AS int) as OBJECTID
FROM SHARED.CMLRS INNER JOIN SHARED.tblHund ON CMLRS.NE_NSG_REF = tblHund.NSE_J
GROUP BY CMLRS.LRS_KEY, tblHund.Hundred
HAVING (((tblHund.Hundred)<=Max([END_CNTY_LOGMILE])))

select TOP 10 * from SHARED.CountyHatch