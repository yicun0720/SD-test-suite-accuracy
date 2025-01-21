SELECT MAX(CAST(`Free Meal Count (K-12)` AS REAL) / `Enrollment (K-12)`) FROM frpm WHERE `County Name` = 'Alameda'
SELECT T2.`Free Meal Count (Ages 5-17)` / T2.`Enrollment (Ages 5-17)` AS EligibleFreeRate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.EdOpsName = 'Continuation School' AND T2.`Enrollment (Ages 5-17)` > 0 AND T2.`Free Meal Count (Ages 5-17)` IS NOT NULL AND T2.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY EligibleFreeRate ASC LIMIT 3
SELECT T2.Zip FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`District Name` = 'Fresno County Office of Education' AND T1.`Charter School (Y/N)` = 1
SELECT T2.MailStreet FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode ORDER BY T1.`FRPM Count (K-12)` DESC LIMIT 1
SELECT T1.Phone FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.OpenDate > '2000-01-01' AND T1.FundingType = 'Directly funded' AND T1.Charter = 1 AND T2.`Charter School (Y/N)` = 1
SELECT T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 500 AND T2.Magnet = 1
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT COUNT(T1.cds) FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath > 560 AND T2.FundingType = 'Charter'
SELECT T2.`FRPM Count (Ages 5-17)` FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores WHERE AvgScrRead IS NOT NULL)
SELECT CDSCode FROM frpm WHERE `Enrollment (K-12)` + `Enrollment (Ages 5-17)` > 500
SELECT MAX(CAST(T2.`Free Meal Count (Ages 5-17)` AS REAL) / T2.`Enrollment (Ages 5-17)`) AS HighestEligibleFreeRate FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 * 100 / T1.NumTstTakr > 30 AND T2.`Enrollment (Ages 5-17)` IS NOT NULL AND T2.`Free Meal Count (Ages 5-17)` IS NOT NULL
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr DESC LIMIT 3
SELECT T2.NCESSchool FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (Ages 5-17)` IS NOT NULL ORDER BY T1.`Enrollment (Ages 5-17)` DESC LIMIT 5
SELECT T2.District FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T2.StatusType = 'Active' ORDER BY T1.AvgScrRead DESC LIMIT 1
SELECT COUNT(T1.CDSCode) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Contra Costa' AND T1.FundingType = 'Directly funded' AND T2.NumTstTakr <= 250
SELECT T2.Phone FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT COUNT(CDSCode) FROM frpm WHERE `County Name` = 'Amador' AND `Low Grade` = '9' AND `High Grade` = '12'
SELECT T2.sname FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.cname = 'Contra Costa' ORDER BY T2.NumTstTakr DESC LIMIT 1
SELECT T1.`School Name`, T2.Street FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > 30
SELECT T3.School FROM satscores AS T1 INNER JOIN frpm AS T2 ON T1.cds = T2.CDSCode INNER JOIN schools AS T3 ON T1.cds = T3.CDSCode WHERE T2.`Percent (%) Eligible Free (K-12)` > 0.1 AND T1.NumGE1500 > 0
SELECT T1.School, T2.AvgScrWrite, T1.Phone FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE STRFTIME('%Y', T1.OpenDate) > '1991' OR STRFTIME('%Y', T1.ClosedDate) < '2000'
SELECT T2.School, T2.DOCType FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded' AND T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)` > ( SELECT AVG(T1.`Enrollment (K-12)` - T1.`Enrollment (Ages 5-17)`) FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.FundingType = 'Locally funded' )
SELECT T1.OpenDate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.GSserved = 'K-12' ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 1
SELECT T2.City FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` ASC LIMIT 5
SELECT T2.`Free Meal Count (K-12)` / T2.`Enrollment (K-12)` AS Eligible_Free_Rate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Enrollment (K-12)` IS NOT NULL ORDER BY T2.`Enrollment (K-12)` DESC LIMIT 10, 2
SELECT T2.`FRPM Count (K-12)` / T2.`Enrollment (K-12)` AS Eligible_FRPM_Rate FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T1.SOC = 66 AND T2.`Enrollment (K-12)` IS NOT NULL ORDER BY T2.`FRPM Count (K-12)` DESC LIMIT 5
SELECT T1.Website, T1.School FROM schools AS T1 INNER JOIN frpm AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.`Free Meal Count (Ages 5-17)` BETWEEN 1900 AND 2000
SELECT T2.AdmFName1, T2.AdmLName1, T2.AdmFName2, T2.AdmLName2, T2.AdmFName3, T2.AdmLName3 FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumGE1500 IS NOT NULL ORDER BY T1.NumGE1500 DESC LIMIT 1
SELECT T2.Street, T2.City, T2.Zip, T2.State FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.NumTstTakr > 0 AND T1.NumGE1500 IS NOT NULL ORDER BY CAST(T1.NumGE1500 AS REAL) / T1.NumTstTakr ASC LIMIT 1
SELECT AVG(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.County = 'Fresno' AND STRFTIME('%Y', T1.OpenDate) = '1980'
SELECT T1.CDSCode FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.Virtual = 'F' AND T2.AvgScrRead IS NOT NULL ORDER BY T2.AvgScrRead DESC LIMIT 5
SELECT T2.EdOpsName FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 1
SELECT T2.AvgScrMath, T1.County FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.AvgScrMath IS NOT NULL AND T2.AvgScrRead IS NOT NULL AND T2.AvgScrWrite IS NOT NULL ORDER BY T2.AvgScrMath + T2.AvgScrRead + T2.AvgScrWrite ASC LIMIT 1
SELECT T2.AvgScrWrite, T1.City FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T2.NumGE1500 = ( SELECT MAX(NumGE1500) FROM satscores WHERE NumGE1500 IS NOT NULL )
SELECT T2.School FROM frpm AS T1 INNER JOIN schools AS T2 ON T1.CDSCode = T2.CDSCode WHERE T2.DOC = '31' AND T1.`Enrollment (K-12)` IS NOT NULL ORDER BY T1.`Enrollment (K-12)` DESC LIMIT 1
SELECT CAST(COUNT(CDSCode) AS REAL) / 12 FROM schools WHERE County = 'Alameda' AND DOC = 52 AND strftime('%Y', OpenDate) = '1980'
SELECT CAST(SUM(CASE WHEN DOC = 54 THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN DOC = 52 THEN 1 ELSE 0 END) FROM schools WHERE County = 'Orange' AND StatusType = 'Merged'
SELECT T1.County, T1.School, T1.ClosedDate FROM schools T1 WHERE T1.StatusType = 'Closed' AND T1.County = (SELECT T2.County FROM schools T2 WHERE T2.StatusType = 'Closed' GROUP BY T2.County ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T2.Street, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrMath IS NOT NULL ORDER BY T1.AvgScrMath DESC LIMIT 5, 1
SELECT T2.MailStreet, T2.School FROM satscores AS T1 INNER JOIN schools AS T2 ON T1.cds = T2.CDSCode WHERE T1.AvgScrRead IS NOT NULL ORDER BY T1.AvgScrRead ASC LIMIT 1
SELECT SUM(T2.NumTstTakr) FROM schools AS T1 INNER JOIN satscores AS T2 ON T1.CDSCode = T2.cds WHERE T1.MailCity = 'Fresno'
SELECT CAST(SUM(CASE WHEN County = 'Colusa' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN County = 'Humboldt' THEN 1 ELSE 0 END) FROM schools WHERE MailState = 'CA'
SELECT Phone, Ext, School FROM schools WHERE Zip = '95203-3704'
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.date LIKE '1997%' AND T1.frequency = 'POPLATEK TYDNE' ORDER BY T2.amount ASC LIMIT 1
SELECT T1.account_id FROM account AS T1 INNER JOIN loan AS T2 ON T1.account_id = T2.account_id WHERE T2.duration > 12 AND STRFTIME('%Y', T1.date) = '1993' ORDER BY T2.amount DESC LIMIT 1
SELECT account_id FROM trans WHERE STRFTIME('%Y', date) = '1995' ORDER BY date LIMIT 1
SELECT DISTINCT T1.account_id FROM account AS T1 INNER JOIN trans AS T2 ON T1.account_id = T2.account_id WHERE T1.date < '1997-01-01' AND T2.balance > 3000
SELECT bond_type FROM bond GROUP BY bond_type ORDER BY COUNT(bond_type) DESC LIMIT 1
SELECT DISTINCT molecule_id FROM atom WHERE element = 'si'
SELECT T2.element FROM connected AS T1 INNER JOIN atom AS T2 ON T1.atom_id = T2.atom_id WHERE T1.bond_id = 'TR004_8_9'
SELECT DISTINCT T3.element FROM connected AS T1 INNER JOIN bond AS T2 ON T1.bond_id = T2.bond_id INNER JOIN atom AS T3 ON T1.atom_id = T3.atom_id WHERE T2.bond_type = '='
SELECT DISTINCT T2.label FROM molecule AS T2 WHERE T2.molecule_id NOT IN (SELECT T1.molecule_id FROM atom AS T1 WHERE T1.element = 'Sn')
SELECT COUNT(T1.atom_id) FROM atom AS T1 INNER JOIN connected AS T2 ON T1.atom_id = T2.atom_id INNER JOIN bond AS T3 ON T2.bond_id = T3.bond_id WHERE T3.bond_type = '-' AND T1.element IN ('i', 's')
SELECT name FROM cards WHERE frameVersion = '2015' AND edhrecRank < 100
SELECT T2.name FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Japanese'
SELECT COUNT(DISTINCT types) FROM cards WHERE artist = 'Aaron Boyd'
SELECT T2.language FROM cards AS T1 INNER JOIN set_translations AS T2 ON T1.setCode = T2.setCode WHERE T1.name = 'Angel of Mercy'
SELECT T2.artist FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'Phyrexian'
SELECT COUNT(T1.uuid) FROM foreign_data AS T1 INNER JOIN cards AS T2 ON T1.uuid = T2.uuid WHERE T1.language = 'German' AND T2.isReprint = 1
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
SELECT ViewCount FROM posts WHERE Title = 'Integration of Weka and/or RapidMiner into Informatica PowerCenter/Developer'
SELECT Text FROM comments WHERE Score = 17
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'SilentGhost'
SELECT T2.DisplayName FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'thank you user93!'
SELECT T2.Text FROM users AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'A Lion'
SELECT T1.DisplayName, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Title = 'Understanding what Dassault iSight is doing?'
SELECT T2.DisplayName FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'Necromancer' LIMIT 10
SELECT SUM(T2.Score), T1.WebsiteUrl FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.LastEditorUserId WHERE T1.DisplayName = 'Yevgeny'
SELECT SUM(T2.BountyAmount) FROM posts AS T1 INNER JOIN votes AS T2 ON T1.Id = T2.PostId WHERE T1.Title LIKE '%data%'
SELECT COUNT(Id) FROM comments WHERE UserId = 13
SELECT Id FROM users ORDER BY Reputation DESC LIMIT 1
SELECT Id FROM users ORDER BY Views ASC LIMIT 1
SELECT COUNT(UserId) FROM badges WHERE STRFTIME('%Y', Date) = '2011' AND Name = 'Supporter'
SELECT COUNT(UserId) FROM ( SELECT UserId FROM badges GROUP BY UserId HAVING COUNT(Name) > 5 ) T
SELECT T2.OwnerUserId, T1.Reputation FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId WHERE T2.Id = 1
SELECT T2.Name FROM comments AS T1 INNER JOIN badges AS T2 ON T1.UserId = T2.UserId INNER JOIN users AS T3 ON T1.UserId = T3.Id GROUP BY T1.UserId ORDER BY COUNT(T1.Id) DESC LIMIT 1
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.Location = 'India' AND T2.Name = 'Teacher'
SELECT T1.PostHistoryTypeId, COUNT(DISTINCT T2.UserId) FROM postHistory AS T1 INNER JOIN comments AS T2 ON T1.PostId = T2.PostId WHERE T1.PostId = 3720 GROUP BY T1.PostHistoryTypeId
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
SELECT CAST(SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2010' THEN 1 ELSE 0 END) AS REAL) / SUM(CASE WHEN STRFTIME('%Y', CreationDate) = '2011' THEN 1 ELSE 0 END) FROM votes
SELECT COUNT(T1.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN votes AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Matt Parker' GROUP BY T2.Id HAVING COUNT(T3.UserId) > 4
SELECT COUNT(T3.Score) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T2.Id = T3.PostId WHERE T1.DisplayName = 'Neil McGuigan' AND T3.Score < 60
SELECT T1.DisplayName FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T2.Name = 'Organizer'
SELECT COUNT(UserId) FROM badges WHERE STRFTIME('%Y', Date) = '2014' AND Name = 'Commentator'
SELECT DisplayName, Age FROM users ORDER BY Views DESC LIMIT 1
SELECT LastEditDate, LastEditorUserId FROM posts WHERE Title = 'Detecting a given face in a database of facial images'
SELECT COUNT(Id) FROM comments WHERE UserId = 13 AND Score < 60
SELECT DISTINCT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE STRFTIME('%Y', T2.Date) = '2011' AND T1.Location = 'North Pole'
SELECT T2.LastAccessDate, T2.Location FROM badges AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Name = 'outliers'
SELECT T2.DisplayName FROM posts AS T1 INNER JOIN users AS T2 ON T1.OwnerUserId = T2.Id ORDER BY T1.ViewCount DESC LIMIT 1
SELECT T2.DisplayName, T2.Location FROM tags AS T1 INNER JOIN posts AS T3 ON T1.ExcerptPostId = T3.Id INNER JOIN users AS T2 ON T3.OwnerUserId = T2.Id WHERE T1.TagName = 'hypothesis-testing'
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
SELECT COUNT(Id) FROM posts WHERE ViewCount > (SELECT AVG(ViewCount) FROM posts)
SELECT COUNT(T2.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Score = (SELECT MAX(Score) FROM posts)
SELECT COUNT(Id) FROM posts WHERE ViewCount > 35000 AND CommentCount = 0
SELECT T2.Name FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Emmett' ORDER BY T2.Date DESC LIMIT 1
SELECT COUNT(Id) FROM users WHERE UpVotes > 5000 AND Age BETWEEN 19 AND 65
SELECT strftime('%J', T2.Date) - strftime('%J', T1.CreationDate) AS Days FROM users AS T1 INNER JOIN badges AS T2 ON T1.Id = T2.UserId WHERE T1.DisplayName = 'Zolomon'
SELECT COUNT(T2.Id), COUNT(T3.Id) FROM users AS T1 INNER JOIN posts AS T2 ON T1.Id = T2.OwnerUserId INNER JOIN comments AS T3 ON T1.Id = T3.UserId WHERE T1.CreationDate = (SELECT MAX(CreationDate) FROM users)
SELECT COUNT(UserId) FROM badges WHERE Name = 'Citizen Patrol'
SELECT T1.Count FROM tags AS T1 WHERE T1.TagName = 'careers'
SELECT Reputation, Views FROM users WHERE DisplayName = 'Jarrod Dixon'
SELECT CommentCount, AnswerCount FROM posts WHERE Title = 'Clustering 1D data'
SELECT CreationDate FROM users WHERE DisplayName = 'IrishStat'
SELECT COUNT(DISTINCT PostId) FROM votes WHERE BountyAmount >= 30
SELECT COUNT(Id) FROM posts WHERE Score < 20
SELECT COUNT(Id) FROM tags WHERE Id < 15 AND Count <= 20
SELECT ExcerptPostId, WikiPostId FROM tags WHERE TagName = 'sample'
SELECT T2.Reputation, T2.UpVotes FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text = 'fine, you win :)'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.Title = 'How can I adapt ANOVA for binary data?'
SELECT T2.Text FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.ViewCount BETWEEN 100 AND 150 ORDER BY T2.Score DESC LIMIT 1
SELECT T2.CreationDate, T2.Age FROM comments AS T1 INNER JOIN users AS T2 ON T1.UserId = T2.Id WHERE T1.Text LIKE '%http://%'
SELECT COUNT(DISTINCT T2.PostId) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T2.Score = 0 AND T1.ViewCount < 5
SELECT COUNT(T1.Id) FROM posts AS T1 INNER JOIN comments AS T2 ON T1.Id = T2.PostId WHERE T1.CommentCount = 1 AND T2.Score = 0
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
SELECT CAST(SUM(CASE WHEN T4.power_name = 'Super Strength' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T1.id) AS percentage FROM publisher AS T1 INNER JOIN superhero AS T2 ON T1.id = T2.publisher_id INNER JOIN hero_power AS T3 ON T2.id = T3.hero_id INNER JOIN superpower AS T4 ON T3.power_id = T4.id WHERE T1.publisher_name = 'Marvel Comics'
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
SELECT code FROM drivers WHERE nationality = 'American'
SELECT driverId FROM lapTimes WHERE lap = 1 AND milliseconds IS NOT NULL ORDER BY milliseconds ASC LIMIT 5
SELECT location, country, lat, lng FROM circuits WHERE name = 'Hungaroring'
SELECT nationality FROM drivers GROUP BY nationality ORDER BY COUNT(nationality) DESC LIMIT 1
SELECT T2.name FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId ORDER BY T1.fastestLapTime ASC LIMIT 1
SELECT T3.lat, T3.lng FROM results AS T1 INNER JOIN races AS T2 ON T1.raceId = T2.raceId INNER JOIN circuits AS T3 ON T2.circuitId = T3.circuitId WHERE T1.fastestLapTime = '1:29.488'
SELECT player_api_id FROM Player_Attributes WHERE overall_rating IS NOT NULL ORDER BY overall_rating DESC LIMIT 1
SELECT player_name FROM Player ORDER BY height DESC LIMIT 1
SELECT preferred_foot FROM Player_Attributes WHERE potential IS NOT NULL ORDER BY potential ASC LIMIT 1
SELECT COUNT(id) FROM Player_Attributes WHERE overall_rating BETWEEN 60 AND 65 AND defensive_work_rate = 'low'
SELECT T1.player_api_id FROM Player_Attributes AS T1 WHERE T1.crossing IS NOT NULL ORDER BY T1.crossing DESC LIMIT 5
SELECT T2.name FROM Match AS T1 INNER JOIN League AS T2 ON T1.league_id = T2.id WHERE T1.season = '2015/2016' GROUP BY T2.name ORDER BY SUM(T1.home_team_goal + T1.away_team_goal) DESC LIMIT 1
SELECT T2.team_long_name FROM Match AS T1 INNER JOIN Team AS T2 ON T1.home_team_api_id = T2.team_api_id WHERE T1.season = '2015/2016' AND T1.home_team_goal < T1.away_team_goal GROUP BY T2.team_long_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.player_name FROM Player AS T1 INNER JOIN (SELECT player_fifa_api_id, MAX(penalties) AS max_penalties FROM Player_Attributes GROUP BY player_fifa_api_id) AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T2.max_penalties DESC LIMIT 10
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_api_id = T2.player_api_id WHERE T1.attacking_work_rate = 'high'
SELECT player_name FROM Player WHERE height > 180 ORDER BY player_name ASC LIMIT 3
SELECT T2.buildUpPlaySpeedClass FROM Team AS T1 INNER JOIN Team_Attributes AS T2 ON T1.team_api_id = T2.team_api_id WHERE T1.team_long_name = 'KSV Cercle Brugge' AND T2.buildUpPlaySpeedClass IN ('Slow', 'Balanced', 'Fast')
SELECT T2.finishing, T2.curve FROM Player AS T1 INNER JOIN Player_Attributes AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.weight DESC LIMIT 1
SELECT T2.player_name FROM Player_Attributes AS T1 INNER JOIN Player AS T2 ON T1.player_fifa_api_id = T2.player_fifa_api_id ORDER BY T1.overall_rating DESC LIMIT 1
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
SELECT CASE WHEN T1.`T-CHO` < 250 THEN 'YES' ELSE 'NO' END FROM Laboratory AS T1 WHERE T1.ID = 2927464 AND T1.Date = '1995-09-04'
SELECT COUNT(T1.ID) FROM Patient AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T2.`ANA Pattern` != 'p' AND T1.SEX = 'F' AND strftime('%Y', T1.Birthday) BETWEEN '1980' AND '1989'
SELECT Description, Diagnosis FROM Patient WHERE ID = 48473
SELECT COUNT(T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.GLU < 180 AND T2.Thrombosis = 0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Admission = '+' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(DISTINCT T1.ID) FROM Patient AS T1 INNER JOIN Laboratory AS T2 ON T1.ID = T2.ID WHERE T1.Diagnosis = 'SLE' AND T2.WBC BETWEEN 3.5 AND 9.0
SELECT COUNT(DISTINCT T1.ID) FROM Laboratory AS T1 INNER JOIN Examination AS T2 ON T1.ID = T2.ID WHERE T1.PLT BETWEEN 100 AND 400 AND T2.Diagnosis IS NOT NULL
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
SELECT CAST(SUM(T3.cost) AS REAL) * 100 / COUNT(T1.event_id) AS percentage_cost FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event INNER JOIN expense AS T3 ON T2.budget_id = T3.link_to_budget WHERE T1.type = 'Game' AND T3.cost IS NOT NULL
SELECT T1.first_name, T1.last_name FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name ORDER BY SUM(T2.cost) DESC LIMIT 5
SELECT T1.first_name, T1.last_name, T1.phone FROM member AS T1 INNER JOIN expense AS T2 ON T1.member_id = T2.link_to_member GROUP BY T1.first_name, T1.last_name, T1.phone HAVING SUM(T2.cost) > (SELECT AVG(cost) FROM expense)
SELECT CAST(SUM(CASE WHEN T1.state = 'Maine' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.position) - CAST(SUM(CASE WHEN T1.state = 'Vermont' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(T2.position) FROM zip_code AS T1 INNER JOIN member AS T2 ON T1.zip_code = T2.zip WHERE T2.position = 'Member'
SELECT T2.first_name, T2.last_name, T1.cost FROM expense AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.expense_description = 'Water, Veggie tray, supplies'
SELECT T2.category, T2.amount FROM event AS T1 INNER JOIN budget AS T2 ON T1.event_id = T2.link_to_event WHERE T1.event_name = 'January Speaker'
SELECT T2.event_name FROM budget AS T1 INNER JOIN event AS T2 ON T1.link_to_event = T2.event_id WHERE T1.category = 'Food'
SELECT T2.first_name, T2.last_name, T1.amount FROM income AS T1 INNER JOIN member AS T2 ON T1.link_to_member = T2.member_id WHERE T1.date_received = '2019-09-09'
SELECT T2.category FROM expense AS T1 INNER JOIN budget AS T2 ON T1.link_to_budget = T2.budget_id WHERE T1.expense_description = 'Posters'
SELECT T1.CustomerID, T2.Consumption FROM customers AS T1 INNER JOIN yearmonth AS T2 ON T1.CustomerID = T2.CustomerID WHERE T1.Segment = 'KAM' ORDER BY T2.Consumption DESC LIMIT 1
SELECT DISTINCT T2.Country FROM transactions_1k AS T1 INNER JOIN gasstations AS T2 ON T1.GasStationID = T2.GasStationID WHERE strftime('%Y%m', T1.Date) = '201306'
SELECT AVG(T2.Amount * T2.Price) FROM gasstations AS T1 INNER JOIN transactions_1k AS T2 ON T1.GasStationID = T2.GasStationID WHERE T1.Country = 'CZE'
SELECT AVG(T1.Price) FROM transactions_1k T1 JOIN customers T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Currency = 'Euro'
SELECT T1.CustomerID, T2.Price / T2.Amount AS AvgPricePerItem, T1.Currency FROM customers AS T1 INNER JOIN transactions_1k AS T2 ON T1.CustomerID = T2.CustomerID WHERE T2.Amount IS NOT NULL ORDER BY AvgPricePerItem DESC LIMIT 1
