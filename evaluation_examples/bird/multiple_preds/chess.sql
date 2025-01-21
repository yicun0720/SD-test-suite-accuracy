SELECT MAX(CAST(`Free Meal Count (K-12)` AS REAL) / `Enrollment (K-12)`) FROM frpm WHERE `County Name` = 'Alameda'
SELECT T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)` AS EligibleFreeRate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsName = 'Continuation School' AND T2.`Enrollment (Ages 5-17)` > 0 AND T2.`Free Meal Count (Ages 5-17)` IS NOT NULL AND T2.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY EligibleFreeRate ASC LIMIT 3
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`District Name` = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.OpenDate > '2000-01-01' AND T1.FundingType = 'Directly funded' AND T1.Charter = 1 AND T2.`Charter School (Y/N)` = 1
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath < 400 AND T1.Virtual = 'F'
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T2.NumTstTakr FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`FRPM Count (K-12)` = (SELECT MAX(`FRPM Count (K-12)`) FROM frpm)
SELECT COUNT(T1.cds) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.FundingType = 'Charter'
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL)
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(CAST(T2.`Free Meal Count (Ages 5-17)` AS REAL) / T2.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 * 100 / T1.NumTstTakr > 30 AND T2.`Enrollment (Ages 5-17)` IS NOT NULL AND T2.`Free Meal Count (Ages 5-17)` IS NOT NULL
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Alameda' AND T1.StatusType = 'Merged' AND T2.NumTstTakr < 100
SELECT T2.CharterNum FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrWrite = 499
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(CDSCode) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'
SELECT COUNT(CDSCode) FROM frpm WHERE `Free Meal Count (K-12)` > 500 AND `FRPM Count (K-12)` < 700 AND `County Name` = 'Los Angeles'
SELECT T2.sname FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.cname = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT T1.`School Name`, T2.Street FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30
SELECT T3.School FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T1.NumGE1500 > 0
SELECT DISTINCT T1.CDSCode, T1.FundingType FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Riverside' AND T2.AvgScrMath > 400
SELECT T2.`School Name`, T1.Street, T1.City, T1.Zip, T1.State FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`FRPM Count (Ages 5-17)` > 800 AND T1.County = 'Monterey' AND T2.`School Type` = 'High School'
SELECT T1.School, T2.AvgScrWrite, T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE STRFTIME('%Y', T1.OpenDate) > '1991' OR STRFTIME('%Y', T1.ClosedDate) < '2000'
SELECT T2.School, T2.DOCType FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded' AND T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > ( SELECT AVG(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded' )
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSserved = 'K-12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T2.`Free Meal Count (K-12)` / T2.`Enrollment (K-12)` AS Eligible_Free_Rate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` IS NOT NULL ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 10, 2
SELECT T2.`FRPM Count (K-12)` / T2.`Enrollment (K-12)` AS Eligible_FRPM_Rate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = 66 AND T2.`Enrollment (K-12)` IS NOT NULL ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT CAST(T2.`Free Meal Count (Ages 5-17)` AS REAL) / T2.`Enrollment (Ages 5-17)` AS FreeRate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Kacey' AND T1.AdmLName1 = 'Gibson' AND T2.`Free Meal Count (Ages 5-17)` IS NOT NULL AND T2.`Enrollment (Ages 5-17)` IS NOT NULL
SELECT T2.AdmEmail1 FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter School (Y/N)` = 1 AND T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 1
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 AND T1.NumGE1500 IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT T1.Website FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumTstTakr BETWEEN 2000 AND 3000 AND T1.County = 'Los Angeles'
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND STRFTIME('%Y', T1.OpenDate) = '1980'
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.District = 'Fresno Unified' AND T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT T1.CDSCode FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' AND T2.AvgScrRead IS NOT NULL ORDER BY T2.AvgScrRead DESC LIMIT 5
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT T2.AvgScrMath, T1.County FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath IS NOT NULL AND T2.AvgScrRead IS NOT NULL AND T2.AvgScrWrite IS NOT NULL ORDER BY T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite ASC LIMIT 1
SELECT T2.AvgScrWrite, T1.City FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 IS NOT NULL )
SELECT T1.School, T2.AvgScrWrite FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.AdmFName1 = 'Ricci' AND T1.AdmLName1 = 'Ulrich'
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = '31' AND T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1
SELECT CAST(COUNT(CDSCode) AS REAL) / 12 FROM schools WHERE County = 'Alameda' AND DOC = 52 AND strftime('%Y', OpenDate) = '1980'
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange' AND StatusType = 'Merged'
SELECT T1.County, T1.School, T1.ClosedDate FROM schools T1 WHERE T1.StatusType = 'Closed' AND T1.County = (SELECT T2.County FROM schools T2 WHERE T2.StatusType = 'Closed' GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 5, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT COUNT(T1.cds) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.MailCity = 'Lakeport' AND T1.AvgScrRead + T1.AvgScrMath + T1.AvgScrWrite >= 1500
SELECT SUM(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'
SELECT School, MailZip FROM schools WHERE AdmFName2 = 'Avetik' AND AdmLName2 = 'Atoian'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'
SELECT COUNT(CDSCode) FROM schools WHERE MailState = 'CA' AND County = 'San Joaquin' AND StatusType = 'Active'
SELECT T1.Phone, T1.Ext FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrWrite IS NOT NULL ORDER BY T2.AvgScrWrite DESC LIMIT 332, 1
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT Website FROM schools WHERE (AdmFName1 = 'Mike' AND AdmLName1 = 'Larson') OR (AdmFName1 = 'Dante' AND AdmLName1 = 'Alvarez')
SELECT Website FROM schools WHERE Virtual = 'P' AND Charter = 1 AND County = 'San Joaquin'
SELECT COUNT(CDSCode) FROM schools WHERE Charter = 1 AND City = 'Hickman' AND DOC = 52
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Los Angeles' AND T1.Charter = 0 AND T2.`Percent (%) Eligible Free (K-12)` < 0.18
SELECT AdmFName1, AdmLName1, School, City FROM schools WHERE CharterNum = '00D2' AND Charter = 1
SELECT COUNT(*) FROM schools WHERE MailCity = 'Hickman' AND CharterNum = '00D4'
SELECT CAST(SUM(CASE WHEN FundingType = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(FundingType) FROM schools WHERE County = 'Santa Clara'
SELECT COUNT(CDSCode) FROM schools WHERE FundingType = 'Directly funded' AND County = 'Stanislaus' AND OpenDate BETWEEN '2000-01-01' AND '2005-12-31'
SELECT COUNT(CDSCode) FROM schools WHERE City = 'San Francisco' AND EdOpsCode = 'CCD' AND STRFTIME('%Y', ClosedDate) = '1989'
SELECT County FROM schools WHERE SOC = 11 AND ClosedDate BETWEEN '1980-01-01' AND '1989-12-31' GROUP BY County ORDER BY COUNT(County) DESC LIMIT 1
SELECT NCESDist FROM schools WHERE SOC = 31
SELECT SUM(CASE WHEN StatusType = 'Active' THEN 1 ELSE 0 END) AS numActive, SUM(CASE WHEN StatusType = 'Closed' THEN 1 ELSE 0 END) AS numClosed FROM schools WHERE County = 'Alpine' AND EdOpsName = 'Community Day School'
SELECT DOC FROM schools WHERE City = 'Fresno' AND Magnet = 0
SELECT SUM(T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Academic Year` = '2014-2015' AND T2.City = 'Fremont' AND T2.EdOpsCode = 'SSS'
SELECT T2.`FRPM Count (Ages 5-17)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsName = 'Youth Authority School' AND T1.MailStrAbr = 'PO Box 1040'
SELECT GSserved FROM schools WHERE EdOpsCode = 'SPECON' AND NCESDist = '613360'
SELECT T1.EILName, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`County Code` = '37' AND T2.`NSLP Provision Status` = 'Breakfast Provision 2'
SELECT T1.City FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Merced' AND T1.EILCode = 'HS' AND T2.`NSLP Provision Status` = 'Lunch Provision 2' AND T2.`Low Grade` = '9' AND T2.`High Grade` = '12'
SELECT T1.CDSCode, T2.`Percent (%) Eligible FRPM (Ages 5-17)` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.County = 'Los Angeles' AND T1.GSserved = 'K-09'
SELECT GSserved FROM schools WHERE City = 'Adelanto' GROUP BY GSserved ORDER BY COUNT(GSserved) DESC LIMIT 1
SELECT County, COUNT(CDSCode) FROM schools WHERE Virtual = 'F' AND (County = 'San Diego' OR County = 'Santa Barbara') GROUP BY County ORDER BY COUNT(CDSCode) DESC LIMIT 1
SELECT T2.`School Type`, T1.School, T1.Latitude FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.Latitude DESC LIMIT 1
SELECT T1.City, T2.`Low Grade`, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.State = 'CA' ORDER BY T1.Latitude LIMIT 1
SELECT GSoffered FROM schools WHERE Longitude = ( SELECT MAX(Longitude) FROM schools )
SELECT City, COUNT(School) FROM schools WHERE GSoffered = 'K-8' AND Magnet = 1 GROUP BY City
SELECT AdmFName, District, COUNT(*) AS NameCount FROM (SELECT AdmFName1 AS AdmFName, District FROM schools WHERE AdmFName1 IS NOT NULL UNION ALL SELECT AdmFName2, District FROM schools WHERE AdmFName2 IS NOT NULL UNION ALL SELECT AdmFName3, District FROM schools WHERE AdmFName3 IS NOT NULL) GROUP BY AdmFName, District ORDER BY NameCount DESC LIMIT 2
SELECT T2.`Percent (%) Eligible Free (K-12)`, T1.DOC AS `District Code` FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.AdmFName1 = 'Alusine'
SELECT AdmLName1, District, County, School FROM schools WHERE CharterNum = '40'
SELECT AdmEmail1 FROM schools WHERE County = 'San Bernardino' AND District = 'San Bernardino City Unified' AND OpenDate BETWEEN '2009-01-01' AND '2010-12-31' AND (SOC = 62 OR DOC = 54)
SELECT T2.AdmEmail1, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'Prague'
SELECT AVG(A12), AVG(A13) FROM district
SELECT COUNT(DISTINCT T2.district_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A11 BETWEEN 6000 AND 10000 AND T1.gender = 'F'
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'M' AND T2.A3 = 'north Bohemia' AND T2.A11 > 8000
SELECT T3.account_id, (SELECT MAX(T4.A11) FROM district AS T4) - MIN(T4.A11) AS salary_gap FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T1.district_id = T4.district_id WHERE T1.gender = 'F' GROUP BY T3.account_id ORDER BY T1.birth_date ASC LIMIT 1
SELECT T1.account_id FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T1.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id ORDER BY T2.birth_date DESC, T4.A11 DESC LIMIT 1
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'OWNER'
SELECT T2.client_id FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.type = 'Disponent'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1997%' AND T1.frequency = 'POPLATEK TYDNE' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND STRFTIME('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' AND T1.birth_date < '1950-01-01' AND T2.A2 = 'Sokolov'
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.balance > 3000
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE STRFTIME('%Y', T1.issued) = '1994' AND STRFTIME('%m', T1.issued) = '03' AND STRFTIME('%d', T1.issued) = '03'
SELECT T1.date FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.amount = 840 AND T2.date = '1998-10-14'
SELECT T2.district_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.date = '1994-08-25'
SELECT MAX(T3.amount) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.issued = '1996-10-21'
SELECT T4.gender FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id ORDER BY T2.A11 DESC, T4.birth_date ASC LIMIT 1
SELECT T4.amount FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id INNER JOIN trans AS T4 ON T1.account_id = T4.account_id WHERE T2.amount = (SELECT MAX(amount) FROM loan) ORDER BY T4.date LIMIT 1
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T2.account_id = T3.account_id INNER JOIN client AS T4 ON T3.client_id = T4.client_id WHERE T1.A2 = 'Jesenik' AND T4.gender = 'F'
SELECT T2.disp_id FROM trans AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.amount = 5100 AND T1.date = '1998-09-02'
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Litomerice' AND STRFTIME('%Y', T2.date) = '1996'
SELECT T4.A2 FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T1.gender = 'F' AND T1.birth_date = '1976-01-29'
SELECT T3.birth_date FROM disp AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.amount = 98832 AND T2.date = '1996-01-03'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'Prague' ORDER BY T1.date ASC LIMIT 1
SELECT CAST(SUM(IIF(T2.gender = 'M', 1, 0)) AS REAL) * 100 / COUNT(T2.gender) AS percentage_male_clients FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T1.A3 = 'south Bohemia' GROUP BY T1.district_id ORDER BY T1.A4 DESC LIMIT 1
SELECT ((balance_1998 - balance_1993) / balance_1993) * 100 AS increase_rate FROM (SELECT (SELECT T2.balance FROM trans AS T2 WHERE T2.account_id = T1.account_id AND T2.date = '1998-12-27' ORDER BY T2.date DESC LIMIT 1) AS balance_1998, (SELECT T2.balance FROM trans AS T2 WHERE T2.account_id = T1.account_id AND T2.date = '1993-03-22' ORDER BY T2.date DESC LIMIT 1) AS balance_1993 FROM loan AS T1 WHERE T1.date = '1993-07-05' LIMIT 1)
SELECT CAST(SUM(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / SUM(amount) AS percentage_paid_no_issue FROM loan
SELECT CAST(SUM(CASE WHEN status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(account_id) FROM loan WHERE amount < 100000
SELECT T1.account_id, T2.A2 AS district_name, T2.A3 AS district_region FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.date LIKE '1993%' AND T1.frequency = 'POPLATEK PO OBRATU'
SELECT T1.account_id, T1.frequency FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND STRFTIME('%Y', T1.date) BETWEEN '1995' AND '2000'
SELECT T1.account_id, T1.date FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Prachatice'
SELECT T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.loan_id = 4990
SELECT T1.account_id, T3.A2, T3.A3 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 300000
SELECT T1.loan_id, T3.A2, T3.A11 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.duration = 60
SELECT T2.district_id, (T3.A13 - T3.A12) * 100 / T3.A12 AS unemployment_rate_increment FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'D' AND T3.A12 IS NOT NULL
SELECT CAST(SUM(CASE WHEN T1.date LIKE '1993%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Decin'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE'
SELECT T2.A2, COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T1.gender = 'F' GROUP BY T2.A2 ORDER BY COUNT(T1.client_id) DESC LIMIT 10
SELECT T2.amount, T3.A2 FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T1.district_id = T3.district_id WHERE T2.type = 'VYDAJ' AND T2.date LIKE '1996-01%' ORDER BY T2.amount DESC LIMIT 10
SELECT COUNT(DISTINCT T3.account_id) FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.A3 = 'south Bohemia' AND T3.account_id NOT IN (SELECT T4.account_id FROM card AS T4)
SELECT T3.A2 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'C' OR T1.status = 'D' GROUP BY T3.A2 ORDER BY COUNT(T1.loan_id) DESC LIMIT 1
SELECT AVG(T3.amount) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M'
SELECT A2 FROM district WHERE A13 = ( SELECT MAX(A13) FROM district )
SELECT COUNT(T2.account_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A16 = ( SELECT MAX(A16) FROM district )
SELECT COUNT(DISTINCT T1.account_id) FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T2.operation = 'VYBER KARTOU' AND T1.frequency = 'POPLATEK MESICNE' AND T2.balance < 0
SELECT COUNT(T1.loan_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.amount >= 250000 AND T2.frequency = 'POPLATEK MESICNE' AND T1.date BETWEEN '1995-01-01' AND '1997-12-31'
SELECT COUNT(T1.account_id) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.district_id = 1 AND T1.status IN ('C', 'D')
SELECT COUNT(*) FROM client AS T2 WHERE T2.gender = 'M' AND T2.district_id = (SELECT T1.district_id FROM district AS T1 WHERE T1.A15 IS NOT NULL ORDER BY T1.A15 DESC LIMIT 1 OFFSET 1)
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'gold' AND T2.type = 'disponent'
SELECT COUNT(T2.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Pisek'
SELECT DISTINCT T3.A2 FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.amount > 10000 AND strftime('%Y', T1.date) = '1997'
SELECT T1.account_id FROM `order` AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T3.A2 = 'Pisek' AND T1.k_symbol = 'SIPO'
SELECT T2.account_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type IN ('gold', 'junior') GROUP BY T2.account_id HAVING COUNT(DISTINCT T1.type) > 1
SELECT AVG(amount) FROM trans WHERE STRFTIME('%Y', date) = '2021' AND operation = 'VYBER KARTOU'
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1998' AND operation = 'VYBER KARTOU' GROUP BY account_id HAVING SUM(amount) < ( SELECT CAST(SUM(amount) AS REAL) / 12 FROM trans WHERE STRFTIME('%Y', date) = '1998' AND operation = 'VYBER KARTOU' )
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T2.disp_id = T3.disp_id INNER JOIN loan AS T4 ON T2.account_id = T4.account_id WHERE T1.gender = 'F'
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'south Bohemia' AND T1.gender = 'F'
SELECT T1.account_id FROM account AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id INNER JOIN disp AS T3 ON T1.account_id = T3.account_id WHERE T2.A2 = 'Tabor' AND T3.type = 'OWNER'
SELECT T1.type, T3.A11 FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.type != 'OWNER' AND T3.A11 BETWEEN 8000 AND 9000
SELECT COUNT(DISTINCT T2.account_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.A3 = 'north Bohemia' AND T3.bank = 'AB'
SELECT DISTINCT T1.A2 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T3.type = 'VYDAJ'
SELECT CAST(SUM(T1.A15) AS REAL) / COUNT(DISTINCT T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A15 > 4000 AND T2.date >= '1997-01-01'
SELECT COUNT(T1.card_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'classic' AND T2.type = 'OWNER'
SELECT COUNT(T1.gender) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A2 = 'Hl.m. Praha' AND T1.gender = 'M'
SELECT CAST(SUM(CASE WHEN issued < '1998-01-01' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(card_id) FROM card WHERE type = 'gold'
SELECT T2.client_id FROM loan AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T2.type = 'OWNER' ORDER BY T1.amount DESC LIMIT 1
SELECT T1.A15 FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T2.account_id = 532
SELECT T2.district_id FROM "order" AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 33333
SELECT T3.date, T3.amount, T3.balance FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T1.account_id = T3.account_id WHERE T1.client_id = 3356 AND T3.operation = 'VYBER'
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.amount < 200000
SELECT T3.type FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T1.disp_id = T3.disp_id WHERE T2.client_id = 13539
SELECT T1.A3 FROM district AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id WHERE T2.client_id = 3541
SELECT T3.A2 FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T1.status = 'A' GROUP BY T3.A2 ORDER BY COUNT(T1.account_id) DESC LIMIT 1
SELECT T2.client_id FROM `order` AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.order_id = 32423
SELECT T1.account_id, T2.trans_id, T2.date, T2.type, T2.operation, T2.k_symbol FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.district_id = 5
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Jesenik'
SELECT T2.client_id FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id WHERE T1.type = 'junior' AND T1.issued >= '1997-01-01'
SELECT CAST(SUM(CASE WHEN T1.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A11 > 10000
SELECT (SUM(CASE WHEN STRFTIME('%Y', T3.date) = '1997' THEN T3.amount ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T3.date) = '1996' THEN T3.amount ELSE 0 END)) * 100.0 / SUM(CASE WHEN STRFTIME('%Y', T3.date) = '1996' THEN T3.amount ELSE 0 END) AS growth_rate FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M'
SELECT COUNT(trans_id) FROM trans WHERE STRFTIME('%Y', date) > '1995' AND operation = 'VYBER KARTOU'
SELECT SUM(CASE WHEN A3 = 'east Bohemia' THEN A16 ELSE 0 END) - SUM(CASE WHEN A3 = 'north Bohemia' THEN A16 ELSE 0 END) FROM district
SELECT COUNT(disp_id) FROM disp WHERE account_id BETWEEN 1 AND 10 AND type IN ('OWNER', 'DISPONENT')
SELECT COUNT(*) FROM trans T1 WHERE T1.account_id = 3 AND T1.k_symbol = 'statement' UNION ALL SELECT COUNT(*) FROM trans T2 WHERE T2.account_id = 3 AND T2.amount = 3539 AND T2.k_symbol = 'payment'
SELECT strftime('%Y', T3.birth_date) AS birth_year FROM disp AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id INNER JOIN client AS T3 ON T1.client_id = T3.client_id WHERE T2.account_id = 130
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK PO OBRATU' AND T2.type = 'OWNER'
SELECT SUM(T3.amount) AS total_debt, T3.status FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 992 GROUP BY T3.status
SELECT T1.gender, T3.balance FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T2.client_id = 4 AND T3.trans_id = 851
SELECT T3.type FROM disp AS T1 INNER JOIN client AS T2 ON T1.client_id = T2.client_id INNER JOIN card AS T3 ON T1.disp_id = T3.disp_id WHERE T2.client_id = 9
SELECT SUM(T3.amount) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN trans AS T3 ON T2.account_id = T3.account_id WHERE T1.client_id = 617 AND STRFTIME('%Y', T3.date) = '1998'
SELECT T1.client_id FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND T1.birth_date BETWEEN '1983-01-01' AND '1987-12-31'
SELECT T1.client_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN loan AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'F' ORDER BY T3.amount DESC LIMIT 3
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN `order` AS T3 ON T2.account_id = T3.account_id WHERE T1.gender = 'M' AND T3.k_symbol = 'SIPO' AND T3.amount > 4000 AND STRFTIME('%Y', T1.birth_date) BETWEEN '1974' AND '1976'
SELECT COUNT(T1.district_id) FROM district AS T1 INNER JOIN account AS T2 ON T1.district_id = T2.district_id WHERE T1.A2 = 'Beroun' AND STRFTIME('%Y', T2.date) > '1996'
SELECT COUNT(T1.disp_id) FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'junior' AND T3.gender = 'F'
SELECT CAST(SUM(IIF(T1.gender = 'F', 1, 0)) AS REAL) * 100 / COUNT(T1.gender) FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id INNER JOIN district AS T4 ON T3.district_id = T4.district_id WHERE T4.A3 = 'Prague'
SELECT CAST(SUM(CASE WHEN T1.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.gender) AS percentage FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id INNER JOIN account AS T3 ON T2.account_id = T3.account_id WHERE T3.frequency = 'POPLATEK TYDNE'
SELECT COUNT(T2.client_id) FROM account AS T1 INNER JOIN disp AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.type = 'USER'
SELECT T1.account_id FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T1.duration > 24 AND T2.date < '1997-01-01' ORDER BY T1.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN client AS T2 ON T1.district_id = T2.district_id INNER JOIN district AS T3 ON T2.district_id = T3.district_id WHERE T2.gender = 'F' ORDER BY T2.birth_date ASC, T3.A11 ASC LIMIT 1
SELECT COUNT(T1.client_id) FROM client AS T1 INNER JOIN district AS T2 ON T1.district_id = T2.district_id WHERE T2.A3 = 'east Bohemia' AND STRFTIME('%Y', T1.birth_date) = '1920'
SELECT COUNT(T1.account_id) FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T1.frequency = 'POPLATEK TYDNE' AND T2.duration = 24
SELECT AVG(T1.amount) FROM loan AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE T2.frequency = 'POPLATEK PO OBRATU' AND T1.status IN ('C', 'D')
SELECT T1.client_id, T1.district_id FROM client AS T1 INNER JOIN disp AS T2 ON T1.client_id = T2.client_id WHERE T2.type = 'OWNER'
SELECT T1.disp_id, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T3.birth_date) AS age FROM card AS T1 INNER JOIN disp AS T2 ON T1.disp_id = T2.disp_id INNER JOIN client AS T3 ON T2.client_id = T3.client_id WHERE T1.type = 'gold'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' AND T2.element = 'cl'
SELECT AVG(oxygen_count) FROM (SELECT COUNT(CASE WHEN T2.element = 'o' THEN 1 ELSE NULL END) AS oxygen_count FROM bond AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' GROUP BY T1.molecule_id)
SELECT CAST(SUM(CASE WHEN T2.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / COUNT(DISTINCT T1.molecule_id) AS average FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'na' AND T2.label = '-'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '+'
SELECT CAST(SUM(CASE WHEN T1.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 INNER JOIN connected AS T3 ON T1.atom_id = T3.atom_id INNER JOIN bond AS T2 ON T3.bond_id = T2.bond_id WHERE T2.bond_type = '='
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(atom_id) FROM atom WHERE element != 'br'
SELECT COUNT(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT molecule_id FROM atom WHERE element = 'si'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR004_8_9'
SELECT DISTINCT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '='
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'Te'
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '-'
SELECT T3.atom_id, T3.atom_id2 FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id WHERE T1.label = '-'
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T2.element ORDER BY COUNT(T2.element) ASC LIMIT 1
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR004_8' AND T1.atom_id2 = 'TR004_20'
SELECT DISTINCT T2.label FROM molecule AS T2 WHERE T2.molecule_id NOT IN (SELECT T1.molecule_id FROM atom AS T1 WHERE T1.element = 'Sn')
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' AND T1.element IN ('i', 's')
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT DISTINCT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.molecule_id = 'TR181'
SELECT (1 - CAST(SUM(CASE WHEN T2.element = 'f' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.molecule_id)) * 100 AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT CAST(SUM(CASE WHEN T2.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.bond_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR001' AND T1.bond_id = 'TR001_2_6'
SELECT SUM(IIF(label = '+', 1, 0)) - SUM(IIF(label = '-', 1, 0)) AS diff FROM molecule
SELECT atom_id, atom_id2 FROM connected WHERE bond_id = 'TR_000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '=' ORDER BY T1.molecule_id ASC LIMIT 5
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percentage FROM bond WHERE molecule_id = 'TR008'
SELECT CAST(SUM(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(molecule_id) AS percent FROM molecule
SELECT CAST(SUM(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(atom_id) FROM atom WHERE molecule_id = 'TR206'
SELECT bond_type FROM bond WHERE molecule_id = 'TR000'
SELECT T2.element, T1.label FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR060'
SELECT T2.bond_type, T1.label FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR018' GROUP BY T2.bond_type ORDER BY COUNT(T2.bond_type) DESC LIMIT 1
SELECT DISTINCT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '-' AND T1.label = '-' ORDER BY T1.molecule_id ASC LIMIT 3
SELECT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id LIMIT 2
SELECT COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.molecule_id = 'TR009' AND (T2.atom_id = 'TR009_12' OR T2.atom_id2 = 'TR009_12')
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'br' AND T1.label = '+'
SELECT T1.bond_type, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR001_6_9'
SELECT T1.molecule_id, T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_10'
SELECT COUNT(DISTINCT molecule_id) FROM bond WHERE bond_type = '#'
SELECT COUNT(bond_id) FROM connected WHERE atom_id LIKE 'TR%_19' OR atom_id2 LIKE 'TR%_19'
SELECT element FROM atom WHERE molecule_id = 'TR004'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '-'
SELECT DISTINCT T2.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND SUBSTR(T1.atom_id, 7, 2) BETWEEN '21' AND '25'
SELECT T2.bond_id FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element IN ('p', 'n')
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' GROUP BY T2.molecule_id ORDER BY COUNT(T1.bond_type) DESC LIMIT 1
SELECT CAST(COUNT(T2.bond_id) AS REAL) / COUNT(DISTINCT T1.atom_id) AS average_bonds FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'
SELECT T2.bond_type, T2.bond_id FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE SUBSTR(T1.atom_id, 7, 2) = '45'
SELECT DISTINCT T1.element FROM atom AS T1 LEFT JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T2.atom_id IS NULL AND T1.element IN ('cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca')
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.molecule_id = 'TR447' AND T2.bond_type = '#'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR144_8_19'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.bond_type = '=' GROUP BY T1.molecule_id ORDER BY COUNT(T1.molecule_id) DESC LIMIT 1
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T2.element ORDER BY COUNT(T2.element) ASC LIMIT 1
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'pb'
SELECT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '#'
WITH ElementCombination AS (     SELECT T1.element AS element1, T2.element AS element2     FROM atom AS T1     INNER JOIN connected AS C ON T1.atom_id = C.atom_id     INNER JOIN atom AS T2 ON C.atom_id2 = T2.atom_id ), MostCommonCombination AS (     SELECT element1, element2, COUNT(*) AS combo_count     FROM ElementCombination     GROUP BY element1, element2     ORDER BY combo_count DESC     LIMIT 1 ), TotalBonds AS (     SELECT COUNT(*) AS total_bonds     FROM bond ), BondsInCommonCombination AS (     SELECT COUNT(*) AS common_bonds     FROM connected AS C     INNER JOIN atom AS A1 ON C.atom_id = A1.atom_id     INNER JOIN atom AS A2 ON C.atom_id2 = A2.atom_id     INNER JOIN MostCommonCombination AS MCC ON A1.element = MCC.element1 AND A2.element = MCC.element2 ) SELECT CAST(common_bonds AS REAL) * 100 / total_bonds AS percentage FROM TotalBonds, BondsInCommonCombination;
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) AS proportion FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-'
SELECT COUNT(atom_id) FROM atom WHERE element IN ('c', 'h')
SELECT T2.atom_id2 FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 's'
SELECT T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'sn'
SELECT COUNT(DISTINCT T2.element) FROM atom AS T2 INNER JOIN bond AS T1 ON T2.molecule_id = T1.molecule_id WHERE T1.bond_type = '-' GROUP BY T2.molecule_id HAVING COUNT(DISTINCT T1.bond_type) = 1
SELECT COUNT(DISTINCT T1.bond_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '#' AND (T3.element = 'p' OR T3.element = 'br')
SELECT T2.bond_id FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT DISTINCT T1.molecule_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.atom_id) AS percentage FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR030'
SELECT T2.bond_type FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id LIKE 'TR0%' AND T1.molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_10_11'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'i'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca' GROUP BY T2.label ORDER BY COUNT(T2.label) DESC LIMIT 1
SELECT IIF(SUM(IIF(T3.element = 'cl', 1, 0)) > 0 AND SUM(IIF(T3.element = 'c', 1, 0)) > 0, 'YES', 'NO') AS YORN FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_1_8'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN bond AS T3 ON T1.molecule_id = T3.molecule_id WHERE T2.element = 'c' AND T3.bond_type = '#' AND T1.label = '-' LIMIT 2
SELECT CAST(SUM(CASE WHEN T1.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001'
SELECT molecule_id FROM bond WHERE bond_type = '='
SELECT T1.atom_id, T1.atom_id2 FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T2.bond_type = '#'
SELECT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_id = 'TR005_16_26'
SELECT COUNT(T1.molecule_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '-' AND T2.label = '-'
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_10_11'
SELECT T1.bond_id, T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#'
SELECT T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND SUBSTR(T2.atom_id, 7, 1) = '4'
SELECT CAST(SUM(CASE WHEN T1.element = 'H' THEN 1 ELSE 0 END) AS REAL) / COUNT(T1.element), T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR006'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'ca'
SELECT T3.bond_type FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'te'
SELECT DISTINCT T1.element FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id OR T1.atom_id = T2.atom_id2 WHERE T2.bond_id = 'TR001_10_11'
SELECT CAST(COUNT(DISTINCT T1.molecule_id) AS REAL) * 100 / (SELECT COUNT(*) FROM molecule) AS percentage FROM bond AS T1 WHERE T1.bond_type = '#'
SELECT CAST(SUM(CASE WHEN bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(bond_id) AS percent FROM bond WHERE molecule_id = 'TR047'
SELECT T2.label FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR001_1'
SELECT CASE WHEN label = '+' THEN 'YES' ELSE 'NO' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR151'
SELECT element FROM atom WHERE molecule_id = 'TR151'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE element = 'c' AND substr(molecule_id, 3, 3) BETWEEN 10 AND 49
SELECT COUNT(T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.bond_id FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.label = '+' AND T1.bond_type = '='
SELECT COUNT(T2.atom_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'H' AND T1.label = '+'
SELECT T1.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_id = 'TR00_1_2' AND T2.atom_id = 'TR00_1'
SELECT T1.atom_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) AS percentage FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'h'
SELECT CASE WHEN label = '+' THEN 'YES' ELSE 'NO' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR124'
SELECT element FROM atom WHERE molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(T1.bond_id), T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '=' AND T2.molecule_id = 'TR006'
SELECT T1.molecule_id, T2.element FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT T1.bond_id, T2.atom_id, T2.atom_id2 FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id WHERE T1.bond_type = '-'
SELECT DISTINCT T2.molecule_id, T1.element FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.bond_type = '#' ORDER BY T2.molecule_id, T1.element
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR000_2_3'
SELECT COUNT(DISTINCT T2.bond_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id WHERE T1.element = 'cl'
SELECT T1.atom_id, COUNT(DISTINCT T3.bond_type) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.molecule_id = 'TR346' GROUP BY T1.atom_id
SELECT COUNT(DISTINCT T1.molecule_id) AS total_molecules, SUM(CASE WHEN T2.label = '+' THEN 1 ELSE 0 END) AS carcinogenic_molecules FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '='
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 WHERE NOT EXISTS (SELECT 1 FROM atom AS T2 WHERE T2.molecule_id = T1.molecule_id AND T2.element = 's') AND NOT EXISTS (SELECT 1 FROM bond AS T3 WHERE T3.molecule_id = T1.molecule_id AND T3.bond_type = '=')
SELECT T2.label FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_id = 'TR001_2_4'
SELECT COUNT(atom_id) FROM atom WHERE molecule_id = 'TR005'
SELECT COUNT(bond_id) FROM bond WHERE bond_type = '-'
SELECT DISTINCT T1.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'cl' AND T2.label = '+'
SELECT T1.molecule_id FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.element = 'c' AND T2.label = '-'
SELECT CAST(SUM(CASE WHEN T2.element = 'Cl' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT COUNT(DISTINCT T3.element) FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_id = 'TR001_3_4'
SELECT T2.bond_type FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id WHERE T1.atom_id = 'TR000_1' AND T1.atom_id2 = 'TR000_2'
SELECT molecule_id FROM atom WHERE atom_id IN ('TR000_2', 'TR000_4')
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT CASE WHEN label = '+' THEN 'Yes' ELSE 'No' END AS is_carcinogenic FROM molecule WHERE molecule_id = 'TR000'
SELECT CAST(SUM(CASE WHEN T1.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.bond_id) FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T2.element = 'n' AND T1.label = '+'
SELECT T3.molecule_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '=' AND T3.element = 's'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '-' GROUP BY T1.molecule_id HAVING COUNT(T1.molecule_id) > 5
SELECT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T3.atom_id = T1.atom_id WHERE T2.bond_type = '=' AND T2.molecule_id = 'TR024'
SELECT T1.molecule_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' GROUP BY T1.molecule_id ORDER BY COUNT(T2.atom_id) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.molecule_id) AS percentage FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id INNER JOIN connected AS T3 ON T2.atom_id = T3.atom_id INNER JOIN bond AS T4 ON T3.bond_id = T4.bond_id WHERE T2.element = 'h' AND T4.bond_type = '#'
SELECT COUNT(molecule_id) FROM molecule WHERE label = '+'
SELECT COUNT(DISTINCT T1.molecule_id) FROM molecule AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id BETWEEN 'TR004' AND 'TR010' AND T2.bond_type = '-'
SELECT COUNT(atom_id) FROM atom WHERE element = 'c' AND molecule_id = 'TR008'
SELECT T1.element FROM atom AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.atom_id = 'TR004_7' AND T2.label = '-'
SELECT COUNT(DISTINCT T1.molecule_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T1.element = 'o' AND T3.bond_type = '='
SELECT COUNT(DISTINCT T1.molecule_id) FROM bond AS T1 INNER JOIN molecule AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.bond_type = '#' AND T2.label = '-'
SELECT T1.element, T2.bond_type FROM atom AS T1 INNER JOIN bond AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.molecule_id = 'TR016'
SELECT T3.atom_id FROM bond AS T1 INNER JOIN connected AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T2.atom_id = T3.atom_id WHERE T1.bond_type = '=' AND T3.element = 'c' AND T3.molecule_id = 'TR012'
SELECT T2.atom_id FROM molecule AS T1 INNER JOIN atom AS T2 ON T1.molecule_id = T2.molecule_id WHERE T1.label = '+' AND T2.element = 'o'
SELECT name FROM cards WHERE cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE borderColor = 'borderless' AND cardKingdomFoilId IS NULL AND cardKingdomId IS NOT NULL
SELECT name FROM cards WHERE faceConvertedManaCost = (SELECT MAX(faceConvertedManaCost) FROM cards)
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100
SELECT T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.format = 'gladiator' AND T2.status = 'Banned'
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Artifact' AND T1.side IS NULL AND T2.format = 'vintage'
SELECT T1.id, T1.artist FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'commander' AND T2.status = 'Legal' AND (T1.power = '*' OR T1.power IS NULL)
SELECT T1.uuid, T2.text, T1.hasContentWarning FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Stephen Daniele'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Sublime Epiphany' AND T1.number = '74s'
SELECT T1.name, T1.artist, T1.isPromo FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid GROUP BY T1.name, T1.artist, T1.isPromo ORDER BY COUNT(T2.uuid) DESC LIMIT 1
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Annul' AND T1.number = '29'
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T1.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid
SELECT T1.name, T1.totalSetSize FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian'
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd'
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT COUNT(id) FROM cards WHERE power = '*'
SELECT promoTypes FROM cards WHERE name = 'Duress'
SELECT borderColor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originalType FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'
SELECT COUNT(T2.uuid) FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.status = 'Restricted' AND T2.isTextless = 0
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Condemn'
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Restricted' AND T1.isStarter = 1
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Cloudchaser Eagle'
SELECT type FROM cards WHERE name = 'Benalish Knight'
SELECT T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Benalish Knight'
SELECT T2.artist FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Phyrexian'
SELECT CAST(SUM(CASE WHEN borderColor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards
SELECT COUNT(T1.uuid) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.isReprint = 1
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.borderColor = 'borderless' AND T2.language = 'Russian'
SELECT CAST(SUM(CASE WHEN T2.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isStorySpotlight = 1
SELECT COUNT(id) FROM cards WHERE toughness = '99'
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT COUNT(id) FROM cards WHERE borderColor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedManaCost = 0
SELECT layout FROM cards WHERE keywords = 'Flying'
SELECT COUNT(id) FROM cards WHERE originalType = 'Summon - Angel' AND subtypes != 'Angel'
SELECT id FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL
SELECT id FROM cards WHERE duelDeck = 'a'
SELECT edhrecRank FROM cards WHERE frameVersion = '2015'
SELECT T2.artist FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified'
SELECT T1.uuid FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.availability = 'paper' AND T2.language = 'Japanese'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' AND T1.borderColor = 'white'
SELECT T1.uuid, T3.language FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.format = 'legacy'
SELECT DISTINCT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Beacon of Immortality'
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = 'future' AND T2.status = 'Legal'
SELECT name, colors FROM cards WHERE setCode = 'OGW'
SELECT T1.id, T2.translation, T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.setCode = '10E' AND T1.convertedManaCost = 5
SELECT T1.name, T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.originalType = 'Creature - Elf'
SELECT T1.colors, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.id BETWEEN 1 AND 20
SELECT DISTINCT T1.uuid FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.colors = 'B' AND T1.originalType = 'Artifact' AND T2.language IS NOT NULL
SELECT T1.name FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'uncommon' ORDER BY T2.date ASC LIMIT 3
SELECT COUNT(id) FROM cards WHERE artist = 'John Avon' AND cardKingdomId <> cardKingdomFoilId AND cardKingdomFoilId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE borderColor = 'white' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = '-1'
SELECT COUNT(id) FROM cards WHERE frameVersion = '1993' AND availability = 'paper' AND hasContentWarning = 1
SELECT manaCost FROM cards WHERE layout = 'normal' AND frameVersion = '2003' AND borderColor = 'black' AND availability IN ('paper', 'mtgo')
SELECT SUM(CAST(REPLACE(REPLACE(manaCost, '{', ''), '}', '') AS INTEGER)) FROM cards WHERE artist = 'Rob Alexander'
SELECT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT setCode FROM set_translations WHERE language = 'Spanish'
SELECT CAST(SUM(CASE WHEN hand = '+3' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM cards WHERE frameEffects = 'legendary'
SELECT CAST(SUM(CASE WHEN isStorySpotlight = 1 AND isTextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) AS percentage FROM cards
SELECT T2.name, CAST(SUM(CASE WHEN T1.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid GROUP BY T2.name
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 309
SELECT COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Portuguese (Brazil)' AND T1.block = 'Commander'
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.types = 'Creature' AND T2.status = 'Legal'
SELECT DISTINCT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'German'
SELECT COUNT(id) FROM cards WHERE power IS NULL AND text LIKE '%Triggered ability%'
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid INNER JOIN rulings AS T3 ON T1.uuid = T3.uuid WHERE T2.format = 'premodern' AND T3.text = 'This is a triggered mana ability' AND T1.side IS NULL
SELECT T1.id FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Erica Yang' AND T1.availability = 'paper' AND T2.format = 'pauper' AND T2.status = 'legal'
SELECT T2.artist FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.text = 'Das perfekte Gegenmittel zu einer dichten Formation'
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Matthew D. Wilson' AND T1.layout = 'normal' AND T1.borderColor = 'black' AND T1.types = 'Creature' AND T2.language = 'French'
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'rare' AND T2.date = '2009-01-10'
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.baseSetSize = 180 AND T1.block = 'Ravnica'
SELECT CAST(SUM(CASE WHEN T2.hasContentWarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) AS percentage FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'commander' AND T1.status = 'Legal'
SELECT (CAST(SUM(CASE WHEN T1.power IS NULL OR T1.power = '*' THEN 1 ELSE 0 END) AS REAL) / (SELECT COUNT(*) FROM cards WHERE power IS NULL OR power = '*')) * 100 AS percentage FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T2.language = 'French'
SELECT CAST(SUM(CASE WHEN T1.type = 'expansion' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.type) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese'
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT COUNT(id) FROM cards WHERE borderColor = 'borderless' AND edhrecRank > 12000
SELECT COUNT(id) FROM cards WHERE isOversized = 1 AND isReprint = 1 AND isPromo = 1
SELECT name FROM cards WHERE (power = '*' OR power IS NULL) AND promoTypes = 'arenaleague' ORDER BY name LIMIT 3
SELECT language FROM foreign_data WHERE multiverseid = 149934
SELECT cardKingdomFoilId, cardKingdomId FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL ORDER BY cardKingdomFoilId LIMIT 3
SELECT CAST(SUM(CASE WHEN isTextless = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS proportion FROM cards WHERE layout = 'normal'
SELECT number FROM cards WHERE side IS NULL AND subtypes LIKE '%Angel%' AND subtypes LIKE '%Wizard%'
SELECT name FROM sets WHERE mtgoCode = '' OR mtgoCode IS NULL ORDER BY name LIMIT 3
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.mcmName = 'Archenemy' AND T1.code = 'ARC'
SELECT T1.name, T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 5
SELECT T2.language, T1.type FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.id = 206
SELECT DISTINCT T1.name, T1.id FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.block = 'Shadowmoor' AND T3.language = 'Italian' ORDER BY T1.name LIMIT 2
SELECT T1.code FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN foreign_data AS T3 ON T2.uuid = T3.uuid WHERE T1.isFoilOnly = 1 AND T1.isForeignOnly = 0 AND T3.language = 'Japanese'
SELECT T2.setCode FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Russian' ORDER BY T1.baseSetSize DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.isOnlineOnly) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Chinese Simplified'
SELECT COUNT(T2.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Japanese' AND (T1.mtgoCode IS NULL OR T1.mtgoCode = '')
SELECT COUNT(id) FROM cards WHERE borderColor = 'black'
SELECT COUNT(id) FROM cards WHERE frameEffects = 'extendedart' UNION ALL SELECT id FROM cards WHERE frameEffects = 'extendedart'
SELECT name FROM cards WHERE borderColor = 'black' AND isFullArt = 1
SELECT T3.language FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.number = '174'
SELECT name FROM sets WHERE code = 'ALL'
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releaseDate = '2007-07-13'
SELECT baseSetSize, code FROM sets WHERE block IN ('Mirage', 'Masques')
SELECT code FROM sets WHERE type = 'expansion'
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'boros'
SELECT T1.type, T2.language, T2.flavorText FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'colorpie'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.name) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Abyssal Horror'
SELECT code FROM sets WHERE type = 'expansion'
SELECT T2.name, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'abzan'
SELECT T2.language, T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.watermark = 'azorius'
SELECT COUNT(id) FROM cards WHERE artist = 'Aaron Miller' AND cardKingdomFoilId = cardKingdomId AND cardKingdomId IS NOT NULL
SELECT COUNT(id) FROM cards WHERE availability LIKE '%paper%' AND hand LIKE '+%'
SELECT name FROM cards WHERE isTextless = 0
SELECT convertedManaCost FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT COUNT(id) FROM cards WHERE borderColor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE isPromo = 1 AND side IS NOT NULL GROUP BY name
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT purchaseUrls FROM cards WHERE promoTypes = 'bundle'
SELECT COUNT(DISTINCT artist) FROM cards WHERE borderColor = 'black' AND availability LIKE '%arena%' AND availability LIKE '%mtgo%'
SELECT name FROM cards WHERE name = 'Serra Angel' OR name = 'Shrine Keeper' ORDER BY convertedManaCost DESC LIMIT 1
SELECT artist FROM cards WHERE flavorName = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameVersion = '2003' ORDER BY convertedManaCost DESC LIMIT 3
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Italian'
SELECT COUNT(T3.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Angel of Mercy'
SELECT T2.name FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT T1.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'Korean'
SELECT COUNT(T1.id) FROM set_translations AS T1 INNER JOIN cards AS T2 ON T1.setCode = T2.setCode WHERE T1.translation = 'Hauptset Zehnte Edition' AND T2.artist = 'Adam Rex'
SELECT T2.baseSetSize FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Eighth Edition' AND T2.language = 'Chinese Simplified'
SELECT MAX(CASE WHEN T2.mtgoCode IS NULL THEN 'No' ELSE 'Yes' END) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Angel of Mercy'
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Ancestor''s Chosen'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Hauptset Zehnte Edition'
SELECT COUNT(T1.code) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.block = 'Ice Age' AND T2.language = 'Italian'
SELECT T2.isForeignOnly FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Adarkar Valkyrie'
SELECT COUNT(T2.setCode) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T2.language = 'Italian' AND T1.baseSetSize < 10
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.borderColor = 'black'
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT T2.artist FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy')
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap' AND T2.number = '4'
SELECT COUNT(T1.id) FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap' AND T1.convertedManaCost > 5 AND (T1.power = '*' OR T1.power IS NULL)
SELECT flavorText FROM foreign_data WHERE name = 'Ancestor''s Chosen' AND language = 'Italian'
SELECT T2.language FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.flavorText IS NOT NULL
SELECT T2.type FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Ancestor''s Chosen' AND T2.language = 'German'
SELECT T3.text FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN foreign_data AS T3 ON T1.uuid = T3.uuid WHERE T2.name = 'Coldsnap' AND T3.language = 'Italian'
SELECT T2.name FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid INNER JOIN sets AS T3 ON T1.setCode = T3.code WHERE T3.name = 'Coldsnap' AND T2.language = 'Italian' ORDER BY T1.convertedManaCost DESC LIMIT 1
SELECT T2.date FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Reminisce'
SELECT CAST(SUM(CASE WHEN T1.convertedManaCost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.convertedManaCost) AS percentage FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T2.name = 'Coldsnap'
SELECT CAST(SUM(CASE WHEN T2.cardKingdomFoilId = T2.cardKingdomId AND T2.cardKingdomId IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Coldsnap'
SELECT code FROM sets WHERE releaseDate = '2017-07-14'
SELECT keyruneCode FROM sets WHERE code = 'PKHC'
SELECT mcmId FROM sets WHERE code = 'SS2'
--
SELECT type FROM sets WHERE name = 'From the Vault: Lore'
SELECT parentCode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT T1.hasContentWarning, T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Jim Pavelec'
SELECT T2.releaseDate FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Evacuation'
SELECT T2.baseSetSize FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Rinascita di Alara'
SELECT T2.type FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Huitième édition'
SELECT T3.translation FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code INNER JOIN set_translations AS T3 ON T2.code = T3.setCode WHERE T1.name = 'Tendo Ice Bridge' AND T3.language = 'French'
SELECT COUNT(T2.translation) FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Salvat 2011' AND T2.translation IS NOT NULL
SELECT T2.translation FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Fellwar Stone' AND T2.language = 'Japanese'
SELECT T2.name FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Journey into Nyx Hero''s Path' ORDER BY T2.convertedManaCost DESC LIMIT 1
SELECT T2.releaseDate FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.translation = 'Ola de frío'
SELECT T2.type FROM cards AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.name = 'Samite Pilgrim'
SELECT COUNT(T2.id) FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode WHERE T1.name = 'World Championship Decks 2004' AND T2.convertedManaCost = 3
SELECT T2.translation FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Mirrodin' AND T2.language = 'Chinese Simplified'
SELECT CAST(SUM(CASE WHEN T2.isNonFoilOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.setCode) AS percentage FROM set_translations AS T1 INNER JOIN sets AS T2 ON T1.setCode = T2.code WHERE T1.language = 'Japanese'
SELECT CAST(SUM(CASE WHEN T2.isOnlineOnly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.uuid) AS percentage FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Portuguese (Brazil)'
SELECT availability FROM cards WHERE artist = 'Aleksi Briclot' AND isTextless = 1
SELECT id FROM sets ORDER BY baseSetSize DESC LIMIT 1
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedManaCost DESC LIMIT 1
SELECT frameEffects FROM cards WHERE cardKingdomFoilId IS NOT NULL AND cardKingdomId IS NOT NULL GROUP BY frameEffects ORDER BY COUNT(frameEffects) DESC LIMIT 1
SELECT COUNT(id) FROM cards WHERE duelDeck = 'a' AND hasFoil = 0 AND (power = '*' OR power IS NULL)
SELECT id FROM sets WHERE type = 'commander' ORDER BY totalSetSize DESC LIMIT 1
SELECT T2.name FROM legalities AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.format = 'duel' ORDER BY T2.manaCost DESC LIMIT 10
SELECT T1.originalReleaseDate, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.rarity = 'mythic' AND T2.status = 'Legal' ORDER BY T1.originalReleaseDate ASC LIMIT 1
SELECT COUNT(T1.uuid) FROM cards AS T1 INNER JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Volkan Baǵa' AND T2.language = 'French'
SELECT COUNT(DISTINCT T1.id) FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.name = 'Abundance' AND T1.rarity = 'rare' AND T1.types = 'Enchantment' AND T1.uuid NOT IN (SELECT T3.uuid FROM legalities AS T3 WHERE T3.status != 'Legal')
SELECT T2.format, T1.name FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.status = 'Banned' GROUP BY T2.format ORDER BY COUNT(T2.status) DESC LIMIT 1
SELECT T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.name = 'Battlebond'
SELECT T1.artist, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid GROUP BY T1.artist, T2.format ORDER BY COUNT(T1.artist) ASC LIMIT 1
SELECT T2.status FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.frameVersion = '1997' AND T1.artist = 'D. Alexander Gregory' AND T1.hasContentWarning = 1 AND T2.format = 'legacy'
SELECT T1.name, T2.format FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.edhrecRank = 1 AND T2.status = 'Banned'
SELECT CAST(COUNT(T1.id) AS REAL) / 4 AS annual_average, T2.language FROM sets AS T1 INNER JOIN set_translations AS T2 ON T1.code = T2.setCode WHERE T1.releaseDate BETWEEN '2012-01-01' AND '2015-12-31' GROUP BY T2.language ORDER BY COUNT(T2.language) DESC LIMIT 1
SELECT artist FROM cards WHERE borderColor = 'black' AND availability = 'arena'
SELECT T1.uuid FROM cards AS T1 INNER JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T2.format = 'oldschool' AND T2.status IN ('Banned', 'Restricted')
SELECT COUNT(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT T2.text FROM cards AS T1 INNER JOIN rulings AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Kev Walker' ORDER BY T2.date DESC
SELECT T2.name, T3.format FROM sets AS T1 INNER JOIN cards AS T2 ON T1.code = T2.setCode INNER JOIN legalities AS T3 ON T2.uuid = T3.uuid WHERE T1.name = 'Hour of Devastation' AND T3.status = 'Legal'
SELECT T1.name FROM sets AS T1 WHERE EXISTS (SELECT 1 FROM set_translations AS T2 WHERE T1.code = T2.setCode AND T2.language = 'Korean') AND NOT EXISTS (SELECT 1 FROM set_translations AS T3 WHERE T1.code = T3.setCode AND T3.language LIKE '%Japanese%')
SELECT DISTINCT T1.frameVersion, T1.id FROM cards AS T1 LEFT JOIN legalities AS T2 ON T1.uuid = T2.uuid WHERE T1.artist = 'Allen Williams' AND (T2.status = 'Banned' OR T2.status IS NULL)
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') ORDER BY Reputation DESC LIMIT 1
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2014'
SELECT COUNT(Id) FROM users WHERE LastAccessDate > '2014-09-01 00:00:00'
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE UpVotes > 100 AND DownVotes > 1
SELECT COUNT(Id) FROM users WHERE STRFTIME('%Y', CreationDate) > '2013' AND Views > 10
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.ViewCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount IS NOT NULL ORDER BY T1.FavoriteCount DESC LIMIT 1
SELECT SUM(T2.CommentCount) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT T2.AnswerCount FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' ORDER BY T2.AnswerCount DESC LIMIT 1
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie' AND T2.ParentId IS NULL
SELECT DISTINCT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ClosedDate IS NOT NULL
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Age > 65 AND T2.Score >= 20
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id WHERE T1.TagName = 'bayesian'
SELECT T2.Body FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id ORDER BY T1.Count DESC LIMIT 1
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT DISTINCT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie'
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'csgillespie' AND STRFTIME('%Y', T2.Date) = '2011'
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'csgillespie'
SELECT CAST(COUNT(T2.Id) AS REAL) / COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Views > 200
SELECT CAST(SUM(CASE WHEN T2.Age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS Percentage FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 20
SELECT COUNT(Id) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'
SELECT CreationDate FROM votes GROUP BY CreationDate ORDER BY COUNT(Id) DESC LIMIT 1
SELECT COUNT(Id) FROM badges WHERE Name = 'Revival'
SELECT T2.Title FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.Score IS NOT NULL ORDER BY T1.Score DESC LIMIT 1
SELECT CommentCount FROM posts WHERE ViewCount = 1910
SELECT T2.FavoriteCount FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 3025 AND T1.CreationDate = '2014-04-23 20:29:39.0'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1
SELECT CASE WHEN T2.ClosedDate IS NULL THEN 'well-finished' ELSE 'not well-finished' END AS result FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 23853 AND T1.CreationDate = '2013-07-12 09:08:18.0'
SELECT T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 65041
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Tiago Pasqualini'
SELECT T2.DisplayName FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Id = 6347
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data visualization%'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'DatEpicCoderGuyWhoPrograms'
SELECT CAST(COUNT(T1.Id) AS REAL) / COUNT(T2.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.OwnerUserId = 24
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT DisplayName FROM users WHERE WebsiteUrl = 'http://stackoverflow.com'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'
SELECT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'thank you user93!'
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'
SELECT T1.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How does gentle boosting differ from AdaBoost?'
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Open source tools for visualizing multi-dimensional data'
SELECT T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T1.DisplayName = 'Vebjorn Ljosa'
SELECT SUM(T2.Score), T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T1.DisplayName = 'Yevgeny'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN votes AS T3 ON T1.Id = T3.PostId WHERE T3.BountyAmount = 50 AND T1.Title LIKE '%variance%'
SELECT AVG(T1.ViewCount) AS AverageViewCount, T1.Title, T2.Text, T2.Score FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN tags AS T3 ON T1.Id = T3.ExcerptPostId WHERE T3.TagName = 'humor' GROUP BY T1.Id
SELECT COUNT(Id) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE STRFTIME('%Y', Date) = '2011' AND Name = 'Supporter'
SELECT COUNT(UserId) FROM ( SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5 ) T
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'New York' AND T2.Name IN ('Supporter', 'Teacher') GROUP BY T1.Id HAVING COUNT(DISTINCT T2.Name) = 2
SELECT T2.OwnerUserId, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1
SELECT T2.UserId FROM users AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.UserId WHERE T1.Views >= 1000 GROUP BY T2.UserId HAVING COUNT(DISTINCT T2.PostId) = 1
SELECT T2.Name FROM comments AS T1 INNER JOIN badges AS T2 ON T1.UserId = T2.UserId INNER JOIN users AS T3 ON T1.UserId = T3.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'India' AND T2.Name = 'Teacher'
SELECT CAST((SUM(CASE WHEN STRFTIME('%Y', Date) = '2010' THEN 1 ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', Date) = '2011' THEN 1 ELSE 0 END)) AS REAL) * 100 / COUNT(Name) FROM badges WHERE Name = 'Student'
SELECT T1.PostHistoryTypeId, COUNT(DISTINCT T2.UserId) FROM postHistory AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.PostId = 3720 GROUP BY T1.PostHistoryTypeId
SELECT T2.RelatedPostId, T1.ViewCount FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.PostId = 61217
SELECT T1.Score, T2.LinkTypeId FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.PostId WHERE T2.PostId = 395
SELECT Id, OwnerUserId FROM posts WHERE Score > 60
SELECT SUM(FavoriteCount) FROM posts WHERE STRFTIME('%Y', CreaionDate) = '2011' AND OwnerUserId = 686
SELECT AVG(CAST(T2.UpVotes AS REAL)), AVG(CAST(T2.Age AS REAL)) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id GROUP BY T1.OwnerUserId HAVING COUNT(T1.OwnerUserId) > 10
SELECT COUNT(UserId) FROM badges WHERE Name = 'Announcer'
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08'
SELECT COUNT(Id) FROM comments WHERE Score > 60
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'
SELECT COUNT(Id) FROM posts WHERE Score = 10
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MAX(Reputation) FROM users )
SELECT T2.Reputation FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'
SELECT CAST(SUM(CASE WHEN T1.Name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id
SELECT CAST(SUM(CASE WHEN T2.Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Organizer'
SELECT T2.Score FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreaionDate = '2010-07-19 19:19:56'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CreaionDate = '2010-07-19 19:37:33'
SELECT DISTINCT T1.Age FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Vienna, Austria'
SELECT COUNT(T1.Age) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65
SELECT T2.Views FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Date = '2010-07-19 19:39:08.0'
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = ( SELECT MIN(Reputation) FROM users )
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Sharpie'
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age > 65
SELECT DisplayName FROM users WHERE Id = 30
SELECT COUNT(Id) FROM users WHERE Location = 'New York'
SELECT COUNT(Id) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65
SELECT DisplayName FROM users ORDER BY Views DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT DISTINCT T2.Tags FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'John Stauffer'
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Daniel Vassallo'
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Harlan'
SELECT T2.Id FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'slashnick' AND T2.AnswerCount IS NOT NULL ORDER BY T2.AnswerCount DESC LIMIT 1
SELECT T1.Id FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName IN ('Harvey Motulsky', 'Noah Snyder') GROUP BY T1.Id ORDER BY SUM(T2.ViewCount) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN votes AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Matt Parker' GROUP BY T2.Id HAVING COUNT(T3.UserId) > 4
SELECT COUNT(T3.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Neil McGuigan' AND T3.Score < 60
SELECT DISTINCT T2.Tags FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Mark Meckes' AND T2.CommentCount = 0
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT CAST(SUM(CASE WHEN T2.Tags LIKE '%<r>%' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) AS percentage FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Community'
SELECT SUM(CASE WHEN T2.DisplayName = 'mornington' THEN T1.ViewCount ELSE 0 END) - SUM(CASE WHEN T2.DisplayName = 'Amos' THEN T1.ViewCount ELSE 0 END) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id
SELECT COUNT(UserId) FROM badges WHERE STRFTIME('%Y', Date) = '2014' AND Name = 'Commentator'
SELECT COUNT(Id) FROM posts WHERE CreaionDate BETWEEN '2010-07-21 00:00:00' AND '2010-07-21 23:59:59'
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60
SELECT T2.Title, T3.DisplayName FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id INNER JOIN users AS T3 ON T1.UserId = T3.Id WHERE T1.Score > 60
SELECT DISTINCT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE STRFTIME('%Y', T2.Date) = '2011' AND T1.Location = 'North Pole'
SELECT T2.DisplayName, T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount > 150
SELECT COUNT(T2.Id), T1.LastEditDate FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'What is the best introductory Bayesian statistics textbook?'
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'outliers'
SELECT T1.Title FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.PostId = ( SELECT Id FROM posts WHERE Title = 'How to tell if something happened in a data set which monitors a value over time' )
SELECT T1.Id, T3.Name FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id INNER JOIN badges AS T3 ON T2.Id = T3.UserId WHERE T2.DisplayName = 'Samuel' AND STRFTIME('%Y', T3.Date) = '2013'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN posts AS T3 ON T1.ExcerptPostId = T3.Id INNER JOIN users AS T2 ON T3.OwnerUserId = T2.Id WHERE T1.TagName = 'hypothesis-testing'
SELECT T1.Title, T2.LinkTypeId FROM posts AS T1 INNER JOIN postLinks AS T2 ON T1.Id = T2.RelatedPostId WHERE T2.PostId = ( SELECT Id FROM posts WHERE Title = 'What are principal component scores?' )
SELECT T3.DisplayName FROM posts AS T1 INNER JOIN posts AS T2 ON T1.ParentId = T2.Id INNER JOIN users AS T3 ON T2.OwnerUserId = T3.Id WHERE T1.ParentId IS NOT NULL ORDER BY T1.Score DESC LIMIT 1
SELECT T2.DisplayName, T2.WebsiteUrl FROM votes AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.VoteTypeId = 8 AND T1.BountyAmount IS NOT NULL ORDER BY T1.BountyAmount DESC LIMIT 1
SELECT Title FROM posts ORDER BY ViewCount DESC LIMIT 5
SELECT COUNT(Id) FROM tags WHERE Count BETWEEN 5000 AND 7000
SELECT OwnerUserId FROM posts WHERE FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts )
SELECT Age FROM users WHERE Reputation IS NOT NULL ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE STRFTIME('%Y', T2.CreationDate) = '2011' AND T2.BountyAmount = 50
SELECT Id FROM users WHERE Age IS NOT NULL ORDER BY Age ASC LIMIT 1
SELECT T2.Score FROM tags AS T1 INNER JOIN posts AS T2 ON T2.Tags LIKE '%' || T1.TagName || '%' WHERE T1.Count = (SELECT MAX(Count) FROM tags) ORDER BY T2.ViewCount DESC LIMIT 1
SELECT CAST(COUNT(T1.Id) AS REAL) / 12 FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate LIKE '2010%' AND T2.AnswerCount <= 2
SELECT T2.PostId FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.UserId = 1465 ORDER BY T1.FavoriteCount DESC LIMIT 1
SELECT T2.Title FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id ORDER BY T1.CreationDate ASC LIMIT 1
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.DisplayName ORDER BY COUNT(T1.Name) DESC LIMIT 1
SELECT MIN(T2.CreationDate) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'chl'
SELECT MIN(T1.CreaionDate) FROM posts AS T1 WHERE T1.OwnerUserId = (SELECT T2.Id FROM users AS T2 WHERE T2.Age = (SELECT MIN(Age) FROM users))
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Autobiographer' ORDER BY T1.Date LIMIT 1
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4
SELECT CAST(COUNT(T2.PostId) AS REAL) / COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T1.Age = ( SELECT MAX(Age) FROM users )
SELECT DisplayName FROM users WHERE Reputation IS NOT NULL ORDER BY Reputation DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE Reputation > 2000 AND Views > 1000
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65
SELECT COUNT(T2.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Jay Stevens' AND STRFTIME('%Y', T2.CreationDate) = '2010'
SELECT T2.Id, T2.Title FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Harvey Motulsky' ORDER BY T2.ViewCount DESC LIMIT 1
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Stephen Turner' AND T2.Score IS NOT NULL
SELECT DISTINCT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.ViewCount > 20000 AND strftime('%Y', T1.CreationDate) = '2011'
SELECT T1.Id, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts WHERE strftime('%Y', CreationDate) = '2010') AND strftime('%Y', T1.CreationDate) = '2010'
SELECT CAST(SUM(CASE WHEN T2.Reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.Id) AS percentage FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE strftime('%Y', T1.CreationDate) = '2011' AND T1.OwnerUserId IS NOT NULL AND T2.Reputation IS NOT NULL
SELECT CAST(SUM(CASE WHEN Age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Id) FROM users
SELECT T1.ViewCount, T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Computer Game Datasets'
SELECT COUNT(Id) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Score = (SELECT MAX(Score) FROM posts)
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT T2.DisplayName, T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Id = 183
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Emmett' ORDER BY T2.Date DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE UpVotes > 5000 AND Age BETWEEN 19 AND 65
SELECT strftime('%J', T2.Date) - strftime('%J', T1.CreationDate) AS Days FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'
SELECT COUNT(T2.Id), COUNT(T3.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T1.Id = T3.UserId WHERE T1.CreationDate = (SELECT MAX(CreationDate) FROM users)
SELECT T2.Text, T3.DisplayName FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId INNER JOIN users AS T3 ON T2.UserId = T3.Id WHERE T1.Title = 'Analysing wind data with R' ORDER BY T2.CreationDate DESC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT T1.Count FROM tags AS T1 WHERE T1.TagName = 'careers'
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30
SELECT CAST(SUM(CASE WHEN T2.Score > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.Id) AS percentage FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Score IS NOT NULL GROUP BY T1.Id ORDER BY T1.Reputation DESC LIMIT 1
SELECT COUNT(Id) FROM posts WHERE Score < 20
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT T2.Reputation, T2.UpVotes FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'fine, you win :)'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How can I adapt ANOVA for binary data?'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1
SELECT T2.CreationDate, T2.Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%'
SELECT COUNT(DISTINCT T2.PostId) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = 0 AND T1.ViewCount < 5
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0
SELECT COUNT(DISTINCT T1.UserId) FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score = 0 AND T2.Age = 40
SELECT T1.Id, T2.Comment FROM posts AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'Group differences on a five point Likert item'
SELECT T2.UpVotes FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'R is also lazy evaluated.'
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Harvey Motulsky'
SELECT DISTINCT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 1 AND 5 AND T2.DownVotes = 0
SELECT CAST(SUM(CASE WHEN T2.UpVotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.UserId) AS percentage FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Score BETWEEN 5 AND 10
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = '3-D Man'
SELECT COUNT(T1.id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Super Strength'
SELECT COUNT(T3.id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Super Strength' AND T3.height_cm > 200
SELECT T1.full_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.full_name HAVING COUNT(T1.full_name) > 15
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond'
SELECT COUNT(*) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics' AND T1.height_cm IS NOT NULL ORDER BY T1.height_cm DESC LIMIT 1
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'
SELECT COUNT(*) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN colour AS T3 ON T2.eye_colour_id = T3.id WHERE T1.publisher_name = 'Marvel Comics' AND T3.colour = 'Blue'
SELECT AVG(T2.height_cm) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Marvel Comics'
SELECT CAST(SUM(CASE WHEN T4.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics'
SELECT T4.publisher_name FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN publisher AS T4 ON T3.publisher_id = T4.id WHERE T1.attribute_name = 'Speed' ORDER BY T2.attribute_value LIMIT 1
SELECT COUNT(*) FROM colour AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.eye_colour_id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T1.colour = 'Gold' AND T3.publisher_name = 'Marvel Comics'
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Blue Beetle II'
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.hair_colour_id = T2.id WHERE T2.colour = 'Blond'
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Intelligence' ORDER BY T1.attribute_value LIMIT 1
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'Copycat'
SELECT COUNT(DISTINCT T2.hero_id) FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id WHERE T1.attribute_name = 'Durability' AND T2.attribute_value < 50
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Death Touch'
SELECT COUNT(T1.id) FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_attribute AS T3 ON T2.id = T3.hero_id INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T1.gender = 'Female' AND T4.attribute_name = 'Strength' AND T3.attribute_value = 100
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id GROUP BY T1.superhero_name ORDER BY COUNT(T2.power_id) DESC LIMIT 1
SELECT COUNT(T2.id) FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Vampire'
SELECT CAST(SUM(CASE WHEN T3.alignment = 'Bad' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage_bad, SUM(CASE WHEN T3.alignment = 'Bad' THEN 1 ELSE 0 END) AS count_bad FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN alignment AS T3 ON T2.alignment_id = T3.id WHERE T1.publisher_name = 'Marvel Comics'
SELECT SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) AS diff FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT T.id FROM publisher AS T WHERE T.publisher_name = 'Star Trek'
SELECT AVG(attribute_value) FROM hero_attribute
SELECT COUNT(*) FROM superhero WHERE full_name IS NULL
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.id = 75
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Deathlok'
SELECT AVG(T1.weight_kg) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.id = 2
SELECT T4.power_name FROM gender AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.gender_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.gender = 'Male' LIMIT 5
SELECT T2.superhero_name FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT superhero_name FROM superhero WHERE eye_colour_id = 1 AND height_cm BETWEEN 170 AND 190
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 56
SELECT T2.full_name FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Demi-God' LIMIT 5
SELECT COUNT(T2.id) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Bad'
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 169
SELECT T3.colour FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T1.height_cm = 185 AND T2.race = 'Human'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id ORDER BY T1.weight_kg DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.id = 13 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.height_cm BETWEEN 150 AND 180
SELECT T1.full_name FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T2.gender = 'Male' AND T1.weight_kg > (SELECT AVG(weight_kg) * 0.79 FROM superhero WHERE weight_kg IS NOT NULL)
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id GROUP BY T2.power_name ORDER BY COUNT(T2.power_name) DESC LIMIT 1
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Abomination'
SELECT T2.power_name FROM hero_power AS T1 INNER JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T1.hero_id = 1
SELECT COUNT(T1.id) FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Stealth'
SELECT T2.full_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Strength' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT CAST(COUNT(*) AS REAL) / SUM(CASE WHEN skin_colour_id = 1 THEN 1 ELSE 0 END) FROM superhero
SELECT COUNT(*) FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id INNER JOIN publisher AS T4 ON T1.publisher_id = T4.id WHERE T4.publisher_name = 'Dark Horse Comics' AND T3.attribute_name = 'Durability' ORDER BY T2.attribute_value DESC LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Abraham Sapien'
SELECT T3.superhero_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Flight'
SELECT T2.eye_colour_id, T2.hair_colour_id, T2.skin_colour_id FROM superhero AS T2 INNER JOIN gender AS T1 ON T2.gender_id = T1.id INNER JOIN publisher AS T3 ON T2.publisher_id = T3.id WHERE T1.gender = 'Female' AND T3.publisher_name = 'Dark Horse Comics'
SELECT T1.superhero_name, T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.eye_colour_id = T1.hair_colour_id AND T1.eye_colour_id = T1.skin_colour_id
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.superhero_name = 'A-Bomb'
SELECT CAST(SUM(CASE WHEN T3.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.gender) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN colour AS T3 ON T1.eye_colour_id = T3.id WHERE T2.gender = 'Female'
SELECT T1.superhero_name, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.full_name = 'Charles Chandler'
SELECT T2.gender FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id WHERE T1.superhero_name = 'Agent 13'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Adaptation'
SELECT COUNT(T2.power_id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Amazo'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Hunter Zolomon'
SELECT T1.height_cm FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Amber'
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Black' AND T3.colour = 'Black'
SELECT T1.eye_colour_id FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T2.colour = 'Gold'
SELECT T2.full_name FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Vampire'
SELECT T2.superhero_name FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'
SELECT COUNT(*) FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id WHERE T2.attribute_name = 'Strength' AND T1.attribute_value = (SELECT MAX(T3.attribute_value) FROM hero_attribute AS T3 INNER JOIN attribute AS T4 ON T3.attribute_id = T4.id WHERE T4.attribute_name = 'Strength')
SELECT T2.race, T3.alignment FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN alignment AS T3 ON T1.alignment_id = T3.id WHERE T1.superhero_name = 'Cameron Hicks'
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T3.gender) AS percentage FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN gender AS T3 ON T2.gender_id = T3.id WHERE T1.publisher_name = 'Marvel Comics'
SELECT AVG(T2.weight_kg) FROM race AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.race_id WHERE T1.race = 'Alien'
SELECT ( SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky' ) - ( SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler' )
SELECT id, AVG(height_cm) FROM superhero GROUP BY id
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Abomination'
SELECT COUNT(id) FROM superhero WHERE race_id = 21 AND gender_id = 1
SELECT T2.superhero_name FROM hero_attribute AS T1 INNER JOIN superhero AS T2 ON T1.hero_id = T2.id INNER JOIN attribute AS T3 ON T1.attribute_id = T3.id WHERE T3.attribute_name = 'Speed' ORDER BY T1.attribute_value DESC LIMIT 1
SELECT COUNT(id) FROM superhero WHERE alignment_id = 3
SELECT T2.attribute_name, T1.attribute_value FROM hero_attribute AS T1 INNER JOIN attribute AS T2 ON T1.attribute_id = T2.id INNER JOIN superhero AS T3 ON T1.hero_id = T3.id WHERE T3.superhero_name = '3-D Man'
SELECT superhero_name FROM superhero WHERE eye_colour_id = 7 AND hair_colour_id = 9
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT COUNT(id) FROM superhero WHERE publisher_id = 1
SELECT CAST(SUM(CASE WHEN eye_colour_id = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM superhero
SELECT CAST(SUM(IIF(gender_id = 1, 1, 0)) AS REAL) / SUM(IIF(gender_id = 2, 1, 0)) FROM superhero
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.full_name = 'Karen Beecher-Duncan'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.full_name = 'Helen Parr'
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.weight_kg = 108 AND T1.height_cm = 188
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.id = 38
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id ORDER BY T3.attribute_value DESC LIMIT 1
SELECT T2.alignment, T4.power_name FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN hero_power AS T3 ON T1.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.superhero_name = 'Atom IV'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue' LIMIT 5
SELECT AVG(T2.attribute_value) FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.alignment_id = 3
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id INNER JOIN hero_attribute AS T3 ON T1.id = T3.hero_id WHERE T3.attribute_value = 100
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN alignment AS T2 ON T1.alignment_id = T2.id INNER JOIN gender AS T3 ON T1.gender_id = T3.id WHERE T2.id = 1 AND T3.id = 2
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T2.attribute_value BETWEEN 75 AND 80
SELECT T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id INNER JOIN gender AS T4 ON T1.gender_id = T4.id WHERE T3.colour = 'Blue' AND T4.gender = 'Male'
SELECT CAST(SUM(gender_id = 2) AS REAL) * 100 / COUNT(alignment_id) FROM superhero WHERE alignment_id = 2
SELECT SUM(CASE WHEN T2.id = 7 THEN 1 ELSE 0 END) - SUM(CASE WHEN T2.id = 1 THEN 1 ELSE 0 END) AS diff FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg = 0 OR T1.weight_kg IS NULL
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T3.id = T2.attribute_id WHERE T1.superhero_name = 'Hulk' AND T3.attribute_name = 'Strength'
SELECT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.superhero_name = 'Ajax'
SELECT COUNT(T2.id) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id INNER JOIN colour AS T3 ON T2.skin_colour_id = T3.id WHERE T1.alignment = 'Bad' AND T3.colour = 'Green'
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN gender AS T2 ON T1.gender_id = T2.id INNER JOIN publisher AS T3 ON T1.publisher_id = T3.id WHERE T2.gender = 'Female' AND T3.publisher_name = 'Marvel Comics'
SELECT T3.superhero_name FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id WHERE T1.power_name = 'Wind Control' ORDER BY T3.superhero_name ASC
SELECT T4.gender FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id INNER JOIN superhero AS T3 ON T2.hero_id = T3.id INNER JOIN gender AS T4 ON T3.gender_id = T4.id WHERE T1.power_name = 'Phoenix Force'
SELECT T2.superhero_name FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id WHERE T1.publisher_name = 'DC Comics' AND T2.weight_kg IS NOT NULL ORDER BY T2.weight_kg DESC LIMIT 1
SELECT AVG(T1.height_cm) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id INNER JOIN race AS T3 ON T1.race_id = T3.id WHERE T2.publisher_name = 'Dark Horse Comics' AND T3.race != 'Human'
SELECT COUNT(T1.id) FROM attribute AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.attribute_id WHERE T1.attribute_name = 'Speed' AND T2.attribute_value = 100
SELECT SUM(CASE WHEN T1.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id
SELECT T3.attribute_name FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id INNER JOIN attribute AS T3 ON T2.attribute_id = T3.id WHERE T1.superhero_name = 'Black Panther' ORDER BY T2.attribute_value LIMIT 1
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT CAST(SUM(CASE WHEN T3.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN gender AS T3 ON T2.gender_id = T3.id WHERE T1.publisher_name = 'George Lucas'
SELECT CAST(SUM(CASE WHEN T3.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN alignment AS T3 ON T2.alignment_id = T3.id WHERE T1.publisher_name = 'Marvel Comics'
SELECT COUNT(*) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute ORDER BY attribute_value ASC LIMIT 1
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT T1.full_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.weight_kg < 100 AND T2.colour = 'Brown'
SELECT T2.attribute_value FROM superhero AS T1 INNER JOIN hero_attribute AS T2 ON T1.id = T2.hero_id WHERE T1.superhero_name = 'Aquababy'
SELECT T1.weight_kg, T2.race FROM superhero AS T1 INNER JOIN race AS T2 ON T1.race_id = T2.id WHERE T1.id = 40
SELECT AVG(T2.height_cm) FROM alignment AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.alignment_id WHERE T1.alignment = 'Neutral'
SELECT T2.hero_id FROM superpower AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.power_id WHERE T1.power_name = 'Intelligence'
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T1.superhero_name = 'Blackwulf'
SELECT DISTINCT T3.power_name FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T1.height_cm > ( SELECT AVG(height_cm) * 0.8 FROM superhero )
SELECT T2.driverRef FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 18 AND T1.q1 IS NOT NULL ORDER BY T1.q1 DESC LIMIT 5
SELECT T2.surname FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 19 AND T1.q2 IS NOT NULL ORDER BY T1.q2 LIMIT 1
SELECT DISTINCT T2.year FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Shanghai'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Germany'
SELECT T2.position FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId INNER JOIN races AS T3 ON T2.raceId = T3.raceId INNER JOIN circuits AS T4 ON T3.circuitId = T4.circuitId WHERE T1.name = 'Renault'
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2010 AND T2.country NOT IN ('Asia', 'Europe')
SELECT T2.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Spain'
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Australian Grand Prix'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'
SELECT T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Sepang International Circuit'
SELECT lat, lng FROM circuits WHERE location = 'Abu Dhabi'
SELECT T3.country FROM constructorResults AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.raceId = 24 AND T1.points = 1
SELECT T2.q1 FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 354 AND T1.driverRef = 'senna'
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 355 AND T1.q2 = '0:01:40'
SELECT T2.number FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 903 AND T1.q3 = '0:01:54'
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN status AS T3 ON T2.statusId = T3.statusId WHERE T1.name = 'Bahrain Grand Prix' AND T1.year = 2007 AND T3.status != 'Finished'
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901
SELECT COUNT(*) FROM results AS T1 JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.date = '2015-11-29' AND T1.time IS NOT NULL
SELECT T1.driverId FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 592 AND T1.time IS NOT NULL ORDER BY T2.dob ASC LIMIT 1
SELECT T2.url FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 161 AND T1.time = '0:01:27'
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 933 ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T2.lat, T2.lng FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix'
SELECT T3.url FROM constructorResults AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T2.raceId = 9 ORDER BY T1.points DESC LIMIT 1
SELECT T2.q1 FROM drivers AS T1 INNER JOIN qualifying AS T2 ON T1.driverId = T2.driverId WHERE T2.raceId = 345 AND T1.forename = 'Lucas' AND T1.surname = 'di Grassi'
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 347 AND T1.q2 = '0:01:15'
SELECT T3.code FROM qualifying AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.raceId = 45 AND T1.q3 = '0:01:33'
SELECT T2.milliseconds FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.raceId = 743 AND T3.forename = 'Bruce'
SELECT T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'San Marino Grand Prix' AND T3.year = 2006 AND T1.position = 2
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T1.year = T2.year WHERE T1.raceId = 901
SELECT COUNT(T2.raceId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN status AS T3 ON T2.statusId = T3.statusId WHERE T1.date = '2015-11-29' AND T3.status = 'Finished'
SELECT T1.driverId FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 872 AND T1.time IS NOT NULL ORDER BY T2.dob DESC LIMIT 1
SELECT T2.forename || ' ' || T2.surname FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 348 ORDER BY T1.milliseconds ASC LIMIT 1
SELECT T2.nationality FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapSpeed = (SELECT MAX(fastestLapSpeed) FROM results)
SELECT CAST((SUM(CASE WHEN T2.raceId = 853 THEN REPLACE(T2.fastestLapSpeed, ',', '.') END) - SUM(CASE WHEN T2.raceId = 854 THEN REPLACE(T2.fastestLapSpeed, ',', '.') END)) AS REAL) * 100 / SUM(CASE WHEN T2.raceId = 853 THEN REPLACE(T2.fastestLapSpeed, ',', '.') END) AS percentage FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Paul' AND T1.surname = 'di Resta'
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.date = '1983-07-16'
SELECT MIN(year) FROM races WHERE name = 'Singapore Grand Prix'
SELECT name FROM races WHERE year = 2005 ORDER BY name DESC
SELECT name FROM races WHERE date = (SELECT MIN(date) FROM races) UNION SELECT name FROM races WHERE STRFTIME('%Y-%m', date) = (SELECT STRFTIME('%Y-%m', MIN(date)) FROM races)
SELECT name, date FROM races WHERE year = 1999 ORDER BY round DESC LIMIT 1
SELECT year FROM races GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM races T1 WHERE T1.year = 2017 AND T1.name NOT IN (SELECT name FROM races T2 WHERE T2.year = 2000)
SELECT T2.country, T2.name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix' ORDER BY T1.year LIMIT 1
SELECT T1.year FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'British Grand Prix' AND T2.name = 'Brands Hatch' ORDER BY T1.year DESC LIMIT 1
SELECT COUNT(DISTINCT T2.year) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit' AND T2.name = 'British Grand Prix'
SELECT T3.forename, T3.surname FROM races AS T1 INNER JOIN driverStandings AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Singapore Grand Prix' AND T1.year = 2010 ORDER BY T2.position
SELECT T2.forename, T2.surname, T1.points FROM driverStandings AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.points DESC LIMIT 1
SELECT T3.forename || ' ' || T3.surname AS name, T1.points FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T1.driverId = T3.driverId WHERE T2.year = 2017 AND T2.name = 'Chinese Grand Prix' ORDER BY T1.points DESC LIMIT 3
SELECT T2.milliseconds, T3.surname, T1.year FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T3.milliseconds) AS average_lap_time FROM drivers AS T1 INNER JOIN lapTimes AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Sebastian' AND T1.surname = 'Vettel' AND T2.year = 2009 AND T2.name = 'Chinese Grand Prix'
SELECT CAST(SUM(CASE WHEN T3.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS percentage FROM drivers AS T1 INNER JOIN results AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.surname = 'Hamilton' AND T2.year >= 2010
SELECT T1.surname, T1.nationality, AVG(T2.points) FROM drivers AS T1 INNER JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T2.wins IS NOT NULL GROUP BY T1.surname, T1.nationality ORDER BY COUNT(T2.wins) DESC LIMIT 1
SELECT 2022 - strftime('%Y', dob) + 1 AS age, forename || ' ' || surname AS name FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1
SELECT T2.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year BETWEEN 1990 AND 2000 GROUP BY T2.name HAVING COUNT(T2.name) = 4
SELECT T2.name, T2.location, T1.name FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2006 AND T2.country = 'USA'
SELECT T1.name, T2.name, T2.location FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2005 AND SUBSTR(T1.date, 6, 2) = '09'
SELECT T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Alex' AND T1.surname = 'Yoong' AND T2.position < 10
SELECT COUNT(T4.driverId) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN results AS T3 ON T2.raceId = T3.raceId INNER JOIN driverStandings AS T4 ON T3.raceId = T4.raceId INNER JOIN drivers AS T5 ON T3.driverId = T5.driverId WHERE T1.name = 'Sepang International Circuit' AND T5.forename = 'Michael' AND T5.surname = 'Schumacher' AND T4.wins = 1
SELECT T3.name, T3.year FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Michael' AND T1.surname = 'Schumacher' ORDER BY T2.milliseconds ASC LIMIT 1
SELECT AVG(T3.points) FROM drivers AS T1 INNER JOIN results AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Eddie' AND T1.surname = 'Irvine' AND T2.year = 2000
SELECT T3.year, T1.points FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T2.surname = 'Hamilton' ORDER BY T3.year LIMIT 1
SELECT T1.name, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2017 ORDER BY T1.date
SELECT T2.laps, T1.name, T1.year, T3.location FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId ORDER BY T2.laps DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE name = 'Silverstone Circuit' OR name = 'Hockenheimring' OR name = 'Hungaroring' ORDER BY lat DESC LIMIT 1
SELECT circuitRef FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt IS NOT NULL ORDER BY alt DESC LIMIT 1
SELECT COUNT(driverId) FROM drivers WHERE code IS NULL
SELECT nationality FROM drivers ORDER BY dob LIMIT 1
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverRef FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT T1.name FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T2.year = 2009 AND T2.name = 'Spanish Grand Prix'
SELECT T2.year FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'
SELECT T2.url FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Silverstone Circuit'
SELECT T2.time FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.location = 'Abu Dhabi' AND T2.year = 2010
SELECT COUNT(T2.circuitId) FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T2.country = 'Italy'
SELECT T2.date FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Circuit de Barcelona-Catalunya'
SELECT T2.url FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId WHERE T1.year = 2009 AND T1.name = 'Spanish Grand Prix'
SELECT MIN(T2.fastestLapTime) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.fastestLapSpeed DESC LIMIT 1
SELECT T2.driverRef FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'Australian Grand Prix' AND T3.year = 2008 AND T1.positionOrder = 1
SELECT T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T3.name FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.rank IS NOT NULL ORDER BY T2.rank ASC LIMIT 1
SELECT MAX(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT DISTINCT T3.year FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.positionOrder FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T2.raceId = T3.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T3.name = 'Australian Grand Prix' AND T3.year = 2008
SELECT T3.forename, T3.surname FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.grid = 4
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix' AND T2.time IS NOT NULL
SELECT T3.fastestLapTime FROM races AS T1 INNER JOIN results AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT T2.time FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.positionOrder = 2
SELECT T2.forename, T2.url FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.year = 2008 AND T3.name = 'Australian Grand Prix' AND T1.time IS NOT NULL ORDER BY T1.time ASC LIMIT 1
SELECT COUNT(T3.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T3.nationality = 'American'
SELECT COUNT(T1.driverId) FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.year = 2008 AND T2.name = 'Australian Grand Prix' AND T1.time IS NOT NULL
SELECT SUM(T2.points) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.surname = 'Hamilton'
SELECT AVG(CAST(SUBSTR(T2.fastestLapTime, 4, 2) AS REAL) * 60 + CAST(SUBSTR(T2.fastestLapTime, 7) AS REAL)) AS average_fastest_lap_time_seconds FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.raceId) AS completion_rate FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2008 AND T1.name = 'Australian Grand Prix'
SELECT ((julianday('2000-01-01 ' || MAX(CASE WHEN T2.positionOrder = 1 THEN T2.time ELSE NULL END)) - julianday('2000-01-01 ' || MIN(CASE WHEN T2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = T1.raceId) THEN T2.time ELSE NULL END))) / julianday('2000-01-01 ' || MIN(CASE WHEN T2.positionOrder = (SELECT MAX(positionOrder) FROM results WHERE raceId = T1.raceId) THEN T2.time ELSE NULL END))) * 100 AS percentage_faster FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Australian Grand Prix' AND T1.year = 2008 AND T2.time IS NOT NULL
SELECT COUNT(circuitId) FROM circuits WHERE location = 'Melbourne' AND country = 'Australia'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT COUNT(*) FROM drivers WHERE nationality = 'British' AND STRFTIME('%Y', dob) > '1980'
SELECT AVG(T2.points) FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'British'
SELECT T2.constructorRef FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId ORDER BY T1.points DESC LIMIT 1
SELECT T2.name FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.raceId = 291 AND T1.points = 0
SELECT COUNT(DISTINCT T1.constructorId) FROM constructors AS T1 INNER JOIN constructorResults AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Japanese' AND T2.points = 0 GROUP BY T1.constructorId HAVING COUNT(T2.raceId) = 2
SELECT T2.name FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId WHERE T1.position = 1
SELECT COUNT(DISTINCT T1.constructorId) FROM constructors AS T1 INNER JOIN results AS T2 ON T1.constructorId = T2.constructorId INNER JOIN lapTimes AS T3 ON T2.raceId = T3.raceId WHERE T1.nationality = 'French' AND T3.lap > 50
SELECT (CAST(SUM(CASE WHEN T2.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 AS completion_percentage FROM races T1 INNER JOIN results T2 ON T1.raceId = T2.raceId INNER JOIN drivers T3 ON T2.driverId = T3.driverId WHERE T3.nationality = 'Japanese' AND T1.year BETWEEN 2007 AND 2009
SELECT T1.year, AVG(SUBSTR(T2.time, 1, 2) * 3600 + SUBSTR(T2.time, 4, 2) * 60 + SUBSTR(T2.time, 7, 2) + SUBSTR(T2.time, 10, 3) * 0.001) AS average_seconds FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.time IS NOT NULL GROUP BY T1.year
SELECT T1.forename, T1.surname FROM drivers AS T1 INNER JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T2.position = 2 AND STRFTIME('%Y', T1.dob) > '1975'
SELECT COUNT(T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Italian' AND T2.milliseconds IS NULL
SELECT T2.forename, T2.surname FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapTime IS NOT NULL ORDER BY T1.fastestLapTime LIMIT 1
SELECT T4.fastestLap FROM seasons AS T1 INNER JOIN races AS T2 ON T1.year = T2.year INNER JOIN driverStandings AS T3 ON T2.raceId = T3.raceId INNER JOIN results AS T4 ON T2.raceId = T4.raceId AND T3.driverId = T4.driverId WHERE T1.year = 2009 AND T3.position = 1 AND T4.fastestLap IS NOT NULL ORDER BY T4.fastestLap LIMIT 1
SELECT AVG(T2.fastestLapSpeed) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Spanish Grand Prix' AND T1.year = 2009
SELECT T2.name, T2.year FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.milliseconds IS NOT NULL ORDER BY T1.milliseconds ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.laps > 50 AND STRFTIME('%Y', T1.dob) < '1985' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(DISTINCT T1.driverId) AS percentage FROM drivers AS T1 INNER JOIN results AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T2.year BETWEEN 2000 AND 2005
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'French' AND T2.milliseconds < 120000
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceId FROM races WHERE year = 2009
SELECT COUNT(DISTINCT driverId) FROM results WHERE raceId = 18
WITH Top3Youngest AS (SELECT driverId, nationality FROM drivers ORDER BY dob DESC LIMIT 3) SELECT COUNT(*) FROM Top3Youngest WHERE nationality = 'Dutch';
SELECT driverRef FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT COUNT(*) FROM drivers WHERE nationality = 'Australian' AND STRFTIME('%Y', dob) = '1980'
SELECT T2.driverId FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T2.nationality = 'German' AND STRFTIME('%Y', T2.dob) BETWEEN '1980' AND '1990' ORDER BY T1.milliseconds LIMIT 3
SELECT driverRef FROM drivers WHERE nationality = 'German' ORDER BY dob ASC LIMIT 1
SELECT T2.driverId, T2.code FROM results AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.fastestLapTime IS NOT NULL AND STRFTIME('%Y', T2.dob) = '1971'
SELECT T1.driverId, T2.milliseconds FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'Spanish' AND STRFTIME('%Y', T1.dob) < '1982' ORDER BY T2.milliseconds DESC LIMIT 10
SELECT T1.year FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T2.fastestLapTime IS NOT NULL ORDER BY T2.fastestLapTime ASC LIMIT 1
SELECT T2.year FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.time DESC LIMIT 1
SELECT driverId FROM lapTimes WHERE lap = 1 AND milliseconds IS NOT NULL ORDER BY milliseconds ASC LIMIT 5
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.raceId BETWEEN 50 AND 100 AND T2.statusId = 2 AND T2.time IS NOT NULL
SELECT COUNT(T1.location), T1.location, T1.lat, T1.lng FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId WHERE T1.country = 'Austria' GROUP BY T1.location, T1.lat, T1.lng
SELECT T2.round FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.time IS NOT NULL GROUP BY T2.round ORDER BY COUNT(T1.time) DESC LIMIT 1
SELECT T2.driverRef, T2.nationality, T2.dob FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId WHERE T1.raceId = 23 AND T1.q2 IS NOT NULL
SELECT T3.year, T3.name, T3.date, T3.time FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId ORDER BY T2.dob DESC LIMIT 1
SELECT COUNT(DISTINCT T1.driverId) FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'American' AND T2.statusId = 2
SELECT T1.url FROM constructors AS T1 INNER JOIN constructorStandings AS T2 ON T1.constructorId = T2.constructorId WHERE T1.nationality = 'Italian' ORDER BY T2.points DESC LIMIT 1
SELECT T2.url FROM constructorStandings AS T1 INNER JOIN constructors AS T2 ON T1.constructorId = T2.constructorId GROUP BY T2.url ORDER BY SUM(T1.wins) DESC LIMIT 1
SELECT T2.forename FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId INNER JOIN races AS T3 ON T1.raceId = T3.raceId WHERE T3.name = 'French Grand Prix' AND T1.lap = 3 ORDER BY T1.milliseconds DESC LIMIT 1
SELECT T2.name, T1.milliseconds FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T1.lap = 1 ORDER BY T1.milliseconds ASC LIMIT 1
SELECT AVG(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'United States Grand Prix' AND T1.year = 2006 AND T2.rank < 11
SELECT T1.driverId FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.nationality = 'German' AND T1.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY T1.driverId ORDER BY SUM(T2.duration) / COUNT(T2.duration) LIMIT 5
SELECT T1.time FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId WHERE T2.name = 'Canadian Grand Prix' AND T2.year = 2008 AND T1.positionOrder = 1
SELECT T3.constructorRef, T3.url FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN constructors AS T3 ON T1.constructorId = T3.constructorId WHERE T2.year = 2009 AND T2.name = 'Singapore Grand Prix' ORDER BY T1.positionOrder LIMIT 1
SELECT forename, surname, dob FROM drivers WHERE nationality = 'Austrian' AND STRFTIME('%Y', dob) BETWEEN '1981' AND '1991'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT T2.points, T3.name, T3.nationality FROM races AS T1 INNER JOIN constructorResults AS T2 ON T1.raceId = T2.raceId INNER JOIN constructors AS T3 ON T2.constructorId = T3.constructorId WHERE T1.name = 'Monaco Grand Prix' AND T1.year BETWEEN 1980 AND 2010 ORDER BY T2.points DESC LIMIT 1
SELECT AVG(T3.points) FROM races AS T1 INNER JOIN results AS T3 ON T1.raceId = T3.raceId INNER JOIN drivers AS T2 ON T3.driverId = T2.driverId WHERE T1.name = 'Turkish Grand Prix' AND T2.forename = 'Lewis' AND T2.surname = 'Hamilton'
SELECT CAST(COUNT(raceId) AS REAL) / COUNT(DISTINCT year) FROM races WHERE year BETWEEN 2000 AND 2010
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(nationality) DESC LIMIT 1
SELECT T1.wins FROM driverStandings AS T1 WHERE T1.position = 91
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.fastestLapTime ASC LIMIT 1
SELECT T2.location, T2.country FROM races AS T1 INNER JOIN circuits AS T2 ON T1.circuitId = T2.circuitId ORDER BY T1.date DESC LIMIT 1
SELECT T4.forename, T4.surname FROM races AS T1 INNER JOIN qualifying AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId INNER JOIN drivers AS T4 ON T2.driverId = T4.driverId WHERE T3.location = 'Marina Bay' AND T1.year = 2008 ORDER BY T2.q3 LIMIT 1
SELECT T3.forename, T3.surname, T3.nationality, T1.name FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId INNER JOIN drivers AS T3 ON T2.driverId = T3.driverId ORDER BY T3.dob DESC LIMIT 1
SELECT COUNT(T1.raceId) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Canadian Grand Prix' AND T2.statusId = 3 GROUP BY T2.driverId ORDER BY COUNT(T2.statusId) DESC LIMIT 1
SELECT SUM(T2.wins) AS total_wins, T1.forename, T1.surname FROM drivers AS T1 INNER JOIN driverStandings AS T2 ON T1.driverId = T2.driverId WHERE T1.dob IS NOT NULL GROUP BY T1.driverId ORDER BY T1.dob ASC LIMIT 1
SELECT MAX(duration) FROM pitStops
SELECT time FROM lapTimes ORDER BY milliseconds ASC LIMIT 1
SELECT T2.duration FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T2.duration DESC LIMIT 1
SELECT T3.lap FROM drivers AS T1 INNER JOIN pitStops AS T3 ON T1.driverId = T3.driverId INNER JOIN races AS T2 ON T3.raceId = T2.raceId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' AND T2.year = 2011 AND T2.name = 'Australian Grand Prix'
SELECT T2.duration FROM races AS T1 INNER JOIN pitStops AS T2 ON T1.raceId = T2.raceId WHERE T1.year = 2011 AND T1.name = 'Australian Grand Prix'
SELECT MIN(T2.milliseconds) FROM drivers AS T1 INNER JOIN lapTimes AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT T2.forename, T2.surname FROM lapTimes AS T1 INNER JOIN drivers AS T2 ON T1.driverId = T2.driverId ORDER BY T1.milliseconds ASC LIMIT 1
SELECT T3.position FROM drivers AS T1 INNER JOIN results AS T2 ON T1.driverId = T2.driverId INNER JOIN lapTimes AS T3 ON T2.raceId = T3.raceId AND T2.fastestLap = T3.lap WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton' ORDER BY T3.time LIMIT 1
SELECT MIN(T2.fastestLapTime) FROM races AS T1 INNER JOIN results AS T2 ON T1.raceId = T2.raceId WHERE T1.name = 'Austrian Grand Prix'
SELECT T3.circuitId, MIN(T1.time) AS fastest_lap_time FROM lapTimes AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T3.country = 'Italy' GROUP BY T3.circuitId
SELECT T3.name FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T1.circuitId = T3.circuitId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.milliseconds LIMIT 1
SELECT T3.duration FROM races AS T1 INNER JOIN lapTimes AS T2 ON T1.raceId = T2.raceId INNER JOIN pitStops AS T3 ON T1.raceId = T3.raceId WHERE T1.name = 'Austrian Grand Prix' ORDER BY T2.milliseconds LIMIT 1
SELECT T3.lat, T3.lng FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.fastestLapTime = '1:29.488'
SELECT AVG(T2.milliseconds) FROM drivers AS T1 INNER JOIN pitStops AS T2 ON T1.driverId = T2.driverId WHERE T1.forename = 'Lewis' AND T1.surname = 'Hamilton'
SELECT AVG(T3.milliseconds) FROM circuits AS T1 INNER JOIN races AS T2 ON T1.circuitId = T2.circuitId INNER JOIN lapTimes AS T3 ON T2.raceId = T3.raceId WHERE T1.country = 'Italy'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating IS NOT NULL ORDER BY overall_rating DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential IS NOT NULL ORDER BY potential ASC LIMIT 1
SELECT COUNT(id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT T1.player_api_id FROM Player_Attributes AS T1 WHERE T1.crossing IS NOT NULL ORDER BY T1.crossing DESC LIMIT 5
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.season = '2015/2016' AND T1.home_team_goal < T1.away_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN (SELECT player_fifa_api_id, MAX(penalties) AS max_penalties FROM Player_Attributes GROUP BY player_fifa_api_id) AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.max_penalties DESC LIMIT 10
SELECT T2.away_team_api_id FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Scotland Premier League' AND T2.season = '2009/2010' AND T2.away_team_goal > T2.home_team_goal GROUP BY T2.away_team_api_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.buildUpPlaySpeed FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed IS NOT NULL ORDER BY T2.buildUpPlaySpeed DESC LIMIT 4
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' AND T1.home_team_goal = T1.away_team_goal GROUP BY T2.name ORDER BY COUNT(T2.name) DESC LIMIT 1
SELECT (strftime('%Y', 'now') - strftime('%Y', T2.birthday)) AS age FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.sprint_speed >= 97 AND T1.date BETWEEN '2013-01-01 00:00:00' AND '2015-12-31 00:00:00'
SELECT T2.name, COUNT(T1.league_id) FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id GROUP BY T2.name ORDER BY COUNT(T1.league_id) DESC LIMIT 1
SELECT AVG(height) FROM Player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59'
SELECT player_api_id FROM Player_Attributes WHERE date LIKE '2010%' AND overall_rating > ( SELECT AVG(overall_rating) FROM Player_Attributes WHERE date LIKE '2010%' )
SELECT team_fifa_api_id FROM Team_Attributes WHERE buildUpPlaySpeed BETWEEN 51 AND 59
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T2.date LIKE '2012%' AND T2.buildUpPlayPassing > (SELECT AVG(buildUpPlayPassing) FROM Team_Attributes WHERE date LIKE '2012%' AND buildUpPlayPassing IS NOT NULL)
SELECT CAST(SUM(CASE WHEN T2.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.player_fifa_api_id) AS percentage FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.birthday BETWEEN '1987-01-01 00:00:00' AND '1992-12-31 00:00:00'
SELECT league_id FROM `Match` GROUP BY league_id ORDER BY SUM(home_team_goal + away_team_goal) DESC LIMIT 5
SELECT AVG(T2.long_shots) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ahmed Samir Farag'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 GROUP BY T1.player_name ORDER BY SUM(T2.heading_accuracy) / COUNT(T2.player_fifa_api_id) DESC LIMIT 10
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayDribblingClass = 'Normal' AND T1.date LIKE '2014%' GROUP BY T2.team_long_name HAVING SUM(T1.chanceCreationPassing) / COUNT(T1.id) < ( SELECT CAST(SUM(chanceCreationPassing) AS REAL) / COUNT(id) FROM Team_Attributes WHERE date LIKE '2014%' ) ORDER BY SUM(T1.chanceCreationPassing) DESC
SELECT T1.name FROM League AS T1 INNER JOIN `Match` AS T2 ON T1.id = T2.league_id WHERE T2.season = '2009/2010' GROUP BY T1.name HAVING AVG(T2.home_team_goal) > AVG(T2.away_team_goal)
SELECT team_short_name FROM Team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM Player WHERE SUBSTR(birthday, 1, 4) = '1970' AND SUBSTR(birthday, 6, 2) = '10'
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Franco Zennaro'
SELECT T2.buildUpPlayPositioningClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'ADO Den Haag'
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francois Affolter' AND T2.date = '2014-09-18 00:00:00'
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Gabriel Tamas' AND STRFTIME('%Y', T2.`date`) = '2011'
SELECT COUNT(T2.id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Scotland Premier League' AND T2.season = '2015/2016'
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.birthday DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.potential DESC LIMIT 1
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.weight < 130 AND T2.preferred_foot = 'left'
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.chanceCreationPassingClass = 'Risky'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'David Wilson'
SELECT T2.birthday FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT T1.name FROM League AS T1 INNER JOIN Country AS T2 ON T1.country_id = T2.id WHERE T2.name = 'Netherlands'
SELECT AVG(T2.home_team_goal) FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Poland' AND T2.season = '2010/2011'
SELECT T1.player_api_id FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height IN (SELECT MAX(height) FROM Player UNION SELECT MIN(height) FROM Player) AND T2.finishing IS NOT NULL GROUP BY T1.player_api_id ORDER BY AVG(T2.finishing) DESC LIMIT 1
SELECT player_name FROM Player WHERE height > 180
SELECT COUNT(id) FROM Player WHERE strftime('%Y', birthday) > '1990'
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.overall_rating > 80 AND STRFTIME('%Y', T1.`date`) BETWEEN '2008' AND '2010'
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.preferred_foot = 'left'
SELECT T1.team_long_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeedClass = 'Fast'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'CLB'
SELECT T2.team_short_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlayPassing > 70
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.height > 170 AND STRFTIME('%Y', T2.`date`) BETWEEN '2010' AND '2015'
SELECT player_name FROM Player ORDER BY height ASC LIMIT 1
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Italy Serie A'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.buildUpPlaySpeed = 31 AND T2.buildUpPlayDribbling = 53 AND T2.buildUpPlayPassing = 32
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Doran'
SELECT COUNT(T2.id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', T2.date) BETWEEN '2008-08' AND '2008-10'
SELECT T2.team_short_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.home_team_goal = 10
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.balance = (SELECT MAX(balance) FROM Player_Attributes WHERE potential = 61) AND T1.potential = 61
SELECT AVG(CASE WHEN T2.player_name = 'Abdou Diallo' THEN T1.ball_control ELSE NULL END) - AVG(CASE WHEN T2.player_name = 'Aaron Appindangoye' THEN T1.ball_control ELSE NULL END) AS difference FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.ball_control IS NOT NULL
SELECT team_long_name FROM Team WHERE team_short_name = 'GEN'
SELECT player_name FROM Player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday ASC LIMIT 1
SELECT id FROM Player ORDER BY height DESC LIMIT 1
SELECT COUNT(id) FROM Player_Attributes WHERE preferred_foot = 'left' AND attacking_work_rate = 'low'
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Belgium Jupiler League'
SELECT T2.id FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Germany'
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) < '1986' AND T2.defensive_work_rate = 'high'
SELECT T1.player_name FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name IN ('Alexis', 'Ariel Borysiuk', 'Arouna Kone') ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.heading_accuracy FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Ariel Borysiuk'
SELECT COUNT(T1.player_api_id) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height > 180 AND T2.volleys > 70
SELECT DISTINCT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.volleys > 70 AND T1.dribbling > 70
SELECT COUNT(T2.id) FROM Country AS T1 INNER JOIN Match AS T2 ON T1.id = T2.country_id WHERE T1.name = 'Belgium' AND T2.season = '2008/2009'
SELECT T2.long_passing FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.birthday LIMIT 1
SELECT COUNT(T2.id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Belgium Jupiler League' AND STRFTIME('%Y', T2.date) = '2009' AND STRFTIME('%m', T2.date) = '04'
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2008/2009' GROUP BY T2.name ORDER BY COUNT(T2.name) DESC LIMIT 1
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE strftime('%Y', T1.birthday) < '1986'
SELECT CAST((SUM(CASE WHEN T1.player_name = 'Ariel Borysiuk' THEN T2.overall_rating ELSE 0 END) - SUM(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE 0 END)) AS REAL) * 100 / SUM(CASE WHEN T1.player_name = 'Paulin Puel' THEN T2.overall_rating ELSE 0 END) AS percentage_difference FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id
SELECT AVG(T2.buildUpPlaySpeed) FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Heart of Midlothian'
SELECT AVG(T1.overall_rating) FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.player_name = 'Pietro Marino'
SELECT SUM(T2.crossing) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Lennox'
SELECT T2.chanceCreationPassing, T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Ajax' ORDER BY T2.chanceCreationPassing DESC LIMIT 1
SELECT T2.preferred_foot FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Abdou Diallo'
SELECT MAX(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Dorlan Pabon'
SELECT AVG(T3.away_team_goal) FROM Team AS T1 INNER JOIN Match AS T3 ON T1.team_api_id = T3.away_team_api_id INNER JOIN Country AS T2 ON T3.country_id = T2.id WHERE T1.team_long_name = 'Parma' AND T2.name = 'Italy'
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.overall_rating = 77 AND T1.date = '2016-06-23 00:00:00' ORDER BY T2.birthday LIMIT 1
SELECT T2.overall_rating FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Aaron Mooy' AND T2.date = '2016-02-04 00:00:00'
SELECT T2.potential FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francesco Parravicini' AND T2.date = '2010-08-30 00:00:00'
SELECT T2.attacking_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Francesco Migliore' AND T2.date = '2015-05-01 00:00:00'
SELECT T2.defensive_work_rate FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Kevin Berigaud' AND T2.date = '2013-02-22 00:00:00'
SELECT T2.date FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Kevin Constant' ORDER BY T2.crossing DESC LIMIT 1
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Willem II' AND T2.date = '2012-02-22 00:00:00'
SELECT T2.buildUpPlayDribblingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_short_name = 'LEI' AND T2.date = '2015-09-10 00:00:00'
SELECT T2.buildUpPlayPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'FC Lorient' AND T2.date = '2010-02-22 00:00:00'
SELECT T2.chanceCreationPassingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'PEC Zwolle' AND T2.date = '2013-09-20 00:00:00'
SELECT T2.chanceCreationCrossingClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'Hull City' AND T2.date = '2010-02-22 00:00:00'
SELECT T2.defenceAggressionClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_fifa_api_id = T2.team_fifa_api_id WHERE T1.team_long_name = 'Hannover 96' AND T2.`date` = '2015-09-10 00:00:00'
SELECT AVG(T2.overall_rating) FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Marko Arnautovic' AND T2.date BETWEEN '2007-02-22 00:00:00' AND '2016-04-21 00:00:00'
SELECT CAST((SUM(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating ELSE 0 END) - SUM(CASE WHEN T1.player_name = 'Jordan Bowery' THEN T2.overall_rating ELSE 0 END)) AS REAL) * 100 / SUM(CASE WHEN T1.player_name = 'Landon Donovan' THEN T2.overall_rating ELSE 0 END) AS percentage_difference FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T2.date = '2013-07-12 00:00:00'
SELECT player_name FROM Player ORDER BY height DESC LIMIT 5
SELECT player_api_id FROM Player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM Player WHERE (strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) > 34
SELECT COALESCE(SUM(T2.home_team_goal), 0) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.home_player_1, T2.home_player_2, T2.home_player_3, T2.home_player_4, T2.home_player_5, T2.home_player_6, T2.home_player_7, T2.home_player_8, T2.home_player_9, T2.home_player_10, T2.home_player_11) WHERE T1.player_name = 'Aaron Lennon'
SELECT SUM(T2.away_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON T1.player_api_id IN (T2.home_player_1, T2.home_player_2, T2.home_player_3, T2.home_player_4, T2.home_player_5, T2.home_player_6, T2.home_player_7, T2.home_player_8, T2.home_player_9, T2.home_player_10, T2.home_player_11, T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) WHERE T1.player_name IN ('Daan Smith', 'Filipe Ferreira')
SELECT SUM(T2.home_team_goal) FROM Player AS T1 INNER JOIN Match AS T2 ON (T1.player_api_id = T2.home_player_1 OR T1.player_api_id = T2.home_player_2 OR T1.player_api_id = T2.home_player_3 OR T1.player_api_id = T2.home_player_4 OR T1.player_api_id = T2.home_player_5 OR T1.player_api_id = T2.home_player_6 OR T1.player_api_id = T2.home_player_7 OR T1.player_api_id = T2.home_player_8 OR T1.player_api_id = T2.home_player_9 OR T1.player_api_id = T2.home_player_10 OR T1.player_api_id = T2.home_player_11) WHERE (strftime('%Y', 'now') - strftime('%Y', T1.birthday)) <= 30
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 10
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.potential DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.attacking_work_rate = 'high'
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.finishing = 1 ORDER BY T2.birthday ASC LIMIT 1
SELECT DISTINCT T2.player_name FROM Player AS T2 JOIN Match AS T1 ON T2.player_api_id IN (T1.home_player_1, T1.home_player_2, T1.home_player_3, T1.home_player_4, T1.home_player_5, T1.home_player_6, T1.home_player_7, T1.home_player_8, T1.home_player_9, T1.home_player_10, T1.home_player_11, T1.away_player_1, T1.away_player_2, T1.away_player_3, T1.away_player_4, T1.away_player_5, T1.away_player_6, T1.away_player_7, T1.away_player_8, T1.away_player_9, T1.away_player_10, T1.away_player_11) JOIN Country AS T3 ON T1.country_id = T3.id WHERE T3.name = 'Belgium'
SELECT T1.player_name, T2.vision FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id WHERE T2.vision > 89
SELECT T4.name FROM Player AS T1 JOIN Match AS T2 ON T1.player_api_id IN (T2.home_player_1, T2.home_player_2, T2.home_player_3, T2.home_player_4, T2.home_player_5, T2.home_player_6, T2.home_player_7, T2.home_player_8, T2.home_player_9, T2.home_player_10, T2.home_player_11, T2.away_player_1, T2.away_player_2, T2.away_player_3, T2.away_player_4, T2.away_player_5, T2.away_player_6, T2.away_player_7, T2.away_player_8, T2.away_player_9, T2.away_player_10, T2.away_player_11) JOIN Country AS T4 ON T2.country_id = T4.id GROUP BY T4.name ORDER BY AVG(T1.weight) DESC LIMIT 1
SELECT T2.team_long_name FROM Team_Attributes AS T1 INNER JOIN Team AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.buildUpPlaySpeedClass = 'Slow'
SELECT T1.team_short_name FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T2.chanceCreationPassingClass = 'Safe'
SELECT AVG(T1.height) AS average_height FROM Player AS T1 JOIN Player_Attributes AS T2 ON T1.player_api_id = T2.player_api_id JOIN Country AS T3 ON T1.player_fifa_api_id = T3.id WHERE T3.name = 'Italy'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT COUNT(*) FROM Player WHERE player_name LIKE 'Aaron%' AND birthday > '1990-12-31'
SELECT (SELECT jumping FROM Player_Attributes WHERE id = 6 AND jumping IS NOT NULL) - (SELECT jumping FROM Player_Attributes WHERE id = 23 AND jumping IS NOT NULL) AS diff
SELECT player_api_id FROM Player_Attributes WHERE preferred_foot = 'right' ORDER BY potential ASC LIMIT 3
SELECT COUNT(id) FROM Player_Attributes WHERE preferred_foot = 'left' AND crossing = ( SELECT MAX(crossing) FROM Player_Attributes )
SELECT CAST(SUM(CASE WHEN strength > 80 AND stamina > 80 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(id) FROM Player_Attributes WHERE strength IS NOT NULL AND stamina IS NOT NULL
SELECT T1.name FROM Country AS T1 INNER JOIN League AS T2 ON T1.id = T2.country_id WHERE T2.name = 'Poland Ekstraklasa'
SELECT T2.home_team_goal, T2.away_team_goal FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Belgium Jupiler League' AND T2.date LIKE '2008-09-24%'
SELECT T2.sprint_speed, T2.agility, T2.acceleration FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.player_name = 'Alexis Blin'
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' AND T2.buildUpPlaySpeedClass IN ('Slow', 'Balanced', 'Fast')
SELECT COUNT(T2.id) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Italy Serie A' AND T2.season = '2015/2016'
SELECT MAX(T2.home_team_goal) FROM League AS T1 INNER JOIN Match AS T2 ON T1.id = T2.league_id WHERE T1.name = 'Netherlands Eredivisie'
SELECT T2.finishing, T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.weight DESC LIMIT 1
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY COUNT(T1.id) DESC LIMIT 1
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.away_team_api_id = T2.team_api_id ORDER BY T1.away_team_goal DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.height < 180 AND T2.strength > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id WHERE T1.height IS NOT NULL AND T2.strength IS NOT NULL
SELECT SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS DIFF, CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) - SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS PERCENTAGE FROM Patient WHERE SEX = 'M'
SELECT CAST(SUM(CASE WHEN strftime('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE SEX = 'F'
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) FROM Patient WHERE strftime('%Y', Birthday) BETWEEN '1930' AND '1940'
SELECT CAST(SUM(CASE  WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE  WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'
SELECT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109
SELECT DISTINCT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500
SELECT T1.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday LIKE '1937%' AND T2.`T-CHO` >= 250
SELECT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND (T2.TP < 6.0 OR T2.TP > 8.5) THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) AS Percentage FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.`aCL IgG`) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) >= 50
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Admission = '-' AND strftime('%Y', Description) = '1997'
SELECT MIN(strftime('%Y', `First Date`) - strftime('%Y', Birthday)) AS Age FROM Patient WHERE Birthday IS NOT NULL AND `First Date` IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` LIKE '1997%' AND T2.Thrombosis = 1 AND T1.SEX = 'F'
SELECT MAX(strftime('%Y', T1.Birthday) - strftime('%Y', 'now')) - MIN(strftime('%Y', T1.Birthday) - strftime('%Y', 'now')) AS age_gap FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200
SELECT T2.Symptoms, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID ORDER BY T1.Birthday DESC LIMIT 1
SELECT CAST(COUNT(DISTINCT T1.ID) AS REAL) / 12 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.Date BETWEEN '1998-01-01' AND '1998-12-31'
SELECT T2.Date, strftime('%Y', T1.`First Date`) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' ORDER BY T1.Birthday LIMIT 1
SELECT CAST(SUM(CASE WHEN T1.SEX = 'M' AND T2.UA <= 8.0 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.SEX = 'F' AND T2.UA <= 6.5 THEN 1 ELSE 0 END) AS ratio FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA <= 8.0) OR (T1.SEX = 'F' AND T2.UA <= 6.5)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.`Examination Date`) - strftime('%Y', T1.`First Date`) >= 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` BETWEEN '1990-01-01' AND '1993-12-31' AND strftime('%Y', T1.Birthday) <= strftime('%Y', T2.`Examination Date`) - 18
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-BIL` > 2.0
SELECT Diagnosis FROM Examination WHERE `Examination Date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY Diagnosis ORDER BY COUNT(Diagnosis) DESC LIMIT 1
SELECT AVG(CAST(strftime('%Y', T2.Date) AS int) - strftime('%Y', T1.Birthday)) AS Average_Age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date BETWEEN '1991-10-01' AND '1991-10-31'
SELECT strftime('%Y', T2.Date) - strftime('%Y', T1.Birthday) AS Age, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HGB IS NOT NULL ORDER BY T2.HGB DESC LIMIT 1
SELECT ANA FROM Examination WHERE ID = 3605340 AND `Examination Date` = '1996-12-02'
SELECT CASE WHEN T1.`T-CHO` < 250 THEN 'YES' ELSE 'NO' END FROM Laboratory AS T1 WHERE T1.ID = 2927464 AND T1.Date = '1995-09-04'
SELECT SEX FROM Patient WHERE Diagnosis = 'AORTITIS' ORDER BY `First Date` LIMIT 1
SELECT T2.`aCL IgM` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T1.Description = '1994-02-19' AND T2.`Examination Date` = '1993-11-12'
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1992-06-12' AND T2.GPT = 9
SELECT strftime('%Y', '1991-10-21') - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.Date = '1991-10-21' AND T2.UA = 8.4
SELECT COUNT(T2.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`First Date` = '1991-06-13' AND T1.Diagnosis = 'SJS' AND STRFTIME('%Y', T2.Date) = '1995'
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`Examination Date` = '1997-01-27' AND T2.Diagnosis = 'SLE'
SELECT T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-03-01' AND T2.`Examination Date` = '1993-09-27'
SELECT SUM(CASE WHEN strftime('%Y-%m', T2.Date) = '1981-11' THEN T2.`T-CHO` ELSE 0 END) - SUM(CASE WHEN strftime('%Y-%m', T2.Date) = '1981-12' THEN T2.`T-CHO` ELSE 0 END) AS Cholesterol_Decrease FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1959-02-18'
SELECT ID FROM Examination WHERE Diagnosis = 'Behcet' AND `Examination Date` BETWEEN '1997-01-01' AND '1997-12-31'
SELECT COUNT(DISTINCT T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` BETWEEN '1987-07-06' AND '1996-01-31' AND T2.GPT > 30 AND T2.ALB < 4
SELECT ID FROM Patient WHERE SEX = 'F' AND Admission = '+' AND Birthday LIKE '1964%'
SELECT COUNT(*) FROM Examination WHERE Thrombosis = 2 AND `ANA Pattern` = 'S' AND `aCL IgM` > (SELECT AVG(`aCL IgM`) * 1.2 FROM Examination WHERE `aCL IgM` IS NOT NULL)
SELECT CAST(SUM(CASE WHEN UA <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(ID) AS Percentage FROM Laboratory WHERE `U-PRO` > 0 AND `U-PRO` < 30
SELECT (CAST(SUM(CASE WHEN Diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) / COUNT(*)) * 100 AS percentage FROM Patient WHERE SEX = 'M' AND strftime('%Y', `First Date`) = '1981'
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.Date LIKE '1991-10%' AND T2.`T-BIL` < 2.0
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'p' AND T1.SEX = 'F' AND strftime('%Y', T1.Birthday) BETWEEN '1980' AND '1989'
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'PSS' AND T2.LDH = 123 AND T2.CRE = 1 AND T2.CRP = '2+'
SELECT AVG(T2.ALB) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T1.Diagnosis = 'SLE' AND T2.PLT > 400
SELECT symptoms FROM Examination WHERE Diagnosis = 'SLE' GROUP BY symptoms ORDER BY COUNT(symptoms) DESC LIMIT 1
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473
SELECT COUNT(ID) FROM Patient WHERE SEX = 'F' AND Diagnosis = 'APS'
SELECT COUNT(DISTINCT ID) FROM Laboratory WHERE STRFTIME('%Y', Date) = '1997' AND (TP <= 6 OR TP >= 8.5)
SELECT CAST(SUM(CASE WHEN T1.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) AS Proportion FROM Examination AS T1 WHERE T1.Symptoms = 'thrombocytopenia'
SELECT CAST(SUM(CASE WHEN SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(SEX) AS percentage FROM Patient WHERE strftime('%Y', Birthday) = '1980' AND Diagnosis = 'RA'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T1.Admission = '-' AND T1.Diagnosis = 'BEHCET' AND strftime('%Y', T2.`Examination Date`) BETWEEN '1995' AND '1997'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.WBC < 3.5
SELECT DISTINCT strftime('%J', T2.`Examination Date`) - strftime('%J', T1.`First Date`) AS days FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 821298
SELECT IIF(T1.SEX = 'M', IIF(T2.UA > 8.0, 'YES', 'NO'), IIF(T2.UA > 6.5, 'YES', 'NO')) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 57266
SELECT Date FROM Laboratory WHERE GOT >= 60 AND ID = 48473
SELECT DISTINCT T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT < 60 AND STRFTIME('%Y', T2.Date) = '1994'
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GPT >= 60
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT > 60 ORDER BY T1.Birthday ASC
SELECT AVG(LDH) FROM Laboratory WHERE LDH < 500
SELECT T1.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH BETWEEN 600 AND 800
SELECT DISTINCT T1.Admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP < 300
SELECT T1.ID, MAX(T2.ALP) < 300 AS ALP_Within_Normal_Range FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday = '1982-04-01' AND T2.ALP IS NOT NULL GROUP BY T1.ID
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TP < 6.0
SELECT T2.TP - 8.5 FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND T2.TP > 8.5
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND (T2.ALB <= 3.5 OR T2.ALB >= 5.5) ORDER BY T1.Birthday DESC
SELECT T1.ID, T2.ALB FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday LIKE '1982%' AND T2.ALB BETWEEN 3.5 AND 5.5
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' AND T2.UA > 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) AS Percentage FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F'
SELECT AVG(T2.UA) FROM Patient AS T1 INNER JOIN (SELECT ID, UA, MAX(Date) AS LatestDate FROM Laboratory GROUP BY ID) AS T2 ON T1.ID = T2.ID WHERE (T1.SEX = 'M' AND T2.UA < 8.0) OR (T1.SEX = 'F' AND T2.UA < 6.5)
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.UN = 29
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'RA' AND T2.UN < 30
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CRE >= 1.5
SELECT SUM(CASE WHEN T1.SEX = 'M' THEN 1 ELSE 0 END) - SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) > 0 AS RESULT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE >= 1.5
SELECT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` = (SELECT MAX(`T-BIL`) FROM Laboratory WHERE `T-BIL` IS NOT NULL)
SELECT T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`T-BIL` >= 2.0 GROUP BY T1.SEX
SELECT T1.ID, T2.`T-CHO` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID ORDER BY T1.Birthday ASC, T2.`T-CHO` DESC LIMIT 1
SELECT AVG(strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday)) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.`T-CHO` >= 250
SELECT DISTINCT T1.ID, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG > 300
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG >= 200 AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) > 50
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.CPK >= 250 AND strftime('%Y', T1.Birthday) BETWEEN '1936' AND '1956'
SELECT DISTINCT T1.ID, T1.SEX, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU >= 180 AND T2.`T-CHO` < 250
SELECT DISTINCT T1.ID, T2.GLU FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU < 180 AND STRFTIME('%Y', T1.Description) >= '1991'
SELECT DISTINCT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.WBC <= 3.5 OR T2.WBC >= 9.0 ORDER BY T1.Birthday
SELECT T1.Diagnosis, T1.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RBC < 3.5
SELECT DISTINCT T1.Admission FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'F' AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0) AND (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) >= 50
SELECT DISTINCT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.HGB < 10
SELECT T1.ID, T1.SEX FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.HGB BETWEEN 10 AND 17 ORDER BY T1.Birthday LIMIT 1
SELECT T1.ID, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) AS age FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.HCT > 52 GROUP BY T1.ID HAVING COUNT(T2.ID) >= 2
SELECT AVG(HCT) FROM Laboratory WHERE Date LIKE '1991%' AND HCT < 29
SELECT SUM(CASE WHEN PLT < 100 THEN 1 ELSE 0 END) - SUM(CASE WHEN PLT > 400 THEN 1 ELSE 0 END) FROM Laboratory
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE strftime('%Y', T2.Date) = '1984' AND T2.PLT BETWEEN 100 AND 400 AND (strftime('%Y', 'now') - strftime('%Y', T1.Birthday)) < 50
SELECT CAST(SUM(CASE WHEN T1.SEX = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.ID) AS percentage FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.PT >= 14 AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', T1.Birthday) > 55
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.`First Date`) > '1992' AND T2.PT < 14
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` > '1997-01-01' AND T2.APTT < 45
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.APTT > 45 AND T2.Thrombosis = 3
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.WBC BETWEEN 3.5 AND 9.0 AND (T2.FG < 150 OR T2.FG > 450)
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday > '1980-01-01' AND (T2.FG < 150 OR T2.FG > 450)
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`U-PRO` >= 30
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.`U-PRO` > 0 AND T2.`U-PRO` < 30
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGG < 900 AND T1.Symptoms = 'abortion'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.IGG BETWEEN 900 AND 2000 AND T2.Symptoms IS NOT NULL
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGA BETWEEN 80 AND 500 ORDER BY T1.IGA DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.IGA BETWEEN 80 AND 500 AND STRFTIME('%Y', T1.`First Date`) >= '1990'
SELECT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.IGM < 40 OR T1.IGM > 400 GROUP BY T2.Diagnosis ORDER BY COUNT(T2.Diagnosis) DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE (T2.CRP LIKE '+' OR T2.CRP LIKE '-' OR T2.CRP < 1.0) AND T1.Description IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRP NOT IN ('+-', '-') AND T2.CRP >= 1.0 AND T1.Birthday IS NOT NULL AND T1.Birthday != '0000-00-00' AND T1.Birthday != '' AND T1.Birthday <= DATE('now', '-18 years')
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.RA IN ('-', '+-') AND T2.KCT = '+'
SELECT DISTINCT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Birthday >= '1995-01-01' AND T2.RA IN ('-', '+-')
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T1.Birthday <= DATE('now', '-60 years')
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RF < 20 AND T1.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.C3 > 35 AND T2.`ANA Pattern` = 'P'
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.HCT < 29 OR T1.HCT > 52 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'APS' AND T2.C4 > 10
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP IN ('negative', '0') AND T1.Admission = '+'
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.RNP NOT IN ('-', '+-') ORDER BY T1.Birthday DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SM IN ('negative', '0') AND T1.Thrombosis = 1
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.SM NOT IN ('-', '+-') AND T1.SM IS NOT NULL ORDER BY T2.Birthday DESC LIMIT 3
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.`Examination Date` >= '1997-01-01' AND T2.SC170 IN ('-', '+-')
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T3.SC170 IN ('-', '+-') AND T1.SEX = 'M' AND T2.Symptoms = 'vertigo'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA IN ('-', '+-') AND STRFTIME('%Y', T1.`First Date`) < '1990'
SELECT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.SSA NOT IN ('-', '+-') ORDER BY T1.`First Date` LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('negative', '0') AND T2.Diagnosis = 'SLE'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.SSB IN ('-', '+-') AND T2.Symptoms IS NOT NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CENTROMEA IN ('-', '+-') AND T2.SSB IN ('-', '+-') AND T1.SEX = 'M'
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.DNA >= 8
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.DNA < 8 AND T1.Description IS NULL
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.`DNA-II` >= 8 AND T1.Admission = '+'
SELECT CAST(SUM(CASE WHEN T1.GOT >= 60 AND T2.Diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN T1.GOT >= 60 THEN 1 ELSE 0 END) AS percentage FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.GOT < 60
SELECT MIN(T1.Birthday) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GOT >= 60
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 ORDER BY T2.GPT DESC LIMIT 3
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GPT < 60 AND T1.SEX = 'M'
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH < 500 ORDER BY T2.LDH DESC, T1.`First Date` ASC LIMIT 1
SELECT T1.`First Date` FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH >= 500 ORDER BY T1.`First Date` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALP >= 300 AND T1.Admission = '+'
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND T2.ALP < 300
SELECT DISTINCT T2.Diagnosis FROM Laboratory AS T1 INNER JOIN Patient AS T2 ON T1.ID = T2.ID WHERE T1.TP < 6.0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SJS' AND T2.TP BETWEEN 6.0 AND 8.5
SELECT Date FROM Laboratory WHERE ALB BETWEEN 3.5 AND 5.5 ORDER BY ALB DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.ALB BETWEEN 3.5 AND 5.5 AND T2.TP BETWEEN 6.0 AND 8.5
SELECT T2.`aCL IgG`, T2.`aCL IgM`, T2.`aCL IgA` FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID INNER JOIN Laboratory AS T3 ON T1.ID = T3.ID WHERE T1.SEX = 'F' AND T3.UA > 6.50 ORDER BY T3.UA DESC LIMIT 1
SELECT MAX(T1.ANA) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.CRE < 1.5
SELECT T1.ID FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CRE < 1.5 ORDER BY T2.`aCL IgA` DESC LIMIT 1
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID INNER JOIN Examination AS T3 ON T1.ID = T3.ID WHERE T2.`T-BIL` >= 2.0 AND T3.`ANA Pattern` LIKE '%P%'
SELECT T2.ANA FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-BIL` < 2.0 ORDER BY T1.`T-BIL` DESC LIMIT 1
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` >= 250 AND T2.KCT = '-'
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.`T-CHO` < 250 AND T2.`ANA Pattern` = 'P'
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.TG < 200 AND T2.Symptoms IS NOT NULL
SELECT T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.TG < 200 ORDER BY T2.TG DESC LIMIT 1
SELECT DISTINCT T1.ID FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis = 0 AND T2.CPK < 250
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.CPK < 250 AND (T2.KCT = '+' OR T2.RVVT = '+' OR T2.LAC = '+')
SELECT T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.GLU > 180 ORDER BY T1.Birthday ASC LIMIT 1
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '-' AND (T2.RBC <= 3.5 OR T2.RBC >= 6.0)
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.PLT BETWEEN 100 AND 400 AND T2.Diagnosis IS NOT NULL
SELECT T2.PLT FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'MCTD' AND T2.PLT BETWEEN 100 AND 400
SELECT AVG(T2.PT) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.SEX = 'M' AND T2.PT < 14
SELECT COUNT(T1.ID) FROM Examination AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Thrombosis IN (1, 2) AND T2.PT < 14
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'
SELECT COUNT(*) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.college = 'College of Engineering'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design'
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'
SELECT T3.phone FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer'
SELECT COUNT(T1.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.t_shirt_size = 'Medium'
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_name ORDER BY COUNT(T2.link_to_event) DESC LIMIT 1
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T3.event_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id INNER JOIN zip_code AS T4 ON T1.zip = T4.zip_code WHERE T1.first_name = 'Maya' AND T4.city = 'Mclean'
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison' AND STRFTIME('%Y', T3.event_date) = '2019'
SELECT COUNT(T1.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 10
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id HAVING COUNT(T1.event_id) > 20
SELECT CAST(COUNT(T1.event_id) AS REAL) / COUNT(DISTINCT T1.event_name) AS average_attendance FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type = 'Meeting' AND STRFTIME('%Y', T1.event_date) = '2020'
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1
SELECT COUNT(*) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Environmental Engineering'
SELECT T3.first_name, T3.last_name FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'Laugh Out Loud'
SELECT T2.last_name FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Law and Constitutional Studies'
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Tyler' AND T1.last_name = 'Hewitt'
SELECT SUM(T2.amount) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Food'
SELECT T2.city, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.position = 'President'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Illinois'
SELECT SUM(T2.spent) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Meeting' AND T2.category = 'Advertisement'
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.last_name = 'Pierce' OR T1.last_name = 'Guidi'
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'October Speaker'
SELECT T3.approved FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'October Meeting' AND T1.event_date = '2019-10-08'
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Elijah' AND T1.last_name = 'Allen' AND (STRFTIME('%m', T2.expense_date) = '09' OR STRFTIME('%m', T2.expense_date) = '10')
SELECT SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2019' THEN T2.spent ELSE 0 END) - SUM(CASE WHEN STRFTIME('%Y', T1.event_date) = '2020' THEN T2.spent ELSE 0 END) AS difference FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event
SELECT location FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04'
SELECT remaining FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT notes FROM income WHERE source = 'Fundraising' AND date_received = '2019-09-14'
SELECT COUNT(major_id) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Adela' AND T1.last_name = 'O''Gallagher'
SELECT COUNT(*) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'November Meeting' AND T2.remaining < 0
SELECT SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'September Speaker'
SELECT T2.event_status FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Post Cards, Posters' AND T1.expense_date = '2019-08-20'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.last_name = 'Thomason'
SELECT COUNT(*) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Human Development and Family Studies' AND T2.t_shirt_size = 'Large'
SELECT T2.type FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Christof' AND T1.last_name = 'Nielson'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'President'
SELECT T2.date_received FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.last_name = 'Hilton' AND T1.first_name = 'Connor' AND T2.source = 'Dues'
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.source = 'Dues' ORDER BY T1.date_received LIMIT 1
SELECT CAST(SUM(CASE WHEN T2.event_name = 'Yearly Kickoff' THEN T1.amount ELSE 0 END) AS REAL) / SUM(CASE WHEN T2.event_name = 'October Meeting' THEN T1.amount ELSE 0 END) FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Advertisement'
SELECT CAST(SUM(CASE WHEN T2.category = 'Parking' THEN T2.amount ELSE 0 END) AS REAL) * 100 / SUM(T2.amount) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'November Speaker'
SELECT SUM(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT COUNT(city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT T2.city, T2.county, T2.state FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Amy' AND T1.last_name = 'Firth'
SELECT T2.expense_description FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T1.remaining = ( SELECT MIN(remaining) FROM budget )
SELECT T3.first_name, T3.last_name FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name = 'October Meeting'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id GROUP BY T2.college ORDER BY COUNT(T2.college) DESC LIMIT 1
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.phone = '809-555-3360'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id ORDER BY T1.amount DESC LIMIT 1
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President'
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer'
SELECT T2.date_received FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Casey' AND T1.last_name = 'Mason'
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T2.state = 'Maryland'
SELECT COUNT(T2.link_to_event) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member WHERE T1.phone = '954-555-6240'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'School of Applied Sciences, Technology and Education'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.spent / T2.amount DESC LIMIT 1
SELECT COUNT(member_id) FROM member WHERE position = 'President'
SELECT MAX(T2.spent) FROM budget AS T2
SELECT COUNT(event_id) FROM event WHERE type = 'Meeting' AND event_date LIKE '2020%'
SELECT SUM(spent) FROM budget WHERE category = 'Food'
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name HAVING COUNT(T2.link_to_event) > 7
SELECT T2.member_id FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major INNER JOIN attendance AS T4 ON T2.member_id = T4.link_to_member INNER JOIN event AS T3 ON T3.event_id = T4.link_to_event WHERE T1.major_name = 'Interior Design' AND T3.event_name = 'Community Theater'
SELECT T2.first_name, T2.last_name FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.city = 'Georgetown' AND T1.state = 'South Carolina'
SELECT SUM(T2.amount) FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Grant' AND T1.last_name = 'Gilmour'
SELECT T2.first_name, T2.last_name FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.amount > 40
SELECT SUM(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'Yearly Kickoff'
SELECT T5.member_id FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget INNER JOIN member AS T5 ON T3.link_to_member = T5.member_id WHERE T1.event_name = 'Yearly Kickoff'
SELECT T2.first_name, T2.last_name, T1.source FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id ORDER BY T1.amount DESC LIMIT 1
SELECT T3.event_name FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id ORDER BY T2.cost ASC LIMIT 1
SELECT CAST(SUM(CASE WHEN T3.event_name = 'Yearly Kickoff' THEN T1.cost ELSE 0 END) AS REAL) * 100 / SUM(T1.cost) FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN T1.major_name = 'Physics' THEN 1 ELSE 0 END) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major
SELECT source FROM income WHERE date_received LIKE '2019-09%' ORDER BY amount DESC LIMIT 1
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary'
SELECT COUNT(*) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Physics Teaching'
SELECT COUNT(T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Community Theater' AND STRFTIME('%Y', T1.event_date) = '2019'
SELECT COUNT(T1.link_to_event), T3.major_name FROM attendance AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN major AS T3 ON T2.link_to_major = T3.major_id WHERE T2.first_name = 'Luisa' AND T2.last_name = 'Guidi'
SELECT AVG(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Advertisement' ORDER BY T2.spent DESC LIMIT 1
SELECT COUNT(*) FROM member AS T1 INNER JOIN attendance AS T2 ON T1.member_id = T2.link_to_member INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T3.event_name = 'Women''s Soccer'
SELECT CAST(SUM(CASE WHEN type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(event_id) AS percentage FROM event WHERE event_date LIKE '2019%'
SELECT T3.cost FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.event_name = 'September Speaker' AND T3.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY COUNT(t_shirt_size) DESC LIMIT 1
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.status = 'Closed' ORDER BY T2.remaining ASC LIMIT 1
SELECT T3.event_name, SUM(T2.cost) FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget INNER JOIN event AS T3 ON T1.link_to_event = T3.event_id WHERE T3.event_name = 'October Meeting' AND T2.approved = 'true'
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'April Speaker' ORDER BY T2.amount ASC
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT budget_id FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3
SELECT SUM(cost) FROM expense WHERE expense_description = 'Parking'
SELECT SUM(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT T2.first_name, T2.last_name, SUM(T1.cost) AS total_cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY T2.first_name, T2.last_name
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.first_name = 'Sacha' AND T1.last_name = 'Harrison'
SELECT T2.expense_description FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.t_shirt_size = 'X-Large'
SELECT T2.zip FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.cost < 50
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Phillip'
SELECT T2.position FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business'
SELECT COUNT(*) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Business' AND T2.t_shirt_size = 'Medium'
SELECT T1.type FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 30
SELECT DISTINCT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_date = '2020-03-24T12:00:00'
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Vice President'
SELECT CAST(SUM(CASE WHEN T1.major_name = 'Mathematics' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.member_id) FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major
SELECT DISTINCT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215'
SELECT COUNT(*) FROM income WHERE amount = 50
SELECT COUNT(member_id) FROM member WHERE position = 'Member' AND t_shirt_size = 'X-Large'
SELECT COUNT(*) FROM major WHERE college = 'College of Agriculture and Applied Sciences' AND department = 'School of Applied Sciences, Technology and Education'
SELECT T1.last_name, T2.department, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'
SELECT T2.category FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.location = 'MU 215' AND T1.type = 'Guest Speaker' AND T2.spent = 0
SELECT T3.city, T3.state FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id INNER JOIN zip_code AS T3 ON T1.zip = T3.zip_code WHERE T2.department = 'Electrical and Computer Engineering Department' AND T1.position = 'Member'
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T3.member_id = T2.link_to_member WHERE T3.position = 'Vice President' AND T1.location = '900 E. Washington St.' AND T1.type = 'Social'
SELECT T2.last_name, T2.position FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Pizza' AND T1.expense_date = '2019-09-10'
SELECT T3.last_name FROM attendance AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id INNER JOIN member AS T3 ON T1.link_to_member = T3.member_id WHERE T2.event_name LIKE 'Women%' AND T3.position = 'Member'
SELECT CAST(SUM(CASE WHEN T2.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.member_id) AS percentage FROM member AS T1 INNER JOIN income AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Member' AND T1.t_shirt_size = 'Medium'
SELECT DISTINCT city FROM zip_code WHERE type = 'PO Box'
SELECT zip_code FROM zip_code WHERE type = 'PO Box' AND county = 'San Juan Municipio' AND state = 'Puerto Rico'
SELECT event_name FROM event WHERE type = 'Game' AND status = 'Closed' AND event_date BETWEEN '2019-03-15T00:00:00' AND '2020-03-20T23:59:59'
SELECT DISTINCT T1.link_to_event FROM budget AS T1 INNER JOIN expense AS T2 ON T1.budget_id = T2.link_to_budget WHERE T2.cost > 50
SELECT T2.first_name, T2.last_name, T3.link_to_event FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id INNER JOIN attendance AS T3 ON T1.link_to_member = T3.link_to_member WHERE T1.approved = 'true' AND T1.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Katy' AND T1.link_to_major = 'rec1N0upiVLy5esTO'
SELECT T1.phone FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Business' AND T2.college = 'College of Agriculture and Applied Sciences'
SELECT T2.email FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND T1.cost > 20
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'education' AND T2.college = 'College of Education & Human Services' AND T1.position = 'Member'
SELECT CAST(SUM(CASE WHEN T2.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.event_id) AS percentage_over_budget FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31'
SELECT expense_description FROM expense GROUP BY expense_description HAVING SUM(cost) / COUNT(expense_id) > 50
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT CAST(SUM(CASE WHEN type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(zip_code) FROM zip_code
SELECT T1.event_name, T1.location FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.remaining > 0
SELECT T1.event_name, T1.event_date FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T3.expense_description = 'Pizza' AND T3.cost BETWEEN 50 AND 100
SELECT T1.first_name, T1.last_name, T3.major_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN major AS T3 ON T1.link_to_major = T3.major_id WHERE T2.cost > 100
SELECT T1.location, T5.city, T5.county FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN income AS T3 ON T3.link_to_member = T2.link_to_member INNER JOIN zip_code AS T5 ON T1.location = T5.zip_code GROUP BY T1.location, T5.city, T5.county HAVING COUNT(T3.income_id) > 40
SELECT T1.member_id FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member INNER JOIN budget AS T3 ON T2.link_to_budget = T3.budget_id INNER JOIN event AS T4 ON T3.link_to_event = T4.event_id GROUP BY T1.member_id HAVING COUNT(DISTINCT T4.event_id) > 1 ORDER BY SUM(T2.cost) DESC LIMIT 1
SELECT AVG(T2.cost) FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member WHERE T1.position != 'Member'
SELECT T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T2.category = 'Parking' GROUP BY T1.event_id HAVING SUM(T3.cost) < ( SELECT AVG(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T2.category = 'Parking' )
SELECT CAST(SUM(T3.cost) AS REAL) * 100 / COUNT(T1.event_id) AS percentage_cost FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.type = 'Game' AND T3.cost IS NOT NULL
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Water, chips, and cookies' ORDER BY T1.cost DESC LIMIT 1
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name, T1.phone HAVING SUM(T2.cost) > (SELECT AVG(cost) FROM expense)
SELECT CAST(SUM(CASE WHEN T1.state = 'Maine' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.position) - CAST(SUM(CASE WHEN T1.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.position) FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'Member'
SELECT T2.major_name, T2.department FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Gerke'
SELECT T2.first_name, T2.last_name, T1.cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Water, Veggie tray, supplies'
SELECT T2.last_name, T2.phone FROM major AS T1 INNER JOIN member AS T2 ON T1.major_id = T2.link_to_major WHERE T1.major_name = 'Elementary Education'
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-09'
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'
SELECT T1.first_name, T1.last_name, T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position = 'Secretary'
SELECT SUM(T2.spent), T1.event_name FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T2.category = 'Speaker Gifts' GROUP BY T1.event_name
SELECT T2.city FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Garrett' AND T1.last_name = 'Girke'
SELECT T2.first_name, T2.last_name, T2.position FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T1.city = 'Lincolnton' AND T1.state = 'North Carolina' AND T1.zip_code = 28092
SELECT COUNT(GasStationID) FROM gasstations WHERE Country = 'CZE' AND Segment = 'Premium'
SELECT CAST(SUM(CASE WHEN Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN Currency = 'CZK' THEN 1 ELSE 0 END) FROM customers
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T2.Date LIKE '2012%' ORDER BY T2.Consumption LIMIT 1
SELECT AVG(T2.Consumption) / 12 AS Average_Monthly_Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date BETWEEN '201301' AND '201312'
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN 201101 AND 201112 AND T1.Currency = 'CZK' ORDER BY T2.Consumption DESC LIMIT 1
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T2.Date BETWEEN 201201 AND 201212 AND T2.Consumption < 30000
SELECT SUM(CASE WHEN T1.Currency = 'CZK' THEN T2.Consumption ELSE 0 END) - SUM(CASE WHEN T1.Currency = 'EUR' THEN T2.Consumption ELSE 0 END) AS ConsumptionDifference FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date BETWEEN '201201' AND '201212'
SELECT strftime('%Y', T2.Date) AS Year FROM yearmonth T2 JOIN customers T1 ON T2.CustomerID = T1.CustomerID WHERE T1.Currency = 'EUR' GROUP BY Year ORDER BY SUM(T2.Consumption) DESC LIMIT 1
SELECT T1.Segment FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Consumption IS NOT NULL GROUP BY T1.Segment ORDER BY SUM(T2.Consumption) ASC LIMIT 1
SELECT strftime('%Y', T2.Date) AS Year FROM yearmonth T2 JOIN customers T1 ON T2.CustomerID = T1.CustomerID WHERE T1.Currency = 'CZK' GROUP BY Year ORDER BY SUM(T2.Consumption) DESC LIMIT 1
SELECT T2.Date FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption DESC LIMIT 1
SELECT (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) - (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) AS diff1, (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) - (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) AS diff2, (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) - (SELECT AVG(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME' AND T1.Currency = 'CZK' AND T2.Date LIKE '2013%' ORDER BY T2.Consumption ASC LIMIT 1) AS diff3
WITH ConsumptionData AS (   SELECT     T1.Segment,     SUBSTR(T2.Date, 1, 4) AS Year,     SUM(T2.Consumption) AS TotalConsumption   FROM customers AS T1   INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID   WHERE T1.Currency = 'EUR' AND T2.Date BETWEEN '201201' AND '201312'   GROUP BY T1.Segment, Year ), PercentageIncreases AS (   SELECT     T1.Segment,     (T2.TotalConsumption - T1.TotalConsumption) / T1.TotalConsumption * 100 AS PercentageIncrease   FROM ConsumptionData AS T1   INNER JOIN ConsumptionData AS T2 ON T1.Segment = T2.Segment   WHERE T1.Year = '2012' AND T2.Year = '2013' ) SELECT   (SELECT Segment FROM PercentageIncreases ORDER BY PercentageIncrease DESC LIMIT 1) AS HighestIncreaseSegment,   (SELECT Segment FROM PercentageIncreases ORDER BY PercentageIncrease ASC LIMIT 1) AS LowestIncreaseSegment;
SELECT SUM(Consumption) FROM yearmonth WHERE CustomerID = 6 AND Date BETWEEN '201308' AND '201311'
SELECT SUM(IIF(Country = 'Czech Republic', 1, 0)) - SUM(IIF(Country = 'Slovakia', 1, 0)) FROM gasstations WHERE Segment = 'Discount'
SELECT SUM(CASE WHEN CustomerID = 7 THEN Consumption ELSE 0 END) - SUM(CASE WHEN CustomerID = 5 THEN Consumption ELSE 0 END) FROM yearmonth WHERE Date = '201304'
SELECT SUM(IIF(T1.Currency = 'Czech Koruna', 1, 0)) - SUM(IIF(T1.Currency = 'Euro', 1, 0)) AS MoreSMEs FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'SME'
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM' AND T1.Currency = 'Euro' AND T2.Date = '201310' ORDER BY T2.Consumption DESC LIMIT 1
SELECT T1.CustomerID, T2.Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' ORDER BY T2.Consumption DESC LIMIT 1
SELECT SUM(T2.Consumption) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201305' AND T1.Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN T2.Consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'LAM'
SELECT Country, COUNT(GasStationID) FROM gasstations WHERE Segment = 'Value for money' GROUP BY Country ORDER BY COUNT(GasStationID) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN Currency = 'Euro' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Segment) FROM customers WHERE Segment = 'KAM'
SELECT CAST(SUM(CASE WHEN Consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(CustomerID) FROM yearmonth WHERE Date = '201202'
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(GasStationID) FROM gasstations WHERE Country = 'Slovakia'
SELECT CustomerID FROM yearmonth WHERE Date = '201309' ORDER BY Consumption DESC LIMIT 1
SELECT T2.Segment FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201309' ORDER BY T1.Consumption ASC LIMIT 1
SELECT T1.CustomerID FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Date = '201206' AND T1.Segment = 'SME' ORDER BY T2.Consumption ASC LIMIT 1
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012%'
SELECT SUM(T2.Consumption) / 12 AS MonthlyConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'euro' GROUP BY T2.Date ORDER BY MonthlyConsumption DESC LIMIT 1
SELECT DISTINCT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID WHERE strftime('%Y%m', T1.Date) = '201309'
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T1.Date) = '201306'
SELECT DISTINCT T3.ChainID FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN gasstations AS T3 ON T2.GasStationID = T3.GasStationID WHERE T1.Currency = 'Euro'
SELECT DISTINCT T3.Description FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T1.Currency = 'euro'
SELECT AVG(Amount * Price) FROM transactions_1k WHERE Date LIKE '2012-01%'
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'euro' AND T2.Consumption > 1000
SELECT DISTINCT T3.Description FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID INNER JOIN products AS T3 ON T2.ProductID = T3.ProductID WHERE T1.Country = 'CZE'
SELECT DISTINCT T2.Time FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ChainID = 11
SELECT COUNT(T1.TransactionID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE' AND T1.Price > 1000
SELECT COUNT(T1.GasStationID) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE' AND T2.Date > '2012-01-01'
SELECT AVG(T2.Amount * T2.Price) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE'
SELECT AVG(T1.Price) FROM transactions_1k T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'Euro'
SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' GROUP BY CustomerID ORDER BY SUM(Price) DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-25' ORDER BY T1.Time ASC LIMIT 1
SELECT T2.Currency FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Time = '16:25:00' AND T1.Date = '2012-08-24'
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-23' AND T1.Time = '21:20:00'
SELECT COUNT(T1.CustomerID) FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR' AND T2.Date = '2012-08-26' AND T2.Time < '13:00:00'
SELECT T2.Segment FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID ORDER BY T1.Date ASC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Date = '2012-08-24' AND T1.Time = '12:42:00'
SELECT ProductID FROM transactions_1k WHERE Date = '2012-08-23' AND Time = '21:20:00'
SELECT T1.Price, T2.Date, T2.Consumption FROM transactions_1k AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-24' AND T1.Price = 124.05 AND T2.Date LIKE '201201%'
SELECT COUNT(T1.GasStationID) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Time BETWEEN '08:00:00' AND '09:00:00' AND T1.Date = '2012-08-26' AND T2.Country = 'CZE'
SELECT T2.Currency FROM yearmonth AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Consumption = 214582.17 AND T1.Date LIKE '%201306%'
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.CardID = 667467
SELECT T1.Country FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Date = '2012-08-24' AND T2.Amount = 548.4
SELECT CAST(SUM(CASE WHEN T2.Currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.CustomerID) FROM transactions_1k AS T1 INNER JOIN customers AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '2012-08-25'
SELECT ((SELECT T2.Consumption FROM yearmonth AS T2 WHERE T2.CustomerID = (SELECT T1.CustomerID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-25' AND T1.Price = 634.8) AND T2.Date LIKE '2012%') - (SELECT T3.Consumption FROM yearmonth AS T3 WHERE T3.CustomerID = (SELECT T1.CustomerID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-25' AND T1.Price = 634.8) AND T3.Date LIKE '2013%')) / (SELECT T2.Consumption FROM yearmonth AS T2 WHERE T2.CustomerID = (SELECT T1.CustomerID FROM transactions_1k AS T1 WHERE T1.Date = '2012-08-25' AND T1.Price = 634.8) AND T2.Date LIKE '2012%') AS ConsumptionDecreaseRate
SELECT T2.GasStationID FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Amount IS NOT NULL AND T2.Price IS NOT NULL GROUP BY T2.GasStationID ORDER BY SUM(T2.Amount * T2.Price) DESC LIMIT 1
SELECT CAST(SUM(CASE WHEN Segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(Segment) FROM gasstations WHERE Country = 'SVK'
SELECT SUM(Amount) FROM transactions_1k WHERE CustomerID = 38508 UNION ALL SELECT SUM(Amount) FROM transactions_1k WHERE Date LIKE '201201%' AND CustomerID = 38508
SELECT T2.Description FROM transactions_1k AS T1 INNER JOIN products AS T2 ON T1.ProductID = T2.ProductID GROUP BY T2.Description ORDER BY COUNT(T2.Description) DESC LIMIT 5
SELECT T1.CustomerID, T2.Price / T2.Amount AS AvgPricePerItem, T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Amount IS NOT NULL ORDER BY AvgPricePerItem DESC LIMIT 1
SELECT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.ProductID = 2 ORDER BY T1.Price DESC LIMIT 1
SELECT T1.Consumption FROM yearmonth AS T1 INNER JOIN ( SELECT DISTINCT CustomerID FROM transactions_1k WHERE ProductID = 5 AND Price / Amount > 29 ) AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Date = '201208'