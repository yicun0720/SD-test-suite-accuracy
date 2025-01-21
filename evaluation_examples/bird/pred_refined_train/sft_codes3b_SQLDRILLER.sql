SELECT max(`percent (%) eligible free (k-12)`) FROM frpm WHERE `county name` = 'Alameda'
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm WHERE `educational option type` = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` ASC LIMIT 3;
SELECT zip FROM schools WHERE charter = 1 AND county = 'Fresno'
SELECT schools.mailstreet FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY frpm.`frpm count (k-12)` DESC LIMIT 1
SELECT phone FROM schools WHERE charter = 1 AND opendate > '2000-01-01' AND fundingtype = 'Directly funded';
SELECT count(*) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 400 AND schools.virtual = 'F'
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 > 500 AND schools.magnet = 1
SELECT schools.phone FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores);
SELECT satscores.numtsttakr FROM satscores INNER JOIN frpm ON satscores.cds = frpm.cdscode WHERE frpm."FRPM count (k-12)" = ( SELECT max("FRPM count (k-12)") FROM frpm )
SELECT count(schools.cdscode) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 560 AND schools.charter = 1
SELECT frpm."FRPM count (ages 5-17)" FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE satscores.avgscrread = (SELECT max(satscores.avgscrread) FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrread IS NOT NULL);
SELECT "School Code" FROM frpm WHERE "Enrollment (k-12)" + "Enrollment (ages 5-17)" > 500
SELECT max(frpm.`free meal count (ages 5-17)`) FROM satscores satscores JOIN frpm frpm ON satscores.cds = frpm.cdscode WHERE satscores.numge1500 > 0 AND satscores.numtsttakr > 0 AND satscores.avgscrread > 0 AND satscores.avgscrmath > 0 AND frpm.`free meal count (ages 5-17)` > 0 AND frpm.`enrollment (ages 5-17)` > 0 AND satscores.avgscrread IS NOT NULL AND satscores.avgscrmath IS NOT NULL AND satscores.numge1500 IS NOT NULL AND satscores.numtsttakr IS NOT NULL AND frpm.`free meal count (ages 5-17)` IS NOT NULL AND frpm.`enrollment (ages 5-17)` IS NOT NULL;
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3
SELECT schools.ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5
SELECT dname FROM satscores WHERE avgscrread IS NOT NULL GROUP BY dname ORDER BY avg(avgscrread) DESC LIMIT 1;
SELECT count(schools.school) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Alameda' AND satscores.numtsttakr < 100
SELECT DISTINCT schools.charternum FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrwrite > 499
SELECT count(schools.school) FROM schools INNER JOIN satscores ON satscores.cds = schools.cdscode WHERE schools.city = 'Fresno' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr <= 250
SELECT phone FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT count(frpm.`school name`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`high grade` = 12 AND frpm.`low grade` = 9 AND schools.county = 'Amador'
SELECT count(frpm.`school code`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.city = 'Los Angeles' AND frpm.`free meal count (k-12)` > 500 AND frpm.`free meal count (k-12)` < 700
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Contra Costa' ORDER BY satscores.numtsttakr DESC LIMIT 1
sql placeholder
SELECT DISTINCT frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE frpm.`percent (%) eligible free (k-12)` > 0.1 AND satscores.numtsttakr >= 1500
SELECT schools.school, schools.fundingtype FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.county = 'Riverside' AND satscores.avgscrmath > 400
sql placeholder
SELECT satscores.avgscrwrite, satscores.sname, schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.opendate > '1991-12-31' OR schools.closeddate < '2000-01-01'
SELECT schools.school, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' AND frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > ( SELECT avg(`enrollment (k-12)` - `enrollment (ages 5-17)`) FROM frpm )
SELECT schools.opendate FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.gsoffered = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`enrollment (k-12)` IS NOT NULL ORDER BY frpm.`enrollment (k-12)` LIMIT 5
SELECT frpm.`free meal count (k-12)`, frpm.`enrollment (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY schools.ncesschool LIMIT 9, 2
SELECT frpm.`percent (%) eligible free (k-12)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = '66' ORDER BY frpm.`free meal count (k-12)` DESC LIMIT 5
SELECT DISTINCT schools.website, schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`free meal count (ages 5-17)` BETWEEN 1900 AND 2000
SELECT frpm."Free meal count (ages 5-17)" / frpm."Enrollment (ages 5-17)" FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.admfname1 = 'Kacey' AND schools.admfname2 = 'Gibson'
SELECT schools.admemail1 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school (y/n)` = 1 ORDER BY frpm.`enrollment (k-12)` ASC LIMIT 1
SELECT DISTINCT schools.admfname1, schools.admfname2, schools.admfname3, schools.admlname3 FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores WHERE numge1500 IS NOT NULL);
SELECT schools.street, schools.city, schools.state, schools.zip FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr ASC LIMIT 1
SELECT schools.website FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numtsttakr BETWEEN 2000 AND 3000 AND schools.county = 'Los Angeles'
SELECT avg(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.city = 'Fresno'
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.dname = 'Fresno Unified' ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT satscores.sname FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.virtual = 'F' GROUP BY satscores.sname ORDER BY avg(satscores.avgscrread) DESC LIMIT 5
SELECT edopsname FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT satscores.avgscrmath, schools.county FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath = (SELECT min(avgscrmath) FROM satscores);
SELECT satscores.avgscrwrite, schools.city FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT satscores.sname, satscores.avgscrwrite FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.admfname1 = 'Ricci' AND schools.admlname1 = 'Ulrich'
SELECT schools.school FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.doc = '31' AND schools.gsserved = 'K-12' GROUP BY schools.school ORDER BY sum(frpm."Enrollment (k-12)") DESC LIMIT 1;
SELECT cast(count(schools.school) AS REAL) / 12 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alameda' AND schools.doc = '52' AND strftime('%Y', schools.opendate) = '1980'
SELECT cast(sum(CASE WHEN schools.doc = 54 THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN schools.doc = 52 THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Orange' AND schools.doc IN (52, 54)
SELECT schools.county, schools.school, schools.closeddate FROM schools schools WHERE schools.statustype = 'Closed' GROUP BY schools.county, schools.school, schools.closeddate ORDER BY count(schools.school) DESC LIMIT 1;
SELECT schools.mailstreet, schools.school FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrmath DESC LIMIT 1, 1
SELECT schools.mailstreet, schools.ncesschool FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.mailcity = 'Lakeport' AND satscores.numge1500 > 0
SELECT sum(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.mailcity = 'Fresno'
SELECT school, mailzip FROM schools WHERE admfname1 = 'Avetik'
SELECT (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Colusa') * 1.0 / (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Humboldt') AS ratio;
SELECT count(schools.mailstate) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailstate = 'CA' AND schools.mailcity = 'San Joaquin' AND schools.statustype = 'Active'
SELECT schools.phone, schools.ext FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrwrite DESC LIMIT 332, 1
SELECT phone, ext, school FROM schools WHERE zip = '95203-3704'
SELECT website FROM schools WHERE admfname1 IN ('Mike', 'Dante') AND admfname2 = 'Larson' AND admfname3 = 'Alvarez'
SELECT DISTINCT website FROM schools WHERE charter = 1 AND virtual = 'P' AND county = 'San Joaquin';
SELECT count(*) FROM schools WHERE city = 'Hickman' AND doc = '52' AND charter = 1;
SELECT count(schools.cdscode) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Los Angeles' AND schools.charter = 0 AND frpm.`percent (%) eligible free (k-12)` < 0.18
SELECT schools.admfname1, schools.admfname2, schools.school, schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = '00D2' AND schools.charter = 1
SELECT count(schools.mailcity) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = '00D4' AND schools.mailcity = 'Hickman'
SELECT cast(sum(CASE WHEN fundingtype = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM schools WHERE county = 'Santa Clara'
SELECT count(*) FROM schools WHERE fundingtype = 'Directly funded' AND county = 'Stanislaus' AND opendate BETWEEN '2000-01-01' AND '2005-12-31';
SELECT sum(CASE WHEN strftime('%Y', schools.closeddate) = '1989' THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.city = 'San Francisco'
SELECT county FROM schools WHERE strftime('%Y', closeddate) BETWEEN '1980' AND '1989' AND soc = '11' GROUP BY county ORDER BY county DESC LIMIT 1
SELECT ncesdist FROM schools WHERE soc = 31;
SELECT count(schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alpine' AND (schools.statustype = 'Active' OR schools.statustype = 'Closed') AND schools.edopsname = 'District Community Day School'
SELECT DISTINCT frpm."District Code" FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.magnet = 0 AND schools.city = 'Fresno';
SELECT sum(frpm.`enrollment (ages 5-17)`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SSS' AND frpm.`academic year` = '2014-2015'
SELECT frpm.`free meal count (ages 5-17)` FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailstreet = 'PO Box 1040' AND schools.edopsname = 'Youth Authority School';
SELECT frpm.`low grade` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SPECON' AND schools.ncesdist = '0613360' ORDER BY frpm.`low grade` ASC LIMIT 1
SELECT schools.eilname, frpm.`school name` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`county code` = 37 AND frpm.`nslp provision status` = 'Breakfast Provision 2'
SELECT schools.city FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.eilcode = 'HS' AND frpm.`low grade` = 9 AND frpm.`high grade` = 12 AND frpm.`nslp provision status` = 'Lunch Provision 2' AND frpm.`county name` = 'Merced' GROUP BY schools.city
sql placeholder
SELECT gsserved FROM schools WHERE city = 'Adelanto' GROUP BY gsserved HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM schools WHERE city = 'Adelanto' GROUP BY gsserved));
SELECT county, count(*) FROM schools WHERE city IN ('San Diego', 'Santa Barbara') AND virtual = 'N' GROUP BY county ORDER BY county DESC LIMIT 1
SELECT frpm."School Type", schools.school, schools.latitude FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.latitude = (SELECT max(latitude) FROM schools);
SELECT schools.city, frpm.`low grade` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.state = 'CA' ORDER BY schools.latitude ASC LIMIT 1
SELECT gsoffered FROM schools ORDER BY abs(longitude) DESC LIMIT 1
SELECT count(schools.city), schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.magnet = 1 AND frpm.`nslp provision status` = 'Multiple Provision Types' AND schools.gsserved = 'K-8 to 8' GROUP BY schools.city
SELECT admfname1, admfname2 FROM schools GROUP BY admfname1, admfname2 ORDER BY count(admfname1) DESC LIMIT 2
SELECT frpm."District Code", frpm."Percent (%) Eligible Free (K-12)" FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.admfname1 = 'Alusine'
SELECT schools.admlname3, schools.district, schools.county, schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = 40
SELECT DISTINCT schools.admemail1 FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = '62' AND schools.doc = '54' AND schools.opendate BETWEEN '2009-01-01' AND '2010-12-31' AND frpm."School Type" IN ('Public Intermediate/Middle Schools', 'Public Unified Schools');
SELECT schools.admemail1, schools.school FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr >= 1500 ORDER BY satscores.numtsttakr DESC LIMIT 1
SELECT count(DISTINCT account.account_id) FROM account account JOIN district district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND district.a3 = 'east Bohemia';
SELECT count(DISTINCT account.account_id) FROM district district JOIN account account ON district.district_id = account.district_id WHERE district.a3 = 'Prague';
SELECT a12, a13 FROM district ORDER BY a12 - a13 DESC LIMIT 1
SELECT count(district_id) FROM district WHERE district_id IN (SELECT district_id FROM client WHERE gender = 'F') AND a11 > 6000 AND a11 < 10000;
SELECT count(DISTINCT client.client_id) FROM client client JOIN district district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.a3 = 'north Bohemia' AND district.a11 > 8000;
SELECT account.account_id, ( SELECT district.a11 FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date LIMIT 1 ) - ( SELECT district.a11 FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date DESC LIMIT 1 ) AS gap FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date LIMIT 1
SELECT account.account_id FROM district district JOIN client client ON district.district_id = client.district_id JOIN account account ON client.district_id = account.district_id WHERE client.birth_date < client.birth_date AND district.a11 = (SELECT max(a11) FROM district);
SELECT count(DISTINCT client.client_id) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'DISPONENT'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE strftime('%Y', loan.date) = '1997' AND account.frequency = 'POPLATEK TYDNE' ORDER BY loan.amount LIMIT 1
SELECT account.account_id FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE account.date LIKE '1993%' AND loan.duration > 12 ORDER BY loan.amount DESC LIMIT 1
SELECT count(DISTINCT client.client_id) FROM client client JOIN district district ON client.district_id = district.district_id JOIN account account ON client.district_id = account.district_id WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.a2 = 'Sokolov';
SELECT account_id FROM account WHERE date = ( SELECT min(date) FROM account WHERE strftime('%Y', date) = '1995' )
SELECT DISTINCT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date < '1997-01-01' AND loan.amount > 3000
SELECT client.client_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON client.client_id = disp.client_id WHERE strftime('%Y-%m-%d', card.issued) = '1994-03-03'
SELECT account.date FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE trans.date = '1998-10-14' AND account.account_id = 840
SELECT account.district_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.date = '1994-08-25'
SELECT max(trans.amount) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON client.client_id = disp.client_id INNER JOIN account ON account.account_id = disp.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE strftime('%Y-%m-%d', card.issued) = '1996-10-21'
SELECT client.gender FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN district ON account.district_id = district.district_id ORDER BY district.a11 DESC LIMIT 1
SELECT t.amount FROM ( SELECT account.account_id, trans.amount FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id ORDER BY loan.amount DESC LIMIT 1 ) AS t
SELECT count(client.client_id) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.a2 = 'Jesenik' AND client.gender = 'F'
SELECT card.disp_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN trans ON disp.account_id = trans.account_id WHERE strftime('%Y-%m-%d', trans.date) = '1998-09-02' AND trans.amount = 5100
SELECT sum(CASE WHEN district.a2 = 'Litomerice' THEN 1 ELSE 0 END) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE strftime('%Y', account.date) = '1996'
SELECT district.a2 FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29'
SELECT client.birth_date FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE loan.date = '1996-01-03' AND loan.amount = 98832
SELECT account.account_id FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE district.a3 = 'Prague' ORDER BY client.client_id ASC LIMIT 1
SELECT cast(sum(CASE WHEN client.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.a3 = 'south Bohemia'
SELECT cast((sum(trans.balance) - sum(trans.balance)) AS REAL) * 100 / sum(trans.balance) FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE account.date = '1993-03-22' AND account.date = '1998-12-27' AND loan.date = '1993-07-05'
SELECT cast(sum(CASE WHEN loan.status = 'A' THEN loan.amount ELSE 0 END) AS REAL) * 100 / sum(loan.amount) FROM loan INNER JOIN account ON loan.account_id = account.account_id
SELECT cast(sum(CASE WHEN loan.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.amount < 100000
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN district ON account.district_id = district.district_id WHERE strftime('%Y', account.date) = '1993' AND account.frequency = 'POPLATEK PO OBRATU'
SELECT account.account_id, account.frequency FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a3 = 'east Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT account.account_id, account.date FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a2 = 'Prachatice'
SELECT a2, a3 FROM district WHERE district_id IN (SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE loan_id = '4990'));
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN district ON account.district_id = district.district_id INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.amount > 300000
SELECT loan.loan_id, district.a3, district.a11 FROM loan INNER JOIN district ON loan.account_id = district.district_id WHERE loan.duration = 60
SELECT district.a3, (district.a13 - district.a12) * 100 / district.a12 FROM district INNER JOIN loan ON district.district_id = loan.account_id WHERE loan.status = 'D'
SELECT cast(count(CASE WHEN district.a2 = 'Decin' THEN account.account_id ELSE NULL END) AS REAL) * 100 / count(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE strftime('%Y', account.date) = '1993'
SELECT account_id FROM account WHERE frequency LIKE 'POPLATEK MESICNE';
SELECT district.a2 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' GROUP BY district.district_id ORDER BY count(client.client_id) DESC LIMIT 9
SELECT district.a2 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE substr(trans.date, 1, 7) = '1996-01' AND trans.type = 'VYDAJ'
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id JOIN account account ON client.district_id = account.district_id WHERE district.a3 = 'south Bohemia' AND account.account_id NOT IN (SELECT client_id FROM card);
SELECT district.a3 FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.status = 'C' ORDER BY loan.amount DESC LIMIT 1
SELECT avg(loan.amount) FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M'
SELECT district_id, a2 FROM district ORDER BY a13 DESC LIMIT 1
SELECT count(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE a16 = (SELECT max(a16) FROM district));
SELECT count(account.account_id) FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0 AND trans.operation = 'VYBER KARTOU'
SELECT count(loan.loan_id) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.amount >= 250000 AND loan.date BETWEEN '1995-01-01' AND '1997-12-31'
SELECT count(DISTINCT account.account_id) FROM account account JOIN loan loan ON account.account_id = loan.account_id WHERE account.district_id = 1 AND loan.status = 'C';
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id WHERE district.a15 = (SELECT max(a15) FROM district) AND client.gender = 'M';
SELECT count(card.card_id) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT count(DISTINCT account.account_id) FROM district district JOIN account account ON district.district_id = account.district_id WHERE district.a2 = 'Pisek';
SELECT district.a3 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE substr(trans.date, 1, 4) = '1997' AND trans.amount > 10000
sql placeholder
SELECT DISTINCT account.account_id FROM card card JOIN disp disp ON card.disp_id = disp.disp_id JOIN account account ON disp.account_id = account.account_id WHERE card.type = 'gold';
SELECT avg(amount) FROM trans WHERE strftime('%Y', date) = '2021' AND operation = 'VYBER KARTOU'
SELECT DISTINCT account.account_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE strftime('%Y', trans.date) = '1998' AND trans.operation = 'VYBER KARTOU' AND trans.amount < ( SELECT avg(amount) FROM trans WHERE strftime('%Y', date) = '1998' AND operation = 'VYBER KARTOU' )
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN card ON card.disp_id = disp.disp_id INNER JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F'
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id WHERE district.a3 = 'south Bohemia' AND client.gender = 'F';
SELECT account.account_id FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a2 = 'Tabor' AND account.frequency = 'ELIGIBLE'
SELECT DISTINCT account.frequency, district.a11 FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'OWNER' AND district.a11 > 8000 AND district.a11 < 9000
SELECT count(DISTINCT account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE district.a3 = 'North Bohemia' AND trans.bank = 'AB'
SELECT a2 FROM district WHERE district_id IN (SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM trans WHERE TYPE = 'VYDAJ'));
SELECT cast(sum(a15) AS REAL) / count(district_id) FROM district WHERE district_id IN (SELECT district_id FROM account WHERE strftime('%Y', date) >= '1997') AND a15 > 4000;
SELECT count(DISTINCT card.card_id) FROM card card JOIN disp disp ON card.disp_id = disp.disp_id WHERE card.type = 'classic' AND disp.type = 'OWNER';
SELECT count(client.client_id) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.a2 = 'Hl.m. Praha' AND client.gender = 'M'
SELECT cast(sum(CASE WHEN TYPE = 'gold' AND strftime('%Y', issued) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / count(card_id) FROM card
SELECT client.client_id FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN client ON client.client_id = loan.account_id ORDER BY loan.amount DESC LIMIT 1
SELECT a15 FROM district WHERE district_id IN (SELECT district_id FROM account WHERE account_id = 532);
sql placeholder
SELECT DISTINCT trans.trans_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN trans ON disp.account_id = trans.account_id WHERE client.client_id = 3356 AND trans.operation = 'VYBER'
SELECT count(*) FROM (SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000 GROUP BY account.account_id);
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON client.client_id = disp.client_id WHERE client.client_id = 13539
SELECT district.a3 FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.client_id = 3541
SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE status = 'A');
sql placeholder
SELECT trans.trans_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.district_id = 5
SELECT count(DISTINCT account.account_id) FROM account account JOIN district district ON account.district_id = district.district_id WHERE district.a2 = 'Jesenik';
SELECT DISTINCT client.client_id FROM client INNER JOIN card ON client.client_id = card.disp_id WHERE card.type = 'junior' AND strftime('%Y', card.issued) > '1996'
SELECT cast(sum(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.a11 > 10000
SELECT cast(sum(CASE WHEN strftime('%Y', loan.date) = '1997' THEN loan.amount ELSE 0 END) - sum(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END) AS REAL) * 100 / sum(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END) FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M'
SELECT count(account_id) FROM trans WHERE substr(date, 1, 4) > '1995' AND operation = 'VYBER KARTOU'
SELECT sum(CASE WHEN a3 = 'east Bohemia' THEN a16 ELSE 0 END) - sum(CASE WHEN a3 = 'north Bohemia' THEN a16 ELSE 0 END) AS difference FROM district;
SELECT count(CASE WHEN account.account_id = 1 THEN 1 END) AS owner, count(CASE WHEN account.account_id = 10 THEN 1 END) AS disponent FROM account INNER JOIN disp ON account.account_id = disp.account_id
sql placeholder
SELECT strftime('%Y', birth_date) FROM client WHERE client_id = 130
SELECT count(DISTINCT account.account_id) FROM account INNER JOIN disp ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'OWNER'
sql placeholder
SELECT sum(trans.amount), client.gender FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE client.client_id = 4 AND trans.account_id = 851 GROUP BY client.gender
SELECT card.type FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON card.disp_id = disp.disp_id WHERE client.client_id = 9
SELECT sum(trans.amount) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE client.client_id = 617 AND trans.date LIKE '1998%'
SELECT client.client_id FROM district INNER JOIN client ON district.district_id = client.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.a3 = 'east Bohemia'
SELECT client.client_id FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'F' GROUP BY client.client_id ORDER BY sum(loan.amount) DESC LIMIT 3
sql placeholder
SELECT count(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a2 = 'Beroun' AND account.date > '1996-12-31'
SELECT count(DISTINCT client.client_id) FROM client client JOIN card card ON client.client_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior';
SELECT cast(sum(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM client INNER JOIN district ON client.district_id = district.district_id INNER JOIN account ON district.district_id = account.district_id WHERE district.a3 = 'Prague'
SELECT cast(sum(CASE WHEN client.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / count(account.account_id) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE'
SELECT count(DISTINCT client.client_id) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount ASC LIMIT 1
SELECT account.account_id FROM client INNER JOIN district ON client.district_id = district.district_id INNER JOIN account ON district.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date ASC, district.a11 ASC LIMIT 1
SELECT count(client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date LIKE '1920%' AND district.a3 = 'east Bohemia'
SELECT count(*) FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE duration = 24 AND account_id IN (SELECT account_id FROM account WHERE frequency = 'POPLATEK TYDNE'));
SELECT avg(loan.amount) FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE loan.status = 'C' AND account.frequency = 'POPLATEK PO OBRATU'
SELECT client.client_id, client.district_id FROM client INNER JOIN disp ON client.client_id = disp.client_id WHERE disp.type = 'OWNER'
SELECT client.client_id, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', client.birth_date) AS age FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM bond GROUP BY bond_type));
SELECT count(DISTINCT atom.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl';
SELECT cast(sum(CASE WHEN atom.element = 'o' THEN 1 ELSE 0 END) AS REAL) / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = '-'
SELECT cast(sum(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / count(atom.atom_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT count(*) FROM (SELECT molecule.molecule_id FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.element = 'na' GROUP BY molecule.molecule_id);
SELECT DISTINCT bond.molecule_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+'
SELECT cast(sum(CASE WHEN atom.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom.atom_id) FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '='
SELECT count(DISTINCT bond_id) FROM bond WHERE bond_type = '#';
SELECT count(*) FROM atom WHERE element != 'br'
SELECT count(molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+'
SELECT DISTINCT molecule.molecule_id FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c';
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';
SELECT DISTINCT atom.element FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '=';
sql placeholder
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'cl');
SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '-')
SELECT connected.atom_id FROM molecule INNER JOIN connected ON molecule.molecule_id = connected.atom_id WHERE molecule.label = '-'
SELECT element FROM (SELECT element, count(*) AS num FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element) WHERE num = (SELECT min(num) FROM (SELECT count(*) AS num FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element))
SELECT bond.bond_type FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20'
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn') AND label NOT IN ('+', '-');
SELECT count(DISTINCT connected.atom_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id JOIN bond bond ON connected.bond_id = bond.bond_id WHERE atom.element IN ('i', 's') AND bond.bond_type = '-';
SELECT connected.atom_id, connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#'
SELECT connected.atom_id2 FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id = 'TR181'
SELECT cast(sum(CASE WHEN atom.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT cast(sum(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;
SELECT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR001' AND bond.bond_id = 'TR001_2_6'
SELECT sum(CASE WHEN label = '+' THEN 1 ELSE 0 END) - sum(CASE WHEN label = '-' THEN 1 ELSE 0 END) FROM molecule
SELECT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ' ORDER BY molecule_id LIMIT 5);
SELECT cast(sum(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR008'
SELECT cast(sum(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM molecule
SELECT cast(sum(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM atom WHERE molecule_id = 'TR206'
SELECT bond.bond_type FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR000'
SELECT atom.element, molecule.label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR060'
SELECT bond.bond_type, molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR010' GROUP BY bond.bond_type ORDER BY count(bond.bond_type) DESC LIMIT 1
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-' GROUP BY molecule.molecule_id ORDER BY count(*) DESC LIMIT 3
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR006' ORDER BY bond.bond_id LIMIT 2
SELECT count(bond.bond_id) FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR009' AND (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12')
SELECT count(*) FROM (SELECT molecule.molecule_id FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'br' GROUP BY molecule.molecule_id);
SELECT bond.bond_type, connected.atom_id, connected.atom_id2 FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9';
SELECT molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id = 'TR001_10'
SELECT count(DISTINCT molecule_id) FROM BOND WHERE bond_type = '#';
SELECT count(bond_id) FROM connected WHERE atom_id = 'TR000_19'
SELECT element FROM atom WHERE molecule_id = 'TR004';
SELECT count(DISTINCT molecule_id) FROM molecule WHERE label = '-';
SELECT DISTINCT molecule.molecule_id FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE substr(atom.atom_id, 7, 2) BETWEEN '21' AND '25' AND molecule.label = '+';
SELECT bond.bond_id FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'p' AND atom.element = 'n'
SELECT molecule.label FROM (SELECT molecule_id, count(*) AS num_double_bonds FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id) AS t1 JOIN molecule ON t1.molecule_id = molecule.molecule_id WHERE t1.num_double_bonds = (SELECT max(num_double_bonds) FROM (SELECT count(*) AS num_double_bonds FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id)) AND molecule.label = '+';
SELECT cast(count(connected.bond_id) AS REAL) / count(DISTINCT atom.atom_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i';
SELECT bond.bond_type, bond.bond_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE substr(connected.atom_id, 7, 2) + 0 = 45
SELECT DISTINCT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);
SELECT connected.atom_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.molecule_id = 'TR041' AND bond.bond_type = '#'
SELECT atom.element FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE connected.bond_id = 'TR144_8_19'
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY count(bond.bond_id) DESC LIMIT 1
SELECT min(DISTINCT atom.element) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+';
SELECT connected.atom_id2 FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'pb'
SELECT DISTINCT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#'));
SELECT cast(count(DISTINCT bond.bond_id) AS REAL) * 100 / count(DISTINCT atom.atom_id) FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id GROUP BY bond.bond_id HAVING count(DISTINCT atom.element) = (SELECT max(cnt) FROM (SELECT count(DISTINCT atom.element) AS cnt FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id GROUP BY bond.bond_id));
SELECT cast(sum(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-'
SELECT count(atom_id) FROM atom WHERE element IN ('c', 'h');
SELECT connected.atom_id2 FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 's'
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'sn' AND bond.bond_type IN ('=', '-')
SELECT count(DISTINCT atom.element) FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '-'
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND (atom.element = 'p' OR atom.element = 'br');
SELECT DISTINCT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT DISTINCT bond.molecule_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom.atom_id) FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT DISTINCT molecule_id FROM molecule WHERE label = '-';
SELECT count(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT a.element, b.element FROM atom a JOIN atom b ON a.atom_id = b.atom_id JOIN connected c ON a.atom_id = c.atom_id AND b.atom_id = c.atom_id2 WHERE c.bond_id = 'TR001_10_11';
SELECT count(DISTINCT bond.bond_id) FROM bond bond JOIN atom atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i';
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca') AND label IN ('+', '-');
SELECT CASE WHEN (SELECT element FROM atom WHERE atom_id = (SELECT atom_id FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'cl') AND (SELECT element FROM atom WHERE atom_id = (SELECT atom_id2 FROM connected WHERE bond_id = 'TR001_1_8') AND element = 'c') THEN 'YES' ELSE 'NO' END;
SELECT DISTINCT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE bond.bond_type = '#' AND atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR001';
SELECT DISTINCT bond.molecule_id FROM bond bond WHERE bond.bond_type = ' = '
SELECT connected.atom_id, connected.atom_id2 FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#';
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR000_1_2')
SELECT count(DISTINCT bond.molecule_id) FROM bond bond JOIN molecule molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_id = 'TR001_10_11')
SELECT bond.bond_id, molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#'
SELECT DISTINCT atom.element FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND substr(atom.atom_id, 7, 1) = '4';
SELECT cast(sum(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom.element), molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR006' GROUP BY molecule.label
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca') AND label = '+';
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type IN ('=', '-')
SELECT DISTINCT atom.element FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE connected.bond_id = 'TR001_10_11'
SELECT cast(sum(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id
SELECT cast(sum(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR047'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1')
SELECT label FROM molecule WHERE molecule_id = 'TR151'
SELECT DISTINCT atom.element FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR151' AND atom.element IN ('c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca');
SELECT count(molecule_id) FROM molecule WHERE label = '+'
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';
SELECT count(DISTINCT atom.atom_id) FROM atom INNER JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND bond.bond_type = ' = '
SELECT count(atom.atom_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'h' AND molecule.label = '+'
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR000_1_2' AND connected.atom_id = 'TR000_1'
SELECT atom.atom_id FROM atom INNER JOIN molecule ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT DISTINCT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom_id FROM atom WHERE molecule_id = 'TR186';
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19';
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_4'
SELECT count(DISTINCT bond.bond_id), molecule.label FROM bond bond JOIN molecule molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id = 'TR006' AND bond.bond_type = ' = ' GROUP BY molecule.label;
SELECT DISTINCT molecule.molecule_id, atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element IN ( 'cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca' )
SELECT bond.bond_id, connected.atom_id, connected.atom_id2 FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'
SELECT DISTINCT molecule.molecule_id, atom.element FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '#' AND atom.element IN ( 'cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca' )
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3')
SELECT count(*) FROM bond WHERE bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl')) AND bond_id IN (SELECT bond_id FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 'cl'));
SELECT connected.atom_id, count(bond.bond_type) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE molecule.molecule_id = 'TR346' GROUP BY connected.atom_id
SELECT count(DISTINCT molecule.molecule_id), count(DISTINCT CASE WHEN molecule.label = '+' THEN molecule.molecule_id END) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '-' AND atom.element != 's' AND bond.bond_type != ' = ';
SELECT molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR001_2_4'
SELECT count(*) FROM atom WHERE molecule_id = 'TR001';
SELECT count(bond_id) FROM bond WHERE bond_type = '-'
SELECT DISTINCT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+'
SELECT DISTINCT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT count(DISTINCT atom.element) FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR001_3_4';
SELECT bond.bond_type FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2'
SELECT molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT cast(sum(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom.atom_id) FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'n';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 's' AND bond.bond_type = '='
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' GROUP BY molecule.molecule_id HAVING count(atom.atom_id) > 5;
SELECT DISTINCT atom.element FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.molecule_id = 'TR024' AND bond.bond_type = '='
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY count(atom.molecule_id) DESC LIMIT 1
SELECT cast(sum(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.molecule_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'h' AND bond.bond_type = '#'
SELECT count(molecule_id) FROM molecule WHERE label = '+'
SELECT count(DISTINCT bond.molecule_id) FROM bond bond JOIN molecule molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.molecule_id BETWEEN 'TR004' AND 'TR010' AND bond.bond_type = '-';
SELECT count(*) FROM atom WHERE molecule_id = 'TR008' AND element = 'c';
SELECT DISTINCT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label = '-'
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '-' AND atom.element = 'o' AND bond.bond_type = '=';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-';
SELECT a.element, b.bond_type FROM atom a JOIN bond b ON a.molecule_id = b.molecule_id JOIN molecule m ON b.molecule_id = m.molecule_id WHERE m.molecule_id = 'TR002';
SELECT connected.atom_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = ' = ' AND atom.element = 'c' AND bond.molecule_id = 'TR012'
SELECT a.atom_id FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+' AND a.element = 'o';
SELECT name FROM cards WHERE cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL;
SELECT id FROM cards WHERE bordercolor = 'borderless' AND cardkingdomid IS NULL AND cardkingdomfoilid IS NOT NULL;
SELECT name FROM cards WHERE faceconvertedmanacost = ( SELECT max(faceconvertedmanacost) FROM cards )
SELECT name FROM cards WHERE edhrecrank < 100 AND frameversion = 2015
SELECT cards.name FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.rarity = 'mythic' AND legalities.format = 'gladiator'
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage'
SELECT cards.id, cards.artist FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE (cards.power = '*' OR cards.power IS NULL) AND legalities.status = 'Legal' AND legalities.format = 'commander'
SELECT c.id, r.text, c.hascontentwarning FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele';
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.id = rulings.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s'
SELECT cards.name, cards.artist, cards.ispromo FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid GROUP BY rulings.uuid ORDER BY count(rulings.id) DESC LIMIT 1
SELECT DISTINCT foreign_data.language FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Annul' AND cards.number = '29'
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.isalternative = 1
SELECT cast(sum(CASE WHEN set_translations.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN set_translations ON cards.id = set_translations.id
SELECT name, totalsetsize FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Italian');
SELECT count(types) FROM cards WHERE artist = 'Aaron Boyd' AND isfullart = 0
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT count(*) FROM cards WHERE power = '*';
SELECT promotypes FROM cards WHERE name = 'Duress'
SELECT bordercolor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT foreign_data.language FROM foreign_data INNER JOIN set_translations ON foreign_data.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code INNER JOIN cards ON sets.code = cards.setcode WHERE cards.name = 'Angel of Mercy'
SELECT count(id) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE status = 'Restricted') AND istextless = 0;
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.name = 'Ancestor''s Chosen'
SELECT count(DISTINCT cards.id) FROM cards cards JOIN legalities legalities ON cards.uuid = legalities.uuid WHERE cards.isstarter = 1 AND legalities.status = 'Restricted';
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle'
SELECT TYPE FROM cards WHERE name = 'Benalish Knight'
SELECT l.format FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.name = 'Benalish Knight';
SELECT artist FROM cards WHERE uuid IN (SELECT foreign_data.uuid FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'Phyrexian');
SELECT cast(sum(CASE WHEN bordercolor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM cards
SELECT count(id) FROM cards WHERE isreprint = 1 AND uuid IN (SELECT uuid FROM foreign_data WHERE LANGUAGE = 'German');
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Russian' AND cards.bordercolor = 'borderless'
SELECT cast(sum(CASE WHEN foreign_data.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.isstoryspotlight = 1
SELECT count(*) FROM cards WHERE toughness = '99';
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT count(id) FROM cards WHERE bordercolor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedmanacost = 0;
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%'
SELECT count(id) FROM cards WHERE originaltype = 'Summon - Angel' AND subtypes NOT LIKE '%Angel%'
SELECT c.id FROM cards c WHERE c.cardkingdomid IS NOT NULL AND c.cardkingdomfoilid IS NOT NULL;
SELECT id FROM cards WHERE dueldeck = 'a'
SELECT edhrecrank FROM cards WHERE frameversion = '2015';
SELECT DISTINCT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified'
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.availability = 'paper' AND foreign_data.language = 'Japanese'
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.bordercolor = 'white' AND legalities.status = 'Banned'
SELECT foreign_data.uuid, foreign_data.language FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE legalities.format = 'legacy'
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality'
SELECT count(DISTINCT cards.id), legalities.status FROM cards cards JOIN legalities legalities ON cards.uuid = legalities.uuid WHERE cards.frameversion = 'future' AND legalities.status = 'Legal';
SELECT name, colors FROM cards WHERE setcode = 'OGW';
SELECT cards.name, set_translations.language FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.setcode = '10E' AND cards.convertedmanacost = 5
SELECT cards.name, rulings.date FROM cards INNER JOIN rulings ON cards.id = rulings.id WHERE cards.originaltype = 'Creature - Elf'
SELECT DISTINCT cards.colors, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.originaltype = 'Artifact' AND cards.colors = 'B'
SELECT cards.name FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.rarity = 'uncommon' ORDER BY rulings.date LIMIT 3
SELECT count(id) FROM cards WHERE artist = 'John Avon' AND (cardkingdomid IS NOT NULL OR cardkingdomfoilid IS NOT NULL);
SELECT count(*) FROM cards WHERE bordercolor = 'white' AND (cardkingdomid IS NOT NULL OR cardkingdomfoilid IS NOT NULL);
SELECT count(id) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT count(id) FROM cards WHERE frameversion = 1993 AND hascontentwarning = 1 AND availability = 'paper'
SELECT manacost FROM cards WHERE availability = 'mtgo,paper' AND frameversion = '2003' AND bordercolor = 'black' AND layout = 'normal'
SELECT sum(manacost) FROM cards WHERE artist = 'Rob Alexander' AND manacost IS NOT NULL;
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena';
SELECT setcode FROM set_translations WHERE LANGUAGE = 'Spanish';
SELECT cast(sum(CASE WHEN isonlineonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards WHERE frameeffects = 'legendary'
SELECT cast(sum(CASE WHEN cards.isstoryspotlight = 1 AND cards.istextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id), cards.id FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.isstoryspotlight = 1 AND cards.istextless = 0 GROUP BY cards.id
SELECT cast(sum(CASE WHEN foreign_data.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / count(foreign_data.id), foreign_data.name FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid GROUP BY foreign_data.name
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.basesetsize = 309
SELECT count(set_translations.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brazil)'
SELECT id FROM cards WHERE types = 'Creature' AND uuid IN (SELECT uuid FROM legalities WHERE status = 'Legal');
SELECT foreign_data.name FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL GROUP BY foreign_data.name
SELECT count(id) FROM cards WHERE power = '*' AND text LIKE '%triggered ability%'
SELECT count(DISTINCT cards.id) FROM cards cards JOIN rulings rulings ON cards.uuid = rulings.uuid JOIN legalities legalities ON cards.uuid = legalities.uuid WHERE rulings.text = 'This is a triggered mana ability.' AND legalities.format = 'premodern' AND cards.side IS NULL;
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.format = 'pauper' AND c.availability = 'paper';
SELECT artist FROM cards WHERE text LIKE '%Das perfekte Gegenmittel zu einer dichten Formation%'
SELECT foreign_data.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'French' AND cards.bordercolor = 'black' AND cards.artist = 'Matthew D. Wilson' AND cards.types = 'Creature' AND cards.layout = 'normal'
SELECT count(DISTINCT cards.id) FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE rulings.date = '2007-02-01' AND cards.rarity = 'rare'
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Ravnica' AND sets.basesetsize = 180
SELECT cast(sum(CASE WHEN hascontentwarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards WHERE uuid IN (SELECT uuid FROM legalities WHERE format = 'commander' AND status = 'Legal');
SELECT cast(sum(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM cards WHERE power IS NOT NULL
SELECT cast(sum(CASE WHEN set_translations.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / count(sets.code) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.type = 'expansion'
SELECT DISTINCT availability FROM cards WHERE artist = 'Daren Bader';
SELECT count(*) FROM cards WHERE edhrecrank > 12000 AND bordercolor = 'borderless';
SELECT count(id) FROM cards WHERE isoversized = 1 AND isreprint = 1 AND ispromo = 1;
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promotypes = 'arenaleague' ORDER BY name LIMIT 3
SELECT LANGUAGE FROM foreign_data WHERE multiverseid = 149934
SELECT cardkingdomfoilid, cardkingdomid FROM cards ORDER BY cardkingdomfoilid LIMIT 3
SELECT cast(sum(CASE WHEN layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM cards WHERE istextless = 1
SELECT id FROM cards WHERE subtypes IN ('Angel', 'Wizard') AND (side IS NULL OR side = '');
SELECT name FROM sets WHERE mtgocode IS NULL OR mtgocode = '' ORDER BY name ASC LIMIT 3;
SELECT language FROM set_translations WHERE setcode = 'ARC' AND setcode IN (SELECT code FROM sets WHERE mcmname = 'Archenemy');
SELECT sets.name, set_translations.translation FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.id = 5
SELECT set_translations.language, sets.type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.id = 206
SELECT sets.id, sets.name FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN cards ON sets.code = cards.setcode WHERE set_translations.language = 'Italian' AND sets.block = 'Shadowmoor' ORDER BY sets.name LIMIT 2
SELECT DISTINCT sets.id FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN foreign_data ON set_translations.language = foreign_data.language WHERE sets.isforeignonly = 1 AND sets.isfoilonly = 1 AND foreign_data.language = 'Japanese'
SELECT name FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Russian') AND basesetsize = (SELECT max(basesetsize) FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Russian'))
SELECT cast(sum(CASE WHEN cards.isonlineonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified'
SELECT count(*) FROM sets WHERE mtgocode IS NULL OR mtgocode = '' AND id IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Japanese');
SELECT id FROM cards WHERE bordercolor = 'black'
SELECT id FROM cards WHERE frameeffects LIKE '%extendedart%'
SELECT name FROM cards WHERE bordercolor = 'black' AND isfullart = 1
SELECT language FROM set_translations WHERE setcode IN (SELECT code FROM sets WHERE id = 174);
SELECT name FROM sets WHERE code = 'ALL';
SELECT language FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE strftime('%Y-%m-%d', releasedate) = '2007-07-13';
SELECT basesetsize, code FROM sets WHERE block = 'Masques' OR block = 'Mirage'
SELECT code FROM SETS WHERE TYPE = 'expansion';
SELECT foreign_data.name, foreign_data.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'boros'
SELECT foreign_data.language, foreign_data.flavortext, cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'colorpie'
SELECT cast(sum(CASE WHEN cards.convertedmanacost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Abyssal Horror'
SELECT code FROM sets WHERE TYPE = 'expansion' OR TYPE = 'commander';
SELECT foreign_data.name, foreign_data.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'abzan'
SELECT foreign_data.language, cards.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'azorius'
SELECT count(id) FROM cards WHERE artist = 'Aaron Miller' AND cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL
SELECT count(*) FROM cards WHERE hand = '3' AND availability LIKE '%paper%'
SELECT name FROM cards WHERE istextless = 0
SELECT manacost FROM cards WHERE name = 'Ancestor`s Chosen';
SELECT count(id) FROM cards WHERE bordercolor = 'white' AND (power = '*' OR power IS NULL);
SELECT name FROM cards WHERE side IS NOT NULL AND ispromo = 1;
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT purchaseurls FROM cards WHERE promotypes = 'bundle';
SELECT count(DISTINCT artist) FROM cards WHERE availability LIKE '%arena,mtgo%' AND bordercolor = 'black';
SELECT name FROM cards WHERE (name = 'Serra Angel' AND convertedmanacost > (SELECT convertedmanacost FROM cards WHERE name = 'Shrine Keeper')) OR (name = 'Shrine Keeper' AND convertedmanacost > (SELECT convertedmanacost FROM cards WHERE name = 'Serra Angel'))
SELECT artist FROM cards WHERE flavorname = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameversion = '2003' ORDER BY convertedmanacost DESC LIMIT 3
SELECT foreign_data.name FROM foreign_data INNER JOIN set_translations ON foreign_data.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code INNER JOIN cards ON sets.code = cards.setcode WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Italian'
SELECT count(DISTINCT set_translations.id) FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Angel of Mercy'
SELECT cards.name FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN cards ON sets.code = cards.setcode WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT CASE WHEN count(CASE WHEN set_translations.language = 'Korean' THEN 1 ELSE NULL END) > 0 THEN 'YES' ELSE 'NO' END FROM cards INNER JOIN set_translations ON cards.name = set_translations.setcode WHERE cards.name = 'Ancestor''s Chosen'
SELECT count(cards.id) FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.artist = 'Adam Rex' AND set_translations.translation = 'Hauptset Zehnte Edition'
SELECT basesetsize FROM sets WHERE code = ( SELECT setcode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition' )
SELECT translation FROM set_translations WHERE setcode IN (SELECT code FROM sets WHERE name = 'Eighth Edition') AND language = 'Chinese Simplified'
SELECT CASE WHEN count(sets.mtgocode) > 0 THEN 'YES' ELSE 'NO' END FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Angel of Mercy'
SELECT releasedate FROM sets WHERE code IN (SELECT setcode FROM cards WHERE name = 'Ancestor''s Chosen');
SELECT type FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');
SELECT count(DISTINCT sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL
SELECT CASE WHEN sets.isforeignonly = 1 THEN 'YES' ELSE 'NO' END FROM sets INNER JOIN cards ON sets.id = cards.id WHERE cards.name = 'Adarkar Valkyrie'
SELECT count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Italian' AND sets.basesetsize < 10
SELECT count(cards.id) FROM cards INNER JOIN SETS ON cards.setcode = SETS.code WHERE cards.bordercolor = 'black' AND SETS.name = 'Coldsnap'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap' ORDER BY cast(replace(substr(cards.manacost, 2), ',', '') AS REAL) DESC LIMIT 1
SELECT cards.artist FROM cards INNER JOIN sets ON cards.id = sets.id WHERE cards.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND sets.name = 'Coldsnap'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.number = 4 AND sets.name = 'Coldsnap'
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.id = sets.id WHERE cards.convertedmanacost > 5 AND (cards.power = '*' OR cards.power IS NULL) AND sets.name = 'Coldsnap'
SELECT foreign_data.flavortext FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Italian'
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND cards.flavortext IS NOT NULL
SELECT foreign_data.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'German'
SELECT rulings.text FROM rulings INNER JOIN sets ON rulings.uuid = sets.code INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Coldsnap' AND set_translations.language = 'Italian'
SELECT cards.name FROM cards INNER JOIN set_translations ON cards.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.name = 'Coldsnap' AND cards.convertedmanacost = ( SELECT max(convertedmanacost) FROM cards INNER JOIN set_translations ON cards.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.name = 'Coldsnap' )
SELECT rulings.date FROM cards INNER JOIN rulings ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'
SELECT cast(sum(CASE WHEN cards.convertedmanacost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN SETS ON cards.id = SETS.id WHERE SETS.name = 'Coldsnap'
SELECT cast(sum(CASE WHEN cards.cardkingdomfoilid IS NOT NULL AND cards.cardkingdomid IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.name) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap'
SELECT code FROM sets WHERE releasedate LIKE '2017-07-14'
SELECT keyrunecode FROM sets WHERE code = 'PKHC'
SELECT mcmid FROM sets WHERE code = 'SS2'
SELECT s.mcmname FROM sets s WHERE s.releasedate = '2017-06-09';
SELECT TYPE FROM sets WHERE mcmname LIKE '%From the Vault: Lore%'
SELECT parentcode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT CASE WHEN cards.hascontentwarning = 1 THEN 'YES' ELSE 'NO' END AS hascontentwarning, rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.artist = 'Jim Pavelec'
SELECT s.releasedate FROM cards c JOIN sets s ON c.setcode = s.code WHERE c.name = 'Evacuation' AND s.releasedate IS NOT NULL;
SELECT sets.basesetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Rinascita di Alara'
SELECT TYPE FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Huitième édition');
SELECT set_translations.translation FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Tendo Ice Bridge' AND set_translations.language = 'French'
SELECT count(set_translations.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Tenth Edition' AND set_translations.translation IS NOT NULL
SELECT set_translations.translation FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Fellwar Stone' AND set_translations.language = 'Japanese'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Journey into Nyx Hero''s Path' ORDER BY cast(replace(trim(cards.manacost, '{}'), ',', '') AS REAL) DESC LIMIT 1
SELECT releasedate FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Ola de frío');
SELECT sets.type FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Samite Pilgrim'
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cast(replace(trim(cards.manacost, '{}'), ',', '') AS INTEGER) = 3
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setcode IN (SELECT code FROM sets WHERE name = 'Mirrodin');
SELECT cast(sum(CASE WHEN sets.isnonfoilonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Japanese'
SELECT cast(sum(CASE WHEN sets.isonlineonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE artist LIKE 'Aleksi Briclot' AND istextless = 1;
SELECT id FROM sets WHERE basesetsize = (SELECT max(basesetsize) FROM sets);
SELECT artist FROM cards WHERE side IS NULL ORDER BY convertedmanacost DESC LIMIT 1
SELECT frameeffects FROM cards WHERE cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL GROUP BY frameeffects ORDER BY count(frameeffects) DESC LIMIT 1;
SELECT count(id) FROM cards WHERE dueldeck = 'a' AND (power IS NULL OR power = '*') AND hasfoil = 0
SELECT id FROM sets WHERE TYPE = 'commander' ORDER BY totalsetsize DESC LIMIT 1
sql placeholder
SELECT min(cards.originalreleasedate), legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic' AND legalities.status = 'Legal'
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'French' AND cards.artist = 'Volkan Baǵa'
SELECT count(DISTINCT cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Abundance' AND cards.types = 'Enchantment' AND cards.rarity = 'rare' AND legalities.status = 'Legal'
SELECT l.format, c.name FROM legalities l JOIN cards c ON l.uuid = c.uuid WHERE l.status = 'Banned' GROUP BY l.format ORDER BY count(l.status) DESC LIMIT 1;
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Battlebond'
SELECT cards.artist, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid ORDER BY cards.artist LIMIT 1
SELECT DISTINCT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameversion = '1997' AND cards.artist = 'D. Alexander Gregory' AND legalities.format = 'legacy' AND cards.hascontentwarning = 1
SELECT cards.name, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE edhrecrank = 1 AND legalities.status = 'Banned'
SELECT cast(count(sets.id) AS REAL) / 365, max(set_translations.language) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.releasedate BETWEEN '2012-01-01' AND '2015-12-31'
SELECT DISTINCT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena';
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'Restricted' OR status = 'Banned');
SELECT count(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT rulings.text FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.artist = 'Kev Walker' ORDER BY rulings.date DESC
SELECT cards.name, legalities.format FROM sets INNER JOIN cards ON sets.id = cards.setcode INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal'
SELECT name FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Korean') AND code NOT IN (SELECT setcode FROM set_translations WHERE LANGUAGE LIKE '%Japanese%');
SELECT cards.frameversion, cards.name FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Allen Williams' AND legalities.status = 'Banned'
SELECT CASE WHEN reputation > ( SELECT reputation FROM users WHERE displayname = 'Jarrod Dixon' ) THEN 'Harlan' ELSE 'Jarrod Dixon' END FROM users WHERE displayname IN ( 'Harlan', 'Jarrod Dixon' )
SELECT displayname FROM users WHERE strftime('%Y', creationdate) = '2011'
SELECT count(id) FROM users WHERE lastaccessdate > '2014-09-01';
SELECT displayname FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT count(DISTINCT users.id) FROM users users WHERE users.upvotes > 100 AND users.downvotes > 1;
SELECT count(id) FROM users WHERE substr(cast(creationdate AS TEXT), -4) > '2013' AND views > 10
SELECT count(id) FROM posts WHERE owneruserid IN (SELECT id FROM users WHERE displayname = 'csgillespie');
SELECT title FROM posts WHERE owneruserid IN (SELECT id FROM users WHERE displayname = 'csgillespie');
SELECT posts.ownerdisplayname FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posthistory.comment = 'Eliciting priors from experts'
SELECT title FROM posts WHERE owneruserid = ( SELECT id FROM users WHERE displayname = 'csgillespie' ) ORDER BY viewcount DESC LIMIT 1
SELECT users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id ORDER BY posts.favoritecount DESC LIMIT 1
SELECT sum(posts.commentcount) FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie'
SELECT answercount FROM posts WHERE ownerdisplayname = 'csgillespie' ORDER BY answercount DESC LIMIT 1
SELECT lasteditordisplayname FROM posts WHERE title = 'Examples for teaching: Correlation does not mean causation'
SELECT count(id) FROM posts WHERE owneruserid IN (SELECT id FROM users WHERE displayname = 'csgillespie') AND parentid IS NULL
SELECT DISTINCT users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.closeddate IS NOT NULL
SELECT count(DISTINCT posts.id) FROM users users JOIN posts posts ON users.id = posts.owneruserid WHERE users.age > 65 AND posts.score >= 20;
SELECT users.location FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title LIKE 'Eliciting priors from experts'
SELECT posts.body FROM tags tags JOIN posts posts ON tags.excerptpostid = posts.id WHERE tags.tagname = 'bayesian';
SELECT posts.body FROM tags tags JOIN posts posts ON tags.excerptpostid = posts.id WHERE tags.count = (SELECT max(count) FROM tags);
SELECT count(badges.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie'
SELECT b.name FROM users u JOIN badges b ON u.id = b.userid WHERE u.displayname = 'csgillespie';
SELECT count(DISTINCT badges.name) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie' AND strftime('%Y', badges.date) = '2011';
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.id, users.displayname ORDER BY count(badges.id) DESC LIMIT 1
SELECT avg(posts.score) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT cast(count(badges.id) AS REAL) / count(DISTINCT users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.views > 200
SELECT (count(DISTINCT CASE WHEN users.age > 65 THEN posts.id END) * 100.0 / count(DISTINCT posts.id)) AS percentage FROM posts posts JOIN users users ON posts.owneruserid = users.id WHERE posts.score > 5;
SELECT count(id) FROM votes WHERE userid = 58 AND creationdate = '2010-07-19';
SELECT creationdate FROM votes GROUP BY creationdate ORDER BY count(id) DESC LIMIT 1
SELECT count(userid) FROM badges WHERE name = 'Revival'
SELECT title FROM posts WHERE id IN (SELECT postid FROM comments WHERE score = (SELECT max(score) FROM comments WHERE score IS NOT NULL));
SELECT commentcount FROM posts WHERE id = 1910
SELECT posts.favoritecount FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.userid = 3025 AND comments.creationdate = '2014-04-23 20:29:39'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.parentid = 107829 AND posts.commentcount = 1
SELECT CASE WHEN posts.closeddate IS NULL THEN 'NOT well-finished' ELSE 'well-finished' END FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.creationdate = '2013-07-12 09:08:18.0' AND comments.userid = 23853
SELECT users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 65041
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Tiago Pasqualini'
SELECT users.displayname FROM users INNER JOIN votes ON users.id = votes.userid WHERE votes.id = '6347'
SELECT sum(CASE WHEN posts.title LIKE '%data visualization%' THEN 1 ELSE 0 END) FROM posts INNER JOIN votes ON posts.id = votes.postid
SELECT name FROM badges WHERE userid IN (SELECT id FROM users WHERE displayname = 'DatEpicCoderGuyWhoPrograms');
SELECT cast(( SELECT count(id) FROM posts WHERE owneruserid = 24 ) AS REAL) / ( SELECT count(id) FROM votes WHERE userid = 24 ) AS ratio;
SELECT viewcount FROM posts WHERE title LIKE 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/%'
SELECT text FROM comments WHERE score = 17
SELECT displayname FROM users WHERE websiteurl = 'http://stackoverflow.com'
SELECT DISTINCT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost'
SELECT users.displayname FROM comments INNER JOIN users ON comments.userid = users.id WHERE comments.text = 'thank you user93!'
SELECT c.text FROM comments c JOIN users u ON c.userid = u.id WHERE u.displayname = 'A Lion';
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Understanding what Dassault iSight is doing?'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.title LIKE 'How does gentle boosting differ from AdaBoost?'
sql placeholder
SELECT users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Open source tools for visualizing multi-dimensional data?'
SELECT DISTINCT posts.title FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Vebjorn Ljosa'
SELECT posts.score, users.websiteurl FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Yevgeny'
SELECT comments.text FROM comments INNER JOIN posthistory ON comments.postid = posthistory.postid INNER JOIN posts ON posthistory.postid = posts.id WHERE posts.title = 'Why square the difference instead of taking the absolute value in standard deviation?'
SELECT sum(votes.bountyamount) FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE posts.title LIKE '%data%'
SELECT users.displayname FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id WHERE posts.title LIKE '%variance%' AND votes.bountyamount = 50
SELECT posts.viewcount, posts.title, posthistory.text FROM tags INNER JOIN posts ON tags.wikipostid = posts.id INNER JOIN posthistory ON posts.id = posthistory.postid WHERE tags.tagname = 'humor'
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.userid = 13
SELECT id FROM users WHERE reputation = ( SELECT max(reputation) FROM users )
SELECT id FROM users WHERE views = ( SELECT min(views) FROM users )
SELECT count(DISTINCT users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE strftime('%Y', badges.date) = '2011' AND badges.name = 'Supporter'
SELECT count(DISTINCT userid) FROM badges WHERE userid IN (SELECT id FROM users) GROUP BY userid HAVING count(name) > 5;
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'New York' AND badges.name IN ('Teacher', 'Supporter');
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1
SELECT users.id FROM users INNER JOIN posthistory ON users.id = posthistory.userid WHERE users.views >= 1000 GROUP BY users.id HAVING count(posthistory.postid) = 1
SELECT users.id, badges.name FROM users INNER JOIN badges ON users.id = badges.userid INNER JOIN ( SELECT userid, count(id) AS commentcount FROM comments GROUP BY userid ORDER BY commentcount DESC LIMIT 1 ) AS t2 ON users.id = t2.userid
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'India' AND badges.name = 'Teacher'
SELECT cast(sum(CASE WHEN strftime('%Y', badges.date) = '2010' THEN 1 ELSE 0 END) AS REAL) * 100 / count(badges.name) - cast(sum(CASE WHEN strftime('%Y', badges.date) = '2011' THEN 1 ELSE 0 END) AS REAL) * 100 / count(badges.name) FROM badges badges WHERE badges.name = 'Student';
SELECT posthistorytypeid, count(DISTINCT userid) AS numusers FROM posthistory WHERE postid = 3720 GROUP BY posthistorytypeid;
SELECT postlinks.relatedpostid, posts.viewcount FROM postlinks INNER JOIN posts ON postlinks.relatedpostid = posts.id WHERE postlinks.postid = 61217
SELECT posts.score, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE postlinks.postid = 395
SELECT id, owneruserid FROM posts WHERE score > 60
SELECT sum(posts.favoritecount) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE strftime('%Y', posts.creaiondate) = '2011' AND users.id = 686
SELECT cast(sum(users.upvotes) AS REAL) / count(users.id), cast(sum(users.age) AS REAL) / count(users.id) FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id WHERE posts.owneruserid = users.id GROUP BY users.id HAVING count(users.id) > 10
SELECT count(DISTINCT userid) FROM badges WHERE name = 'Announcer';
SELECT name FROM badges WHERE DATE = '2010-07-19 19:39:08.0'
SELECT count(id) FROM comments WHERE score > 60
SELECT text FROM comments WHERE creationdate = '2010-07-19 19:16:14.0'
SELECT count(*) FROM posts WHERE score = 10
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.reputation = ( SELECT max(reputation) FROM users )
SELECT users.reputation FROM badges badges JOIN users users ON badges.userid = users.id WHERE badges.date = '2010-07-19 19:39:08.0';
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.displayname = 'Pierre'
SELECT b.date FROM users u JOIN badges b ON u.id = b.userid WHERE u.location = 'Rochester, NY';
SELECT cast(sum(CASE WHEN badges.name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid
SELECT (count(DISTINCT users.id) * 100.0 / (SELECT count(DISTINCT userid) FROM badges WHERE name = 'Organizer')) AS percentage FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.age BETWEEN 13 AND 18 AND badges.name = 'Organizer';
SELECT comments.score FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.creaiondate = '2010-07-19 19:19:56'
SELECT text FROM comments WHERE postid = ( SELECT id FROM posts WHERE creaiondate = '2010-07-19 19:37:33' )
SELECT users.age FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Vienna, Austria' AND badges.name = 'Student'
SELECT count(DISTINCT users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Supporter' AND users.age >= 19 AND users.age <= 65
SELECT users.views FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.date = '2010-07-19 19:39:08.0'
SELECT name FROM badges WHERE userid IN (SELECT id FROM users WHERE reputation = (SELECT min(reputation) FROM users));
SELECT name FROM badges WHERE userid IN (SELECT id FROM users WHERE displayname = 'Sharpie');
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Supporter' AND users.age > 65
SELECT DISTINCT displayname FROM users WHERE id = 30
SELECT count(*) FROM users WHERE LOCATION = 'New York'
SELECT count(id) FROM votes WHERE strftime('%Y', creationdate) = '2010'
SELECT count(id) FROM users WHERE age > 19 AND age < 66
SELECT displayname FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT (SELECT count(*) FROM votes WHERE strftime('%Y', creationdate) = '2010') * 1.0 / (SELECT count(*) FROM votes WHERE strftime('%Y', creationdate) = '2011') AS ratio;
SELECT tags.tagname FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON posts.id = tags.wikipostid WHERE users.displayname = 'John Salvatier'
SELECT count(posts.id) FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Daniel Vassallo'
SELECT sum(CASE WHEN users.displayname = 'Harlan' THEN 1 ELSE 0 END) FROM users INNER JOIN votes ON users.id = votes.userid
SELECT id FROM posts WHERE ownerdisplayname = 'slashnick' ORDER BY answercount DESC LIMIT 1;
SELECT CASE WHEN sum(CASE WHEN users.displayname = 'Harvey Motulsky' THEN posts.viewcount ELSE 0 END) > sum(CASE WHEN users.displayname = 'Noah Snyder' THEN posts.viewcount ELSE 0 END) THEN 'Harvey Motulsky' ELSE 'Noah Snyder' END FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname IN ('Harvey Motulsky', 'Noah Snyder')
SELECT count(posts.id) FROM posts INNER JOIN votes ON posts.id = votes.postid INNER JOIN users ON users.id = votes.userid WHERE users.displayname = 'Matt Parker' AND votes.postid > 4
SELECT count(comments.id) FROM users INNER JOIN comments ON users.id = comments.userid INNER JOIN posts ON comments.postid = posts.id WHERE users.displayname = 'Neil McGuigan' AND comments.score < 60
SELECT tags.tagname FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON tags.wikipostid = posts.id WHERE users.displayname = 'Mark Meckes' AND posts.commentcount = 0
SELECT users.displayname FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Organizer'
SELECT cast(sum(CASE WHEN tags.tagname = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / count(posts.id) FROM posts INNER JOIN tags ON posts.id = tags.wikipostid INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Community'
SELECT sum(CASE WHEN users.displayname = 'Mornington' THEN posts.viewcount ELSE 0 END) - sum(CASE WHEN users.displayname = 'Amos' THEN posts.viewcount ELSE 0 END) AS viewcountdifference FROM users INNER JOIN posts ON users.id = posts.owneruserid
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.creationdate BETWEEN '2014-01-01' AND '2014-12-31' AND badges.name = 'Commentator';
SELECT count(id) FROM posts WHERE strftime('%Y-%m-%d', creaiondate) = '2010-07-21'
SELECT displayname, age FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images'
SELECT count(id) FROM comments WHERE userid = 13 AND score < 60
SELECT DISTINCT posts.title, users.displayname FROM posts INNER JOIN comments ON posts.id = comments.postid INNER JOIN users ON users.id = comments.userid WHERE comments.score > 60
SELECT DISTINCT badges.name FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'North Pole' AND strftime('%Y', badges.date) = '2011';
SELECT users.displayname, users.websiteurl FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.favoritecount > 150
SELECT count(posthistory.postid), posthistory.creationdate FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posts.title = 'What is the best introductory Bayesian statistics textbook?' GROUP BY posthistory.postid, posthistory.creationdate
SELECT users.lastaccessdate, users.location FROM users users JOIN badges badges ON users.id = badges.userid WHERE badges.name = 'Outliers';
SELECT title FROM posts WHERE id IN (SELECT postid FROM postlinks WHERE relatedpostid = (SELECT id FROM posts WHERE title = 'How to tell if something happened in a data set which monitors a value over time'));
SELECT posthistory.postid, badges.name FROM users INNER JOIN posthistory ON users.id = posthistory.userid INNER JOIN badges ON badges.userid = users.id WHERE users.displayname = 'Samuel' AND strftime('%Y', posthistory.creationdate) = '2013'
SELECT ownerdisplayname FROM posts WHERE viewcount = ( SELECT max(viewcount) FROM posts )
SELECT users.displayname, users.location FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON posts.id = tags.wikipostid WHERE tags.tagname = 'hypothesis-testing'
SELECT posts.title, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE posts.title = 'What are principal component scores?'
SELECT ownerdisplayname FROM posts WHERE parentid IS NOT NULL AND score = ( SELECT max(score) FROM posts )
SELECT u.displayname, u.websiteurl FROM users u JOIN votes v ON u.id = v.userid WHERE v.votetypeid = 8 AND v.bountyamount = (SELECT max(bountyamount) FROM votes WHERE votetypeid = 8);
SELECT title FROM posts ORDER BY viewcount DESC LIMIT 5
SELECT count(id) FROM tags WHERE wikipostid IN (SELECT id FROM posts WHERE id BETWEEN 5000 AND 7000);
SELECT owneruserid FROM posts WHERE favoritecount = ( SELECT max(favoritecount) FROM posts )
SELECT age FROM users WHERE reputation = ( SELECT max(reputation) FROM users )
SELECT count(DISTINCT votes.postid) FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE strftime('%Y', votes.creationdate) = '2011' AND votes.bountyamount = 50
SELECT id FROM users WHERE age = ( SELECT min(age) FROM users )
SELECT sum(score) FROM posts WHERE lasactivitydate LIKE '2010-07-19%'
SELECT cast(count(CASE WHEN strftime('%Y', creationdate) = '2010' AND answercount <= 2 THEN 1 ELSE NULL END) AS REAL) / 12 FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid
SELECT postid FROM votes WHERE userid = 1465 ORDER BY bountyamount DESC LIMIT 1
SELECT title FROM posts WHERE id IN (SELECT postid FROM postlinks WHERE creationdate = (SELECT min(creationdate) FROM postlinks WHERE creationdate IS NOT NULL));
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.displayname ORDER BY count(badges.name) DESC LIMIT 1
SELECT votes.creationdate FROM users INNER JOIN votes ON users.id = votes.userid WHERE users.displayname = 'chl' ORDER BY votes.creationdate ASC LIMIT 1
SELECT min(posts.creaiondate) FROM users INNER JOIN posts ON users.id = posts.owneruserid ORDER BY users.age ASC LIMIT 1
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Autobiographer' ORDER BY badges.date ASC LIMIT 1
SELECT count(DISTINCT users.id) FROM users users JOIN posts posts ON users.id = posts.owneruserid WHERE users.location = 'United Kingdom' AND posts.favoritecount >= 4;
SELECT avg(v.postid) FROM votes v JOIN users u ON v.userid = u.id WHERE u.age = (SELECT max(age) FROM users);
SELECT displayname FROM users WHERE reputation = ( SELECT max(reputation) FROM users )
SELECT count(*) FROM users WHERE reputation > 2000 AND views > 1000
SELECT displayname FROM users WHERE age > 18 AND age < 66
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Jay Stevens' AND strftime('%Y', posts.creaiondate) = '2010'
SELECT id, title FROM posts WHERE ownerdisplayname = 'Harvey Motulsky' ORDER BY viewcount DESC LIMIT 1
SELECT id, title FROM posts WHERE score = ( SELECT max(score) FROM posts )
SELECT avg(posts.score) FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Stephen Turner'
SELECT DISTINCT users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE strftime('%Y', posts.creaiondate) = '2011' AND posts.viewcount > 20000
SELECT id, ownerdisplayname FROM posts WHERE strftime('%Y', creaiondate) = '2010' ORDER BY favoritecount DESC LIMIT 1
SELECT cast(sum(CASE WHEN users.reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE strftime('%Y', users.creationdate) = '2011'
SELECT cast(count(CASE WHEN age BETWEEN 13 AND 18 THEN 1 END) AS REAL) * 100 / count(id) FROM users
SELECT posts.viewcount, users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posthistory.text = 'Computer Game Datasets'
SELECT count(id) FROM posts WHERE viewcount > ( SELECT avg(viewcount) FROM posts )
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.score = ( SELECT max(score) FROM posts )
SELECT count(*) FROM posts WHERE viewcount > 35000 AND commentcount = 0
SELECT users.displayname, users.location FROM posts INNER JOIN users ON posts.lasteditoruserid = users.id WHERE posts.id = 183 ORDER BY posts.lasteditdate DESC LIMIT 1
SELECT b.name FROM users u JOIN badges b ON u.id = b.userid WHERE u.displayname = 'Emmett' ORDER BY b.date DESC LIMIT 1;
SELECT count(id) FROM users WHERE age >= 19 AND age <= 65 AND upvotes > 5000
SELECT badges.date - users.creationdate FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Zolomon'
SELECT count(DISTINCT posts.id) AS postcount, count(DISTINCT comments.id) AS commentcount FROM users users JOIN posts posts ON users.id = posts.owneruserid JOIN comments comments ON users.id = comments.userid WHERE users.creationdate = (SELECT max(creationdate) FROM users);
sql placeholder
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE badges.name = 'Citizen Patrol';
SELECT count(tags.wikipostid) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname LIKE 'careers'
SELECT reputation, views FROM users WHERE displayname = 'Jarrod Dixon';
SELECT sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 1 ELSE 0 END), sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 0 ELSE 1 END) FROM comments INNER JOIN posts ON comments.postid = posts.id
SELECT creationdate FROM users WHERE displayname = 'IrishStat'
SELECT count(postid) FROM votes WHERE bountyamount >= 30
SELECT cast(count(CASE WHEN posts.score > 50 THEN 1 ELSE NULL END) AS REAL) * 100 / count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.reputation = ( SELECT max(reputation) FROM users )
SELECT count(id) FROM posts WHERE score < 20
SELECT count(tags.tagname) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.id < 15 GROUP BY tags.tagname HAVING count(tags.tagname) <= 20
SELECT excerptpostid, wikipostid FROM tags WHERE tagname LIKE 'sample'
SELECT users.reputation, users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)'
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE title LIKE '%linear regression%');
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE viewcount BETWEEN 100 AND 150) AND score = (SELECT max(score) FROM comments WHERE postid IN (SELECT id FROM posts WHERE viewcount BETWEEN 100 AND 150));
SELECT users.creationdate, users.age FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.websiteurl LIKE 'http://%'
SELECT count(DISTINCT p.id) FROM posts p JOIN comments c ON p.id = c.postid WHERE p.viewcount < 5 AND c.score = 0;
SELECT count(DISTINCT comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1 AND comments.score = 0
SELECT count(DISTINCT users.id) FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.age = 40 AND comments.score = 0
SELECT ph.postid, count(c.id) AS commentcount FROM posthistory ph INNER JOIN posts p ON ph.postid = p.id LEFT JOIN comments c ON ph.postid = c.postid WHERE p.title = 'Group differences on a five point Likert item' GROUP BY ph.postid;
SELECT users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'R is also lazy evaluated.'
SELECT comments.text FROM comments INNER JOIN users ON users.id = comments.userid WHERE users.displayname = 'Harvey Motulsky'
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.score BETWEEN 1 AND 5 AND users.downvotes = 0
SELECT cast(sum(CASE WHEN users.upvotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM comments INNER JOIN users ON comments.userid = users.id WHERE comments.score BETWEEN 5 AND 10
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id = (SELECT id FROM superhero WHERE superhero_name = '3-D Man'));
SELECT count(DISTINCT superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength';
SELECT count(DISTINCT superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.height_cm > 200 AND superpower.power_name = 'Super Strength'
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id HAVING count(superhero.id) > 15
SELECT count(id) FROM superhero WHERE eye_colour_id IN (SELECT id FROM colour WHERE colour = 'Blue');
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse'
SELECT count(DISTINCT superhero.id) FROM superhero superhero JOIN colour colour ON superhero.eye_colour_id = colour.id JOIN hero_power hero_power ON superhero.id = hero_power.hero_id JOIN superpower superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';
sql placeholder
SELECT count(superhero.id) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC
SELECT publisher.publisher_name FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Sauron'
SELECT colour.colour, count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' GROUP BY superhero.eye_colour_id ORDER BY count(superhero.id) DESC LIMIT 1
SELECT avg(superhero.height_cm) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength'
SELECT count(superhero.id) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE publisher.publisher_name = 'DC Comics'
SELECT publisher.publisher_name FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON superhero.id = hero_attribute.hero_id INNER JOIN publisher ON publisher.id = superhero.publisher_id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value ASC LIMIT 1
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Gold'
SELECT DISTINCT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II'
SELECT count(id) FROM superhero WHERE hair_colour_id IN (SELECT id FROM colour WHERE colour = 'Blond');
SELECT superhero.full_name FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON superhero.id = hero_attribute.hero_id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value LIMIT 1
SELECT race FROM race WHERE id = (SELECT race_id FROM superhero WHERE superhero_name = 'Copycat');
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Death Touch';
SELECT count(DISTINCT superhero.id) FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id JOIN gender gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100;
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.id ORDER BY count(superhero.id) DESC LIMIT 1
SELECT count(DISTINCT superhero.id) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT cast(count(CASE WHEN alignment.alignment = 'Bad' THEN superhero.id ELSE NULL END) AS REAL) * 100 / count(superhero.id), count(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN superhero.id ELSE NULL END) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN alignment ON superhero.alignment_id = alignment.id
SELECT sum(iif(publisher.publisher_name = 'Marvel Comics', 1, 0)) - sum(iif(publisher.publisher_name = 'DC Comics', 1, 0)) AS difference FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT cast(sum(hero_attribute.attribute_value) AS REAL) / count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id
SELECT count(id) FROM superhero WHERE full_name IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.superhero_name = 'Deathlok');
SELECT avg(superhero.weight_kg) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' LIMIT 5
SELECT superhero.superhero_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.height_cm BETWEEN 170 AND 190 AND colour.colour = 'No Colour'
SELECT superpower.power_name FROM hero_power INNER JOIN superpower ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56
SELECT superhero.full_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Demi-God' LIMIT 5
SELECT count(superhero.id) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad'
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = '169'
SELECT colour.colour FROM superhero superhero JOIN race race ON superhero.race_id = race.id JOIN colour colour ON superhero.hair_colour_id = colour.id WHERE superhero.height_cm = 185 AND race.race = 'Human';
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id ORDER BY superhero.weight_kg DESC LIMIT 1
SELECT cast(count(CASE WHEN publisher.id = 13 THEN superhero.id ELSE NULL END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180
SELECT superhero.superhero_name FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND superhero.weight_kg > ( SELECT avg(weight_kg) FROM superhero ) * 0.79
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power GROUP BY power_id HAVING count(*) = (SELECT max(cnt) FROM (SELECT count(*) AS cnt FROM hero_power GROUP BY power_id)));
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Abomination' GROUP BY hero_attribute.attribute_value
SELECT DISTINCT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 1
SELECT count(DISTINCT hero_power.hero_id) FROM hero_power INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Stealth'
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT cast(count(superhero.id) AS REAL) / count(DISTINCT CASE WHEN superhero.skin_colour_id = 1 THEN superhero.id END) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id
SELECT count(*) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics' AND attribute.attribute_name = 'Durability' GROUP BY superhero.superhero_name ORDER BY sum(hero_attribute.attribute_value) DESC LIMIT 1
SELECT colour.colour FROM colour INNER JOIN superhero ON colour.id = superhero.eye_colour_id WHERE superhero.full_name = 'Abraham Sapien'
SELECT DISTINCT s.full_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight';
SELECT DISTINCT superhero.eye_colour_id, superhero.hair_colour_id, superhero.skin_colour_id FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Dark Horse Comics'
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.hair_colour_id = superhero.skin_colour_id AND superhero.eye_colour_id = superhero.hair_colour_id
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb' GROUP BY race.race
SELECT cast(sum(CASE WHEN colour.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE gender.gender = 'Female'
SELECT superhero.superhero_name, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler'
SELECT gender.gender FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13'
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation'
SELECT count(DISTINCT hero_power.power_id) FROM superhero superhero JOIN hero_power hero_power ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Amazo';
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON superpower.id = hero_power.power_id WHERE superhero.full_name = 'Hunter Zolomon'
SELECT superhero.height_cm FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber'
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id WHERE c.colour = 'Black';
SELECT DISTINCT superhero.eye_colour_id FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold'
SELECT full_name FROM superhero JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';
SELECT superhero.superhero_name FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT count(DISTINCT hero_attribute.hero_id) FROM hero_attribute hero_attribute JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = (SELECT max(attribute_value) FROM hero_attribute JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength');
SELECT race.race, alignment.alignment FROM race INNER JOIN superhero ON race.id = superhero.race_id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks'
SELECT cast(sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / count(publisher.publisher_name) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT avg(superhero.weight_kg) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference;
SELECT cast(sum(height_cm) AS REAL) / count(id) FROM superhero
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON superpower.id = hero_power.power_id WHERE superhero.superhero_name = 'Abomination'
SELECT count(superhero.id) FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE superhero.race_id = 21 AND gender.id = 1
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT count(superhero.id) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 3
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = '3-D Man'
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c.colour = 'Blue' AND c2.colour = 'Brown';
SELECT DISTINCT publisher.publisher_name FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT count(*) FROM superhero WHERE publisher_id = 1
SELECT cast(sum(CASE WHEN colour.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id
SELECT sum(iif(gender.gender = 'Male', 1, 0)) / sum(iif(gender.gender = 'Female', 1, 0)) AS ratio FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id
SELECT full_name FROM superhero WHERE height_cm = ( SELECT max(height_cm) FROM superhero )
SELECT id FROM superpower WHERE power_name = 'cryokinesis'
SELECT superhero_name FROM superhero WHERE id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT DISTINCT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Helen Parr'
SELECT race.race FROM race INNER JOIN superhero ON race.id = superhero.race_id WHERE superhero.height_cm = 188 AND superhero.weight_kg = 108
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = '38'
SELECT race.race FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON superhero.id = hero_attribute.hero_id INNER JOIN race ON race.id = superhero.race_id ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT alignment.alignment, superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Atom IV'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5
SELECT cast(sum(hero_attribute.attribute_value) AS REAL) / count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT colour.colour FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN colour colour ON superhero.skin_colour_id = colour.id WHERE hero_attribute.attribute_value = 100;
SELECT count(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE gender.id = 2 AND alignment.id = 1
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE gender.gender = 'Male' AND colour.colour = 'Blue'
SELECT cast(sum(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE alignment.id = 2
SELECT count(DISTINCT CASE WHEN superhero.eye_colour_id = 7 THEN superhero.id END) - count(DISTINCT CASE WHEN superhero.eye_colour_id = 1 THEN superhero.id END) AS difference FROM superhero superhero LEFT JOIN colour colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg = 0 OR superhero.weight_kg IS NULL;
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Ajax'
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE colour.colour = 'Green' AND alignment.alignment = 'Bad'
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'Marvel Comics' AND gender.gender = 'Female'
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC
SELECT gender.gender FROM hero_power INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN superhero ON hero_power.hero_id = superhero.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE superpower.power_name = 'Phoenix Force'
SELECT superhero.superhero_name FROM publisher publisher JOIN superhero superhero ON publisher.id = superhero.publisher_id WHERE publisher.publisher_name = 'DC Comics' AND superhero.weight_kg = (SELECT max(weight_kg) FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics');
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE race.race != 'Human' AND publisher.publisher_name = 'Dark Horse Comics'
SELECT count(DISTINCT superhero.id) FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;
SELECT sum(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - sum(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS difference FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id
SELECT attribute.attribute_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1
SELECT DISTINCT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination'
SELECT superhero_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero.superhero_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler'
SELECT cast(sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / count(publisher.publisher_name) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'George Lucas'
SELECT cast(sum(CASE WHEN alignment.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT count(*) FROM superhero WHERE full_name LIKE 'John%';
SELECT hero_id FROM hero_attribute WHERE attribute_value = ( SELECT min(attribute_value) FROM hero_attribute )
SELECT superhero.full_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg < 100 AND colour.colour = 'Brown'
SELECT attribute_value FROM hero_attribute WHERE hero_id IN (SELECT id FROM superhero WHERE superhero_name = 'Aquababy');
SELECT superhero.weight_kg, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT hero_power.hero_id FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Intelligence'
SELECT DISTINCT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.height_cm > ( SELECT avg(height_cm) * 0.8 FROM superhero )
SELECT drivers.driverref FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 20 AND qualifying.q1 = ( SELECT max(q1) FROM qualifying WHERE raceid = 20 )
SELECT drivers.surname FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 19 ORDER BY cast(replace(substr(qualifying.q2, 3), ':', '') AS REAL) LIMIT 1
SELECT races.year FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.location = 'Shanghai'
SELECT url FROM races WHERE circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Circuit de Barcelona-Catalunya' )
SELECT races.name FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE circuits.country = 'Germany'
SELECT circuits.name FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON constructors.constructorid = results.constructorid WHERE constructors.name = 'Renault'
SELECT count(DISTINCT races.raceid) FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2010 AND circuits.country NOT IN ('Asia', 'Europe');
SELECT races.name FROM circuits INNER JOIN races ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Spain'
SELECT DISTINCT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Australian Grand Prix'
SELECT races.url FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Sepang International Circuit';
SELECT races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Sepang International Circuit'
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE races.name = 'Abu Dhabi Grand Prix'
SELECT circuits.country FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON results.constructorid = constructors.constructorid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.raceid = 24 AND results.points = 1
SELECT drivers.forename, drivers.surname, qualifying.q1 FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE drivers.driverref = 'senna' AND qualifying.raceid = 354
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 355 AND qualifying.q2 = '1:01:40'
SELECT drivers.number FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 903 AND qualifying.q3 LIKE '1:01:54%'
SELECT count(DISTINCT results.driverid) FROM races races JOIN results results ON races.raceid = results.raceid WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NOT NULL;
SELECT DISTINCT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceid = 901
SELECT count(DISTINCT results.driverid) FROM races races JOIN results results ON races.raceid = results.raceid WHERE races.date = '2015-11-29';
SELECT dob FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE raceid = 592 AND time IS NOT NULL) ORDER BY dob LIMIT 1
SELECT drivers.url FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE laptimes.raceid = 161 AND laptimes.time = '0:01:27'
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE results.raceid = 933 ORDER BY results.fastestlapspeed DESC LIMIT 1
SELECT circuits.lat, circuits.lng FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Malaysian Grand Prix';
SELECT constructors.url FROM results INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE results.raceid = 9 ORDER BY results.points DESC LIMIT 1
SELECT qualifying.q1 FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE drivers.forename = 'Lucas' AND drivers.surname = 'DiGrassi' AND qualifying.raceid = 345
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 347 AND qualifying.q2 = '1:01:15'
SELECT drivers.code FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 45 AND qualifying.q3 LIKE '0:01:33%'
SELECT results.time FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Bruce' AND drivers.surname = 'McLaren' AND results.raceid = 743;
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'San Marino Grand Prix' AND results.position = 2 AND races.year = 2006
SELECT DISTINCT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceid = 901
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN races races ON results.raceid = races.raceid WHERE races.date = '2015-11-29' AND results.time IS NULL;
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.raceid = 872 ORDER BY drivers.dob DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid WHERE laptimes.raceid = 348 ORDER BY laptimes.time LIMIT 1
SELECT nationality FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE fastestlapspeed = (SELECT max(fastestlapspeed) FROM results));
SELECT cast((results.fastestlapspeed - results.fastestlapspeed) AS REAL) * 100 / results.fastestlapspeed FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Paul' AND drivers.surname = 'Di Resta' AND results.raceid = 853
SELECT cast(count(CASE WHEN results.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.date = '1983-07-16'
SELECT YEAR FROM races WHERE name = 'Singapore Grand Prix' AND YEAR = (SELECT min(YEAR) FROM races WHERE name = 'Singapore Grand Prix')
SELECT name FROM races WHERE YEAR = 2005 ORDER BY name DESC
SELECT name FROM races WHERE strftime('%Y-%m', date) = (SELECT strftime('%Y-%m', min(date)) FROM races WHERE strftime('%Y', date) = (SELECT min(strftime('%Y', date)) FROM races))
SELECT name, date FROM races WHERE YEAR = '1999' AND round = ( SELECT max(round) FROM races WHERE YEAR = '1999' )
SELECT YEAR FROM (SELECT YEAR, count(YEAR) AS num FROM races GROUP BY YEAR) WHERE num = (SELECT max(num) FROM (SELECT count(YEAR) AS num FROM races GROUP BY YEAR))
SELECT races.name FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.year = '2017' AND seasons.year != '2000'
SELECT circuits.country, circuits.name, circuits.location FROM races INNER JOIN seasons ON races.year = seasons.year INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix' ORDER BY races.year ASC LIMIT 1
SELECT races.year FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Brands Hatch' AND races.name = 'British Grand Prix' ORDER BY races.year DESC LIMIT 1
SELECT count(DISTINCT races.year) FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'British Grand Prix' AND circuits.name = 'Silverstone Circuit' AND circuits.country = 'United Kingdom';
SELECT DISTINCT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = 2010 AND races.name = 'Singapore Grand Prix' ORDER BY results.position
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN RESULTS ON drivers.driverid = RESULTS.driverid ORDER BY RESULTS.points DESC LIMIT 1
SELECT drivers.forename, drivers.surname, driverstandings.points FROM races INNER JOIN driverstandings ON races.raceid = driverstandings.raceid INNER JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE races.year = 2017 AND races.name = 'Chinese Grand Prix' ORDER BY driverstandings.points DESC LIMIT 3
SELECT drivers.forename, drivers.surname, races.name FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid ORDER BY laptimes.milliseconds LIMIT 1
SELECT cast(sum(results.milliseconds) AS REAL) / count(results.milliseconds) FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'Malaysian Grand Prix' AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT cast(sum(CASE WHEN drivers.surname = 'Hamilton' AND results.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(results.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year >= 2010 AND races.circuitid = 1
SELECT drivers.forename, drivers.surname, drivers.nationality, max(driverstandings.points) FROM drivers INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid GROUP BY drivers.driverid ORDER BY count(driverstandings.wins) DESC LIMIT 1
SELECT dob, (strftime('%Y', 'now') - strftime('%Y', dob)) AS age FROM drivers WHERE nationality = 'Japanese' ORDER BY age DESC LIMIT 1
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year BETWEEN 1990 AND 2000 GROUP BY circuits.name HAVING count(races.raceid) = 4
SELECT c.name, c.location, r.name FROM circuits c JOIN races r ON c.circuitid = r.circuitid WHERE c.country = 'USA' AND r.year = 2006;
SELECT races.name, circuits.name, circuits.location FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE strftime('%Y-%m', races.`date`) = '2005-09'
SELECT races.name FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT count(*) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND races.circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Sepang International Circuit' ) AND results.points = ( SELECT max(points) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND races.circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Sepang International Circuit' ) )
SELECT races.name, races.year FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY results.milliseconds ASC LIMIT 1
sql placeholder
SELECT races.year, results.points FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year LIMIT 1
SELECT races.name, circuits.country FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2017 ORDER BY races.date
sql placeholder
SELECT (count(DISTINCT CASE WHEN circuits.country = 'Germany' THEN races.raceid END) * 100.0 / count(DISTINCT races.raceid)) AS percentage FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix';
SELECT lat, lng FROM circuits WHERE NAME = 'Silverstone Circuit'
SELECT name FROM circuits WHERE LOCATION = 'Silverstone' OR name = 'Hockenheimring' OR name = 'Hungaroring' ORDER BY lat DESC LIMIT 1
SELECT DISTINCT circuitref FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits ORDER BY alt DESC LIMIT 1
SELECT count(driverid) FROM drivers WHERE code IS NULL
SELECT country FROM circuits WHERE circuitid IN (SELECT circuitid FROM races INNER JOIN driverstandings ON races.raceid = driverstandings.raceid INNER JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE dob IS NOT NULL ORDER BY dob LIMIT 1);
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverref FROM drivers WHERE surname = 'Hamilton' AND forename = 'Lewis'
SELECT circuits.name FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;
SELECT DISTINCT races.year FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Silverstone Circuit';
SELECT races.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Silverstone Circuit'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2010 AND circuits.name = 'Abu Dhabi Circuit'
SELECT count(DISTINCT races.raceid) FROM circuits circuits JOIN races races ON circuits.circuitid = races.circuitid WHERE circuits.country = 'Italy';
SELECT DISTINCT races.date FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Barcelona-Catalunya'
SELECT circuits.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT fastestlaptime FROM results WHERE driverid = ( SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton' ) ORDER BY fastestlaptime LIMIT 1
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY results.fastestlapspeed DESC LIMIT 1
SELECT drivers.driverref FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'Canadian Grand Prix' AND races.year = 2007 AND results.position = 1
SELECT DISTINCT races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT races.name FROM results INNER JOIN races ON results.raceid = races.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank LIMIT 1
SELECT max(results.fastestlapspeed) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT DISTINCT races.year FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT results.positionorder FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'Chinese Grand Prix' AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2008
SELECT drivers.forename, drivers.surname FROM results INNER JOIN races ON results.raceid = races.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = 1989 AND results.grid = 4
SELECT count(DISTINCT results.driverid) FROM races races JOIN results results ON races.raceid = results.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.time IS NOT NULL;
SELECT results.fastestlap FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND races.year = '2008'
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Chinese Grand Prix' AND races.year = 2008 AND results.rank = 2
SELECT drivers.forename, drivers.surname, drivers.url FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1
SELECT count(DISTINCT drivers.driverid) FROM races races JOIN results results ON races.raceid = results.raceid JOIN drivers drivers ON results.driverid = drivers.driverid WHERE races.year = 2008 AND drivers.nationality = 'British';
SELECT count(DISTINCT results.driverid) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Chinese Grand Prix' AND results.time IS NOT NULL
SELECT total(results.points) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT avg(cast(replace(substr(results.fastestlaptime, 4), ':', '') AS REAL)) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT cast(sum(CASE WHEN results.time IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix'
SELECT cast((results.milliseconds - ( SELECT results.milliseconds FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1 )) AS REAL) * 100 / ( SELECT results.milliseconds FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1 ) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1
SELECT count(circuitid) FROM circuits WHERE country = 'Australia' AND LOCATION = 'Adelaide'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT count(driverid) FROM drivers WHERE nationality = 'British' AND dob > '1980-12-31';
SELECT max(constructorresults.points) FROM constructors constructors JOIN constructorresults constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'British';
SELECT name FROM constructors WHERE constructorid IN (SELECT constructorid FROM constructorresults WHERE points = (SELECT max(points) FROM constructorresults WHERE points IS NOT NULL));
SELECT name FROM constructors WHERE constructorid IN (SELECT constructorid FROM constructorstandings WHERE raceid = 291 AND POSITION = 1 AND points = 0);
SELECT count(constructorresults.constructorid) FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'Japanese' GROUP BY constructorresults.constructorid HAVING count(constructorresults.raceid) = 2 AND sum(constructorresults.points) = 0
SELECT constructors.name FROM results INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE results.rank = 1
SELECT count(DISTINCT constructors.name) FROM constructors INNER JOIN results ON constructors.constructorid = results.constructorid WHERE results.laps > 50 AND constructors.nationality = 'French'
SELECT cast(sum(CASE WHEN races.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / count(drivers.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.nationality = 'Japanese'
SELECT avg(cast(replace(substr(results.time, 3), ':', '') AS REAL)) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year < 1975 AND results.time IS NOT NULL
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.dob > '1975-12-31' AND results.rank = 2
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers LEFT JOIN results results ON drivers.driverid = results.driverid WHERE drivers.nationality = 'Italian' AND (results.time IS NULL OR results.time = '');
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY results.fastestlaptime LIMIT 1
sql placeholder
SELECT avg(results.fastestlapspeed) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT races.name, races.year FROM races INNER JOIN results ON races.raceid = results.raceid WHERE results.milliseconds IS NOT NULL ORDER BY results.milliseconds ASC LIMIT 1
SELECT cast(sum(CASE WHEN races.year < drivers.dob AND results.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON drivers.driverid = results.driverid WHERE races.year BETWEEN 2000 AND 2005
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN laptimes laptimes ON drivers.driverid = laptimes.driverid WHERE drivers.nationality = 'French' AND laptimes.time < '02:00:00' AND cast(substr(laptimes.time, 3, 2) AS INTEGER) * 60 + cast(substr(laptimes.time, 6, 2) AS INTEGER) < 120;
SELECT DISTINCT code FROM drivers WHERE nationality = 'American'
SELECT raceid FROM races WHERE strftime('%Y', date) = '2009';
SELECT count(DISTINCT driverid) FROM results WHERE raceid = 18;
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN circuits circuits ON drivers.code = circuits.circuitid WHERE drivers.dob IS NOT NULL AND drivers.nationality = 'Netherlands' AND circuits.country = 'Netherlands' AND drivers.driverid IN (SELECT driverid FROM driverstandings ORDER BY position DESC LIMIT 3);
SELECT driverref FROM drivers WHERE (forename = 'Robert' AND surname = 'Kubica')
SELECT count(driverid) FROM drivers WHERE dob LIKE '1980%' AND nationality = 'British'
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE drivers.nationality = 'German' AND strftime('%Y', drivers.dob) BETWEEN '1980' AND '1990' ORDER BY laptimes.time ASC LIMIT 3
SELECT driverref FROM drivers WHERE nationality = 'German' ORDER BY dob LIMIT 1;
SELECT drivers.driverid, drivers.code FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid WHERE drivers.dob LIKE '1971%' AND results.fastestlaptime IS NOT NULL;
sql placeholder
SELECT DISTINCT races.year FROM races INNER JOIN results ON races.raceid = results.raceid WHERE results.fastestlaptime IS NOT NULL;
SELECT races.year FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid ORDER BY cast(replace(substr(laptimes.time, 2), ':', '') AS REAL) DESC LIMIT 1
SELECT driverid FROM results ORDER BY fastestlaptime LIMIT 5
SELECT count(raceid) FROM results WHERE statusid = 2 AND raceid BETWEEN 50 AND 100
SELECT location, lat, lng FROM circuits WHERE country = 'Austria'
SELECT raceid FROM results WHERE TIME IS NOT NULL GROUP BY raceid HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM results WHERE TIME IS NOT NULL GROUP BY raceid));
SELECT drivers.driverref, drivers.nationality, drivers.dob FROM qualifying INNER JOIN drivers ON qualifying.driverid = drivers.driverid WHERE qualifying.raceid = 23 AND qualifying.q2 IS NOT NULL
SELECT races.year, races.date, races.time FROM qualifying INNER JOIN races ON qualifying.raceid = races.raceid INNER JOIN drivers ON qualifying.driverid = drivers.driverid ORDER BY drivers.dob LIMIT 1
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN status status ON results.statusid = status.statusid WHERE drivers.nationality = 'American' AND status.status = 'Puncture';
SELECT constructors.name, constructors.url FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'Italian' ORDER BY constructorresults.points DESC LIMIT 1
SELECT constructors.url FROM constructors INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid GROUP BY constructors.url ORDER BY sum(constructorstandings.wins) DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'French Grand Prix' ORDER BY cast(replace(substr(results.time, 3), ':', '') AS REAL) DESC LIMIT 1
SELECT races.raceid, laptimes.milliseconds FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid ORDER BY laptimes.milliseconds LIMIT 1
SELECT cast(sum(results.fastestlaptime) AS REAL) / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year = 2006 AND races.name = 'United States Grand Prix' AND results.rank < 11
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.nationality = 'German' AND strftime('%Y', drivers.dob) BETWEEN '1980' AND '1985' GROUP BY drivers.driverid ORDER BY sum(cast(pitstops.duration AS REAL)) / count(pitstops.duration) ASC LIMIT 3
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Canadian Grand Prix' AND races.year = 2008 ORDER BY results.milliseconds DESC LIMIT 1
SELECT constructors.constructorref, constructors.url FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE races.name = 'Singapore Grand Prix' AND races.year = 2009 ORDER BY races.time DESC LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid WHERE drivers.nationality = 'Austrian' AND strftime('%Y', drivers.dob) BETWEEN '1981' AND '1991'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC
SELECT LOCATION, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT results.points, constructors.name, constructors.nationality FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON constructors.constructorid = results.constructorid WHERE races.name = 'Monaco Grand Prix' AND races.year BETWEEN 1980 AND 2010 ORDER BY results.points DESC LIMIT 1
SELECT avg(results.points) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix'
SELECT cast(count(DISTINCT raceid) AS REAL) / 10 FROM races WHERE strftime('%Y', date) BETWEEN '2000' AND '2010';
SELECT nationality FROM drivers GROUP BY nationality HAVING count(driverid) = (SELECT max(driver_count) FROM (SELECT count(driverid) AS driver_count FROM drivers GROUP BY nationality));
SELECT wins FROM driverstandings WHERE POSITION = 91
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT circuits.location, circuits.country FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid ORDER BY races.date DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN races ON qualifying.raceid = races.raceid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2008 AND circuits.name = 'Marina Bay Street Circuit' ORDER BY cast(replace(substr(qualifying.q3, 3), ',', '') AS REAL) LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.nationality, races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY drivers.dob DESC LIMIT 1
SELECT count(*) FROM results INNER JOIN races ON results.raceid = races.raceid INNER JOIN status ON results.statusid = status.statusid WHERE races.name = 'Canadian Grand Prix' AND status.status = 'Accident' AND results.driverid = ( SELECT driverid FROM driverstandings ORDER BY wins DESC LIMIT 1 )
SELECT driverstandings.wins, drivers.forename, drivers.surname FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid ORDER BY drivers.dob LIMIT 1
SELECT max(cast(duration AS INTEGER)) FROM pitstops
SELECT races.time FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime DESC LIMIT 1
SELECT max(pitstops.duration) FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT pitstops.lap FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid INNER JOIN races ON pitstops.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2011
SELECT DISTINCT pitstops.duration FROM races INNER JOIN pitstops ON races.raceid = pitstops.raceid WHERE races.year = 2011 AND races.name = 'Australian Grand Prix'
SELECT results.fastestlap FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
sql placeholder
SELECT results.position FROM results INNER JOIN laptimes ON results.raceid = laptimes.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY laptimes.time LIMIT 1
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Austrian Grand Prix' ORDER BY results.time DESC LIMIT 1
SELECT DISTINCT laptimes.time FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN laptimes ON races.raceid = laptimes.raceid WHERE circuits.country = 'Italy'
SELECT races.name FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid WHERE races.name = 'Austrian Grand Prix' ORDER BY laptimes.milliseconds LIMIT 1
SELECT pitstops.duration FROM races INNER JOIN pitstops ON races.raceid = pitstops.raceid WHERE races.name = 'Austrian Grand Prix'
SELECT circuits.lat, circuits.lng FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE laptimes.time = '1:29.488'
SELECT avg(pitstops.milliseconds) FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT avg(cast(milliseconds AS INTEGER)) FROM laptimes WHERE raceid IN (SELECT raceid FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy');
SELECT player_api_id FROM player_attributes WHERE overall_rating = ( SELECT max(overall_rating) FROM player_attributes )
SELECT player.height, player.player_name FROM player player WHERE player.height = (SELECT max(height) FROM player);
SELECT preferred_foot FROM player_attributes WHERE potential = ( SELECT min(potential) FROM player_attributes )
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating BETWEEN 60 AND 65 AND player_attributes.defensive_work_rate LIKE 'low'
SELECT player_api_id FROM player_attributes ORDER BY crossing DESC LIMIT 5;
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2015/2016' GROUP BY league.name ORDER BY sum(MATCH.home_team_goal) - sum(MATCH.away_team_goal) DESC LIMIT 1
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.season = '2016/2017' AND MATCH.home_team_goal - MATCH.away_team_goal < 0 GROUP BY team.team_long_name ORDER BY count(*) ASC LIMIT 1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes ORDER BY penalties DESC LIMIT 10);
SELECT team.team_long_name FROM league league JOIN MATCH MATCH ON league.id = MATCH.league_id JOIN team team ON MATCH.away_team_api_id = team.team_api_id WHERE league.name = 'Scotland Premier League' AND MATCH.season = '2009/2010' AND MATCH.away_team_goal - MATCH.home_team_goal > 0 GROUP BY team.team_long_name ORDER BY count(*) DESC LIMIT 1;
SELECT max(team_attributes.buildupplayspeed) FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id ORDER BY team_attributes.buildupplayspeed DESC LIMIT 4
SELECT league.name FROM match INNER JOIN league ON match.league_id = league.id WHERE match.season = '2016/2017' GROUP BY league.name ORDER BY sum(CASE WHEN match.home_team_goal = match.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT player.player_name FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.sprint_speed >= 97 AND strftime('%Y', player_attributes.date) BETWEEN '2013' AND '2015';
SELECT league.name, (SELECT count(*) FROM MATCH WHERE league_id = league.id) AS matches FROM league league WHERE league.id IN (SELECT league_id FROM MATCH GROUP BY league_id HAVING count(*) = (SELECT max(match_count) FROM (SELECT count(*) AS match_count FROM MATCH GROUP BY league_id)))
SELECT avg(height) FROM player WHERE cast(strftime('%Y', birthday) AS INT) BETWEEN 1990 AND 1995
SELECT player_api_id FROM player_attributes WHERE substr(date, 1, 4) = '2010' ORDER BY overall_rating DESC LIMIT 1
SELECT team_fifa_api_id FROM team_attributes WHERE buildupplayspeed > 50 AND buildupplayspeed < 60;
SELECT team.team_long_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE strftime('%Y', team_attributes.date) = '2012' AND team_attributes.buildupplaypassing IS NOT NULL GROUP BY team.team_long_name HAVING sum(team_attributes.buildupplaypassing) / count(team.team_long_name) > ( SELECT avg(team_attributes.buildupplaypassing) FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE strftime('%Y', team_attributes.date) = '2012' AND team_attributes.buildupplaypassing IS NOT NULL )
SELECT cast(sum(CASE WHEN player_attributes.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / count(player_attributes.player_fifa_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', player.birthday) BETWEEN '1987' AND '1992'
SELECT league.name FROM league league WHERE league.id IN (SELECT match.league_id FROM MATCH match GROUP BY match.league_id HAVING sum(match.home_team_goal) + sum(match.away_team_goal) IS NOT NULL ORDER BY sum(match.home_team_goal) + sum(match.away_team_goal) DESC LIMIT 5);
SELECT cast(sum(player_attributes.long_shots) AS REAL) / count(player_attributes.player_fifa_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ahmed Samir Farag'
sql placeholder
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.date LIKE '2014%' AND team_attributes.buildupplaydribblingclass = 'Normal' ORDER BY cast(team_attributes.chancecreationpassing AS REAL) / team_attributes.chancecreationpassing DESC LIMIT 1
SELECT league.name FROM league INNER JOIN MATCH ON league.id = MATCH.league_id WHERE MATCH.season = '2009/2010' GROUP BY league.name HAVING avg(MATCH.home_team_goal) > avg(MATCH.away_team_goal)
SELECT team_short_name FROM team WHERE team_long_name LIKE 'Queens Park Rangers'
SELECT player_name FROM player WHERE birthday LIKE '1970-10%'
SELECT player_attributes.attacking_work_rate FROM player INNER JOIN player_attributes ON player.player_fifa_api_id = player_attributes.player_fifa_api_id WHERE player.player_name = 'Franco Zennaro'
SELECT team_attributes.buildupplaypositioningclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'ADO Den Haag'
SELECT player_attributes.heading_accuracy FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francois Affolter' AND player_attributes.date = '2014-09-18 00:00:00';
SELECT player_attributes.overall_rating FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Gabriel Tamas' AND strftime('%Y', player_attributes.date) = '2011'
SELECT sum(CASE WHEN league.name = 'Scotland Premier League' THEN 1 ELSE 0 END) FROM `match` INNER JOIN league ON match.league_id = league.id WHERE match.season = '2015/2016'
SELECT player_attributes.preferred_foot FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player.birthday DESC LIMIT 1;
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE potential = (SELECT max(potential) FROM player_attributes));
SELECT count(player_attributes.player_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight < 130 AND player_attributes.preferred_foot = 'left'
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE chancecreationpassingclass = 'Risky');
SELECT player_attributes.defensive_work_rate FROM player INNER JOIN player_attributes ON player.player_fifa_api_id = player_attributes.player_fifa_api_id WHERE player.player_name = 'David Wilson'
SELECT birthday FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT name FROM league WHERE country_id IN (SELECT id FROM country WHERE name = 'Netherlands');
SELECT avg(home_team_goal) FROM MATCH JOIN country ON match.country_id = country.id WHERE country.name = 'Poland' AND match.season = '2010/2011';
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player.height DESC LIMIT 1, 1
SELECT player_name FROM player WHERE height > 180
SELECT count(*) FROM player WHERE strftime('%Y', birthday) > '1990';
SELECT count(*) FROM player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.overall_rating > 80 AND strftime('%Y', player_attributes.date) BETWEEN '2008' AND '2010'
SELECT player_attributes.potential FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Doran'
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE preferred_foot = 'left');
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplayspeedclass = 'Fast'
SELECT team_attributes.buildupplaypassingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_short_name = 'CLB'
SELECT team.team_short_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplaypassing > 70
SELECT avg(player_attributes.overall_rating) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', player_attributes.date) BETWEEN '2010' AND '2015' AND player.height > 170
SELECT player_name FROM player WHERE height = (SELECT min(height) FROM player);
SELECT country.name FROM league league JOIN country country ON league.country_id = country.id WHERE league.name = 'Italy Serie A';
SELECT team.team_short_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team_attributes.buildupplayspeed = 31 AND team_attributes.buildupplaydribbling = 53 AND team_attributes.buildupplaypassing = 32
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Aaron Doran');
SELECT count(*) FROM MATCH JOIN league ON match.league_id = league.id WHERE league.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', match.date) BETWEEN '2008-08' AND '2008-10';
SELECT team.team_short_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.home_team_goal = 10
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE balance = 61 AND potential = 61);
SELECT avg(player_attributes.ball_control) - ( SELECT avg(player_attributes.ball_control) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Appindangoye' ) AS difference FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Abdou Diallo'
SELECT team_long_name FROM team WHERE team_short_name = 'GEN';
SELECT player_name FROM player WHERE player_name = 'Abdelaziz Barrada' OR player_name = 'Aaron Lennon' ORDER BY birthday LIMIT 1
SELECT player_name FROM player WHERE height = ( SELECT max(height) FROM player )
SELECT count(player_attributes.player_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.preferred_foot = 'left' AND player_attributes.attacking_work_rate = 'low'
SELECT country.name FROM country INNER JOIN league ON country.id = league.country_id WHERE league.name = 'Belgium Jupiler League'
SELECT league.name FROM league league JOIN country country ON league.country_id = country.id WHERE country.name = 'Germany';
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT count(DISTINCT player.id) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', player.birthday) < '1986' AND player_attributes.defensive_work_rate = 'high';
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name IN ('Ariel Borysiuk', 'Arouna Kone', 'Alexis') ORDER BY player_attributes.crossing DESC LIMIT 1
SELECT player_attributes.heading_accuracy FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ariel Borysiuk';
SELECT count(DISTINCT player.id) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.height > 180 AND player_attributes.volleys > 70;
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE volleys > 70 AND dribbling > 70);
SELECT count(*) FROM MATCH INNER JOIN league ON match.league_id = league.id INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Belgium' AND match.season = '2008/2009'
SELECT long_passing FROM player_attributes WHERE player_api_id = ( SELECT player_api_id FROM player ORDER BY birthday ASC LIMIT 1 )
SELECT count(*) FROM MATCH INNER JOIN league ON match.league_id = league.id WHERE league.name = 'Belgium Jupiler League' AND substr(`date`, 1, 7) = '2009-04'
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2008/2009' GROUP BY league.name ORDER BY count(MATCH.id) DESC LIMIT 1
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE strftime('%Y', birthday) < '1986');
SELECT cast((player_attributes.overall_rating - (SELECT overall_rating FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Paulin Puel') ) ) AS REAL) * 100 / (SELECT overall_rating FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Paulin Puel')) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ariel Borysiuk';
SELECT avg(team_attributes.buildupplayspeed) FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Heart of Midlothian'
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Pietro Marino');
SELECT sum(player_attributes.crossing) FROM player INNER JOIN player_attributes ON player.player_fifa_api_id = player_attributes.player_fifa_api_id WHERE player.player_name = 'Aaron Lennox'
SELECT team_attributes.chancecreationpassing, team_attributes.chancecreationpassingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Ajax' ORDER BY team_attributes.chancecreationpassing DESC LIMIT 1
SELECT player_attributes.preferred_foot FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Abdou Diallo'
SELECT player_attributes.overall_rating FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Dorlan Pabon' ORDER BY player_attributes.overall_rating DESC LIMIT 1
SELECT avg(MATCH.away_team_goal) FROM MATCH INNER JOIN team ON team.team_api_id = MATCH.away_team_api_id WHERE team.team_long_name = 'Parma' AND team.team_long_name = 'Italy'
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.overall_rating = 77 AND player_attributes.date LIKE '2016-06-23%' ORDER BY player.birthday DESC LIMIT 1
SELECT player_attributes.overall_rating FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Mooy' AND player_attributes.date LIKE '2016-02-04%'
SELECT player_attributes.potential FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francesco Parravicini' AND player_attributes.date = '2010-08-30 00:00:00'
SELECT player_attributes.attacking_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francesco Migliore' AND player_attributes.date LIKE '2015-05-01%'
SELECT player_attributes.defensive_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Kevin Berigaud' AND player_attributes.date = '2013-02-22'
SELECT player_attributes.date FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Kevin Constant' ORDER BY player_attributes.crossing DESC LIMIT 1
SELECT team_attributes.buildupplayspeedclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Willem II' AND team_attributes.date = '2012-02-22'
SELECT team_attributes.buildupplaydribblingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_short_name = 'LEI' AND team_attributes.date = '2015-09-10 00:00:00'
SELECT team_attributes.buildupplaypassingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'FC Lorient' AND team_attributes.`date` LIKE '2010-02-22%'
SELECT team_attributes.chancecreationpassingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.date = '2013-09-20' AND team.team_long_name = 'PEC Zwolle'
SELECT team_attributes.chancecreationcrossingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Hull City' AND team_attributes.date = '2010-02-22'
SELECT team_attributes.defenceaggressionclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Hannover 96' AND team_attributes.date LIKE '2015-09-10%'
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22' AND '2016-04-21';
SELECT cast((sum(CASE WHEN player.player_name = 'Landon Donovan' THEN player_attributes.overall_rating ELSE 0 END) - sum(CASE WHEN player.player_name = 'Jordan Bowery' THEN player_attributes.overall_rating ELSE 0 END)) AS REAL) * 100 / sum(CASE WHEN player.player_name = 'Landon Donovan' THEN player_attributes.overall_rating ELSE 0 END) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.date = '2013-07-12'
SELECT player_name FROM player WHERE height = ( SELECT max(height) FROM player )
SELECT player_api_id FROM player WHERE weight = (SELECT max(weight) FROM player);
SELECT player_name FROM player WHERE strftime('%Y', 'now') - strftime('%Y', birthday) > 35
SELECT sum(CASE WHEN player.player_name = 'Aaron Lennon' THEN 1 ELSE 0 END) FROM MATCH INNER JOIN player ON player.player_api_id = MATCH.home_player_1
SELECT sum(CASE WHEN player.player_name = 'Daan Smith' THEN match.away_team_goal ELSE 0 END) + sum(CASE WHEN player.player_name = 'Filipe Ferreira' THEN match.away_team_goal ELSE 0 END) FROM player INNER JOIN MATCH ON player.player_api_id = MATCH.away_player_11 OR player.player_api_id = MATCH.away_player_10 OR player.player_api_id = MATCH.away_player_9 OR player.player_api_id = MATCH.away_player_8 OR player.player_api_id = MATCH.away_player_7 OR player.player_api_id = MATCH.away_player_6 OR player.player_api_id = MATCH.away_player_5 OR player.player_api_id = MATCH.away_player_4 OR player.player_api_id = MATCH.away_player_3 OR player.player_api_id = MATCH.away_player_2 OR player.player_api_id = MATCH.away_player_1
SELECT sum(match.home_team_goal) FROM player INNER JOIN MATCH ON player.player_api_id = MATCH.home_player_11 WHERE strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', player.birthday) <= 30
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE potential = (SELECT max(potential) FROM player_attributes));
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE attacking_work_rate = 'high');
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.finishing = 1 ORDER BY strftime('%J', CURRENT_TIMESTAMP) - strftime('%J', player.birthday) DESC LIMIT 1
SELECT player.player_name FROM player INNER JOIN league ON player.id = league.id INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Belgium'
SELECT player.player_name, country.name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id INNER JOIN league ON league.id = player.id INNER JOIN country ON country.id = league.country_id WHERE player_attributes.vision > 89
SELECT country.name FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id JOIN league league ON player.player_api_id = league.id JOIN country country ON league.country_id = country.id GROUP BY country.name ORDER BY avg(player.weight) DESC LIMIT 1;
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplayspeedclass = 'Slow'
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE chancecreationpassingclass = 'Safe');
SELECT avg(player.height) FROM player INNER JOIN league ON player.player_api_id = league.id INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Italy'
SELECT player_name FROM player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;
SELECT count(player_name) FROM player WHERE player_name LIKE 'Aaron%' AND cast(strftime('%Y', birthday) AS INT) > 1990
SELECT sum(CASE WHEN id = 6 THEN jumping ELSE 0 END) - sum(CASE WHEN id = 23 THEN jumping ELSE 0 END) AS difference FROM player_attributes;
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'right' AND player_attributes.potential = ( SELECT min(potential) FROM player_attributes ) LIMIT 5
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'left' AND player_attributes.crossing = ( SELECT max(player_attributes.crossing) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'left' )
SELECT cast(count(id) AS REAL) * 100 / ( SELECT count(id) FROM player ) FROM player_attributes WHERE stamina > 80 AND strength > 80
SELECT country.name FROM league INNER JOIN country ON league.country_id = country.id WHERE league.name = 'Poland Ekstraklasa'
SELECT match.home_team_goal, match.away_team_goal FROM `match` INNER JOIN league ON match.league_id = league.id WHERE league.name = 'Belgium Jupiler League' AND match.date LIKE '2008-09-24%'
SELECT player_attributes.sprint_speed, player_attributes.agility, player_attributes.acceleration FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Alexis Blin';
SELECT team_attributes.buildupplayspeedclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'KSV Cercle Brugge'
SELECT count(DISTINCT match.id) FROM league league JOIN match match ON league.id = match.league_id WHERE league.name = 'Italian Serie A' AND match.season = '2015/2016';
SELECT max(home_team_goal) FROM MATCH JOIN league ON match.league_id = league.id WHERE league.name = 'Netherlands Eredivisie';
SELECT player_attributes.finishing, player_attributes.curve FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight = (SELECT max(weight) FROM player);
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2015/2016' GROUP BY league.name ORDER BY count(MATCH.id) DESC LIMIT 4
SELECT team_long_name FROM team WHERE team_api_id IN (SELECT away_team_api_id FROM MATCH WHERE away_team_goal = (SELECT max(away_team_goal) FROM MATCH WHERE away_team_goal IS NOT NULL));
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT cast(sum(CASE WHEN player.height < 180 AND player_attributes.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id), cast(sum(CASE WHEN admission = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE sex = 'M'
SELECT cast(sum(CASE WHEN strftime('%Y', birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE sex = 'F'
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE strftime('%Y', birthday) BETWEEN '1930' AND '1940'
SELECT (SELECT count(*) FROM patient WHERE admission = '-' AND diagnosis = 'SLE') * 1.0 / (SELECT count(*) FROM patient WHERE admission = '+' AND diagnosis = 'SLE') AS ratio;
SELECT patient.diagnosis, laboratory.date FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.id = '30609'
SELECT patient.sex, patient.birthday, examination.`examination date`, examination.symptoms FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.id = '163109'
SELECT DISTINCT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ldh > 500
SELECT patient.id, strftime('%Y', 'now') - strftime('%Y', patient.birthday) AS age FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.rvvt = '+'
SELECT patient.id, patient.sex, patient.diagnosis FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.thrombosis = 2
SELECT DISTINCT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) = '1937' AND laboratory.`t-cho` > 250
SELECT DISTINCT patient.id, patient.sex, patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.alb < 3.5
SELECT cast(sum(CASE WHEN laboratory.tp < '6.0' OR laboratory.tp > '8.5' THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.tp) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F'
SELECT avg(examination.`acl igg`) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.admission = '+' AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', patient.birthday) >= 50
SELECT count(id) FROM patient WHERE admission = '-' AND sex = 'F' AND strftime('%Y', description) = '1997'
SELECT (strftime('%Y', `first date`) - strftime('%Y', birthday)) AS age FROM patient ORDER BY (strftime('%Y', `first date`) - strftime('%Y', birthday)) DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND examination.thrombosis = '1' AND strftime('%Y', examination.`examination date`) = '1997';
SELECT max(strftime('%Y', birthday)) - min(strftime('%Y', birthday)) AS agegap FROM patient WHERE id IN (SELECT id FROM laboratory WHERE tg >= 200);
SELECT examination.symptoms, examination.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id ORDER BY patient.birthday DESC LIMIT 1
SELECT cast(count(laboratory.id) AS REAL) / 12 FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y-%m', laboratory.`date`) = '1998-12' AND patient.sex = 'M'
SELECT laboratory.`date`, strftime('%Y', patient.birthday) - strftime('%Y', patient.`first date`) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SJS' ORDER BY patient.birthday LIMIT 1
SELECT cast(sum(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ua <= '8.0'
SELECT count(DISTINCT patient.id) FROM patient patient LEFT JOIN examination examination ON patient.id = examination.id WHERE strftime('%Y', patient.`first date`) - strftime('%Y', examination.`examination date`) < 1;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE strftime('%Y', patient.birthday) < '18' AND strftime('%Y', examination.`examination date`) BETWEEN '1990' AND '1993';
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.`t-bil` >= '2.0';
SELECT diagnosis FROM (SELECT diagnosis, count(diagnosis) AS COUNT FROM examination WHERE "Examination Date" BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY diagnosis) WHERE COUNT = (SELECT max(COUNT) FROM (SELECT count(diagnosis) AS COUNT FROM examination WHERE "Examination Date" BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY diagnosis));
SELECT avg(strftime('%Y', patient.birthday) - strftime('%Y', patient.`first date`)) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.date = '1991-10-01'
SELECT strftime('%Y', examination.`examination date`) - strftime('%Y', patient.birthday), patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id ORDER BY laboratory.hgb DESC LIMIT 1
SELECT ana FROM examination WHERE `examination date` = '1996-12-02' AND id = 3605340
SELECT CASE WHEN `t-cho` < 250 THEN 'Normal' ELSE 'Abnormal' END AS RESULT FROM laboratory WHERE id = 2927464 AND `date` = '1995-09-04';
SELECT sex FROM patient WHERE diagnosis = 'AORTITIS' LIMIT 1
SELECT examination.`acl igm` FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.description = '1994-02-19' AND examination.`examination date` = '1993-11-12' AND examination.diagnosis = 'SLE'
SELECT patient.sex FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.`date` = '1992-06-12' AND laboratory.gpt = 9
SELECT (strftime('%Y', laboratory.`date`) - strftime('%Y', patient.birthday)) AS age FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.date = '1991-10-21' AND laboratory.ua = '8.4'
SELECT count(laboratory.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE patient.`first date` = '1991-06-13' AND patient.diagnosis = 'SJS' AND laboratory.date LIKE '1995%'
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`examination date` = '1997-01-27' AND patient.diagnosis = 'SLE' ORDER BY patient.`first date` ASC LIMIT 1
SELECT examination.symptoms FROM examination INNER JOIN patient ON examination.id = patient.id WHERE patient.birthday = '1959-03-01' AND examination.`examination date` = '1993-09-27'
SELECT sum(CASE WHEN laboratory.date LIKE '1981-11%' AND patient.birthday = '1959-02-18' THEN laboratory.`t-cho` ELSE 0 END) - sum(CASE WHEN laboratory.date LIKE '1981-12%' AND patient.birthday = '1959-02-18' THEN laboratory.`t-cho` ELSE 0 END) AS decreaterate FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.birthday = '1959-02-18'
SELECT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.description) = '1997' AND patient.diagnosis = 'BEHCET'
SELECT patient.id FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.gpt > 30 AND laboratory.alp < 4 AND laboratory.`date` BETWEEN '1987-07-06' AND '1996-01-31'
SELECT id FROM patient WHERE admission = '+' AND sex = 'F' AND strftime('%Y', birthday) = '1964'
SELECT cast(sum(CASE WHEN `acl igm` > (SELECT avg(`acl igm`) * 1.2 FROM examination WHERE thrombosis = 2 AND `ana pattern` = 'S') THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM examination WHERE thrombosis = 2 AND `ana pattern` = 'S'
SELECT cast(sum(CASE WHEN `u-pro` > 0 AND `u-pro` < 30 AND ua <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM laboratory
SELECT cast(sum(CASE WHEN patient.diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'M' AND strftime('%Y', patient.`first date`) = '1981'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE substr(laboratory.date, 1, 7) = '1991-10' AND laboratory.`t-bil` < 2 AND patient.admission = '-'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND patient.birthday BETWEEN '1980-01-01' AND '1989-12-31' AND examination.`ana pattern` != 'P'
SELECT DISTINCT patient.sex FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'PSS' AND laboratory.crp > 2 AND laboratory.cre = 1 AND laboratory.ldh = 123
SELECT avg(laboratory.alb) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND laboratory.plt > 400 AND patient.diagnosis = 'SLE'
SELECT symptoms FROM examination WHERE diagnosis = 'SLE' GROUP BY symptoms ORDER BY count(*) DESC LIMIT 1;
SELECT `description`, diagnosis FROM patient WHERE id = 48473
SELECT count(id) FROM patient WHERE sex = 'F' AND diagnosis = 'APS'
SELECT count(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', laboratory.`date`) = '1997' AND laboratory.tp < 6 OR laboratory.tp > 8.5
SELECT cast(sum(CASE WHEN patient.diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / count(examination.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.symptoms = 'thrombocytopenia'
SELECT cast(sum(CASE WHEN patient.sex = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(patient.sex) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.birthday) = '1980' AND patient.diagnosis = 'RA'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'M' AND examination.`examination date` BETWEEN '1995-01-01' AND '1997-12-31' AND patient.admission = '-' AND patient.diagnosis = 'BEHCET'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND laboratory.wbc < 3.5;
sql placeholder
SELECT CASE WHEN laboratory.ua > 8.0 OR (laboratory.ua > 6.5 AND patient.sex = 'F') THEN 'Normal' ELSE 'Abnormal' END AS RESULT FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.id = 57266
SELECT laboratory.`date` FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.id = 48473 AND laboratory.got >= 60
SELECT patient.sex, patient.birthday, laboratory.date FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', laboratory.date) = '1994' AND laboratory.got < 60
SELECT DISTINCT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.gpt > 60
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.gpt > 60
SELECT avg(laboratory.ldh) FROM laboratory laboratory WHERE laboratory.ldh < 500;
SELECT patient.id, strftime('%Y', 'now') - strftime('%Y', birthday) AS age FROM laboratory laboratory JOIN patient patient ON laboratory.id = patient.id WHERE laboratory.ldh BETWEEN 600 AND 800;
SELECT patient.admission FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.alp < 300
SELECT p.id, CASE WHEN l.alp < 300 THEN 'Normal' ELSE 'Abnormal' END AS status FROM patient p LEFT JOIN laboratory l ON p.id = l.id WHERE p.birthday = '1982-04-01';
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tp < 6.0
SELECT abs(laboratory.tp - 8.5) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND laboratory.tp > 8.5
SELECT patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND (laboratory.alb > 5.5 OR laboratory.alb < 3.5) ORDER BY patient.birthday DESC
sql placeholder
SELECT cast(sum(CASE WHEN patient.sex = 'F' AND laboratory.ua > 8.0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id
SELECT avg(laboratory.ua) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ua < 8.0 OR (laboratory.ua < 6.5 AND patient.sex = 'F')
SELECT DISTINCT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.un = 29
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.un < 30 AND patient.diagnosis = 'RA'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.cre >= 1.5;
SELECT CASE WHEN sum(CASE WHEN patient.sex = 'M' THEN 1 ELSE 0 END) > sum(CASE WHEN patient.sex = 'F' THEN 1 ELSE 0 END) THEN 'True' ELSE 'False' END AS answer FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cre >= 1.5
SELECT patient.id, patient.sex, patient.birthday FROM laboratory INNER JOIN patient ON laboratory.id = patient.id ORDER BY laboratory.`t-bil` DESC LIMIT 1
SELECT patient.sex, GROUP_CONCAT(DISTINCT laboratory.`t-bil`) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` >= 2.0 GROUP BY patient.sex
SELECT patient.id, laboratory.`t-cho` FROM laboratory INNER JOIN patient ON laboratory.id = patient.id ORDER BY laboratory.`t-cho` DESC LIMIT 1
sql placeholder
SELECT DISTINCT patient.id, patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg > 300
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg >= 200 AND strftime('%Y', 'now') - strftime('%Y', patient.birthday) > 50
SELECT DISTINCT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cpk < 250 AND patient.admission = '-'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.cpk > 250 AND strftime('%Y', patient.birthday) BETWEEN '1936' AND '1956';
SELECT patient.id, patient.sex, (strftime('%Y', 'now') - strftime('%Y', birthday)) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu > 180 AND laboratory.`t-cho` < 250
SELECT patient.id, laboratory.glu FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE strftime('%Y', patient.description) = '1991' AND laboratory.glu < 180
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE (laboratory.wbc <= 3.5 OR laboratory.wbc >= 9.0) GROUP BY patient.id, patient.sex, patient.birthday ORDER BY patient.birthday ASC
SELECT patient.diagnosis, (strftime('%Y', 'now') - strftime('%Y', patient.birthday)) AS age FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE cast(laboratory.rbc AS REAL) < 3.5
SELECT patient.admission FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', patient.birthday) >= 50 AND (laboratory.rbc <= 3.5 OR laboratory.rbc >= 6.0)
SELECT DISTINCT patient.id, patient.sex FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.admission = '-' AND laboratory.hgb < 10
SELECT patient.id, patient.sex FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE' AND laboratory.hgb BETWEEN 10 AND 17 ORDER BY patient.birthday LIMIT 1
SELECT patient.id, (strftime('%Y', 'now') - strftime('%Y', patient.birthday)) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.hct > 52 GROUP BY patient.id HAVING count(laboratory.id) > 2
SELECT avg(hct) FROM laboratory WHERE Date LIKE '1991%' AND hct < 29
SELECT (SELECT count(*) FROM laboratory WHERE plt < 100) - (SELECT count(*) FROM laboratory WHERE plt > 400) AS diff FROM laboratory LIMIT 1;
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', laboratory.`date`) = '1984' AND laboratory.plt BETWEEN 100 AND 400 AND strftime('%Y', patient.birthday) - strftime('%Y', patient.birthday) < 50
SELECT cast(sum(CASE WHEN patient.sex = 'F' AND laboratory.pt >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.pt) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id
SELECT DISTINCT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.`first date`) > '1992' AND laboratory.pt < 14
SELECT count(*) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.aptt < 45 AND examination.`examination date` > '1997-01-01'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.id IN (SELECT id FROM patient WHERE aptt > 45) AND examination.thrombosis = 0;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.wbc BETWEEN 3.5 AND 8.9 AND (laboratory.fg <= 150 OR laboratory.fg >= 450);
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.birthday > '1980-01-01' AND laboratory.fg NOT BETWEEN 150 AND 450;
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(laboratory.`u-pro` AS INTEGER) > 30
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.`u-pro` BETWEEN 0 AND 30 AND examination.diagnosis = 'SLE'
SELECT count(DISTINCT patient.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.igg >= 2000
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE patient.id IN (SELECT patient.id FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.igg > 900 AND laboratory.igg < 2000) AND examination.symptoms IS NOT NULL;
SELECT patient.diagnosis FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.iga BETWEEN 80 AND 500 ORDER BY laboratory.iga DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE strftime('%Y', patient.`first date`) >= '1990' AND examination.`acl iga` IS NOT NULL AND examination.`acl iga` > 80 AND examination.`acl iga` < 500;
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`acl igm` > 40 OR examination.`acl igm` < 400 GROUP BY patient.diagnosis ORDER BY count(patient.diagnosis) DESC LIMIT 1
SELECT count(*) FROM patient WHERE id IN (SELECT id FROM laboratory WHERE crp = '+') AND description IS NULL
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(strftime('%Y', date) AS INT) - cast(strftime('%Y', patient.birthday) AS INT) < 70 AND laboratory.cre >= 1.5
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ra IN ('-', '+') AND examination.kct = '+'
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) >= '1985' AND laboratory.ra IN ('-', '+')
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast((strftime('%Y', 'now') - strftime('%Y', patient.birthday)) AS INTEGER) > 60 AND cast(laboratory.rf AS REAL) < 20
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rf < '20' AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.c3 > 35 AND examination.`ana pattern` = 'P'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.hct NOT BETWEEN 29 AND 52 ORDER BY examination.`acl iga` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'APS' AND laboratory.c4 > 10;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rnp IN ('-', '+-') AND patient.admission = '+'
SELECT birthday FROM patient WHERE id IN (SELECT id FROM laboratory WHERE rnp != '-');
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.sm IN ('-', '+-') AND examination.thrombosis = 0
SELECT id FROM patient WHERE id IN (SELECT id FROM laboratory WHERE sm NOT IN ('negative', '0')) ORDER BY birthday LIMIT 3;
SELECT DISTINCT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.sc170 IN ('negative', '0') AND examination.`examination date` > '1997-01-01'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.sc170 IN ('negative', '0') AND patient.sex = 'F' AND (examination.symptoms IS NULL OR examination.symptoms = '')
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ssa IN ('-', '+-') AND strftime('%Y', patient.`first date`) < '2000'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ssa NOT IN ('negative', '0') ORDER BY patient.`first date` LIMIT 1
SELECT count(DISTINCT patient.id) FROM laboratory laboratory JOIN patient patient ON laboratory.id = patient.id JOIN examination examination ON patient.id = examination.id WHERE laboratory.ssb IN ('-', '+-') AND patient.diagnosis = 'SLE';
sql placeholder
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.centromea IN ('-', '+') AND laboratory.ssb IN ('-', '+') AND patient.sex = 'M'
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.dna >= 8
SELECT count(DISTINCT patient.id) FROM patient patient LEFT JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.dna < 8 AND patient.description IS NULL;
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.admission = '+' AND examination.`acl igg` BETWEEN 900 AND 2000
SELECT cast(sum(CASE WHEN laboratory.got >= 60 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.got < 60;
SELECT patient.`first date` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.got >= 60 ORDER BY patient.birthday LIMIT 1
SELECT patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.gpt < 60 ORDER BY laboratory.gpt DESC LIMIT 3
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.got < 60 AND patient.sex = 'M'
SELECT min(`first date`) FROM patient WHERE id = (SELECT id FROM laboratory WHERE ldh = (SELECT max(ldh) FROM laboratory WHERE ldh < 500))
SELECT patient.`first date` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ldh >= 500 ORDER BY patient.`first date` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.alp >= 300;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.admission = '-' AND laboratory.alp < 300
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(laboratory.tp AS REAL) < 6
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SJS' AND laboratory.tp BETWEEN 6.0 AND 8.5
SELECT e.`examination date` FROM laboratory l JOIN examination e ON l.id = e.id WHERE l.alb > 3.5 AND l.alb < 5.5;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.alb BETWEEN 3.5 AND 5.5 AND laboratory.tp BETWEEN 6.0 AND 8.5
SELECT examination.`acl igg`, examination.`acl igm`, examination.`acl iga` FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND laboratory.ua > 6.50 ORDER BY laboratory.ua DESC LIMIT 1
SELECT max(examination.ana) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cre < 1.5
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.cre < 1.5 ORDER BY examination.`acl iga` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` >= 2.0 AND examination.`ana pattern` LIKE '%P%'
SELECT examination.ana FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` < 2.0 ORDER BY laboratory.`t-bil` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id JOIN examination examination ON patient.id = examination.id WHERE laboratory.`t-cho` > 250 AND examination.kct = '-';
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-cho` < 250 AND examination.`ana pattern` = 'P'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.id IN ( SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg < 200 ) AND examination.symptoms IS NOT NULL
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg < 200 ORDER BY laboratory.tg DESC LIMIT 1
SELECT DISTINCT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.thrombosis = 0 AND laboratory.cpk < 250
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.kct = '+' OR examination.rvvt = '+' OR examination.lac = '+'
SELECT patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu > 180 ORDER BY patient.birthday LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0
SELECT p.id FROM patient p JOIN laboratory l ON p.id = l.id WHERE p.admission = '-' AND (l.rbc > 3.5 OR l.rbc < 6.0);
sql placeholder
SELECT laboratory.plt, patient.diagnosis FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.diagnosis = 'MCTD' AND (laboratory.plt > 100 AND laboratory.plt < 400)
SELECT avg(laboratory.pt) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.sex = 'M' AND laboratory.pt < 14
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.thrombosis = 2 AND laboratory.pt < 14
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders'
SELECT count(member.member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering'
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department'
SELECT count(DISTINCT attendance.link_to_member) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT member.phone FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT count(DISTINCT member.member_id) FROM member member JOIN attendance attendance ON member.member_id = attendance.link_to_member JOIN event event ON attendance.link_to_event = event.event_id WHERE member.t_shirt_size = 'Medium' AND event.event_name = 'Women''s Soccer';
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_name ORDER BY count(attendance.link_to_event) DESC LIMIT 1
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT event.event_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean'
SELECT count(attendance.link_to_event) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE strftime('%Y', event.event_date) = '2019' AND member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND event.type = 'Student_Club'
SELECT count(*) FROM (SELECT event.event_id FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY attendance.link_to_event HAVING count(attendance.link_to_member) > 10);
SELECT event.event_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE attendance.link_to_member NOT IN ( SELECT income.link_to_member FROM income ) GROUP BY attendance.link_to_event HAVING count(attendance.link_to_member) > 20
SELECT cast(count(attendance.link_to_member) AS REAL) / count(DISTINCT event.event_name) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE strftime('%Y', event.event_date) = '2020' AND event.type = 'Meeting'
SELECT expense_description FROM expense WHERE cost = (SELECT max(cost) FROM expense);
SELECT count(DISTINCT member.member_id) FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';
SELECT member.first_name, member.last_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Laugh Out Loud'
SELECT last_name FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE major_name = 'Law and Constitutional Studies');
SELECT zip_code.county FROM member INNER JOIN zip_code ON zip_code.zip_code = member.zip WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'
SELECT sum(budget.spent) FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id INNER JOIN attendance ON EVENT.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE EVENT.event_name = 'September Meeting' AND budget.category = 'Food'
SELECT zip_code.city, zip_code.state FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President';
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois'
SELECT sum(budget.spent) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'September Meeting' AND budget.category = 'Advertisement'
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Pierce' AND last_name = 'Pierce' AND first_name = 'Guido' AND last_name = 'Guido');
SELECT sum(budget.amount) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'October Speaker'
SELECT e.approved FROM expense e JOIN attendance a ON e.link_to_member = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.expense_date = '2019-10-08' AND e.event_name = 'October Meeting';
SELECT sum(e.cost) / 12 FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen';
SELECT sum(CASE WHEN strftime('%Y', event.event_date) = '2019' THEN budget.spent ELSE 0 END) - sum(CASE WHEN strftime('%Y', event.event_date) = '2020' THEN budget.spent ELSE 0 END) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event
SELECT LOCATION FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_description = 'Posters' AND expense_date = '2019-09-04';
SELECT budget.remaining FROM budget budget WHERE budget.category = 'Food' AND budget.amount = (SELECT max(budget.amount) FROM budget budget WHERE budget.category = 'Food');
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising';
SELECT count(major_id) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT zip_code.county FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher';
SELECT sum(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'November Meeting'
SELECT sum(budget.amount) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker'
SELECT budget.event_status FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_date = '2019-08-20' AND expense.expense_description = 'Post Cards, Posters'
SELECT major.major_name FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason';
SELECT count(member.member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT TYPE FROM zip_code WHERE zip_code IN (SELECT zip FROM member WHERE first_name = 'Christof' AND last_name = 'Nielson');
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT zip_code.state FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';
SELECT major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President'
SELECT income.date_received FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues'
SELECT member.first_name, member.last_name FROM income income JOIN member member ON income.link_to_member = member.member_id WHERE income.source = 'Dues' ORDER BY income.date_received ASC LIMIT 1;
SELECT cast(sum(CASE WHEN event.event_name = 'Yearly Kickoff' THEN budget.amount ELSE 0 END) AS REAL) / sum(CASE WHEN event.event_name = 'October Meeting' THEN budget.amount ELSE 0 END) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Advertisement'
SELECT cast(sum(CASE WHEN budget.category = 'Parking' THEN budget.amount ELSE 0 END) AS REAL) * 100 / sum(budget.amount) FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'November Speaker'
SELECT sum(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Pizza'
SELECT count(city) FROM zip_code WHERE state = 'Virginia' AND county = 'Orange County'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT zip_code.city, zip_code.county, zip_code.state FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Amy' AND member.last_name = 'Firth';
SELECT expense.expense_description FROM budget budget JOIN expense expense ON budget.budget_id = expense.link_to_budget WHERE budget.remaining = (SELECT min(remaining) FROM budget);
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'October Meeting'
SELECT college FROM (SELECT college, count(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college) WHERE member_count = (SELECT max(member_count) FROM (SELECT count(*) AS member_count FROM member JOIN major ON member.link_to_major = major.major_id GROUP BY college))
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360'
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE amount = (SELECT max(amount) FROM budget));
SELECT expense.expense_description FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.position = 'Vice President'
SELECT count(attendance.link_to_member) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Women''s Soccer'
SELECT income.date_received FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Casey' AND member.last_name = 'Mason'
SELECT count(DISTINCT member.zip) FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';
SELECT count(DISTINCT attendance.link_to_event) FROM member member JOIN attendance attendance ON member.member_id = attendance.link_to_member WHERE member.phone = '954-555-6240';
SELECT m.first_name, m.last_name FROM member m JOIN major mj ON m.link_to_major = mj.major_id WHERE mj.department = 'School of Applied Sciences, Technology and Education';
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.status = 'Closed' ORDER BY budget.spent / budget.amount DESC LIMIT 1
SELECT count(*) FROM member WHERE POSITION = 'President'
SELECT spent FROM budget ORDER BY spent DESC LIMIT 1
SELECT count(event_id) FROM event WHERE strftime('%Y', event_date) = '2020' AND TYPE = 'Meeting'
SELECT sum(budget.spent) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member GROUP BY member.member_id HAVING count(attendance.link_to_event) > 7
SELECT member.first_name, member.last_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN major ON member.link_to_major = major.major_id WHERE event.event_name = 'Community Theater' AND major.major_name = 'Interior Design'
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina'
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'
SELECT member.first_name, member.last_name FROM income income JOIN member member ON income.link_to_member = member.member_id WHERE income.amount > 40;
SELECT sum(expense.cost) FROM event INNER JOIN expense ON event.event_id = expense.link_to_budget WHERE event.event_name = 'Yearly Kickoff'
SELECT member.first_name, member.last_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN member ON member.member_id = budget.link_to_event WHERE event.event_name = 'Yearly Kickoff'
SELECT m.first_name, m.last_name, i.source FROM member m JOIN income i ON m.member_id = i.link_to_member WHERE i.amount = (SELECT max(amount) FROM income);
SELECT event.event_name FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id ORDER BY expense.cost LIMIT 1
SELECT cast(sum(CASE WHEN event.event_name = 'Yearly Kickoff' THEN expense.cost ELSE 0 END) AS REAL) * 100 / sum(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id
SELECT cast(sum(CASE WHEN major.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN major.major_name = 'Physics' THEN 1 ELSE 0 END) FROM member INNER JOIN major ON member.link_to_major = major.major_id
SELECT source FROM income WHERE date_received LIKE '2019-09%' GROUP BY source ORDER BY sum(amount) DESC LIMIT 1
SELECT member.first_name, member.last_name, member.email FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Secretary'
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching'
SELECT count(DISTINCT attendance.link_to_member) FROM attendance INNER JOIN EVENT ON attendance.link_to_event = EVENT.event_id WHERE strftime('%Y', EVENT.event_date) = '2019' AND EVENT.event_name = 'Community Theater'
SELECT count(attendance.link_to_event), member.link_to_major FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi'
SELECT avg(budget.spent) FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE budget.category = 'Food' AND budget.event_status = 'Closed'
SELECT event.event_name FROM budget budget JOIN event event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' AND budget.spent = (SELECT max(spent) FROM budget WHERE category = 'Advertisement');
SELECT CASE WHEN EXISTS (SELECT 1 FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer') THEN 'YES' ELSE 'NO' END AS answer;
SELECT cast(sum(CASE WHEN TYPE = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / count(event_id) FROM EVENT WHERE strftime('%Y', event_date) = '2019'
SELECT expense.cost FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM member GROUP BY t_shirt_size));
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining ASC LIMIT 1
SELECT expense.expense_description, sum(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.expense_description
SELECT sum(budget.amount), budget.category FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'April Speaker' GROUP BY budget.category ORDER BY sum(budget.amount) ASC
SELECT max(amount) FROM budget WHERE category = 'Food'
SELECT budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' ORDER BY budget.amount DESC LIMIT 3
SELECT sum(cost) FROM expense WHERE expense_description = 'Parking' AND cost IS NOT NULL;
SELECT sum(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT member.first_name, member.last_name, sum(expense.cost) FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY member.first_name, member.last_name
SELECT DISTINCT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large'
SELECT zip FROM member WHERE member_id IN (SELECT link_to_member FROM expense WHERE cost < 50);
SELECT major.major_name FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen';
SELECT DISTINCT member.position FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business'
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT event.type FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 30
SELECT DISTINCT budget.category FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.location = 'MU 215'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_date = '2020-03-24T12:00:00'
SELECT major.major_name FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President';
SELECT cast(sum(CASE WHEN major.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Member'
SELECT DISTINCT budget.category FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.location = 'MU 215'
SELECT sum(CASE WHEN amount = 50 THEN 1 ELSE 0 END) FROM income
SELECT count(*) FROM member WHERE t_shirt_size = 'X-Large' AND POSITION = 'Member'
SELECT count(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences'
SELECT member.last_name, major.department, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0
SELECT zip_code.city, zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Electrical and Computer Engineering Department' AND member.position = 'Member'
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.position = 'Vice President' AND event.location = '900 E. Washington St.' AND event.type = 'Social'
SELECT member.last_name, member.position FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_date = '2019-09-10' AND expense.expense_description = 'Pizza'
SELECT member.last_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member'
SELECT cast(sum(CASE WHEN income.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / count(income.amount) FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.t_shirt_size = 'Medium'
SELECT DISTINCT state FROM zip_code WHERE TYPE = 'PO Box'
SELECT zip_code.zip_code FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE zip_code.city = 'San Juan' AND zip_code.state = 'Puerto Rico' AND zip_code.type = 'PO Box'
SELECT event_name FROM EVENT WHERE event_date BETWEEN '2019-03-15' AND '2020-03-20' AND status = 'Closed' AND TYPE = 'Game';
SELECT DISTINCT attendance.link_to_event FROM expense INNER JOIN attendance ON expense.link_to_member = attendance.link_to_member WHERE expense.cost > 50
SELECT DISTINCT attendance.link_to_member, attendance.link_to_event FROM expense INNER JOIN attendance ON expense.link_to_member = attendance.link_to_member WHERE expense.approved = 'true' AND expense.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO'
SELECT member.phone FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.college = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business';
SELECT member.email FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND expense.cost > 20
SELECT count(*) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Education & Human Services' AND major.major_name = 'Education';
SELECT cast(sum(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(event.event_id) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event
SELECT event_id, LOCATION, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';
SELECT expense_description FROM expense WHERE cast(cost AS REAL) > ( SELECT avg(cast(cost AS REAL)) FROM expense )
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT cast(count(CASE WHEN TYPE = 'PO Box' THEN zip_code ELSE NULL END) AS REAL) * 100 / count(zip_code) FROM zip_code
SELECT event_name, LOCATION FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE remaining > 0);
SELECT event.event_name, event.event_date FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.cost > 50 AND expense.cost < 100 AND expense.expense_description = 'Pizza'
SELECT member.first_name, member.last_name, major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > 100
SELECT zip_code.city, zip_code.county FROM income INNER JOIN member ON income.link_to_member = member.member_id INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE income.amount > 40
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.first_name, member.last_name HAVING count(expense.expense_id) > 1 ORDER BY sum(expense.cost) DESC LIMIT 1
SELECT avg(expense.cost) FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.position != 'Member'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN expense ON budget.budget_id = expense.link_to_budget WHERE budget.category = 'Parking' GROUP BY event.event_name HAVING sum(expense.cost) < ( SELECT sum(cost) / count(event_id) FROM budget WHERE category = 'Parking' )
SELECT cast(sum(expense.cost) AS REAL) * 100 / count(event.event_id) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.type = 'Meeting'
SELECT budget.budget_id FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Water, chips, cookies' ORDER BY expense.cost DESC LIMIT 1
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY sum(expense.cost) DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > ( SELECT avg(cost) FROM expense )
SELECT (count(*) filter (WHERE zip_code.state = 'New Jersey') * 100.0 / count(*)) - (count(*) filter (WHERE zip_code.state = 'Vermont') * 100.0 / count(*)) AS percentage_difference FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE member.position = 'Member';
SELECT major.major_name, major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, expense.cost FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT member.last_name, member.phone FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';
SELECT budget.category, budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received LIKE '2019-09-09%'
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT member.first_name, member.last_name, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary'
SELECT sum(budget.spent), event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Speaker Gifts'
SELECT zip_code.city FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';
SELECT m.first_name || ' ' || m.last_name AS full_name, m.position FROM member m JOIN zip_code z ON m.zip = z.zip_code WHERE z.city = 'Lincolnton' AND z.state = 'North Carolina' AND m.zip = 28092;
SELECT count(*) FROM gasstations WHERE country = 'CZE' AND segment = 'Premium';
SELECT cast(count(CASE WHEN currency = 'EUR' THEN customerid ELSE NULL END) AS REAL) / count(CASE WHEN currency = 'CZK' THEN customerid ELSE NULL END) FROM customers
SELECT customers.customerid FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE substr(YEARMONTH.date, 1, 4) = '2012' AND customers.segment = 'LAM' ORDER BY YEARMONTH.consumption LIMIT 1
SELECT sum(yearmonth.consumption) / 12 FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'SME' AND substr(yearmonth.date, 1, 4) = '2013'
SELECT customers.customerid FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'CZK' AND substr(yearmonth.date, 1, 4) = '2011' ORDER BY yearmonth.consumption DESC LIMIT 1
SELECT count(DISTINCT customers.customerid) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' AND substr(YEARMONTH.date, 1, 4) = '2012' AND YEARMONTH.consumption < 30000
SELECT sum(CASE WHEN customers.currency = 'CZK' THEN yearmonth.consumption ELSE 0 END) - sum(CASE WHEN customers.currency = 'EUR' THEN yearmonth.consumption ELSE 0 END) AS difference FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE substr(yearmonth.date, 1, 4) = '2012'
SELECT strftime('%Y', date) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR') GROUP BY strftime('%Y', date) ORDER BY count(strftime('%Y', date)) DESC LIMIT 1
SELECT segment FROM customers WHERE customerid IN (SELECT customerid FROM yearmonth GROUP BY customerid HAVING sum(consumption) ORDER BY sum(consumption) LIMIT 1);
sql placeholder
SELECT yearmonth.date FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'SME' AND substr(YEARMONTH.date, 1, 4) = '2013' ORDER BY YEARMONTH.consumption DESC LIMIT 1
SELECT sum(CASE WHEN customers.segment = 'SME' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN customers.segment = 'LAM' THEN YEARMONTH.consumption ELSE 0 END) AS smelam , sum(CASE WHEN customers.segment = 'LAM' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN customers.segment = 'KAM' THEN YEARMONTH.consumption ELSE 0 END) AS lamkam , sum(CASE WHEN customers.segment = 'KAM' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN customers.segment = 'SME' THEN YEARMONTH.consumption ELSE 0 END) AS kamsme FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE substr(YEARMONTH.date, 1, 4) = '2013'
SELECT customers.segment, sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2013' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2012' THEN YEARMONTH.consumption ELSE 0 END) AS percentageincrease FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.currency = 'EUR' GROUP BY customers.segment ORDER BY percentageincrease DESC LIMIT 1
SELECT sum(yearmonth.consumption) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE substr(yearmonth.date, 1, 4) = '2013' AND substr(yearmonth.date, 5, 2) BETWEEN '8' AND '11' AND customers.customerid = 6
SELECT (SELECT count(*) FROM gasstations WHERE country = 'CZE' AND segment = 'Discount') - (SELECT count(*) FROM gasstations WHERE country = 'SVK' AND segment = 'Discount') AS diff;
SELECT yearmonth.consumption - ( SELECT yearmonth.consumption FROM yearmonth INNER JOIN customers ON customers.customerid = yearmonth.customerid WHERE customers.customerid = 5 AND strftime('%Y%m', yearmonth.date) = '201304' ) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.customerid = 7 AND strftime('%Y%m', yearmonth.date) = '201304'
SELECT (SELECT count(*) FROM customers WHERE currency = 'CZK' AND segment = 'SME') - (SELECT count(*) FROM customers WHERE currency = 'EUR' AND segment = 'SME') AS difference;
SELECT customers.customerid FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'LAM' AND customers.currency = 'EUR' AND substr(YEARMONTH.date, 1, 7) = '201310' ORDER BY YEARMONTH.consumption DESC LIMIT 1
SELECT customers.customerid, sum(YEARMONTH.consumption) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY sum(YEARMONTH.consumption) DESC LIMIT 1
SELECT sum(yearmonth.consumption) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' AND YEARMONTH.date LIKE '201305%'
SELECT cast(sum(CASE WHEN YEARMONTH.consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / count(customers.customerid) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'LAM'
SELECT country, count(*) AS num FROM gasstations WHERE segment = 'Value for money' GROUP BY country
SELECT cast(sum(CASE WHEN currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / count(customerid) FROM customers WHERE segment = 'KAM'
SELECT cast(sum(CASE WHEN consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / count(customerid) FROM yearmonth WHERE date LIKE '201202%'
SELECT cast(sum(CASE WHEN segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / count(segment) FROM gasstations WHERE country = 'SVK'
SELECT customerid FROM yearmonth WHERE date = '201309' GROUP BY customerid ORDER BY sum(consumption) DESC LIMIT 1
SELECT customers.segment FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE substr(YEARMONTH.date, 1, 7) = '201309' GROUP BY customers.segment ORDER BY sum(YEARMONTH.consumption) LIMIT 1
SELECT customers.customerid FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'SME' AND substr(yearmonth.date, 1, 6) = '201206' ORDER BY yearmonth.consumption ASC LIMIT 1
SELECT max(consumption) FROM yearmonth WHERE substr(date, 1, 4) = '2012'
SELECT sum(yearmonth.consumption) / 12 FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.currency = 'EUR'
SELECT DISTINCT products.description FROM products INNER JOIN yearmonth ON products.productid = yearmonth.customerid WHERE substr(yearmonth.date, 1, 4) = '2013' AND substr(yearmonth.date, 5, 2) = '09'
SELECT DISTINCT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date LIKE '201306%');
SELECT DISTINCT gasstations.chainid FROM gasstations gasstations JOIN transactions_1k transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'EUR';
SELECT DISTINCT products.description FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN customers ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'EUR'
SELECT sum(t.price) / count(t.transactionid) FROM transactions_1k t JOIN yearmonth y ON t.date LIKE y.date || '-01'
SELECT count(DISTINCT customers.customerid) FROM customers customers JOIN YEARMONTH YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.currency = 'EUR' AND YEARMONTH.consumption > 1000;
SELECT DISTINCT products.description FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid INNER JOIN products ON transactions_1k.productid = products.productid WHERE gasstations.country = 'CZE'
SELECT DISTINCT t.time FROM transactions_1k t JOIN gasstations g ON t.gasstationid = g.gasstationid WHERE g.chainid = 11;
SELECT count(transactions_1k.transactionid) FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.price > 1000
SELECT count(DISTINCT transactions_1k.transactionid) FROM gasstations gasstations JOIN transactions_1k transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date > '2012-01-01';
SELECT avg(price) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE'
SELECT avg(price) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR');
SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' GROUP BY customerid ORDER BY sum(amount) DESC LIMIT 1;
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-25' ORDER BY transactions_1k.customerid LIMIT 1
SELECT DISTINCT customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE strftime('%Y-%m-%d', transactions_1k.date) = '2012-08-24' AND transactions_1k.time = '16:25:00'
SELECT customers.segment FROM customers INNER JOIN `yearmonth` ON customers.customerid = yearmonth.customerid INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-23' AND transactions_1k.time = '21:20:00'
SELECT sum(CASE WHEN transactions_1k.time < '13:00:00' AND customers.currency = 'CZK' THEN 1 ELSE 0 END) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-26'
SELECT segment FROM customers LIMIT 1
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.time = '12:42:00'
SELECT DISTINCT productid FROM transactions_1k WHERE date = '2012-08-23' AND TIME = '21:20:00'
SELECT YEARMONTH.date, YEARMONTH.consumption FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.price = 124.05 AND transactions_1k.date = '2012-08-24'
SELECT count(DISTINCT transactions_1k.transactionid) FROM gasstations gasstations JOIN transactions_1k transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date = '2012-08-26' AND transactions_1k.time BETWEEN '08:00:00' AND '09:00:00';
SELECT customers.currency FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE YEARMONTH.date = '201306' AND YEARMONTH.consumption = 214582.17
SELECT gasstations.country FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid INNER JOIN gasstations ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.cardid = 667467
SELECT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date = '2012-08-24' AND price = 548.4);
SELECT cast(sum(iif(customers.currency = 'EUR', 1, 0)) AS REAL) * 100 / count(customers.customerid) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-25'
SELECT ( SELECT consumption FROM yearmonth WHERE strftime('%Y', date) = '2013' AND customerid = ( SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' AND price = 634.8 ) ) - ( SELECT consumption FROM yearmonth WHERE strftime('%Y', date) = '2012' AND customerid = ( SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' AND price = 634.8 ) ) / ( SELECT consumption FROM yearmonth WHERE strftime('%Y', date) = '2012' AND customerid = ( SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' AND price = 634.8 ) )
SELECT gasstations.gasstationid FROM (SELECT gasstationid, sum(amount) AS totalrevenue FROM transactions_1k GROUP BY gasstationid) AS t1 JOIN gasstations ON t1.gasstationid = gasstations.gasstationid ORDER BY t1.totalrevenue DESC LIMIT 1;
SELECT (sum(CASE WHEN segment = 'Premium' THEN 1 ELSE 0 END) * 100.0 / count(*)) AS percentage FROM gasstations WHERE country = 'SVK';
SELECT sum(t.amount), (SELECT consumption FROM yearmonth WHERE customerid = 38508 AND date = '201201') FROM transactions_1k t WHERE t.customerid = 38508;
SELECT description FROM products WHERE productid IN (SELECT productid FROM transactions_1k GROUP BY productid ORDER BY sum(amount) DESC LIMIT 5);
SELECT customers.customerid, customers.currency, avg(transactions_1k.price) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid, customers.currency ORDER BY sum(transactions_1k.price) DESC LIMIT 1
SELECT gasstations.country FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE products.productid = 2 GROUP BY gasstations.country ORDER BY count(products.productid) DESC LIMIT 1
SELECT consumption FROM YEARMONTH WHERE customerid IN (SELECT customerid FROM transactions_1k WHERE productid = 5 AND price / amount > 29) AND date = '201208';
