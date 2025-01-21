SELECT max(`free meal count (k-12)` / `enrollment (k-12)`) FROM frpm WHERE `county name` = 'Alameda'
SELECT `free meal count (ages 5-17)` / `enrollment (ages 5-17)` FROM frpm WHERE `educational option type` = 'Continuation School' ORDER BY `free meal count (ages 5-17)` / `enrollment (ages 5-17)` LIMIT 3
SELECT schools.zip FROM schools INNER JOIN fprm ON schools.cdscode = fprm.cdscode WHERE fprm.`charter school (y/n)` = 1 AND schools.county = 'Fresno'
SELECT schools.mailstreet FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`frpm count (k-12)` DESC LIMIT 1
SELECT schools.phone FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`charter school (y/n)` = 1 AND schools.opendate > '2000-01-01'
SELECT DISTINCT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 > 500 AND schools.magnet = 1
SELECT schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT count(schools.school) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.avgscrmath > 560 AND schools.fundingtype = 'Directly funded'
SELECT frpm.`frpm count (ages 5-17)`, frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds ORDER BY satscores.avgscrread DESC LIMIT 1
SELECT `school code` FROM frpm WHERE `enrollment (k-12)` + `enrollment (ages 5-17)` > 500
SELECT frpm.`percent (%) eligible free (ages 5-17)` FROM satscores INNER JOIN frpm ON satscores.cds = frpm.cdscode WHERE satscores.avgscrread > 300 AND frpm.`percent (%) eligible free (ages 5-17)` > 0 ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 1
SELECT schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.numge1500 / satscores.numtsttakr DESC LIMIT 3
SELECT schools.ncesschool FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (ages 5-17)` DESC LIMIT 5
SELECT satscores.dname FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE schools.charter = 1 ORDER BY satscores.avgscrread DESC LIMIT 1
SELECT count(schools.school) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Contra Costa' AND schools.fundingtype = 'Directly funded' AND satscores.numtsttakr < 250
SELECT schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrmath DESC LIMIT 1
SELECT count(*) FROM frpm WHERE `low grade` = 9 AND `high grade` = 12 AND `county name` = 'Amador'
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.county = 'Contra Costa' ORDER BY satscores.numtsttakr DESC LIMIT 1
SELECT schools.school, schools.street FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > 30
SELECT frpm.`school name` FROM frpm INNER JOIN satscores ON frpm.cdscode = satscores.cds WHERE frpm.`percent (%) eligible free (k-12)` > 0.1 AND satscores.numtsttakr >= 1500
SELECT avg(satscores.avgscrwrite), schools.school, schools.phone FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.opendate > '1991-01-01' AND schools.closeddate < '2000-01-01' GROUP BY schools.school, schools.phone
SELECT frpm.`school name`, schools.doc FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' AND frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)` > ( SELECT avg(frpm.`enrollment (k-12)` - frpm.`enrollment (ages 5-17)`) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.fundingtype = 'Locally funded' )
SELECT schools.opendate FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`school type` = 'K-12 Schools (Public)' ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 1
SELECT schools.city FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode ORDER BY frpm.`enrollment (k-12)` LIMIT 5
SELECT cast(frpm.`free meal count (k-12)` AS REAL) / frpm.`enrollment (k-12)` FROM frpm INNER JOIN schools ON frpm.cdscode = schools.cdscode ORDER BY frpm.`enrollment (k-12)` DESC LIMIT 9, 2
SELECT frpm.`percent (%) eligible free (k-12)` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.soc = 66 ORDER BY frpm.`free meal count (k-12)` DESC LIMIT 5
SELECT DISTINCT schools.website, frpm.`school name` FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE frpm.`free meal count (ages 5-17)` BETWEEN 1900 AND 2000
SELECT schools.admlname1, schools.admlname2, schools.admlname3 FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE satscores.numge1500 = ( SELECT max(numge1500) FROM satscores )
SELECT schools.street, schools.city, schools.state, schools.zip FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.numge1500 / satscores.numtsttakr LIMIT 1
SELECT avg(satscores.numtsttakr) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.opendate BETWEEN '1980-01-01' AND '1980-12-31' AND satscores.cname = 'Fresno'
SELECT schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.virtual = 'F' ORDER BY satscores.avgscrread DESC LIMIT 5
SELECT schools.`edopsname` FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrmath DESC LIMIT 1
SELECT avgscrmath, cname FROM satscores ORDER BY avgscrmath ASC LIMIT 1
SELECT avg(satscores.avgscrwrite), schools.city FROM satscores INNER JOIN schools ON satscores.cds = schools.cdscode WHERE satscores.numtsttakr = ( SELECT max(numtsttakr) FROM satscores )
SELECT schools.state FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.doc = 31 GROUP BY schools.state ORDER BY count(schools.state) DESC LIMIT 1
SELECT cast(count(schools.school) AS REAL) / 12 FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Alameda' AND schools.doc = 52 AND strftime('%Y', schools.opendate) = '1980'
SELECT cast(sum(CASE WHEN schools.doc = 54 THEN 1 ELSE 0 END) AS REAL) * 100 / sum(CASE WHEN schools.doc = 52 THEN 1 ELSE 0 END) FROM schools INNER JOIN frpm ON schools.cdscode = frpm.cdscode WHERE schools.county = 'Orange'
SELECT county, school, closeddate FROM schools WHERE statustype = 'Closed' GROUP BY county, school, closeddate ORDER BY count(school) DESC LIMIT 1
SELECT schools.mailstreet, schools.school FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrmath DESC LIMIT 5, 1
SELECT schools.mailstreet, schools.mailstrabr FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds ORDER BY satscores.avgscrread ASC LIMIT 1
SELECT count(schools.mailcity) FROM schools INNER JOIN satscores ON schools.cdscode = satscores.cds WHERE schools.mailcity = 'Fresno'
SELECT cast(sum(CASE WHEN schools.county = 'Colusa' THEN 1 ELSE 0 END) AS REAL) * 100 / sum(CASE WHEN schools.county = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE schools.mailstate = 'CA'
SELECT phone, ext, school FROM schools WHERE zip = '95203-3704'
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE account.frequency = 'POPLATEK TYDNE' AND strftime('%Y', loan.date) = '1997' ORDER BY loan.amount LIMIT 1
SELECT account.account_id FROM account INNER JOIN loan ON account.account_id = loan.account_id WHERE loan.duration > 12 AND account.date LIKE '1993%' ORDER BY loan.amount DESC LIMIT 1
SELECT account_id FROM account WHERE date = ( SELECT min(date) FROM account )
SELECT account.account_id FROM account INNER JOIN trans ON account.account_id = trans.account_id WHERE account.date < '1997-01-01' AND trans.amount > 3000
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY count(bond_type) DESC LIMIT 1
SELECT molecule_id FROM atom WHERE element = 'si'
SELECT DISTINCT atom.element FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id WHERE bond.bond_id = 'TR004_8_9'
SELECT atom.element FROM bond INNER JOIN atom ON bond.molecule_id = atom.molecule_id WHERE bond.bond_type = ' = '
SELECT DISTINCT molecule.label FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element != 'sn'
SELECT count(atom.atom_id) FROM molecule INNER JOIN atom ON molecule.molecule_id = atom.molecule_id INNER JOIN bond ON molecule.molecule_id = bond.molecule_id WHERE bond.bond_type = '-' AND atom.element IN ('i', 's')
SELECT name FROM cards WHERE frameversion = 2015 AND edhrecrank < 100
SELECT cards.name FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Japanese'
SELECT count(types) FROM cards WHERE artist = 'Aaron Boyd'
SELECT foreign_data.language FROM sets INNER JOIN set_translations ON sets.code = set_translations.setcode INNER JOIN foreign_data ON set_translations.language = foreign_data.language INNER JOIN cards ON sets.code = cards.setcode WHERE cards.name = 'Angel of Mercy'
SELECT cards.artist FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'Phyrexian'
SELECT count(cards.id) FROM cards INNER JOIN foreign_data ON cards.uuid = foreign_data.uuid WHERE foreign_data.language = 'German' AND cards.isreprint = 1
SELECT displayname FROM users WHERE displayname IN ('Harlan', 'Jarrod Dixon') ORDER BY reputation DESC LIMIT 1
SELECT displayname FROM users WHERE strftime('%Y', creationdate) = '2014'
SELECT count(id) FROM users WHERE lastaccessdate > '2014-09-01 00:00:00'
SELECT displayname FROM users ORDER BY views DESC LIMIT 1
SELECT count(users.id) FROM users INNER JOIN votes ON users.id = votes.userid WHERE users.upvotes > 100 AND users.downvotes > 1
SELECT count(id) FROM users WHERE strftime('%Y', creationdate) > '2013' AND views > 10
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT posts.title FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT ownerdisplayname FROM posts WHERE title = 'Eliciting priors from experts'
SELECT title FROM posts WHERE ownerdisplayname = 'csgillespie' ORDER BY viewcount DESC LIMIT 1
SELECT ownerdisplayname FROM posts ORDER BY favoritecount DESC LIMIT 1
SELECT sum(posts.commentcount) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT answercount FROM posts WHERE ownerdisplayname = 'csgillespie' ORDER BY answercount DESC LIMIT 1
SELECT lasteditordisplayname FROM posts WHERE title = 'Examples for teaching: Correlation does not mean causation'
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie' AND posts.parentid IS NULL
SELECT ownerdisplayname FROM posts WHERE closeddate IS NOT NULL
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.age > 65 AND posts.score >= 20
SELECT users.location FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Eliciting priors from experts'
SELECT posts.body FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname = 'bayesian'
SELECT posts.body FROM tags INNER JOIN posts ON tags.wikipostid = posts.id ORDER BY tags.count DESC LIMIT 1
SELECT count(badges.name) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie'
SELECT count(DISTINCT badges.name) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'csgillespie' AND strftime('%Y', badges.date) = '2011'
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.id ORDER BY count(badges.id) DESC LIMIT 1
SELECT avg(posts.score) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'csgillespie'
SELECT cast(count(badges.id) AS REAL) / count(DISTINCT users.displayname) FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.views > 200
SELECT cast(sum(CASE WHEN users.age > 65 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.score > 20
SELECT count(id) FROM votes WHERE creationdate = '2010-07-19' AND userid = 58
SELECT creationdate FROM votes GROUP BY creationdate ORDER BY count(id) DESC LIMIT 1
SELECT count(id) FROM badges WHERE name = 'Revival'
SELECT posts.title FROM comments INNER JOIN posts ON comments.postid = posts.id ORDER BY comments.score DESC LIMIT 1
SELECT commentcount FROM posts WHERE viewcount = 1910
SELECT posts.favoritecount FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posthistory.creationdate = '2014-04-23 20:29:39' AND posthistory.userid = 3025
SELECT comments.text FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.parentid = 107829 AND posts.commentcount = 1
SELECT CASE WHEN posts.closeddate IS NULL THEN 'YES' ELSE 'NO' END FROM comments INNER JOIN posts ON comments.postid = posts.id WHERE comments.userid = 23853 AND comments.creationdate = '2013-07-12 09:08:18.0'
SELECT users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 65041
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Tiago Pasqualini'
SELECT users.displayname FROM users INNER JOIN votes ON users.id = votes.userid WHERE votes.id = 6347
SELECT votes.postid FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE posts.title LIKE '%data visualization%'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'DatEpicCoderGuyWhoPrograms'
SELECT viewcount FROM posts WHERE title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT text FROM comments WHERE score = 17
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'SilentGhost'
SELECT users.displayname FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'thank you user93!'
SELECT comments.text FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.displayname = 'A Lion'
SELECT users.displayname, users.reputation FROM posts INNER JOIN users ON posts.owneruserid = users.id WHERE posts.title = 'Understanding what Dassault iSight is doing?'
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Necromancer' LIMIT 10
SELECT sum(posts.score), users.websiteurl FROM users INNER JOIN posts ON users.id = posts.lasteditoruserid WHERE users.displayname = 'Yevgeny'
SELECT sum(votes.bountyamount) FROM posts INNER JOIN votes ON posts.id = votes.postid WHERE posts.title LIKE '%data%'
SELECT count(id) FROM comments WHERE userid = 13
SELECT id FROM users ORDER BY reputation DESC LIMIT 1
SELECT id FROM users ORDER BY views ASC LIMIT 1
SELECT count(userid) FROM badges WHERE strftime('%Y', `date`) = '2011' AND name = 'Supporter'
SELECT count(userid) FROM badges GROUP BY userid HAVING count(name) > 5
SELECT users.displayname, users.reputation FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE posts.id = 1
SELECT badges.userid, badges.name FROM posts INNER JOIN badges ON posts.owneruserid = badges.userid GROUP BY badges.userid ORDER BY count(posts.id) DESC LIMIT 1
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Teacher' AND users.location = 'India'
SELECT DISTINCT posthistorytypeid, count(DISTINCT userid) FROM posthistory WHERE postid = 3720
SELECT count(userid) FROM badges WHERE name = 'Announcer'
SELECT name FROM badges WHERE date = '2010-07-19 19:39:08'
SELECT count(id) FROM comments WHERE score > 60
SELECT text FROM comments WHERE creationdate = '2010-07-19 19:25:47.0'
SELECT count(id) FROM posts WHERE score = 10
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.reputation = ( SELECT max(reputation) FROM users )
SELECT users.reputation FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Pierre'
SELECT badges.date FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Rochester, NY'
SELECT cast(count(CASE WHEN badges.name = 'Teacher' THEN users.id ELSE NULL END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid
SELECT cast(sum(CASE WHEN users.age >= 13 AND users.age <= 18 THEN 1 ELSE 0 END) AS REAL) * 100 / count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer'
SELECT score FROM posts WHERE creaiondate = '2010-07-19 19:19:56.0'
SELECT text FROM comments WHERE creationdate = '2010-07-19 19:37:33'
SELECT users.age FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'Vienna, Austria'
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Supporter' AND users.age >= 19 AND users.age <= 65
SELECT users.views FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.date = '2010-07-19 19:39:08.0'
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.reputation = ( SELECT min(reputation) FROM users )
SELECT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.displayname = 'Sharpie'
SELECT count(users.id) FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Supporter' AND users.age > 65
SELECT displayname FROM users WHERE id = 30
SELECT count(id) FROM users WHERE LOCATION = 'New York'
SELECT count(id) FROM votes WHERE strftime('%Y', creationdate) = '2010'
SELECT count(id) FROM users WHERE age BETWEEN 19 AND 65
SELECT cast(sum(CASE WHEN strftime('%Y', creationdate) = '2010' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN strftime('%Y', creationdate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT count(posts.id) FROM posts INNER JOIN votes ON posts.id = votes.postid INNER JOIN users ON users.id = votes.userid WHERE users.displayname = 'Matt Parker' AND votes.postid > 4
SELECT count(comments.score) FROM comments INNER JOIN users ON comments.userid = users.id WHERE users.displayname = 'Neil McGuigan' AND comments.score < 60
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Organizer'
SELECT count(userid) FROM badges WHERE strftime('%Y', date) = '2014' AND name = 'Commentator'
SELECT displayname, age FROM users ORDER BY views DESC LIMIT 1
SELECT lasteditdate, lasteditoruserid FROM posts WHERE title = 'Detecting a given face in a database of facial images'
SELECT count(id) FROM comments WHERE userid = 13 AND score < 60
SELECT DISTINCT badges.name FROM users INNER JOIN badges ON users.id = badges.userid WHERE users.location = 'North Pole' AND strftime('%Y', badges.date) = '2011'
SELECT users.lastaccessdate, users.location FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Outliers'
SELECT ownerdisplayname FROM posts ORDER BY viewcount DESC LIMIT 1
SELECT users.displayname, users.location FROM tags INNER JOIN posts ON tags.wikipostid = posts.id INNER JOIN users ON posts.owneruserid = users.id WHERE tags.tagname = 'hypothesis-testing'
SELECT ownerdisplayname FROM posts WHERE parentid IS NOT NULL ORDER BY score DESC LIMIT 1
SELECT users.displayname, users.websiteurl FROM users INNER JOIN votes ON users.id = votes.userid WHERE votes.votetypeid = 8 ORDER BY votes.bountyamount DESC LIMIT 1
SELECT title FROM posts ORDER BY viewcount DESC LIMIT 5
SELECT count(id) FROM tags WHERE count BETWEEN 5000 AND 7000
SELECT owneruserid FROM posts ORDER BY favoritecount DESC LIMIT 1
SELECT age FROM users ORDER BY reputation DESC LIMIT 1
SELECT count(votes.postid) FROM votes INNER JOIN posts ON votes.postid = posts.id WHERE strftime('%Y', votes.creationdate) = '2011' AND votes.bountyamount = 50
SELECT id FROM users ORDER BY age LIMIT 1
SELECT posts.score FROM tags INNER JOIN posts ON tags.wikipostid = posts.id ORDER BY tags.count DESC LIMIT 1
SELECT cast(count(DISTINCT postlinks.postid) AS REAL) / 12 FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid WHERE strftime('%Y', posts.creationdate) = '2010' AND posts.answercount <= 2
SELECT postid FROM votes WHERE userid = 1465 ORDER BY bountyamount DESC LIMIT 1
SELECT posts.title FROM posts INNER JOIN postlinks ON posts.id = postlinks.postid ORDER BY postlinks.creationdate ASC LIMIT 1
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid GROUP BY users.displayname ORDER BY count(badges.name) DESC LIMIT 1
SELECT votes.creationdate FROM users INNER JOIN votes ON users.id = votes.userid WHERE users.displayname = 'chl' ORDER BY votes.creationdate ASC LIMIT 1
SELECT creationdate FROM users ORDER BY age LIMIT 1
SELECT users.displayname FROM users INNER JOIN badges ON users.id = badges.userid WHERE badges.name = 'Autobiographer' ORDER BY badges.date ASC LIMIT 1
SELECT count(users.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.location = 'United Kingdom' AND posts.favoritecount >= 4
SELECT avg(votes.postid) FROM votes INNER JOIN users ON votes.userid = users.id ORDER BY users.age DESC LIMIT 1
SELECT displayname FROM users ORDER BY reputation DESC LIMIT 1
SELECT count(id) FROM users WHERE reputation > 2000 AND views > 1000
SELECT displayname FROM users WHERE age BETWEEN 19 AND 65
SELECT count(posts.id) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Jay Stevens' AND strftime('%Y', posts.creaiondate) = '2010'
SELECT id, title FROM posts WHERE ownerdisplayname = 'Harvey Motulsky' ORDER BY viewcount DESC LIMIT 1
SELECT id, title FROM posts ORDER BY score DESC LIMIT 1
SELECT avg(posts.score) FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE users.displayname = 'Stephen Turner'
SELECT users.displayname FROM users INNER JOIN posts ON users.id = posts.owneruserid WHERE strftime('%Y', posts.creaiondate) = '2011' AND posts.viewcount > 20000
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
SELECT count(DISTINCT badges.userid) FROM badges INNER JOIN users ON badges.userid = users.id WHERE badges.name = 'Citizen Patrol'
SELECT count(tags.wikipostid) FROM tags INNER JOIN posts ON tags.wikipostid = posts.id WHERE tags.tagname = 'careers'
SELECT reputation, views FROM users WHERE displayname = 'Jarrod Dixon'
SELECT count(comments.id), count(posts.acceptedanswerid) FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.title = 'Clustering 1D data'
SELECT creationdate FROM users WHERE displayname = 'IrishStat'
SELECT count(id) FROM votes WHERE bountyamount >= 30
SELECT count(id) FROM posts WHERE score < 20
SELECT count(tagname) FROM tags WHERE id < 15 AND count <= 20
SELECT excerptpostid, wikipostid FROM tags WHERE tagname = 'sample'
SELECT users.reputation, users.upvotes FROM users INNER JOIN comments ON users.id = comments.userid WHERE comments.text = 'fine, you win :)'
SELECT posthistory.text FROM posts INNER JOIN posthistory ON posts.id = posthistory.postid WHERE posts.title = 'How can I adapt ANOVA for binary data?'
SELECT comments.text FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.viewcount BETWEEN 100 AND 150 ORDER BY comments.score DESC LIMIT 1
SELECT users.creationdate, users.age FROM users INNER JOIN comments ON users.id = comments.userid WHERE users.websiteurl LIKE 'http://%'
SELECT count(posts.id) FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE comments.score = 0 AND posts.viewcount < 5
SELECT count(posts.id) FROM posts INNER JOIN comments ON posts.id = comments.postid WHERE posts.commentcount = 1 AND comments.score = 0
SELECT count(superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength'
SELECT count(superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Super Strength' AND superhero.height_cm > 200
SELECT superhero.full_name FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id GROUP BY superhero.full_name HAVING count(superhero.full_name) > 15
SELECT count(superhero.id) FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE colour.colour = 'Blue'
SELECT colour.colour FROM superhero INNER JOIN colour ON superhero.skin_colour_id = colour.id WHERE superhero.superhero_name = 'Apocalypse'
SELECT count(superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN colour ON superhero.eye_colour_id = colour.id WHERE superpower.power_name = 'Agility' AND colour.colour = 'Blue'
SELECT superhero.full_name FROM superhero INNER JOIN colour ON superhero.eye_colour_id = colour.id INNER JOIN colour ON superhero.hair_colour_id = colour.id INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id WHERE superpower.power_name = 'Agility' AND colour.colour = 'Blue' AND colour.colour = 'Blond'
SELECT count(superhero.id) FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT superhero.full_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics' ORDER BY superhero.height_cm DESC LIMIT 1
SELECT publisher.publisher_name FROM superhero INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE superhero.superhero_name = 'Sauron'
SELECT cast(sum(CASE WHEN superpower.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / count(superhero.id) FROM superhero INNER JOIN hero_power ON superhero.id = hero_power.hero_id INNER JOIN superpower ON hero_power.power_id = superpower.id INNER JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher.publisher_name = 'Marvel Comics'
SELECT circuits.country FROM circuits INNER JOIN races ON circuits.circuitid = races.circuitid INNER JOIN results ON races.raceid = results.raceid INNER JOIN constructors ON results.constructorid = constructors.constructorid WHERE results.raceid = 24 GROUP BY circuits.country
SELECT qualifying.q1 FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE drivers.forename = 'Bruno' AND drivers.surname = 'Senna' AND qualifying.raceid = 354
SELECT drivers.nationality FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 355 AND qualifying.q2 = '0:01:40'
SELECT drivers.number FROM drivers INNER JOIN qualifying ON drivers.driverid = qualifying.driverid WHERE qualifying.raceid = 903 AND qualifying.q3 = '1:01:54'
SELECT count(results.driverid) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.name = 'Bahrain Grand Prix' AND races.year = 2007 AND results.time IS NULL
SELECT seasons.url FROM races INNER JOIN seasons ON races.year = seasons.year WHERE races.raceid = 901
SELECT count(results.driverid) FROM results INNER JOIN races ON results.raceid = races.raceid WHERE races.date = '2015-11-29'
SELECT drivers.forename, drivers.surname FROM drivers INNER JOIN results ON drivers.driverid = results.driverid WHERE results.raceid = 592 ORDER BY drivers.dob LIMIT 1
SELECT drivers.url FROM drivers INNER JOIN laptimes ON drivers.driverid = laptimes.driverid WHERE laptimes.time = '01:27.000' AND laptimes.raceid = 161
SELECT drivers.forename, drivers.surname FROM results INNER JOIN drivers ON results.driverid = drivers.driverid WHERE results.raceid = 933 ORDER BY results.fastestlapspeed DESC LIMIT 1
SELECT circuits.lat, circuits.lng FROM races INNER JOIN circuits ON races.circuitid = circuits.circuitid WHERE races.name = 'Malaysian Grand Prix'
SELECT code FROM drivers WHERE nationality = 'America'
SELECT driverid FROM laptimes ORDER BY milliseconds DESC LIMIT 5
SELECT LOCATION, country FROM circuits WHERE name = 'Hungaroring'
SELECT nationality FROM drivers GROUP BY nationality ORDER BY count(nationality) DESC LIMIT 1
SELECT races.name FROM results INNER JOIN races ON results.raceid = races.raceid ORDER BY results.fastestlaptime LIMIT 1
SELECT circuits.location FROM circuits INNER JOIN laptimes ON circuits.circuitid = laptimes.raceid WHERE laptimes.time = '1:29.488'
SELECT player_api_id FROM player_attributes ORDER BY overall_rating DESC LIMIT 1
SELECT height, player_name FROM player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM player_attributes ORDER BY potential ASC LIMIT 1
SELECT count(player_attributes.player_api_id) FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id WHERE player_attributes.overall_rating BETWEEN 60 AND 65 AND player_attributes.defensive_work_rate = 'low'
SELECT player_attributes.player_api_id FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id ORDER BY player_attributes.crossing DESC LIMIT 5
SELECT league.name FROM `match` INNER JOIN league ON match.league_id = league.id WHERE match.season = '2016/2017' GROUP BY league.name ORDER BY sum(match.home_team_goal) + sum(match.away_team_goal) DESC LIMIT 1
SELECT team.team_long_name FROM team INNER JOIN MATCH ON team.team_api_id = MATCH.home_team_api_id WHERE MATCH.season = '2016/2017' GROUP BY team.team_long_name ORDER BY sum(MATCH.home_team_goal - MATCH.away_team_goal) LIMIT 1
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player_attributes.penalties DESC LIMIT 10
SELECT player.player_name FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id WHERE player_attributes.attacking_work_rate = 'high'
SELECT player_name FROM player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT team_attributes.buildupplayspeedclass FROM team INNER JOIN team_attributes ON team.team_api_id = team_attributes.team_api_id WHERE team.team_long_name = 'KSV Cercle Brugge'
SELECT player_attributes.finishing, player_attributes.curve FROM player INNER JOIN player_attributes ON player.player_api_id = player_attributes.player_api_id ORDER BY player.weight DESC LIMIT 1
SELECT player.player_name FROM player_attributes INNER JOIN player ON player_attributes.player_api_id = player.player_api_id ORDER BY player_attributes.overall_rating DESC LIMIT 1
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id), cast(sum(CASE WHEN admission = '-' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE sex = 'M'
SELECT cast(sum(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE strftime('%Y', birthday) > '1930'
SELECT cast(sum(CASE WHEN admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / count(id) FROM patient WHERE strftime('%Y', birthday) BETWEEN '1930' AND '1940'
SELECT cast(sum(CASE WHEN patient.admission = '+' THEN 1 ELSE 0 END) AS REAL) / sum(CASE WHEN patient.admission = '-' THEN 1 ELSE 0 END) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE'
SELECT patient.diagnosis, laboratory.date FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE patient.id = '30609'
SELECT patient.sex, patient.birthday, examination.`examination date`, examination.symptoms FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.id = 163109
SELECT patient.id, patient.sex, patient.birthday FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.ldh > 500
SELECT patient.id, strftime('%Y', CURRENT_TIMESTAMP) - strftime('%Y', patient.birthday) AS age FROM examination INNER JOIN patient ON examination.id = patient.id WHERE examination.rvvt = '+'
SELECT patient.id, patient.sex, patient.diagnosis FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.thrombosis = 2
SELECT patient.id FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE strftime('%Y', patient.birthday) = '1937' AND laboratory.`t-cho` >= 250
SELECT patient.id, patient.sex, patient.diagnosis FROM laboratory INNER JOIN patient ON laboratory.id = patient.id WHERE laboratory.alb < 3.5
SELECT `t-cho` FROM laboratory WHERE id = 2927464 AND `date` = '1995-09-04'
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE patient.sex = 'F' AND patient.birthday BETWEEN '1980-01-01' AND '1989-12-31' AND examination.`ana pattern` != 'P'
SELECT `first date`, diagnosis FROM patient WHERE id = 48473
SELECT count(patient.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE laboratory.glu < 180 AND examination.thrombosis = 0
SELECT count(patient.id) FROM patient INNER JOIN laboratory ON patient.id = laboratory.id WHERE laboratory.wbc BETWEEN 3.5 AND 9 AND patient.admission = '+'
SELECT count(laboratory.id) FROM laboratory INNER JOIN patient ON laboratory.id = patient.id INNER JOIN examination ON patient.id = examination.id WHERE patient.diagnosis = 'SLE' AND laboratory.wbc BETWEEN 3.5 AND 9.0
SELECT count(patient.id) FROM patient INNER JOIN examination ON patient.id = examination.id WHERE examination.diagnosis IS NOT NULL AND examination.plt BETWEEN 100 AND 399
SELECT count(laboratory.id) FROM laboratory INNER JOIN examination ON laboratory.id = examination.id WHERE examination.thrombosis = 2 AND laboratory.pt < 14
SELECT major.major_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Angela' AND member.last_name = 'Sanders'
SELECT count(*) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.college = 'College of Engineering'
SELECT member.first_name, member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.department = 'Art and Design Department'
SELECT count(attendance.link_to_member) FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT member.phone FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Women''s Soccer'
SELECT count(member.member_id) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event INNER JOIN member ON attendance.link_to_member = member.member_id WHERE event.event_name = 'Women''s Soccer' AND member.t_shirt_size = 'Medium'
SELECT event.event_name FROM attendance INNER JOIN event ON attendance.link_to_event = event.event_id GROUP BY event.event_name ORDER BY count(attendance.link_to_event) DESC LIMIT 1
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.position = 'Vice President'
SELECT event.event_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE member.first_name = 'Maya' AND member.last_name = 'Mclean'
SELECT count(*) FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE strftime('%Y', event.event_date) = '2019' AND member.first_name = 'Sacha' AND member.last_name = 'Harrison'
SELECT count(event.event_id) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE event.type = 'Meeting' GROUP BY event.event_id HAVING count(event.event_id) > 10
SELECT event.event_name FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event GROUP BY event.event_name HAVING count(attendance.link_to_member) > 20
SELECT cast(count(attendance.link_to_member) AS REAL) / count(DISTINCT event.event_name) FROM event INNER JOIN attendance ON event.event_id = attendance.link_to_event WHERE strftime('%Y', event.event_date) = '2020' AND event.type = 'Meeting'
SELECT expense_description FROM expense ORDER BY cost DESC LIMIT 1
SELECT count(member.member_id) FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Environmental Engineering'
SELECT member.first_name, member.last_name FROM attendance INNER JOIN member ON attendance.link_to_member = member.member_id INNER JOIN event ON attendance.link_to_event = event.event_id WHERE event.event_name = 'Laugh Out Loud'
SELECT member.last_name FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE major.major_name = 'Law and Constitutional Studies'
SELECT zip_code.county FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.first_name = 'Sherri' AND member.last_name = 'Ramsey'
SELECT major.college FROM member INNER JOIN major ON member.link_to_major = major.major_id WHERE member.first_name = 'Tyler' AND member.last_name = 'Hewitt'
SELECT sum(income.amount) FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE member.position = 'Vice President'
SELECT cast(sum(expense.cost) AS REAL) * 100 / count(event.event_id) FROM event INNER JOIN expense ON event.event_id = expense.link_to_budget WHERE event.type = 'Game'
SELECT member.first_name, member.last_name FROM expense INNER JOIN member ON expense.link_to_member = member.member_id ORDER BY expense.cost DESC LIMIT 5
SELECT member.first_name, member.last_name, member.phone FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.cost > ( SELECT avg(cost) FROM expense )
SELECT cast(sum(CASE WHEN zip_code.state = 'Maine' THEN 1 ELSE 0 END) AS REAL) * 100 / count(member.position) - cast(sum(CASE WHEN zip_code.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / count(member.position) FROM member INNER JOIN zip_code ON member.zip = zip_code.zip_code WHERE member.position = 'Member'
SELECT member.first_name, member.last_name, expense.cost FROM expense INNER JOIN member ON expense.link_to_member = member.member_id WHERE expense.expense_description = 'Water, Veggie tray, supplies'
SELECT budget.category, budget.amount FROM event INNER JOIN budget ON event.event_id = budget.link_to_event WHERE event.event_name = 'January Speaker'
SELECT event.event_name FROM budget INNER JOIN event ON budget.link_to_event = event.event_id WHERE budget.category = 'Food'
SELECT member.first_name, member.last_name, income.amount FROM income INNER JOIN member ON income.link_to_member = member.member_id WHERE income.date_received = '2019-09-09'
SELECT budget.category FROM expense INNER JOIN budget ON expense.link_to_budget = budget.budget_id WHERE expense.expense_description = 'Posters'
SELECT customers.customerid, sum(yearmonth.consumption) FROM customers INNER JOIN yearmonth ON customers.customerid = yearmonth.customerid WHERE customers.segment = 'KAM' GROUP BY customers.customerid ORDER BY sum(yearmonth.consumption) DESC LIMIT 1
SELECT DISTINCT gasstations.country FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE substr(`date`, 1, 7) = '201306'
SELECT avg(transactions_1k.price) FROM gasstations INNER JOIN transactions_1k ON gasstations.gasstationid = transactions_1k.gasstationid WHERE gasstations.country = 'CZE'
SELECT avg(transactions_1k.price) FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid WHERE customers.currency = 'EUR'
SELECT customers.customerid, avg(transactions_1k.price / transactions_1k.amount), customers.currency FROM customers INNER JOIN transactions_1k ON customers.customerid = transactions_1k.customerid GROUP BY customers.customerid, customers.currency ORDER BY sum(transactions_1k.price / transactions_1k.amount) DESC LIMIT 1
