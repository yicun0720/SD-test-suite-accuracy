SELECT MAX(`Free Meal Count (K-12)` / `Enrollment (K-12)`) AS HighestEligibleFreeRate FROM frpm WHERE `County Name` = 'Alameda' AND `Enrollment (K-12)` > 0;	california_schools
WITH rt AS ( SELECT `Free Meal Count (Ages 5-17)` / `Enrollment (Ages 5-17)` AS rate FROM frpm WHERE `Educational Option Type` = 'Continuation School' ) SELECT rate FROM rt AS rt2 WHERE EXISTS ( SELECT 1 FROM (SELECT rate FROM rt ORDER BY rate ASC LIMIT 3) top WHERE top.rate = rt2.rate )	california_schools
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`District Name` = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1	california_schools
SELECT T3.MailStreet FROM schools AS T3 WHERE T3.CDSCode IN (SELECT T1.CDSCode FROM frpm AS T1 WHERE T1.`FRPM Count (K-12)` = (SELECT max(T2.`FRPM Count (K-12)`) FROM frpm AS T2))	california_schools
SELECT T2.Phone FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Charter Funding Type` = 'Directly funded' AND T1.`Charter School (Y/N)` = 1 AND T2.OpenDate > '2000-01-01'	california_schools
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.Magnet = 1 AND T1.NumTstTakr > 500	california_schools
SELECT T1.Phone FROM schools AS T1 WHERE T1.CDSCode IN (SELECT T2.cds FROM satscores AS T2 WHERE T2.NumGE1500 = (SELECT max(T3.NumGE1500) FROM satscores AS T3))	california_schools
SELECT COUNT(*) FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.`Charter Funding Type` = 'Directly funded'	california_schools
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores T1 JOIN frpm T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL);	california_schools
SELECT T2.CDSCode FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` + T2.`Enrollment (Ages 5-17)` > 500	california_schools
SELECT MAX(CAST(T1.`Free Meal Count (Ages 5-17)` AS REAL) / T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr > 0.3	california_schools
WITH rt AS ( SELECT T1.Phone, CAST(T2.NumGE1500 AS REAL) / T2.NumTstTakr AS rate FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds ) SELECT Phone FROM rt AS rt2 WHERE EXISTS (SELECT 1 FROM (SELECT rate FROM rt ORDER BY rate DESC LIMIT 3) top WHERE top.rate = rt2.rate )	california_schools
SELECT T1.NCESSchool FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T2.`Enrollment (Ages 5-17)` DESC LIMIT 5	california_schools
SELECT T1.District FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.StatusType = 'Active' AND T2.AvgScrRead = (SELECT max(T4.AvgScrRead) FROM schools AS T3 INNER JOIN satscores AS T4 ON T3.CDSCode = T4.cds WHERE T3.StatusType = 'Active')	california_schools
SELECT COUNT(T1.CDSCode) FROM frpm AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.`Charter Funding Type` = 'Directly funded' AND T1.`County Name` = 'Fresno' AND T2.NumTstTakr <= 250	california_schools
SELECT T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath = (SELECT max(T3.AvgScrMath) FROM satscores AS T3)	california_schools
SELECT COUNT(T1.`School Name`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.County = 'Amador' AND T1.`Low Grade` = 9 AND T1.`High Grade` = 12	california_schools
SELECT sname FROM satscores WHERE cname = 'Contra Costa' AND sname IS NOT NULL AND NumTstTakr = (SELECT max(T1.NumTstTakr) FROM satscores as T1)	california_schools
SELECT T1.School, T1.Street FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` - T2.`Enrollment (Ages 5-17)` > 30	california_schools
SELECT T2.`School Name` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE CAST(T2.`Free Meal Count (K-12)` AS REAL) / T2.`Enrollment (K-12)` > 0.1 AND T1.NumGE1500 > 0	california_schools
SELECT T2.School, T1.AvgScrWrite, T2.Phone FROM schools AS T2 LEFT JOIN satscores AS T1 ON T2.CDSCode = T1.cds WHERE strftime('%Y', T2.OpenDate) > '1991' OR strftime('%Y', T2.ClosedDate) < '2000'	california_schools
SELECT School, DOCType FROM schools WHERE CDSCode IN (SELECT CDSCode FROM frpm WHERE (`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) > (SELECT AVG(`Enrollment (K-12)` - `Enrollment (Ages 5-17)`) FROM frpm JOIN schools ON schools.CDSCode = frpm.CDSCode WHERE FundingType = 'Locally funded')) AND FundingType = 'Locally funded'	california_schools
SELECT T2.OpenDate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` = (SELECT max(T3.`Enrollment (K-12)`) FROM frpm AS T3)	california_schools
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode GROUP BY T2.City HAVING SUM(T1.`Enrollment (K-12)`) <= (SELECT min(S) FROM (SELECT SUM(T3.`Enrollment (K-12)`) AS S FROM frpm AS T3 INNER JOIN schools AS T4 ON T3.CDSCode = T4.CDSCode GROUP BY T4.City ORDER BY SUM(T3.`Enrollment (K-12)`) ASC LIMIT 5))	california_schools
SELECT CAST(`Free Meal Count (K-12)` AS REAL) / `Enrollment (K-12)` FROM frpm ORDER BY `Enrollment (K-12)` DESC LIMIT 9, 2	california_schools
WITH stats AS ( SELECT T1.`FRPM Count (K-12)` AS cnt, CAST(T1.`FRPM Count (K-12)` AS REAL) / T1.`Enrollment (K-12)` AS rate FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.SOC = 66 ) SELECT rate FROM stats AS s2 WHERE EXISTS (SELECT 1 FROM (SELECT cnt FROM stats ORDER BY cnt DESC LIMIT 5) top WHERE top.cnt = s2.cnt )	california_schools
SELECT T2.Website, T1.`School Name` FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000 AND T2.Website IS NOT NULL	california_schools
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores T1 JOIN schools T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 IS NOT NULL)	california_schools
SELECT T2.Street, T2.City, T2.State, T2.Zip FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr = (SELECT min(CAST(T3.NumGE1500 AS REAL) / T3.NumTstTakr) FROM satscores AS T3)	california_schools
SELECT AVG(T1.NumTstTakr) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE strftime('%Y', T2.OpenDate) = '1980' AND T2.County = 'Fresno'	california_schools
SELECT School FROM (SELECT T2.School,T1.AvgScrRead, RANK() OVER (PARTITION BY T2.County ORDER BY T1.AvgScrRead DESC) AS rnk FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.Virtual = 'F' ) ranked_schools WHERE rnk <= 5	california_schools
SELECT T2.EdOpsName FROM satscores T1 JOIN schools T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath = (SELECT MAX(AvgScrMath) FROM satscores WHERE AvgScrMath IS NOT NULL)	california_schools
WITH RankedScores AS (SELECT cds, (AvgScrMath + AvgScrRead + AvgScrWrite) AS TotalScore FROM satscores WHERE AvgScrMath IS NOT NULL AND AvgScrRead IS NOT NULL AND AvgScrWrite IS NOT NULL) SELECT T1.AvgScrMath, T2.County FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE (AvgScrMath + AvgScrRead + AvgScrWrite) = (SELECT min(TotalScore) FROM RankedScores ORDER BY TotalScore ASC LIMIT 1)	california_schools
SELECT T2.City, T1.AvgScrWrite FROM satscores T1 JOIN schools T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL AND T1.NumGE1500 = (SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 IS NOT NULL)	california_schools
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = 31 AND T1.`Enrollment (K-12)` = (SELECT max(T3.`Enrollment (K-12)`) FROM frpm AS T3)	california_schools
SELECT CAST(COUNT(School) AS REAL) / 12 FROM schools WHERE DOC = 52 AND County = 'Alameda' AND strftime('%Y', OpenDate) = '1980'	california_schools
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE StatusType = 'Merged' AND County = 'Orange'	california_schools
SELECT DISTINCT County, School, ClosedDate FROM schools WHERE County = ( SELECT County FROM schools WHERE StatusType = 'Closed' GROUP BY County ORDER BY COUNT(School) DESC LIMIT 1 ) AND StatusType = 'Closed' AND school IS NOT NULL	california_schools
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ORDER BY T1.AvgScrMath DESC LIMIT 6, 1	california_schools
WITH scr AS ( SELECT T2.MailStreet, T2.School, T1.AvgScrRead FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode ) SELECT MailStreet, School FROM scr WHERE AvgScrRead = (SELECT MIN(AvgScrRead) FROM scr)	california_schools
SELECT TOTAL(T2.NumTstTakr) FROM schools T1 INNER JOIN satscores T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno';	california_schools
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'	california_schools
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'	california_schools
SELECT account_id FROM account WHERE account_id IN ( SELECT account_id FROM loan WHERE STRFTIME('%Y', date) = '1997' AND amount = ( SELECT MIN(amount) FROM loan WHERE STRFTIME('%Y', date) = '1997' ) ) AND account_id IN ( SELECT account_id FROM loan WHERE STRFTIME('%Y', date) = '1997' AND frequency = 'POPLATEK TYDNE' )	financial
SELECT T1.account_id FROM loan T1 JOIN account T2 ON T1.account_id = T2.account_id WHERE T1.duration > 12 AND strftime('%Y', T2.date) = '1993' AND T1.amount = (SELECT MAX(amount) FROM loan WHERE duration > 12 AND account_id IN (SELECT account_id FROM account WHERE strftime('%Y', date) = '1993')) GROUP BY T1.account_id HAVING MAX(T1.amount)	financial
SELECT DISTINCT account_id FROM trans WHERE date = (SELECT MIN(date) FROM trans WHERE strftime('%Y', date) = '1995')	financial
SELECT DISTINCT T2.account_id FROM trans AS T1 INNER JOIN account AS T2 ON T1.account_id = T2.account_id WHERE STRFTIME('%Y', T2.date) < '1997' AND T1.balance > 3000	financial
WITH BondCounts AS (SELECT bond_type, COUNT(*) AS count FROM bond GROUP BY bond_type) SELECT bond_type FROM BondCounts WHERE count = (SELECT MAX(count) FROM BondCounts);	toxicology
SELECT DISTINCT molecule_id FROM atom WHERE element = 'c';	toxicology
SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id WHERE C.bond_id = 'TR004_8_9' UNION SELECT DISTINCT A.element FROM atom A JOIN connected C ON A.atom_id = C.atom_id2 WHERE C.bond_id = 'TR004_8_9';	toxicology
SELECT DISTINCT T3.element FROM bond T1 JOIN connected T2 ON T1.bond_id = T2.bond_id JOIN atom T3 ON T2.atom_id = T3.atom_id OR T2.atom_id2 = T3.atom_id WHERE T1.bond_type = '=';	toxicology
SELECT DISTINCT label FROM molecule EXCEPT SELECT DISTINCT label FROM molecule JOIN atom ON molecule.molecule_id = atom.molecule_id WHERE atom.element = 'sn';	toxicology
WITH atoms1 AS ( SELECT T1.atom_id AS a, T1.element AS e FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' ), atoms2 AS ( SELECT T1.atom_id AS a, T1.element AS e FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id2 INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' ) SELECT COUNT(DISTINCT a) FROM ( SELECT * FROM atoms1 UNION SELECT * FROM atoms2 WHERE e = 'i' OR e = 's' ) T	toxicology
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100;	card_games
SELECT T1.name FROM cards AS T1 Where T1.uuid IN (SELECT T2.uuid FROM foreign_data AS T2 WHERE T2.language = 'Japanese')	card_games
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd' GROUP BY artist;	card_games
SELECT DISTINCT T2.language FROM cards T1 JOIN set_translations T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy';	card_games
SELECT DISTINCT T1.artist FROM cards T1 JOIN foreign_data T2 ON T1.uuid = T2.uuid WHERE T2.language = 'Phyrexian';	card_games
SELECT COUNT(DISTINCT T1.uuid) FROM cards AS T1 JOIN foreign_data AS T2 ON T1.uuid = T2.uuid WHERE T1.isReprint = 1 AND T2.language = 'German';	card_games
SELECT DisplayName FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') AND Reputation = ( SELECT MAX(Reputation) FROM users WHERE DisplayName IN ('Harlan', 'Jarrod Dixon') )	codebase_community
SELECT DisplayName FROM users WHERE STRFTIME('%Y', CreationDate) = '2011'	codebase_community
SELECT COUNT(Id) FROM users WHERE date(LastAccessDate) > '2014-09-01'	codebase_community
SELECT DisplayName FROM users WHERE Views = ( SELECT MAX(Views) FROM users )	codebase_community
SELECT COUNT(Id) FROM users WHERE Upvotes > 100 AND Downvotes > 1	codebase_community
SELECT COUNT(id) FROM users WHERE STRFTIME('%Y', CreationDate) > '2013' AND Views > 10	codebase_community
SELECT COUNT(T1.id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T1.Title FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT Title FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie') AND ViewCount = (SELECT MAX(ViewCount) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE DisplayName = 'csgillespie'))	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM posts))	codebase_community
SELECT SUM(T1.CommentCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT MAX(T1.AnswerCount) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T1.Title = 'Examples for teaching: Correlation does not mean causation'	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie' AND T1.ParentId IS NULL	codebase_community
SELECT DisplayName FROM users WHERE Id IN ( SELECT OwnerUserId FROM posts WHERE ClosedDate IS NOT NULL )	codebase_community
SELECT COUNT(*) FROM posts WHERE OwnerUserId IN (SELECT Id FROM users WHERE Age > 65) AND Score >= 20	codebase_community
SELECT T2.Location FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Title = 'Eliciting priors from experts'	codebase_community
SELECT T2.Body FROM tags AS T1 LEFT JOIN posts AS T2 ON T2.Id = T1.ExcerptPostId WHERE T1.TagName = 'bayesian'	codebase_community
SELECT posts.Body FROM tags LEFT JOIN posts ON tags.ExcerptPostId = posts.Id WHERE tags.Count = (SELECT MAX(Count) FROM tags)	codebase_community
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT T1.`Name` FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT COUNT(T1.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE STRFTIME('%Y', T1.Date) = '2011' AND T2.DisplayName = 'csgillespie'	codebase_community
WITH cnt AS ( SELECT T2.DisplayName, COUNT(*) AS cnt FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id GROUP BY T2.Id ) SELECT DisplayName FROM cnt WHERE cnt = ( SELECT MAX(cnt) FROM cnt )	codebase_community
SELECT AVG(T1.Score) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T2.DisplayName = 'csgillespie'	codebase_community
SELECT AVG(badge_count) FROM (SELECT COUNT(b.Id) AS badge_count FROM users u JOIN badges b ON u.Id = b.UserId WHERE u.Views > 200 GROUP BY u.Id)	codebase_community
SELECT CAST(SUM(IIF(T2.Age > 65, 1, 0)) AS REAL) * 100 / COUNT(T1.Id) FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Score > 5	codebase_community
SELECT COUNT(Id) FROM votes WHERE UserId = 58 AND CreationDate = '2010-07-19'	codebase_community
WITH VoteCounts AS ( SELECT CreationDate, COUNT(Id) AS VoteCount FROM votes GROUP BY CreationDate ) SELECT CreationDate FROM VoteCounts WHERE VoteCount = ( SELECT MAX(VoteCount) FROM VoteCounts )	codebase_community
SELECT Id FROM badges WHERE Name = 'Revival'	codebase_community
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE Score = (SELECT MAX(Score) FROM comments))	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount = 1910	codebase_community
SELECT FavoriteCount FROM posts WHERE Id IN (SELECT PostId FROM comments WHERE UserId = 3025 AND CreationDate = '2014-04-23 20:29:39.0')	codebase_community
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ParentId = 107829 AND T1.CommentCount = 1	codebase_community
SELECT IIF(T2.ClosedDate IS NULL, 'NOT well-finished', 'well-finished') AS resylt FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.UserId = 23853 AND T1.CreationDate = '2013-07-12 09:08:18.0'	codebase_community
SELECT T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 65041	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Tiago Pasqualini'	codebase_community
SELECT T1.DisplayName FROM users AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.UserId WHERE T2.Id = 6347	codebase_community
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data visualization%'	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'DatEpicCoderGuyWhoPrograms')	codebase_community
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'	codebase_community
SELECT Text FROM comments WHERE Score = 17	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'SilentGhost')	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM comments WHERE Text = 'thank you user93!')	codebase_community
SELECT Text FROM comments WHERE UserId IN (SELECT Id FROM users WHERE DisplayName = 'A Lion')	codebase_community
SELECT Reputation FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE Title = 'Understanding what Dassault iSight is doing?')	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Necromancer') LIMIT 10	codebase_community
SELECT SUM(T1.Score), T2.WebsiteUrl FROM posts AS T1 INNER JOIN users AS T2 ON T1.LastEditorUserId = T2.Id WHERE T2.DisplayName = 'Yevgeny' GROUP BY T2.Id	codebase_community
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'	codebase_community
SELECT COUNT(Id) FROM comments WHERE UserId = 13	codebase_community
SELECT Id FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT Id FROM users WHERE Views = ( SELECT MIN(Views) FROM users )	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Supporter' AND strftime('%Y', Date) = '2011'	codebase_community
SELECT COUNT(UserId) FROM ( SELECT UserId, COUNT(*) AS num FROM badges GROUP BY UserId ) T WHERE T.num > 5	codebase_community
SELECT T2.Id, T2.Reputation FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id WHERE T1.Id = 1	codebase_community
SELECT b.Name FROM badges b WHERE b.UserId IN (SELECT UserId FROM comments GROUP BY UserId HAVING COUNT(Id) = (SELECT MAX(CommentCount) FROM (SELECT COUNT(Id) AS CommentCount FROM comments GROUP BY UserId)))	codebase_community
SELECT COUNT(DISTINCT T2.Id) FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.Location = 'India' AND T1.Name = 'Teacher'	codebase_community
SELECT T1.PostHistoryTypeId, (SELECT COUNT(DISTINCT UserId) FROM comments WHERE PostId = 3720) AS NumberOfUsers FROM postHistory AS T1 WHERE T1.PostId = 3720	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Announcer'	codebase_community
SELECT Name FROM badges WHERE Date = '2010-07-19 19:39:08.0'	codebase_community
SELECT COUNT(id) FROM comments WHERE score > 60	codebase_community
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:16:14.0'	codebase_community
SELECT COUNT(id) FROM posts WHERE Score = 10	codebase_community
SELECT Name FROM badges WHERE UserId IN (SELECT Id FROM users WHERE Reputation = (SELECT MAX(Reputation) FROM users))	codebase_community
SELECT Reputation FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0')	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Pierre'	codebase_community
SELECT T2.Date FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'Rochester, NY'	codebase_community
SELECT (COUNT(DISTINCT T1.UserId) * 100.0 / (SELECT COUNT(*) FROM users)) AS Percentage FROM badges T1 WHERE T1.Name = 'Teacher'	codebase_community
SELECT CAST( SUM( IIF( T.Age BETWEEN 13 AND 18, 1, 0 ) ) AS REAL ) * 100 / COUNT(T.Id) FROM ( SELECT Id, Age FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Organizer') ) T	codebase_community
SELECT T1.Score FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:19:56.0'	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T1.CreationDate = '2010-07-19 19:37:33.0'	codebase_community
SELECT Age FROM users WHERE Id IN (SELECT UserId FROM badges) AND Location = 'Vienna, Austria'	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Supporter' AND T1.Age BETWEEN 19 AND 65	codebase_community
SELECT Views FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Date = '2010-07-19 19:39:08.0')	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Reputation = (SELECT MIN(Reputation) FROM users)	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Sharpie'	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Age > 65 AND T2.Name = 'Supporter'	codebase_community
SELECT DisplayName FROM users WHERE Id = 30	codebase_community
SELECT COUNT(Id) FROM users WHERE Location = 'New York'	codebase_community
SELECT COUNT(id) FROM votes WHERE STRFTIME('%Y', CreationDate) = '2010'	codebase_community
SELECT COUNT(id) FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT CAST(SUM(IIF(STRFTIME('%Y', CreationDate) = '2010', 1, 0)) AS REAL) / SUM(IIF(STRFTIME('%Y', CreationDate) = '2011', 1, 0)) FROM votes	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN postHistory AS T2 ON T1.Id = T2.UserId INNER JOIN posts AS T3 ON T2.PostId = T3.Id INNER JOIN votes AS T4 ON T4.PostId = T3.Id WHERE T1.DisplayName = 'Matt Parker' GROUP BY T2.PostId, T4.Id HAVING COUNT(T4.Id) > 4	codebase_community
SELECT COUNT(T3.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Neil McGuigan' AND T3.Score < 60	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Organizer')	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Commentator' AND STRFTIME('%Y', Date) = '2014'	codebase_community
SELECT DisplayName, Age FROM users WHERE Views = ( SELECT MAX(Views) FROM users )	codebase_community
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'	codebase_community
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60	codebase_community
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE STRFTIME('%Y', T2.Date) = '2011' AND T1.Location = 'North Pole'	codebase_community
SELECT LastAccessDate, Location FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'outliers')	codebase_community
SELECT DisplayName FROM users WHERE Id IN ( SELECT OwnerUserId FROM posts WHERE ViewCount = ( SELECT MAX(ViewCount) FROM posts ) )	codebase_community
SELECT T3.DisplayName, T3.Location FROM tags AS T1 INNER JOIN posts AS T2 ON T1.ExcerptPostId = T2.Id INNER JOIN users AS T3 ON T3.Id = T2.OwnerUserId WHERE T1.TagName = 'hypothesis-testing'	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE Id IN (SELECT ParentId FROM posts WHERE Score = (SELECT MAX(Score) FROM posts WHERE ParentId IS NOT NULL)))	codebase_community
SELECT DisplayName, WebsiteUrl FROM users WHERE Id IN (SELECT UserId FROM votes WHERE VoteTypeId = 8 AND BountyAmount = (SELECT MAX(BountyAmount) FROM votes WHERE VoteTypeId = 8))	codebase_community
WITH top AS ( SELECT ViewCount FROM posts ORDER BY ViewCount DESC LIMIT 5 ) SELECT Title FROM posts WHERE ViewCount IN top	codebase_community
SELECT COUNT(Id) FROM tags WHERE Count BETWEEN 5000 AND 7000	codebase_community
SELECT OwnerUserId FROM posts WHERE FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts )	codebase_community
SELECT Age FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T2.BountyAmount = 50 AND STRFTIME('%Y', T2.CreationDate) = '2011'	codebase_community
SELECT Id FROM users WHERE Age = ( SELECT MIN(Age) FROM users )	codebase_community
SELECT SUM(Score) FROM posts WHERE LasActivityDate LIKE '2010-07-19%'	codebase_community
SELECT CAST(COUNT(T1.Id) AS REAL) / 12 FROM postLinks AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.AnswerCount <= 2 AND STRFTIME('%Y', T1.CreationDate) = '2010'	codebase_community
WITH T AS ( SELECT Id, FavoriteCount FROM posts WHERE Id IN ( SELECT PostId FROM votes WHERE UserId = 1465 ) ) SELECT Id FROM T WHERE FavoriteCount = (SELECT MAX(FavoriteCount) FROM T)	codebase_community
SELECT Title FROM posts WHERE Id IN (SELECT PostId FROM postLinks WHERE CreationDate = (SELECT MIN(CreationDate) FROM postLinks))	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(*) = (SELECT MAX(BadgeCount) FROM (SELECT COUNT(*) AS BadgeCount FROM badges GROUP BY UserId) as SubQuery))	codebase_community
SELECT MIN(v.CreationDate) FROM votes v JOIN users u ON v.UserId = u.Id WHERE u.DisplayName = 'chl' GROUP BY u.Id	codebase_community
SELECT MIN(CreaionDate) FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE Age = (SELECT MIN(Age) FROM users) )	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT UserId FROM badges WHERE Name = 'Autobiographer' AND Date = (SELECT MIN(Date) FROM badges WHERE Name = 'Autobiographer'))	codebase_community
SELECT COUNT(DISTINCT T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.Location = 'United Kingdom' AND T2.FavoriteCount >= 4	codebase_community
SELECT AVG(post_count) FROM ( SELECT COUNT(DISTINCT T2.PostId) AS post_count FROM users T1 LEFT JOIN votes T2 ON T1.Id = T2.UserId WHERE T1.Age = ( SELECT MAX(Age) FROM users ) GROUP BY T2.UserId )	codebase_community
SELECT DisplayName FROM users WHERE Reputation = ( SELECT MAX(Reputation) FROM users )	codebase_community
SELECT COUNT(id) FROM users WHERE Reputation > 2000 AND Views > 1000	codebase_community
SELECT DisplayName FROM users WHERE Age BETWEEN 19 AND 65	codebase_community
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE STRFTIME('%Y', T2.CreaionDate) = '2010' AND T1.DisplayName = 'Jay Stevens'	codebase_community
SELECT P.Id, P.Title FROM posts P WHERE P.OwnerUserId IN ( SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky' ) AND P.ViewCount = ( SELECT MAX(ViewCount) FROM posts WHERE OwnerUserId IN ( SELECT Id FROM users WHERE DisplayName = 'Harvey Motulsky' ) )	codebase_community
SELECT Id, Title FROM posts WHERE Score = (SELECT MAX(Score) FROM posts)	codebase_community
SELECT AVG(T2.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T1.DisplayName = 'Stephen Turner'	codebase_community
SELECT DisplayName FROM users WHERE Id IN (SELECT OwnerUserId FROM posts WHERE ViewCount > 20000 AND strftime('%Y', CreaionDate) = '2011')	codebase_community
SELECT P.Id, U.DisplayName FROM posts P JOIN users U ON P.OwnerUserId = U.Id WHERE P.FavoriteCount = ( SELECT MAX(FavoriteCount) FROM posts WHERE strftime('%Y', CreaionDate) = '2010' ) AND strftime('%Y', P.CreaionDate) = '2010'	codebase_community
SELECT CAST( SUM( IIF( STRFTIME('%Y', T2.CreaionDate) = '2011' AND T1.Reputation > 1000, 1, 0 ) ) AS REAL ) * 100 / COUNT(T2.Id) FROM posts AS T2 LEFT JOIN users AS T1 ON T1.Id = T2.OwnerUserId	codebase_community
SELECT CAST(SUM(IIF(Age BETWEEN 13 AND 18, 1, 0)) AS REAL) * 100 / COUNT(Id) FROM users	codebase_community
SELECT COUNT(*) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts WHERE ViewCount IS NOT NULL);	codebase_community
SELECT COUNT(*) FROM comments WHERE PostId IN (SELECT Id FROM posts p WHERE p.Score = (SELECT MAX(Score) FROM posts p))	codebase_community
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0	codebase_community
WITH T AS ( SELECT T1.Name, T1.Date FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Emmett' ) SELECT Name FROM T WHERE Date = (SELECT MAX(Date) FROM T)	codebase_community
SELECT COUNT(Id) FROM users WHERE Age BETWEEN 19 AND 65 AND UpVotes > 5000	codebase_community
SELECT T1.Date - T2.CreationDate FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T2.DisplayName = 'Zolomon'	codebase_community
SELECT COUNT(DISTINCT P.Id) AS NumberOfPosts, COUNT(DISTINCT C.Id) AS NumberOfComments FROM users U JOIN posts P ON U.Id = P.OwnerUserId JOIN comments C ON U.Id = C.UserId WHERE U.CreationDate = (SELECT MAX(CreationDate) FROM users)	codebase_community
SELECT COUNT(DISTINCT UserId) FROM badges WHERE Name = 'Citizen Patrol'	codebase_community
SELECT COUNT(DISTINCT ExcerptPostId) FROM tags WHERE TagName = 'careers'	codebase_community
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'	codebase_community
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data'	codebase_community
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'	codebase_community
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30	codebase_community
SELECT COUNT(id) FROM posts WHERE Score < 20	codebase_community
SELECT COUNT(id) FROM tags WHERE Count <= 20 AND Id < 15	codebase_community
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'	codebase_community
SELECT Reputation, UpVotes FROM users WHERE Id IN (SELECT UserId FROM comments WHERE Text = 'fine, you win :)')	codebase_community
SELECT T1.Text FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.Title LIKE '%linear regression%'	codebase_community
WITH scores AS ( SELECT Text, Score FROM comments WHERE PostId IN ( SELECT Id FROM posts WHERE ViewCount >= 100 AND ViewCount <= 150 ) ) SELECT Text FROM scores WHERE Score = (SELECT MAX(Score) FROM scores)	codebase_community
SELECT U.CreationDate, U.Age FROM users U WHERE U.Id IN (SELECT UserId FROM comments WHERE Text LIKE '%http://%')	codebase_community
SELECT COUNT(DISTINCT T2.Id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.ViewCount < 5 AND T1.Score = 0	codebase_community
SELECT COUNT(T1.id) FROM comments AS T1 INNER JOIN posts AS T2 ON T1.PostId = T2.Id WHERE T2.CommentCount = 1 AND T2.Score = 0	codebase_community
SELECT COUNT(DISTINCT T1.hero_id) FROM hero_power AS T1 JOIN superpower AS T2 ON T1.power_id = T2.id WHERE T2.power_name = 'Super Strength';	superhero
SELECT COUNT(DISTINCT T1.id) FROM superhero AS T1 INNER JOIN hero_power AS T2 ON T1.id = T2.hero_id INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.height_cm > 200	superhero
SELECT s.full_name FROM superhero s JOIN (SELECT hero_id FROM hero_power GROUP BY hero_id HAVING COUNT(hero_id) > 15) hp ON s.id = hp.hero_id;	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id WHERE T2.colour = 'Blue'	superhero
SELECT T2.colour FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.skin_colour_id = T2.id WHERE T1.superhero_name = 'Apocalypse'	superhero
SELECT COUNT(DISTINCT T1.id) FROM superhero AS T1 JOIN colour AS T2 ON T1.eye_colour_id = T2.id JOIN hero_power AS T3 ON T1.id = T3.hero_id JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T2.colour = 'Blue' AND T4.power_name = 'Agility';	superhero
SELECT T1.superhero_name FROM superhero AS T1 INNER JOIN colour AS T2 ON T1.eye_colour_id = T2.id INNER JOIN colour AS T3 ON T1.hair_colour_id = T3.id WHERE T2.colour = 'Blue' AND T3.colour = 'Blond'	superhero
SELECT COUNT(T1.id) FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T2.publisher_name = 'Marvel Comics'	superhero
SELECT superhero_name FROM superhero JOIN publisher ON superhero.publisher_id = publisher.id WHERE publisher_name = 'Marvel Comics' ORDER BY height_cm DESC;	superhero
SELECT T2.publisher_name FROM superhero AS T1 INNER JOIN publisher AS T2 ON T1.publisher_id = T2.id WHERE T1.superhero_name = 'Sauron'	superhero
SELECT superhero_name FROM superhero AS T1 WHERE EXISTS (SELECT 1 FROM hero_power AS T2 INNER JOIN superpower AS T3 ON T2.power_id = T3.id WHERE T3.power_name = 'Super Strength' AND T1.id = T2.hero_id)AND EXISTS (SELECT 1 FROM publisher AS T4 WHERE T4.publisher_name = 'Marvel Comics' AND T1.publisher_id = T4.id)	superhero
SELECT T2.nationality FROM constructorResults AS T1 INNER JOIN constructors AS T2 ON T2.constructorId = T1.constructorId WHERE T1.raceId = 24 AND T1.points = 1	formula_1
SELECT T1.q1 FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE T1.raceId = 354 AND T2.forename = 'Bruno' AND T2.surname = 'Senna'	formula_1
SELECT T2.nationality FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE T1.raceId = 355 AND T1.q2 LIKE '1:40%'	formula_1
SELECT T2.number FROM qualifying AS T1 INNER JOIN drivers AS T2 ON T2.driverId = T1.driverId WHERE T1.raceId = 903 AND T1.q3 LIKE '1:54%'	formula_1
SELECT COUNT(T3.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId INNER JOIN drivers AS T3 ON T3.driverId = T2.driverId WHERE T1.year = 2007 AND T1.name = 'Bahrain Grand Prix' AND T2.time IS NULL	formula_1
SELECT T2.url FROM races AS T1 INNER JOIN seasons AS T2 ON T2.year = T1.year WHERE T1.raceId = 901	formula_1
SELECT COUNT(T2.driverId) FROM races AS T1 INNER JOIN results AS T2 ON T2.raceId = T1.raceId WHERE T1.date = '2015-11-29' AND T2.time IS NOT NULL	formula_1
SELECT forename, surname FROM (SELECT T1.forename, T1.surname, rank() over (ORDER BY T1.dob ASC) as rk FROM drivers AS T1 INNER JOIN results AS T2 ON T2.driverId = T1.driverId WHERE T2.raceId = 592 AND T2.time IS NOT NULL AND T1.dob IS NOT NULL ORDER BY T1.dob ASC) WHERE rk = 1	formula_1
SELECT forename, surname, url FROM drivers WHERE driverId IN (SELECT driverId FROM lapTimes AS T1 WHERE raceId = 161 AND time LIKE '1:27%')	formula_1
SELECT T1.nationality FROM drivers AS T1 WHERE driverId IN (SELECT T2.driverId FROM results AS T2 WHERE T2.raceId = 933 AND T2.fastestLapSpeed = (SELECT max(T3.fastestLapSpeed) FROM results AS T3 WHERE T3.raceId = 933));	formula_1
SELECT T2.lat, T2.lng FROM races T1 JOIN circuits T2 ON T1.circuitId = T2.circuitId WHERE T1.name = 'Malaysian Grand Prix';	formula_1
SELECT code FROM drivers WHERE Nationality = 'American'	formula_1
SELECT driverId FROM lapTimes WHERE time in (SELECT min(time) AS t FROM lapTimes WHERE lap = 1 group by driverId ORDER BY t limit 5) GROUP BY driverId ORDER BY min(time)	formula_1
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring';	formula_1
SELECT nationality FROM drivers GROUP BY nationality HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM drivers GROUP BY nationality) T2);	formula_1
SELECT name FROM races WHERE raceId IN (SELECT raceId FROM results WHERE fastestLapTime = (SELECT MIN(fastestLapTime) FROM results));	formula_1
SELECT lat, lng FROM circuits WHERE circuitId IN (SELECT circuitId FROM races WHERE raceId IN (SELECT raceId FROM lapTimes WHERE time = '1:29.488'));	formula_1
SELECT distinct player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT max(overall_rating) FROM Player_Attributes);	european_football_2
SELECT player_name FROM Player WHERE height = (SELECT max(height) FROM Player)	european_football_2
SELECT preferred_foot FROM (SELECT DISTINCT player_api_id, preferred_foot FROM Player_Attributes WHERE potential = (SELECT min(potential) FROM Player_Attributes))	european_football_2
SELECT COUNT(distinct player_api_id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'	european_football_2
SELECT T3.id FROM (SELECT T1.player_api_id, rank() over (ORDER BY max(T1.crossing) DESC ) as rk FROM Player_Attributes T1 GROUP BY T1.player_api_id) AS T2 join Player AS T3 ON T2.player_api_id = T3.player_api_id WHERE rk <= 5	european_football_2
SELECT name FROM League WHERE id IN (SELECT league_id FROM Match WHERE season = '2015/2016' GROUP BY league_id HAVING SUM(home_team_goal + away_team_goal) = (SELECT MAX(total_goals) FROM (SELECT SUM(home_team_goal + away_team_goal) AS total_goals FROM Match WHERE season = '2015/2016' GROUP BY league_id)));	european_football_2
SELECT team_long_name FROM (SELECT teamDetails.team_long_name, rank() over (ORDER BY COUNT(*) ASC) as rk FROM Match AS matchData INNER JOIN Team AS teamDetails ON matchData.home_team_api_id = teamDetails.team_api_id WHERE matchData.season = '2015/2016' AND matchData.home_team_goal - matchData.away_team_goal < 0 GROUP BY matchData.home_team_api_id) WHERE rk = 1;	european_football_2
SELECT T2.player_name FROM (SELECT player_api_id, rank() over (ORDER BY max(penalties) DESC ) as rk FROM Player_Attributes GROUP BY player_api_id) AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE rk <= 10	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE attacking_work_rate = 'high');	european_football_2
SELECT player_name FROM Player WHERE player_name IN (SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name LIMIT 3) and height > 180 ORDER BY player_name	european_football_2
SELECT DISTINCT t1.buildUpPlaySpeedClass FROM Team_Attributes AS t1 INNER JOIN Team AS t2 ON t1.team_api_id = t2.team_api_id WHERE t2.team_long_name = 'KSV Cercle Brugge'	european_football_2
SELECT T2.finishing, T2.curve FROM Player T1 JOIN Player_Attributes T2 ON T1.player_api_id = T2.player_api_id WHERE T1.weight = (SELECT MAX(weight) FROM Player)	european_football_2
SELECT player_name FROM Player WHERE player_api_id IN (SELECT player_api_id FROM Player_Attributes WHERE overall_rating = (SELECT MAX(overall_rating) FROM Player_Attributes));	european_football_2
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE SEX = 'M'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', Birthday) > '1930' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE SEX = 'F'	thrombosis_prediction
SELECT CAST(SUM(CASE WHEN Admission = '+' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*) FROM Patient WHERE STRFTIME('%Y', Birthday) BETWEEN '1930' AND '1940'	thrombosis_prediction
SELECT SUM(CASE WHEN Admission = '+' THEN 1.0 ELSE 0 END) / SUM(CASE WHEN Admission = '-' THEN 1 ELSE 0 END) FROM Patient WHERE Diagnosis = 'SLE'	thrombosis_prediction
SELECT T1.Diagnosis, T2.Date FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.ID = 30609	thrombosis_prediction
SELECT T1.SEX, T1.Birthday, T2.`Examination Date`, T2.Symptoms FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.ID = 163109	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX, T1.Birthday FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.LDH > 500	thrombosis_prediction
SELECT DISTINCT T1.ID, STRFTIME('%Y', CURRENT_TIMESTAMP) - STRFTIME('%Y', T1.Birthday) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.RVVT = '+'	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.Thrombosis = 2	thrombosis_prediction
SELECT DISTINCT T1.ID FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE STRFTIME('%Y', T1.Birthday) = '1937' AND T2.`T-CHO` >= 250	thrombosis_prediction
SELECT DISTINCT T1.ID, T1.SEX, T1.Diagnosis FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T2.ALB < 3.5	thrombosis_prediction
SELECT CASE WHEN `T-CHO` < 250 THEN 'Normal' ELSE 'Abnormal' END FROM Laboratory WHERE ID = 2927464 AND Date = '1995-09-04'	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'P' AND STRFTIME('%Y', T1.Birthday) BETWEEN '1980' AND '1989' AND T1.SEX = 'F'	thrombosis_prediction
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory T1 JOIN Examination T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Patient T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory T1 JOIN Examination T2 ON T1.ID = T2.ID WHERE T1.PLT > 100 AND T1.PLT < 400 AND T2.Symptoms IS NOT NULL;	thrombosis_prediction
SELECT COUNT(DISTINCT T1.ID) FROM Examination T1 JOIN Laboratory T2 ON T1.ID = T2.ID WHERE T1.Thrombosis IN (1, 2) AND T2.PT < 14;	thrombosis_prediction
SELECT T2.major_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.first_name = 'Angela' AND T1.last_name = 'Sanders'	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.college = 'College of Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.department = 'Art and Design Department'	student_club
SELECT COUNT(DISTINCT T2.link_to_member) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer';	student_club
SELECT phone FROM member WHERE member_id IN (SELECT T2.link_to_member FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'Women''s Soccer')	student_club
SELECT COUNT(DISTINCT T3.member_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T1.event_name = 'Women''s Soccer' AND T3.t_shirt_size = 'Medium';	student_club
SELECT link_to_event FROM (SELECT link_to_event, rank() over (ORDER BY COUNT(link_to_member) DESC ) AS rk FROM attendance GROUP BY link_to_event) WHERE rk = 1	student_club
SELECT T2.college FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T1.position LIKE 'vice president'	student_club
SELECT T3.event_name FROM event T3 WHERE EXISTS (SELECT 1 FROM attendance T2 JOIN member T1 ON T2.link_to_member = T1.member_id WHERE T1.first_name = 'Maya' AND T1.last_name = 'Mclean' AND T2.link_to_event = T3.event_id);	student_club
SELECT COUNT(T1.event_id) FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event INNER JOIN member AS T3 ON T2.link_to_member = T3.member_id WHERE T3.first_name = 'Sacha' AND T3.last_name = 'Harrison' AND SUBSTR(T1.event_date, 1, 4) = '2019'	student_club
SELECT COUNT(*) FROM (SELECT T1.event_id FROM event T1 JOIN attendance T2 ON T1.event_id = T2.link_to_event GROUP BY T1.event_id HAVING COUNT(T2.link_to_member) > 10 AND T1.type = 'Meeting');	student_club
SELECT T1.event_name FROM event AS T1 INNER JOIN attendance AS T2 ON T1.event_id = T2.link_to_event WHERE T1.type != 'Fundraiser' GROUP BY T1.event_id HAVING COUNT(T2.link_to_event) > 20;	student_club
SELECT AVG(total_attendance) FROM (SELECT COUNT(T1.link_to_event) AS total_attendance FROM event T2 LEFT JOIN attendance T1 ON T2.event_id = T1.link_to_event WHERE T2.type = 'Meeting' AND strftime('%Y', T2.event_date) = '2020' GROUP BY T2.event_id)	student_club
SELECT expense_description FROM expense WHERE cost = (SELECT max(cost) FROM expense);	student_club
SELECT COUNT(T1.member_id) FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Environmental Engineering'	student_club
SELECT T1.first_name, T1.last_name FROM member AS T1 WHERE T1.member_id IN (SELECT T2.link_to_member FROM attendance AS T2 INNER JOIN event AS T3 ON T2.link_to_event = T3.event_id WHERE T3.event_name = 'Laugh Out Loud');	student_club
SELECT T1.last_name FROM member AS T1 INNER JOIN major AS T2 ON T1.link_to_major = T2.major_id WHERE T2.major_name = 'Law and Constitutional Studies'	student_club
SELECT T2.county FROM member AS T1 INNER JOIN zip_code AS T2 ON T1.zip = T2.zip_code WHERE T1.first_name = 'Sherri' AND T1.last_name = 'Ramsey'	student_club
SELECT T1.college FROM major AS T1 WHERE T1.major_id IN (SELECT T2.link_to_major FROM member AS T2 WHERE T2.first_name = 'Tyler' AND T2.last_name = 'Hewitt')	student_club
SELECT SUM(T2.amount) FROM member T1 JOIN income T2 ON T1.member_id = T2.link_to_member WHERE T1.position = 'Vice President';	student_club
SELECT SUM(CASE WHEN T1.type = 'Meeting' THEN T3.cost ELSE 0 END) * 100 / SUM(T3.cost) FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget	student_club
WITH Total AS ( SELECT link_to_member, SUM(cost) AS total_spending FROM expense WHERE cost IS NOT NULL GROUP BY link_to_member ) SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN ( SELECT * FROM Total WHERE total_spending IN ( SELECT total_spending FROM Total ORDER BY total_spending DESC LIMIT 5 ) ) AS T2 ON T1.member_id = T2.link_to_member ORDER BY T2.total_spending DESC	student_club
SELECT first_name, last_name, phone FROM member WHERE member_id IN (SELECT DISTINCT link_to_member FROM expense group by link_to_member HAVING MIN(cost) > (SELECT AVG(cost) FROM expense))	student_club
SELECT CAST( ( SUM( CASE WHEN T2.state = 'New Jersey' THEN 1 ELSE 0 END ) - SUM( CASE WHEN T2.state = 'Vermont' THEN 1 ELSE 0 END ) ) AS REAL ) * 100 / COUNT(T1.member_id) AS diff FROM (SELECT * FROM member WHERE position = 'Member') AS T1 INNER JOIN zip_code AS T2 ON T2.zip_code = T1.zip	student_club
SELECT T2.first_name, T2.last_name, T1.cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Water, Veggie tray, supplies'	student_club
SELECT category, SUM(amount) FROM budget WHERE link_to_event IN ( SELECT event_id FROM event WHERE event_name = 'January Speaker' ) GROUP BY category	student_club
SELECT event_name FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE category = 'Food');	student_club
SELECT T1.first_name, T1.last_name, T2.amount FROM member T1 JOIN income T2 ON T1.member_id = T2.link_to_member WHERE T2.date_received = '2019-09-09';	student_club
SELECT category FROM budget WHERE budget_id IN (SELECT link_to_budget FROM expense WHERE expense_description = 'Posters');	student_club
WITH Total AS (SELECT T2.CustomerID, SUM(T2.Consumption) AS TotalConsumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' GROUP BY T2.CustomerID) SELECT CustomerID, TotalConsumption FROM Total WHERE TotalConsumption = (SELECT MAX(TotalConsumption) FROM Total)	debit_card_specializing
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y', T1.Date) = '2013' AND strftime('%m', T1.Date) = '06'	debit_card_specializing
SELECT AVG(T1.Price) FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE T2.Country = 'CZE'	debit_card_specializing
SELECT AVG(T2.Amount * T2.Price) AS AverageTotalPrice FROM customers T1 JOIN transactions_1k T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Currency = 'EUR'	debit_card_specializing
WITH Total AS (SELECT CustomerID, SUM(Consumption) AS TotalConsumption FROM yearmonth GROUP BY CustomerID) SELECT T2.CustomerID, SUM(T2.Price * T2.Amount) / SUM(T2.Amount), T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.CustomerID IN (SELECT CustomerID FROM Total WHERE TotalConsumption = (SELECT MAX(TotalConsumption) FROM Total)) GROUP BY T2.CustomerID, T1.Currency	debit_card_specializing