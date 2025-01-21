SELECT max(frpm.`percent (%) eligible free (k-12)`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.county = 'Alameda'
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm WHERE `educational option type` = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` ASC LIMIT 3
SELECT zip FROM schools WHERE charter = 1 AND county = 'Fresno'
SELECT schools.mailstreet FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY frpm.`frpm count (k-12)` DESC LIMIT 1
SELECT phone FROM schools WHERE charter = 1 AND opendate > '2000-01-01' AND fundingtype = 'Directly funded';
SELECT count(schools.cdscode) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath > 400 AND schools.virtual = 'F'
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 > 500 AND schools.magnet = 1
SELECT phone FROM schools WHERE cdscode IN (SELECT cdscode FROM satscores WHERE numtsttakr = (SELECT max(numtsttakr) FROM satscores WHERE numtsttakr > 1500));
SELECT sum(satscores.numtsttakr) FROM satscores INNER JOIN frpm ON satscores.cds = frpm.cdscode WHERE frpm."FRPM count (k-12)" = ( SELECT max("FRPM count (k-12)") FROM frpm )
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 560 AND schools.charter = 1
SELECT frpm."FRPM count (ages 5-17)" FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrread DESC LIMIT 1
SELECT `school code` FROM frpm WHERE `enrollment (k-12)` + `enrollment (ages 5-17)` > 500
SELECT max(frpm.`free meal count (ages 5-17)`) FROM satscores satscores JOIN frpm frpm ON satscores.cds = frpm.cdscode WHERE satscores.numge1500 > 0 AND satscores.numtsttakr > 0 AND satscores.avgscrread > 0 AND satscores.avgscrmath > 0 AND frpm.`free meal count (ages 5-17)` > 0 AND frpm.`enrollment (ages 5-17)` > 0 AND satscores.numge1500 / satscores.numtsttakr > 0.3;
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3
SELECT schools.ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5
SELECT dname FROM satscores WHERE avgscrread IS NOT NULL GROUP BY dname ORDER BY avg(avgscrread) DESC LIMIT 1;
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.county = 'Alameda' AND satscores.numtsttakr < 100
SELECT frpm.`charter school number` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE satscores.avgscrwrite > 499
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.city = 'Fresno' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr <= 250
SELECT phone FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT count(frpm.`school name`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`low grade` = 9 AND frpm.`high grade` = 12 AND schools.county = 'Amador'
SELECT count(schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.city = 'Los Angeles' AND frpm."Free Meal Count (K-12)" > 500 AND frpm."Free Meal Count (K-12)" < 700
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY numtsttakr DESC LIMIT 1
SELECT DISTINCT schools.`school name`, schools.street FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE (frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)`) > 30
SELECT DISTINCT frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE frpm.`percent (%) eligible free (k-12)` > 0.1 AND satscores.numtsttakr >= 1500
SELECT schools.school, schools.fundingtype FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.county = 'Riverside' AND satscores.avgscrmath > 400
SELECT DISTINCT frpm.`school name`, schools.street, schools.city, schools.state, schools.zip FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.city = 'Monterey' AND frpm.`free meal count (ages 15-17)` > 800
SELECT satscores.avgscrwrite, satscores.sname, schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate > '1991-12-31' OR schools.closeddate < '2000-01-01'
SELECT schools.school, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' AND frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > ( SELECT avg(`enrollment (k-12)` - `enrollment (ages 5-17)`) FROM frpm )
SELECT schools.opendate FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.gsoffered = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (k-12)` LIMIT 5
SELECT frpm.`percent (%) eligible free (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY schools.ncesschool LIMIT 1, 2
SELECT frpm.`percent (%) eligible free (k-12)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = 66 ORDER BY frpm.`free meal count (k-12)` DESC LIMIT 5
SELECT DISTINCT schools.website, schools.school FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`free meal count (ages 5-17)` BETWEEN 1900 AND 2000
SELECT frpm.`free meal count (ages 5-17)` / frpm.`enrollment (ages 5-17)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.admfname1 = 'Kacey' AND schools.admfname2 = 'Gibson'
SELECT schools.admemail1 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school (y/n)` = 1 ORDER BY frpm.`enrollment (k-12)` ASC LIMIT 1
SELECT DISTINCT schools.admfname1, schools.admfname2, schools.admfname3, schools.admlname3 FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores)
SELECT schools.street, schools.city, schools.state, schools.zip FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr LIMIT 1
SELECT schools.website FROM schools INNER JOIN satscores ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr BETWEEN 2000 AND 3000 AND schools.county = 'Los Angeles'
SELECT avg(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.dname = 'Fresno Unified' ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT satscores.sname FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.virtual = 'F' ORDER BY satscores.avgscrread DESC LIMIT 5
SELECT edopsname FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT satscores.avgscrmath, schools.county FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrmath ASC LIMIT 1
SELECT satscores.avgscrwrite, schools.city FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT satscores.avgscrwrite, schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.admfname1 = 'Ricci' AND schools.admlname1 = 'Ulrich'
SELECT schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.doc = '31' AND schools.gsserved = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT cast(count(schools.doc) AS REAL) / 12 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alameda' AND schools.doc = '52' AND strftime('%Y', schools.opendate) = '1980'
SELECT cast(sum(CASE WHEN schools.doc = 54 THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN schools.doc = 52 THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Orange'
SELECT DISTINCT schools.county, schools.school, schools.closeddate FROM schools schools WHERE schools.statustype = 'Closed';
SELECT schools.mailstreet, schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrmath DESC LIMIT 1, 1
SELECT schools.mailstreet, schools.ncesschool FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.mailcity = 'Lakeport' AND satscores.avgscrread + satscores.avgscrmath + satscores.avgscrwrite >= 1500
SELECT count(schools.mailcity) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.mailcity = 'Fresno'
SELECT mailzip FROM schools WHERE admfname1 = 'Avetik'
SELECT (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Colusa') * 1.0 / (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Humboldt') AS ratio;
SELECT count(schools.mailstate) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailstate = 'CA' AND schools.city = 'San Joaquin' AND schools.statustype = 'Active'
SELECT schools.phone, schools.ext FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrwrite DESC LIMIT 332, 1
SELECT phone, ext, school FROM schools WHERE zip = '95203-3704'
SELECT website FROM schools WHERE (admfname1 = 'Mike' AND admfname2 = 'Larson') OR (admfname1 = 'Dante' AND admfname2 = 'Alvarez');
SELECT website FROM schools WHERE charter = 1 AND virtual = 'P' AND county = 'San Joaquin'
SELECT count(*) FROM schools WHERE charter = 1 AND city = 'Hickman' AND doc = '52';
SELECT count(schools.cdscode) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Los Angeles' AND schools.charter = 0 AND frpm.`percent (%) eligible free (k-12)` < 0.18
SELECT schools.admfname1, schools.admfname2, schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = '00D2' AND schools.charter = 1
SELECT count(schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailcity = 'Hickman' AND frpm.`charter school number` = '00D4'
SELECT cast(sum(CASE WHEN schools.fundingtype = 'Locally funded' THEN 1 ELSE 0 END) AS REAL) * 100 / count(schools.fundingtype) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Santa Clara'
SELECT count(*) FROM schools WHERE fundingtype = 'Directly funded' AND county = 'Stanislaus' AND opendate BETWEEN '2000-01-01' AND '2005-12-31';
SELECT sum(CASE WHEN strftime('%Y', schools.closeddate) = '1989' THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.city = 'San Francisco'
SELECT county FROM schools WHERE strftime('%Y', closeddate) BETWEEN '1980' AND '1989' AND soc = '11' GROUP BY county ORDER BY county DESC LIMIT 1
SELECT ncesdist FROM schools WHERE soc = '31' AND soctype = 'State Special Schools'
SELECT count(DISTINCT schools.district) FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alpine' AND (schools.statustype = 'Active' OR schools.statustype = 'Closed') AND schools.edopsname = 'District Community Day School';
SELECT frpm."District Code" FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.magnet = 0 AND schools.city = 'Fresno';
SELECT sum(frpm.`enrollment (ages 5-17)`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SSS' AND frpm.`academic year` = '2014-2015'
SELECT frpm.`free meal count (ages 5-17)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailstrabr = 'PO Box 1040' AND schools.edopsname = 'Youth Authority School'
SELECT frpm.`low grade` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.edopscode = 'SPECON' AND schools.ncesdist = '0613360' ORDER BY frpm.`low grade` ASC LIMIT 1
SELECT schools.eilname, frpm.`school name` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`county code` = 37 AND frpm.`nslp provision status` = 'Breakfast Provision 2'
SELECT schools.city FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`nslp provision status` = 'Lunch Provision 2' AND frpm.`low grade` = 9 AND frpm.`high grade` = 12 AND schools.county = 'Merced' AND schools.eilcode = 'HS'
SELECT schools.school, cast(frpm."FRPM Count (Ages 5-17)" AS REAL) * 100 / schools."Enrollment (Ages 5-17)" FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Los Angeles' AND schools."Grade Span Served" = 'Kindergarten to 9th grade'
SELECT gsserved FROM schools WHERE city = 'Adelanto' GROUP BY gsserved ORDER BY count(gsserved) DESC LIMIT 1;
SELECT county, count(*) FROM schools WHERE city IN ('San Diego', 'Santa Barbara') AND virtual = 'N' GROUP BY county ORDER BY county DESC LIMIT 1;
SELECT frpm."School Type", schools.school, schools.latitude FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.latitude = (SELECT max(latitude) FROM schools);
SELECT schools.city, frpm."Low Grade" FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.state = 'CA' ORDER BY schools.latitude ASC LIMIT 1
SELECT gsoffered FROM schools ORDER BY abs(longitude) DESC LIMIT 1
SELECT schools.city, count(schools.city) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.magnet = 1 AND frpm.`nslp provision status` = 'Multiple Provision Types' GROUP BY schools.city
SELECT admfname1, admfname1 FROM schools GROUP BY admfname1 ORDER BY count(admfname1) DESC LIMIT 2
SELECT frpm."District Code", frpm."Percent (%) Eligible Free (K-12)" FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.admfname1 = 'Alusine'
SELECT schools.admlname3, schools.district, schools.county, schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = 40
SELECT schools.admemail1 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = '62' AND schools.doc = '54' AND schools.opendate BETWEEN '2009-01-01' AND '2010-12-31'
SELECT schools.admemail1, schools.school FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr >= 1500 ORDER BY satscores.numtsttakr DESC LIMIT 1
SELECT count(DISTINCT account.account_id) FROM district district JOIN account account ON district.district_id = account.district_id WHERE district.a3 = 'east Bohemia' AND account.frequency = 'POPLATEK PO OBRATU';
SELECT count(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE a3 = 'Prague');
SELECT avg(a12), avg(a13) FROM district
SELECT count(district_id) FROM district WHERE district_id IN (SELECT district_id FROM client WHERE gender = 'F') AND a11 > 6000 AND a11 < 10000;
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id WHERE district.a3 = 'North Bohemia' AND client.gender = 'M' AND district.a11 > 8000;
SELECT account.account_id, ( SELECT district.a11 FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date LIMIT 1 ) - ( SELECT district.a11 FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date DESC LIMIT 1 ) AS gap FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date LIMIT 1
SELECT account.account_id FROM client INNER JOIN district ON client.district_id = district.district_id INNER JOIN account ON district.district_id = account.district_id WHERE client.birth_date < client.birth_date ORDER BY district.a11 DESC LIMIT 1
SELECT count(DISTINCT client.client_id) FROM client client JOIN disp disp ON client.client_id = disp.client_id JOIN account account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER';
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'DISPONENT'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND strftime('%Y', loan.date) = '1997' ORDER BY loan.amount LIMIT 1
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date LIKE '1993%' AND loan.duration > 12 ORDER BY loan.amount DESC LIMIT 1
SELECT count(DISTINCT client.client_id) FROM client client JOIN district district ON client.district_id = district.district_id JOIN account account ON client.district_id = account.district_id WHERE client.gender = 'F' AND client.birth_date < '1950-01-01' AND district.a2 = 'Sokolov';
SELECT account_id FROM account WHERE date = ( SELECT min(date) FROM account WHERE strftime('%Y', date) = '1995' )
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date < '1997-01-01' AND loan.amount > 3000
SELECT client.client_id FROM client INNER JOIN card ON client.client_id = card.disp_id WHERE strftime('%Y-%m-%d', card.issued) = '1994-03-03'
SELECT account.date FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.account_id = 840 AND strftime('%Y-%m-%d', trans.date) = '1998-10-14'
SELECT district_id FROM account WHERE date = '1994-08-25';
SELECT max(trans.amount) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN trans ON disp.account_id = trans.account_id WHERE strftime('%Y-%m-%d', card.issued) = '1996-10-21'
SELECT client.gender FROM client INNER JOIN district ON client.district_id = district.district_id ORDER BY district.a11 DESC LIMIT 1
SELECT trans.amount FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN client ON client.client_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id ORDER BY loan.amount DESC LIMIT 1
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id WHERE district.a2 = 'Jesenik' AND client.gender = 'F';
SELECT card.disp_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN trans ON disp.account_id = trans.account_id WHERE strftime('%Y-%m-%d', trans.date) = '1998-09-02' AND trans.amount = 5100
SELECT count(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a2 = 'Litomerice' AND strftime('%Y', account.date) = '1996'
SELECT district.a2 FROM district INNER JOIN client ON district.district_id = client.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29'
SELECT client.birth_date FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE loan.date = '1996-01-03' AND loan.amount = 98832
SELECT account.account_id FROM district INNER JOIN client ON district.district_id = client.district_id INNER JOIN account ON client.district_id = account.district_id WHERE district.a3 = 'Prague' ORDER BY client.client_id LIMIT 1
SELECT cast(sum(CASE WHEN client.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.a3 = 'south Bohemia'
SELECT cast((sum(trans.balance) - sum(trans.balance)) AS REAL) * 100 / sum(trans.balance) FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE account.date = '1993-03-22' AND account.date = '1998-12-27'
SELECT cast(sum(CASE WHEN status = 'A' THEN amount ELSE 0 END) AS REAL) * 100 / sum(amount) FROM loan
SELECT cast(sum(CASE WHEN loan.status = 'C' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.amount < 100000
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND strftime('%Y', account.date) = '1993'
SELECT account.account_id, account.frequency FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a3 = 'east Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31'
SELECT account.account_id, account.date FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a2 = 'Prachatice'
SELECT district.a2, district.a3 FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = '4990'
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN district ON account.district_id = district.district_id INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.amount > 300000
SELECT loan.loan_id, district.a3, district.a11 FROM district INNER JOIN loan ON district.district_id = loan.account_id WHERE loan.duration = 60
SELECT district.a3, (district.a13 - district.a12) * 100 / district.a12 FROM district INNER JOIN loan ON district.district_id = loan.account_id WHERE loan.status = 'D'
SELECT cast(sum(CASE WHEN district.a2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / count(account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE strftime('%Y', account.date) = '1993'
SELECT account_id FROM account WHERE frequency = 'POPLATEK MESICNE';
SELECT district.a2 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN client ON account.district_id = client.district_id WHERE client.gender = 'F' GROUP BY district.a2 ORDER BY count(client.gender) DESC LIMIT 9
SELECT district.a2, sum(trans.amount) FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE substr(trans.date, 1, 7) = '1996-01' AND trans.type = 'VYDAJ' GROUP BY district.a2 ORDER BY sum(trans.amount) DESC LIMIT 10
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id JOIN account account ON client.district_id = account.district_id WHERE district.a3 = 'south Bohemia' AND client.client_id NOT IN (SELECT client_id FROM card);
SELECT district.a3 FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.status = 'C' ORDER BY loan.duration DESC LIMIT 1
SELECT avg(loan.amount) FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M'
SELECT district_id, a2 FROM district WHERE a13 = ( SELECT max(a13) FROM district )
SELECT count(*) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY a16 DESC LIMIT 1);
SELECT count(account.account_id) FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND trans.balance < 0
SELECT count(DISTINCT loan.loan_id) FROM account account JOIN loan loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND account.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.amount >= 250000;
SELECT count(DISTINCT account.account_id) FROM account account JOIN loan loan ON account.account_id = loan.account_id WHERE account.district_id = 1 AND loan.status = 'C';
SELECT count(DISTINCT client.client_id) FROM district district JOIN client client ON district.district_id = client.district_id WHERE district.a15 = (SELECT max(a15) FROM district) AND client.gender = 'M';
SELECT count(DISTINCT card.card_id) FROM card card JOIN disp disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT count(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE a2 = 'Pisek');
SELECT account.district_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE strftime('%Y', trans.date) = '1997' AND trans.amount > 10000
SELECT account.account_id FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN order ON account.account_id = order.account_id WHERE district.a2 = 'Pisek' AND order.k_symbol = 'SIPO'
SELECT account.account_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN account ON disp.account_id = account.account_id WHERE card.type = 'gold'
SELECT avg(trans.amount) FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE strftime('%Y', trans.date) = '2021' AND trans.operation = 'VYBER KARTOU'
SELECT DISTINCT account.account_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE strftime('%Y', trans.date) = '1998' AND trans.operation = 'VYBER KARTOU' AND trans.amount < ( SELECT avg(amount) FROM trans WHERE strftime('%Y', date) = '1998' AND operation = 'VYBER KARTOU' )
SELECT client.client_id FROM client INNER JOIN card ON client.client_id = card.disp_id INNER JOIN loan ON card.disp_id = loan.account_id WHERE client.gender = 'F'
SELECT count(DISTINCT client.client_id) FROM client client JOIN district district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.a3 = 'south Bohemia';
SELECT account.account_id FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a2 = 'Tabor' AND account.frequency = 'ELIGIBLE'
SELECT DISTINCT account.frequency, district.a11 FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'OWNER' AND district.a11 > 8000 AND district.a11 < 9000
SELECT count(DISTINCT account.account_id) FROM district district JOIN account account ON district.district_id = account.district_id JOIN trans trans ON account.account_id = trans.account_id WHERE district.a3 = 'North Bohemia' AND trans.bank = 'AB';
SELECT district.a2 FROM district INNER JOIN account ON district.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE trans.type = 'VYDAJ'
SELECT avg(a15) FROM district WHERE district_id IN (SELECT district_id FROM account WHERE strftime('%Y', date) >= '1997') AND a15 > 4000;
SELECT count(DISTINCT card.card_id) FROM card card JOIN disp disp ON card.disp_id = disp.disp_id WHERE card.type = 'classic' AND disp.type = 'OWNER';
SELECT count(client.client_id) FROM district INNER JOIN client ON district.district_id = client.district_id WHERE district.a2 = 'Hl.m. Praha' AND client.gender = 'M'
SELECT cast(sum(CASE WHEN substr(card.issued, 1, 4) < '1998' THEN 1 ELSE 0 END) AS REAL) * 100 / count(card.card_id) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold'
SELECT client.client_id FROM client INNER JOIN loan ON client.client_id = loan.account_id ORDER BY loan.amount DESC LIMIT 1
SELECT a15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);
SELECT account.district_id FROM order INNER JOIN account ON order.account_id = account.account_id WHERE order.order_id = 33333
SELECT trans.trans_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN trans ON disp.account_id = trans.account_id WHERE client.client_id = 3356 AND trans.operation = 'VYBER'
SELECT count(DISTINCT account.account_id) FROM account account JOIN loan loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 13539
SELECT district.a3 FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.client_id = 3541
SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM loan WHERE status = 'A');
SELECT client.client_id FROM client INNER JOIN order ON client.client_id = order.account_id WHERE order.order_id = 32423
SELECT * FROM trans WHERE account_id IN (SELECT account_id FROM account WHERE district_id = 5);
SELECT count(*) FROM account WHERE district_id IN (SELECT district_id FROM district WHERE a2 = 'Jesenik');
SELECT client.client_id FROM client INNER JOIN card ON client.client_id = card.disp_id WHERE card.type = 'junior' AND strftime('%Y', card.issued) > '1996'
SELECT cast(sum(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.a11 > 10000
SELECT cast(sum(CASE WHEN strftime('%Y', loan.date) = '1997' THEN loan.amount ELSE 0 END) - sum(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END) AS REAL) * 100 / sum(CASE WHEN strftime('%Y', loan.date) = '1996' THEN loan.amount ELSE 0 END) FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M'
SELECT count(account_id) FROM trans WHERE substr(date, 1, 4) > '1995' AND operation = 'VYBER KARTOU'
SELECT sum(CASE WHEN a3 = 'east Bohemia' THEN a16 ELSE 0 END) - sum(CASE WHEN a3 = 'north Bohemia' THEN a16 ELSE 0 END) AS difference FROM district
SELECT count(CASE WHEN account.account_id = 1 THEN 1 END) AS owner, count(CASE WHEN account.account_id = 10 THEN 1 END) AS disponent FROM account INNER JOIN disp ON account.account_id = disp.account_id
SELECT account.frequency, sum(order.amount) FROM account INNER JOIN order ON account.account_id = order.account_id WHERE account.account_id = 3 GROUP BY account.frequency
SELECT birth_date FROM client WHERE client_id = 130
SELECT count(DISTINCT account.account_id) FROM account INNER JOIN disp ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'OWNER'
SELECT sum(order.amount), loan.status FROM client INNER JOIN loan ON client.client_id = loan.account_id INNER JOIN order ON loan.account_id = order.account_id WHERE client.client_id = 992
SELECT sum(trans.amount), client.gender FROM client INNER JOIN account ON client.district_id = account.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE client.client_id = 4 AND trans.account_id = 851
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9
SELECT sum(trans.amount) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE client.client_id = 617 AND strftime('%Y', trans.date) = '1998'
SELECT client.client_id FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.a3 = 'east Bohemia'
SELECT client.client_id FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'F' GROUP BY client.client_id ORDER BY sum(loan.amount) DESC LIMIT 3
SELECT count(DISTINCT client.client_id) FROM client client JOIN loan loan ON client.client_id = loan.client_id WHERE client.gender = 'M' AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND loan.amount > 4000 AND loan.k_symbol = 'SIPO';
SELECT count(DISTINCT account.account_id) FROM district district JOIN account account ON district.district_id = account.district_id WHERE district.a2 = 'Beroun' AND account.date > '1996-12-31';
SELECT count(DISTINCT client.client_id) FROM client client JOIN card card ON client.client_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior';
SELECT cast(sum(CASE WHEN client.gender = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(client.client_id) FROM client INNER JOIN account ON client.district_id = account.district_id WHERE client.district_id = ( SELECT district_id FROM district WHERE a3 = 'Prague' )
SELECT cast(sum(CASE WHEN client.gender = 'M' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM client INNER JOIN account ON client.district_id = account.district_id WHERE account.frequency = 'POPLATEK TYDNE'
SELECT count(DISTINCT client.client_id) FROM client client JOIN disp disp ON client.client_id = disp.client_id JOIN account account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER';
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount ASC LIMIT 1
SELECT account.account_id FROM client INNER JOIN district ON client.district_id = district.district_id INNER JOIN account ON district.district_id = account.district_id WHERE client.gender = 'F' ORDER BY client.birth_date ASC, district.a11 ASC LIMIT 1
SELECT count(client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.a3 = 'east Bohemia' AND strftime('%Y', client.birth_date) = '1920'
SELECT count(loan.account_id) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.duration = 24
SELECT avg(loan.amount) FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND loan.status = 'C'
SELECT client.client_id, account.district_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE disp.type = 'OWNER'
SELECT client.client_id, client.birth_date FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE card.type = 'gold' AND disp.type = 'OWNER'
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY count(bond_type) DESC LIMIT 1
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.element = 'cl';
SELECT cast(sum(CASE WHEN atom.element = 'o' THEN 1 ELSE 0 END) AS REAL) / count(*) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '-'
SELECT cast(sum(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+'
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.element = 'na';
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '+'
SELECT cast(sum(CASE WHEN atom.element = 'c' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom.atom_id) FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.bond_type = '='
SELECT count(*) FROM bond WHERE bond_type = '#';
SELECT count(atom_id) FROM atom WHERE element != 'br'
SELECT count(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR099' AND label = '+';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '='
SELECT label FROM (SELECT label, count(*) AS num FROM atom WHERE element = 'h' GROUP BY label) WHERE num = (SELECT max(num) FROM (SELECT count(*) AS num FROM atom WHERE element = 'h' GROUP BY label))
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'cl'
SELECT connected.atom_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'
SELECT connected.atom_id FROM molecule INNER JOIN connected ON molecule.molecule_id = connected.atom_id WHERE molecule.label = '-'
SELECT element FROM (SELECT element, count(*) AS num FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element) WHERE num = (SELECT min(num) FROM (SELECT count(*) AS num FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element))
SELECT bond.bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE (connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20') OR (connected.atom_id2 = 'TR004_8' AND connected.atom_id = 'TR004_20')
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn') OR label IS NULL;
SELECT count(DISTINCT connected.atom_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id JOIN bond bond ON connected.bond_id = bond.bond_id WHERE atom.element IN ('i', 's') AND bond.bond_type = '-';
SELECT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#'
SELECT connected.atom_id FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.molecule_id = 'TR181'
SELECT cast(sum(CASE WHEN atom.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / count(DISTINCT molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT cast(sum(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '+'
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element LIMIT 3
SELECT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR001' AND bond.bond_id = 'TR001_2_6'
SELECT (SELECT count(*) FROM molecule WHERE label = '+') - (SELECT count(*) FROM molecule WHERE label = '-') AS difference;
SELECT connected.atom_id, connected.atom_id2 FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR000_2_5'
SELECT bond_id FROM connected WHERE atom_id2 = 'TR000_2';
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ' ORDER BY molecule_id LIMIT 5);
SELECT cast(sum(CASE WHEN bond.bond_type = '=' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR008'
SELECT cast(sum(CASE WHEN label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule_id) FROM molecule
SELECT cast(sum(CASE WHEN element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / count(atom_id) FROM atom WHERE molecule_id = 'TR206'
SELECT bond.bond_type FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR000'
SELECT atom.element, molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR060'
SELECT bond.bond_type, molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR010' GROUP BY bond.bond_type ORDER BY count(bond.bond_type) DESC LIMIT 1
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-' ORDER BY molecule.molecule_id LIMIT 3
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR006' ORDER BY bond.bond_id LIMIT 2
SELECT count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE molecule.molecule_id = 'TR009' AND (connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12')
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'br';
SELECT bond.bond_type, connected.atom_id, connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.bond_id = 'TR001_6_9'
SELECT molecule.label, molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.atom_id = 'TR001_10'
SELECT count(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';
SELECT count(bond_id) FROM connected WHERE atom_id = 'TR000_19';
SELECT element FROM atom WHERE molecule_id = 'TR004';
SELECT count(DISTINCT molecule_id) FROM molecule WHERE label = '-';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE substr(atom.atom_id, 7, 2) BETWEEN '21' AND '25' AND molecule.label = '+'
SELECT bond.bond_id FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'p' AND atom.element = 'n'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM bond WHERE bond_type = ' = ' GROUP BY molecule_id)));
SELECT cast(count(connected.bond_id) AS REAL) / count(DISTINCT atom.atom_id) FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'i'
SELECT bond.bond_type, bond.bond_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_45'
SELECT DISTINCT element FROM atom WHERE atom_id NOT IN (SELECT atom_id FROM connected);
SELECT connected.atom_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE molecule.molecule_id = 'TR041' AND bond.bond_type = '#'
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR144_8_19');
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY count(bond.bond_id) DESC LIMIT 1
SELECT min(DISTINCT atom.element) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+';
SELECT connected.atom_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'pb'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#'
SELECT cast(count(connected.bond_id) AS REAL) * 100 / count(DISTINCT connected.atom_id) FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id GROUP BY connected.atom_id ORDER BY count(connected.atom_id) DESC LIMIT 1
SELECT cast(sum(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-'
SELECT count(*) FROM atom WHERE element IN ('c', 'h');
SELECT connected.atom_id2 FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 's'
SELECT DISTINCT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'sn' AND bond.bond_type IN ('=', '-')
SELECT count(DISTINCT atom.element) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '-';
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND (atom.element = 'p' OR atom.element = 'br');
SELECT bond.bond_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+'
SELECT DISTINCT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '-'
SELECT label FROM molecule WHERE molecule_id IN ('TR000', 'TR001', 'TR002')
SELECT molecule_id FROM molecule WHERE label = '-';
SELECT count(DISTINCT molecule_id) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT bond_type FROM bond WHERE molecule_id BETWEEN 'TR000' AND 'TR050'
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11'
SELECT count(bond.bond_id) FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'i'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca') GROUP BY label
SELECT CASE WHEN atom.element = 'cl' AND atom.element = 'c' THEN 'YES' ELSE 'NO' END FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE connected.bond_id = 'TR001_1_8'
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE bond.bond_type = '#' AND atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT DISTINCT atom.element FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR001';
SELECT DISTINCT molecule_id FROM bond WHERE bond_type = ' = '
SELECT connected.atom_id, connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_1_2'
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';
SELECT molecule.label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_10_11'
SELECT bond.bond_id, molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#'
SELECT DISTINCT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE substr(atom.atom_id, 7, 1) = '4' AND molecule.label = '+'
SELECT cast(sum(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) / count(atom.element), molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR006'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'ca')
SELECT bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.element = 'c' AND bond.bond_type = ' = '
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11'
SELECT cast(sum(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id
SELECT cast(sum(CASE WHEN bond.bond_type = ' = ' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR047'
SELECT label FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE atom_id = 'TR001_1')
SELECT label FROM molecule WHERE molecule_id = 'TR151'
SELECT DISTINCT atom.element FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR151';
SELECT count(DISTINCT molecule_id) FROM molecule WHERE label = '+';
SELECT atom_id FROM atom WHERE molecule_id BETWEEN 'TR010' AND 'TR050' AND element = 'c';
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+';
SELECT bond.bond_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+'
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR000_1_2' AND connected.atom_id = 'TR000_1'
SELECT atom.atom_id FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'h' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.label) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT label FROM molecule WHERE molecule_id = 'TR124'
SELECT atom.atom_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR186'
SELECT bond_type FROM bond WHERE bond_id = 'TR007_4_19'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_2_4'
SELECT count(DISTINCT bond.bond_id), molecule.label FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id = 'TR006' AND bond.bond_type = ' = ' GROUP BY molecule.label;
SELECT DISTINCT molecule.label, atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element IN ( 'cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca' )
SELECT bond.bond_id, connected.atom_id, connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-'
SELECT DISTINCT molecule.label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '#' AND atom.element IN ( 'cl', 'c', 'h', 'o', 's', 'n', 'p', 'na', 'br', 'f', 'i', 'sn', 'pb', 'te', 'ca' )
SELECT element FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_3')
SELECT count(DISTINCT bond.bond_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id JOIN bond bond ON connected.bond_id = bond.bond_id WHERE atom.element = 'cl';
SELECT connected.atom_id, count(bond.bond_type) FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR346' GROUP BY connected.atom_id
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' AND molecule.label = '+';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 's') AND bond.bond_type != ' = ';
SELECT molecule.label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_id = 'TR001_2_4'
SELECT count(DISTINCT atom_id) FROM atom WHERE molecule_id = 'TR001';
SELECT count(bond_id) FROM bond WHERE bond_type = '-'
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+'
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND molecule.label = '-'
SELECT cast(sum(CASE WHEN atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.label) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+'
SELECT molecule_id FROM bond WHERE bond_id = 'TR001_1_7'
SELECT count(DISTINCT atom.element) FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR001_3_4';
SELECT bond.bond_type FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR000_1' AND connected.atom_id2 = 'TR000_2'
SELECT molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id = 'TR000_2' AND connected.atom_id2 = 'TR000_4'
SELECT element FROM atom WHERE atom_id = 'TR000_1'
SELECT label FROM molecule WHERE molecule_id = 'TR000'
SELECT cast(sum(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / count(bond.bond_id) FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'n';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 's' AND bond.bond_type = ' = '
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' GROUP BY molecule.molecule_id HAVING count(atom.atom_id) > 5;
SELECT DISTINCT atom.element FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE bond.molecule_id = 'TR024' AND bond.bond_type = '='
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY count(atom.atom_id) DESC LIMIT 1
SELECT cast(sum(CASE WHEN molecule.label = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'h' AND bond.bond_type = '#'
SELECT count(DISTINCT molecule_id) FROM molecule WHERE label = '+';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.molecule_id BETWEEN 'TR004' AND 'TR010' AND bond.bond_type = '-';
SELECT count(DISTINCT atom.atom_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.molecule_id = 'TR008' AND atom.element = 'c';
SELECT DISTINCT atom.element FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '-' AND atom.atom_id = 'TR004_7'
SELECT count(DISTINCT molecule.molecule_id) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE atom.element = 'o' AND bond.bond_type = ' = ';
SELECT count(DISTINCT bond.bond_id) FROM bond bond JOIN molecule molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-';
SELECT atom.element, bond.bond_type FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE molecule.molecule_id = 'TR002'
SELECT connected.atom_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE molecule.molecule_id = 'TR012' AND atom.element = 'c' AND bond.bond_type = '='
SELECT atom.atom_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+' AND atom.element = 'o'
SELECT id FROM cards WHERE cardkingdomid IS NOT NULL AND cardkingdomfoilid IS NOT NULL;
SELECT id FROM cards WHERE bordercolor = 'borderless' AND cardkingdomid IS NULL AND cardkingdomfoilid IS NULL;
SELECT name FROM cards WHERE faceconvertedmanacost = ( SELECT max(faceconvertedmanacost) FROM cards )
SELECT name FROM cards WHERE edhrecrank < 100 AND frameversion = 2015;
SELECT cards.name FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic' AND legalities.status = 'Banned' AND legalities.format = 'gladiator'
SELECT DISTINCT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage'
SELECT c.id, c.artist FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.power = '*' OR c.power IS NULL AND l.format = 'commander' AND l.status = 'Legal';
SELECT cards.id, rulings.text, cards.hascontentwarning FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.artist = 'Stephen Daniele'
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Sublime Epiphany' AND cards.number = '74s'
SELECT cards.name, cards.artist, cards.ispromo FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid GROUP BY cards.name, cards.artist, cards.ispromo ORDER BY count(rulings.id) DESC LIMIT 1
SELECT foreign_data.language FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Annul' AND cards.number = '29'
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.isalternative = 1
SELECT cast(sum(CASE WHEN set_translations.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN set_translations ON cards.id = set_translations.id
SELECT sets.name, sets.totalsetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Italian'
SELECT count(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy'
SELECT count(id) FROM cards WHERE power = '*';
SELECT promotypes FROM cards WHERE name = 'Duress'
SELECT bordercolor FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT originaltype FROM cards WHERE name = 'Ancestor''s Chosen'
SELECT foreign_data.language FROM cards INNER JOIN sets ON cards.setcode = sets.code INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN foreign_data ON set_translations.language = foreign_data.language WHERE cards.name = 'Angel of Mercy'
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Restricted' AND cards.istextless = 0
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Condemn'
SELECT count(DISTINCT cards.id) FROM cards cards JOIN legalities legalities ON cards.uuid = legalities.uuid WHERE cards.isstarter = 1 AND legalities.status = 'Restricted';
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Cloudchaser Eagle'
SELECT TYPE FROM cards WHERE name = 'Benalish Knight'
SELECT legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Benalish Knight'
SELECT artist FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE LANGUAGE = 'Phyrexian');
SELECT cast(sum(CASE WHEN bordercolor = 'borderless' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isreprint = 1
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Russian' AND cards.bordercolor = 'borderless'
SELECT cast(sum(CASE WHEN foreign_data.language = 'French' THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.isstoryspotlight = 1
SELECT count(id) FROM cards WHERE toughness = 99
SELECT name FROM cards WHERE artist = 'Aaron Boyd'
SELECT count(id) FROM cards WHERE bordercolor = 'black' AND availability = 'mtgo'
SELECT id FROM cards WHERE convertedmanacost = 0
SELECT DISTINCT layout FROM cards WHERE keywords LIKE '%flying%'
SELECT count(id) FROM cards WHERE originaltype = 'Summon - Angel' AND subtypes NOT LIKE 'Angel'
SELECT c.id FROM cards c WHERE c.cardkingdomid IS NOT NULL AND c.cardkingdomfoilid IS NOT NULL;
SELECT id FROM cards WHERE dueldeck = 'a'
SELECT edhrecrank FROM cards WHERE frameversion = 2015
SELECT DISTINCT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified'
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.availability = 'paper'
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.bordercolor = 'white' AND legalities.status = 'Banned'
SELECT foreign_data.uuid, foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'legacy'
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Beacon of Immortality'
SELECT count(cards.id), legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameversion = 'future' AND legalities.status = 'Legal'
SELECT name, colors FROM cards WHERE setcode = 'OGW';
SELECT cards.name, set_translations.language FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.setcode = '10E' AND cards.convertedmanacost = 5
SELECT cards.name, rulings.date FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE cards.originaltype = 'Creature - Elf'
SELECT DISTINCT cards.colors, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 AND 20
SELECT foreign_data.language FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.originaltype = 'Artifact' AND cards.colors = 'B'
SELECT cards.name FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.rarity = 'uncommon' ORDER BY rulings.date ASC LIMIT 3
SELECT count(id) FROM cards WHERE artist = 'John Avon' AND (cardkingdomid IS NOT NULL OR cardkingdomfoilid IS NOT NULL);
SELECT count(id) FROM cards WHERE bordercolor = 'white' AND (cardkingdomid IS NOT NULL OR cardkingdomfoilid IS NOT NULL);
SELECT count(id) FROM cards WHERE artist = 'UDON' AND availability = 'mtgo' AND hand = -1
SELECT count(id) FROM cards WHERE frameversion = '1993' AND availability = 'paper' AND hascontentwarning = 1
SELECT manacost FROM cards WHERE availability = 'mtgo,paper' AND frameversion = '2003' AND bordercolor = 'black' AND layout = 'normal'
SELECT sum(manacost) FROM cards WHERE artist = 'Rob Alexander'
SELECT DISTINCT subtypes, supertypes FROM cards WHERE availability = 'arena'
SELECT setcode FROM set_translations WHERE LANGUAGE = 'Spanish';
SELECT cast(sum(CASE WHEN isonlineonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards WHERE frameeffects = 'legendary'
SELECT cast(sum(CASE WHEN isstoryspotlight = 1 AND istextless = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards
SELECT cast(sum(CASE WHEN foreign_data.language = 'Spanish' THEN 1 ELSE 0 END) AS REAL) * 100 / count(foreign_data.id), cards.name FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid GROUP BY cards.name
SELECT DISTINCT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.basesetsize = 309
SELECT count(set_translations.setcode) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brazil)'
SELECT cards.id FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.types = 'Creature' AND legalities.status = 'Legal'
SELECT DISTINCT foreign_data.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL
SELECT count(id) FROM cards WHERE power IS NULL OR power = '*' AND text LIKE '%triggered ability%'
SELECT count(DISTINCT cards.id) FROM cards cards JOIN rulings rulings ON cards.uuid = rulings.uuid JOIN legalities legalities ON cards.uuid = legalities.uuid WHERE rulings.text = 'This is a triggered mana ability.' AND legalities.format = 'premodern' AND cards.side IS NULL;
SELECT c.id FROM cards c JOIN legalities l ON c.uuid = l.uuid WHERE c.artist = 'Erica Yang' AND l.status = 'Legal' AND l.format = 'pauper' AND c.availability = 'paper';
SELECT artist FROM cards WHERE text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT foreign_data.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'French' AND cards.bordercolor = 'black' AND cards.artist = 'Matthew D. Wilson' AND cards.type = 'Creature' AND cards.layout = 'normal'
SELECT count(DISTINCT cards.id) FROM rulings rulings JOIN cards cards ON rulings.uuid = cards.uuid WHERE rulings.date = '2007-02-01' AND cards.rarity = 'rare';
SELECT DISTINCT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Ravnica' AND sets.basesetsize = 180
SELECT cast(sum(CASE WHEN cards.hascontentwarning = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'commander' AND legalities.status = 'Legal'
SELECT cast(sum(CASE WHEN power IS NULL OR power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards WHERE power IS NOT NULL
SELECT cast(sum(CASE WHEN set_translations.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.type = 'expansion'
SELECT availability FROM cards WHERE artist = 'Daren Bader'
SELECT count(id) FROM cards WHERE edhrecrank > 12000 AND bordercolor = 'borderless'
SELECT count(id) FROM cards WHERE isoversized = 1 AND isreprint = 1 AND ispromo = 1
SELECT name FROM cards WHERE power IS NULL OR power = '*' AND promotypes = 'arenaleague' ORDER BY name ASC LIMIT 3;
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.multiverseid = 149934
SELECT cardkingdomfoilid, cardkingdomid FROM cards ORDER BY cardkingdomfoilid LIMIT 3
SELECT cast(sum(CASE WHEN layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM cards WHERE istextless = 1
SELECT id FROM cards WHERE subtypes IN ('Angel', 'Wizard') GROUP BY id HAVING count(DISTINCT side) = 1;
SELECT name FROM sets WHERE mtgocode IS NULL OR mtgocode = '' ORDER BY name ASC LIMIT 3
SELECT DISTINCT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.mcmname = 'Archenemy' AND sets.code = 'ARC'
SELECT sets.name, set_translations.translation FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.id = 5
SELECT set_translations.language, sets.type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.id = 206
SELECT sets.id, sets.name FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN cards ON sets.code = cards.setcode WHERE set_translations.language = 'Italian' AND sets.block = 'Shadowmoor' ORDER BY sets.name LIMIT 2
SELECT sets.id FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN foreign_data ON set_translations.language = foreign_data.language WHERE sets.isforeignonly = 1 AND sets.isfoilonly = 1 AND foreign_data.language = 'Japanese'
SELECT name FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Russian') AND basesetsize = (SELECT max(basesetsize) FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE = 'Russian'))
SELECT cast(sum(CASE WHEN cards.isonlineonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified'
SELECT count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Japanese' AND (sets.mtgocode IS NULL OR sets.mtgocode = '')
SELECT id FROM cards WHERE bordercolor = 'black'
SELECT id FROM cards WHERE frameeffects = 'extendedart'
SELECT name FROM cards WHERE bordercolor = 'white' AND isfullart = 1
SELECT language FROM set_translations WHERE setcode = ( SELECT code FROM sets WHERE id = 174 )
SELECT name FROM sets WHERE code = 'ALL'
SELECT LANGUAGE FROM foreign_data WHERE name = 'A Pedra Fellwar'
SELECT code FROM sets WHERE releasedate = '2007-07-13';
SELECT basesetsize, code FROM sets WHERE block IN ('Masques', 'Mirage');
SELECT code FROM sets WHERE TYPE = 'expansion';
SELECT foreign_data.name, cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'boros'
SELECT foreign_data.language, cards.flavortext, cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'colorpie'
SELECT cast(sum(CASE WHEN cards.convertedmanacost = 10 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Abyssal Horror'
SELECT code FROM sets WHERE TYPE = 'expansion' OR TYPE = 'commander';
SELECT foreign_data.name, cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'abzan'
SELECT foreign_data.language, cards.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.watermark = 'azorius'
SELECT count(id) FROM cards WHERE artist = 'Aaron Miller' AND (cardkingdomid IS NOT NULL OR cardkingdomfoilid IS NOT NULL);
SELECT count(id) FROM cards WHERE hand = '3' AND availability LIKE '%paper%'
SELECT name FROM cards WHERE istextless = 0
SELECT manacost FROM cards WHERE name = 'Ancestor`s Chosen'
SELECT count(id) FROM cards WHERE bordercolor = 'white' AND (power = '*' OR power IS NULL)
SELECT name FROM cards WHERE ispromo = 1 AND side IS NOT NULL
SELECT subtypes, supertypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer'
SELECT DISTINCT purchaseurls FROM cards WHERE promotypes = 'bundle';
SELECT count(DISTINCT artist) FROM cards WHERE bordercolor = 'black' AND availability LIKE '%arena,mtgo%'
SELECT name FROM cards WHERE name = 'Serra Angel' AND convertedmanacost > ( SELECT convertedmanacost FROM cards WHERE name = 'Shrine Keeper' )
SELECT artist FROM cards WHERE flavorname = 'Battra, Dark Destroyer'
SELECT name FROM cards WHERE frameversion = '2003' ORDER BY cast(manacost AS INTEGER) DESC LIMIT 3;
SELECT set_translations.translation FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Ancestor''s Chosen' AND set_translations.language = 'Italian'
SELECT count(set_translations.id) FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Angel of Mercy'
SELECT cards.name FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.translation = 'Hauptset Zehnte Edition'
SELECT 'YES' FROM cards INNER JOIN set_translations ON cards.id = set_translations.id WHERE cards.name = 'Ancestor''s Chosen' AND set_translations.language = 'Korean'
SELECT count(cards.id) FROM cards INNER JOIN set_translations ON cards.id = set_translations.id WHERE cards.artist = 'Adam Rex' AND set_translations.translation = 'Hauptset Zehnte Edition'
SELECT basesetsize FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setcode = ( SELECT code FROM sets WHERE name = 'Eighth Edition' )
SELECT CASE WHEN count(sets.mtgocode) > 0 THEN 'YES' ELSE 'NO' END FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Angel of Mercy'
SELECT releasedate FROM sets WHERE id IN (SELECT setcode FROM cards WHERE name = 'Ancestor''s Chosen');
SELECT TYPE FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Hauptset Zehnte Edition');
SELECT count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL
SELECT CASE WHEN sets.isforeignonly = 1 THEN 'YES' ELSE 'NO' END FROM cards INNER JOIN sets ON cards.id = sets.id WHERE cards.name = 'Adarkar Valkyrie'
SELECT count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Italian' AND sets.basesetsize < 10
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap' AND cards.bordercolor = 'black'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap' ORDER BY cast(cards.convertedmanacost AS INTEGER) DESC LIMIT 1
SELECT cards.artist FROM cards INNER JOIN sets ON cards.id = sets.id WHERE cards.artist IN ('Jeremy Jarvis', 'Aaron Miller', 'Chippy') AND sets.name = 'Coldsnap'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.number = 4 AND sets.name = 'Coldsnap'
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.id = sets.id WHERE sets.name = 'Coldsnap' AND cards.convertedmanacost > 5 AND (cards.power = '*' OR cards.power IS NULL)
SELECT foreign_data.flavortext FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'Italian'
SELECT foreign_data.language FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND cards.flavortext IS NOT NULL
SELECT foreign_data.type FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE cards.name = 'Ancestor''s Chosen' AND foreign_data.language = 'German'
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.language = 'Italian' AND set_translations.translation = 'Coldsnap'
SELECT cards.name FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN cards ON sets.id = cards.id WHERE sets.name = 'Coldsnap' AND cards.convertedmanacost = ( SELECT max(convertedmanacost) FROM cards )
SELECT rulings.date FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Reminisce'
SELECT cast(sum(CASE WHEN cards.convertedmanacost = 7 THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards INNER JOIN sets ON cards.id = sets.id WHERE sets.name = 'Coldsnap'
SELECT cast(sum(CASE WHEN cards.cardkingdomfoilid IS NOT NULL AND cards.cardkingdomid IS NOT NULL THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.name) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap'
SELECT code FROM sets WHERE releasedate = '2017-07-14'
SELECT keyrunecode FROM sets WHERE code = 'PKHC';
SELECT mcmid FROM sets WHERE code = 'SS2'
SELECT mcmname FROM sets WHERE releasedate = '2017-06-09';
SELECT TYPE FROM sets WHERE name LIKE '%From the Vault: Lore%'
SELECT parentcode FROM sets WHERE name = 'Commander 2014 Oversized'
SELECT CASE WHEN cards.hascontentwarning = 1 THEN 'YES' ELSE 'NO' END AS hascontentwarning, rulings.text FROM cards INNER JOIN rulings ON cards.id = rulings.id WHERE cards.artist = 'Jim Pavelec'
SELECT sets.releasedate FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Evacuation'
SELECT sets.basesetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Rinascita di Alara'
SELECT TYPE FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE translation = 'Huitième édition');
SELECT set_translations.translation FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE cards.name = 'Tendo Ice Bridge' AND set_translations.language = 'French'
SELECT count(set_translations.translation) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Tenth Edition' AND set_translations.translation IS NOT NULL
SELECT foreign_data.name FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE foreign_data.language = 'Japanese' AND cards.name = 'Fellwar Stone'
SELECT cards.name FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Journey into Nyx Hero''s Path' ORDER BY cards.convertedmanacost DESC LIMIT 1
SELECT sets.releasedate FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Ola de frío'
SELECT sets.type FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE cards.name = 'Samite Pilgrim'
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedmanacost = '3'
SELECT translation FROM set_translations WHERE language = 'Chinese Simplified' AND setcode IN (SELECT code FROM sets WHERE name = 'Mirrodin');
SELECT cast(sum(CASE WHEN sets.isnonfoilonly = 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Japanese'
SELECT cast(count(CASE WHEN sets.isonlineonly = 1 THEN 1 ELSE NULL END) AS REAL) * 100 / count(sets.id) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Portuguese (Brazil)'
SELECT DISTINCT availability FROM cards WHERE artist = 'Aleksi Briclot' AND istextless = 1;
SELECT id FROM sets WHERE basesetsize = (SELECT max(basesetsize) FROM sets);
SELECT artist FROM cards WHERE side IS NULL ORDER BY cast(replace(manacost, '{', '') AS INTEGER) DESC LIMIT 1
SELECT max(frameeffects) FROM cards WHERE cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL;
SELECT count(id) FROM cards WHERE dueldeck = 'a' AND power IS NULL AND hasfoil = 0
SELECT id FROM sets WHERE TYPE = 'commander' ORDER BY totalsetsize DESC LIMIT 1
SELECT cards.name FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'duel' ORDER BY cards.manacost DESC LIMIT 10
SELECT min(cards.originalreleasedate), legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.rarity = 'mythic' AND legalities.status = 'Legal'
SELECT count(DISTINCT cards.id) FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'French' AND cards.artist = 'Volkan Baǵa'
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Abundance' AND cards.types = 'Enchantment' AND legalities.status = 'Legal' AND cards.rarity = 'rare'
SELECT legalities.format, cards.name FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Banned' GROUP BY legalities.format ORDER BY count(legalities.status) DESC LIMIT 1
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Battlebond'
SELECT cards.artist, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid ORDER BY cards.artist LIMIT 1
SELECT legalities.status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.frameversion = '1997' AND cards.artist = 'D. Alexander Gregory' AND legalities.format = 'legacy' AND cards.hascontentwarning = 1
SELECT cards.name, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE edhrecrank = 1 AND legalities.status = 'Banned'
SELECT cast(count(sets.id) AS REAL) / 365, max(set_translations.language) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE strftime('%Y', sets.releasedate) BETWEEN '2012' AND '2015'
SELECT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena';
SELECT uuid FROM legalities WHERE format = 'oldschool' AND (status = 'Banned' OR status = 'Restricted');
SELECT count(id) FROM cards WHERE artist = 'Matthew D. Wilson' AND availability = 'paper'
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.artist = 'Kev Walker' ORDER BY rulings.date DESC
SELECT cards.name, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid INNER JOIN sets ON sets.id = cards.setcode WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal'
SELECT name FROM sets WHERE code IN (SELECT setcode FROM set_translations WHERE LANGUAGE LIKE '%Korean%' AND LANGUAGE NOT LIKE '%Japanese%');
SELECT DISTINCT cards.frameversion, cards.name FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Allen Williams' AND legalities.status = 'Banned'
SELECT CASE WHEN reputation > ( SELECT reputation FROM users WHERE displayname = 'Jarrod Dixon' ) THEN 'Harlan' ELSE 'Jarrod Dixon' END FROM users WHERE displayname IN ( 'Harlan', 'Jarrod Dixon' )
SELECT displayname FROM users WHERE strftime('%Y', creationdate) = '2011'
SELECT count(id) FROM users WHERE lastaccessdate > '2014-09-01'
SELECT displayname FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT count(DISTINCT users.id) FROM users users JOIN votes votes ON users.id = votes.userid WHERE users.upvotes > 100 AND users.downvotes > 1;
SELECT count(id) FROM users WHERE substr(cast(creationdate AS TEXT), 1, 4) > '2013' AND views > 10
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT title FROM posts WHERE owneruserid = ( SELECT id FROM users WHERE displayname = 'csgillespie' )
SELECT posts.ownerdisplayname FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posts.title = 'Eliciting priors from experts'
SELECT title FROM posts WHERE ownerdisplayname = 'csgillespie' ORDER BY viewcount DESC LIMIT 1
SELECT ownerdisplayname FROM posts ORDER BY favoritecount DESC LIMIT 1
SELECT sum(posts.commentcount) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT answercount FROM posts WHERE ownerdisplayname = 'csgillespie' ORDER BY answercount DESC LIMIT 1
SELECT lasteditordisplayname FROM posts WHERE title = 'Examples for teaching: Correlation does not mean causation'
SELECT count(id) FROM posts WHERE owneruserid = ( SELECT id FROM users WHERE displayname = 'csgillespie' ) AND parentid IS NULL
SELECT DISTINCT posts.ownerdisplayname FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.closeddate IS NOT NULL
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.age > 65 AND posts.score >= 20
SELECT users.location FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Eliciting priors from experts'
SELECT posts.body FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id WHERE tags.tagname = 'bayesian'
SELECT posts.body FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id ORDER BY tags.count DESC LIMIT 1
SELECT count(id) FROM badges WHERE userid IN (SELECT id FROM users WHERE displayname = 'csgillespie');
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie'
SELECT count(DISTINCT badges.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie' AND strftime('%Y', badges.date) = '2011';
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.id ORDER BY count(badges.id) DESC LIMIT 1
SELECT avg(posts.score) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT cast(count(badges.id) AS REAL) / count(DISTINCT users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.views > 200
SELECT cast(sum(CASE WHEN users.age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.score > 5
SELECT count(*) FROM votes WHERE userid = 58 AND creationdate = '2010-07-19';
SELECT creationdate FROM votes GROUP BY creationdate ORDER BY count(id) DESC LIMIT 1
SELECT count(id) FROM badges WHERE name = 'Revival'
SELECT title FROM posts WHERE id IN (SELECT postid FROM comments WHERE score = (SELECT max(score) FROM comments));
SELECT commentcount FROM posts WHERE viewcount = 1910
SELECT posts.favoritecount FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.creationdate = '2014-04-23 20:29:39' AND comments.userid = 3025
SELECT comments.text FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.parentid = 107829 AND posts.commentcount = 1
SELECT CASE WHEN posts.closeddate IS NULL THEN 'NOT well-finished' ELSE 'well-finished' END FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.creationdate = '2013-07-12 09:08:18.0' AND comments.userid = 23853
SELECT reputation FROM users WHERE id = (SELECT owneruserid FROM posts WHERE id = 65041);
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Tiago Pasqualini'
SELECT users.displayname FROM users INNER JOIN votes ON users.id = votes.userid WHERE votes.id = 6347
SELECT sum(CASE WHEN posts.title LIKE '%data visualization%' THEN 1 ELSE 0 END) FROM posts INNER JOIN votes ON posts.id = votes.postid
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'DatEpicCoderGuyWhoPrograms'
SELECT cast(count(posts.id) AS REAL) / count(votes.id) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE votes.userid = 24
SELECT viewcount FROM posts WHERE title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT text FROM comments WHERE score = 17
SELECT displayname FROM users WHERE websiteurl = 'http://stackoverflow.com'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost'
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'thank you user93!'
SELECT comments.text FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.displayname = 'A Lion'
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Understanding what Dassault iSight is doing?'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.title = 'How does gentle boosting differ from AdaBoost?'
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Necromancer' LIMIT 10
SELECT posts.ownerdisplayname FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posts.title = 'Open source tools for visualizing multi-dimensional data?'
SELECT title FROM posts WHERE lasteditoruserid = ( SELECT id FROM users WHERE displayname = 'Vebjorn Ljosa' )
SELECT sum(posts.score), users.websiteurl FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Yevgeny'
SELECT comment FROM posthistory WHERE postid = ( SELECT id FROM posts WHERE title = 'Why square the difference instead of taking the absolute value in standard deviation?' )
SELECT sum(votes.bountyamount) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE posts.title LIKE '%data%'
SELECT users.displayname FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id WHERE votes.bountyamount = 50 AND posts.title LIKE '%variance%'
SELECT avg(posts.viewcount), posts.title, posthistory.text FROM tags INNER JOIN posts ON tags.wikipostid = posts.id INNER JOIN posthistory ON posts.id = posthistory.postid WHERE tags.tagname = 'humor'
SELECT count(id) FROM comments WHERE userid = 13
SELECT id FROM users ORDER BY reputation DESC LIMIT 1
SELECT id FROM users ORDER BY views ASC LIMIT 1
SELECT count(DISTINCT badges.userid) FROM badges badges JOIN users users ON badges.userid = users.id WHERE strftime('%Y', badges.date) = '2011' AND badges.name = 'Supporter';
SELECT count(DISTINCT userid) FROM badges WHERE userid IN (SELECT id FROM users) GROUP BY userid HAVING count(name) > 5;
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'New York' AND (badges.name = 'Teacher' OR badges.name = 'Supporter');
SELECT users.id, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1
SELECT users.id FROM users INNER JOIN posthistory ON users.id = posthistory.userid WHERE users.views >= 1000 GROUP BY users.id HAVING count(posthistory.postid) = 1
SELECT users.id, badges.name FROM users INNER JOIN badges ON users.id = badges.userid INNER JOIN posts ON users.id = posts.owneruserid GROUP BY users.id ORDER BY count(posts.id) DESC LIMIT 1
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'India' AND badges.name = 'Teacher';
SELECT cast(sum(CASE WHEN strftime('%Y', badges.date) = '2010' THEN 1 ELSE 0 END) AS REAL) * 100 / sum(CASE WHEN strftime('%Y', badges.date) = '2011' THEN 1 ELSE 0 END) FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Student'
SELECT posthistorytypeid, count(DISTINCT userid) FROM posthistory WHERE postid = 3720 GROUP BY posthistorytypeid;
SELECT postlinks.relatedpostid, posts.viewcount FROM postlinks INNER JOIN posts ON postlinks.relatedpostid = posts.id WHERE postlinks.postid = 61217
SELECT posts.score, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE postlinks.postid = 395
SELECT id, owneruserid FROM posts WHERE score > 60
SELECT sum(posts.favoritecount) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.id = 686 AND strftime('%Y', posts.creaiondate) = '2011'
SELECT avg(users.upvotes), avg(users.age) FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id GROUP BY users.id HAVING count(users.id) > 10
SELECT count(DISTINCT userid) FROM badges WHERE name = 'Announcer';
SELECT name FROM badges WHERE date = '2010-07-19 19:39:08.0'
SELECT count(id) FROM comments WHERE score > 60
SELECT text FROM comments WHERE creationdate = '2010-07-19 19:25:47.0'
SELECT count(id) FROM posts WHERE score = 10
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.reputation = ( SELECT max(reputation) FROM users )
SELECT users.reputation FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Pierre'
SELECT badges.date FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Rochester, NY'
SELECT cast(sum(CASE WHEN badges.name = 'Teacher' THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid
SELECT cast(sum(CASE WHEN users.age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer'
SELECT comments.score FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.creaiondate = '2010-07-19 19:19:56.0'
SELECT text FROM comments WHERE postid = ( SELECT id FROM posts WHERE creaiondate = '2010-07-19 19:37:33' )
SELECT users.age FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Vienna, Austria'
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Supporter' AND users.age >= 19 AND users.age <= 65
SELECT users.views FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.reputation = ( SELECT min(reputation) FROM users )
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Sharpie'
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.age > 65 AND badges.name = 'Supporter';
SELECT displayname FROM users WHERE id = 30
SELECT count(id) FROM users WHERE LOCATION = 'New York'
SELECT count(id) FROM votes WHERE strftime('%Y', creationdate) = '2010'
SELECT count(id) FROM users WHERE age >= 19 AND age <= 65
SELECT displayname FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT cast(sum(CASE WHEN strftime('%Y', creationdate) = '2010' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN strftime('%Y', creationdate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT tags.tagname FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON tags.wikipostid = posts.id WHERE users.displayname = 'John Salvatier'
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Daniel Vassallo'
SELECT sum(CASE WHEN users.displayname = 'Harlan' THEN 1 ELSE 0 END) FROM users INNER JOIN votes ON users.id = votes.userid
SELECT id FROM posts WHERE ownerdisplayname = 'slashnick' ORDER BY answercount DESC LIMIT 1
SELECT CASE WHEN sum(CASE WHEN users.displayname = 'Harvey Motulsky' THEN posts.viewcount ELSE 0 END) > sum(CASE WHEN users.displayname = 'Noah Snyder' THEN posts.viewcount ELSE 0 END) THEN 'Harvey Motulsky' ELSE 'Noah Snyder' END FROM users INNER JOIN posts ON users.id = posts.owneruserid
SELECT count(posts.id) FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id WHERE users.displayname = 'Matt Parker' AND votes.postid > 4
SELECT count(comments.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN comments ON posts.id = comments.postid WHERE users.displayname = 'Neil McGuigan' AND comments.score < 60
SELECT tags.tagname FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON posts.tags LIKE '%' || tags.tagname || '%' WHERE users.displayname = 'Mark Meckes' AND posts.commentcount = 0
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer'
SELECT cast(sum(CASE WHEN tags.tagname = 'r' THEN 1 ELSE 0 END) AS REAL) * 100 / count(posts.id) FROM posts INNER JOIN tags ON posts.id = tags.wikipostid INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Community'
SELECT sum(CASE WHEN users.displayname = 'Mornington' THEN posts.viewcount ELSE 0 END) - sum(CASE WHEN users.displayname = 'Amos' THEN posts.viewcount ELSE 0 END) AS difference FROM users INNER JOIN posts ON users.id = posts.owneruserid
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE strftime('%Y', badges.date) = '2014' AND badges.name = 'Commentator';
SELECT count(id) FROM posts WHERE strftime('%Y-%m-%d', creaiondate) = '2010-07-21'
SELECT displayname, age FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images'
SELECT count(id) FROM comments WHERE userid = 13 AND score < 60
SELECT DISTINCT posts.title, users.displayname FROM comments INNER JOIN posts ON comments.postid = posts.id INNER JOIN users ON comments.userid = users.id WHERE comments.score > 60
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'North Pole' AND strftime('%Y', badges.date) = '2011'
SELECT users.displayname, users.websiteurl FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.favoritecount > 150
SELECT posthistory.comment, posthistory.creationdate FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posts.title = 'What is the best introductory Bayesian statistics textbook?'
SELECT users.lastaccessdate, users.location FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Outliers'
SELECT posts.title FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE postlinks.relatedpostid = ( SELECT id FROM posts WHERE title = 'How to tell if something happened in a data set which monitors a value over time' )
SELECT posthistory.postid, badges.name FROM users INNER JOIN posthistory ON users.id = posthistory.userid INNER JOIN badges ON posthistory.userid = badges.userid WHERE users.displayname = 'Samuel' AND strftime('%Y', posthistory.creationdate) = '2013'
SELECT ownerdisplayname FROM posts ORDER BY viewcount DESC LIMIT 1
SELECT users.displayname, users.location FROM tags INNER JOIN posts ON tags.wikipostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE tags.tagname = 'hypothesis-testing'
SELECT posts.title, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE posts.title = 'What are principal component scores?'
SELECT ownerdisplayname FROM posts WHERE parentid IS NOT NULL AND score = ( SELECT max(score) FROM posts )
SELECT users.displayname, users.websiteurl FROM users INNER JOIN votes ON users.id = votes.userid WHERE votes.votetypeid = 8 ORDER BY votes.bountyamount DESC LIMIT 1
SELECT title FROM posts ORDER BY viewcount DESC LIMIT 5
SELECT count(id) FROM tags WHERE wikipostid IN ( SELECT id FROM posts WHERE commentcount BETWEEN 5000 AND 7000 )
SELECT owneruserid FROM posts ORDER BY favoritecount DESC LIMIT 1
SELECT age FROM users WHERE reputation = ( SELECT max(reputation) FROM users )
SELECT count(votes.postid) FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE strftime('%Y', votes.creationdate) = '2011' AND votes.bountyamount = 50
SELECT id FROM users ORDER BY age LIMIT 1
SELECT sum(score) FROM posts WHERE lasactivitydate LIKE '2010-07-19%'
SELECT cast(sum(CASE WHEN strftime('%Y', creationdate) = '2010' THEN 1 ELSE 0 END) AS REAL) / 12 FROM postlinks WHERE postid IN (SELECT id FROM posts WHERE answercount <= 2);
SELECT postid FROM votes WHERE userid = 1465 ORDER BY bountyamount DESC LIMIT 1
SELECT title FROM posts WHERE id IN (SELECT postid FROM postlinks WHERE creationdate = (SELECT min(creationdate) FROM postlinks));
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.id ORDER BY count(badges.name) DESC LIMIT 1
SELECT votes.creationdate FROM users INNER JOIN votes ON users.id = votes.userid WHERE users.displayname = 'chl' ORDER BY votes.creationdate ASC LIMIT 1
SELECT min(posts.creaiondate) FROM users INNER JOIN posts ON users.id = posts.owneruserid ORDER BY users.age LIMIT 1
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Autobiographer' ORDER BY badges.date ASC LIMIT 1
SELECT count(DISTINCT users.id) FROM users users JOIN posts posts ON users.id = posts.owneruserid WHERE users.location = 'United Kingdom' AND posts.favoritecount >= 4;
SELECT avg(v.postid) FROM votes v JOIN users u ON v.userid = u.id WHERE u.age = (SELECT max(age) FROM users);
SELECT displayname FROM users ORDER BY reputation DESC LIMIT 1
SELECT count(id) FROM users WHERE reputation > 2000 AND views > 1000
SELECT displayname FROM users WHERE age >= 19 AND age <= 65
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Jay Stevens' AND strftime('%Y', posts.creaiondate) = '2010'
SELECT id, title FROM posts WHERE ownerdisplayname = 'Harvey Motulsky' ORDER BY viewcount DESC LIMIT 1
SELECT id, title FROM posts WHERE score = ( SELECT max(score) FROM posts )
SELECT avg(posts.score) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Stephen Turner'
SELECT DISTINCT users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.viewcount > 20000 AND strftime('%Y', posts.creaiondate) = '2011'
SELECT id, ownerdisplayname FROM posts WHERE strftime('%Y', creaiondate) = '2010' ORDER BY favoritecount DESC LIMIT 1
SELECT cast(sum(CASE WHEN users.reputation > 1000 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE strftime('%Y', users.creationdate) = '2011'
SELECT cast(sum(CASE WHEN age BETWEEN 13 AND 18 THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM users
SELECT posts.viewcount, users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posthistory.text = 'Computer Game Datasets'
SELECT count(id) FROM posts WHERE viewcount > ( SELECT avg(viewcount) FROM posts )
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.score = ( SELECT max(score) FROM posts )
SELECT count(id) FROM posts WHERE viewcount > 35000 AND commentcount = 0
SELECT users.displayname, users.location FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE posts.id = 183 ORDER BY posts.lasteditdate DESC LIMIT 1
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Emmett' ORDER BY badges.date DESC LIMIT 1
SELECT count(id) FROM users WHERE age >= 19 AND age <= 65 AND upvotes > 5000
SELECT badges.date - users.creationdate FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Zolomon'
SELECT count(posts.id), count(comments.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN comments ON posts.id = comments.postid ORDER BY users.creationdate DESC LIMIT 1
SELECT comments.text, users.displayname FROM comments INNER JOIN posts ON comments.postid = posts.id INNER JOIN users ON comments.userid = users.id WHERE posts.title = 'Analysing wind data with R' ORDER BY comments.creationdate DESC LIMIT 10
SELECT count(DISTINCT badges.userid) FROM badges badges JOIN users users ON badges.userid = users.id WHERE badges.name = 'Citizen Patrol';
SELECT count(tags.wikipostid) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname = 'careers'
SELECT reputation, views FROM users WHERE displayname = 'Jarrod Dixon'
SELECT sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 1 ELSE 0 END), sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 0 ELSE 1 END) FROM posts INNER JOIN comments ON posts.id = comments.postid
SELECT creationdate FROM users WHERE displayname = 'IrishStat'
SELECT count(id) FROM votes WHERE bountyamount >= 30
SELECT cast(count(CASE WHEN posts.score > 50 THEN 1 ELSE NULL END) AS REAL) * 100 / count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.reputation = ( SELECT max(reputation) FROM users )
SELECT count(id) FROM posts WHERE score < 20
SELECT count(tags.tagname) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.id < 15 AND tags.count <= 20
SELECT excerptpostid, wikipostid FROM tags WHERE tagname = 'sample'
SELECT users.reputation, users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.title LIKE '%linear regression%'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.viewcount BETWEEN 100 AND 150 ORDER BY comments.score DESC LIMIT 1
SELECT users.creationdate, users.age FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.websiteurl LIKE '%http://%'
SELECT count(DISTINCT comments.postid) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.score = 0 AND posts.viewcount < 5
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1 AND comments.score = 0
SELECT count(DISTINCT users.accountid) FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.age = 40 AND comments.score = 0
SELECT p.id, count(c.id) AS commentcount FROM posts p LEFT JOIN comments c ON p.id = c.postid WHERE p.title = 'Group differences on a five point Likert item' GROUP BY p.id;
SELECT users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'R is also lazy evaluated.'
SELECT comments.text FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.displayname = 'Harvey Motulsky'
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.score BETWEEN 1 AND 5 AND users.downvotes = 0
SELECT cast(sum(CASE WHEN users.upvotes = 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM comments INNER JOIN users ON comments.userid = users.id WHERE comments.score BETWEEN 5 AND 10
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = '3-D Man'
SELECT count(DISTINCT hp.hero_id) FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength';
SELECT count(DISTINCT superhero.id) FROM superhero superhero JOIN hero_power hero_power ON superhero.id = hero_power.hero_id JOIN superpower superpower ON hero_power.power_id = superpower.id WHERE superhero.height_cm > 200 AND superpower.power_name = 'Super Strength';
SELECT full_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power GROUP BY hero_id HAVING count(DISTINCT power_id) > 15);
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse'
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE colour.colour = 'Blue' AND colour.colour = 'Blond' AND superpower.power_name = 'Agility'
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero.superhero_name, superhero.height_cm FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'
SELECT colour.colour, count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' GROUP BY colour.colour ORDER BY count(superhero.id) DESC LIMIT 1
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength'
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics'
SELECT publisher.publisher_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value LIMIT 1
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE publisher.publisher_name = 'Marvel Comics' AND colour.colour = 'Gold'
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Blue Beetle II'
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond'
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'Copycat'
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch'
SELECT count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female' AND attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.superhero_name ORDER BY count(superhero.superhero_name) DESC LIMIT 1
SELECT count(superhero.id) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire'
SELECT cast(count(CASE WHEN alignment.alignment = 'Bad' THEN superhero.id ELSE NULL END) AS REAL) * 100 / count(superhero.id), count(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN superhero.id ELSE NULL END) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN alignment ON superhero.alignment_id = alignment.id
SELECT sum(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) - sum(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id
SELECT id FROM publisher WHERE publisher_name = 'Star Trek'
SELECT avg(attribute_value) FROM hero_attribute;
SELECT count(*) FROM superhero WHERE full_name IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.id = 75
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Deathlok'
SELECT avg(superhero.weight_kg) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' LIMIT 5
SELECT superhero.superhero_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.height_cm BETWEEN 170 AND 190 AND colour.colour = 'No Colour'
SELECT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 56
SELECT full_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Demi-God') LIMIT 5;
SELECT count(id) FROM superhero WHERE alignment_id = 2
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169
SELECT colour.colour FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE race.race = 'Human' AND superhero.height_cm = 185
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id ORDER BY superhero.weight_kg DESC LIMIT 1
SELECT cast(count(CASE WHEN publisher.id = 13 THEN superhero.id ELSE NULL END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.height_cm BETWEEN 150 AND 180
SELECT superhero.superhero_name FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Male' AND superhero.weight_kg > ( SELECT avg(weight_kg) * 0.79 FROM superhero )
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superpower.power_name ORDER BY count(superpower.power_name) DESC LIMIT 1
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Abomination'
SELECT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE hero_power.hero_id = 1
SELECT count(DISTINCT hero_power.hero_id) FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Stealth'
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT cast(count(superhero.id) AS REAL) / count(DISTINCT superhero.id) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.id = 1
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics'
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE attribute.attribute_name = 'Durability' AND publisher.publisher_name = 'Dark Horse Comics' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Abraham Sapien'
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Flight'
SELECT superhero.eye_colour_id, superhero.hair_colour_id, superhero.skin_colour_id FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'Dark Horse Comics' AND gender.gender = 'Female'
SELECT superhero.superhero_name, publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.hair_colour_id = superhero.skin_colour_id AND superhero.hair_colour_id = superhero.eye_colour_id
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.superhero_name = 'A-Bomb'
SELECT cast(sum(CASE WHEN colour.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE gender.gender = 'Female'
SELECT superhero.superhero_name, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler'
SELECT gender.gender FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE superhero.superhero_name = 'Agent 13'
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation'
SELECT count(DISTINCT hero_power.power_id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Amazo'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Hunter Zolomon'
SELECT superhero.height_cm FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Amber'
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id AND s.hair_colour_id = c.id WHERE c.colour = 'Black';
SELECT DISTINCT superhero.eye_colour_id FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE colour.colour = 'Gold'
SELECT full_name FROM superhero WHERE race_id IN (SELECT id FROM race WHERE race = 'Vampire');
SELECT superhero.superhero_name FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT race.race, alignment.alignment FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Cameron Hicks'
SELECT cast(sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.publisher_id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT avg(superhero.weight_kg) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien'
SELECT (SELECT weight_kg FROM superhero WHERE full_name = 'Emil Blonsky') - (SELECT weight_kg FROM superhero WHERE full_name = 'Charles Chandler') AS difference;
SELECT avg(height_cm) FROM superhero
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Abomination'
SELECT count(superhero.id) FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE race.race = 'God/Eternal' AND gender.gender = 'Male'
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT count(id) FROM superhero WHERE alignment_id = 3
SELECT attribute.attribute_name, hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = '3-D Man'
SELECT s.full_name FROM superhero s JOIN colour c ON s.eye_colour_id = c.id JOIN colour c2 ON s.hair_colour_id = c2.id WHERE c.colour = 'Blue' AND c2.colour = 'Brown';
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy')
SELECT count(id) FROM superhero WHERE publisher_id IS NULL
SELECT cast(sum(CASE WHEN colour.colour = 'Blue' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.eye_colour_id = 7
SELECT cast(sum(CASE WHEN gender.gender = 'Male' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id
SELECT full_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT id FROM superpower WHERE power_name = 'Cryokinesis'
SELECT full_name FROM superhero WHERE id = 294
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.full_name = 'Helen Parr'
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.id = 38
SELECT race.race FROM race INNER JOIN superhero ON race.id = superhero.race_id INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id ORDER BY hero_attribute.attribute_value DESC LIMIT 1
SELECT alignment.alignment, superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero.superhero_name = 'Atom IV'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' LIMIT 5
SELECT avg(hero_attribute.attribute_value) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT DISTINCT colour.colour FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE hero_attribute.attribute_value = 100
SELECT count(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 1 AND gender.id = 2
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE hero_attribute.attribute_value BETWEEN 75 AND 80
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'blue' AND gender.gender = 'Male'
SELECT cast(sum(CASE WHEN gender.id = 2 THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.id = 2
SELECT (SELECT count(*) FROM superhero WHERE eye_colour_id = 7) - (SELECT count(*) FROM superhero WHERE eye_colour_id = 1) AS difference;
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Hulk' AND attribute.attribute_name = 'Strength'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Ajax'
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad' AND colour.colour = 'Green'
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'Marvel Comics' AND gender.gender = 'Female'
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.full_name ASC
SELECT gender.gender FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE superpower.power_name = 'Phoenix Force'
SELECT superhero.superhero_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY superhero.weight_kg DESC LIMIT 1
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN race ON superhero.race_id = race.id WHERE publisher.publisher_name = 'Dark Horse Comics' AND race.race != 'Human'
SELECT count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100
SELECT sum(CASE WHEN publisher.publisher_name = 'DC Comics' THEN 1 ELSE 0 END) - sum(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id
SELECT attribute.attribute_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value LIMIT 1
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination'
SELECT full_name FROM superhero ORDER BY height_cm DESC LIMIT 1
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler'
SELECT cast(sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.publisher_id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE publisher.publisher_name = 'George Lucas'
SELECT cast(sum(CASE WHEN alignment.alignment = 'Good' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.publisher_id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT count(id) FROM superhero WHERE full_name LIKE 'John%'
SELECT hero_id FROM hero_attribute WHERE attribute_value = ( SELECT min(attribute_value) FROM hero_attribute )
SELECT full_name FROM superhero WHERE superhero_name = 'Alien'
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown');
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.superhero_name = 'Aquababy'
SELECT superhero.weight_kg, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Neutral'
SELECT hp.hero_id FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Intelligence';
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Blackwulf'
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.height_cm > ( SELECT avg(height_cm) FROM superhero ) * 0.8
SELECT drivers.driverref FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 20 ORDER BY qualifying.q1 DESC LIMIT 5
SELECT drivers.surname FROM qualifying INNER JOIN drivers ON qualifying.driverid = drivers.driverid WHERE qualifying.raceid = 19 AND qualifying.q2 = ( SELECT min(q2) FROM qualifying WHERE raceid = 19 )
SELECT DISTINCT races.year FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.location = 'Shanghai'
SELECT races.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Circuit de Barcelona-Catalunya'
SELECT races.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Germany'
SELECT DISTINCT races.circuitid, constructorstandings.position FROM races INNER JOIN constructorstandings ON races.raceid = constructorstandings.raceid INNER JOIN constructors ON constructors.constructorid = constructorstandings.constructorid WHERE constructors.name = 'Renault'
SELECT count(DISTINCT races.raceid) FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2010 AND circuits.country NOT IN ('Asia', 'Europe');
SELECT races.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Spain'
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Australian Grand Prix'
SELECT races.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Sepang International Circuit'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Sepang International Circuit'
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Abu Dhabi Grand Prix'
SELECT circuits.country FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON results.constructorid = constructors.constructorid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.raceid = 24 ORDER BY results.points DESC LIMIT 1
SELECT qualifying.q1 FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceid = 354
SELECT nationality FROM drivers WHERE driverid IN (SELECT driverid FROM qualifying WHERE raceid = 355 AND q2 = '0:01:40');
SELECT driverid FROM qualifying WHERE raceid = 903 AND q3 LIKE '1:01:54%'
SELECT count(DISTINCT results.driverid) FROM races races JOIN results results ON races.raceid = results.raceid WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NOT NULL;
SELECT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceid = 901
SELECT count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.date = '2015-11-29'
SELECT dob FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE raceid = 592 AND TIME IS NOT NULL) ORDER BY dob LIMIT 1
SELECT drivers.url FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE laptimes.raceid = 161 AND laptimes.time = '0:01:27'
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE results.raceid = 933 ORDER BY results.fastestlapspeed DESC LIMIT 1
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Malaysian Grand Prix'
SELECT constructors.url FROM results INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE results.raceid = 9 ORDER BY results.points DESC LIMIT 1
SELECT qualifying.q1 FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE drivers.forename = 'Lucas' AND drivers.surname = 'DiGrassi' AND qualifying.raceid = 345
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 347 AND qualifying.q2 = '0:01:15'
SELECT drivers.code FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 45 AND qualifying.q3 = '1:01:33'
SELECT results.time FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Bruce' AND drivers.surname = 'McLaren' AND results.raceid = 743
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'San Marino Grand Prix' AND results.position = 2 AND races.year = 2006
SELECT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceid = 901
SELECT count(DISTINCT drivers.driverid) FROM races races JOIN results results ON races.raceid = results.raceid JOIN drivers drivers ON results.driverid = drivers.driverid WHERE races.date = '2015-11-29' AND results.time IS NULL;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE laptimes.raceid = 872 ORDER BY drivers.dob DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE laptimes.raceid = 348 ORDER BY laptimes.time LIMIT 1
SELECT nationality FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE fastestlapspeed = (SELECT max(fastestlapspeed) FROM results));
SELECT cast((results.fastestlapspeed - results.fastestlapspeed) AS REAL) * 100 / results.fastestlapspeed FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Paul' AND drivers.surname = 'di Resta' AND results.raceid = 853
SELECT cast(count(CASE WHEN results.time IS NOT NULL THEN 1 ELSE NULL END) AS REAL) * 100 / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.date = '1983-07-16'
SELECT min(YEAR) FROM races WHERE name = 'Singapore Grand Prix'
SELECT name FROM races WHERE YEAR = 2005 ORDER BY raceid DESC
SELECT name FROM races WHERE substr(date, 1, instr(date, '-') - 1) = ( SELECT min(substr(date, 1, instr(date, '-') - 1)) FROM races )
SELECT name, date FROM races WHERE YEAR = 1999 AND round = ( SELECT max(round) FROM races WHERE YEAR = 1999 )
SELECT YEAR FROM races GROUP BY YEAR ORDER BY count(YEAR) DESC LIMIT 1
SELECT name FROM races WHERE YEAR = 2017 AND circuitid NOT IN (SELECT circuitid FROM races WHERE YEAR = 2000);
SELECT circuits.country, circuits.name, circuits.location FROM races INNER JOIN seasons ON races.year = seasons.year INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix' ORDER BY races.year LIMIT 1
SELECT seasons.year FROM races INNER JOIN seasons ON races.year = seasons.year INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Brands Hatch' AND races.name = 'British Grand Prix' ORDER BY races.year DESC LIMIT 1
SELECT count(DISTINCT seasons.year) FROM races races JOIN seasons seasons ON races.year = seasons.year JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'British Grand Prix' AND circuits.name = 'Silverstone Circuit' AND circuits.country = 'United Kingdom';
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = 2010 AND races.name = 'Singapore Grand Prix' ORDER BY results.position
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY results.points DESC LIMIT 1
SELECT drivers.forename, drivers.surname, driverstandings.points FROM races INNER JOIN driverstandings ON races.raceid = driverstandings.raceid INNER JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE races.name = 'Chinese Grand Prix' AND races.year = 2017 ORDER BY driverstandings.points DESC LIMIT 3
SELECT drivers.forename, drivers.surname, races.name FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid ORDER BY laptimes.milliseconds LIMIT 1
SELECT cast(sum(results.milliseconds) AS REAL) / count(results.milliseconds) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = 2009
SELECT cast(sum(CASE WHEN drivers.surname = 'Hamilton' AND results.position > 1 THEN 1 ELSE 0 END) AS REAL) * 100 / count(results.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year >= 2010 AND races.circuitid = 1
SELECT drivers.forename, drivers.surname, drivers.nationality, max(driverstandings.points) FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid GROUP BY driverstandings.driverid ORDER BY count(driverstandings.wins) DESC LIMIT 1
SELECT dob FROM drivers WHERE nationality = 'Japanese' ORDER BY dob DESC LIMIT 1
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year BETWEEN 1990 AND 2000 GROUP BY circuits.name HAVING count(races.raceid) = 4
SELECT circuits.name, circuits.location, races.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2006 AND circuits.country = 'USA'
SELECT races.name, circuits.name, circuits.location FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE strftime('%Y-%m', races.date) = '2005-09'
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Alex' AND drivers.surname = 'Yoong' AND results.position < 20
SELECT count(results.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND races.circuitid = ( SELECT circuitid FROM circuits WHERE name = 'Sepang International Circuit' )
SELECT races.name, races.year FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' ORDER BY results.milliseconds LIMIT 1
SELECT avg(results.points) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Eddie' AND drivers.surname = 'Irvine' AND races.year = 2000
SELECT races.year, results.points FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY races.year LIMIT 1
SELECT races.date, circuits.country FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2017 ORDER BY races.date ASC
SELECT races.name, races.year, circuits.location FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY races.laps DESC LIMIT 1
SELECT cast(sum(CASE WHEN circuits.country = 'Germany' THEN 1 ELSE 0 END) AS REAL) * 100 / count(races.raceid) FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix'
SELECT lat, lng FROM circuits WHERE name = 'Silverstone Circuit'
SELECT name FROM circuits WHERE LOCATION IN ('Silverstone', 'Hockenheimring', 'Hungaroring') ORDER BY lat DESC LIMIT 1
SELECT circuitref FROM circuits WHERE name = 'Marina Bay Street Circuit'
SELECT country FROM circuits WHERE alt = ( SELECT max(alt) FROM circuits )
SELECT count(driverid) FROM drivers WHERE code IS NULL
SELECT country FROM circuits WHERE circuitid IN (SELECT circuitid FROM races JOIN driverstandings ON races.raceid = driverstandings.raceid JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE dob IS NOT NULL ORDER BY dob LIMIT 1);
SELECT surname FROM drivers WHERE nationality = 'Italian'
SELECT url FROM drivers WHERE forename = 'Anthony' AND surname = 'Davidson'
SELECT driverref FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix'
SELECT DISTINCT races.year FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Silverstone Circuit'
SELECT races.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Silverstone Circuit'
SELECT races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2010 AND circuits.name = 'Abu Dhabi Circuit'
SELECT count(DISTINCT races.raceid) FROM races races JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy';
SELECT DISTINCT races.date FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Barcelona-Catalunya'
SELECT circuits.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2009 AND races.name = 'Spanish Grand Prix'
SELECT min(results.fastestlaptime) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY results.fastestlapspeed DESC LIMIT 1
SELECT drivers.driverref FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'Canadian Grand Prix' AND races.year = 2007 ORDER BY results.rank LIMIT 1
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank LIMIT 1
SELECT max(results.fastestlapspeed) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT DISTINCT races.year FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT results.positionorder FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Chinese Grand Prix' AND races.year = 2008
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = '1989' AND results.grid = 4
SELECT count(DISTINCT results.driverid) FROM races races JOIN results results ON races.raceid = results.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.time IS NOT NULL;
SELECT results.fastestlap FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Australian Grand Prix' AND races.year = 2008
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Chinese Grand Prix' AND results.rank = 2 AND races.year = 2008
SELECT drivers.forename, drivers.surname, drivers.url FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN races races ON results.raceid = races.raceid WHERE drivers.nationality = 'British' AND races.year = 2008 AND races.name = 'Australian Grand Prix';
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN races races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Chinese Grand Prix' AND results.time IS NOT NULL;
SELECT sum(results.points) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT cast(sum(results.fastestlaptime) AS REAL) / count(results.fastestlaptime) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT cast(count(CASE WHEN results.time IS NOT NULL THEN races.raceid ELSE NULL END) AS REAL) * 100 / count(races.raceid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix'
SELECT cast((replace(results.time, ':', '') - replace(results.fastestlaptime, ':', '')) AS REAL) * 100 / replace(results.fastestlaptime, ':', '') FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' ORDER BY results.milliseconds DESC LIMIT 1
SELECT count(circuitid) FROM circuits WHERE country = 'Australia' AND LOCATION = 'Adelaide'
SELECT lat, lng FROM circuits WHERE country = 'USA'
SELECT count(driverid) FROM drivers WHERE dob > '1980-12-31' AND nationality = 'British'
SELECT max(constructorresults.points) FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'British'
SELECT name FROM constructors WHERE constructorid IN (SELECT constructorid FROM constructorresults WHERE points = (SELECT max(points) FROM constructorresults));
SELECT name FROM constructors WHERE constructorid IN (SELECT constructorid FROM constructorstandings WHERE raceid = 291 AND points = 0);
SELECT count(constructorresults.constructorid) FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'Japanese' AND constructorresults.points = 0 GROUP BY constructorresults.constructorid HAVING count(constructorresults.raceid) = 2
SELECT name FROM constructors WHERE constructorid IN (SELECT constructorid FROM results WHERE rank = 1);
SELECT count(results.constructorid) FROM results INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE results.laps > 50 AND constructors.nationality = 'French'
SELECT cast(sum(CASE WHEN races.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / count(drivers.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.nationality = 'Japanese'
SELECT avg(cast(replace(substr(results.time, 2), ':', '') AS REAL)) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year < 1975 AND results.time IS NOT NULL
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.dob > '1975-12-31' AND results.rank = 2
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers LEFT JOIN results results ON drivers.driverid = results.driverid WHERE drivers.nationality = 'Italian' AND results.time IS NULL;
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY results.fastestlaptime DESC LIMIT 1
SELECT fastestlap FROM results WHERE YEAR = 2009 ORDER BY fastestlap DESC LIMIT 1
SELECT avg(results.fastestlapspeed) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009
SELECT races.name, races.year FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid WHERE laptimes.milliseconds IS NOT NULL ORDER BY laptimes.milliseconds ASC LIMIT 1
SELECT cast(sum(CASE WHEN races.year < drivers.dob AND results.laps > 50 THEN 1 ELSE 0 END) AS REAL) * 100 / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.year BETWEEN 2000 AND 2005
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN laptimes laptimes ON drivers.driverid = laptimes.driverid WHERE drivers.nationality = 'French' AND laptimes.time < '02:00:00';
SELECT code FROM drivers WHERE nationality = 'American'
SELECT raceid FROM races WHERE substr(YEAR, 1, 4) = '2009';
SELECT count(DISTINCT driverid) FROM driverstandings WHERE raceid = 18;
SELECT count(code) FROM drivers WHERE nationality = 'Netherlands' AND driverid IN (SELECT driverid FROM driverstandings WHERE POSITION = 1 ORDER BY driverid DESC LIMIT 3);
SELECT driverref FROM drivers WHERE forename = 'Robert' AND surname = 'Kubica'
SELECT count(driverid) FROM drivers WHERE strftime('%Y', dob) = '1980' AND nationality = 'British'
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE drivers.nationality = 'German' AND strftime('%Y', drivers.dob) BETWEEN '1980' AND '1990' ORDER BY laptimes.time ASC LIMIT 3
SELECT driverref FROM drivers WHERE nationality = 'German' ORDER BY dob LIMIT 1
SELECT d.driverid, d.code FROM drivers d JOIN results r ON d.driverid = r.driverid WHERE d.dob LIKE '1971%' AND r.fastestlaptime IS NOT NULL;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE drivers.nationality = 'Spanish' AND drivers.dob < '1982-01-01' ORDER BY laptimes.time DESC LIMIT 10
SELECT DISTINCT races.year FROM races INNER JOIN results ON races.raceid = results.raceid WHERE results.fastestlaptime IS NOT NULL
SELECT DISTINCT races.year FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid ORDER BY cast(replace(substr(laptimes.time, 2), ':', '') AS REAL) DESC LIMIT 1
SELECT driverid FROM results ORDER BY fastestlaptime LIMIT 5
SELECT count(results.raceid) FROM results INNER JOIN status ON results.statusid = status.statusid WHERE status.status = 'Disqualified' AND results.raceid BETWEEN 50 AND 100
SELECT name, location, lat, lng FROM circuits WHERE country = 'Austria'
SELECT results.number FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.time IS NOT NULL GROUP BY results.number ORDER BY count(results.number) DESC LIMIT 1
SELECT drivers.driverref, drivers.nationality, drivers.dob FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 23 AND qualifying.q2 IS NOT NULL
SELECT races.year, races.date, races.time FROM qualifying INNER JOIN races ON qualifying.raceid = races.raceid INNER JOIN drivers ON qualifying.driverid = drivers.driverid ORDER BY drivers.dob LIMIT 1
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN status status ON results.statusid = status.statusid WHERE drivers.nationality = 'American' AND status.status = 'Puncture';
SELECT constructors.name, constructors.url FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructors.nationality = 'Italian' ORDER BY constructorresults.points DESC LIMIT 1
SELECT constructors.url FROM constructors INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid GROUP BY constructors.url ORDER BY sum(constructorstandings.wins) DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'French Grand Prix' ORDER BY results.time DESC LIMIT 1
SELECT races.raceid, results.milliseconds FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT cast(sum(results.fastestlaptime) AS REAL) / count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.year = 2006 ORDER BY results.rank ASC LIMIT 10
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.nationality = 'German' AND drivers.dob BETWEEN '1980-01-01' AND '1985-12-31' GROUP BY drivers.driverid ORDER BY sum(cast(pitstops.duration AS REAL)) / count(pitstops.duration) ASC LIMIT 3
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Canadian Grand Prix' AND races.year = 2008 ORDER BY results.milliseconds DESC LIMIT 1
SELECT constructors.constructorref, constructors.url FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE races.year = 2009 ORDER BY races.time DESC LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid WHERE drivers.dob BETWEEN '1981-01-01' AND '1991-12-31' AND drivers.nationality = 'Austrian'
SELECT forename, surname, url, dob FROM drivers WHERE nationality = 'German' AND dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY dob DESC
SELECT LOCATION, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT results.points, constructors.name, constructors.nationality FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON constructors.constructorid = results.constructorid WHERE races.year BETWEEN 1980 AND 2010 AND races.name = 'Monaco Grand Prix' ORDER BY results.points DESC LIMIT 1
SELECT avg(results.points) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Turkish Grand Prix'
SELECT cast(count(DISTINCT raceid) AS REAL) / 10 FROM races WHERE strftime('%Y', date) BETWEEN '2000' AND '2010';
SELECT nationality FROM drivers GROUP BY nationality HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM drivers GROUP BY nationality));
SELECT wins FROM driverstandings WHERE POSITION = 91
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT circuits.location, circuits.country FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid ORDER BY races.date DESC LIMIT 1
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN races ON qualifying.raceid = races.raceid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2008 AND circuits.name = 'Marina Bay Street Circuit' ORDER BY qualifying.q3 LIMIT 1
SELECT drivers.forename, drivers.surname, drivers.nationality, races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid ORDER BY drivers.dob DESC LIMIT 1
SELECT count(results.driverid) FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN status ON results.statusid = status.statusid WHERE races.name = 'Canadian Grand Prix' AND status.status = 'Accident'
SELECT driverstandings.wins, drivers.forename, drivers.surname FROM drivers INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid ORDER BY drivers.dob LIMIT 1
SELECT max(duration) FROM pitstops
SELECT races.time FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime DESC LIMIT 1
SELECT max(pitstops.duration) FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT pitstops.lap FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid INNER JOIN races ON pitstops.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.year = 2011
SELECT DISTINCT pitstops.duration FROM races INNER JOIN pitstops ON races.raceid = pitstops.raceid WHERE races.year = 2011 AND races.name = 'Australian Grand Prix'
SELECT results.laps FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT drivers.forename, drivers.surname FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid ORDER BY laptimes.time LIMIT 20
SELECT results.position FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.fastestlaptime LIMIT 1
SELECT results.time FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Austrian Grand Prix'
SELECT DISTINCT laptimes.time FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN laptimes ON races.raceid = laptimes.raceid WHERE circuits.country = 'Italy'
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid WHERE races.name = 'Austrian Grand Prix' ORDER BY results.milliseconds LIMIT 1
SELECT pitstops.duration FROM races INNER JOIN pitstops ON races.raceid = pitstops.raceid WHERE races.name = 'Austrian Grand Prix'
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN laptimes ON circuits.circuitid = laptimes.raceid WHERE laptimes.time = '1:29.488'
SELECT avg(pitstops.milliseconds) FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton'
SELECT avg(milliseconds) FROM laptimes WHERE raceid IN (SELECT raceid FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE country = 'Italy');
SELECT player_api_id FROM player_attributes ORDER BY overall_rating DESC LIMIT 1
SELECT height, player_name FROM player WHERE height = ( SELECT max(height) FROM player )
SELECT preferred_foot FROM player_attributes WHERE potential = ( SELECT min(potential) FROM player_attributes )
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating BETWEEN 60 AND 65 AND player_attributes.defensive_work_rate LIKE 'low'
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN MATCH ON player_attributes.player_api_id = MATCH.home_player_1 OR player_attributes.player_api_id = MATCH.home_player_2 OR player_attributes.player_api_id = MATCH.home_player_3 OR player_attributes.player_api_id = MATCH.home_player_4 OR player_attributes.player_api_id = MATCH.home_player_5 OR player_attributes.player_api_id = MATCH.home_player_6 OR player_attributes.player_api_id = MATCH.home_player_7 OR player_attributes.player_api_id = MATCH.home_player_8 OR player_attributes.player_api_id = MATCH.home_player_9 OR player_attributes.player_api_id = MATCH.home_player_10 OR player_attributes.player_api_id = MATCH.home_player_11 ORDER BY player_attributes.crossing DESC LIMIT 5
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2016/2017' GROUP BY league.name ORDER BY sum(MATCH.home_team_goal) - sum(MATCH.away_team_goal) DESC LIMIT 1
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.season = '2016/2017' AND MATCH.home_team_goal - MATCH.away_team_goal < 0 GROUP BY team.team_long_name ORDER BY count(team.team_long_name) ASC LIMIT 1
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player_attributes.penalties DESC LIMIT 10
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.away_team_api_id INNER JOIN league ON league.id = MATCH.league_id WHERE league.name = 'Scotland Premier League' AND MATCH.season = '2009/2010' GROUP BY team.team_long_name ORDER BY sum(MATCH.away_team_goal - MATCH.home_team_goal) DESC LIMIT 1
SELECT team_attributes.buildupplayspeed FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id ORDER BY team_attributes.buildupplayspeed DESC LIMIT 4
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2015/2016' GROUP BY league.name ORDER BY sum(CASE WHEN MATCH.home_team_goal = MATCH.away_team_goal THEN 1 ELSE 0 END) DESC LIMIT 1
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.sprint_speed >= 97 AND strftime('%Y', player_attributes.date) BETWEEN '2013' AND '2015'
SELECT league.name, count(match.league_id) FROM league INNER JOIN MATCH ON league.id = match.league_id GROUP BY league.name ORDER BY count(match.league_id) DESC LIMIT 1
SELECT avg(height) FROM player WHERE birthday BETWEEN '1990-01-01 00:00:00' AND '1995-12-31 23:59:59'
SELECT player_api_id FROM player_attributes WHERE substr(date, 1, 4) = '2010' AND overall_rating = (SELECT max(overall_rating) FROM player_attributes WHERE substr(date, 1, 4) = '2010');
SELECT team_fifa_api_id FROM team_attributes WHERE buildupplayspeed > 50 AND buildupplayspeed < 60
SELECT team.team_long_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE strftime('%Y', team_attributes.date) = '2012' AND team_attributes.buildupplaypassing IS NOT NULL GROUP BY team.team_long_name HAVING avg(team_attributes.buildupplaypassing) > 0
SELECT cast(sum(CASE WHEN player_attributes.preferred_foot = 'left' THEN 1 ELSE 0 END) AS REAL) * 100 / count(player_attributes.player_fifa_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', player.birthday) BETWEEN '1987' AND '1992'
SELECT league.name FROM league INNER JOIN MATCH ON league.id = MATCH.league_id GROUP BY league.name ORDER BY sum(MATCH.home_team_goal) + sum(MATCH.away_team_goal) DESC LIMIT 5
SELECT avg(player_attributes.long_shots) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ahmed Samir Farag'
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.height > 180 GROUP BY player.player_name ORDER BY avg(player_attributes.heading_accuracy) DESC LIMIT 10
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.date LIKE '2014%' AND team_attributes.buildupplaydribblingclass = 'Normal' ORDER BY team_attributes.chancecreationpassing DESC LIMIT 1
SELECT DISTINCT league.name FROM league league JOIN MATCH m ON league.id = m.league_id WHERE m.season = '2009/2010' AND m.home_team_goal > m.away_team_goal;
SELECT team_short_name FROM team WHERE team_long_name = 'Queens Park Rangers'
SELECT player_name FROM player WHERE substr(birthday, 1, 7) = '1970-10';
SELECT player_attributes.attacking_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Franco Zennaro'
SELECT team_attributes.buildupplaypositioningclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'ADO Den Haag'
SELECT player_attributes.heading_accuracy FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francois Affolter' AND player_attributes.date = '2014-09-18 00:00:00'
SELECT player_attributes.overall_rating FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Gabriel Tamas' AND strftime('%Y', player_attributes.date) = '2011'
SELECT count(*) FROM MATCH JOIN league ON match.league_id = league.id WHERE league.name = 'Scotland Premier League' AND match.season = '2015/2016';
SELECT preferred_foot FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player ORDER BY birthday DESC LIMIT 1);
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE potential = (SELECT max(potential) FROM player_attributes));
SELECT count(player_attributes.player_api_id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight < 130 AND player_attributes.preferred_foot = 'left'
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE chancecreationpassingclass = 'Risky');
SELECT player_attributes.defensive_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'David Wilson'
SELECT birthday FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT name FROM league WHERE country_id IN (SELECT id FROM country WHERE name = 'Netherlands');
SELECT avg(home_team_goal) FROM MATCH JOIN country ON match.country_id = country.id WHERE country.name = 'Poland' AND match.season = '2010/2011';
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id GROUP BY player.player_name ORDER BY avg(player_attributes.finishing) DESC LIMIT 1
SELECT player_name FROM player WHERE height > 180
SELECT count(id) FROM player WHERE strftime('%Y', birthday) > '1990'
SELECT count(*) FROM player WHERE player_name LIKE 'Adam%' AND weight > 170
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating > 80 AND strftime('%Y', date) BETWEEN '2008' AND '2010');
SELECT player_attributes.potential FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Doran'
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.preferred_foot = 'left'
SELECT team_long_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE buildupplayspeedclass = 'Fast');
SELECT team_attributes.buildupplaypassingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_short_name = 'CLB'
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE buildupplaypassing > 70);
SELECT avg(player_attributes.overall_rating) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.height > 170 AND strftime('%Y', player_attributes.date) BETWEEN '2010' AND '2015'
SELECT player_name FROM player WHERE height = ( SELECT min(height) FROM player )
SELECT country.name FROM league league JOIN country country ON league.country_id = country.id WHERE league.name = 'Italy Serie A';
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE buildupplayspeed = 31 AND buildupplaydribbling = 53 AND buildupplaypassing = 32);
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Aaron Doran');
SELECT count(*) FROM MATCH JOIN league ON match.league_id = league.id WHERE league.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', match.date) BETWEEN '2008-08' AND '2008-10';
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT home_team_api_id FROM MATCH WHERE home_team_goal = 10);
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.balance = 61 AND player_attributes.potential = 61
SELECT avg(CASE WHEN player.player_name = 'Abdou Diallo' THEN player_attributes.ball_control ELSE NULL END) - avg(CASE WHEN player.player_name = 'Aaron Appindangoye' THEN player_attributes.ball_control ELSE NULL END) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id
SELECT team_long_name FROM team WHERE team_short_name = 'GEN'
SELECT player_name FROM player WHERE player_name = 'Aaron Lennon' OR player_name = 'Abdelaziz Barrada' ORDER BY birthday LIMIT 1
SELECT player_name FROM player WHERE height = ( SELECT max(height) FROM player )
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'left' AND player_attributes.attacking_work_rate = 'low'
SELECT country.name FROM league league JOIN country country ON league.country_id = country.id WHERE league.name = 'Belgium Jupiler League';
SELECT league.name FROM league INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Germany'
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT count(DISTINCT player.id) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', player.birthday) < '1986' AND player_attributes.defensive_work_rate = 'high';
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE crossing = (SELECT max(crossing) FROM player_attributes));
SELECT player_attributes.heading_accuracy FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ariel Borysiuk'
SELECT count(DISTINCT player.id) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.height > 180 AND player_attributes.volleys > 70;
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.volleys > 70 AND player_attributes.dribbling > 70
SELECT count(*) FROM MATCH JOIN league ON match.league_id = league.id JOIN country ON league.country_id = country.id WHERE country.name = 'Belgium' AND match.season = '2008/2009';
SELECT long_passing FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player ORDER BY birthday ASC LIMIT 1);
SELECT count(*) FROM MATCH JOIN league ON match.league_id = league.id WHERE league.name = 'Belgium Jupiler League' AND substr(`date`, 1, 7) = '2009-04';
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2008/2009' GROUP BY league.name ORDER BY count(league.name) DESC LIMIT 1
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE strftime('%Y', birthday) < '1986');
SELECT cast((player_attributes.overall_rating - (SELECT overall_rating FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Paulin Puel') ) ) AS REAL) * 100 / (SELECT overall_rating FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Paulin Puel')) FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Ariel Borysiuk';
SELECT avg(team_attributes.buildupplayspeed) FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Heart of Midlothian'
SELECT avg(player_attributes.overall_rating) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Pietro Marino'
SELECT sum(player_attributes.crossing) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Lennox'
SELECT max(team_attributes.chancecreationpassing), team_attributes.chancecreationpassingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Ajax'
SELECT player_attributes.preferred_foot FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Abdou Diallo'
SELECT max(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Dorlan Pabon');
SELECT avg(match.away_team_goal) FROM team INNER JOIN league ON team.id = league.id INNER JOIN country ON league.country_id = country.id INNER JOIN MATCH ON team.team_api_id = MATCH.away_team_api_id WHERE team.team_long_name = 'Parma' AND country.name = 'Italy'
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.overall_rating = 77 AND player_attributes.date LIKE '2016-06-23%' ORDER BY player.birthday LIMIT 1
SELECT player_attributes.overall_rating FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Aaron Mooy' AND player_attributes.date LIKE '2016-02-04%'
SELECT player_attributes.potential FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francesco Parravicini' AND player_attributes.date = '2010-08-30'
SELECT player_attributes.attacking_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Francesco Migliore' AND player_attributes.date LIKE '2015-05-01%'
SELECT player_attributes.defensive_work_rate FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Kevin Berigaud' AND player_attributes.date = '2013-02-22 00:00:00'
SELECT player_attributes.date FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Kevin Constant' ORDER BY player_attributes.crossing DESC LIMIT 1
SELECT team_attributes.buildupplayspeedclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Willem II' AND team_attributes.date = '2011-02-22'
SELECT team_attributes.buildupplaydribblingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_short_name = 'LEI' AND team_attributes.date = '2015-09-10'
SELECT team_attributes.buildupplaypassingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'FC Lorient' AND team_attributes.date LIKE '2010-02-22%'
SELECT team_attributes.chancecreationpassingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'PEC Zwolle' AND team_attributes.date = '2013-09-20'
SELECT team_attributes.chancecreationcrossingclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Hull City' AND team_attributes.date = '2010-02-22'
SELECT team_attributes.defenceaggressionclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'Hannover 96' AND team_attributes.date LIKE '2015-09-10%'
SELECT avg(overall_rating) FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE player_name = 'Marko Arnautovic') AND date BETWEEN '2007-02-22' AND '2016-04-21';
SELECT cast((sum(CASE WHEN player.player_name = 'Landon Donovan' THEN player_attributes.overall_rating ELSE 0 END) - sum(CASE WHEN player.player_name = 'Jordan Bowery' THEN player_attributes.overall_rating ELSE 0 END)) AS REAL) * 100 / sum(CASE WHEN player.player_name = 'Landon Donovan' THEN player_attributes.overall_rating ELSE 0 END) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.date = '2013-07-12'
SELECT player_name FROM player ORDER BY height DESC LIMIT 1
SELECT player_api_id FROM player ORDER BY weight DESC LIMIT 10
SELECT player_name FROM player WHERE julianday(CURRENT_TIMESTAMP) - julianday(birthday) > 34
SELECT sum(match.home_team_goal) FROM player INNER JOIN MATCH ON player.player_api_id = MATCH.home_player_1 WHERE player.player_name = 'Aaron Lennon'
SELECT sum(CASE WHEN player.player_name = 'Daan Smith' THEN match.away_team_goal ELSE 0 END) + sum(CASE WHEN player.player_name = 'Filipe Ferreira' THEN match.away_team_goal ELSE 0 END) FROM player INNER JOIN MATCH ON player.player_api_id = MATCH.away_player_11 OR player.player_api_id = MATCH.away_player_10 OR player.player_api_id = MATCH.away_player_9 OR player.player_api_id = MATCH.away_player_8 OR player.player_api_id = MATCH.away_player_7 OR player.player_api_id = MATCH.away_player_6 OR player.player_api_id = MATCH.away_player_5 OR player.player_api_id = MATCH.away_player_4 OR player.player_api_id = MATCH.away_player_3 OR player.player_api_id = MATCH.away_player_2 OR player.player_api_id = MATCH.away_player_1
SELECT sum(match.home_team_goal) FROM player INNER JOIN MATCH ON player.player_api_id = MATCH.home_player_11 OR player.player_api_id = MATCH.home_player_10 OR player.player_api_id = MATCH.home_player_9 OR player.player_api_id = MATCH.home_player_8 OR player.player_api_id = MATCH.home_player_7 OR player.player_api_id = MATCH.home_player_6 OR player.player_api_id = MATCH.home_player_5 OR player.player_api_id = MATCH.home_player_4 OR player.player_api_id = MATCH.home_player_3 OR player.player_api_id = MATCH.home_player_2 OR player.player_api_id = MATCH.home_player_1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE potential = (SELECT max(potential) FROM player_attributes));
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.attacking_work_rate = 'high'
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.finishing = 1 ORDER BY strftime('%J', CURRENT_TIMESTAMP) - strftime('%J', player.birthday) DESC LIMIT 1
SELECT player.player_name FROM player INNER JOIN league ON player.id = league.id INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Belgium'
SELECT country.name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id INNER JOIN league ON league.id = player.id INNER JOIN country ON country.id = league.country_id WHERE player_attributes.vision > 89
SELECT country.name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id INNER JOIN league ON league.id = player.player_api_id INNER JOIN country ON country.id = league.country_id GROUP BY country.name ORDER BY avg(player.weight) DESC LIMIT 1
SELECT team_long_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE buildupplayspeedclass = 'Slow');
SELECT team_short_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE chancecreationpassingclass = 'Safe');
SELECT avg(player.height) FROM player INNER JOIN league ON player.id = league.id INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Italy'
SELECT player_name FROM player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT count(*) FROM player WHERE player_name LIKE 'Aaron%' AND strftime('%Y', birthday) > '1990';
SELECT sum(CASE WHEN id = 6 THEN jumping ELSE 0 END) - sum(CASE WHEN id = 23 THEN jumping ELSE 0 END) AS difference FROM player_attributes;
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'right' ORDER BY player_attributes.potential ASC LIMIT 5
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'left' AND player_attributes.crossing = 49
SELECT cast(count(id) AS REAL) * 100 / ( SELECT count(id) FROM player_attributes ) FROM player_attributes WHERE stamina > 80 AND strength > 80
SELECT country.name FROM league league JOIN country country ON league.country_id = country.id WHERE league.name = 'Poland Ekstraklasa';
SELECT MATCH.home_team_goal, MATCH.away_team_goal FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE league.name = 'Belgium Jupiler League' AND MATCH.date LIKE '2008-09-24%'
SELECT player_attributes.sprint_speed, player_attributes.agility, player_attributes.acceleration FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.player_name = 'Alexis Blin'
SELECT team_attributes.buildupplayspeedclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'KSV Cercle Brugge'
SELECT count(DISTINCT m.id) FROM MATCH m JOIN league l ON m.league_id = l.id WHERE m.season = '2015/2016' AND l.name = 'Italian Serie A';
SELECT max(match.home_team_goal) FROM league league JOIN MATCH MATCH ON league.id = MATCH.league_id WHERE league.name = 'Netherlands Eredivisie';
SELECT player_attributes.finishing, player_attributes.curve FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight = (SELECT max(weight) FROM player);
SELECT league.name FROM league INNER JOIN MATCH ON league.id = MATCH.league_id WHERE MATCH.season = '2015/2016' GROUP BY league.name ORDER BY count(MATCH.id) DESC LIMIT 4
SELECT team.team_long_name FROM MATCH INNER JOIN team ON team.team_api_id = MATCH.away_team_api_id ORDER BY MATCH.away_team_goal DESC LIMIT 1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT cast(sum(CASE WHEN player.height < 180 AND player_attributes.overall_rating > 70 THEN 1 ELSE 0 END) AS REAL) * 100 / count(player.id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id), cast(sum(CASE WHEN admission = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE sex = 'M'
SELECT cast(sum(CASE WHEN strftime('%Y', birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE sex = 'F'
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE strftime('%Y', birthday) BETWEEN '1930' AND '1940'
SELECT cast(sum(CASE WHEN patient.admission = '+' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN patient.admission = '-' THEN 1 ELSE 0 END) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE'
SELECT laboratory.date FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.id = '30609'
SELECT patient.sex, patient.birthday, examination.`examination date`, examination.symptoms FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.id = '163109'
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ldh > 500
SELECT patient.id, strftime('%Y', 'now') - strftime('%Y', patient.birthday) AS age FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.rvvt = '+'
SELECT patient.id, patient.sex, patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.thrombosis = 2
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) = '1937' AND laboratory.`t-cho` > 250
SELECT patient.id, patient.sex, patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.alb < 3.5
SELECT cast(sum(CASE WHEN laboratory.tp < '6.0' OR laboratory.tp > '8.5' THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.tp) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F'
SELECT avg(examination.`acl igg`) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.admission = '+' AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', patient.birthday) >= 50
SELECT count(id) FROM patient WHERE admission = '-' AND sex = 'F' AND strftime('%Y', description) = '1997'
SELECT strftime('%Y', `first date`) - strftime('%Y', birthday) FROM patient ORDER BY strftime('%Y', `first date`) - strftime('%Y', birthday) DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND examination.thrombosis = 1 AND strftime('%Y', examination.`examination date`) = '1997'
SELECT max(strftime('%Y', birthday)) - min(strftime('%Y', birthday)) AS agegap FROM patient WHERE id IN (SELECT id FROM laboratory WHERE tg >= 200);
SELECT examination.symptoms, patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id ORDER BY patient.birthday DESC LIMIT 1
SELECT cast(count(laboratory.id) AS REAL) / 12 FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.sex = 'M' AND laboratory.`date` BETWEEN '1998-01-01' AND '1998-12-31'
SELECT laboratory.`date`, strftime('%Y', patient.birthday) - strftime('%Y', patient.`first date`) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SJS' ORDER BY patient.birthday LIMIT 1
SELECT cast(sum(CASE WHEN patient.sex = 'M' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN patient.sex = 'F' THEN 1 ELSE 0 END) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ua <= '8.0'
SELECT count(id) FROM patient WHERE id IN (SELECT id FROM examination WHERE strftime('%Y', `examination date`) - strftime('%Y', `first date`) < 1);
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.birthday) < '18' AND strftime('%Y', examination.`examination date`) BETWEEN '1990' AND '1993'
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.`t-bil` >= '2.0'
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`examination date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY patient.diagnosis ORDER BY count(patient.diagnosis) DESC LIMIT 1
SELECT avg(strftime('%Y', patient.birthday) - strftime('%Y', patient.`first date`)) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.date = '1991-10-01'
SELECT strftime('%Y', examination.`examination date`) - strftime('%Y', patient.birthday), patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id ORDER BY laboratory.hgb DESC LIMIT 1
SELECT ana FROM examination WHERE `examination date` = '1996-12-02' AND id = 3605340
SELECT CASE WHEN `t-cho` < 250 THEN 'Normal' ELSE 'Abnormal' END AS RESULT FROM laboratory WHERE id = 2927464 AND `date` = '1995-09-04';
SELECT sex FROM patient WHERE diagnosis = 'AORTITIS' LIMIT 1
SELECT "ACL IGM" FROM examination WHERE "Examination Date" = '1993-11-12' AND diagnosis = 'SLE' AND id IN (SELECT id FROM patient WHERE description = '1994-02-19');
SELECT patient.sex FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.date = '1992-06-12' AND laboratory.gpt = 9
SELECT (strftime('%Y', laboratory.`date`) - strftime('%Y', patient.birthday)) AS age FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ua = '8.4' AND laboratory.`date` = '1991-10-21'
SELECT count(laboratory.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE patient.`first date` = '1991-06-13' AND patient.diagnosis = 'SJS' AND laboratory.date LIKE '1991-09%'
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`examination date` = '1997-01-27' AND patient.diagnosis = 'SLE'
SELECT examination.symptoms FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.birthday = '1959-03-01' AND examination.`examination date` = '1993-09-27'
SELECT sum(CASE WHEN laboratory.date LIKE '1981-11%' AND patient.birthday = '1959-02-18' THEN laboratory.`t-cho` ELSE 0 END) - sum(CASE WHEN laboratory.date LIKE '1981-12%' AND patient.birthday = '1959-02-18' THEN laboratory.`t-cho` ELSE 0 END) AS decrease_rate FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.birthday = '1959-02-18'
SELECT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.description) BETWEEN '1997' AND '1998' AND patient.diagnosis = 'Behcet'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.date BETWEEN '1987-07-06' AND '1996-01-31' AND laboratory.gpt > 30 AND laboratory.alp < 4
SELECT id FROM patient WHERE sex = 'F' AND strftime('%Y', birthday) = '1964' AND admission = '+'
SELECT cast(sum(CASE WHEN `acl igm` > (SELECT avg(`acl igm`) FROM examination WHERE thrombosis = 2 AND `ana pattern` = 'S') THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM examination WHERE thrombosis = 2 AND `ana pattern` = 'S'
SELECT cast(sum(CASE WHEN laboratory.`u-pro` > 0 AND laboratory.`u-pro` < 30 AND laboratory.ua <= 6.5 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.id) FROM laboratory
SELECT cast(sum(CASE WHEN patient.diagnosis = 'BEHCET' THEN 1 ELSE 0 END) AS REAL) * 100 / count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.`first date`) = '1981' AND patient.sex = 'M'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`date` LIKE '1991-10%' AND laboratory.`t-bil` < 2 AND patient.admission = '-'
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND patient.birthday BETWEEN '1980-01-01' AND '1989-12-31' AND examination.`ana pattern` != 'P'
SELECT patient.sex FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'PSS' AND laboratory.crp > 2 AND laboratory.cre = 1 AND laboratory.ldh = 123
SELECT avg(laboratory.alb) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND laboratory.plt > 400 AND patient.diagnosis = 'SLE'
SELECT symptoms FROM examination WHERE diagnosis = 'SLE' GROUP BY symptoms ORDER BY count(symptoms) DESC LIMIT 1
SELECT description, diagnosis FROM patient WHERE id = 48473
SELECT count(id) FROM patient WHERE sex = 'F' AND diagnosis = 'APS'
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE strftime('%Y', laboratory.`date`) = '1997' AND laboratory.tp < 6 OR laboratory.tp > 8.5
SELECT cast(sum(CASE WHEN examination.diagnosis = 'SLE' THEN 1 ELSE 0 END) AS REAL) * 100 / count(examination.id) FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.symptoms = 'thrombocytopenia'
SELECT cast(sum(CASE WHEN patient.sex = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(patient.sex) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.birthday) = '1980' AND patient.diagnosis = 'RA'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'M' AND examination.`examination date` BETWEEN '1995-01-01' AND '1997-12-31' AND patient.admission = '-' AND patient.diagnosis = 'Behcet'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND laboratory.wbc < 3.5;
SELECT strftime('%J', `examination date`) - strftime('%J', `first date`) FROM patient WHERE id = 821298
SELECT CASE WHEN laboratory.ua > 8.0 THEN 'Normal' ELSE 'Abnormal' END FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.id = 57266
SELECT laboratory.`date` FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.id = 48473 AND laboratory.got >= 60
SELECT patient.sex, patient.birthday, laboratory.date FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', laboratory.date) = '1994' AND laboratory.got < 60
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.gpt > 60
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.gpt > 60 ORDER BY patient.birthday ASC
SELECT avg(laboratory.ldh) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ldh < 500
SELECT patient.id, strftime('%Y', 'now') - strftime('%Y', birthday) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ldh BETWEEN 700 AND 900
SELECT patient.admission FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.alp < 300 AND patient.admission IN ('+', '-')
SELECT p.id, CASE WHEN l.alp < 300 THEN 'Normal' ELSE 'Abnormal' END AS status FROM patient p LEFT JOIN laboratory l ON p.id = l.id WHERE p.birthday = '1982-04-01';
SELECT patient.id, patient.sex, patient.`first date` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tp < 6.0
SELECT (laboratory.tp - 8.5) AS deviation FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND laboratory.tp > 8.5
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND (laboratory.alb < 3.5 OR laboratory.alb > 5.5) ORDER BY patient.birthday DESC
SELECT CASE WHEN alb BETWEEN 3.5 AND 5.5 THEN 'Normal' ELSE 'Abnormal' END FROM patient WHERE strftime('%Y', birthday) = '1982';
SELECT cast(sum(CASE WHEN patient.sex = 'F' AND laboratory.ua > 8.0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.ua) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id
SELECT avg(laboratory.ua) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ua < 8.0
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.un = 29
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'RA' AND laboratory.un < 30
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.cre >= 1.5
SELECT CASE WHEN (SELECT sum(CASE WHEN patient.sex = 'M' THEN 1 ELSE 0 END) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cre >= 1.5) > (SELECT sum(CASE WHEN patient.sex = 'F' THEN 1 ELSE 0 END) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cre >= 1.5) THEN 'True' ELSE 'False' END AS answer;
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id ORDER BY laboratory.`t-bil` DESC LIMIT 1
SELECT patient.sex, GROUP_CONCAT(DISTINCT laboratory.`t-bil`) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` >= 2.0 GROUP BY patient.sex
SELECT patient.id, laboratory.`t-cho` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id ORDER BY laboratory.`t-cho` DESC LIMIT 1
SELECT avg(strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', birthday)) FROM patient WHERE sex = 'M' AND `t-cho` >= 250
SELECT patient.id, patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg > 300
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg > 200 AND strftime('%Y', 'now') - strftime('%Y', patient.birthday) > 50
SELECT DISTINCT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.admission = '-' AND laboratory.cpk < 250
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) BETWEEN '1936' AND '1956' AND patient.sex = 'M' AND laboratory.cpk > 250
SELECT patient.id, patient.sex, (strftime('%Y', 'now') - strftime('%Y', birthday)) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu >= 180 AND laboratory.`t-cho` < 250
SELECT patient.id, laboratory.glu FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE strftime('%Y', patient.description) = '1991' AND laboratory.glu < 180
SELECT patient.id, patient.sex, patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.wbc < 3.5 OR laboratory.wbc > 9.0 GROUP BY patient.id, patient.sex, patient.birthday ORDER BY patient.birthday ASC
SELECT patient.diagnosis, (strftime('%Y', 'now') - strftime('%Y', patient.birthday)) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rbc < 3.5
SELECT patient.admission FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', patient.birthday) >= 50 AND laboratory.rbc BETWEEN 3.5 AND 6.0
SELECT p.id, p.sex FROM patient p JOIN laboratory l ON p.id = l.id WHERE p.admission = '-' AND l.hgb < 10;
SELECT patient.id, patient.sex FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE' AND laboratory.hgb BETWEEN 10 AND 17 ORDER BY patient.birthday LIMIT 1
SELECT patient.id, (strftime('%Y', 'now') - strftime('%Y', birthday)) AS age FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.hct >= 52 GROUP BY patient.id HAVING count(laboratory.id) > 2
SELECT avg(hct) FROM laboratory WHERE date LIKE '1991%' AND hct < 29
SELECT sum(CASE WHEN plt < 100 THEN 1 ELSE 0 END), sum(CASE WHEN plt > 400 THEN 1 ELSE 0 END) FROM laboratory
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', laboratory.`date`) = '1984' AND laboratory.plt BETWEEN 100 AND 400
SELECT cast(sum(CASE WHEN patient.sex = 'F' AND laboratory.pt >= 14 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.pt) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.`first date`) > '1992' AND laboratory.pt < 14
SELECT count(laboratory.aptt) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.aptt < 45 AND examination.`examination date` > '1997-01-01'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.aptt > 45 AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.wbc BETWEEN 3.5 AND 8.9 AND (laboratory.fg <= 150 OR laboratory.fg >= 450);
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.birthday > '1980-01-01' AND laboratory.fg BETWEEN 150 AND 450;
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(laboratory.`u-pro` AS INTEGER) > 30
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.`u-pro` BETWEEN 0 AND 30 AND patient.diagnosis = 'SLE'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.igg >= 2000
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE patient.id IN (SELECT patient.id FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.igg > 900 AND laboratory.igg < 2000) AND examination.symptoms IS NOT NULL;
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.iga BETWEEN 80 AND 500 ORDER BY laboratory.iga DESC LIMIT 1
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE strftime('%Y', patient.`first date`) >= '1990' AND examination.`acl iga` > 80 AND examination.`acl iga` < 500
SELECT patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`acl igm` > 40 OR examination.`acl igm` < 400 GROUP BY patient.diagnosis ORDER BY count(patient.diagnosis) DESC LIMIT 1
SELECT count(id) FROM patient WHERE id IN (SELECT id FROM laboratory WHERE crp = '+') AND description IS NULL
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(strftime('%Y', date) AS INT) - cast(strftime('%Y', birthday) AS INT) < 70 AND laboratory.cre >= 1.5
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.ra IN ('-', '+') AND examination.kct = '+'
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) > '1985' AND laboratory.ra IN ('-', '+')
SELECT p.id FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.rf < '20' AND strftime('%Y', 'now') - strftime('%Y', p.birthday) > 60;
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rf < '20' AND examination.thrombosis = '0'
SELECT count(DISTINCT patient.id) FROM examination INNER JOIN patient ON examination.id = patient.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.c3 > 35 AND examination.`ana pattern` = 'P'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.hct NOT BETWEEN 29 AND 52 ORDER BY examination.`acl iga` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'APS' AND laboratory.c4 > 10;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.rnp IN ('-', '+-') AND patient.admission = '+';
SELECT p.birthday FROM patient p JOIN laboratory l ON p.id = l.id WHERE l.rnp NOT IN ('-', '+');
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.sm IN ('-', '+-') AND examination.thrombosis = 0
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.sm NOT IN ('negative', '0') ORDER BY patient.birthday LIMIT 3
SELECT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.sc170 IN ('negative', '0') AND examination.`examination date` > '1997-01-01'
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.sc170 IN ('negative', '0') AND patient.sex = 'F' AND (examination.symptoms IS NULL OR examination.symptoms = '')
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ssa IN ('-','+') AND strftime('%Y', patient.`first date`) < '2000'
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ssa NOT IN ('negative', '0') ORDER BY patient.`first date` LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ssb IN ('-', '+-') AND patient.diagnosis = 'SLE'
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE patient.ssb IN ('negative', '0') AND examination.symptoms IS NOT NULL;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.centromea IN ('-', '+') AND laboratory.ssb IN ('-', '+') AND patient.sex = 'M'
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.dna >= 8
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.dna < 8 AND patient.description IS NULL
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.admission = '+' AND examination.`acl igg` BETWEEN 900 AND 2000
SELECT cast(sum(CASE WHEN laboratory.got >= 60 THEN 1 ELSE 0 END) AS REAL) * 100 / count(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE'
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.got < 60
SELECT min(patient.birthday) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.got >= 60
SELECT patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.gpt < 60 ORDER BY laboratory.gpt DESC LIMIT 3
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.got < 60 AND patient.sex = 'M'
SELECT min(`first date`) FROM patient WHERE id IN (SELECT id FROM laboratory WHERE ldh = (SELECT max(ldh) FROM laboratory WHERE ldh < 500));
SELECT patient.`first date` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.ldh >= 500 ORDER BY patient.`first date` DESC LIMIT 1
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.alp >= 300;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '-' AND laboratory.alp < 300;
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE cast(laboratory.tp AS REAL) < 6.0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SJS' AND laboratory.tp BETWEEN 6.0 AND 8.5;
SELECT e.`examination date` FROM laboratory l JOIN examination e ON l.id = e.id WHERE l.alb BETWEEN 3.5 AND 5.5 ORDER BY l.alb DESC LIMIT 1;
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.alb BETWEEN 3.5 AND 5.5 AND laboratory.tp BETWEEN 6.0 AND 8.5
SELECT examination.`acl igg`, examination.`acl igm`, examination.`acl iga` FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'F' AND laboratory.ua > 6.50 ORDER BY laboratory.ua DESC LIMIT 1
SELECT max(examination.ana) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.cre < 1.5
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.cre < 1.5 ORDER BY examination.`acl iga` DESC LIMIT 1
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` > 2 AND examination.`ana pattern` LIKE '%P%'
SELECT examination.ana FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.`t-bil` < 2.0 ORDER BY laboratory.`t-bil` DESC LIMIT 1
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.`t-cho` > 250 AND examination.kct = '-'
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.`t-cho` < 250 AND examination.`ana pattern` = 'P'
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE laboratory.tg < 200 AND examination.symptoms IS NOT NULL
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg < 200 ORDER BY laboratory.tg DESC LIMIT 1
SELECT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.thrombosis = 0 AND laboratory.cpk < 250
SELECT count(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.cpk < 250 AND (examination.kct = '+' OR examination.rvvt = '+' OR examination.lac = '+')
SELECT min(patient.birthday) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu > 180
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rbc BETWEEN 3.5 AND 6.0 AND patient.admission = '-'
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.plt > 100 AND patient.plt < 400 AND examination.diagnosis IS NOT NULL
SELECT laboratory.plt, patient.diagnosis FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.diagnosis = 'MCTD' AND laboratory.plt BETWEEN 100 AND 399
SELECT avg(laboratory.pt) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.pt < 14
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.thrombosis = 2 AND laboratory.pt < 14
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders'
SELECT count(DISTINCT member.member_id) FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering';
SELECT member.first_name, member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department'
SELECT count(DISTINCT attendance.link_to_member) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT member.phone FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT count(*) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium'
SELECT event.event_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id GROUP BY event.event_name ORDER BY count(attendance.link_to_event) DESC LIMIT 1
SELECT DISTINCT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT event.event_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean'
SELECT count(*) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE strftime('%Y', event.event_date) = '2019' AND member.first_name = 'Sacha' AND member.last_name = 'Harrison' AND event.type = 'Student_Club'
SELECT count(event.event_id) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.type = 'Meeting' GROUP BY attendance.link_to_event HAVING count(attendance.link_to_member) > 10
SELECT event.event_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE attendance.link_to_member NOT IN ( SELECT income.link_to_member FROM income ) GROUP BY attendance.link_to_event HAVING count(attendance.link_to_member) > 20
SELECT cast(count(attendance.link_to_member) AS REAL) / count(DISTINCT event.event_name) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE strftime('%Y', event.event_date) = '2020' AND event.type = 'Meeting'
SELECT expense_description FROM expense WHERE cost = ( SELECT max(cost) FROM expense )
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'
SELECT member.first_name, member.last_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud'
SELECT member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies'
SELECT zip_code.county FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'
SELECT sum(budget.spent) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN member ON budget.link_to_event = member.member_id WHERE event.event_name = 'September Meeting' AND budget.category = 'Food'
SELECT zip_code.city, zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'President'
SELECT member.first_name, member.last_name FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Illinois'
SELECT sum(budget.spent) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN member ON budget.link_to_event = member.member_id WHERE event.event_name = 'September Meeting' AND budget.category = 'Advertisement'
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE first_name = 'Pierce' AND last_name = 'Guidi');
SELECT sum(budget.amount) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'October Speaker'
SELECT e.approved FROM expense e JOIN attendance a ON e.link_to_member = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.expense_date = '2019-10-08' AND e.approved = 'true' AND e.event_name = 'October Meeting';
SELECT sum(e.cost) / 12 FROM expense e JOIN member m ON e.link_to_member = m.member_id WHERE m.first_name = 'Elijah' AND m.last_name = 'Allen';
SELECT sum(CASE WHEN strftime('%Y', event.event_date) = '2019' THEN budget.spent ELSE 0 END) - sum(CASE WHEN strftime('%Y', event.event_date) = '2020' THEN budget.spent ELSE 0 END) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event
SELECT LOCATION FROM event WHERE event_name = 'Spring Budget Review'
SELECT cost FROM expense WHERE expense_date = '2019-09-04' AND expense_description = 'Posters';
SELECT budget.remaining FROM budget INNER JOIN expense ON budget.budget_id = expense.link_to_budget WHERE budget.category = 'Food' ORDER BY budget.amount DESC LIMIT 1
SELECT notes FROM income WHERE date_received = '2019-09-14' AND source = 'Fundraising'
SELECT count(major_id) FROM major WHERE college = 'College of Humanities and Social Sciences'
SELECT phone FROM member WHERE first_name = 'Carlo' AND last_name = 'Jacobs'
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher'
SELECT sum(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'November Meeting'
SELECT sum(budget.amount) FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'September Speaker'
SELECT budget.event_status FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_date = '2019-08-20' AND expense.expense_description = 'Post Cards, Posters'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Brent' AND member.last_name = 'Thomason'
SELECT count(member.member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT zip_code.type FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT department FROM major WHERE major_id IN (SELECT link_to_major FROM member WHERE POSITION = 'President');
SELECT income.date_received FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Connor' AND member.last_name = 'Hilton' AND income.source = 'Dues'
SELECT member.first_name, member.last_name FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.source = 'Dues' ORDER BY income.date_received LIMIT 1
SELECT cast(sum(CASE WHEN event.event_name = 'Yearly Kickoff' THEN budget.amount ELSE 0 END) AS REAL) / sum(CASE WHEN event.event_name = 'October Meeting' THEN budget.amount ELSE 0 END) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement'
SELECT cast(sum(CASE WHEN budget.category = 'Parking' THEN budget.amount ELSE 0 END) AS REAL) * 100 / sum(budget.amount) FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'November Speaker'
SELECT sum(cost) FROM expense WHERE expense_description = 'Pizza'
SELECT count(city) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia'
SELECT department FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT zip_code.city, zip_code.county, zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Amy' AND member.last_name = 'Firth'
SELECT expense.expense_description FROM budget INNER JOIN expense ON budget.budget_id = expense.link_to_budget ORDER BY budget.remaining ASC LIMIT 1
SELECT member.first_name, member.last_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'October Meeting'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id GROUP BY major.college ORDER BY count(major.college) DESC LIMIT 1
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.phone = '809-555-3360'
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id ORDER BY budget.amount DESC LIMIT 1
SELECT expense.expense_description FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.position = 'Vice President'
SELECT count(DISTINCT attendance.link_to_member) FROM event event JOIN attendance attendance ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Women''s Soccer';
SELECT income.date_received FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Casey' AND member.last_name = 'Mason'
SELECT count(DISTINCT zip_code.city) FROM member member JOIN zip_code zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';
SELECT count(attendance.link_to_event) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240'
SELECT member.first_name, member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.status = 'Closed' ORDER BY budget.spent / budget.amount DESC LIMIT 1
SELECT count(member_id) FROM member WHERE POSITION = 'President'
SELECT max(spent) FROM budget;
SELECT count(event_id) FROM event WHERE strftime('%Y', event_date) = '2020' AND TYPE = 'Meeting'
SELECT sum(spent) FROM budget WHERE category = 'Food'
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member GROUP BY member.first_name, member.last_name HAVING count(attendance.link_to_event) > 7
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN major ON member.link_to_major = major.major_id WHERE event.event_name = 'Community Theater' AND major.major_name = 'Interior Design'
SELECT member.first_name, member.last_name FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina'
SELECT sum(income.amount) FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.first_name = 'Grant' AND member.last_name = 'Gilmour'
SELECT member.first_name, member.last_name FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.amount > 40
SELECT sum(expense.cost) FROM event INNER JOIN expense ON event.event_id = expense.link_to_budget WHERE event.event_name = 'Yearly Kickoff'
SELECT member.first_name, member.last_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN member ON member.member_id = budget.link_to_event WHERE event.event_name = 'Yearly Kickoff'
SELECT member.first_name, member.last_name, income.source FROM income INNER JOIN member ON income.link_to_member = member.member_id ORDER BY income.amount DESC LIMIT 1
SELECT event.event_name FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id ORDER BY expense.cost ASC LIMIT 1
SELECT cast(sum(CASE WHEN event.event_name = 'Yearly Kickoff' THEN expense.cost ELSE 0 END) AS REAL) * 100 / sum(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id
SELECT cast(sum(CASE WHEN major.major_name = 'Finance' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN major.major_name = 'Physics' THEN 1 ELSE 0 END) FROM member INNER JOIN major ON member.link_to_major = major.major_id
SELECT source FROM income WHERE date_received LIKE '2019-09%' GROUP BY source ORDER BY sum(amount) DESC LIMIT 1;
SELECT member.first_name, member.last_name, member.email FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Student Club Secretary'
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching'
SELECT count(DISTINCT attendance.link_to_member) FROM event event JOIN attendance attendance ON event.event_id = attendance.link_to_event WHERE event.event_name = 'Community Theater' AND strftime('%Y', event.event_date) = '2019';
SELECT count(attendance.link_to_event), member.link_to_major FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Luisa' AND member.last_name = 'Guidi'
SELECT avg(spent) FROM budget WHERE category = 'Food' AND event_status = 'Closed';
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' ORDER BY budget.spent DESC LIMIT 1
SELECT CASE WHEN EXISTS (SELECT 1 FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean' AND event.event_name = 'Women''s Soccer') THEN 'YES' ELSE 'NO' END AS answer;
SELECT cast(sum(CASE WHEN event.type = 'Community Service' THEN 1 ELSE 0 END) AS REAL) * 100 / count(event.event_id) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE strftime('%Y', event.event_date) = '2019'
SELECT expense.cost FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters'
SELECT t_shirt_size FROM member GROUP BY t_shirt_size ORDER BY count(t_shirt_size) DESC LIMIT 1
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.remaining < 0 AND event.status = 'Closed' ORDER BY budget.remaining ASC LIMIT 1
SELECT expense.expense_description, sum(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' AND expense.approved = 'true' GROUP BY expense.expense_description
SELECT sum(budget.amount), budget.category FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'April Speaker' GROUP BY budget.category ORDER BY sum(budget.amount) ASC
SELECT budget_id FROM budget WHERE category = 'Food' ORDER BY amount DESC LIMIT 1
SELECT budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' ORDER BY budget.amount DESC LIMIT 3
SELECT sum(cost) FROM expense WHERE expense_description = 'Parking'
SELECT sum(cost) FROM expense WHERE expense_date = '2019-08-20'
SELECT member.first_name, member.last_name, sum(expense.cost) FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.member_id = 'rec4BLdZHS2Blfp4v' GROUP BY member.first_name, member.last_name
SELECT DISTINCT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT DISTINCT expense.expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.t_shirt_size = 'X-Large'
SELECT zip FROM member WHERE member_id IN (SELECT link_to_member FROM expense WHERE cost < 50);
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Phillip' AND member.last_name = 'Cullen'
SELECT member.position FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business'
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium'
SELECT event.type FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.remaining > 30
SELECT DISTINCT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215'
SELECT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_date = '2020-03-24T12:00:00'
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT cast(sum(CASE WHEN member.position = 'Member' AND major.major_name = 'Business' THEN 1 ELSE 0 END) AS REAL) * 100 / count(member.member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id
SELECT DISTINCT budget.category FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215'
SELECT count(*) FROM income WHERE amount = 50
SELECT count(member_id) FROM member WHERE t_shirt_size = 'X-Large' AND POSITION = 'Member'
SELECT count(*) FROM major WHERE department = 'School of Applied Sciences, Technology and Education' AND college = 'College of Agriculture and Applied Sciences';
SELECT member.last_name, major.department, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'
SELECT DISTINCT budget.category FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.location = 'MU 215' AND EVENT.type = 'Guest Speaker' AND budget.spent = 0
SELECT zip_code.city, zip_code.state FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Electrical and Computer Engineering' AND member.position = 'Member'
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.position = 'Vice President' AND event.location = '900 E. Washington St.' AND event.type = 'Social'
SELECT member.last_name, member.position FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_date = '2019-09-10' AND expense.expense_description = 'Pizza'
SELECT member.last_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer' AND member.position = 'Member'
SELECT cast(sum(CASE WHEN income.amount = 50 THEN 1 ELSE 0 END) AS REAL) * 100 / count(income.amount) FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.t_shirt_size = 'Medium'
SELECT DISTINCT state FROM zip_code WHERE TYPE = 'PO Box';
SELECT zip_code.zip_code FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE zip_code.type = 'PO Box' AND zip_code.county = 'San Juan Municipio' AND zip_code.state = 'Puerto Rico'
SELECT event_name FROM event WHERE event_date BETWEEN '2019-03-15' AND '2020-03-20' AND TYPE = 'Game' AND status = 'Closed';
SELECT DISTINCT budget.link_to_event FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.cost > 50
SELECT attendance.link_to_member, attendance.link_to_event FROM expense INNER JOIN attendance ON expense.link_to_member = attendance.link_to_member WHERE expense.approved = 'true' AND expense.expense_date BETWEEN '2019-01-10' AND '2019-11-19'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO'
SELECT member.phone FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Agriculture and Applied Sciences' AND major.major_name = 'Business'
SELECT email FROM member WHERE member_id IN (SELECT link_to_member FROM expense WHERE expense_date BETWEEN '2019-09-10' AND '2019-11-19' AND cost > 20);
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Education & Human Services' AND major.major_name = 'Education'
SELECT cast(sum(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id
SELECT event_id, LOCATION, status FROM event WHERE event_date BETWEEN '2019-11-01' AND '2020-03-31';
SELECT expense_description FROM expense WHERE cost > ( SELECT avg(cost) FROM expense )
SELECT first_name, last_name FROM member WHERE t_shirt_size = 'X-Large'
SELECT cast(sum(CASE WHEN TYPE = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / count(zip_code) FROM zip_code
SELECT event_name, LOCATION FROM EVENT WHERE event_id IN (SELECT link_to_event FROM budget WHERE remaining > 0);
SELECT event.event_name, event.event_date FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.cost > 50 AND expense.cost < 100 AND expense.expense_description = 'Pizza'
SELECT member.first_name, member.last_name, major.major_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member INNER JOIN major ON member.link_to_major = major.major_id WHERE expense.cost > 100
SELECT zip_code.city, zip_code.county FROM income INNER JOIN member ON income.link_to_member = member.member_id INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE income.amount > 40
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.first_name, member.last_name HAVING count(expense.expense_id) > 1 ORDER BY sum(expense.cost) DESC LIMIT 1
SELECT avg(expense.cost) FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.position != 'Member'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event INNER JOIN expense ON budget.budget_id = expense.link_to_budget WHERE budget.category = 'Parking' AND expense.cost < ( SELECT avg(cost) FROM expense )
SELECT cast(sum(expense.cost) AS REAL) * 100 / count(event.event_id) FROM event INNER JOIN expense ON event.event_id = expense.link_to_budget WHERE event.type = 'Meeting'
SELECT budget.budget_id FROM budget INNER JOIN expense ON budget.budget_id = expense.link_to_budget WHERE expense.expense_description = 'Water, chips, cookies' ORDER BY expense.cost DESC LIMIT 1
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member ORDER BY expense.cost DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > ( SELECT avg(cost) FROM expense )
SELECT cast((sum(CASE WHEN zip_code.state = 'New Jersey' THEN 1 ELSE 0 END) - sum(CASE WHEN zip_code.state = 'Vermont' THEN 1 ELSE 0 END)) AS REAL) * 100 / count(*) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Member'
SELECT major.major_name, major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, expense.cost FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT member.last_name, member.phone FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education'
SELECT budget.category, budget.amount FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'January Speaker'
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '2019-09-09'
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT member.first_name, member.last_name, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary'
SELECT sum(budget.spent), event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Speaker Gifts'
SELECT zip_code.city FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke'
SELECT member.first_name, member.last_name, member.position FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.city = 'Lincolnton' AND zip_code.state = 'North Carolina' AND member.zip = 28092
SELECT count(gasstationid) FROM gasstations WHERE country = 'CZE' AND segment = 'Premium'
SELECT cast(sum(iif(currency = 'EUR', 1, 0)) AS REAL) / sum(iif(currency = 'CZK', 1, 0)) FROM customers
SELECT customers.customerid FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE strftime('%Y', YEARMONTH.date) = '2012' AND customers.segment = 'LAM' ORDER BY YEARMONTH.consumption ASC LIMIT 1
SELECT sum(yearmonth.consumption) / 12 FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'SME' AND substr(yearmonth.date, 1, 4) = '2013'
SELECT customers.customerid FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE strftime('%Y', YEARMONTH.date) = '2011' AND customers.currency = 'CZK' ORDER BY YEARMONTH.consumption DESC LIMIT 1
SELECT count(DISTINCT customers.customerid) FROM customers customers JOIN yearmonth yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'KAM' AND strftime('%Y', yearmonth.date) = '2012' AND yearmonth.consumption < 30000;
SELECT sum(CASE WHEN customers.currency = 'CZK' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN customers.currency = 'EUR' THEN YEARMONTH.consumption ELSE 0 END) AS difference FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE substr(YEARMONTH.date, 1, 4) = '2012'
SELECT strftime('%Y', date) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR') GROUP BY strftime('%Y', date) ORDER BY count(strftime('%Y', date)) DESC LIMIT 1
SELECT segment FROM customers WHERE customerid IN (SELECT customerid FROM yearmonth GROUP BY customerid HAVING sum(consumption) = (SELECT min(sumconsumption) FROM (SELECT sum(consumption) AS sumconsumption FROM yearmonth GROUP BY customerid)))
SELECT substr(YEARMONTH.date, 1, 4) FROM YEARMONTH INNER JOIN transactions_1k ON substr(YEARMONTH.date, 1, 4) = strftime('%Y', transactions_1k.date) WHERE customers.currency = 'CZK' GROUP BY substr(YEARMONTH.date, 1, 4) ORDER BY sum(YEARMONTH.consumption) DESC LIMIT 1
SELECT YEARMONTH.date FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'SME' AND substr(YEARMONTH.date, 1, 4) = '2013' ORDER BY YEARMONTH.consumption DESC LIMIT 1
SELECT sum(CASE WHEN customers.segment = 'SME' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN customers.segment = 'SME' THEN YEARMONTH.consumption ELSE 0 END) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE substr(YEARMONTH.date, 1, 4) = '2013'
SELECT customers.segment, sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2013' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2012' THEN YEARMONTH.consumption ELSE 0 END) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.currency = 'EUR' GROUP BY customers.segment ORDER BY sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2013' THEN YEARMONTH.consumption ELSE 0 END) - sum(CASE WHEN substr(YEARMONTH.date, 1, 4) = '2012' THEN YEARMONTH.consumption ELSE 0 END) DESC LIMIT 1
SELECT sum(yearmonth.consumption) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE substr(yearmonth.date, 1, 4) = '2013' AND substr(yearmonth.date, 5, 2) BETWEEN '8' AND '11' AND customers.customerid = 6
SELECT (SELECT count(*) FROM gasstations WHERE country = 'CZE' AND segment = 'Discount') - (SELECT count(*) FROM gasstations WHERE country = 'SVK' AND segment = 'Discount') AS difference;
SELECT sum(CASE WHEN customerid = 7 THEN consumption ELSE 0 END) - sum(CASE WHEN customerid = 5 THEN consumption ELSE 0 END) FROM yearmonth WHERE date LIKE '201304%'
SELECT sum(iif(customers.currency = 'CZK', 1, 0)) - sum(iif(customers.currency = 'EUR', 1, 0)) AS diff FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE customers.segment = 'SME'
SELECT customers.customerid FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'LAM' AND customers.currency = 'EUR' AND substr(yearmonth.date, 1, 7) = '201310' ORDER BY yearmonth.consumption DESC LIMIT 1
SELECT customers.customerid, sum(YEARMONTH.consumption) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY sum(YEARMONTH.consumption) DESC LIMIT 1
SELECT sum(yearmonth.consumption) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'KAM' AND strftime('%Y-%m', yearmonth.date) = '201305'
SELECT cast(sum(CASE WHEN YEARMONTH.consumption > 46.73 THEN 1 ELSE 0 END) AS REAL) * 100 / count(customers.customerid) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'LAM'
SELECT country, count(*) AS num FROM gasstations WHERE segment = 'Value for money' GROUP BY country;
SELECT cast(sum(CASE WHEN customers.currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / count(customers.customerid) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE customers.segment = 'KAM'
SELECT cast(sum(CASE WHEN consumption > 528.3 THEN 1 ELSE 0 END) AS REAL) * 100 / count(customerid) FROM yearmonth WHERE date LIKE '201202%'
SELECT (count(*) * 100.0 / (SELECT count(*) FROM gasstations WHERE country = 'Slovakia')) AS percentage FROM gasstations WHERE country = 'Slovakia' AND segment = 'Premium';
SELECT customerid FROM yearmonth WHERE date = '201309' GROUP BY customerid ORDER BY sum(consumption) DESC LIMIT 1
SELECT customers.segment FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE YEARMONTH.date = '201309' ORDER BY YEARMONTH.consumption LIMIT 1
SELECT customers.customerid FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'SME' AND YEARMONTH.date = '201206' ORDER BY YEARMONTH.consumption LIMIT 1
SELECT max(consumption) FROM yearmonth WHERE date LIKE '2012%'
SELECT sum(yearmonth.consumption) / 12 FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'EUR'
SELECT DISTINCT products.description FROM products INNER JOIN yearmonth ON products.productid = yearmonth.customerid WHERE substr(yearmonth.date, 1, 4) = '2013' AND substr(yearmonth.date, 5, 2) = '09'
SELECT DISTINCT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date LIKE '201306%');
SELECT DISTINCT gasstations.chainid FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid INNER JOIN customers ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'EUR'
SELECT DISTINCT products.description FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN customers ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'EUR'
SELECT avg(price) FROM transactions_1k WHERE date LIKE '2012-01%'
SELECT count(customers.customerid) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.currency = 'EUR' AND YEARMONTH.consumption > 1000
SELECT DISTINCT products.description FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid INNER JOIN products ON transactions_1k.productid = products.productid WHERE gasstations.country = 'CZE'
SELECT DISTINCT transactions_1k.time FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.chainid = 11
SELECT count(transactions_1k.transactionid) FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.price > 1000
SELECT count(DISTINCT transactions_1k.transactionid) FROM gasstations gasstations JOIN transactions_1k transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date > '2012-01-01';
SELECT avg(transactions_1k.price) FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE'
SELECT avg(price) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR');
SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' GROUP BY customerid ORDER BY sum(amount) DESC LIMIT 1
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-25' GROUP BY gasstations.country ORDER BY count(DISTINCT transactions_1k.customerid) ASC LIMIT 1
SELECT DISTINCT customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.time = '16:25:00'
SELECT customers.segment FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-23' AND transactions_1k.time = '21:20:00'
SELECT sum(CASE WHEN transactions_1k.time < '13:00:00' AND customers.currency = 'CZK' AND transactions_1k.date = '2012-08-26' THEN 1 ELSE 0 END) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid
SELECT segment FROM customers WHERE customerid = (SELECT customerid FROM transactions_1k ORDER BY date ASC LIMIT 1);
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.time = '12:42:00'
SELECT productid FROM transactions_1k WHERE date = '2012-08-23' AND TIME = '21:20:00'
SELECT YEARMONTH.consumption, YEARMONTH.date FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.price = 124.05
SELECT count(DISTINCT transactions_1k.transactionid) FROM gasstations gasstations JOIN transactions_1k transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date = '2012-08-26' AND transactions_1k.time BETWEEN '08:00:00' AND '09:00:00';
SELECT customers.currency FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE YEARMONTH.date LIKE '201306%' AND YEARMONTH.consumption = 214582.17
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.cardid = 667467
SELECT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date = '2012-08-24' AND price = 548.4);
SELECT cast(sum(CASE WHEN customers.currency = 'EUR' THEN 1 ELSE 0 END) AS REAL) * 100 / count(customers.customerid) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-25'
SELECT ( SELECT consumption FROM yearmonth WHERE strftime('%Y', date) = '2013' AND customerid = ( SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' AND price = 634.8 ) ) / ( SELECT consumption FROM yearmonth WHERE strftime('%Y', date) = '2012' AND customerid = ( SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' AND price = 634.8 ) ) AS decreaserate
SELECT gasstations.gasstationid FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid GROUP BY gasstations.gasstationid ORDER BY sum(transactions_1k.amount) DESC LIMIT 1
SELECT cast(sum(CASE WHEN segment = 'Premium' THEN 1 ELSE 0 END) AS REAL) * 100 / count(segment) FROM gasstations WHERE country = 'SVK'
SELECT sum(t.amount), (SELECT consumption FROM yearmonth WHERE customerid = 38508 AND date = '201201') FROM transactions_1k t WHERE t.customerid = 38508;
SELECT description FROM products WHERE productid IN (SELECT productid FROM transactions_1k GROUP BY productid ORDER BY sum(amount) DESC LIMIT 5);
SELECT customers.customerid, sum(transactions_1k.price) / sum(transactions_1k.amount), customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid, customers.currency ORDER BY sum(transactions_1k.price) / sum(transactions_1k.amount) DESC LIMIT 1
SELECT gasstations.country FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE products.productid = 2 ORDER BY transactions_1k.price DESC LIMIT 1
SELECT consumption FROM yearmonth WHERE customerid IN (SELECT customerid FROM transactions_1k WHERE productid = 5 AND price / amount > 29) AND date = '201208';
