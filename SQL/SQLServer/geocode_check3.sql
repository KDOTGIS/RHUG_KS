/****** Script for SelectTopNRows command from SSMS  ******/
USE Safety
select [Status], count([Status]) cnt
from [dbo].[KDOT_PD_RD_INV_ON_DR_CNTY_PRD_RD_PD]
where [USER_COUNTY_NBR] in ('003','004','005','007','008','012','013','014','015','017','018','020','021','022','023','024','026','027','028','029','031','032','033','034','035','036','038','039','040','041','042','043','045','046','047','048','049','051','053','055','057','058','059','060','061','062','064','065','066','068','069','071','072','073','074','076','077','078','079','080','081','082','083','084','085','086','087','088','089','090','091','092','093','094','095','096','097','098','099','100','101','102','105')
group by [Status]


select [Status], count([Status]) cnt
from [dbo].[OF_PD_RDNAME_INV_ON_DR_CNTY_PRD_RD_PRIMARYDIR]
where [USER_COUNTY_NBR] in ('003','004','005','007','008','012','013','014','015','017','018','020','021','022','023','024','026','027','028','029','031','032','033','034','035','036','038','039','040','041','042','043','045','046','047','048','049','051','053','055','057','058','059','060','061','062','064','065','066','068','069','071','072','073','074','076','077','078','079','080','081','082','083','084','085','086','087','088','089','090','091','092','093','094','095','096','097','098','099','100','101','102','105')
group by [Status]


select [Status], count([Status]) cnt
from [dbo].[OF_PD_RDNAME_INV_ON_DR_CNTY_RD_PRIMARYDIR]
where [USER_COUNTY_NBR] in ('003','004','005','007','008','012','013','014','015','017','018','020','021','022','023','024','026','027','028','029','031','032','033','034','035','036','038','039','040','041','042','043','045','046','047','048','049','051','053','055','057','058','059','060','061','062','064','065','066','068','069','071','072','073','074','076','077','078','079','080','081','082','083','084','085','086','087','088','089','090','091','092','093','094','095','096','097','098','099','100','101','102','105')
group by [Status]