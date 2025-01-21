SELECT max(frpm.`percent (%) eligible free (k-12)`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE schools.county = 'Alameda'
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm WHERE `educational option type` = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` ASC LIMIT 3
SELECT zip FROM schools WHERE charter = 1 AND county = 'Fresno'
SELECT schools.mailstreet FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY frpm.`frpm count (k-12)` DESC LIMIT 1
SELECT phone FROM schools WHERE charter = 1 AND opendate > '2000-01-01' AND fundingtype = 'Directly funded';
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 > 500 AND schools.magnet = 1
SELECT phone FROM schools WHERE cdscode IN (SELECT cdscode FROM satscores WHERE numtsttakr = (SELECT max(numtsttakr) FROM satscores WHERE numtsttakr > 1500));
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.avgscrmath > 560 AND schools.charter = 1
SELECT frpm."FRPM count (ages 5-17)" FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrread DESC LIMIT 1
SELECT `school code` FROM frpm WHERE `enrollment (k-12)` + `enrollment (ages 5-17)` > 500
SELECT max(frpm.`free meal count (ages 5-17)`) FROM satscores satscores JOIN frpm frpm ON satscores.cds = frpm.cdscode WHERE satscores.numge1500 > 0 AND satscores.numtsttakr > 0 AND satscores.avgscrread > 0 AND satscores.avgscrmath > 0 AND frpm.`free meal count (ages 5-17)` > 0 AND frpm.`enrollment (ages 5-17)` > 0 AND satscores.numge1500 / satscores.numtsttakr > 0.3;
SELECT schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3
SELECT schools.ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5
SELECT dname FROM satscores WHERE avgscrread IS NOT NULL GROUP BY dname ORDER BY avg(avgscrread) DESC LIMIT 1;
SELECT count(schools.school) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.city = 'Fresno' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr <= 250
SELECT phone FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT count(frpm.`school name`) FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`low grade` = 9 AND frpm.`high grade` = 12 AND schools.county = 'Amador'
SELECT sname FROM satscores WHERE cname = 'Contra Costa' ORDER BY numtsttakr DESC LIMIT 1
SELECT DISTINCT schools.`school name`, schools.street FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE (frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)`) > 30
SELECT DISTINCT frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE frpm.`percent (%) eligible free (k-12)` > 0.1 AND satscores.numtsttakr >= 1500
SELECT satscores.avgscrwrite, satscores.sname, schools.phone FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate > '1991-12-31' OR schools.closeddate < '2000-01-01'
SELECT schools.school, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' AND frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > ( SELECT avg(`enrollment (k-12)` - `enrollment (ages 5-17)`) FROM frpm )
SELECT schools.opendate FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.gsoffered = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (k-12)` LIMIT 5
SELECT frpm.`percent (%) eligible free (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY schools.ncesschool LIMIT 1, 2
SELECT frpm.`percent (%) eligible free (k-12)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = 66 ORDER BY frpm.`free meal count (k-12)` DESC LIMIT 5
SELECT DISTINCT schools.website, schools.school FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode WHERE frpm.`free meal count (ages 5-17)` BETWEEN 1900 AND 2000
SELECT DISTINCT schools.admfname1, schools.admfname2, schools.admfname3, schools.admlname3 FROM satscores satscores JOIN schools schools ON satscores.cds = schools.cdscode WHERE satscores.numge1500 = (SELECT max(numge1500) FROM satscores)
SELECT schools.street, schools.city, schools.state, schools.zip FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.numge1500 / satscores.numtsttakr LIMIT 1
SELECT avg(satscores.numtsttakr) FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.opendate BETWEEN '1980-01-01' AND '1980-12-31'
SELECT satscores.sname FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.virtual = 'F' ORDER BY satscores.avgscrread DESC LIMIT 5
SELECT edopsname FROM schools WHERE cdscode IN (SELECT cds FROM satscores WHERE avgscrmath = (SELECT max(avgscrmath) FROM satscores WHERE avgscrmath IS NOT NULL));
SELECT satscores.avgscrmath, schools.county FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode ORDER BY satscores.avgscrmath ASC LIMIT 1
SELECT satscores.avgscrwrite, schools.city FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT schools.school FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.doc = '31' AND schools.gsserved = 'K-12' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT cast(count(schools.doc) AS REAL) / 12 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alameda' AND schools.doc = '52' AND strftime('%Y', schools.opendate) = '1980'
SELECT cast(sum(CASE WHEN schools.doc = 54 THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN schools.doc = 52 THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Orange'
SELECT DISTINCT schools.county, schools.school, schools.closeddate FROM schools schools WHERE schools.statustype = 'Closed';
SELECT schools.mailstreet, schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrmath DESC LIMIT 1, 1
SELECT schools.mailstreet, schools.ncesschool FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT count(schools.mailcity) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.mailcity = 'Fresno'
SELECT (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Colusa') * 1.0 / (SELECT count(*) FROM schools WHERE mailstate = 'CA' AND county = 'Humboldt') AS ratio;
SELECT phone, ext, school FROM schools WHERE zip = '95203-3704'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND strftime('%Y', loan.date) = '1997' ORDER BY loan.amount LIMIT 1
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date LIKE '1993%' AND loan.duration > 12 ORDER BY loan.amount DESC LIMIT 1
SELECT account_id FROM account WHERE date = ( SELECT min(date) FROM account WHERE strftime('%Y', date) = '1995' )
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.date < '1997-01-01' AND loan.amount > 3000
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY count(bond_type) DESC LIMIT 1
SELECT molecule.molecule_id FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'c'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id WHERE connected.bond_id = 'TR004_8_9'
SELECT DISTINCT atom.element FROM atom INNER JOIN connected ON atom.atom_id = connected.atom_id INNER JOIN bond ON bond.bond_id = connected.bond_id WHERE bond.bond_type = '='
SELECT label FROM molecule WHERE molecule_id NOT IN (SELECT molecule_id FROM atom WHERE element = 'sn') OR label IS NULL;
SELECT count(DISTINCT connected.atom_id) FROM atom atom JOIN connected connected ON atom.atom_id = connected.atom_id JOIN bond bond ON connected.bond_id = bond.bond_id WHERE atom.element IN ('i', 's') AND bond.bond_type = '-';
SELECT name FROM cards WHERE edhrecrank < 100 AND frameversion = 2015;
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese' AND cards.isalternative = 1
SELECT count(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd';
SELECT foreign_data.language FROM cards INNER JOIN sets ON cards.setcode = sets.code INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN foreign_data ON set_translations.language = foreign_data.language WHERE cards.name = 'Angel of Mercy'
SELECT artist FROM cards WHERE uuid IN (SELECT uuid FROM foreign_data WHERE LANGUAGE = 'Phyrexian');
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isreprint = 1
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
SELECT viewcount FROM posts WHERE title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT text FROM comments WHERE score = 17
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost'
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'thank you user93!'
SELECT comments.text FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.displayname = 'A Lion'
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.title = 'Understanding what Dassault iSight is doing?'
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Necromancer' LIMIT 10
SELECT sum(posts.score), users.websiteurl FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Yevgeny'
SELECT sum(votes.bountyamount) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE posts.title LIKE '%data%'
SELECT count(id) FROM comments WHERE userid = 13
SELECT id FROM users ORDER BY reputation DESC LIMIT 1
SELECT id FROM users ORDER BY views ASC LIMIT 1
SELECT count(DISTINCT badges.userid) FROM badges badges JOIN users users ON badges.userid = users.id WHERE strftime('%Y', badges.date) = '2011' AND badges.name = 'Supporter';
SELECT count(DISTINCT userid) FROM badges WHERE userid IN (SELECT id FROM users) GROUP BY userid HAVING count(name) > 5;
SELECT users.id, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1
SELECT users.id, badges.name FROM users INNER JOIN badges ON users.id = badges.userid INNER JOIN posts ON users.id = posts.owneruserid GROUP BY users.id ORDER BY count(posts.id) DESC LIMIT 1
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE users.location = 'India' AND badges.name = 'Teacher';
SELECT posthistorytypeid, count(DISTINCT userid) FROM posthistory WHERE postid = 3720 GROUP BY posthistorytypeid;
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
SELECT cast(sum(CASE WHEN strftime('%Y', creationdate) = '2010' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN strftime('%Y', creationdate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT count(posts.id) FROM users INNER JOIN votes ON users.id = votes.userid INNER JOIN posts ON votes.postid = posts.id WHERE users.displayname = 'Matt Parker' AND votes.postid > 4
SELECT count(comments.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN comments ON posts.id = comments.postid WHERE users.displayname = 'Neil McGuigan' AND comments.score < 60
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer'
SELECT count(DISTINCT users.id) FROM users users JOIN badges badges ON users.id = badges.userid WHERE strftime('%Y', badges.date) = '2014' AND badges.name = 'Commentator';
SELECT displayname, age FROM users WHERE views = ( SELECT max(views) FROM users )
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images'
SELECT count(id) FROM comments WHERE userid = 13 AND score < 60
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'North Pole' AND strftime('%Y', badges.date) = '2011'
SELECT users.lastaccessdate, users.location FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Outliers'
SELECT ownerdisplayname FROM posts ORDER BY viewcount DESC LIMIT 1
SELECT users.displayname, users.location FROM tags INNER JOIN posts ON tags.wikipostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE tags.tagname = 'hypothesis-testing'
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
SELECT count(id) FROM posts WHERE viewcount > ( SELECT avg(viewcount) FROM posts )
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.score = ( SELECT max(score) FROM posts )
SELECT count(id) FROM posts WHERE viewcount > 35000 AND commentcount = 0
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Emmett' ORDER BY badges.date DESC LIMIT 1
SELECT count(id) FROM users WHERE age >= 19 AND age <= 65 AND upvotes > 5000
SELECT badges.date - users.creationdate FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Zolomon'
SELECT count(posts.id), count(comments.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid INNER JOIN comments ON posts.id = comments.postid ORDER BY users.creationdate DESC LIMIT 1
SELECT count(DISTINCT badges.userid) FROM badges badges JOIN users users ON badges.userid = users.id WHERE badges.name = 'Citizen Patrol';
SELECT count(tags.wikipostid) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname = 'careers'
SELECT reputation, views FROM users WHERE displayname = 'Jarrod Dixon'
SELECT sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 1 ELSE 0 END), sum(CASE WHEN posts.title = 'Clustering 1D data' THEN 0 ELSE 1 END) FROM posts INNER JOIN comments ON posts.id = comments.postid
SELECT creationdate FROM users WHERE displayname = 'IrishStat'
SELECT count(id) FROM votes WHERE bountyamount >= 30
SELECT count(id) FROM posts WHERE score < 20
SELECT count(tags.tagname) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.id < 15 AND tags.count <= 20
SELECT excerptpostid, wikipostid FROM tags WHERE tagname = 'sample'
SELECT users.reputation, users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.title LIKE '%linear regression%'
SELECT comments.text FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.viewcount BETWEEN 100 AND 150 ORDER BY comments.score DESC LIMIT 1
SELECT users.creationdate, users.age FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.websiteurl LIKE '%http://%'
SELECT count(DISTINCT comments.postid) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.score = 0 AND posts.viewcount < 5
SELECT count(comments.id) FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE posts.commentcount = 1 AND comments.score = 0
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
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' AND superpower.power_name = 'Super Strength'
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
SELECT code FROM drivers WHERE nationality = 'American'
SELECT driverid FROM results ORDER BY fastestlaptime LIMIT 5
SELECT LOCATION, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT nationality FROM drivers GROUP BY nationality HAVING count(*) = (SELECT max(COUNT) FROM (SELECT count(*) AS COUNT FROM drivers GROUP BY nationality));
SELECT races.name FROM races INNER JOIN results ON races.raceid = results.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT circuits.lat, circuits.lng FROM circuits INNER JOIN laptimes ON circuits.circuitid = laptimes.raceid WHERE laptimes.time = '1:29.488'
SELECT player_api_id FROM player_attributes ORDER BY overall_rating DESC LIMIT 1
SELECT height, player_name FROM player WHERE height = ( SELECT max(height) FROM player )
SELECT preferred_foot FROM player_attributes WHERE potential = ( SELECT min(potential) FROM player_attributes )
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating BETWEEN 60 AND 65 AND player_attributes.defensive_work_rate LIKE 'low'
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN MATCH ON player_attributes.player_api_id = MATCH.home_player_1 OR player_attributes.player_api_id = MATCH.home_player_2 OR player_attributes.player_api_id = MATCH.home_player_3 OR player_attributes.player_api_id = MATCH.home_player_4 OR player_attributes.player_api_id = MATCH.home_player_5 OR player_attributes.player_api_id = MATCH.home_player_6 OR player_attributes.player_api_id = MATCH.home_player_7 OR player_attributes.player_api_id = MATCH.home_player_8 OR player_attributes.player_api_id = MATCH.home_player_9 OR player_attributes.player_api_id = MATCH.home_player_10 OR player_attributes.player_api_id = MATCH.home_player_11 ORDER BY player_attributes.crossing DESC LIMIT 5
SELECT league.name FROM MATCH INNER JOIN league ON league.id = MATCH.league_id WHERE MATCH.season = '2016/2017' GROUP BY league.name ORDER BY sum(MATCH.home_team_goal) - sum(MATCH.away_team_goal) DESC LIMIT 1
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.season = '2016/2017' AND MATCH.home_team_goal - MATCH.away_team_goal < 0 GROUP BY team.team_long_name ORDER BY count(team.team_long_name) ASC LIMIT 1
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player_attributes.penalties DESC LIMIT 10
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.attacking_work_rate = 'high'
SELECT player_name FROM player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT team_attributes.buildupplayspeedclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'KSV Cercle Brugge'
SELECT player_attributes.finishing, player_attributes.curve FROM player player JOIN player_attributes player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player.weight = (SELECT max(weight) FROM player);
SELECT player_name FROM player WHERE player_api_id IN (SELECT player_api_id FROM player_attributes WHERE overall_rating = (SELECT max(overall_rating) FROM player_attributes));
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
SELECT CASE WHEN `t-cho` < 250 THEN 'Normal' ELSE 'Abnormal' END AS RESULT FROM laboratory WHERE id = 2927464 AND `date` = '1995-09-04';
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND patient.birthday BETWEEN '1980-01-01' AND '1989-12-31' AND examination.`ana pattern` != 'P'
SELECT description, diagnosis FROM patient WHERE id = 48473
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0
SELECT count(DISTINCT patient.id) FROM patient patient JOIN laboratory laboratory ON patient.id = laboratory.id WHERE patient.admission = '+' AND laboratory.wbc BETWEEN 3.5 AND 9.0;
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.plt > 100 AND patient.plt < 400 AND examination.diagnosis IS NOT NULL
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
SELECT cast(sum(expense.cost) AS REAL) * 100 / count(event.event_id) FROM event INNER JOIN expense ON event.event_id = expense.link_to_budget WHERE event.type = 'Meeting'
SELECT member.first_name, member.last_name FROM member INNER JOIN expense ON member.member_id = expense.link_to_member ORDER BY expense.cost DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.cost > ( SELECT avg(cost) FROM expense )
SELECT cast((sum(CASE WHEN zip_code.state = 'New Jersey' THEN 1 ELSE 0 END) - sum(CASE WHEN zip_code.state = 'Vermont' THEN 1 ELSE 0 END)) AS REAL) * 100 / count(*) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Member'
SELECT member.first_name, member.last_name, expense.cost FROM member INNER JOIN expense ON member.member_id = expense.link_to_member WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT budget.category, budget.amount FROM budget INNER JOIN EVENT ON budget.link_to_event = EVENT.event_id WHERE EVENT.event_name = 'January Speaker'
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '2019-09-09'
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT customers.customerid, sum(YEARMONTH.consumption) FROM customers INNER JOIN YEARMONTH ON customers.customerid = YEARMONTH.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY sum(YEARMONTH.consumption) DESC LIMIT 1
SELECT DISTINCT country FROM gasstations WHERE gasstationid IN (SELECT gasstationid FROM transactions_1k WHERE date LIKE '201306%');
SELECT avg(transactions_1k.price) FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE'
SELECT avg(price) FROM transactions_1k WHERE customerid IN (SELECT customerid FROM customers WHERE currency = 'EUR');
SELECT customers.customerid, sum(transactions_1k.price) / sum(transactions_1k.amount), customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid, customers.currency ORDER BY sum(transactions_1k.price) / sum(transactions_1k.amount) DESC LIMIT 1
