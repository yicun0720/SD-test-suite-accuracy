SELECT max(`free meal count (k-12)`) / max(`enrollment (k-12)`) FROM frpm WHERE `county name` = 'Alameda';
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopsname = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` ASC LIMIT 3;
SELECT schools.zip FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`charter school (y/n)` = 1 AND frpm.`county name` = 'Fresno' AND schools.county = 'Fresno';
SELECT mailstreet FROM schools WHERE cdscode = (SELECT cdscode FROM frpm WHERE `frpm count (k-12)` = (SELECT max(`frpm count (k-12)`) FROM frpm));
SELECT schools.phone FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school (y/n)` = 1 AND frpm.`charter funding type` = 'Directly funded' AND schools.fundingtype = 'Directly funded' AND schools.charter = 1;
SELECT count(schools.virtual) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath > 400 AND schools.virtual = 'F';
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.magnet = 1 AND satscores.numtsttakr > 500;
SELECT phone FROM schools WHERE cdscode = (SELECT cds FROM satscores WHERE numtsttakr >= 1500 ORDER BY numtsttakr DESC LIMIT 1);
SELECT satscores.numtsttakr FROM satscores JOIN frpm ON satscores.cds = frpm.cdscode WHERE frpm.`frpm count (k-12)` = (SELECT max(`frpm count (k-12)`) FROM frpm);
SELECT count(DISTINCT schools.cdscode) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 560 AND schools.charter = 1;
SELECT frpm.`frpm count (ages 5-17)` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE satscores.avgscrread = (SELECT max(avgscrread) FROM satscores);
SELECT frpm.cdscode FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`enrollment (k-12)` + frpm.`enrollment (ages 5-17)` > 500;
SELECT max(`free meal count (ages 5-17)`) FROM frpm WHERE `enrollment (ages 5-17)` / `free meal count (ages 5-17)` > 0.3;
SELECT schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3;
SELECT ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`enrollment (ages 5-17)` IS NOT NULL ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5;
SELECT satscores.dname FROM satscores WHERE satscores.rtype = 'D' ORDER BY satscores.avgscrread DESC LIMIT 1;
SELECT count(*) FROM schools schools JOIN satscores satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Alameda' AND satscores.numtsttakr < 100;
SELECT frpm.`charter school number`, satscores.avgscrwrite FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE satscores.avgscrwrite > 499;
SELECT count(*) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.city = 'Fresno' AND satscores.numtsttakr <= 250;
SELECT schools.phone FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath = (SELECT max(avgscrmath) FROM satscores);
SELECT count(schools.school) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`low grade` = '9' AND frpm.`high grade` = '12' AND schools.county = 'Amador';
SELECT count(DISTINCT schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.city LIKE 'Los Angeles' AND schools.gsoffered LIKE 'K-12' AND frpm.`free meal count (k-12)` > 500 AND frpm.`free meal count (k-12)` < 700;
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Contra Costa' ORDER BY satscores.numtsttakr DESC LIMIT 1;
sql placeholder
SELECT sname FROM satscores INNER JOIN frpm ON satscores.cds = frpm.cdscode WHERE frpm.`free meal count (k-12)` / frpm.`enrollment (k-12)` > 0.1 AND satscores.numge1500 > 0;
SELECT DISTINCT fundingtype FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE cname = 'Riverside' AND avgscrmath > 400;
SELECT schools.school, schools.city, schools.state, schools.zip FROM schools INNER JOIN frpm ON frpm.cdscode = schools.cdscode INNER JOIN satscores ON satscores.cds = schools.cdscode WHERE satscores.enroll12 > 800 AND satscores.rtype = 'D' AND frpm.`county name` = 'Monterey' AND schools.city = 'Monterey';
SELECT sname, avgscrwrite FROM satscores INNER JOIN schools ON schools.cdscode = satscores.cds WHERE schools.closeddate > '1991-01-01' OR schools.closeddate < '2000-01-01';
SELECT schools.school, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE (frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)`) > (SELECT avg((frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)`)) FROM frpm);
SELECT schools.opendate FROM schools WHERE schools.edopsname = 'K-12' ORDER BY schools.opendate ASC LIMIT 1;
SELECT schools.city FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.enroll12 ASC LIMIT 5;
SELECT frpm.`free meal count (k-12)` / frpm.`enrollment (k-12)` AS eligible_free_rate FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`enrollment (k-12)` = (SELECT max(enroll12) FROM satscores WHERE rtype = 'D') AND schools.school = (SELECT max(sname) FROM satscores WHERE rtype = 'D');
SELECT `frpm count (k-12)` / `enrollment (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.soc = '66' GROUP BY frpm.cdscode ORDER BY `free meal count (k-12)` DESC LIMIT 5;
SELECT frpm.`school name`, frpm.`free meal count (ages 5-17)` FROM frpm WHERE frpm.`free meal count (ages 5-17)` >= 1900 AND frpm.`free meal count (ages 5-17)` <= 2000;
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm INNER JOIN schools ON schools.cdscode = frpm.cdscode WHERE schools.admfname1 = 'Kacey';
SELECT schools.admemail1 FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`charter school (y/n)` = 1 AND frpm.`enrollment (k-12)` = (SELECT min(frpm.`enrollment (k-12)`) FROM frpm WHERE frpm.`charter school (y/n)` = 1);
SELECT schools.admfname1, schools.admfname2, schools.admfname3 FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.numge1500 DESC LIMIT 3;
SELECT street, city, state, zip FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 / satscores.numtsttakr = (SELECT min(satscores.numge1500 / satscores.numtsttakr) FROM satscores);
SELECT schools.website FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Los Angeles' AND satscores.numtsttakr BETWEEN 2000 AND 3000;
SELECT avg(numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate LIKE '1980%';
SELECT phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE avgscrread = (SELECT min(avgscrread) FROM satscores WHERE dname = 'Fresno Unified');
SELECT schools.school FROM schools WHERE schools.virtual = 'F' ORDER BY schools.county LIMIT 5;
SELECT frpm.`school type` FROM satscores INNER JOIN frpm ON satscores.cds = frpm.cdscode WHERE satscores.avgscrmath = (SELECT max(avgscrmath) FROM satscores);
SELECT avg(satscores.avgscrmath), schools.county FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode GROUP BY schools.county ORDER BY avg(satscores.avgscrmath) ASC LIMIT 1;
SELECT schools.city, avg(satscores.avgscrwrite) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numtsttakr >= 1500 GROUP BY schools.city;
SELECT sname, avgscrwrite FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE admfname1 = 'Ricci';
SELECT * FROM schools WHERE doc = 31 AND soctype = 'State Special Schools';
SELECT count(schools.cdscode) / 12 FROM schools INNER JOIN frpm ON frpm.cdscode = schools.cdscode WHERE schools.doc = '52' AND schools.county = 'Alameda' AND schools.doctype = 'State Special Schools' AND frpm.`county code` = '01' AND frpm.`district code` = 10017;
SELECT cast(sum(CASE WHEN schools.doc = '54' THEN 1 ELSE 0 END) AS REAL) / cast(sum(CASE WHEN schools.doc = '52' THEN 1 ELSE 0 END) AS REAL) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE frpm.`county code` = '54';
SELECT DISTINCT schools.county, schools.school, schools.closeddate FROM schools WHERE schools.statustype = 'Closed' GROUP BY schools.county, schools.school, schools.closeddate ORDER BY count(*) DESC LIMIT 1;
SELECT schools.street FROM schools JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.soctype = 'K-12 Schools (Public)' AND satscores.avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE satscores.rtype = 'D') LIMIT 7;
SELECT schools.mailstreet, schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.rtype = 'D' AND satscores.avgscrread = ( SELECT min(avgscrread) FROM satscores );
SELECT count(*) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.mailcity = 'Lakeport' AND satscores.avgscrread + satscores.avgscrmath + satscores.avgscrwrite >= 1500;
SELECT sum(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.mailcity = 'Fresno';
SELECT schools.mailzip FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`school name` = 'FAME Public Charter' AND schools.admfname1 = 'Avetik';
SELECT cast(count(CASE WHEN schools.county = 'Colusa' THEN schools.school ELSE NULL END) AS REAL) / cast(count(CASE WHEN schools.county = 'Humboldt' THEN schools.school ELSE NULL END) AS REAL) FROM schools WHERE schools.mailstate = 'CA';
SELECT count(DISTINCT schools.school) FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.mailstate = 'CA' AND schools.city = 'San Joaquin';
sql placeholder
SELECT schools.phone, schools.ext FROM schools WHERE schools.zip = 95203-3704;
SELECT schools.website FROM schools WHERE schools.admfname1 = 'MIke' AND schools.admfname2 = 'Mike' OR schools.admfname1 = 'Dante' AND schools.admfname2 = 'Dante';
SELECT schools.website FROM schools WHERE schools.charter = 1 AND schools.virtual = 'P' AND schools.county = 'San Joaquin';
SELECT count(DISTINCT frpm.`charter school number`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.charter = 1 AND schools.city = 'Hickman' AND schools.doc = '52';
SELECT sum(frpm.`enrollment (k-12)`) FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.county = 'Los Angeles' AND frpm.`percent (%) eligible free (k-12)` < 0.18;
SELECT frpm.`charter school number`, frpm.`school name`, frpm.`district name` FROM frpm WHERE frpm.`charter school number` = '00D2';
SELECT count(*) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = '00D4' AND schools.mailcity = 'Hickman';
SELECT (count(DISTINCT schools.cdscode) * 100.0 / (SELECT count(DISTINCT cdscode) FROM schools WHERE county = 'Santa Clara')) AS percentage FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter funding type` = 'Locally funded' AND schools.county = 'Santa Clara';
SELECT count(schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.fundingtype = 'Directly Funded' AND frpm.`county name` = 'Stanislaus' AND satscores.cname = 'Stanislaus' AND satscores.enroll12 >= 0 AND satscores.enroll12 <= 398;
SELECT sum(satscores.enroll12) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.city = 'San Francisco' AND schools.closeddate = '1989-12-31';
SELECT schools.county FROM schools WHERE schools.closeddate BETWEEN '1980-01-01' AND '1989-12-31' AND schools.soc = '11' GROUP BY schools.county ORDER BY count(*) DESC LIMIT 1;
SELECT DISTINCT schools.ncesdist FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.soc = '31' AND schools.soctype = 'State Special Schools';
SELECT count(DISTINCT schools.school) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`county name` = 'Alpine' AND schools.closeddate IS NULL;
SELECT frpm.`district code` FROM frpm INNER JOIN schools ON frpm.`school code` = schools.cdscode WHERE schools.city = 'Fresno' AND schools.magnet = 0;
SELECT sum(frpm.`enrollment (ages 5-17)`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.edopscode = 'SSS' AND frpm.`academic year` = '2014-2015';
SELECT frpm.`free meal count (ages 5-17)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.mailstreet = 'PO Box 1040';
SELECT frpm.`low grade` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.ncesdist = '0613360' AND schools.edopscode = 'SPECON';
SELECT schools.eilname FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`nslp provision status` = 'Breakfast Provision 2' AND frpm.`county code` = 37;
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.eilcode = 'HS' AND frpm.`high grade` = '12' AND frpm.`low grade` = '9' AND satscores.cname = 'Merced';
SELECT schools.school, frpm.`percent (%) eligible frpm (ages 5-17)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.county = 'Los Angeles' AND schools.gsserved = 'K-12';
SELECT gsserved FROM schools WHERE city = 'Adelanto' GROUP BY gsserved ORDER BY COUNT(gsserved) DESC LIMIT 1;
SELECT schools.county , COUNT(*) FROM schools INNER JOIN frpm ON frpm.cdscode = schools.cdscode INNER JOIN satscores ON satscores.cds = schools.cdscode WHERE satscores.rtype = 'D' AND schools.virtual = 'F' GROUP BY schools.county ORDER BY COUNT(*) DESC LIMIT 1;
SELECT frpm.`school type`, frpm.`school name`, schools.latitude FROM frpm JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY schools.latitude DESC LIMIT 1;
SELECT schools.city , schools.latitude , schools.school FROM schools WHERE schools.state = 'CA' ORDER BY schools.latitude ASC LIMIT 1;
SELECT gsoffered FROM schools WHERE longitude = (SELECT max(ABS(longitude)) FROM schools);
SELECT schools.city, count(schools.cdscode) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`nslp provision status` = 'Multiple Provision Types' AND schools.gsoffered = 'K-8' GROUP BY schools.city;
SELECT admfname1 , district FROM schools GROUP BY admfname1 , district ORDER BY count(*) DESC LIMIT 2;
SELECT frpm.`district code`, frpm.`percent (%) eligible free (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.admfname1 = 'Alusine';
SELECT schools.district, schools.county, schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school number` = '40';
sql placeholder
SELECT schools.admemail1 FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numtsttakr DESC LIMIT 1;
SELECT count(DISTINCT account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND district.a3 = 'east Bohemia';
SELECT count(account.account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.a3 = 'Prague';
SELECT a13, a12 FROM district WHERE a13 > a12;
sql placeholder
SELECT count(*) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.a3 = 'north Bohemia' AND district.a11 > 8000;
SELECT account.account_id FROM client client JOIN account account ON client.client_id = account.account_id JOIN district district ON client.district_id = district.district_id WHERE client.gender = 'F' AND district.a11 = (SELECT MAX(a11) FROM district) AND client.birth_date > (SELECT MIN(birth_date) FROM client);
SELECT account.account_id FROM account account JOIN client client ON account.district_id = client.district_id JOIN district district ON client.district_id = district.district_id WHERE district.a11 = (SELECT max(a11) FROM district);
SELECT count(*) FROM disp WHERE type = 'OWNER';
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'DISPONENT';
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.date = '1997-01-01' ORDER BY loan.amount ASC LIMIT 1;
SELECT account_id FROM loan WHERE duration > 12 ORDER BY amount DESC LIMIT 1;
SELECT count(*) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date < '1950' AND district.a2 = 'Sokolov';
SELECT account.account_id FROM account WHERE account.date = '1995-01-01';
SELECT DISTINCT account_id FROM account WHERE date < '1997-01-01' AND account_id IN (SELECT account_id FROM trans WHERE amount > 3000);
SELECT client.client_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE card.issued = '1994-03-03';
SELECT account.date FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE trans.account_id = 840 AND trans.amount = 840;
SELECT district.district_id FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.date = '1994-08-25';
SELECT MAX(trans.amount) FROM trans INNER JOIN disp ON trans.trans_id = disp.disp_id INNER JOIN card ON disp.disp_id = card.disp_id WHERE card.issued = '1996-10-21';
SELECT gender FROM client WHERE birth_date = (SELECT max(birth_date) FROM client) AND district_id = (SELECT district_id FROM district WHERE a11 = (SELECT max(a11) FROM district));
SELECT trans.amount FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE loan.amount = (SELECT max(loan.amount) FROM loan) ORDER BY trans.date LIMIT 1;
SELECT count(DISTINCT client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.a2 = 'Jesenik' AND client.gender = 'F';
sql placeholder
SELECT count(account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a2 = 'Litomerice' AND account.date LIKE '1996%';
SELECT district.a2 FROM client client INNER JOIN district district ON client.district_id = district.district_id WHERE client.gender = 'F' AND client.birth_date = '1976-01-29';
SELECT client.birth_date FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE loan.loan_id = 98832;
SELECT client.client_id FROM client INNER JOIN district ON client.district_id = district.district_id WHERE district.a3 = 'Prague' LIMIT 1;
sql placeholder
SELECT ((loan.amount - trans.balance) / trans.balance) * 100 FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE loan.date = '1993-07-05' AND loan.status = 'A' AND trans.date = '1993-03-22' AND trans.date = '1998-12-27';
SELECT cast(sum(CASE WHEN loan.status = 'A' THEN loan.amount END) AS REAL) * 100 / sum(loan.amount) FROM loan;
SELECT cast(sum(iif(loan.amount < 100000, 1, 0)) AS REAL) * 100 / count(account.account_id) FROM loan INNER JOIN account ON loan.account_id = account.account_id;
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN district ON account.district_id = district.district_id WHERE account.frequency = 'POPLATEK PO OBRATU';
SELECT account.account_id, account.frequency FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a3 = 'east Bohemia' AND account.date BETWEEN '1995-01-01' AND '2000-12-31';
SELECT account.account_id, account.date FROM account INNER JOIN district ON district.district_id = account.district_id WHERE district.a2 = 'Prachatice';
SELECT district.a2, district.a3 FROM loan INNER JOIN account ON loan.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.loan_id = 4990;
SELECT account.account_id, district.a2, district.a3 FROM account INNER JOIN loan ON account.account_id = loan.account_id INNER JOIN district ON account.district_id = district.district_id WHERE loan.amount > 300000;
SELECT loan.loan_id, district.a3, district.a11 FROM loan JOIN district ON loan.account_id = district.district_id WHERE loan.duration = 60;
sql placeholder
SELECT cast(sum(CASE WHEN district.a2 = 'Decin' THEN 1 ELSE 0 END) AS REAL) * 100 / count(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE account.date = '1993-01-01';
SELECT account.account_id FROM account WHERE account.frequency = 'POPLATEK MESICNE';
SELECT district.a2 FROM district INNER JOIN client ON district.district_id = client.district_id WHERE client.gender = 'F' GROUP BY district.a2 ORDER BY COUNT(*) DESC LIMIT 9;
sql placeholder
SELECT count(DISTINCT client.client_id) FROM client client INNER JOIN disp disp ON client.client_id = disp.client_id INNER JOIN account account ON disp.account_id = account.account_id INNER JOIN card card ON disp.disp_id = card.disp_id INNER JOIN district district ON account.district_id = district.district_id WHERE district.a3 = 'South Bohemia' AND card.card_id IS NULL;
sql placeholder
SELECT avg(loan.amount) FROM client INNER JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'M';
SELECT district.district_id, district.a2, district.a13 FROM district WHERE district.a13 = (SELECT max(a13) FROM district);
SELECT count(account_id) FROM account WHERE district_id = (SELECT district_id FROM district ORDER BY a16 DESC LIMIT 1);
SELECT count(account.account_id) FROM account WHERE account.frequency = 'POPLATEK MESICNE' AND account.account_id IN ( SELECT trans.account_id FROM trans WHERE trans.operation = 'VYBER KARTOU' AND trans.balance < 0 );
SELECT count(loan.loan_id) FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK MESICNE' AND loan.amount >= 250000 AND loan.date BETWEEN '1995-01-01' AND '1997-12-31' AND loan.status = 'A';
SELECT count(account.account_id) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'C' AND account.district_id = 1;
SELECT count(*) FROM client WHERE gender = 'M' AND district_id = (SELECT district_id FROM district WHERE a15 = (SELECT max(a15) FROM district WHERE a2 = 'Hl.m. Praha'));
SELECT count(*) FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT count(account.account_id) FROM district INNER JOIN account ON district.district_id = account.district_id WHERE district.a2 = 'Pisek';
SELECT DISTINCT district.district_id FROM trans INNER JOIN account ON trans.account_id = account.account_id INNER JOIN district ON account.district_id = district.district_id WHERE trans.amount > 10000 AND trans.date = '1997-01-01';
sql placeholder
SELECT account.account_id FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN account ON disp.account_id = account.account_id WHERE card.type = 'gold';
SELECT avg(trans.amount) FROM trans INNER JOIN account ON trans.account_id = account.account_id WHERE trans.operation = 'VYBER KARTOU';
SELECT account.account_id FROM account JOIN trans ON account.account_id = trans.account_id WHERE trans.operation = 'VYBER KARTOU' AND trans.amount < (SELECT AVG(trans.amount) FROM trans WHERE trans.account_id = account.account_id AND trans.date = '1998-01-01');
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id INNER JOIN loan ON account.account_id = loan.account_id WHERE client.gender = 'F' AND disp.type = 'OWNER' AND loan.status = 'A';
SELECT count(DISTINCT account.account_id) FROM account account JOIN client client ON account.district_id = client.district_id JOIN district district ON client.district_id = district.district_id WHERE district.a3 = 'south Bohemia' AND client.gender = 'F';
sql placeholder
SELECT DISTINCT disp.type, district.a11 FROM disp INNER JOIN account ON disp.account_id = account.account_id INNER JOIN client ON disp.client_id = client.client_id INNER JOIN district ON account.district_id = district.district_id WHERE disp.type != 'OWNER' AND (district.a11 > 8000 AND district.a11 < 9000);
SELECT count(DISTINCT account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id INNER JOIN trans ON account.account_id = trans.account_id WHERE district.a3 = 'north Bohemia' AND trans.bank = 'AB';
SELECT a2 FROM district WHERE district_id IN (SELECT district_id FROM account WHERE account_id IN (SELECT account_id FROM trans WHERE type = 'VYDAJ'));
SELECT avg(a15) FROM district WHERE a15 > 4000 AND district_id IN (SELECT district_id FROM account WHERE date >= '1997-01-01') GROUP BY a3;
SELECT count(card_id) FROM card WHERE type = 'classic';
SELECT count(*) FROM client client JOIN district district ON client.district_id = district.district_id WHERE client.gender = 'M' AND district.a2 = 'Hl.m. Praha';
SELECT (count(type = 'gold' AND issued < '1998-01-01') / count(*)) * 100 FROM card;
SELECT client.client_id FROM loan INNER JOIN client ON loan.account_id = client.client_id ORDER BY loan.amount DESC LIMIT 1;
SELECT a15 FROM district WHERE district_id = (SELECT district_id FROM account WHERE account_id = 532);
sql placeholder
sql placeholder
SELECT count(account.account_id) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.amount < 200000;
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id WHERE disp.client_id = 13539;
SELECT district.a3 FROM district INNER JOIN client ON district.district_id = client.district_id WHERE client.client_id = 3541;
sql placeholder
sql placeholder
SELECT * FROM trans WHERE account_id IN ( SELECT account_id FROM account WHERE district_id = 5 );
SELECT count(account.account_id) FROM account JOIN district ON account.district_id = district.district_id WHERE district.a2 = 'Jesenik';
SELECT client.client_id FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN card ON disp.disp_id = card.disp_id WHERE card.issued > '1996-01-01' AND card.type = 'junior';
SELECT (count(CASE WHEN c.gender = 'F' THEN 1 END) * 100.0 / count(*)) AS percentage FROM client c JOIN disp d ON c.client_id = d.client_id JOIN account a ON d.account_id = a.account_id JOIN district d ON a.district_id = d.district_id WHERE d.a11 > 10000;
SELECT (sum(loan.amount) - sum(loan_1996.amount)) / sum(loan_1996.amount) * 100.0 AS growth_rate FROM loan loan JOIN loan loan_1996 ON loan.account_id = loan_1996.account_id JOIN client client ON loan.account_id = client.client_id WHERE client.gender = 'M' AND loan.date BETWEEN '1996-01-01' AND '1997-01-01';
SELECT count(*) FROM trans INNER JOIN card ON trans.trans_id = card.disp_id WHERE trans.date > '1995-01-01' AND trans.operation = 'VYBER KARTOU';
SELECT district.a16 - district.a15 AS diff FROM district WHERE district.a3 = 'north Bohemia';
SELECT count(*) FROM disp WHERE account_id BETWEEN 1 AND 10 AND type IN ('OWNER', 'DISPONENT');
SELECT frequency FROM account WHERE account_id = 3539;
SELECT substr(birth_date, 1, 4) FROM client WHERE client_id = 130;
SELECT count(account.account_id) FROM account INNER JOIN disp ON account.account_id = disp.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND disp.type = 'OWNER';
SELECT loan.amount, loan.payments FROM loan INNER JOIN disp ON loan.account_id = disp.account_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 992;
SELECT SUM(trans.amount) FROM client INNER JOIN trans ON client.client_id = trans.account_id WHERE client.client_id = 4 AND trans.account_id = 851;
SELECT card.type FROM card INNER JOIN disp ON card.disp_id = disp.disp_id INNER JOIN client ON disp.client_id = client.client_id WHERE client.client_id = 9;
sql placeholder
SELECT client.client_id FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district.a3 = 'east Bohemia';
SELECT client.client_id FROM client JOIN loan ON client.client_id = loan.account_id WHERE client.gender = 'F' ORDER BY loan.amount DESC LIMIT 3;
SELECT count(DISTINCT client.client_id) FROM client INNER JOIN account ON client.client_id = account.account_id INNER JOIN trans ON account.account_id = trans.account_id WHERE client.gender = 'M' AND client.birth_date BETWEEN '1974-01-01' AND '1976-12-31' AND trans.amount > 4000 AND trans.k_symbol = 'SIPO';
SELECT count(account.account_id) FROM account INNER JOIN district ON account.district_id = district.district_id WHERE district.a2 = 'Beroun' AND account.date > '1996-01-01';
SELECT count(DISTINCT card.card_id) FROM client client JOIN disp disp ON client.client_id = disp.client_id JOIN card card ON disp.disp_id = card.disp_id WHERE client.gender = 'F' AND card.type = 'junior';
sql placeholder
SELECT cast(sum(CASE WHEN client.gender = 'M' THEN 1.0 ELSE 0 END) AS REAL) * 100 / count(client.gender) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE';
SELECT count(client.client_id) FROM client INNER JOIN disp ON client.client_id = disp.client_id INNER JOIN account ON disp.account_id = account.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND disp.type = 'OWNER';
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 24 AND account.date < '1997-01-01' ORDER BY loan.amount LIMIT 1;
sql placeholder
SELECT count(DISTINCT client.client_id) FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.birth_date = '1920-01-01' AND district.a3 = 'east Bohemia';
SELECT count(account.account_id) FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND loan.duration = 24;
SELECT avg(loan.amount) FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE account.frequency = 'POPLATEK PO OBRATU' AND loan.status = 'C';
SELECT client.client_id, district.district_id FROM client INNER JOIN district ON client.district_id = district.district_id WHERE client.client_id NOT IN (SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.status = 'A');
SELECT client.client_id, client.birth_date FROM client INNER JOIN card ON client.client_id = card.card_id INNER JOIN disp ON client.client_id = disp.client_id WHERE card.type = 'gold' AND disp.type = 'OWNER';
SELECT bond_type FROM bond GROUP BY bond_type HAVING count(*) = (SELECT max(total) FROM (SELECT count(*) AS total FROM bond GROUP BY bond_type) t2);
SELECT count(*) FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'cl');
SELECT avg(atom.element = 'o') FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-';
sql placeholder
SELECT count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'na' AND molecule.label = '-';
sql placeholder
sql placeholder
SELECT count(bond.bond_id) FROM bond WHERE bond.bond_type = '#';
SELECT count(element) FROM atom WHERE element != 'br';
SELECT count(*) FROM molecule WHERE label = '+' AND molecule_id BETWEEN 'TR000' AND 'TR099';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c';
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9';
SELECT element FROM atom WHERE atom_id IN ( SELECT atom_id FROM connected WHERE bond_id IN ( SELECT bond_id FROM bond WHERE bond_type = '=' ) );
sql placeholder
SELECT bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'cl';
SELECT DISTINCT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '-';
sql placeholder
SELECT element FROM (SELECT element, count(*) AS cnt FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element) WHERE cnt = (SELECT min(cnt) FROM (SELECT count(*) AS cnt FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '-') GROUP BY element) tmp);
SELECT bond.bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = 'TR004_8' AND connected.atom_id2 = 'TR004_20';
SELECT DISTINCT molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element != 'sn';
sql placeholder
SELECT DISTINCT connected.atom_id, connected.atom_id2 FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';
SELECT connected.atom_id FROM connected INNER JOIN atom ON connected.atom_id2 = atom.atom_id WHERE atom.molecule_id = 'TR181';
SELECT cast(sum(CASE WHEN molecule.label = '+' AND atom.element = 'f' THEN 1 ELSE 0 END) AS REAL) * 100 / count(molecule.molecule_id) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id;
SELECT cast(sum(iif(bond.bond_type = '#', 1, 0)) AS REAL) * 100 / count(bond.bond_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE molecule.label = '+';
SELECT element FROM atom WHERE molecule_id = 'TR000' ORDER BY element ASC LIMIT 3;
SELECT connected.atom_id FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.molecule_id = 'TR001' AND bond.bond_id = 'TR001_2_6';
SELECT sum(label = '+') - sum(label = '-') AS difference FROM molecule;
SELECT atom_id FROM connected WHERE bond_id = 'TR000_2_5';
SELECT connected.bond_id FROM connected WHERE connected.atom_id2 = 'TR000_2';
SELECT molecule.molecule_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = ' = ' ORDER BY molecule.molecule_id ASC;
SELECT SUM(bond_type = '='), COUNT(bond_id) FROM bond WHERE molecule_id = 'TR008';
SELECT ROUND(100 * SUM(label = '+') / COUNT(molecule_id), 3) FROM molecule;
SELECT SUM(atom.element = 'h') / COUNT(atom.atom_id) AS percent FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR206';
SELECT bond.bond_type FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR000';
SELECT element, label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR060';
sql placeholder
SELECT molecule.molecule_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '-' GROUP BY molecule.molecule_id ORDER BY count(molecule.molecule_id) DESC LIMIT 3;
SELECT DISTINCT bond_id FROM bond WHERE molecule_id = 'TR006' ORDER BY bond_id ASC LIMIT 2;
SELECT count(bond.bond_id) FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.atom_id = 'TR009_12' OR connected.atom_id2 = 'TR009_12';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'br' AND molecule.label = '+';
SELECT bond_type, atom_id, atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR001_6_9';
SELECT molecule.molecule_id, molecule.label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR001_10';
SELECT count(DISTINCT molecule_id) FROM bond WHERE bond_type = '#';
SELECT count(DISTINCT connected.bond_id) FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.atom_id = 'TR000_19';
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR004';
SELECT count(*) FROM molecule WHERE label = '-';
SELECT DISTINCT molecule.molecule_id FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE SUBSTR(atom.atom_id, 7, 2) BETWEEN '21' AND '25' AND molecule.label = '+';
SELECT bond.bond_id FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'p' AND connected.atom_id2 = atom.atom_id AND atom.element = 'n';
SELECT molecule.label FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = ' = ' AND molecule.label = '+' GROUP BY molecule.label ORDER BY count(bond.bond_id) DESC LIMIT 1;
sql placeholder
SELECT bond.bond_type, bond.bond_id FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE SUBSTR(atom.atom_id, 7, 2) + 0 = 45;
SELECT DISTINCT atom.element FROM atom LEFT JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.atom_id IS NULL;
SELECT atom.atom_id FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR041' AND bond.bond_type = '#';
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR144_8_19';
SELECT molecule.molecule_id FROM molecule JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = ' = ' GROUP BY molecule.molecule_id ORDER BY count(bond.bond_id) DESC LIMIT 1;
SELECT element FROM (SELECT element, count(*) AS cnt FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element) WHERE cnt = (SELECT min(cnt) FROM (SELECT count(*) AS cnt FROM atom JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' GROUP BY element));
SELECT connected.atom_id FROM connected INNER JOIN atom ON connected.atom_id2 = atom.atom_id WHERE atom.element = 'pb';
SELECT atom.element FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';
sql placeholder
sql placeholder
SELECT count(*) FROM atom WHERE element IN ('c', 'h');
SELECT atom_id2 FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE element = 's';
sql placeholder
SELECT count(DISTINCT element) FROM atom WHERE molecule_id IN ( SELECT molecule_id FROM bond WHERE bond_type = '-' );
SELECT count(*) FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.label = '#' AND atom.element = 'p' OR atom.element = 'br';
SELECT bond_id FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';
sql placeholder
SELECT molecule.label FROM molecule WHERE molecule.molecule_id IN ('TR000', 'TR001', 'TR002');
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id = connected.atom_id2 AND bond.bond_type = '-';
SELECT count(*) FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR030' AND label = '+';
SELECT bond.bond_type FROM bond WHERE bond.molecule_id BETWEEN 'TR000' AND 'TR050';
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR001_10_11';
SELECT count(bond_id) FROM connected INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE atom.element = 'i';
SELECT label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE element = 'ca';
SELECT 'YES' FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_id = 'TR001_1_8' AND (atom.element = 'cl' OR atom.element = 'c');
SELECT molecule.molecule_id FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND bond.bond_type = '#' AND molecule.label = '-';
SELECT (count(DISTINCT CASE WHEN atom.element = 'cl' THEN molecule.molecule_id ELSE NULL END) * 100.0 / count(DISTINCT molecule.molecule_id)) AS percentage FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE molecule.label = '+';
SELECT atom.element FROM atom WHERE atom.molecule_id = 'TR001';
SELECT molecule_id FROM bond WHERE bond_type = ' = ';
SELECT DISTINCT connected.atom_id, connected.atom_id2 FROM connected INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_type = '#';
SELECT element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE bond_id = 'TR000_1_2';
SELECT count(*) FROM molecule molecule JOIN bond bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.label = '-';
sql placeholder
SELECT bond.bond_id , molecule.label FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '#';
SELECT count(CASE WHEN substr(atom.atom_id, 7, 1) = '4' AND molecule.label = '+' THEN atom.element END) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id;
SELECT SUM(atom.element = 'h') / COUNT(atom.element) AS ratio, molecule.label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.molecule_id = 'TR006' GROUP BY molecule.label;
SELECT label FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE element = 'ca' AND label = '+';
SELECT DISTINCT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'c');
SELECT element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE bond.bond_id = 'TR001_10_11';
SELECT cast(sum(CASE WHEN bond.bond_type = '#' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id;
SELECT SUM(CASE WHEN bond.bond_type = ' = ' THEN 1 ELSE 0 END) / COUNT(bond.bond_id) AS percent FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR047';
SELECT label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.atom_id = 'TR001_1';
SELECT label FROM molecule WHERE molecule_id = 'TR151';
SELECT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR151';
SELECT count(molecule.label) FROM molecule WHERE molecule.label = '+';
SELECT DISTINCT atom.atom_id FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.molecule_id BETWEEN 'TR010' AND 'TR050' AND atom.element = 'c';
SELECT count(atom.atom_id) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+';
SELECT bond_id FROM bond WHERE bond_type = '=' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+');
SELECT count(atom.atom_id) FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.label = '+' AND atom.element = 'h';
SELECT molecule.molecule_id FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id JOIN molecule molecule ON atom.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR000_1_2' AND atom.atom_id = 'TR000_1';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element LIKE 'c' AND molecule.label LIKE '-';
sql placeholder
SELECT label FROM molecule WHERE molecule_id = 'TR124';
SELECT atom_id FROM atom WHERE molecule_id = 'TR186';
SELECT bond.bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_id = 'TR007_4_19';
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id2 INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE connected.bond_id = 'TR001_2_4';
SELECT count(bond_id) FROM bond WHERE molecule_id = 'TR006' AND bond_type = '=';
SELECT a.element FROM atom a JOIN molecule m ON a.molecule_id = m.molecule_id WHERE m.label = '+';
SELECT bond.bond_id , connected.atom_id , connected.atom_id2 FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '-';
SELECT molecule.molecule_id, atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '#';
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR000_2_3';
SELECT count(bond.bond_id) FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id2 = atom.atom_id WHERE atom.element = 'cl';
SELECT atom.atom_id, count(bond.bond_type) FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id WHERE atom.molecule_id = 'TR346' GROUP BY atom.atom_id;
SELECT count(molecule.molecule_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = ' = ' AND molecule.label = '+';
sql placeholder
SELECT label FROM bond JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR001_2_4';
SELECT count(DISTINCT atom.atom_id) FROM atom WHERE atom.molecule_id = 'TR001';
SELECT count(*) FROM bond WHERE bond_type = '-';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'cl' AND molecule.label = '+';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c' AND molecule.label = '-';
SELECT cast(sum(CASE WHEN molecule.label = '+' AND atom.element = 'cl' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id;
SELECT molecule.molecule_id FROM bond INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_id = 'TR001_1_7';
SELECT count(DISTINCT atom.element) FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id2 WHERE connected.bond_id = 'TR001_3_4';
SELECT bond_type FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id WHERE connected.atom_id2 = 'TR000_1' AND connected.atom_id = 'TR000_2';
SELECT molecule_id FROM atom WHERE atom_id = 'TR000_2';
SELECT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.atom_id = 'TR000_1';
SELECT label FROM molecule WHERE molecule_id = 'TR000';
SELECT SUM(CASE WHEN bond.bond_type = '-' THEN 1 ELSE 0 END) / COUNT(bond.bond_id) AS percentage FROM bond;
SELECT count(*) FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'n' AND molecule.label = '+';
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.element = 's' AND bond.bond_type = ' = ';
SELECT molecule.molecule_id FROM molecule WHERE molecule.label = '-' GROUP BY molecule.molecule_id HAVING COUNT(molecule.molecule_id) > 5;
SELECT element FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id INNER JOIN molecule ON bond.molecule_id = molecule.molecule_id WHERE bond.bond_type = '=' AND molecule.molecule_id = 'TR024' GROUP BY element;
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE molecule.label = '+' GROUP BY molecule.molecule_id ORDER BY count(atom.molecule_id) DESC LIMIT 1;
SELECT cast(sum(iif(molecule.label = '+', 1, 0)) AS REAL) * 100.0 / count(molecule.molecule_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id INNER JOIN atom ON bond.molecule_id = atom.molecule_id AND bond.bond_id = atom.atom_id WHERE atom.element = 'h' AND bond.bond_type = '#';
SELECT count(molecule.molecule_id) FROM molecule WHERE molecule.label = '+';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND molecule.molecule_id BETWEEN 'TR004' AND 'TR010';
SELECT count(atom.element) FROM atom INNER JOIN bond ON atom.atom_id = bond.bond_id WHERE atom.molecule_id = 'TR008' AND atom.element = 'c';
SELECT DISTINCT atom.element FROM atom INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE atom.atom_id = 'TR004_7' AND molecule.label != '-';
SELECT count(molecule.molecule_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON atom.molecule_id = bond.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE atom.element = 'o' AND bond.bond_type = ' = ';
SELECT count(DISTINCT molecule.molecule_id) FROM molecule INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '#' AND molecule.label = '-';
SELECT atom.element, bond.bond_type FROM atom INNER JOIN bond ON atom.molecule_id = bond.molecule_id INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE molecule.molecule_id = 'TR002';
SELECT atom_id FROM atom WHERE molecule_id = 'TR012' AND element = 'c';
SELECT atom.atom_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON connected.bond_id = bond.bond_id WHERE molecule.label = '+' AND atom.element = 'o';
SELECT cards.name FROM cards WHERE cards.cardkingdomfoilid IS NOT NULL AND cards.cardkingdomid IS NOT NULL;
SELECT cards.asciiname FROM cards WHERE cards.bordercolor = 'borderless' AND cards.cardkingdomfoilid IS NULL;
SELECT name FROM cards WHERE faceconvertedmanacost = (SELECT MAX(faceconvertedmanacost) FROM cards);
SELECT name FROM cards WHERE edhrecrank < 100 AND frameversion = 2015;
sql placeholder
SELECT legalities.status FROM legalities JOIN cards ON legalities.uuid = cards.uuid WHERE cards.types = 'Artifact' AND cards.side IS NULL AND legalities.format = 'vintage';
SELECT cards.id, cards.artist FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.format = 'commander' AND legalities.status = 'Legal' AND cards.power = '*';
SELECT cards.id FROM cards WHERE cards.artist = 'Stephen Daniele';
SELECT text FROM rulings WHERE id = (SELECT id FROM cards WHERE name = 'Sublime Epiphany' AND number = '74s');
SELECT cards.name, cards.artist, rulings.text, rulings.date FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE ispromo = 1 GROUP BY cards.name, cards.artist, rulings.text, rulings.date ORDER BY count(rulings.uuid) DESC LIMIT 1;
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'annul' AND cards.number = '29';
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.isalternative = 1;
SELECT cast(sum(CASE WHEN set_translations.language = 'Chinese Simplified' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM set_translations WHERE set_translations.language = 'Chinese Simplified';
SELECT sets.totalsetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Italian';
SELECT count(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd';
SELECT keywords FROM cards WHERE name = 'Angel of Mercy' LIMIT 1;
SELECT count(*) FROM cards WHERE power = '*';
SELECT cards.promotypes FROM cards WHERE cards.name = 'Duress';
SELECT bordercolor FROM cards WHERE name = 'Ancestor''s Chosen';
SELECT cards.originaltype FROM cards WHERE cards.name = 'Ancestor''s Chosen';
SELECT language FROM set_translations WHERE setcode = (SELECT setcode FROM cards WHERE name = 'Angel of Mercy');
SELECT count(*) FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.istextless = 0;
SELECT rulings.text FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.name = 'Condemn';
SELECT count(legalities.id) FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Restricted' AND cards.isstarter = 1;
SELECT legalities.status FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE cards.name = 'Cloudchaser Eagle';
SELECT cards.type FROM cards WHERE name = 'Benalish Knight';
SELECT legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.name = 'Benalish Knight';
SELECT DISTINCT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian';
sql placeholder
SELECT count(*) FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.isreprint = 1;
sql placeholder
sql placeholder
SELECT count(id) FROM cards WHERE toughness = 99;
SELECT name FROM cards WHERE artist = 'Aaron Boyd';
SELECT count(cards.id) FROM cards WHERE bordercolor = 'black' AND availability = 'mtgo';
SELECT cards.id FROM cards WHERE cards.convertedmanacost = 0;
SELECT cards.layout FROM cards WHERE cards.keywords LIKE '%Flying%';
SELECT count(cards.id) FROM cards WHERE originaltype = 'Summon - Angel' AND subtypes != 'Angel';
SELECT cards.id FROM cards WHERE cards.cardkingdomfoilid IS NOT Null AND cards.cardkingdomid IS NOT Null;
SELECT cards.id FROM cards WHERE cards.dueldeck = 'a';
SELECT cards.edhrecrank FROM cards WHERE cards.frameversion = 2015;
SELECT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Chinese Simplified';
SELECT cards.name FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.language = 'Japanese' AND cards.availability = 'paper';
SELECT count(*) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'Banned' AND cards.bordercolor = 'white';
SELECT foreign_data.uuid, foreign_data.language FROM foreign_data INNER JOIN legalities ON foreign_data.uuid = legalities.uuid WHERE legalities.format = 'legacy';
SELECT rulings.text FROM rulings WHERE rulings.uuid = (SELECT cards.uuid FROM cards WHERE cards.name = 'Beacon of Immortality');
SELECT count(id) FROM cards WHERE frameversion = 'future';
SELECT cards.colors FROM sets INNER JOIN cards ON sets.code = cards.setcode WHERE sets.code = 'OGW';
SELECT set_translations.translation , foreign_data.language FROM set_translations INNER JOIN foreign_data ON set_translations.id = foreign_data.id INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE set_translations.setcode = '10E' AND cards.convertedmanacost = 5;
SELECT cards.name, rulings.date FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE cards.originaltype = 'Creature - Elf';
SELECT cards.colors, legalities.format FROM cards JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.id BETWEEN 1 and 20;
sql placeholder
SELECT name FROM cards WHERE rarity = 'uncommon' LIMIT 3;
SELECT count(*) FROM cards WHERE artist = 'John Avon' AND cardkingdomid IS NOT NULL AND cardkingdomfoilid IS NOT NULL;
SELECT count(*) FROM cards WHERE bordercolor = 'white' AND cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL;
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'UDON' AND cards.availability = 'mtgo' AND cards.hand = -1;
SELECT count(id) FROM cards WHERE frameversion = 1993 AND availability = 'paper' AND hascontentwarning = 1;
SELECT cards.manacost FROM cards WHERE cards.layout = 'normal' AND cards.frameversion = '2003' AND cards.bordercolor = 'black' AND cards.availability LIKE '%mtgo,paper%';
SELECT cast(sum(convertedmanacost) AS REAL) FROM cards WHERE artist = 'Rob Alexander';
SELECT type FROM cards WHERE availability = 'arena';
SELECT set_translations.setcode FROM set_translations WHERE set_translations.language = 'Spanish';
SELECT cast(( SELECT count(id) FROM cards WHERE frameeffects = 'legendary' AND isonlineonly = 1 ) AS REAL) * 100 / count(id) FROM cards WHERE frameeffects = 'legendary';
SELECT id FROM cards WHERE isstoryspotlight = 1 AND istextless = 0;
SELECT set_translations.translation, foreign_data.name FROM set_translations INNER JOIN foreign_data ON set_translations.id = foreign_data.id WHERE set_translations.language = 'Spanish';
SELECT set_translations.language FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.basesetsize = 309;
SELECT count(set_translations.setcode) FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.block = 'Commander' AND set_translations.language = 'Portuguese (Brasil)';
SELECT cards.id FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.status = 'legal' AND cards.types = 'Creature' AND cards.type = 'Creature';
SELECT foreign_data.type FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.subtypes IS NOT NULL AND cards.supertypes IS NOT NULL;
SELECT count(id) FROM cards WHERE power is null OR power = '*' AND text LIKE '%triggered ability%';
SELECT count(cards.id) FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE legalities.format = 'premodern' AND cards.side IS NULL;
sql placeholder
SELECT cards.artist FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.text = 'Das perfekte Gegenmittel zu einer dichten Formation';
SELECT foreign_data.name FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'French' AND cards.type = 'Creature' AND cards.bordercolor = 'black' AND cards.artist = 'Matthew D. Wilson';
SELECT count(*) FROM cards INNER JOIN rulings ON cards.uuid = rulings.uuid WHERE rulings.date = '2007-02-01' AND cards.rarity = 'rare';
SELECT set_translations.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.basesetsize = 180 AND sets.block = 'Ravnica';
sql placeholder
SELECT cast(sum(CASE WHEN foreign_data.language = 'French' AND cards.power IS NULL OR cards.power = '*' THEN 1 ELSE 0 END) AS REAL) * 100 / count(foreign_data.language) FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid;
SELECT cast(sum(CASE WHEN set_translations.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.type = 'expansion';
SELECT availability FROM cards WHERE artist = 'Daren Bader' LIMIT 1;
SELECT COUNT(*) FROM cards WHERE bordercolor = 'borderless' AND edhrecrank > 12000;
SELECT count(*) FROM cards WHERE isoversized = 1 AND isreprint = 1 AND ispromo = 1;
SELECT cards.name FROM cards WHERE cards.power IS NULL AND cards.promotypes = 'arenaleague' ORDER BY cards.name ASC LIMIT 3;
SELECT foreign_data.language FROM foreign_data WHERE foreign_data.multiverseid = 149934;
SELECT cards.id FROM cards WHERE cards.cardkingdomfoilid IS NOT NULL AND cards.cardkingdomid IS NOT NULL ORDER BY cards.cardkingdomfoilid ASC LIMIT 3;
SELECT cast(sum(CASE WHEN cards.istextless = 1 AND cards.layout = 'normal' THEN 1 ELSE 0 END) AS REAL) * 100 / count(cards.id) FROM cards;
SELECT id FROM cards WHERE subtypes = 'Wizard,Angel' AND side IS NULL;
SELECT sets.name FROM sets WHERE mtgocode IS NULL OR mtgocode = '' ORDER BY sets.name ASC LIMIT 3;
SELECT set_translations.language FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.name = 'Archenemy' AND sets.code = 'ARC';
SELECT set_translations.translation, sets.name FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE set_translations.id = 5;
SELECT set_translations.language, sets.type FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.id = 206;
sql placeholder
SELECT sets.id FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Japanese' AND sets.isforeignonly = 1 AND sets.isfoilonly = 1;
SELECT set_translations.translation FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE set_translations.language = 'Russian' GROUP BY set_translations.translation ORDER BY sets.basesetsize DESC LIMIT 1;
SELECT cast(count(CASE WHEN set_translations.language = 'Chinese Simplified' AND sets.isonlineonly = 1 THEN set_translations.id ELSE NULL END) AS REAL) * 100 / count(set_translations.id) FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code;
sql placeholder
SELECT count(*) FROM cards WHERE bordercolor = 'black';
SELECT count(cards.id) FROM cards WHERE cards.frameeffects = 'extendedart';
SELECT id FROM cards WHERE bordercolor = 'black' AND isfullart = 1;
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.id = 174;
SELECT sets.name FROM sets WHERE sets.code = 'ALL';
SELECT foreign_data.language FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'A Pedra Fellwar';
SELECT sets.code FROM sets WHERE sets.`releasedate` = '2007-07-13';
SELECT sets.basesetsize, sets.code FROM sets WHERE sets.name = 'Mirage' AND sets.block = 'Masques';
SELECT DISTINCT code FROM sets WHERE type = 'expansion';
SELECT foreign_data.name, cards.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'boros';
SELECT foreign_data.language, foreign_data.flavortext FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'colorpie';
SELECT COUNT(convertedmanacost = 16), COUNT(convertedmanacost) FROM cards WHERE name = 'Abyssal Horror';
SELECT t.code FROM sets AS t WHERE t.type = 'expansion' AND t.parentcode = 'commander';
SELECT foreign_data.name , cards.type FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.watermark = 'abzan';
SELECT language FROM foreign_data WHERE uuid IN (SELECT uuid FROM cards WHERE watermark = 'azorius');
SELECT count(cards.cardkingdomfoilid) FROM cards WHERE cards.artist = 'Aaron Miller' AND cards.cardkingdomfoilid IS NOT NULL AND cards.cardkingdomid IS NOT NULL;
SELECT count(*) FROM cards WHERE cards.availability LIKE '%paper%' AND cards.hand = '3';
SELECT name FROM cards WHERE istextless = 0;
SELECT cards.manacost FROM cards WHERE cards.name = 'Ancestor`s Chosen';
SELECT count(cards.power) FROM cards WHERE cards.bordercolor = 'white' AND (cards.power = '*' OR cards.power IS NULL);
SELECT name FROM cards WHERE ispromo = 1 AND side IS NOT NULL;
SELECT subtypes FROM cards WHERE name = 'Molimo, Maro-Sorcerer';
SELECT DISTINCT purchaseurls FROM cards WHERE promotypes = 'bundle';
SELECT count(cards.id) FROM cards WHERE cards.bordercolor = 'black' AND cards.availability LIKE '%arena,mtgo%';
SELECT CASE WHEN cards.convertedmanacost > 5.0 THEN 'Serra Angel' ELSE 'Shrine Keeper' END AS RESULT FROM cards ORDER BY convertedmanacost DESC LIMIT 1;
SELECT cards.artist FROM cards WHERE cards.flavorname = 'Battra, Dark Destroyer';
SELECT name FROM cards WHERE frameversion = '2003' ORDER BY convertedmanacost DESC LIMIT 3;
SELECT set_translations.translation FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE set_translations.language = 'Italian' AND sets.name = 'Ancestor''s Chosen';
SELECT count(set_translations.id) FROM set_translations INNER JOIN cards ON set_translations.setcode = cards.setcode WHERE cards.name LIKE 'Angel of Mercy';
SELECT cards.name FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.translation = 'Hauptset Zehnte Edition';
SELECT CASE WHEN set_translations.language = 'Korean' THEN 'YES' ELSE 'NO' END FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE set_translations.translation = 'Ancestor''s Chosen';
SELECT count(cards.artist) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN cards ON set_translations.id = cards.id WHERE sets.name = 'Hauptset Zehnte Edition' AND cards.artist = 'Adam Rex';
SELECT sets.basesetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Hauptset Zehnte Edition';
SELECT set_translations.translation FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.name = 'Eighth Edition' AND set_translations.language = 'Chinese Simplified';
SELECT 'YES' FROM cards WHERE cards.name = 'Angel of Mercy' AND cards.setcode IN (SELECT sets.code FROM sets WHERE sets.mtgocode IS NOT NULL) UNION SELECT 'NO' FROM cards WHERE cards.name = 'Angel of Mercy' AND cards.setcode NOT IN (SELECT sets.code FROM sets WHERE sets.mtgocode IS NOT NULL);
SELECT releasedate FROM sets WHERE name = 'Ancestor''s Chosen';
SELECT type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Hauptset Zehnte Edition';
SELECT count(DISTINCT sets.code) FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE sets.block = 'Ice Age' AND set_translations.language = 'Italian' AND set_translations.translation IS NOT NULL;
SELECT CASE WHEN sets.isforeignonly = 1 THEN 'YES' ELSE 'NO' END FROM sets INNER JOIN cards ON sets.code = cards.setcode WHERE cards.name = 'Adarkar Valkyrie';
SELECT count(DISTINCT sets.id) FROM foreign_data INNER JOIN set_translations ON foreign_data.uuid = set_translations.id INNER JOIN sets ON sets.code = set_translations.setcode WHERE foreign_data.language = 'Italian' AND sets.basesetsize < 10;
SELECT count(id) FROM cards WHERE name = 'Coldsnap' AND bordercolor = 'black';
SELECT cards.name FROM cards INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.translation = 'Coldsnap' ORDER BY cards.convertedmanacost DESC LIMIT 1;
SELECT cards.artist FROM cards INNER JOIN set_translations ON cards.id = set_translations.id WHERE set_translations.setcode = 'Coldsnap' AND cards.artist IN ('Jeremy Jarvis', 'Aaron Miller','Chippy');
SELECT cards.number FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Coldsnap' AND cards.number = 4;
SELECT count(*) FROM cards INNER JOIN set_translations ON cards.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.name = 'Coldsnap' AND cards.convertedmanacost > 5 AND cards.power = '*';
SELECT foreign_data.flavortext FROM foreign_data WHERE foreign_data.language = 'Italian' AND foreign_data.name = 'Ancestor''s Chosen';
SELECT foreign_data.language FROM foreign_data JOIN cards ON foreign_data.uuid = cards.uuid WHERE cards.name = 'Ancestor''s Chosen' AND cards.flavortext IS NOT NULL;
SELECT foreign_data.type FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'German' AND cards.name = 'Ancestor''s Chosen';
SELECT foreign_data.text FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.language = 'Italian' AND set_translations.translation = 'Coldsnap';
SELECT foreign_data.name FROM foreign_data INNER JOIN set_translations ON foreign_data.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE sets.name = 'Coldsnap' AND foreign_data.language = 'Italian' ORDER BY cards.convertedmanacost DESC LIMIT 1;
SELECT rulings.date FROM rulings INNER JOIN cards ON rulings.uuid = cards.uuid WHERE name = 'Reminisce';
SELECT SUM(CASE WHEN cards.name = 'Coldsnap' THEN cards.convertedmanacost = 7 ELSE 0 END) * 100 / SUM(cards.convertedmanacost = 7) FROM cards;
sql placeholder
SELECT code FROM sets WHERE releasedate = '2017-07-14';
SELECT sets.keyrunecode FROM sets WHERE sets.code = 'PKHC';
SELECT sets.mcmid FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'SS2';
SELECT mcmname FROM sets WHERE releasedate = '2017-06-09';
SELECT sets.type FROM sets WHERE sets.name = 'From the Vault: Lore';
SELECT parentcode FROM sets WHERE name = 'Commander 2014 Oversized';
SELECT CASE WHEN cards.hascontentwarning = 1 THEN 'YES' ELSE 'NO' END FROM cards WHERE cards.artist = 'Jim Pavelec';
SELECT releasedate FROM sets WHERE code IN (SELECT setcode FROM cards WHERE name = 'Evacuation');
SELECT sets.basesetsize FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Rinascita di Alara';
SELECT sets.type FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.translation = 'Huitième édition';
SELECT set_translations.translation FROM set_translations INNER JOIN foreign_data ON set_translations.id = foreign_data.id WHERE foreign_data.name = 'Tendo Ice Bridge';
SELECT count(DISTINCT set_translations.translation) FROM sets sets JOIN set_translations set_translations ON sets.code = set_translations.setcode WHERE sets.name = 'Tenth Edition';
SELECT translation FROM set_translations WHERE language = 'Japanese' AND setcode IN (SELECT setcode FROM cards WHERE name = 'Fellwar Stone');
SELECT cards.name FROM cards INNER JOIN sets ON sets.code = cards.setcode WHERE sets.name = 'Journey into Nyx Hero''s Path' ORDER BY cards.convertedmanacost DESC LIMIT 1;
SELECT sets.releasedate FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE translation = 'Ola de frío';
SELECT type FROM sets WHERE name IN (SELECT name FROM cards WHERE name = 'Samite Pilgrim');
SELECT count(cards.id) FROM cards INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'World Championship Decks 2004' AND cards.convertedmanacost = '3';
SELECT set_translations.translation FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE set_translations.language = 'Chinese Simplified' AND sets.name = 'Mirrodin';
SELECT cast(sum(CASE WHEN set_translations.language = 'Japanese' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM set_translations INNER JOIN sets ON set_translations.setcode = sets.code WHERE sets.isnonfoilonly = 1;
sql placeholder
SELECT availability FROM cards INNER JOIN sets ON cards.setcode = sets.code INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE cards.artist = 'Aleksi Briclot' AND istextless = 1;
SELECT id FROM sets WHERE basesetsize = (SELECT MAX(basesetsize) FROM sets);
SELECT artist FROM cards WHERE cards.side IS NULL ORDER BY cards.convertedmanacost DESC LIMIT 1;
SELECT frameeffects FROM cards WHERE cardkingdomfoilid IS NOT NULL AND cardkingdomid IS NOT NULL GROUP BY frameeffects ORDER BY COUNT(frameeffects) DESC LIMIT 1;
SELECT count(id) FROM cards WHERE (power IS NULL OR power = '*') AND hasfoil = 0 AND dueldeck = 'a';
SELECT id FROM sets WHERE type = 'commander' GROUP BY id ORDER BY MAX(totalsetsize) DESC LIMIT 1;
sql placeholder
SELECT originalreleasedate, format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE rarity = 'mythic' ORDER BY originalreleasedate ASC LIMIT 1;
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid INNER JOIN set_translations ON cards.setcode = set_translations.setcode WHERE set_translations.language = 'French' AND foreign_data.language = 'French' AND cards.artist = 'Volkan Baǵa';
SELECT count(CASE WHEN cards.rarity = 'rare' AND cards.types = 'Enchantment' AND legalities.status = 'Legal' THEN cards.id ELSE NULL END) FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE cards.name = 'Abundance';
SELECT legalities.format, cards.name FROM legalities INNER JOIN cards ON legalities.uuid = cards.uuid WHERE legalities.status = 'Banned' GROUP BY legalities.format ORDER BY COUNT(legalities.status = 'Banned') DESC LIMIT 1;
SELECT foreign_data.language FROM foreign_data INNER JOIN sets ON foreign_data.id = sets.id WHERE sets.name = 'Battlebond';
SELECT artist , format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE artist = (SELECT MIN(artist) FROM cards);
SELECT status FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid INNER JOIN rulings ON cards.uuid = rulings.uuid INNER JOIN sets ON cards.id = sets.id INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE frameversion = '1997' AND artist = 'D. Alexander Gregory' AND hascontentwarning = 1 AND format = 'legacy' AND set_translations.translation = 'Wizards of the Coast';
SELECT cards.name , legalities.format FROM cards INNER JOIN legalities ON legalities.uuid = cards.uuid WHERE edhrecrank = 1 AND status = 'Banned';
SELECT avg(id) FROM sets WHERE releasedate BETWEEN '2012-01-01' AND '2015-12-31';
SELECT cards.artist FROM cards WHERE cards.bordercolor = 'black' AND cards.availability = 'arena';
SELECT uuid FROM legalities WHERE format = 'oldschool' OR status = 'banned' OR status = 'restricted';
SELECT count(cards.id) FROM cards WHERE cards.artist = 'Matthew D. Wilson' AND availability = 'paper';
SELECT rulings.text FROM cards INNER JOIN rulings ON rulings.uuid = cards.uuid WHERE cards.artist = 'Kev Walker' ORDER BY rulings.date DESC;
SELECT cards.name, legalities.format FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid INNER JOIN sets ON cards.setcode = sets.code WHERE sets.name = 'Hour of Devastation' AND legalities.status = 'Legal';
SELECT sets.name FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode WHERE set_translations.language = 'Korean' AND NOT EXISTS ( SELECT * FROM set_translations WHERE set_translations.language = 'Japanese' AND set_translations.setcode = sets.code );
SELECT cards.artist, cards.frameversion FROM cards INNER JOIN legalities ON cards.uuid = legalities.uuid WHERE cards.artist = 'Allen Williams' AND legalities.status = 'Banned';
SELECT users.displayname FROM users WHERE users.displayname IN ('Harlan', 'Jarrod Dixon') ORDER BY users.reputation DESC LIMIT 1;
sql placeholder
SELECT count(*) FROM users WHERE lastaccessdate > '2014-09-01';
SELECT users.displayname FROM users WHERE users.views = (SELECT max(users.views) FROM users);
SELECT count(*) FROM users WHERE users.upvotes > 100 AND users.downvotes > 1;
sql placeholder
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie';
SELECT posts.title FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';
SELECT users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Eliciting priors from experts';
SELECT posts.title FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = "csgillespie" ORDER BY posts.viewcount DESC LIMIT 1;
SELECT users.displayname FROM posts posts INNER JOIN users users ON posts.owneruserid = users.id GROUP BY users.displayname ORDER BY posts.favoritecount DESC LIMIT 1;
SELECT sum(posts.commentcount) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie';
SELECT posts.answercount FROM posts WHERE posts.owneruserid = (SELECT users.id FROM users WHERE users.displayname = 'csgillespie') ORDER BY posts.answercount DESC LIMIT 1;
SELECT users.displayname FROM posts INNER JOIN users ON posts.lasteditoruserid = users.id WHERE posts.title = 'Examples for teaching: Correlation does not mean causation';
SELECT count(posts.id) FROM posts WHERE posts.owneruserid IN (SELECT users.id FROM users WHERE users.displayname = 'csgillespie') AND posts.parentid IS NULL;
SELECT users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE closeddate IS NOT NULL;
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.age > 65 AND posts.score >= 20;
SELECT users.location FROM users INNER JOIN posts ON posts.owneruserid = users.id WHERE posts.title = 'Eliciting priors from experts';
SELECT posts.body FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id WHERE tags.tagname = 'bayesian';
SELECT posts.body FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id ORDER BY tags.count DESC LIMIT 1;
SELECT count(DISTINCT id) FROM badges WHERE userid IN (SELECT id FROM users WHERE displayname = 'csgillespie');
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.displayname = 'csgillespie';
SELECT count(badges.id) FROM badges WHERE badges.userid = (SELECT users.id FROM users WHERE users.displayname = 'csgillespie') AND strftime('%Y', badges.date) = '2011';
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY badges.userid ORDER BY count(badges.id) DESC LIMIT 1;
SELECT AVG(posts.score) FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'csgillespie';
SELECT avg(badge_count) FROM (SELECT count(b.id) AS badge_count FROM badges b JOIN users u ON b.userid = u.id WHERE u.views > 200 GROUP BY b.userid);
SELECT cast(sum(CASE WHEN posts.score > 5 THEN 1 ELSE 0 END) AS REAL) * 100 / count(posts.id) FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.age > 65;
SELECT count(votes.id) FROM votes WHERE votes.creationdate = '2010-07-19' AND votes.userid = 58;
SELECT creationdate FROM votes GROUP BY creationdate ORDER BY count(id) DESC LIMIT 1;
SELECT count(*) FROM badges WHERE badges.name = 'Revival';
SELECT posts.title FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE comments.score = (SELECT Max(comments.score) FROM comments);
SELECT count(comments.postid) FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.viewcount = 1910;
SELECT posts.favoritecount FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE comments.userid = '3025' AND comments.creationdate = '2014/4/23 20:29:39.0';
SELECT text FROM comments WHERE postid = 107829 AND id = 1;
SELECT CASE WHEN closeddate IS NULL THEN 'NOT well-finished' WHEN closeddate IS NOT NULL THEN 'well-finished' END wellfinished FROM POSTS WHERE id = 23853;
SELECT users.reputation FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.id = '65041';
SELECT count(posts.id) FROM users INNER JOIN posts ON users.displayname = posts.ownerdisplayname WHERE users.displayname = 'Tiago Pasqualini';
SELECT users.displayname FROM votes INNER JOIN users ON votes.userid = users.id WHERE votes.id = '6347';
SELECT COUNT(*) FROM votes WHERE postid IN (SELECT id FROM posts WHERE title LIKE '%data visualization%');
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.displayname = 'DatEpicCoderGuyWhoPrograms';
SELECT count(posts.id) / count(votes.id) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE posts.owneruserid = '24';
SELECT viewcount FROM posts WHERE title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer';
SELECT comments.text FROM comments WHERE comments.score = 17;
SELECT displayname FROM users WHERE websiteurl LIKE 'http://stackoverflow.com';
SELECT badges.name FROM users JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost';
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text LIKE 'thank you user93';
SELECT comments.text FROM comments INNER JOIN users ON comments.userid = users.id WHERE users.displayname = 'A Lion';
SELECT users.displayname, users.reputation FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Understanding what Dassault iSight is doing?';
SELECT comments.text FROM comments comments INNER JOIN posts posts ON comments.postid = posts.id WHERE posts.title = 'How does gentle boosting differ from AdaBoost?';
SELECT users.displayname FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Necromancer';
SELECT users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Open source tools for visualizing multi-dimensional data?';
SELECT title FROM posts WHERE lasteditoruserid = (SELECT id FROM users WHERE displayname = 'Vebjorn Ljosa');
SELECT sum(posts.score), users.websiteurl FROM posts INNER JOIN users ON posts.lasteditoruserid = users.id WHERE users.displayname = 'Yevgeny' GROUP BY users.websiteurl;
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE title = 'Why square the difference instead of taking the absolute value in standard deviation?');
SELECT sum(votes.bountyamount) FROM votes INNER JOIN posts ON posts.id = votes.postid WHERE posts.title LIKE '%data%';
SELECT users.displayname FROM posts INNER JOIN votes ON posts.id = votes.postid INNER JOIN users ON votes.userid = users.id WHERE posts.title LIKE '%variance%' AND votes.bountyamount = 50;
SELECT posts.title , posthistory.text FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid INNER JOIN tags ON posts.id = tags.excerptpostid WHERE tags.tagname = '<humor>';
SELECT count(comments.id) FROM comments WHERE comments.userid = 13;
SELECT users.id FROM users WHERE users.reputation = (SELECT max(reputation) FROM users);
SELECT users.id FROM users WHERE users.views = (SELECT min(users.views) FROM users);
sql placeholder
sql placeholder
SELECT count(DISTINCT badges.userid) FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Teacher' OR badges.name = 'Supporter' AND users.location = 'New York';
SELECT users.id, users.reputation FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.id = 1;
SELECT users.id FROM users INNER JOIN posthistory ON users.id = posthistory.userid GROUP BY users.id HAVING COUNT(posthistory.postid) = 1 AND users.views >= 1000;
SELECT badges.name FROM comments INNER JOIN badges ON comments.userid = badges.userid GROUP BY comments.userid ORDER BY count(*) DESC LIMIT 1;
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'India';
sql placeholder
SELECT posthistorytypeid, count(DISTINCT userid) FROM posthistory WHERE postid = 3720 GROUP BY posthistorytypeid;
SELECT posts.id , posts.viewcount FROM posts INNER JOIN postlinks ON posts.id = postlinks.relatedpostid WHERE postlinks.postid = 61217;
SELECT posts.score, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE postlinks.postid = 395;
SELECT posts.id, posts.owneruserid FROM posts WHERE posts.score > 60;
SELECT SUM(posts.favoritecount) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE votes.userid = 686 AND votes.creationdate = 2011;
SELECT AVG(users.upvotes), AVG(users.age) FROM users WHERE users.id IN (SELECT posts.owneruserid FROM posts WHERE posts.commentcount > 10);
SELECT count(badges.name) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Announcer';
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.date = '2010-07-19 19:39:08.0';
SELECT COUNT(*) FROM comments WHERE score > 60;
SELECT text FROM comments WHERE creationdate = '2010-07-19 19:16:14.0';
SELECT count(*) FROM posts WHERE score = 10;
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.reputation = ( SELECT max(reputation) FROM users );
SELECT users.reputation FROM users JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0';
SELECT badges.name FROM badges JOIN users ON badges.userid = users.id WHERE users.displayname = 'Pierre';
SELECT badges.date FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.location = 'Rochester, NY';
SELECT cast(count(users.displayname = 'Teacher') AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Teacher';
SELECT cast(count(users.age) AS REAL) * 100 / ( SELECT count(userid) FROM badges WHERE name = 'Organizer' ), users.displayname FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Organizer' AND users.age BETWEEN 13 AND 18;
SELECT comments.score FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.creaiondate = '2010-07-19 19:19:56.0';
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.creationdate = '2010-07-19 19:37:33.0';
SELECT users.age FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Vienna, Austria';
SELECT count(badges.userid) FROM badges JOIN users ON badges.userid = users.id WHERE badges.name = 'Supporter' AND users.age BETWEEN 19 AND 65;
SELECT users.views FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.date = '2010-07-19 19:39:08.0';
SELECT badges.name FROM badges INNER JOIN users ON badges.userid = users.id WHERE users.reputation = (SELECT min(reputation) FROM users);
SELECT badges.name FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.displayname = 'Sharpie';
SELECT count(badges.name) FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Supporter' AND users.age > 65;
SELECT displayname FROM users WHERE id = 30;
SELECT count(users.location) FROM users WHERE users.location = 'New York';
SELECT count(*) FROM votes WHERE strftime('%Y', votes.creationdate) = '2010';
SELECT count(*) FROM users WHERE age BETWEEN 19 AND 65;
SELECT displayname FROM users WHERE views = ( SELECT MAX(views) FROM users );
sql placeholder
SELECT tags.tagname FROM posts INNER JOIN tags ON posts.tags = tags.id WHERE posts.ownerdisplayname = 'John Salvatier';
SELECT count(*) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Daniel Vassallo';
SELECT count(*) FROM votes INNER JOIN users ON votes.userid = users.id WHERE users.displayname = 'Harlan';
SELECT posts.id FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'slashnick' ORDER BY posts.answercount DESC LIMIT 1;
sql placeholder
SELECT count(posts.id) FROM posts INNER JOIN votes ON posts.id = votes.postid INNER JOIN users ON votes.userid = users.id WHERE users.displayname = 'Matt Parker' AND votes.postid > 4;
SELECT count(*) FROM posts JOIN comments ON posts.id = comments.postid JOIN users ON comments.userid = users.id WHERE users.displayname = 'Neil McGuigan' AND posts.score < 60;
SELECT tags.tagname FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Mark Meckes' AND tags.count = 0;
SELECT users.displayname FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Organizer';
SELECT cast(count(DISTINCT CASE WHEN tags.tagname = 'r' THEN posts.id ELSE NULL END) AS REAL) * 100 / count(DISTINCT posts.id) FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Community';
SELECT sum(CASE WHEN users.displayname = 'Mornington' THEN posts.viewcount ELSE 0 END) - sum(CASE WHEN users.displayname = 'Amos' THEN posts.viewcount ELSE 0 END) AS difference FROM posts INNER JOIN users ON posts.owneruserid = users.id;
sql placeholder
SELECT count(*) FROM posts WHERE posts.creaiondate BETWEEN '2010-07-21 00:00:00' AND '2012-07-21 23:59:59';
SELECT users.displayname , users.age FROM users WHERE users.views = ( SELECT max(views) FROM users );
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images';
SELECT count(comments.score) FROM comments WHERE comments.userid = 13 AND comments.score < 60;
SELECT posts.title, users.displayname FROM posts INNER JOIN comments ON posts.id = comments.postid INNER JOIN users ON comments.userid = users.id WHERE comments.score > 60;
sql placeholder
SELECT users.displayname , users.websiteurl FROM users JOIN posts ON users.id = posts.owneruserid WHERE posts.favoritecount > 150;
SELECT posthistory.postid, posthistory.id, posthistory.creationdate, posthistory.posthistorytypeid, posthistory.text, posthistory.comment FROM posthistory INNER JOIN posts ON posthistory.postid = posts.id WHERE posts.title = 'What is the best introductory Bayesian statistics textbook?';
SELECT users.lastaccessdate , users.location FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Outliers';
SELECT posts.title FROM postlinks INNER JOIN posts ON postlinks.relatedpostid = posts.id WHERE posts.title = 'How to tell if something happened in a data set which monitors a value over time';
sql placeholder
SELECT users.displayname FROM posts INNER JOIN users ON posts.owneruserid = users.id ORDER BY posts.viewcount DESC LIMIT 1;
SELECT users.displayname , users.location FROM tags INNER JOIN posts ON tags.excerptpostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE tagname = 'hypothesis-testing';
SELECT posts.title, postlinks.linktypeid FROM posts INNER JOIN postlinks ON posts.id = postlinks.relatedpostid WHERE posts.title = 'What are principal component scores?';
SELECT users.displayname FROM posts JOIN users ON posts.owneruserid = users.id WHERE posts.parentid IS NOT NULL AND posts.score = (SELECT max(score) FROM posts WHERE parentid = posts.parentid);
SELECT users.displayname, users.websiteurl FROM users JOIN votes ON users.id = votes.userid WHERE votetypeid = 8 AND votes.bountyamount = (SELECT MAX(bountyamount) FROM votes WHERE votetypeid = 8);
SELECT title FROM posts ORDER BY viewcount DESC LIMIT 5;
SELECT count(*) FROM tags WHERE count BETWEEN 5000 AND 7000;
SELECT owneruserid FROM posts ORDER BY favoritecount DESC LIMIT 1;
SELECT age FROM users WHERE reputation = (SELECT MAX(reputation) FROM users);
sql placeholder
SELECT id FROM users WHERE age = (SELECT MIN(age) FROM users);
SELECT SUM(score) FROM posts WHERE lasactivitydate LIKE '2010-07-19%';
SELECT cast(sum(postlinks.id) AS REAL) / 12 FROM postlinks INNER JOIN posts ON postlinks.postid = posts.id WHERE posts.answercount <= 2 AND strftime('%Y', postlinks.creationdate) = '2010';
SELECT posts.id FROM posts JOIN votes ON posts.id = votes.postid WHERE votes.userid = 1465 GROUP BY posts.id ORDER BY sum(votes.bountyamount) DESC LIMIT 1;
SELECT posts.title FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE postlinks.creationdate = (SELECT min(creationdate) FROM postlinks);
SELECT users.displayname FROM badges INNER JOIN users ON badges.userid = users.id GROUP BY users.id ORDER BY count(badges.name) DESC LIMIT 1;
SELECT MIN(creationdate) FROM votes WHERE votes.userid = (SELECT users.id FROM users WHERE users.displayname = 'chl');
SELECT MIN(creaiondate) FROM posts WHERE owneruserid = (SELECT MIN(id) FROM users);
SELECT users.displayname FROM users INNER JOIN badges ON badges.userid = users.id WHERE badges.name = 'Autobiographer' ORDER BY badges.date LIMIT 1;
SELECT count(DISTINCT users.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.favoritecount >= 4 AND users.location = 'United Kingdom';
SELECT AVG(postid) FROM votes WHERE userid IN (SELECT id FROM users WHERE age = (SELECT MAX(age) FROM users));
SELECT users.displayname FROM users users WHERE users.reputation = ( SELECT max(reputation) FROM users );
SELECT count(users.id) FROM users WHERE users.reputation > 2000 AND users.views > 1000;
SELECT users.displayname FROM users WHERE users.age BETWEEN 19 AND 65;
sql placeholder
SELECT posts.id, posts.title FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE users.displayname = 'Harvey Motulsky' ORDER BY posts.viewcount DESC LIMIT 1;
SELECT id, title FROM posts ORDER BY score DESC LIMIT 1;
SELECT AVG(posts.score) FROM posts INNER JOIN users ON users.id = posts.owneruserid WHERE users.displayname = 'Stephen Turner';
sql placeholder
sql placeholder
sql placeholder
SELECT (SELECT count(id) FROM users WHERE age BETWEEN 13 and 18) / (SELECT count(id) FROM users) as percentage;
sql placeholder
SELECT sum(posts.viewcount) FROM posts WHERE posts.viewcount > (SELECT AVG(viewcount) FROM posts);
SELECT count(*) FROM comments WHERE postid = (SELECT id FROM posts ORDER BY score DESC LIMIT 1);
SELECT count(posts.id) FROM posts WHERE posts.viewcount > 35000 AND posts.commentcount = 0;
SELECT users.displayname, users.location FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE posts.id = 183;
SELECT name FROM badges WHERE userid = ( SELECT id FROM users WHERE displayname = 'Emmett' ) ORDER BY date DESC LIMIT 1;
SELECT count(users.id) FROM users WHERE users.age BETWEEN 19 AND 65 AND users.upvotes > 5000;
sql placeholder
SELECT COUNT(posts.id) AS post_count, COUNT(comments.id) AS comment_count FROM users JOIN posts ON users.id = posts.owneruserid JOIN comments ON posts.id = comments.postid WHERE users.creationdate = (SELECT MAX(creationdate) FROM users);
sql placeholder
SELECT count(id) FROM badges WHERE name = 'Citizen Patrol';
SELECT count(posts.id) FROM tags INNER JOIN posts ON tags.id = posts.tags WHERE tags.tagname = 'careers';
SELECT users.reputation , users.views FROM users WHERE users.displayname = 'Jarrod Dixon';
SELECT count(comments.id), count(posts.id) FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.title = 'Clustering 1D data';
SELECT users.creationdate FROM users WHERE users.displayname = 'IrishStat';
SELECT count(votes.postid) FROM votes WHERE votes.bountyamount >= 30;
sql placeholder
SELECT count(DISTINCT posts.id) FROM posts WHERE posts.score < 20;
SELECT count(DISTINCT tags.id) FROM tags WHERE tags.id < 15 AND tags.count <= 20;
SELECT tags.excerptpostid, tags.wikipostid FROM tags WHERE tags.tagname = 'sample';
SELECT users.reputation, users.upvotes FROM comments INNER JOIN users ON comments.userid = users.id WHERE comments.text = 'fine, you win :)';
SELECT posthistory.text FROM posthistory INNER JOIN posts ON posthistory.postid = posts.id WHERE posts.title LIKE '%linear regression%' AND posthistory.comment LIKE '%regression%';
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE viewcount BETWEEN 100 AND 150) ORDER BY score DESC LIMIT 1;
SELECT users.creationdate, users.age FROM users WHERE users.websiteurl LIKE '%http://%';
SELECT count(DISTINCT posts.id) FROM posts posts JOIN comments comments ON posts.id = comments.postid WHERE comments.score = 0 AND posts.viewcount < 5;
SELECT count(DISTINCT comments.id) FROM comments JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1 AND comments.score = 0;
SELECT COUNT(DISTINCT users.id) FROM users JOIN comments ON users.id = comments.userid WHERE comments.score = 0 AND users.age = 40;
SELECT posts.id, comments.text FROM posts JOIN comments ON posts.id = comments.postid WHERE posts.title = 'Group differences on a five point Likert item';
SELECT users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text LIKE 'R is also lazy evaluated.';
SELECT text FROM comments WHERE userid IN (SELECT id FROM users WHERE displayname = 'Harvey Motulsky');
SELECT DISTINCT users.displayname FROM comments JOIN users ON comments.userid = users.id WHERE comments.score BETWEEN 1 AND 5 AND users.downvotes = 0;
SELECT cast((sum(CASE WHEN comments.score BETWEEN 5 AND 10 AND users.upvotes = 0 THEN 1 ELSE 0 END)) AS REAL) * 100 / count(comments.userid) FROM comments INNER JOIN users ON comments.userid = users.id;
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = '3-D Man';
SELECT count(*) FROM superhero WHERE id IN (SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength'));
SELECT count(*) FROM superhero sh JOIN hero_power hp ON sh.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Super Strength' AND sh.height_cm > 200;
SELECT full_name FROM superhero GROUP BY full_name HAVING COUNT(full_name) > 15;
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON colour.id = superhero.eye_colour_id WHERE colour.colour = 'Blue';
SELECT colour FROM colour WHERE id IN (SELECT superhero.skin_colour_id FROM superhero WHERE superhero.superhero_name = 'Apocalypse');
SELECT count(superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND superpower.power_name = 'Agility';
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blue' AND colour.colour = 'Blond';
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';
SELECT superhero.superhero_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC;
SELECT publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron';
SELECT skin_colour_id FROM superhero GROUP BY skin_colour_id ORDER BY count(id) DESC;
SELECT AVG(superhero.height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';
SELECT superhero_name FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND id IN (SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Super Strength'));
SELECT count(DISTINCT superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics';
SELECT publisher.publisher_name FROM publisher publisher JOIN superhero superhero ON publisher.id = superhero.publisher_id JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold' AND publisher.publisher_name = 'Marvel Comics';
SELECT publisher.publisher_name FROM publisher INNER JOIN superhero superhero ON publisher.id = superhero.publisher_id WHERE superhero.superhero_name = 'Blue Beetle II';
SELECT count(DISTINCT superhero.id) FROM superhero superhero JOIN colour colour ON superhero.hair_colour_id = colour.id WHERE colour.colour = 'Blond';
SELECT superhero.superhero_name FROM hero_attribute INNER JOIN superhero ON hero_attribute.hero_id = superhero.id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Intelligence' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT race.race FROM race INNER JOIN superhero ON race.id = superhero.race_id WHERE superhero.superhero_name = 'Copycat';
SELECT superhero.superhero_name FROM superhero JOIN hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Durability' AND hero_attribute.attribute_value < 50;
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Death Touch';
SELECT count(superhero.id) FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id INNER JOIN gender ON superhero.gender_id = gender.id WHERE attribute.attribute_name = 'Strength' AND hero_attribute.attribute_value = 100 AND gender.gender = 'Female';
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id GROUP BY superhero.superhero_name ORDER BY count(superhero.superhero_name) DESC LIMIT 1;
SELECT count(superhero.id) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race = 'Vampire';
SELECT (SUM(CASE WHEN alignment.alignment = 'Bad' THEN 1 ELSE 0 END) * 100.0 / count(superhero.id)) AS calculation FROM superhero superhero JOIN alignment alignment ON superhero.alignment_id = alignment.id JOIN publisher publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics';
SELECT SUM(publisher.publisher_name = 'Marvel Comics') - SUM(publisher.publisher_name = 'DC Comics') FROM publisher publisher JOIN superhero superhero ON publisher.id = superhero.publisher_id;
SELECT publisher.id FROM publisher WHERE publisher.publisher_name = 'Star Trek';
SELECT AVG(hero_attribute.attribute_value) FROM hero_attribute;
SELECT count(*) FROM superhero WHERE full_name IS NULL;
SELECT colour.colour FROM colour WHERE colour.id IN (SELECT superhero.eye_colour_id FROM superhero WHERE superhero.id = 75);
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON superpower.id = hero_power.power_id WHERE superhero.superhero_name = 'Deathlok';
SELECT AVG(superhero.weight_kg) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Female';
SELECT superpower.power_name FROM superhero superhero JOIN gender gender ON superhero.gender_id = gender.id JOIN hero_power hero_power ON superhero.id = hero_power.hero_id JOIN superpower superpower ON hero_power.power_id = superpower.id WHERE gender.gender = 'Male';
SELECT superhero.superhero_name FROM race INNER JOIN superhero ON race.id = superhero.race_id WHERE race.race = 'Alien';
SELECT superhero.superhero_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superhero.height_cm BETWEEN 170 AND 190 AND colour.colour = 'No colour';
SELECT superpower.power_name FROM superpower WHERE superpower.id IN (SELECT hero_power.power_id FROM hero_power WHERE hero_power.hero_id = 56);
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Demi-God';
SELECT count(superhero.id) FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE alignment.alignment = 'Bad';
SELECT race.race FROM superhero superhero INNER JOIN race race ON superhero.race_id = race.id WHERE superhero.weight_kg = 169;
SELECT colour.colour FROM colour INNER JOIN superhero ON colour.id = superhero.hair_colour_id INNER JOIN race ON superhero.race_id = race.id WHERE superhero.height_cm = 185 AND race.race = 'human';
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id ORDER BY superhero.weight_kg DESC LIMIT 1;
SELECT cast(sum(CASE WHEN publisher.publisher_name = 'Marvel Comics' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM publisher INNER JOIN superhero ON publisher.id = superhero.publisher_id WHERE superhero.height_cm BETWEEN 150 AND 180;
SELECT DISTINCT superhero.superhero_name FROM superhero superhero JOIN gender gender ON superhero.gender_id = gender.id JOIN hero_power hero_power ON superhero.id = hero_power.hero_id JOIN superpower superpower ON hero_power.power_id = superpower.id WHERE gender.gender = 'Male' AND superhero.weight_kg > (SELECT avg(weight_kg) * 0.79 FROM superhero) AND superhero.weight_kg IS NOT NULL;
SELECT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id GROUP BY superpower.power_name ORDER BY count(superpower.power_name) DESC LIMIT 1;
SELECT hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id AND superhero.superhero_name = 'Abomination';
SELECT superpower.power_name FROM hero_power JOIN superpower ON hero_power.power_id = superpower.id WHERE hero_id = 1;
SELECT count(DISTINCT superhero.id) FROM superpower superpower JOIN hero_power hero_power ON superpower.id = hero_power.power_id JOIN superhero superhero ON hero_power.hero_id = superhero.id WHERE superpower.power_name = 'stealth';
SELECT superhero.full_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Strength' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;
sql placeholder
SELECT count(DISTINCT superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Dark Horse Comics';
sql placeholder
SELECT colour.colour FROM colour WHERE colour.id IN (SELECT superhero.eye_colour_id FROM superhero WHERE superhero.full_name = 'Abraham Sapien');
SELECT superhero.superhero_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id INNER JOIN superhero ON hero_power.hero_id = superhero.id WHERE superpower.power_name = 'Flight';
SELECT superhero.eye_colour_id , superhero.hair_colour_id , superhero.skin_colour_id FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE gender.gender = 'Female' AND publisher.publisher_name = 'Dark Horse Comics';
SELECT superhero.superhero_name , publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.hair_colour_id = superhero.skin_colour_id AND superhero.eye_colour_id = superhero.hair_colour_id;
SELECT race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero_name = 'A-Bomb';
sql placeholder
SELECT superhero.superhero_name, race.race FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE superhero.full_name = 'Charles Chandler';
SELECT gender.gender FROM gender INNER JOIN superhero superhero ON gender.id = superhero.gender_id WHERE superhero.superhero_name = 'Agent 13';
SELECT superhero.superhero_name FROM hero_power INNER JOIN superhero ON hero_power.hero_id = superhero.id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Adaptation';
SELECT count(hero_power.power_id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Amazo';
SELECT superpower.power_name FROM hero_power INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.full_name = 'Hunter Zolomon';
SELECT superhero.height_cm FROM superhero INNER JOIN colour ON colour.id = superhero.eye_colour_id WHERE colour.colour = 'Amber';
SELECT superhero.superhero_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id AND superhero.hair_colour_id = colour.id WHERE colour.colour = 'Black';
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Gold' AND superhero.skin_colour_id = colour.id;
SELECT full_name FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Vampire';
SELECT superhero.superhero_name FROM superhero INNER JOIN alignment ON alignment.id = superhero.alignment_id WHERE alignment.alignment = 'Neutral';
SELECT count(*) FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_id IN (SELECT id FROM attribute WHERE attribute_name = 'Strength') AND attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id IN (SELECT id FROM attribute WHERE attribute_name = 'Strength')));
SELECT race.race, alignment.alignment FROM superhero INNER JOIN race ON superhero.race_id = race.id INNER JOIN alignment ON superhero.alignment_id = alignment.id WHERE superhero_name = 'Cameron Hicks';
sql placeholder
SELECT avg(superhero.weight_kg) FROM superhero INNER JOIN race ON superhero.race_id = race.id WHERE race.race = 'Alien';
SELECT sum(CASE WHEN superhero.full_name = 'Emil Blonsky' THEN superhero.weight_kg ELSE 0 END) - sum(CASE WHEN superhero.full_name = 'Charles Chandler' THEN superhero.weight_kg ELSE 0 END) AS difference FROM superhero WHERE superhero.full_name IN ('Emil Blonsky', 'Charles Chandler');
SELECT cast(sum(superhero.height_cm) AS REAL) / count(*) AS average FROM superhero;
SELECT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id INNER JOIN superhero ON superhero.id = hero_power.hero_id WHERE superhero.superhero_name = 'Abomination';
SELECT count(*) FROM superhero WHERE race_id = 21 AND gender_id = 1;
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' ORDER BY hero_attribute.attribute_value DESC LIMIT 1;
SELECT count(id) FROM superhero WHERE alignment_id = 3;
SELECT superhero.superhero_name , attribute.attribute_name , hero_attribute.attribute_value FROM superhero INNER JOIN hero_attribute ON superhero.id = hero_attribute.hero_id INNER JOIN attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = '3-D Man';
SELECT superhero.superhero_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue' AND colour.colour = 'Brown';
SELECT publisher_name FROM publisher WHERE id IN (SELECT publisher_id FROM superhero WHERE superhero_name IN ('Hawkman', 'Karate Kid', 'Speedy'));
SELECT count(DISTINCT superhero.id) FROM superhero superhero WHERE superhero.publisher_id = 1;
SELECT cast(sum(CASE WHEN colour.colour = 'Blue' AND colour.id = superhero.eye_colour_id THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero_name) AS percentage FROM superhero superhero JOIN colour colour ON superhero.eye_colour_id = colour.id;
SELECT cast(sum(CASE WHEN gender.gender = 'Female' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN gender.gender = 'Male' THEN 1 ELSE 0 END) FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id;
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT max(height_cm) FROM superhero);
SELECT superpower.id FROM superpower WHERE superpower.power_name = 'Cryokinesis';
SELECT superhero.superhero_name FROM superhero WHERE superhero.id = 294;
SELECT full_name FROM superhero WHERE weight_kg = 0 OR weight_kg IS NULL;
SELECT colour.colour FROM colour INNER JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.full_name = 'Karen Beecher-Duncan';
SELECT power_name FROM superpower WHERE id IN (SELECT power_id FROM hero_power WHERE hero_id IN (SELECT id FROM superhero WHERE full_name = 'Helen Parr'));
SELECT race.race FROM superhero superhero JOIN race ON superhero.race_id = race.id WHERE superhero.weight_kg = 108 AND superhero.height_cm = 188;
SELECT publisher.publisher_name FROM superhero superhero JOIN publisher publisher ON publisher.id = superhero.publisher_id WHERE superhero.id = 38;
SELECT race FROM race WHERE id = (SELECT MAX(attribute_value) FROM hero_attribute);
SELECT alignment.alignment, superpower.power_name FROM superhero INNER JOIN alignment ON superhero.alignment_id = alignment.id INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Atom IV';
SELECT DISTINCT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue';
SELECT avg(hero_attribute.attribute_value) AS average FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id WHERE superhero.alignment_id = 3;
sql placeholder
SELECT count(superhero.id) FROM superhero WHERE superhero.alignment_id = 1 AND superhero.gender_id = 2;
SELECT superhero_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_attribute WHERE attribute_value BETWEEN 75 AND 80);
SELECT race.race FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN race ON superhero.race_id = race.id WHERE colour.colour = 'blue' AND gender.gender = 'male';
sql placeholder
SELECT SUM(colour.id = 7) - SUM(colour.id = 1) FROM superhero superhero JOIN colour colour ON superhero.eye_colour_id = colour.id WHERE superhero.weight_kg = 0 OR superhero.weight_kg IS NULL;
SELECT hero_attribute.attribute_value FROM attribute INNER JOIN hero_attribute ON attribute.id = hero_attribute.attribute_id INNER JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE attribute.attribute_name = 'Strength' AND superhero.superhero_name = 'Hulk';
SELECT superpower.power_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superhero.superhero_name = 'Ajax';
sql placeholder
SELECT count(*) FROM superhero WHERE publisher_id IN (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics') AND gender_id IN (SELECT id FROM gender WHERE gender = 'Female');
SELECT superhero.superhero_name FROM superhero JOIN hero_power ON superhero.id = hero_power.hero_id JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Wind Control' ORDER BY superhero.superhero_name ASC;
SELECT gender.gender FROM superhero superhero JOIN gender ON superhero.gender_id = gender.id JOIN hero_power hero_power ON superhero.id = hero_power.hero_id JOIN superpower superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Phoenix Force';
SELECT superhero.superhero_name FROM superhero superhero JOIN publisher publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'DC Comics' ORDER BY superhero.weight_kg DESC LIMIT 1;
SELECT avg(superhero.height_cm) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id INNER JOIN race ON superhero.race_id = race.id WHERE race.race <> 'Human' AND publisher.publisher_name = 'Dark Horse Comics';
SELECT COUNT(superhero.id) FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id WHERE attribute.attribute_name = 'Speed' AND hero_attribute.attribute_value = 100;
SELECT SUM(publisher_name = 'DC Comics'), SUM(publisher_name = 'Marvel Comics') FROM publisher;
SELECT attribute.attribute_name FROM superhero superhero JOIN hero_attribute hero_attribute ON superhero.id = hero_attribute.hero_id JOIN attribute attribute ON hero_attribute.attribute_id = attribute.id WHERE superhero.superhero_name = 'Black Panther' ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT colour.colour FROM colour INNER JOIN superhero ON superhero.eye_colour_id = colour.id WHERE superhero.superhero_name = 'Abomination';
SELECT superhero_name FROM superhero WHERE height_cm = (SELECT max(height_cm) FROM superhero);
SELECT superhero_name FROM superhero WHERE full_name = 'Charles Chandler';
SELECT (count(CASE WHEN gender.gender = 'Female' THEN 1 END) * 100.0 / count(*)) AS percentage FROM superhero INNER JOIN gender ON superhero.gender_id = gender.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'George Lucas';
sql placeholder
SELECT count(superhero.id) FROM superhero WHERE superhero.full_name LIKE 'John%';
SELECT hero_attribute.hero_id FROM hero_attribute ORDER BY hero_attribute.attribute_value ASC LIMIT 1;
SELECT superhero.full_name FROM superhero INNER JOIN race ON race.id = superhero.race_id WHERE race.race = 'Alien';
SELECT full_name FROM superhero WHERE weight_kg < 100 AND eye_colour_id = ( SELECT id FROM colour WHERE colour = 'Brown' );
SELECT hero_attribute.attribute_value FROM hero_attribute INNER JOIN superhero ON hero_attribute.hero_id = superhero.id WHERE superhero.superhero_name = 'Aquababy';
SELECT superhero.weight_kg, race.race FROM superhero JOIN race ON superhero.race_id = race.id WHERE superhero.id = 40;
SELECT avg(superhero.height_cm) FROM superhero superhero JOIN gender gender ON superhero.gender_id = gender.id WHERE gender.gender = 'Neutral';
SELECT superhero.id FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON superpower.id = hero_power.power_id WHERE superpower.power_name = 'Intelligence';
SELECT colour FROM colour WHERE id = ( SELECT eye_colour_id FROM superhero WHERE superhero_name = 'Blackwulf' );
SELECT superpower.power_name FROM superpower INNER JOIN hero_power ON superpower.id = hero_power.power_id INNER JOIN superhero ON hero_power.hero_id = superhero.id WHERE superhero.height_cm > 0.8 * (SELECT avg(height_cm) FROM superhero);
SELECT drivers.driverref FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN races ON qualifying.raceid = races.raceid WHERE races.raceid = 20 AND qualifying.q1 = (SELECT MAX(q1) FROM qualifying WHERE qualifying.raceid = 20);
SELECT drivers.surname FROM qualifying qualifying JOIN drivers drivers ON qualifying.driverid = drivers.driverid WHERE qualifying.raceid = 19 AND qualifying.number = 2 AND qualifying.q2 = (SELECT min(q2) FROM qualifying WHERE raceid = 19 AND number = 2);
SELECT races.year FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE circuits.location = 'Shanghai';
SELECT races.url FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE circuits.name = 'Circuit de Barcelona-Catalunya';
SELECT races.name FROM races WHERE races.circuitid IN (SELECT circuits.circuitid FROM circuits WHERE circuits.country = 'Germany');
SELECT constructorstandings.position FROM constructorstandings INNER JOIN constructors ON constructorstandings.constructorid = constructors.constructorid WHERE constructors.name = 'Renault';
SELECT count(DISTINCT races.raceid) FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid INNER JOIN seasons ON races.year = seasons.year WHERE circuits.country NOT IN ('Asia', 'Europe') AND seasons.year = 2010;
SELECT DISTINCT races.name FROM circuits circuits JOIN races races ON circuits.circuitid = races.circuitid WHERE circuits.country = 'Spain';
SELECT lat, lng FROM circuits WHERE circuitid IN (SELECT circuitid FROM races WHERE name = 'Australian Grand Prix');
SELECT races.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.circuitref = 'sepang';
SELECT time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.circuitref = 'sepang';
SELECT lat, lng FROM circuits WHERE name = 'Abu Dhabi Grand Prix';
SELECT constructors.nationality FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid WHERE constructorresults.raceid = 24 AND constructorresults.points = 1;
SELECT qualifying.q1 FROM qualifying WHERE qualifying.driverid = 354 AND qualifying.raceid = 354;
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 355 AND qualifying.q2 LIKE '0:01:40';
SELECT drivers.number FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN results ON qualifying.raceid = results.raceid AND qualifying.qualifyid = results.resultid INNER JOIN status ON results.statusid = status.statusid INNER JOIN races ON qualifying.raceid = races.raceid WHERE races.raceid = 903 AND status.status = 'Finished' AND qualifying.q3 LIKE 'M:SS%';
SELECT count(DISTINCT drivers.driverid) FROM races JOIN results ON races.raceid = results.raceid JOIN drivers ON results.driverid = drivers.driverid WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL;
SELECT seasons.url FROM seasons INNER JOIN races ON seasons.year = races.year WHERE races.raceid = 901;
SELECT count(drivers.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.date = '2015-11-29';
SELECT drivers.forename FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE results.raceid = 592 AND results.time IS NOT NULL ORDER BY drivers.dob ASC LIMIT 1;
SELECT drivers.url FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE laptimes.time LIKE '0:01:27' AND races.raceid = '161';
SELECT drivers.driverref FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN driverstandings ON results.raceid = driverstandings.raceid INNER JOIN races ON driverstandings.raceid = races.raceid INNER JOIN laptimes ON races.raceid = laptimes.raceid WHERE results.raceid = 933 AND results.fastestlapspeed = (SELECT MAX(fastestlapspeed) FROM results WHERE raceid = 933);
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid WHERE races.name = 'Malaysian Grand Prix';
SELECT constructors.url FROM constructorresults constructorresults JOIN constructors constructors ON constructorresults.constructorid = constructors.constructorid JOIN races races ON constructorresults.raceid = races.raceid WHERE constructorresults.raceid = 9 AND constructorresults.points = (SELECT max(constructorresults.points) FROM constructorresults WHERE constructorresults.raceid = 9);
SELECT q1 FROM qualifying WHERE driverid = 345 AND raceid = 345;
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid INNER JOIN races ON driverstandings.raceid = races.raceid WHERE qualifying.raceid = '347' AND qualifying.q2 = '0:01:15';
SELECT drivers.code FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN races ON qualifying.raceid = races.raceid WHERE qualifying.q3 LIKE 'M:SS%' AND races.raceid = 45;
SELECT results.time FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Bruce' AND drivers.surname = 'McLaren' AND races.raceid = 743;
SELECT DISTINCT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2006 AND results.position = 2;
SELECT seasons.url FROM seasons INNER JOIN races ON seasons.year = races.year WHERE races.raceid = 901;
sql placeholder
SELECT drivers.forename, drivers.surname FROM drivers JOIN laptimes ON drivers.driverid = laptimes.driverid JOIN results ON laptimes.raceid = results.raceid JOIN driverstandings ON results.raceid = driverstandings.raceid WHERE laptimes.raceid = 872 AND results.time IS NOT NULL AND driverstandings.wins = 1 AND driverstandings.position = 1;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE laptimes.raceid = 348 ORDER BY laptimes.time ASC LIMIT 1;
SELECT drivers.nationality FROM drivers JOIN results ON drivers.driverid = results.driverid WHERE results.fastestlapspeed = (SELECT MAX(fastestlapspeed) FROM results);
sql placeholder
sql placeholder
SELECT year FROM races WHERE name = 'Singapore Grand Prix' ORDER BY year ASC LIMIT 1;
SELECT count(races.raceid) FROM races WHERE races.year = 2005;
sql placeholder
SELECT name, date FROM races WHERE year = 1999 AND round = (SELECT max(round) FROM races WHERE year = 1999);
SELECT year FROM races GROUP BY year ORDER BY count(DISTINCT raceid) DESC LIMIT 1;
SELECT races.name FROM races INNER JOIN seasons ON races.year = seasons.year WHERE seasons.year <> 2000 AND races.year = 2017;
SELECT circuits.country, circuits.location FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix' ORDER BY races.year LIMIT 1;
SELECT max(seasons.year) FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid INNER JOIN seasons ON races.year = seasons.year WHERE circuits.name = 'Brands Hatch';
SELECT count(DISTINCT seasons.year) FROM races races JOIN seasons seasons ON races.year = seasons.year JOIN circuits circuits ON races.circuitid = circuits.circuitid WHERE circuits.name = 'Silverstone Circuit' AND circuits.country = 'United Kindom';
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2010 ORDER BY results.position;
SELECT drivers.forename || ' ' || drivers.surname AS fullname FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid ORDER BY driverstandings.points DESC LIMIT 1;
SELECT drivers.forename, driverstandings.points FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid INNER JOIN races ON driverstandings.raceid = races.raceid WHERE races.name = 'Chinese Grand Prix' AND races.year = 2017 ORDER BY driverstandings.points DESC LIMIT 3;
SELECT drivers.forename, drivers.surname, races.name, laptimes.milliseconds FROM drivers JOIN laptimes ON drivers.driverid = laptimes.driverid JOIN races ON laptimes.raceid = races.raceid WHERE laptimes.milliseconds = (SELECT min(milliseconds) FROM laptimes);
SELECT avg(laptimes.milliseconds) FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' AND races.name = 'Malaysian Grand Prix' AND races.year = '2009';
sql placeholder
SELECT drivers.forename, drivers.surname, drivers.nationality, MAX(results.points) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid GROUP BY drivers.forename, drivers.surname, drivers.nationality ORDER BY MAX(results.points) DESC LIMIT 1;
sql placeholder
SELECT circuits.name FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN constructorresults ON races.raceid = constructorresults.raceid INNER JOIN results ON constructorresults.constructorresultsid = results.resultid INNER JOIN seasons ON races.year = seasons.year WHERE seasons.year BETWEEN 1990 AND 2000 AND constructorresults.constructorid = 4 AND results.statusid = 1;
SELECT circuits.name, circuits.location, races.name FROM circuits JOIN races ON circuits.circuitid = races.circuitid WHERE circuits.country = 'USA' AND races.year = 2006;
sql placeholder
SELECT races.name FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.driverref = 'yoong' AND results.position < 20;
SELECT count(results.resultid) FROM results, drivers, races, circuits WHERE results.driverid = drivers.driverid AND results.raceid = races.raceid AND races.circuitid = circuits.circuitid AND drivers.forename = 'Michael' AND drivers.surname = 'Schumacher' AND circuits.circuitref = 'sepang';
SELECT races.name, races.year FROM laptimes laptimes JOIN results results ON laptimes.raceid = results.raceid JOIN drivers drivers ON results.driverid = drivers.driverid JOIN races races ON laptimes.raceid = races.raceid WHERE laptimes.milliseconds = (SELECT min(laptimes.milliseconds) FROM laptimes WHERE laptimes.milliseconds IS NOT NULL);
SELECT avg(points) FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid INNER JOIN races ON driverstandings.raceid = races.raceid WHERE races.year = 2000 AND drivers.forename = 'Eddie' AND drivers.driverref = 'irvine' AND drivers.surname = 'Irvine';
SELECT drivers.forename, drivers.surname, races.name, results.points FROM drivers INNER JOIN races ON drivers.driverid = races.raceid INNER JOIN results ON races.raceid = results.raceid WHERE drivers.driverref = 'lewis' AND races.year = (SELECT MIN(year) FROM races);
SELECT races.name, circuits.country FROM races JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.year = 2017 ORDER BY races.date;
sql placeholder
SELECT COUNT(races.raceid) FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'European Grand Prix' AND circuits.country = 'Germany';
SELECT lat, lng FROM circuits WHERE circuits.name = 'Silverstone Circuit';
SELECT name FROM circuits WHERE lat IN (2.76083, 26.0325) ORDER BY lat DESC LIMIT 1;
SELECT circuitref FROM circuits WHERE name = 'Marina Bay Street Circuit';
SELECT circuits.country FROM circuits WHERE circuits.alt = (SELECT max(circuits.alt) FROM circuits);
SELECT count(*) FROM drivers WHERE drivers.code IS NULL;
SELECT drivers.nationality FROM drivers ORDER BY drivers.dob ASC LIMIT 1;
SELECT drivers.surname FROM drivers INNER JOIN constructors ON drivers.nationality = constructors.nationality WHERE constructors.nationality = 'italian';
SELECT drivers.url FROM drivers WHERE drivers.driverref = 'davidson';
SELECT driverref FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton';
SELECT circuits.name FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Spanish Grand Prix' AND races.year = '2009';
SELECT DISTINCT races.year FROM races INNER JOIN circuits ON circuits.circuitid = races.circuitid WHERE circuits.circuitref = 'silverstone';
SELECT * FROM races WHERE circuitid = (SELECT circuitid FROM circuits WHERE circuitref = 'silverstone');
SELECT races.time FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.location = 'Abu Dhabi' AND races.year = 2010;
SELECT count(races.name) FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy';
SELECT races.date FROM races WHERE races.name = 'Australian Grand Prix' AND races.circuitid = (SELECT circuits.circuitid FROM circuits WHERE circuits.name = 'Barcelona-Catalunya');
SELECT races.url FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid INNER JOIN seasons ON races.year = seasons.year WHERE races.name = 'Spanish Grand Prix' AND seasons.year = 2009 GROUP BY races.url;
SELECT min(laptimes.time) FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton';
SELECT drivers.forename, drivers.surname FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid WHERE laptimes.milliseconds = (SELECT max(milliseconds) FROM laptimes);
SELECT driverref FROM drivers WHERE driverid IN (SELECT driverid FROM results WHERE raceid IN (SELECT raceid FROM races WHERE name = 'Canadian Grand Prix' AND year = 2007) AND rank = 1);
SELECT races.name FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN drivers ON results.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton' ORDER BY results.rank ASC LIMIT 1;
SELECT max(fastestlapspeed) FROM results WHERE raceid = (SELECT raceid FROM races WHERE name = 'Spanish Grand Prix' AND year = 2009);
SELECT DISTINCT races.year FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT positionorder, rank FROM results WHERE driverid = (SELECT driverid FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton') AND raceid = (SELECT raceid FROM races WHERE name = 'Chinese Grand Prix' AND year = 2008);
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE results.grid = 4 AND races.year = 1989 AND races.name = 'Australian Grand Prix';
SELECT count(results.driverid) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix' AND results.time IS NOT NULL;
SELECT results.fastestlap FROM results JOIN drivers ON results.driverid = drivers.driverid JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton' AND races.year = 2008 AND races.name = 'Australian Grand Prix';
SELECT results.time FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.name = 'Chinese Grand Prix' AND results.rank = 2 AND races.year = 2008;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid INNER JOIN seasons ON races.year = seasons.year WHERE seasons.year = 2008 AND races.name = 'Australian Grand Prix';
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid JOIN races races ON results.raceid = races.raceid WHERE drivers.nationality = 'British' AND races.year = 2008;
SELECT count(DISTINCT driverstandings.driverid) FROM driverstandings driverstandings JOIN laptimes laptimes ON driverstandings.driverid = laptimes.driverid JOIN races races ON driverstandings.raceid = races.raceid WHERE races.name = 'Chinese Grand Prix' AND laptimes.time IS NOT NULL;
SELECT sum(results.points) FROM drivers JOIN results ON drivers.driverid = results.driverid JOIN races ON results.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT avg(laptimes.milliseconds / 1000) FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton';
SELECT cast(count(CASE WHEN laptimes.time IS NOT NULL THEN laptimes.raceid END) AS REAL) / count(races.raceid) FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid WHERE races.year = 2008 AND races.name = 'Australian Grand Prix';
sql placeholder
SELECT count(*) FROM circuits WHERE circuits.country = 'Australia' AND circuits.location = 'Adelaide';
SELECT circuits.lat , circuits.lng FROM circuits WHERE circuits.country = 'USA';
SELECT count(driverid) FROM drivers WHERE dob > '1980-01-01' AND nationality = 'British';
SELECT max(constructors.nationality) FROM constructors WHERE nationality = 'British';
SELECT constructors.name FROM constructors INNER JOIN constructorresults ON constructors.constructorid = constructorresults.constructorid INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid ORDER BY constructorstandings.points DESC LIMIT 1;
SELECT constructors.name FROM constructorresults constructorresults JOIN constructors constructors ON constructorresults.constructorid = constructors.constructorid JOIN races races ON constructorresults.raceid = races.raceid WHERE constructorresults.points = 0 AND races.raceid = 291;
sql placeholder
SELECT DISTINCT constructors.name FROM constructors INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid WHERE constructorstandings.position = 1;
SELECT count(*) FROM constructors WHERE nationality = 'French' AND constructorid IN ( SELECT constructorid FROM results WHERE laps > 50 );
SELECT cast(sum(CASE WHEN drivers.nationality = 'Japanese' AND laptimes.time IS NOT NULL AND races.year BETWEEN 2007 AND 2009 THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid;
SELECT AVG(CAST(SUBSTR(results.time, 1, 2) AS INTEGER) * 3600 + CAST(SUBSTR(results.time, 4, 2) AS INTEGER) * 60 + CAST(SUBSTR(results.time, 7, 2) AS INTEGER)) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year < 1975;
sql placeholder
SELECT count(DISTINCT drivers.driverid) FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE drivers.nationality = 'Italian' AND results.time IS NULL;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid ORDER BY results.fastestlaptime ASC LIMIT 1;
SELECT fastestlap FROM results WHERE raceid IN (SELECT raceid FROM races WHERE year = 2009) ORDER BY fastestlap LIMIT 1;
SELECT avg(results.fastestlapspeed) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.name = 'Spanish Grand Prix' AND races.year = 2009;
SELECT r.name, r.year FROM races r JOIN results r2 ON r.raceid = r2.raceid WHERE r2.milliseconds = (SELECT Min(milliseconds) FROM results WHERE milliseconds IS NOT NULL);
sql placeholder
SELECT count(drivers.driverid) FROM drivers drivers JOIN laptimes laptimes ON drivers.driverid = laptimes.driverid JOIN races races ON laptimes.raceid = races.raceid WHERE drivers.nationality = 'French' AND laptimes.milliseconds < 7200 AND laptimes.milliseconds > 0;
SELECT code FROM drivers WHERE nationality = 'American';
SELECT raceid FROM races WHERE year = 2009;
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers JOIN results results ON drivers.driverid = results.driverid WHERE results.raceid LIKE 18;
SELECT count(nationality) FROM drivers WHERE nationality = 'Dutch';
SELECT drivers.driverref FROM drivers WHERE drivers.forename = 'Robert' AND drivers.surname = 'Kubica';
sql placeholder
sql placeholder
SELECT driverref FROM drivers WHERE nationality = 'German' AND dob = (SELECT min(dob) FROM drivers WHERE nationality = 'German');
SELECT drivers.driverid, drivers.code FROM drivers INNER JOIN results ON drivers.driverid = results.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 1971 AND results.fastestlaptime IS NOT NULL;
sql placeholder
SELECT seasons.year FROM seasons WHERE seasons.year IN (SELECT races.year FROM races WHERE races.raceid IN (SELECT results.raceid FROM results WHERE results.fastestlaptime IS NOT NULL));
SELECT year FROM races WHERE raceid IN (SELECT raceid FROM laptimes WHERE milliseconds = (SELECT max(milliseconds) FROM laptimes));
SELECT driverid FROM results WHERE laps = 1 ORDER BY time LIMIT 5;
SELECT count(DISTINCT results.resultid) FROM results INNER JOIN status ON results.statusid = status.statusid WHERE status.status = 'Disqualified' AND results.raceid > 50 AND results.raceid < 100 AND results.time IS NULL;
SELECT count(circuitref) FROM circuits WHERE country = 'Austria';
SELECT number FROM results WHERE time IS NOT NULL GROUP BY number ORDER BY count(number) DESC LIMIT 1;
SELECT drivers.driverref, drivers.nationality, drivers.dob FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid INNER JOIN constructors ON qualifying.constructorid = constructors.constructorid WHERE qualifying.raceid = 23 AND qualifying.q2 IS NOT NULL;
SELECT races.year, races.name, races.date, races.time FROM drivers drivers JOIN qualifying qualifying ON drivers.driverid = qualifying.driverid JOIN races races ON qualifying.raceid = races.raceid WHERE drivers.dob = (SELECT min(dob) FROM drivers) AND qualifying.q1 = (SELECT min(q1) FROM qualifying);
SELECT count(DISTINCT drivers.driverid) FROM drivers drivers, results results, status status WHERE drivers.driverid = results.driverid AND results.statusid = status.statusid AND drivers.nationality = 'American' AND status.status = 'Puncture';
SELECT constructors.url FROM constructors INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid WHERE constructors.nationality = 'Italian' ORDER BY constructorstandings.points DESC LIMIT 1;
SELECT constructors.url FROM constructors INNER JOIN constructorstandings ON constructors.constructorid = constructorstandings.constructorid GROUP BY constructors.constructorid ORDER BY sum(constructorstandings.wins) DESC LIMIT 1;
SELECT drivers.forename FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE races.name = 'French Grand Prix' AND laptimes.lap = 3 ORDER BY laptimes.milliseconds ASC LIMIT 1;
SELECT MIN(laptimes.milliseconds) FROM laptimes WHERE laptimes.lap = 1;
SELECT AVG(laptimes.milliseconds) FROM laptimes laptimes INNER JOIN drivers drivers ON laptimes.driverid = drivers.driverid INNER JOIN races races ON laptimes.raceid = races.raceid WHERE races.year = 2006 AND races.name = 'United States Grand Prix' AND laptimes.position < 11;
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN pitstops ON drivers.driverid = pitstops.driverid INNER JOIN driverstandings ON pitstops.raceid = driverstandings.raceid INNER JOIN races ON pitstops.raceid = races.raceid INNER JOIN constructors ON driverstandings.raceid = constructors.constructorid WHERE constructors.nationality = 'German' AND strftime('%Y', drivers.dob) BETWEEN '1980' AND '1985' GROUP BY drivers.driverid ORDER BY avg(pitstops.duration) ASC LIMIT 3;
SELECT results.time FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.year = 2008 AND races.circuitid = 1;
SELECT races.year, constructors.constructorref, constructors.url FROM races INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructorresults ON results.resultid = constructorresults.constructorresultsid INNER JOIN constructors ON constructorresults.constructorid = constructors.constructorid WHERE races.year = 2009;
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers WHERE drivers.dob BETWEEN '1981' AND '1991' AND drivers.nationality = 'Austrian';
SELECT drivers.forename, drivers.surname, drivers.dob FROM drivers WHERE drivers.nationality = 'German' AND drivers.dob BETWEEN '1971-01-01' AND '1985-12-31' ORDER BY drivers.dob DESC;
SELECT circuits.country, circuits.lat, circuits.lng FROM circuits WHERE circuits.name = 'Hungaroring';
SELECT constructorresults.points, constructors.name, constructors.nationality FROM constructorresults INNER JOIN constructors ON constructorresults.constructorid = constructors.constructorid INNER JOIN races ON constructorresults.raceid = races.raceid WHERE races.year >= 1980 AND races.year <= 2010 AND races.name = 'Monaco Grand Prix' ORDER BY constructorresults.points DESC LIMIT 1;
SELECT avg(results.points) FROM results INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE races.name = 'Turkish Grand Prix' AND drivers.forename = 'Lewis' AND drivers.surname = 'Hamilton';
SELECT avg(races.year) FROM races WHERE races.date BETWEEN '2000-01-01' AND '2010-12-31';
SELECT nationality FROM drivers GROUP BY nationality ORDER BY count(nationality) DESC LIMIT 1;
SELECT wins FROM driverstandings WHERE position = 91;
SELECT races.name FROM races INNER JOIN laptimes ON races.raceid = laptimes.raceid INNER JOIN results ON laptimes.raceid = results.raceid WHERE results.fastestlaptime = (SELECT min(fastestlaptime) FROM results);
SELECT circuits.location, circuits.country FROM circuits WHERE circuits.circuitid IN (SELECT races.circuitid FROM races WHERE races.date = (SELECT max(date) FROM races));
SELECT drivers.forename, drivers.surname FROM qualifying INNER JOIN drivers ON qualifying.driverid = drivers.driverid INNER JOIN races ON qualifying.raceid = races.raceid INNER JOIN seasons ON races.year = seasons.year INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE qualifying.position = 1 AND qualifying.number = 3 AND circuits.name = 'Marina Bay Street Circuit' AND seasons.year = 2008 ORDER BY qualifying.q3 LIMIT 1;
SELECT drivers.forename , drivers.surname , drivers.nationality , races.name FROM drivers INNER JOIN driverstandings ON drivers.driverid = driverstandings.driverid INNER JOIN races ON driverstandings.raceid = races.raceid ORDER BY drivers.dob DESC LIMIT 1;
SELECT count(results.number) FROM results INNER JOIN status ON results.statusid = status.statusid INNER JOIN drivers ON results.driverid = drivers.driverid INNER JOIN races ON results.raceid = races.raceid WHERE status.status = 'Accident' AND races.name = 'Canadian Grand Prix' ORDER BY results.number DESC LIMIT 1;
SELECT driverstandings.wins, drivers.forename, drivers.surname FROM driverstandings INNER JOIN drivers ON driverstandings.driverid = drivers.driverid WHERE driverstandings.raceid = (SELECT MIN(raceid) FROM races);
SELECT max(pitstops.duration) FROM pitstops;
SELECT laptimes.time FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid ORDER BY laptimes.milliseconds ASC LIMIT 1;
SELECT max(duration) FROM pitstops WHERE driverid = 452;
SELECT pitstops.lap FROM pitstops INNER JOIN drivers ON pitstops.driverid = drivers.driverid INNER JOIN races ON pitstops.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton' AND races.name = 'Australian Grand Prix' AND races.year = 2011;
SELECT duration FROM pitstops JOIN drivers ON pitstops.driverid = drivers.driverid JOIN races ON pitstops.raceid = races.raceid WHERE races.year = 2011 AND races.name = 'Australian Grand Prix';
SELECT laptimes.milliseconds FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton' AND races.name = 'Formula_1';
sql placeholder
sql placeholder
SELECT laptimes.lap, laptimes.milliseconds FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid WHERE races.name = 'Austrian Grand Prix' ORDER BY laptimes.milliseconds ASC LIMIT 1;
SELECT time FROM laptimes WHERE raceid IN (SELECT raceid FROM races WHERE circuitid IN (SELECT circuitid FROM circuits WHERE country = 'Italy'));
SELECT races.name FROM races INNER JOIN laptimes ON laptimes.raceid = races.raceid WHERE laptimes.milliseconds = (SELECT MAX(laptimes.milliseconds) FROM laptimes WHERE laptimes.raceid = races.raceid) AND races.circuitid = (SELECT circuits.circuitid FROM circuits WHERE circuits.name = 'Austrian Grand Prix');
SELECT pitstops.duration FROM pitstops INNER JOIN drivers ON pitstops.driverid = drivers.driverid INNER JOIN races ON pitstops.raceid = races.raceid WHERE races.name = 'Austrian Grand Prix';
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN laptimes ON laptimes.raceid = races.raceid WHERE laptimes.time = '1:29.488';
SELECT avg(laptimes.milliseconds) FROM laptimes INNER JOIN drivers ON laptimes.driverid = drivers.driverid INNER JOIN races ON laptimes.raceid = races.raceid WHERE drivers.forename = 'Lewis' AND drivers.driverref = 'hamilton' AND drivers.surname = 'Hamilton';
SELECT cast(sum(laptimes.milliseconds) AS REAL) / count(laptimes.raceid) FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE circuits.country = 'Italy';
SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes);
SELECT player_name FROM player WHERE height = (SELECT MAX(height) FROM player);
SELECT player_attributes.preferred_foot FROM player_attributes WHERE player_attributes.potential = (SELECT MIN(potential) FROM player_attributes);
SELECT count(*) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating >= 60 AND player_attributes.overall_rating < 65 AND player_attributes.attacking_work_rate = 'low';
SELECT player_attributes.id FROM player_attributes ORDER BY player_attributes.crossing DESC LIMIT 5;
SELECT l.name FROM league l WHERE l.id IN (SELECT league_id FROM match WHERE season = '2015/2016' GROUP BY league_id HAVING SUM(home_team_goal + away_team_goal) = (SELECT max(SUM) FROM (SELECT SUM(home_team_goal + away_team_goal) AS SUM FROM match WHERE season = '2015/2016' GROUP BY league_id)));
sql placeholder
sql placeholder
sql placeholder
SELECT buildupplayspeed FROM team_attributes ORDER BY buildupplayspeed DESC LIMIT 4;
SELECT league.name FROM country INNER JOIN league ON country.id = league.country_id INNER JOIN match ON league.id = match.league_id WHERE match.season = '2015/2016' GROUP BY league.name ORDER BY SUM(match.home_team_goal = match.away_team_goal) DESC LIMIT 1;
sql placeholder
SELECT league.name, count(match.id) FROM league INNER JOIN match ON league.id = match.league_id GROUP BY league.name ORDER BY count(match.id) DESC LIMIT 1;
SELECT avg(height) FROM player WHERE birthday >= '1990-01-01 00:00:00' AND birthday < '1996-01-01 00:00:00';
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE substr(player_attributes.date,1,4) = '2010' ORDER BY player_attributes.overall_rating DESC LIMIT 1;
SELECT team_attributes.team_fifa_api_id FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplayspeed > 50 AND team_attributes.buildupplayspeed < 60;
SELECT team.team_long_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE strftime('%Y', team_attributes.date) = '2012' AND team_attributes.buildupplaypassingclass = 'Long';
sql placeholder
SELECT league.name FROM league JOIN match ON league.id = match.league_id GROUP BY league.name ORDER BY sum(match.home_team_goal + match.away_team_goal) ASC LIMIT 5;
SELECT avg(long_shots) FROM player_attributes WHERE player_attributes.player_fifa_api_id = 218353;
sql placeholder
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE buildupplaydribblingclass = 'Normal' AND date >= '2014-01-01 00:00:00' AND date <= '2014-01-31 00:00:00' ORDER BY chancecreationpassing DESC;
SELECT league.name FROM league JOIN match ON league.id = match.league_id WHERE match.season = '2009/2010' GROUP BY league.name HAVING AVG(match.home_team_goal) > AVG(match.away_team_goal);
SELECT team.team_short_name FROM team WHERE team.team_long_name = 'Queens Park Rangers';
SELECT player.player_name FROM player WHERE substr(birthday,1,7) = '1970-10';
SELECT player_attributes.attacking_work_rate FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Franco Zennaro';
SELECT team_attributes.buildupplaypositioningclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'ADO Den Haag';
SELECT heading_accuracy FROM player_attributes WHERE player_api_id = 505942 AND date = '2014-09-18 00:00:00';
SELECT overall_rating FROM player_attributes WHERE player_api_id = 2011 AND strftime('%Y', date) = '2011';
SELECT count(match.id) FROM match INNER JOIN league ON match.league_id = league.id INNER JOIN country ON league.country_id = country.id WHERE match.season = '2015/2016' AND league.name = 'Scotland Premier League';
SELECT preferred_foot FROM player_attributes WHERE player_fifa_api_id IN (SELECT player_fifa_api_id FROM player WHERE birthday = (SELECT max(birthday) FROM player));
SELECT * FROM player_attributes ORDER BY potential DESC LIMIT 1;
sql placeholder
SELECT team.team_short_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.chancecreationpassingclass = 'Risky';
SELECT player_attributes.defensive_work_rate FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'David Wilson';
SELECT player.birthday FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating = (SELECT MAX(overall_rating) FROM player_attributes);
SELECT league.name FROM league WHERE league.country_id = ( SELECT country.id FROM country WHERE country.name = 'Netherlands' );
SELECT avg(match.home_team_goal) AS average_home_team_goal FROM match INNER JOIN country ON match.country_id = country.id WHERE country.name = 'Poland' AND match.season = '2010/2011';
sql placeholder
SELECT player.player_name FROM player WHERE player.height>180;
SELECT count(player_name) FROM player WHERE strftime('%Y', birthday) > '1990';
SELECT count(player.id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight > 170 AND player.player_name LIKE 'Adam%';
SELECT player.player_name FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating > 80 AND strftime('%Y', player_attributes.date) BETWEEN '2008' AND '2010';
SELECT potential FROM player_attributes WHERE player_api_id = 505942;
SELECT player.player_name FROM player INNER JOIN player_attributes ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.preferred_foot = 'left';
SELECT team.team_long_name FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplayspeedclass = 'Fast';
SELECT team_attributes.buildupplaypassingclass FROM team_attributes INNER JOIN team ON team_attributes.team_fifa_api_id = team.team_fifa_api_id WHERE team.team_short_name = 'CLB';
SELECT team.team_short_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team_attributes.buildupplaypassing > 70;
SELECT avg(overall_rating) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.height > 170;
SELECT DISTINCT player_name FROM player ORDER BY height ASC LIMIT 1;
SELECT country.name FROM league INNER JOIN country ON league.country_id = country.id WHERE league.name = 'Italy Serie A';
SELECT team.team_short_name FROM team_attributes team_attributes JOIN team team ON team_attributes.team_api_id = team.team_api_id WHERE team_attributes.buildupplayspeed = 31 AND team_attributes.buildupplaydribbling = 53 AND team_attributes.buildupplaypassing = 32;
SELECT avg(player_attributes.overall_rating) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Aaron Doran';
SELECT count(match.id) FROM match INNER JOIN league ON match.league_id = league.id INNER JOIN country ON league.country_id = country.id WHERE league.name = 'Germany 1. Bundesliga' AND strftime('%Y-%m', match.date) BETWEEN '2008-08' AND '2008-10';
SELECT team.team_short_name FROM team JOIN match ON team.team_api_id = match.home_team_api_id WHERE match.home_team_goal = 10;
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.balance = (SELECT max(balance) FROM player_attributes WHERE balance = 61) AND player_attributes.potential = 61;
sql placeholder
SELECT team.team_long_name FROM team WHERE team.team_short_name LIKE 'GEN';
SELECT player_name FROM player ORDER BY birthday DESC LIMIT 1;
SELECT player_name FROM player WHERE height = (SELECT MAX(height) FROM player);
SELECT count(DISTINCT player_attributes.player_api_id) FROM player_attributes player_attributes WHERE player_attributes.preferred_foot = 'left' AND player_attributes.attacking_work_rate = 'low';
SELECT name FROM country WHERE id IN (SELECT country_id FROM league WHERE name = 'Belgium Jupiler League');
SELECT league.name FROM league INNER JOIN country ON league.country_id = country.id WHERE country.name = 'Germany';
SELECT player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player_attributes.overall_rating DESC LIMIT 1;
SELECT count(DISTINCT player.id) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE strftime('%Y', birthday)<'1986' AND player_attributes.defensive_work_rate = 'high';
SELECT player.player_name FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id GROUP BY player_attributes.player_api_id ORDER BY player_attributes.crossing DESC LIMIT 1;
SELECT player_attributes.heading_accuracy FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = '<NAME>';
SELECT count(player_attributes.id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.height > 180 AND player_attributes.volleys > 70;
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.volleys > 70 AND player_attributes.dribbling > 70;
SELECT count(match.id) FROM match INNER JOIN country ON match.country_id = country.id WHERE country.name = 'Belgium' AND match.season = '2008/2009';
SELECT long_passing FROM player_attributes WHERE player_api_id IN (SELECT player_api_id FROM player WHERE birthday = (SELECT min(birthday) FROM player));
SELECT count(match.id) FROM match INNER JOIN league ON match.league_id = league.id INNER JOIN country ON league.country_id = country.id WHERE league.name = 'Belgium Jupiler League' AND SUBSTR(`date`, 1, 7) = '2009-04';
SELECT league.name FROM league WHERE league.id = (SELECT league_id FROM match WHERE season = '2008/2009' GROUP BY league_id HAVING count(*) = (SELECT max(match_count) FROM (SELECT count(*) AS match_count FROM match WHERE season = '2008/2009' GROUP BY league_id)));
SELECT avg(player_attributes.overall_rating) FROM player_attributes JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE strftime('%Y', player.birthday) < '1986';
SELECT cast((sum(CASE WHEN player.player_name = 'Ariel Borysiuk' THEN player_attributes.overall_rating END) - sum(CASE WHEN player.player_name = 'Paulin Puel' THEN player_attributes.overall_rating END)) AS REAL) * 100 / sum(CASE WHEN player.player_name = 'Paulin Puel' THEN player_attributes.overall_rating END) FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id;
SELECT avg(buildupplayspeed) FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Heart of Midlothian';
SELECT avg(player_attributes.overall_rating) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Pietro Marino';
SELECT SUM(crossing) FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Aaron Lennox');
SELECT team.team_long_name, MAX(team_attributes.chancecreationpassing), team_attributes.chancecreationpassingclass FROM team INNER JOIN team_attributes ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Ajax' GROUP BY team_attributes.chancecreationpassingclass;
SELECT preferred_foot FROM player_attributes WHERE player_fifa_api_id = (SELECT player_fifa_api_id FROM player WHERE player_name = 'Abdou Diallo');
SELECT MAX(overall_rating) FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Dorlan Pabon');
sql placeholder
SELECT player.player_name FROM player JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.overall_rating = 77 AND player_attributes.date LIKE '2016-06-23%' ORDER BY player.birthday DESC LIMIT 1;
SELECT overall_rating FROM player_attributes WHERE player_api_id = (SELECT player_api_id FROM player WHERE player_name = 'Aaron Mooy') AND date LIKE '2016-02-04%';
SELECT player_attributes.potential FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Francesco Parravicini' AND player_attributes.date = '2010-08-30 00:00:00';
SELECT attacking_work_rate FROM player_attributes WHERE player_api_id = 505942 AND date LIKE '2015-05-01%';
SELECT defensive_work_rate FROM player_attributes WHERE `date` = '2013-02-22' AND player_api_id = 505942;
SELECT player_attributes.date FROM player_attributes WHERE player_attributes.player_api_id = 505942 ORDER BY player_attributes.crossing DESC LIMIT 1;
SELECT team_attributes.defenceteamwidthclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Willem II' AND team_attributes.date = '2012-02-22';
SELECT player_attributes.dribbling FROM player_attributes INNER JOIN team_attributes ON player_attributes.date = team_attributes.date INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_short_name = 'LEI' AND team_attributes.date = '2015-09-10 00:00:00';
sql placeholder
SELECT team_attributes.chancecreationpassingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'PEC Zwolle' AND team_attributes.date = '2013-09-20 00:00:00';
SELECT team_attributes.chancecreationcrossingclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name LIKE 'Hull City' AND team_attributes.date = '2010-02-22 00:00:00';
SELECT team_attributes.defenceaggressionclass FROM team_attributes JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'Hannover 96' AND team_attributes.date LIKE '2015-09-10%';
SELECT avg(overall_rating) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = 'Marko Arnautovic' AND date BETWEEN '2007-02-22' AND '2016-04-21';
SELECT ( SELECT overall_rating FROM player_attributes WHERE player_api_id = 505942 AND date = '2013-07-12' ) - ( SELECT overall_rating FROM player_attributes WHERE player_api_id = 155782 AND date = '2013-07-12' ) AS RESULT;
SELECT player_name FROM player ORDER BY height DESC LIMIT 1;
sql placeholder
SELECT player_name FROM player WHERE (datetime(CURRENT_TIMESTAMP,'localtime') - datetime(birthday)) > 34;
SELECT count(match.home_team_goal) FROM match INNER JOIN player ON match.away_player_11 = player.player_api_id WHERE player.player_name = '<NAME>';
SELECT sum(away_team_goal) FROM match WHERE away_player_11 = 46552 OR away_player_10 = 46552 OR away_player_9 = 46552 OR away_player_8 = 46552 OR away_player_7 = 46552 OR away_player_6 = 46552 OR away_player_5 = 46552 OR away_player_4 = 46552 OR away_player_3 = 46552 OR away_player_2 = 46552 OR away_player_1 = 46552;
sql placeholder
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
SELECT player.player_name FROM player_attributes player_attributes JOIN player player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.potential = (SELECT max(potential) FROM player_attributes);
SELECT player.player_name FROM player_attributes player_attributes JOIN player player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.attacking_work_rate = 'high';
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE finishing = 1) ORDER BY birthday DESC LIMIT 1;
SELECT player.player_name FROM player INNER JOIN league ON player.id = league.id WHERE league.name = 'Belgium';
SELECT country.name FROM player_attributes INNER JOIN country ON player_attributes.player_api_id = country.id WHERE player_attributes.vision > 89;
sql placeholder
SELECT team_long_name FROM team WHERE team_api_id IN (SELECT team_api_id FROM team_attributes WHERE buildupplayspeedclass = 'Slow');
SELECT team.team_short_name FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE chancecreationpassingclass = 'Safe';
SELECT avg(player.height) AS avg_height FROM player INNER JOIN country ON player.id = country.id WHERE country.name = 'Italy';
SELECT player.player_name FROM player WHERE player.height > 180 ORDER BY player.player_name ASC LIMIT 0, 3;
SELECT count(*) FROM player WHERE birthday > '1990' AND player_name LIKE 'Aaron%';
SELECT (SELECT jumping FROM player_attributes WHERE id = 6) - (SELECT jumping FROM player_attributes WHERE id = 23) FROM player WHERE id = 23;
SELECT player_api_id FROM player_attributes WHERE preferred_foot = 'right' GROUP BY player_api_id ORDER BY MIN(potential) LIMIT 5;
SELECT count(player_attributes.player_api_id) FROM player_attributes WHERE player_attributes.preferred_foot = 'left' AND player_attributes.crossing = (SELECT MAX(crossing) FROM player_attributes);
SELECT cast(count(CASE WHEN player_attributes.stamina > 80 AND player_attributes.strength > 80 THEN player.id ELSE NULL END) AS REAL) * 100 / count(player.id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id;
SELECT DISTINCT country.name FROM country INNER JOIN league ON country.id = league.country_id WHERE league.name = 'Poland Ekstraklasa';
SELECT home_team_goal, away_team_goal FROM match WHERE league_id = (SELECT id FROM league WHERE name = 'Belgium Jupiler League') AND date LIKE '2008-09-24%';
SELECT player_attributes.sprint_speed, player_attributes.agility, player_attributes.acceleration FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.player_name = '<NAME>';
SELECT team_attributes.buildupplayspeedclass FROM team_attributes INNER JOIN team ON team_attributes.team_fifa_api_id = team.team_fifa_api_id WHERE team.team_long_name = 'KSV Cercle Brugge';
SELECT count(match.id) FROM match INNER JOIN league ON match.league_id = league.id WHERE league.name = 'Italian Serie A' AND match.season = '2015/2016';
SELECT MAX(home_team_goal) FROM match WHERE league_id = (SELECT id FROM league WHERE name = 'Netherlands Eredivisie');
SELECT player_attributes.finishing , player_attributes.curve FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player.weight = (SELECT max(weight) FROM player);
SELECT name FROM league WHERE id IN (SELECT league_id FROM match WHERE season = '2015/2016' GROUP BY league_id ORDER BY COUNT(id) DESC LIMIT 4);
SELECT team_long_name FROM team WHERE team_api_id IN (SELECT away_team_api_id FROM match WHERE away_team_goal = (SELECT max(away_team_goal) FROM match));
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.overall_rating = (SELECT MAX(overall_rating) FROM player_attributes);
SELECT (count(DISTINCT CASE WHEN player.height < 180 AND player_attributes.overall_rating > 70 THEN player.player_api_id END) * 100.0 / count(DISTINCT player.player_api_id)) AS percentage FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id;
SELECT CASE WHEN sex = 'M' AND admission = '+' THEN 1 ELSE 0 END AS inpatient , CASE WHEN sex = 'M' AND admission = '-' THEN 1 ELSE 0 END AS outpatient FROM patient GROUP BY sex , admission ORDER BY inpatient DESC , outpatient DESC;
sql placeholder
sql placeholder
SELECT calculation FROM (SELECT COUNT(id) AS calculation FROM patient WHERE diagnosis = 'SLE' GROUP BY admission);
SELECT diagnosis FROM patient WHERE id = 30609;
SELECT examination.`examination date`, patient.sex, patient.birthday FROM examination JOIN patient ON examination.id = patient.id WHERE examination.id = 163109;
SELECT patient.id, patient.sex, patient.birthday FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ldh > '500';
sql placeholder
SELECT patient.id, patient.sex, patient.diagnosis FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.thrombosis = 2;
sql placeholder
sql placeholder
SELECT (count(*) * 100.0 / (SELECT count(*) FROM patient WHERE sex = 'F')) AS percentage FROM laboratory WHERE tp < '6.0' OR tp > '8.5';
sql placeholder
sql placeholder
sql placeholder
SELECT count(DISTINCT examination.id) FROM examination examination JOIN patient patient ON examination.id = patient.id WHERE examination.thrombosis = '1' AND patient.sex = 'F' AND strftime('%Y', examination.`examination date`) = '1997';
sql placeholder
SELECT symptoms, diagnosis FROM examination WHERE id IN (SELECT id FROM patient WHERE birthday = (SELECT max(birthday) FROM patient)) AND symptoms IS NOT NULL;
sql placeholder
sql placeholder
SELECT (count(DISTINCT CASE WHEN patient.sex = 'M' THEN patient.id END) * 1.0 / count(DISTINCT CASE WHEN patient.sex = 'F' THEN patient.id END)) AS ratio FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.ua <= '8.0' OR laboratory.ua <= '6.5';
sql placeholder
sql placeholder
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` >= '2.0' AND patient.sex = 'M';
SELECT patient.diagnosis FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.`examination date` BETWEEN '1985-01-01' AND '1995-12-31' GROUP BY patient.diagnosis ORDER BY COUNT(patient.diagnosis) DESC LIMIT 1;
SELECT avg(2009 - strftime('%Y', patient.birthday)) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.date BETWEEN '1991-10-01' AND '1991-10-30';
sql placeholder
SELECT examination.ana FROM examination INNER JOIN patient ON examination.id = patient.id WHERE `examination date` = '1996-12-02' AND patient.id = 3605340;
SELECT CASE WHEN laboratory.`t-cho` < 250 THEN 'Normal' ELSE 'Abnormal' END FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.id = 2927464 AND strftime('%Y-%m-%d', laboratory.date) = '1995-09-04';
SELECT patient.sex FROM patient WHERE patient.diagnosis = 'AORTITIS' LIMIT 1;
SELECT * FROM laboratory WHERE id = (SELECT id FROM patient WHERE diagnosis = 'SLE' AND description = '1994-02-19') AND date = '1993/11/12';
SELECT CASE WHEN patient.sex = 'M' THEN 'man' WHEN patient.sex = 'F' THEN 'women' END FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.gpt = 9 AND laboratory.got = 9 AND laboratory.date = '1992-06-12';
sql placeholder
SELECT COUNT(id) FROM patient WHERE `first date` = '1991-06-13' AND diagnosis = 'SJS';
SELECT diagnosis FROM examination WHERE `examination date` = '1997-01-27' AND diagnosis = 'SLE';
SELECT symptoms FROM examination WHERE `examination date` = '1993-09-27' AND id = (SELECT id FROM patient WHERE birthday = '1959-03-01');
sql placeholder
SELECT * FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'Behcet' AND examination.`examination date` BETWEEN '1997-1-1' AND '1997-1-31';
SELECT patient.id FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.`examination date` BETWEEN '1987-07-06' AND '1996-01-31' AND laboratory.gpt > 30 AND laboratory.alb < 4;
SELECT patient.id FROM patient WHERE patient.sex = 'F' AND strftime('%Y', patient.birthday) = '1964' AND patient.admission = '+';
SELECT id FROM examination WHERE thrombosis = 2 AND `ana pattern` = 'S' AND `acl igm` > (SELECT AVG(`acl igm`) FROM examination);
SELECT 100 * SUM(CASE WHEN laboratory.`u-pro` > 0 AND laboratory.`u-pro` < 30 AND laboratory.ua <= 6.5 THEN 1 ELSE 0 END) / COUNT(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id;
sql placeholder
sql placeholder
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.`ana pattern` != 'P' AND patient.sex = 'F' AND birthday BETWEEN '1980-01-01' AND '1989-12-31';
SELECT patient.sex FROM patient JOIN examination ON patient.id = examination.id JOIN laboratory ON patient.id = laboratory.id WHERE examination.diagnosis = 'PSS' AND laboratory.crp = '1' AND laboratory.ldh = '123' AND laboratory.igm = '123';
SELECT avg(laboratory.alb) FROM laboratory JOIN patient ON laboratory.id = patient.id WHERE patient.diagnosis = 'SLE' AND laboratory.plt > 400 AND patient.sex = 'F';
SELECT symptoms FROM examination examination INNER JOIN patient patient ON examination.id = patient.id WHERE patient.diagnosis = 'SLE' GROUP BY symptoms ORDER BY count(symptoms) DESC LIMIT 1;
SELECT description AS medical_information_first_documented, diagnosis AS disease FROM patient WHERE id = 48473;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN examination examination ON patient.id = examination.id WHERE patient.sex = 'F' AND examination.diagnosis = 'APS';
sql placeholder
SELECT (SUM(diagnosis LIKE '%Itp%') * 100.0 / (SELECT SUM(diagnosis LIKE '%SLE%') FROM examination)) AS calculation FROM examination WHERE symptoms LIKE '%thrombocytopenia%';
SELECT cast(count(CASE WHEN patient.diagnosis = 'RA' AND patient.sex = 'F' THEN patient.id ELSE NULL END) AS REAL) * 100 / count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'M' AND examination.`examination date` between '1995' and '1997' AND patient.diagnosis = 'Behcet' AND patient.admission = '-';
SELECT count(DISTINCT patient.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.wbc < 3.5 AND patient.sex = 'F';
sql placeholder
SELECT CASE WHEN laboratory.ua > 8.0 AND patient.sex = 'M' THEN 'Normal' WHEN laboratory.ua > 6.5 AND patient.sex = 'F' THEN 'Normal' ELSE 'Abnormal' END FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.id = 57266;
SELECT date FROM laboratory WHERE id = 48473 AND got >= 60;
sql placeholder
SELECT laboratory.id FROM laboratory laboratory JOIN patient patient ON laboratory.id = patient.id WHERE laboratory.gpt >= 60 AND patient.sex = 'M';
sql placeholder
SELECT avg(laboratory.ldh) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ldh < 500;
sql placeholder
SELECT admission FROM patient WHERE id IN (SELECT id FROM laboratory WHERE alp < 300);
SELECT CASE WHEN alp < 300 THEN 'Normal' ELSE 'Abnormal' END FROM laboratory WHERE id = (SELECT id FROM patient WHERE birthday = '1982-04-01');
SELECT patient.id, patient.sex, patient.birthday FROM patient JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tp < 6.0;
sql placeholder
sql placeholder
SELECT CASE WHEN laboratory.alb BETWEEN 3.5 AND 5.5 THEN 'Normal' ELSE 'Abnormal' END FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) = '1982';
SELECT count(*) * 100.0 / (SELECT count(*) FROM patient WHERE sex = 'F') FROM laboratory WHERE ua > 8.0 OR ua > 6.5;
SELECT avg(laboratory.ua) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ua < 8.0 AND patient.sex = 'M' OR laboratory.ua < 6.5 AND patient.sex = 'F';
SELECT patient.id, patient.sex, patient.birthday FROM patient JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.un = 29;
sql placeholder
sql placeholder
sql placeholder
SELECT patient.id , patient.sex , patient.birthday FROM patient WHERE patient.id = ( SELECT id FROM laboratory GROUP BY id ORDER BY max(`t-bil`) DESC LIMIT 1 );
SELECT patient.sex, GROUP_CONCAT(DISTINCT examination.id) FROM patient JOIN examination ON patient.id = examination.id JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`t-bil` >= 2.0 GROUP BY patient.sex;
SELECT patient.id, laboratory.`t-cho` FROM patient INNER JOIN laboratory ON patient.id = laboratory.id ORDER BY laboratory.`t-cho` DESC LIMIT 1;
sql placeholder
SELECT patient.id, patient.diagnosis FROM patient JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg > 300;
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
SELECT patient.id, patient.sex, patient.birthday FROM patient JOIN laboratory ON patient.id = laboratory.id JOIN examination ON patient.id = examination.id WHERE (laboratory.wbc <= 3.5 OR laboratory.wbc >= 9.0) OR (examination.`acl igm` <= 3.5 OR examination.`acl igm` >= 9.0) OR (examination.`acl igg` <= 3.5 OR examination.`acl igg` >= 9.0) GROUP BY patient.sex, patient.birthday HAVING count(*) > 0 ORDER BY patient.birthday ASC;
sql placeholder
sql placeholder
sql placeholder
sql placeholder
SELECT patient.id , strftime('%Y', current_timestamp) - strftime('%Y', patient.birthday) AS age FROM patient INNER JOIN examination examination ON patient.id = examination.id INNER JOIN laboratory laboratory ON patient.id = laboratory.id GROUP BY patient.id HAVING COUNT(patient.id) > 2 AND laboratory.hct >= 52;
SELECT avg(laboratory.hct) FROM laboratory WHERE laboratory.date LIKE '1991%' AND laboratory.hct < 29;
SELECT SUM(plt < 100), SUM(plt > 400) FROM laboratory WHERE id IN (SELECT id FROM patient WHERE id IN (SELECT id FROM examination WHERE plt <= 100 OR plt >= 400));
sql placeholder
sql placeholder
sql placeholder
SELECT count(laboratory.id) FROM examination examination INNER JOIN laboratory laboratory ON examination.id = laboratory.id WHERE examination.`examination date` > '1997-01-01' AND laboratory.aptt < 45;
SELECT count(DISTINCT examination.id) FROM examination examination INNER JOIN laboratory laboratory ON examination.id = laboratory.id WHERE laboratory.aptt > 45 AND examination.thrombosis = 0;
SELECT count(laboratory.fg) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.sex = 'M' AND laboratory.wbc > 3.5 AND laboratory.wbc < 9.0 AND laboratory.fg <= 150 OR laboratory.fg >= 450;
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id JOIN examination examination ON patient.id = examination.id WHERE patient.birthday > '1980-01-01' AND laboratory.fg BETWEEN 150 AND 450;
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.`u-pro` >= 30;
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE 0 < laboratory.`u-pro` AND laboratory.`u-pro` < 30 AND examination.diagnosis = 'SLE';
SELECT DISTINCT count(examination.id) FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.`acl igg` >= 2000;
SELECT count(examination.id) FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.`acl igg` > 900 AND examination.`acl igg` < 2000 AND examination.symptoms IS NOT NULL;
sql placeholder
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.`acl iga` > 80 AND examination.`acl iga` < 500 AND strftime('%Y', patient.`first date`) >= 1990;
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rf < 20 AND patient.diagnosis != 'thrombosis';
SELECT count(DISTINCT examination.id) FROM examination JOIN patient ON examination.id = patient.id WHERE examination.`acl iga` = 3 AND examination.`ana pattern` = 'P';
sql placeholder
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE examination.`acl iga` = 4 AND laboratory.c4 > 10;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rnp = '-' AND patient.admission = '+';
SELECT birthday FROM patient WHERE id IN (SELECT id FROM laboratory WHERE rnp NOT IN('-', '+-')) ORDER BY birthday DESC LIMIT 1;
SELECT count(DISTINCT examination.id) FROM examination examination INNER JOIN laboratory laboratory ON examination.id = laboratory.id WHERE examination.thrombosis = 0 AND laboratory.sm NOT IN('-', '+-');
SELECT patient.id FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE laboratory.sm NOT IN ('negative', '0') ORDER BY patient.birthday DESC LIMIT 3;
sql placeholder
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON laboratory.id = patient.id INNER JOIN examination ON examination.id = patient.id WHERE laboratory.sc170 IN('negative', '0') AND patient.sex = 'F' AND examination.symptoms IS NULL;
sql placeholder
sql placeholder
SELECT count(DISTINCT patient.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.ssb IN('-', '+-') AND examination.diagnosis = 'SLE';
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.ssb IN ('negative', '0') AND examination.symptoms IS NOT NULL;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.centromea IN('-', '+-') AND laboratory.ssb IN('-', '+-') AND patient.sex = 'M';
SELECT DISTINCT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.dna >= 8;
SELECT count(DISTINCT patient.id) FROM patient LEFT JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.dna < 8 AND patient.description IS NULL;
SELECT count(patient.id) FROM examination INNER JOIN patient ON examination.id = patient.id WHERE 900 < examination.`acl igg` AND examination.`acl igg` < 2000 AND patient.admission = '+';
sql placeholder
sql placeholder
SELECT MIN(patient.birthday) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.got >= 60;
SELECT patient.birthday FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.gpt < 60 ORDER BY laboratory.gpt DESC LIMIT 3;
SELECT count(DISTINCT patient.id) FROM patient patient, laboratory laboratory WHERE patient.id = laboratory.id AND laboratory.got < 60 AND patient.sex = 'M';
SELECT MIN(`first date`) FROM patient WHERE `first date` = (SELECT max(ldh) FROM laboratory WHERE ldh < 500);
sql placeholder
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.alp >= 300;
SELECT count(laboratory.alp) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE patient.admission = '-' AND laboratory.alp < 300;
SELECT patient.diagnosis FROM patient WHERE patient.id IN (SELECT laboratory.id FROM laboratory WHERE laboratory.tp < 6.0);
sql placeholder
SELECT examination.`examination date` FROM examination JOIN laboratory ON examination.id = laboratory.id WHERE laboratory.alb = (SELECT MAX(alb) FROM laboratory WHERE alb > 3.5 AND alb < 5.5);
sql placeholder
sql placeholder
sql placeholder
sql placeholder
SELECT count(examination.id) FROM examination INNER JOIN laboratory ON examination.id = laboratory.id WHERE examination.`ana pattern` LIKE '%P%' AND laboratory.`t-bil` >= 2.0;
SELECT examination.`acl igg` FROM examination INNER JOIN laboratory ON examination.id = laboratory.id WHERE `t-bil` < 2.0;
SELECT count(DISTINCT patient.id) FROM examination examination JOIN laboratory laboratory ON examination.id = laboratory.id JOIN patient patient ON examination.id = patient.id WHERE examination.kct = '-' AND laboratory.`t-cho` >= 250;
SELECT count(examination.id) FROM examination INNER JOIN laboratory ON examination.id = laboratory.id WHERE examination.`ana pattern` = 'P' AND `t-cho` < 250;
sql placeholder
SELECT patient.diagnosis FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.tg < 200;
SELECT patient.id FROM examination INNER JOIN laboratory ON examination.id = laboratory.id INNER JOIN patient ON examination.id = patient.id WHERE examination.thrombosis = 0 AND laboratory.cpk < 250;
SELECT count(examination.id) FROM examination JOIN patient ON examination.id = patient.id WHERE patient.diagnosis = 'Normal' AND (examination.kct = '+' OR examination.rvvt = '+' OR examination.lac = '+');
SELECT birthday FROM patient WHERE id IN (SELECT id FROM laboratory WHERE glu > 180) ORDER BY birthday LIMIT 1;
SELECT count(examination.id) FROM examination examination INNER JOIN laboratory laboratory ON examination.id = laboratory.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT count(laboratory.wbc) FROM examination INNER JOIN patient ON examination.id = patient.id INNER JOIN laboratory ON laboratory.id = patient.id WHERE examination.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT patient.id FROM patient JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.rbc > 3.5 OR laboratory.rbc < 6.0 AND patient.admission = '-';
SELECT count(patient.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.plt > 100 AND laboratory.plt < 400 AND patient.diagnosis IS NOT NULL;
SELECT laboratory.plt FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'MCTD' AND (laboratory.plt > 100 AND laboratory.plt < 400);
SELECT avg(laboratory.pt) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.sex = 'M' AND laboratory.pt < 14;
sql placeholder
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders';
SELECT count(*) FROM member WHERE link_to_major IN (SELECT major_id FROM major WHERE college = 'College of Engineering');
SELECT first_name, last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department';
sql placeholder
SELECT member.phone FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer';
sql placeholder
SELECT e.event_name FROM event e JOIN attendance a ON e.event_id = a.link_to_event GROUP BY e.event_id ORDER BY COUNT(a.link_to_event) DESC LIMIT 1;
SELECT college FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'Vice President';
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean';
sql placeholder
SELECT count(event.event_id) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.type = 'Meeting' AND member.last_name = 'Student_Club';
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_name HAVING COUNT(event.event_id) > 20 AND event.type != 'Fundraiser';
sql placeholder
SELECT expense_description FROM expense WHERE cost = ( SELECT max(cost) FROM expense );
SELECT count(member.member_id) FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud';
SELECT member.last_name FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE major.major_name = 'Law and Constitutional Studies';
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.last_name = 'Ramsey' AND member.first_name = 'Sherri';
SELECT major.college FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.last_name = 'Hewitt' AND member.first_name = 'Tyler';
SELECT income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE position = 'Vice President';
SELECT budget.category , budget.spent FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Meeting' AND budget.category = 'Food';
SELECT city, state FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE position = 'President';
SELECT first_name, last_name FROM member WHERE zip IN (SELECT zip_code FROM zip_code WHERE state = 'Illinois');
SELECT budget.spent FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Advertisement' AND event.event_name = 'September Meeting';
SELECT major.department FROM major INNER JOIN member ON member.link_to_major = major.major_id WHERE member.last_name = 'Pierce' AND member.first_name = 'Guidi';
SELECT sum(budget.amount) FROM budget budget INNER JOIN event event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Speaker';
SELECT CASE WHEN expense.approved = 'true' THEN 'Yes' ELSE 'No' END FROM expense INNER JOIN event ON expense.link_to_budget = event.event_id WHERE event.event_name = 'October Meeting' AND expense.expense_date = '2019-10-08';
sql placeholder
sql placeholder
SELECT event.location FROM event WHERE event.event_name = 'Spring Budget Review';
SELECT expense.cost FROM expense WHERE expense.expense_description = 'Posters' AND expense.expense_date = '2019-09-04';
SELECT budget.remaining FROM budget WHERE budget.category = 'Food' ORDER BY budget.amount DESC LIMIT 1;
SELECT income.notes FROM income WHERE income.date_received = '2019-09-14' AND income.source = 'Fundraising';
SELECT count(*) FROM major WHERE major.college = 'College of Humanities and Social Sciences';
SELECT member.phone FROM member WHERE member.first_name = 'Carlo' AND member.last_name = 'Jacobs';
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Adela' AND member.last_name = 'O''Gallagher' GROUP BY zip_code.county;
SELECT count(*) FROM budget budget JOIN event event ON budget.link_to_event = event.event_id WHERE budget.remaining < 0 AND event.event_name = 'November Meeting';
SELECT SUM(budget.amount) FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'SEPTEMBER SPEAKER';
SELECT DISTINCT event.status FROM budget INNER JOIN attendance ON budget.link_to_event = attendance.link_to_event INNER JOIN expense ON attendance.link_to_member = expense.link_to_member INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Post Cards, Posters' AND expense.expense_date = '2019-8-20';
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.last_name = 'Thomason' AND member.first_name = 'Brent';
SELECT count(member.member_id) FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';
SELECT zip_code.type FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Christof' AND member.last_name = 'Nielson';
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE position = 'Vice President';
SELECT state FROM zip_code WHERE city = 'Hometown';
SELECT major.department FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'President';
SELECT member.first_name, member.last_name, income.date_received FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.source = 'Dues';
SELECT member.first_name, member.last_name FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.source = 'Dues' ORDER BY income.date_received ASC LIMIT 1;
SELECT (SELECT sum(budget.amount) FROM budget budget JOIN event event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff') / (SELECT sum(budget.amount) FROM budget budget JOIN event event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting') AS ratio FROM budget LIMIT 1;
SELECT (sum(CASE WHEN budget.category = 'Parking' AND event.event_name = 'November Speaker' THEN budget.amount ELSE 0 END) / sum(budget.amount) * 100.0) AS percentage FROM budget budget JOIN event event ON budget.link_to_event = event.event_id WHERE event.event_name = 'November Speaker';
SELECT SUM(expense.cost) AS total_cost FROM expense WHERE expense.expense_description = 'Pizza';
SELECT count(*) FROM zip_code WHERE county = 'Orange County' AND state = 'Virginia';
SELECT major.department FROM major WHERE college = 'College of Humanities and Social Sciences';
SELECT zip_code.city FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.last_name = 'Firth' AND member.first_name = 'Amy';
SELECT expense.expense_description FROM budget budget JOIN expense expense ON budget.budget_id = expense.link_to_budget WHERE budget.remaining = (SELECT MIN(remaining) FROM budget);
SELECT member.first_name, member.last_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'October Meeting';
SELECT major.college FROM member member INNER JOIN major major ON member.link_to_major = major.major_id GROUP BY major.college HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM member GROUP BY link_to_major));
SELECT major.major_name FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.phone = '809-555-3360';
SELECT event.event_name FROM budget budget INNER JOIN event event ON budget.link_to_event = event.event_id GROUP BY event.event_name ORDER BY budget.amount DESC LIMIT 1;
SELECT expense.expense_description FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE member.position = 'Vice President';
SELECT count(link_to_member) FROM attendance WHERE link_to_event LIKE 'recI43CzsZ0Q625ma';
SELECT income.date_received FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.last_name = 'Mason' AND member.first_name = 'Casey';
SELECT count(member_id) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE zip_code.state = 'Maryland';
SELECT count(attendance.link_to_event) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE member.phone = '954-555-6240';
SELECT member.first_name, member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'School of Applied Sciences, Technology and Education';
sql placeholder
SELECT count(member_id) FROM member WHERE position = 'President';
SELECT MAX(spent) FROM budget WHERE budget_id IN (SELECT budget_id FROM event WHERE type = 'Budget');
sql placeholder
SELECT SUM(budget.spent) FROM budget WHERE budget.category = 'Food';
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member GROUP BY member.member_id HAVING COUNT(attendance.link_to_event) > 7;
sql placeholder
SELECT member.first_name , member.last_name FROM member INNER JOIN zip_code ON zip_code.zip_code = member.zip WHERE zip_code.city = 'Georgetown' AND zip_code.state = 'South Carolina';
SELECT count(income.amount) FROM income WHERE income.link_to_member = 'rec280Sk7o31iG0Tx';
SELECT member.first_name, member.last_name FROM member INNER JOIN income ON member.member_id = income.link_to_member WHERE income.amount > 40;
SELECT SUM(expense.cost) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';
SELECT member.first_name, member.last_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Yearly Kickoff';
SELECT member.first_name || ' ' || member.last_name AS full_name, income.source FROM member INNER JOIN income ON member.member_id = income.link_to_member ORDER BY income.amount DESC LIMIT 1;
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event ORDER BY budget.amount LIMIT 1;
sql placeholder
SELECT SUM(major_name = 'Finance') AS finance, SUM(major_name = 'Physics') AS physics FROM major;
SELECT income.source FROM income WHERE income.date_received BETWEEN '2019-09-01' AND '2019-09-30' GROUP BY income.source ORDER BY sum(income.amount) DESC LIMIT 1;
SELECT first_name, last_name, email FROM member WHERE position = 'Secretary';
SELECT count(DISTINCT member.member_id) FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Physics Teaching';
sql placeholder
SELECT COUNT(attendance.link_to_event) FROM attendance JOIN member ON attendance.link_to_member = member.member_id WHERE member.last_name = 'Guidi' AND member.first_name = 'Luisa';
SELECT SUM(budget.spent) / COUNT(budget.spent) FROM budget WHERE budget.category = 'Food' AND budget.event_status = 'Closed';
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE category = 'Advertisement' AND spent = (SELECT max(spent) FROM budget WHERE category = 'Advertisement'));
sql placeholder
SELECT SUM(event.type = 'Community Service') / COUNT(event.event_id) * 100 FROM event WHERE event.event_date BETWEEN '2019-01-01' and '2019-12-31';
SELECT expense.cost FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'September Speaker' AND expense.expense_description = 'Posters';
SELECT t1.t_shirt_size FROM member t1 JOIN attendance t2 ON t1.member_id = t2.link_to_member GROUP BY t1.t_shirt_size ORDER BY count(t1.t_shirt_size) DESC LIMIT 1;
SELECT event.event_name FROM event INNER JOIN budget ON budget.link_to_event = event.event_id WHERE event.status = 'Closed' AND budget.remaining < 0 ORDER BY budget.remaining ASC LIMIT 1;
SELECT type, SUM(cost) AS total_value FROM expense JOIN budget ON expense.link_to_budget = budget.budget_id JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'October Meeting' GROUP BY type;
SELECT sum(budget.amount), budget.category FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'April Speaker' GROUP BY budget.category ORDER BY budget.amount ASC;
SELECT MAX(budget.amount) FROM budget WHERE budget.category = 'Food';
SELECT amount FROM budget WHERE category = 'Advertisement' ORDER BY amount DESC LIMIT 3;
SELECT sum(expense.cost) FROM expense INNER JOIN attendance ON expense.expense_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN zip_code ON member.zip = zip_code.zip_code INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE budget.category = 'Parking' AND expense.expense_description = 'Parking';
SELECT SUM(expense.cost) AS total_expense FROM expense WHERE expense.expense_date = '2019-08-20';
SELECT member.first_name, member.last_name, SUM(expense.cost) FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.link_to_member = 'rec4BLdZHS2Blfp4v' GROUP BY member.member_id;
SELECT expense_description FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.first_name = 'Sacha' AND member.last_name = 'Harrison';
SELECT expense_description FROM expense WHERE link_to_member IN ( SELECT member_id FROM member WHERE t_shirt_size = 'X-Large' );
SELECT zip_code.zip_code FROM member INNER JOIN expense ON member.member_id = expense.link_to_member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE expense.cost < 50;
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.last_name = 'Cullen' AND member.first_name = 'Phillip';
SELECT member.position FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business';
SELECT count(DISTINCT member.member_id) FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.major_name = 'Business' AND member.t_shirt_size = 'Medium';
SELECT event.type FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.remaining > 30;
SELECT category FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE location = 'MU 215';
SELECT category FROM budget WHERE link_to_event IN (SELECT event_id FROM event WHERE event_date = '2020-03-24T12:00:00');
SELECT major.major_name FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.position = 'Vice President';
SELECT (SUM(CASE WHEN major.major_name = 'Business' AND member.position = 'Member' THEN 1 ELSE 0 END) * 100.0 / COUNT(member.member_id)) AS percentage FROM member INNER JOIN major ON member.link_to_major = major.major_id;
SELECT budget.category FROM budget INNER JOIN event ON event.event_id = budget.link_to_event WHERE event.location = 'MU 215';
SELECT count(amount) FROM income WHERE amount = 50;
SELECT count(member.member_id) FROM member WHERE member.position = 'Member' AND member.t_shirt_size = 'X-Large';
SELECT count(*) FROM major WHERE major.department = 'School of Applied Sciences, Technology and Education' AND major.college = 'College of Agriculture and Applied Sciences';
SELECT DISTINCT member.last_name, major.department, major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering';
SELECT budget.category FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.location = 'MU 215' AND event.type = 'Guest Speaker' AND budget.spent = 0;
SELECT zip_code.city, zip_code.state FROM zip_code INNER JOIN member ON member.zip = zip_code.zip_code INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Electrical and Computer Engineering department' AND member.position = 'Member';
SELECT event.event_name FROM member INNER JOIN attendance ON member.member_id = attendance.link_to_member INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.position = 'Vice President' AND event.location = '900 E. Washington St.';
SELECT member.last_name, member.position FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_date = '2019-09-10' AND expense.expense_description = 'Pizza';
sql placeholder
sql placeholder
SELECT state FROM zip_code WHERE type = 'PO Box';
SELECT zip_code.zip_code FROM zip_code WHERE zip_code.state = 'Puerto Rico' AND zip_code.county = 'San Juan Municipio' AND zip_code.type = 'PO Box';
SELECT event.event_name FROM event WHERE event.type = 'Game' AND event.status = 'Closed' AND event.event_date BETWEEN '2019-03-15' AND '2020-03-20';
SELECT attendance.link_to_event FROM attendance INNER JOIN expense ON attendance.link_to_member = expense.link_to_member WHERE expense.cost > 50;
SELECT member.first_name, member.last_name, attendance.link_to_event FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id WHERE attendance.link_to_event IN (SELECT event.event_id FROM event WHERE event.event_date BETWEEN '2019-01-10' and '2019-11-19') AND attendance.link_to_event IN (SELECT budget.link_to_event FROM budget);
SELECT major.college FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.first_name = 'Katy' AND member.link_to_major = 'rec1N0upiVLy5esTO';
SELECT phone FROM member JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'college of Agriculture and Applied Sciences' AND major.major_name = 'Business';
SELECT member.email FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.amount > 20 AND income.date_received BETWEEN '2019-09-10' AND '2019-11-19';
SELECT count(DISTINCT member.member_id) FROM member member JOIN major major ON member.link_to_major = major.major_id WHERE major.major_name = 'education' AND major.college = 'College of Education & Human Services';
SELECT cast(sum(CASE WHEN budget.remaining < 0 THEN 1 ELSE 0 END) AS REAL) / count(event.event_id) * 100 FROM budget INNER JOIN event ON budget.link_to_event = event.event_id;
SELECT event.event_id, event.location, event.status FROM event WHERE event_date BETWEEN '2019-11-01' and '2020-03-31';
SELECT expense.expense_description FROM expense WHERE expense.cost > 50;
SELECT member.first_name, member.last_name FROM member WHERE member.t_shirt_size = 'X-Large';
SELECT cast(sum(CASE WHEN zip_code.type = 'PO Box' THEN 1 ELSE 0 END) AS REAL) * 100 / count(*) FROM zip_code;
SELECT event.event_name, event.location FROM event event JOIN budget budget ON event.event_id = budget.link_to_event WHERE budget.remaining > 0;
SELECT event.event_name , event.event_date FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE expense.expense_description = 'Pizza' AND expense.cost > 50 AND expense.cost < 100;
SELECT member.first_name, member.last_name, major.major_name FROM major INNER JOIN member ON major.major_id = member.link_to_major INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > 100;
SELECT DISTINCT zip_code.city, zip_code.state FROM income INNER JOIN member ON income.link_to_member = member.member_id INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE income.amount > 50;
SELECT member.first_name, member.last_name, MAX(expense.cost) FROM expense INNER JOIN attendance ON expense.expense_id = attendance.link_to_event INNER JOIN member ON expense.link_to_member = member.member_id GROUP BY expense.link_to_member HAVING COUNT(attendance.link_to_event) > 1;
SELECT avg(expense.cost) FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE member.position != 'Member';
sql placeholder
SELECT SUM(expense.cost), COUNT(event.event_id) FROM expense INNER JOIN event ON expense.link_to_budget = event.event_id WHERE event.type = 'Meeting';
SELECT expense.expense_description FROM expense WHERE expense.expense_description = 'Water, chips, cookies' GROUP BY expense.expense_description ORDER BY sum(expense.cost) DESC LIMIT 1;
SELECT member.first_name, member.last_name FROM budget INNER JOIN expense ON budget.budget_id = expense.link_to_budget INNER JOIN member ON expense.link_to_member = member.member_id ORDER BY expense.cost DESC LIMIT 5;
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > (SELECT AVG(cost) FROM expense);
SELECT SUM(CASE WHEN member.position = 'Member' THEN 1 ELSE 0 END) / COUNT(*) - SUM(CASE WHEN member.position = 'Member' THEN 1 ELSE 0 END) / COUNT(*) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code;
SELECT major.major_name, major.department FROM major INNER JOIN member ON major.major_id = member.link_to_major WHERE member.last_name = 'Gerke' AND member.first_name = 'Garrett';
SELECT member.first_name, member.last_name, expense.cost FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies';
SELECT last_name, phone FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Elementary Education';
SELECT budget.category , budget.amount FROM budget JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker';
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food';
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '2019-09-09';
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters';
SELECT member.first_name, member.last_name, major.college FROM member JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Secretary';
SELECT SUM(budget.spent) FROM budget WHERE budget.category = 'Speaker Gifts';
SELECT zip_code.city FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Garrett' AND member.last_name = 'Gerke';
SELECT first_name || ' ' || last_name AS full_name, position FROM member JOIN zip_code ON member.zip = zip_code.zip_code WHERE city = 'Lincolnton' AND state = 'North Carolina' AND zip_code.zip_code = 28092;
SELECT count(gasstationid) FROM gasstations gasstations WHERE gasstations.country = 'CZE' AND gasstations.segment = 'Premium';
SELECT cast(count(CASE WHEN customers.currency = 'EUR' THEN customers.customerid END) AS REAL) / count(CASE WHEN customers.currency = 'CZK' THEN customers.customerid END) FROM customers;
SELECT yearmonth.customerid FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date BETWEEN '201201' AND '201212' AND customers.segment = 'LAM' GROUP BY yearmonth.customerid ORDER BY yearmonth.consumption ASC LIMIT 4;
SELECT cast(sum(yearmonth.consumption) AS REAL) / 12 FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date BETWEEN '201301' AND '201312' AND customers.segment = 'SME';
SELECT customers.customerid FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.currency = 'CZK' AND yearmonth.date BETWEEN '201101' AND '201112' GROUP BY yearmonth.customerid ORDER BY count(yearmonth.customerid) DESC LIMIT 1;
SELECT count(DISTINCT yearmonth.customerid) FROM yearmonth yearmonth JOIN customers customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'KAM' AND yearmonth.date BETWEEN '201201' AND '201212' AND yearmonth.consumption < 30000;
SELECT sum(CASE WHEN customers.currency = 'CZK' THEN yearmonth.consumption ELSE 0 END) - sum(CASE WHEN customers.currency = 'EUR' THEN yearmonth.consumption ELSE 0 END) FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date BETWEEN '201201' AND '201212';
sql placeholder
sql placeholder
SELECT substr(date, 1, 4) FROM yearmonth GROUP BY substr(date, 1, 4) ORDER BY sum(consumption) DESC LIMIT 1;
SELECT yearmonth.date FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'SME' AND yearmonth.date BETWEEN '201301' AND '201312' ORDER BY yearmonth.consumption DESC LIMIT 1;
SELECT gasstations.gasstationid, gasstations.chainid, gasstations.segment, yearmonth.date, yearmonth.customerid, yearmonth.consumption FROM gasstations INNER JOIN yearmonth ON gasstations.gasstationid = yearmonth.customerid INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date BETWEEN '201301' AND '201312' AND customers.currency = 'CZK' AND customers.segment IN ('SME', 'LAM', 'KAM');
SELECT customers.segment FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid INNER JOIN transactions_1k ON yearmonth.customerid = transactions_1k.customerid INNER JOIN gasstations ON transactions_1k.customerid = gasstations.gasstationid INNER JOIN products ON transactions_1k.productid = products.productid WHERE customers.currency = 'EUR' AND yearmonth.date BETWEEN '201201' AND '201312' GROUP BY customers.segment ORDER BY (yearmonth.consumption - (SELECT yearmonth.consumption FROM yearmonth WHERE yearmonth.customerid = transactions_1k.customerid AND yearmonth.date = '201201')) / yearmonth.consumption DESC LIMIT 1;
SELECT sum(transactions_1k.amount) FROM transactions_1k INNER JOIN yearmonth ON transactions_1k.customerid = yearmonth.customerid WHERE yearmonth.date BETWEEN '201308' AND '201311';
SELECT SUM(gasstations.segment = 'Discount') - SUM(gasstations.segment = 'Discount') FROM gasstations WHERE gasstations.country = 'CZE' OR gasstations.country = 'SVK';
SELECT sum(CASE WHEN yearmonth.customerid = 7 THEN yearmonth.consumption ELSE 0 END) - sum(CASE WHEN yearmonth.customerid = 5 THEN yearmonth.consumption ELSE 0 END) AS diff FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date = '201304';
SELECT sum(CASE WHEN customers.currency = 'CZK' THEN yearmonth.consumption ELSE 0 END) - sum(CASE WHEN customers.currency = 'EUR' THEN yearmonth.consumption ELSE 0 END) AS difference FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid;
SELECT customers.customerid FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'EUR' AND yearmonth.date = '201310' ORDER BY yearmonth.consumption DESC LIMIT 1;
SELECT yearmonth.customerid, yearmonth.consumption FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'KAM' GROUP BY yearmonth.customerid ORDER BY sum(yearmonth.consumption) DESC LIMIT 1;
SELECT sum(yearmonth.consumption) FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE customers.segment = 'KAM' AND yearmonth.date = '201305';
SELECT SUM(CASE WHEN customers.segment = 'LAM' AND yearmonth.consumption > 46.73 THEN 1 ELSE 0 END) / COUNT(CASE WHEN customers.segment = 'LAM' THEN 1 ELSE 0 END) * 100 FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid;
SELECT gasstations.country, count(*) FROM gasstations WHERE gasstations.segment = 'Value for money' GROUP BY gasstations.country;
SELECT SUM(CASE WHEN customers.currency = 'EUR' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS Percentage FROM customers WHERE customers.segment = 'KAM';
SELECT cast(count(CASE WHEN yearmonth.consumption > 528.3 THEN 1 ELSE NULL END) AS REAL) * 100 / count(yearmonth.date) FROM yearmonth WHERE Substr(yearmonth.date, 1, 4) = '2012';
SELECT gasstations.segment FROM gasstations WHERE gasstations.country = 'CZE';
SELECT customers.customerid FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE yearmonth.date = '201309' GROUP BY customers.customerid ORDER BY sum(yearmonth.consumption) DESC LIMIT 1;
SELECT customers.segment FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date = '201309' GROUP BY customers.segment ORDER BY sum(yearmonth.consumption) ASC LIMIT 1;
sql placeholder
SELECT MAX(consumption) FROM yearmonth WHERE date LIKE '2012%';
SELECT customers.customerid, SUM(yearmonth.consumption) AS monthly_consumption FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'EUR' GROUP BY customers.customerid ORDER BY monthly_consumption DESC LIMIT 1;
SELECT products.description FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN yearmonth ON transactions_1k.date = yearmonth.date WHERE yearmonth.date = '201309';
SELECT gasstations.country FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid INNER JOIN yearmonth ON transactions_1k.customerid = yearmonth.customerid WHERE yearmonth.date LIKE '201306%';
sql placeholder
SELECT products.description FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid INNER JOIN customers ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'EUR';
SELECT avg(transactions_1k.price) FROM transactions_1k WHERE transactions_1k.date LIKE '2012-01%';
SELECT count(DISTINCT customers.customerid) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.currency = 'EUR' AND yearmonth.consumption > 1000;
SELECT products.description FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid INNER JOIN products ON transactions_1k.productid = products.productid WHERE gasstations.country = 'CZE';
SELECT DISTINCT transactions_1k.time FROM transactions_1k INNER JOIN gasstations ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.chainid = 11;
SELECT count(DISTINCT transactions_1k.transactionid) FROM transactions_1k transactions_1k JOIN gasstations gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.price > 1000;
SELECT count(*) FROM transactions_1k transactions_1k JOIN gasstations gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date > '2012-01-01';
SELECT cast(sum(transactions_1k.price) AS REAL) / count(transactions_1k.transactionid) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE';
sql placeholder
SELECT customerid FROM transactions_1k WHERE date = '2012-08-25' GROUP BY customerid ORDER BY SUM(amount) DESC LIMIT 1;
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-25' ORDER BY transactions_1k.customerid LIMIT 1;
sql placeholder
SELECT segment FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.time = '21:20:00' AND transactions_1k.date = '2012-08-23';
SELECT count(transactionid) FROM transactions_1k INNER JOIN customers ON transactions_1k.customerid = customers.customerid WHERE customers.currency = 'CZK' AND transactions_1k.time < '13:00:00' AND transactions_1k.date = '2012-08-26';
SELECT customers.segment FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid ORDER BY yearmonth.date LIMIT 1;
SELECT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE transactions_1k.date = '2012-08-24' AND transactions_1k.time = '12:42:00';
SELECT transactions_1k.productid FROM transactions_1k WHERE transactions_1k.date = '2012-08-23' AND transactions_1k.time = '21:20:00';
SELECT transactions_1k.date, yearmonth.consumption FROM transactions_1k INNER JOIN yearmonth ON transactions_1k.customerid = yearmonth.customerid WHERE transactions_1k.date = '2012-08-24' AND yearmonth.date = '2012-01';
SELECT count(*) FROM transactions_1k transactions_1k JOIN gasstations gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE' AND transactions_1k.date = '2012-08-26' AND transactions_1k.time BETWEEN '08:00:00' AND '09:00:00';
SELECT customers.currency FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE yearmonth.date LIKE '201306';
SELECT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE cardid = 667467);
SELECT customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE transactions_1k.date = '2012-08-24';
SELECT yearmonth.date, yearmonth.consumption FROM yearmonth INNER JOIN customers ON yearmonth.customerid = customers.customerid WHERE yearmonth.date = '2012-08-25' AND customers.currency = 'EUR';
SELECT (transactions_1k.amount - transactions_1k_1.amount) / transactions_1k.amount FROM transactions_1k INNER JOIN transactions_1k AS transactions_1k_1 ON transactions_1k.customerid = transactions_1k_1.customerid AND transactions_1k.date = '2012-08-24' AND transactions_1k_1.date = '2012-08-26' WHERE transactions_1k.customerid = 63 AND transactions_1k.date = '2012-08-25';
SELECT gasstations.gasstationid FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid GROUP BY gasstations.gasstationid ORDER BY sum(transactions_1k.amount) DESC LIMIT 1;
SELECT SUM(CASE WHEN gasstations.segment = 'Premium' THEN transactions_1k.price ELSE 0 END) / SUM(transactions_1k.price) * 100 FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'SVK';
SELECT sum(transactions_1k.amount), sum(yearmonth.consumption) FROM transactions_1k INNER JOIN yearmonth ON transactions_1k.customerid = yearmonth.customerid INNER JOIN customers ON transactions_1k.customerid = customers.customerid INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE yearmonth.date = '201201' AND customers.customerid = 38508;
SELECT products.description FROM products INNER JOIN transactions_1k ON products.productid = transactions_1k.productid ORDER BY transactions_1k.amount DESC LIMIT 5;
SELECT customers.customerid, customers.currency, SUM(transactions_1k.price) / SUM(transactions_1k.amount) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid ORDER BY SUM(transactions_1k.price) / SUM(transactions_1k.amount) DESC LIMIT 1;
SELECT gasstations.country FROM transactions_1k JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid JOIN products ON transactions_1k.productid = products.productid WHERE transactions_1k.amount = 1 AND transactions_1k.productid = 2 GROUP BY gasstations.country ORDER BY transactions_1k.price DESC LIMIT 1;
SELECT yearmonth.consumption FROM yearmonth INNER JOIN transactions_1k ON yearmonth.customerid = transactions_1k.customerid INNER JOIN customers ON yearmonth.customerid = customers.customerid INNER JOIN products ON transactions_1k.productid = products.productid INNER JOIN gasstations ON yearmonth.customerid = gasstations.gasstationid WHERE yearmonth.date = '201208' AND transactions_1k.productid = 5 AND transactions_1k.price > 29.00;
