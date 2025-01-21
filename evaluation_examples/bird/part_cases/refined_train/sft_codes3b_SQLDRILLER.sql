SELECT max(`percent (%) eligible free (k-12)`) FROM frpm WHERE `county name` = 'Alameda'
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm WHERE `educational option type` = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` ASC LIMIT 3;
SELECT zip FROM schools WHERE charter = 1 AND county = 'Fresno'
SELECT schools.mailstreet FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY frpm.`frpm count (k-12)` DESC LIMIT 1
SELECT phone FROM schools WHERE charter = 1 AND opendate > '2000-01-01' AND fundingtype = 'Directly funded';
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 > 500 AND schools.magnet = 1
SELECT schools.phone FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores);
SELECT count(schools.cdscode) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 560 AND schools.charter = 1
SELECT frpm."FRPM count (ages 5-17)" FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE satscores.avgscrread = (SELECT max(satscores.avgscrread) FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrread IS NOT NULL);
SELECT "School Code" FROM frpm WHERE "Enrollment (k-12)" + "Enrollment (ages 5-17)" > 500
SELECT max(frpm.`free meal count (ages 5-17)`) FROM satscores satscores JOIN frpm frpm ON satscores.cds = frpm.cdscode WHERE satscores.numge1500 > 0 AND satscores.numtsttakr > 0 AND satscores.avgscrread > 0 AND satscores.avgscrmath > 0 AND frpm.`free meal count (ages 5-17)` > 0 AND frpm.`enrollment (ages 5-17)` > 0 AND satscores.avgscrread IS NOT NULL AND satscores.avgscrmath IS NOT NULL AND satscores.numge1500 IS NOT NULL AND satscores.numtsttakr IS NOT NULL AND frpm.`free meal count (ages 5-17)` IS NOT NULL AND frpm.`enrollment (ages 5-17)` IS NOT NULL;
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3
SELECT schools.ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5
SELECT dname FROM satscores WHERE avgscrread IS NOT NULL GROUP BY dname ORDER BY avg(avgscrread) DESC LIMIT 1;
SELECT count(schools.school) FROM schools INNER JOIN satscores ON satscores.cds = schools.cdscode WHERE schools.city = 'Fresno' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr <= 250
SELECT phone FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT count(frpm.`school name`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`high grade` = 12 AND frpm.`low grade` = 9 AND schools.county = 'Amador'
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Contra Costa' ORDER BY satscores.numtsttakr DESC LIMIT 1
sql placeholder
SELECT DISTINCT frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE frpm.`percent (%) eligible free (k-12)` > 0.1 AND satscores.numtsttakr >= 1500
SELECT satscores.avgscrwrite, satscores.sname, schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.opendate > '1991-12-31' OR schools.closeddate < '2000-01-01'
SELECT schools.school, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' AND frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > ( SELECT avg(`enrollment (k-12)` - `enrollment (ages 5-17)`) FROM frpm )
SELECT schools.opendate FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.gsoffered = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`enrollment (k-12)` IS NOT NULL ORDER BY frpm.`enrollment (k-12)` LIMIT 5
SELECT frpm.`free meal count (k-12)`, frpm.`enrollment (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY schools.ncesschool LIMIT 9, 2
SELECT frpm.`percent (%) eligible free (k-12)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = '66' ORDER BY frpm.`free meal count (k-12)` DESC LIMIT 5
SELECT DISTINCT schools.website, schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`free meal count (ages 5-17)` BETWEEN 1900 AND 2000
SELECT DISTINCT schools.admfname1, schools.admfname2, schools.admfname3, schools.admlname3 FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores WHERE numge1500 IS NOT NULL);
SELECT schools.street, schools.city, schools.state, schools.zip FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr ASC LIMIT 1
SELECT avg(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate BETWEEN '1980-01-01' AND '1980-12-31' AND schools.city = 'Fresno'
SELECT satscores.sname FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.virtual = 'F' GROUP BY satscores.sname ORDER BY avg(satscores.avgscrread) DESC LIMIT 5
SELECT edopsname FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT satscores.avgscrmath, schools.county FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath = (SELECT min(avgscrmath) FROM satscores);
SELECT satscores.avgscrwrite, schools.city FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT schools.school FROM schools schools JOIN frpm frpm ON schools.cdscode = frpm.cdscode WHERE schools.doc = '31' AND schools.gsserved = 'K-12' GROUP BY schools.school ORDER BY sum(frpm."Enrollment (k-12)") DESC LIMIT 1;
SELECT cast(count(schools.school) AS REAL) / 12 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alameda' AND schools.doc = '52' AND strftime('%Y', schools.opendate) = '1980'
SELECT cast(sum(CASE WHEN schools.doc = 54 THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN schools.doc = 52 THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Orange' AND schools.doc IN (52, 54)
SELECT schools.county, schools.school, schools.closeddate FROM schools schools WHERE schools.statustype = 'Closed' GROUP BY schools.county, schools.school, schools.closeddate ORDER BY count(schools.school) DESC LIMIT 1;
SELECT schools.mailstreet, schools.school FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrmath DESC LIMIT 1, 1
SELECT schools.mailstreet, schools.ncesschool FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT sum(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.mailcity = 'Fresno'
SELECT (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Colusa') * 1.0 / (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Humboldt') AS ratio;
SELECT phone, ext, school FROM schools WHERE zip = '95203-3704'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE strftime('%Y', loan.date) = '1997' AND account.frequency = 'POPLATEK TYDNE' ORDER BY loan.amount LIMIT 1
SELECT account.account_id FROM loan INNER JOIN account ON loan.account_id = account.account_id WHERE account.date LIKE '1993%' AND loan.duration > 12 ORDER BY loan.amount DESC LIMIT 1
SELECT account_id FROM account WHERE date = ( SELECT min(date) FROM account WHERE strftime('%Y', date) = '1995' )
SELECT DISTINCT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date < '1997-01-01' AND loan.amount > 3000
SELECT bond_type FROM bond GROUP BY bond_type HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM bond GROUP BY bond_type));
SELECT DISTINCT molecule.molecule_id FROM molecule molecule JOIN atom atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c';
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id WHERE c.bond_id = 'TR004_8_9';
SELECT DISTINCT atom.element FROM bond bond JOIN connected connected ON bond.bond_id = connected.bond_id JOIN atom atom ON connected.atom_id = atom.atom_id WHERE bond.bond_type = '=';
SELECT DISTINCT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn') AND label NOT IN ('+', '-');
SELECT count(DISTINCT connected.atom_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id JOIN bond bond ON connected.bond_id = bond.bond_id WHERE atom.element IN ('i', 's') AND bond.bond_type = '-';
SELECT name FROM cards WHERE edhrecrank < 100 AND frameversion = 2015
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.isalternative = 1
SELECT count(types) FROM cards WHERE artist = 'Aaron Boyd' AND isfullart = 0
SELECT foreign_data.language FROM foreign_data INNER JOIN set_translations ON foreign_data.id = set_translations.id INNER JOIN sets ON set_translations.setcode = sets.code INNER JOIN cards ON sets.code = cards.setcode WHERE cards.name = 'Angel of Mercy'
SELECT artist FROM cards WHERE uuid IN (SELECT foreign_data.uuid FROM foreign_data INNER JOIN cards ON foreign_data.uuid = cards.uuid WHERE foreign_data.language = 'Phyrexian');
SELECT count(id) FROM cards WHERE isreprint = 1 AND uuid IN (SELECT uuid FROM foreign_data WHERE LANGUAGE = 'German');
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
SELECT viewcount FROM posts WHERE title LIKE 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/%'
SELECT text FROM comments WHERE score = 17
SELECT DISTINCT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost'
SELECT users.displayname FROM comments INNER JOIN users ON comments.userid = users.id WHERE comments.text = 'thank you user93!'
SELECT c.text FROM comments c JOIN users u ON c.userid = u.id WHERE u.displayname = 'A Lion';
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Understanding what Dassault iSight is doing?'
sql placeholder
SELECT posts.score, users.websiteurl FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Yevgeny'
SELECT sum(votes.bountyamount) FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE posts.title LIKE '%data%'
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.userid = 13
SELECT id FROM users WHERE reputation = ( SELECT max(reputation) FROM users )
SELECT id FROM users WHERE views = ( SELECT min(views) FROM users )
SELECT count(DISTINCT users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE strftime('%Y', badges.date) = '2011' AND badges.name = 'Supporter'
SELECT count(DISTINCT userid) FROM badges WHERE userid IN (SELECT id FROM users) GROUP BY userid HAVING count(name) > 5;
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1
SELECT users.id, badges.name FROM users INNER JOIN badges ON users.id = badges.userid INNER JOIN ( SELECT userid, count(id) AS commentcount FROM comments GROUP BY userid ORDER BY commentcount DESC LIMIT 1 ) AS t2 ON users.id = t2.userid
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'India' AND badges.name = 'Teacher'
SELECT posthistorytypeid, count(DISTINCT userid) AS numusers FROM posthistory WHERE postid = 3720 GROUP BY posthistorytypeid;
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
SELECT (SELECT count(*) FROM votes WHERE strftime('%Y', creationdate) = '2010') * 1.0 / (SELECT count(*) FROM votes WHERE strftime('%Y', creationdate) = '2011') AS ratio;
SELECT count(posts.id) FROM posts INNER JOIN votes ON posts.id = votes.postid INNER JOIN users ON users.id = votes.userid WHERE users.displayname = 'Matt Parker' AND votes.postid > 4
SELECT count(comments.id) FROM users INNER JOIN comments ON users.id = comments.userid INNER JOIN posts ON comments.postid = posts.id WHERE users.displayname = 'Neil McGuigan' AND comments.score < 60
SELECT users.displayname FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Organizer'
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.creationdate BETWEEN '2014-01-01' AND '2014-12-31' AND badges.name = 'Commentator';
SELECT displayname, age FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images'
SELECT count(id) FROM comments WHERE userid = 13 AND score < 60
SELECT DISTINCT badges.name FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'North Pole' AND strftime('%Y', badges.date) = '2011';
SELECT users.lastaccessdate, users.location FROM users users JOIN badges badges ON users.id = badges.userid WHERE badges.name = 'Outliers';
SELECT ownerdisplayname FROM posts WHERE viewcount = ( SELECT max(viewcount) FROM posts )
SELECT users.displayname, users.location FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN tags ON posts.id = tags.wikipostid WHERE tags.tagname = 'hypothesis-testing'
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
SELECT count(id) FROM posts WHERE viewcount > ( SELECT avg(viewcount) FROM posts )
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.score = ( SELECT max(score) FROM posts )
SELECT count(*) FROM posts WHERE viewcount > 35000 AND commentcount = 0
SELECT b.name FROM users u JOIN badges b ON u.id = b.userid WHERE u.displayname = 'Emmett' ORDER BY b.date DESC LIMIT 1;
SELECT count(id) FROM users WHERE age >= 19 AND age <= 65 AND upvotes > 5000
SELECT badges.date - users.creationdate FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Zolomon'
SELECT count(DISTINCT posts.id) AS postcount, count(DISTINCT comments.id) AS commentcount FROM users users JOIN posts posts ON users.id = posts.owneruserid JOIN comments comments ON users.id = comments.userid WHERE users.creationdate = (SELECT max(creationdate) FROM users);
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE badges.name = 'Citizen Patrol';
SELECT count(tags.wikipostid) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname LIKE 'careers'
SELECT reputation, views FROM users WHERE displayname = 'Jarrod Dixon';
SELECT sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 1 ELSE 0 END), sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 0 ELSE 1 END) FROM comments INNER JOIN posts ON comments.postid = posts.id
SELECT creationdate FROM users WHERE displayname = 'IrishStat'
SELECT count(postid) FROM votes WHERE bountyamount >= 30
SELECT count(id) FROM posts WHERE score < 20
SELECT count(tags.tagname) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.id < 15 GROUP BY tags.tagname HAVING count(tags.tagname) <= 20
SELECT excerptpostid, wikipostid FROM tags WHERE tagname LIKE 'sample'
SELECT users.reputation, users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)'
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE title LIKE '%linear regression%');
SELECT text FROM comments WHERE postid IN (SELECT id FROM posts WHERE viewcount BETWEEN 100 AND 150) AND score = (SELECT max(score) FROM comments WHERE postid IN (SELECT id FROM posts WHERE viewcount BETWEEN 100 AND 150));
SELECT users.creationdate, users.age FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.websiteurl LIKE 'http://%'
SELECT count(DISTINCT p.id) FROM posts p JOIN comments c ON p.id = c.postid WHERE p.viewcount < 5 AND c.score = 0;
SELECT count(DISTINCT comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1 AND comments.score = 0
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
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength'
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
SELECT DISTINCT code FROM drivers WHERE nationality = 'American'
SELECT driverid FROM results ORDER BY fastestlaptime LIMIT 5
SELECT LOCATION, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT nationality FROM drivers GROUP BY nationality HAVING count(driverid) = (SELECT max(driver_count) FROM (SELECT count(driverid) AS driver_count FROM drivers GROUP BY nationality));
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT circuits.lat, circuits.lng FROM laptimes INNER JOIN races ON laptimes.raceid = races.raceid INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE laptimes.time = '1:29.488'
SELECT player_api_id FROM player_attributes WHERE overall_rating = ( SELECT max(overall_rating) FROM player_attributes )
SELECT player.height, player.player_name FROM player player WHERE player.height = (SELECT max(height) FROM player);
SELECT preferred_foot FROM player_attributes WHERE potential = ( SELECT min(potential) FROM player_attributes )
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating BETWEEN 60 AND 65 AND player_attributes.defensive_work_rate LIKE 'low'
SELECT player_api_id FROM player_attributes ORDER BY crossing DESC LIMIT 5;
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2015/2016' GROUP BY league.name ORDER BY sum(MATCH.home_team_goal) - sum(MATCH.away_team_goal) DESC LIMIT 1
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.season = '2016/2017' AND MATCH.home_team_goal - MATCH.away_team_goal < 0 GROUP BY team.team_long_name ORDER BY count(*) ASC LIMIT 1
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes ORDER BY penalties DESC LIMIT 10);
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE attacking_work_rate = 'high');
SELECT player_name FROM player WHERE height > 180 ORDER BY player_name ASC LIMIT 3;
SELECT team_attributes.buildupplayspeedclass FROM team_attributes INNER JOIN team ON team_attributes.team_api_id = team.team_api_id WHERE team.team_long_name = 'KSV Cercle Brugge'
SELECT player_attributes.finishing, player_attributes.curve FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight = (SELECT max(weight) FROM player);
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
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
SELECT CASE WHEN `t-cho` < 250 THEN 'Normal' ELSE 'Abnormal' END AS RESULT FROM laboratory WHERE id = 2927464 AND `date` = '1995-09-04';
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND patient.birthday BETWEEN '1980-01-01' AND '1989-12-31' AND examination.`ana pattern` != 'P'
SELECT `description`, diagnosis FROM patient WHERE id = 48473
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT count(DISTINCT patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0
sql placeholder
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
SELECT cast(sum(expense.cost) AS REAL) * 100 / count(event.event_id) FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.type = 'Meeting'
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY sum(expense.cost) DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > ( SELECT avg(cost) FROM expense )
SELECT (count(*) filter (WHERE zip_code.state = 'New Jersey') * 100.0 / count(*)) - (count(*) filter (WHERE zip_code.state = 'Vermont') * 100.0 / count(*)) AS percentage_difference FROM zip_code INNER JOIN member ON zip_code.zip_code = member.zip WHERE member.position = 'Member';
SELECT member.first_name, member.last_name, expense.cost FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT budget.category, budget.amount FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE event.event_name = 'January Speaker'
SELECT event.event_name FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received LIKE '2019-09-09%'
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT customers.customerid, sum(YEARMONTH.consumption) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY sum(YEARMONTH.consumption) DESC LIMIT 1
SELECT DISTINCT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date LIKE '201306%');
SELECT avg(price) FROM transactions_1k INNER JOIN gasstations ON transactions_1k.gasstationid = gasstations.gasstationid WHERE gasstations.country = 'CZE'
SELECT avg(price) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR');
SELECT customers.customerid, customers.currency, avg(transactions_1k.price) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid, customers.currency ORDER BY sum(transactions_1k.price) DESC LIMIT 1
