SELECT COUNT(DISTINCT Singer_ID) FROM singer
SELECT COUNT(*) FROM singer WHERE Singer_ID IS NOT NULL
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT Name AS SingerName, Country AS SingerCountry, Age AS SingerAge FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT AVG(Age) average_age, MIN(Age) min_age, MAX(Age) max_age FROM singer WHERE Country = 'France'
SELECT AVG(singer.Age) AS Average, MIN(singer.Age) AS Minimum, MAX(singer.Age) AS Maximum FROM singer WHERE singer.Country = 'French'
SELECT Name, Song_release_year FROM (SELECT Name, Song_release_year, Age, RANK() OVER (ORDER BY Age ASC) AS rank FROM singer) WHERE rank = 1
SELECT Song_Name, Song_release_year FROM singer WHERE Age IN (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20 AND Country <> ''
SELECT DISTINCT Country FROM singer WHERE Age > 20 ORDER BY Country DESC LIMIT 100
SELECT Country, COUNT(DISTINCT Singer_ID) AS NumberOfSingers FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT DISTINCT s.Song_Name FROM singer s WHERE s.Age > (SELECT AVG(s2.Age) FROM singer s2)
SELECT DISTINCT s.Song_Name FROM singer s WHERE s.Age > (SELECT AVG(s2.Age) FROM singer s2)
SELECT Name, Location FROM stadium WHERE Capacity > 4999 AND Capacity < 10001
SELECT Name, Location FROM stadium WHERE Capacity > 4999 AND Capacity < 10001
SELECT MAX(stadium.Capacity) AS 'Max Capacity', AVG(stadium.Capacity) AS 'Average Capacity' FROM stadium
SELECT MAX(Capacity) AS MaxCapacity, AVG(Average) AS AverageCapacity FROM stadium
SELECT Name, Capacity FROM stadium WHERE Stadium_ID = (SELECT MIN(Stadium_ID) FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium))
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium LIMIT 1)
SELECT COUNT(DISTINCT concert_ID) FROM concert WHERE Year IN (2014, 2015)
SELECT COUNT(DISTINCT concert_ID) FROM concert WHERE Year IN (2014, 2015)
SELECT s.Name, COUNT(c.concert_ID) FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name
SELECT s.Stadium_ID AS ID, COUNT(c.concert_ID) AS TotalConcerts FROM stadium s LEFT OUTER JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID
SELECT s.Name, s.Capacity FROM stadium s WHERE s.Stadium_ID = (SELECT c.Stadium_ID FROM concert c WHERE c.Year >= 2014 GROUP BY c.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name, Capacity FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year > 2013 GROUP BY Stadium_ID HAVING COUNT(*) = (SELECT MAX(concert_count) FROM (SELECT COUNT(*) AS concert_count FROM concert WHERE Year > 2013 GROUP BY Stadium_ID) AS Counts))
SELECT Year FROM concert GROUP BY Year HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM concert GROUP BY Year) AS counts)
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM (SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30) AS subquery
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT c.concert_Name, c.Theme, COUNT(s.Singer_ID) AS NumberOfSingers FROM concert c LEFT OUTER JOIN singer_in_concert s ON c.concert_ID = s.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme
SELECT concert.concert_Name, concert.Theme, COUNT(singer_in_concert.Singer_ID) FROM concert LEFT JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID, concert.concert_Name, concert.Theme
SELECT s.Name, COUNT(c.concert_ID) AS Concert_Total FROM singer s LEFT JOIN singer_in_concert c ON s.Singer_ID = c.Singer_ID GROUP BY s.Name ORDER BY s.Name
SELECT s.Name, COUNT(sic.Singer_ID) AS ConcertCount FROM singer s LEFT OUTER JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name
SELECT DISTINCT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = 2014
SELECT DISTINCT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = 2014
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT DISTINCT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT s.Name, s.Location FROM stadium s WHERE s.Stadium_ID IN (SELECT c.Stadium_ID FROM concert c GROUP BY c.Stadium_ID HAVING SUM(CASE WHEN c.Year = 2014 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN c.Year = 2015 THEN 1 ELSE 0 END) > 0)
SELECT s.Name, s.Location FROM stadium s WHERE (SELECT COUNT(DISTINCT c.Year) FROM concert c WHERE c.Stadium_ID = s.Stadium_ID AND c.Year IN (2014, 2015)) = 2
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert INNER JOIN (SELECT Stadium_ID FROM stadium WHERE Capacity = (SELECT MAX(Capacity) FROM stadium)) AS MaxCapacityStadium ON concert.Stadium_ID = MaxCapacityStadium.Stadium_ID
SELECT COUNT(*) AS NumberOfPets FROM Pets WHERE weight > 10.0
SELECT COUNT(*) AS NumberOfPets FROM Pets WHERE weight > 10.0
SELECT P.weight FROM Pets P WHERE P.PetType = 'dog' AND P.pet_age = (SELECT MIN(P2.pet_age) FROM Pets P2 WHERE P2.PetType = 'dog')
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog') GROUP BY weight
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT COUNT(HP.PetID) FROM Has_Pet HP, Student S WHERE HP.StuID = S.StuID AND S.Age > 20
SELECT COUNT(DISTINCT hp.PetID) FROM Has_Pet hp, Student s WHERE hp.StuID = s.StuID AND s.Age > 20
SELECT COUNT(DISTINCT Pets.PetID) FROM Pets, Has_Pet, Student WHERE Pets.PetID = Has_Pet.PetID AND Has_Pet.StuID = Student.StuID AND Pets.PetType = 'dog' AND Student.Sex = 'F'
SELECT COUNT(*) FROM Student s, Has_Pet hp, Pets p WHERE s.StuID = hp.StuID AND hp.PetID = p.PetID AND p.PetType = 'dog' AND s.Sex = 'female'
SELECT COUNT(*) FROM (SELECT DISTINCT PetType FROM Pets)
SELECT COUNT(*) FROM (SELECT DISTINCT PetType FROM Pets)
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' OR PetType = 'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' OR PetType = 'dog'))
SELECT Fname FROM Student WHERE EXISTS (SELECT * FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND HP.StuID = Student.StuID) AND EXISTS (SELECT * FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND HP.StuID = Student.StuID)
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType IN ('cat', 'dog') GROUP BY StuID HAVING COUNT(DISTINCT P.PetType) = 2)
SELECT DISTINCT S.Major, S.Age FROM Student S WHERE NOT EXISTS (SELECT * FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND HP.StuID = S.StuID)
SELECT Major, Age FROM Student AS S WHERE NOT EXISTS (SELECT * FROM Has_Pet AS HP JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND HP.StuID = S.StuID)
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat'
SELECT DISTINCT StuID FROM Student WHERE StuID NOT IN (SELECT DISTINCT StuID FROM Has_Pet INNER JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Fname, Age FROM Student AS S WHERE EXISTS (SELECT * FROM Has_Pet AS HP INNER JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND HP.StuID = S.StuID) AND NOT EXISTS (SELECT * FROM Has_Pet AS HP INNER JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND HP.StuID = S.StuID)
SELECT S.Fname FROM Student S WHERE EXISTS (SELECT 1 FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog' AND HP.StuID = S.StuID) AND NOT EXISTS (SELECT 1 FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND HP.StuID = S.StuID)
SELECT P.PetType, P.weight FROM Pets P WHERE P.pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT P.PetType, P.weight FROM Pets P WHERE P.pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) as Average_Age, MAX(pet_age) as Maximum_Age FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS Average_Age, MAX(pet_age) AS Maximum_Age FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType
SELECT Fname, Age FROM Student WHERE EXISTS (SELECT 1 FROM Has_Pet WHERE StuID = Student.StuID)
SELECT DISTINCT Fname, Age FROM Student WHERE StuID IN (SELECT DISTINCT StuID FROM Has_Pet)
SELECT p.PetID FROM Pets p, Has_Pet hp, Student s WHERE p.PetID = hp.PetID AND hp.StuID = s.StuID AND s.LName = 'Smith'
SELECT p.PetID FROM Pets p, Has_Pet hp, Student s WHERE p.PetID = hp.PetID AND hp.StuID = s.StuID AND s.LName = 'Smith'
SELECT Student.StuID, COUNT(Has_Pet.PetID) AS PetCount FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID
SELECT Student.StuID, COUNT(Has_Pet.PetID) FROM Student INNER JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID
SELECT Fname, Sex FROM Student S WHERE S.StuID IN (SELECT H.StuID FROM Has_Pet H GROUP BY H.StuID HAVING COUNT(H.PetID) > 1)
SELECT Fname, Sex FROM Student S WHERE (SELECT COUNT(*) FROM Has_Pet H WHERE H.StuID = S.StuID) > 1
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT LName FROM Student s WHERE EXISTS (SELECT * FROM Has_Pet hp JOIN Pets p ON hp.PetID = p.PetID WHERE hp.StuID = s.StuID AND p.PetType = 'cat' AND p.pet_age = 3)
SELECT AVG(Student.Age) AS AverageAge FROM Student LEFT JOIN Has_Pet ON Student.StuID = Has_Pet.StuID WHERE Has_Pet.StuID IS NULL
SELECT AVG(Age) FROM Student AS S LEFT JOIN Has_Pet AS H ON S.StuID = H.StuID WHERE H.StuID IS NULL
SELECT DISTINCT COUNT(Continent) FROM continents
SELECT COUNT(Continent) FROM continents
SELECT c.ContId, c.Continent, COUNT(d.CountryId) AS NumberOfCountries FROM continents c LEFT JOIN countries d ON c.ContId = d.Continent GROUP BY c.ContId, c.Continent
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT cm.FullName AS MakerName, cm.Id AS MakerId, COUNT(DISTINCT ml.Model) AS ModelsProduced FROM car_makers cm LEFT JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.FullName, cm.Id
SELECT cm.FullName AS MakerName, cm.Id AS MakerId, COUNT(ml.ModelId) AS TotalModels FROM car_makers cm LEFT JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data))
SELECT Model FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data)
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data))
SELECT MakeId FROM car_names WHERE EXISTS (SELECT 1 FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data) AND Id = car_names.MakeId)
SELECT DISTINCT cm.FullName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970
SELECT DISTINCT cm.FullName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970
SELECT car_names.Make, cars_data.Year FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year = (SELECT MIN(Year) FROM cars_data)
SELECT cm.FullName, cd.Year FROM car_makers cm, model_list ml, car_names cn, cars_data cd WHERE cm.Id = ml.Maker AND ml.ModelId = cn.MakeId AND cn.MakeId = cd.Id ORDER BY cd.Year ASC LIMIT 1
SELECT DISTINCT Model FROM car_names cn, cars_data cd WHERE cn.MakeId = cd.Id AND cd.Year > 1980 GROUP BY cn.Model
SELECT ml.ModelId, ml.Model FROM model_list ml, car_names cn, cars_data cd WHERE ml.Model = cn.Model AND cn.MakeId = cd.Id AND cd.Year > 1980 GROUP BY ml.ModelId, ml.Model
SELECT C.Continent AS ContinentName, COUNT(DISTINCT M.Id) AS TotalCarMakers FROM continents C LEFT JOIN countries CO ON C.ContId = CO.Continent LEFT JOIN car_makers M ON CO.CountryId = M.Country GROUP BY C.Continent
SELECT c.Continent AS ContinentName, COUNT(m.Id) AS TotalMakers FROM continents c LEFT JOIN countries co ON c.ContId = co.Continent LEFT JOIN car_makers m ON co.CountryId = m.Country GROUP BY c.Continent ORDER BY c.Continent
SELECT c.CountryName FROM countries c WHERE EXISTS (SELECT 1 FROM car_makers m WHERE m.Country = c.CountryId GROUP BY m.Country HAVING COUNT(m.Id) = (SELECT MAX(MakerCount) FROM (SELECT COUNT(Id) AS MakerCount FROM car_makers GROUP BY Country) AS SubQuery))
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName, c.CountryId HAVING COUNT(cm.Id) = (SELECT MAX(cnt) FROM (SELECT COUNT(Id) AS cnt FROM car_makers GROUP BY Country) t)
SELECT FullName, COUNT(Model) AS ModelCount FROM car_makers LEFT JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY FullName
SELECT Id, FullName, (SELECT COUNT(Model) FROM model_list WHERE Maker = car_makers.Id) AS ModelCount FROM car_makers
SELECT Accelerate FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId AND car_names.Model = 'amc hornet sportabout (sw)'
SELECT Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model = 'amc hornet sportabout (sw)'
SELECT COUNT(car_makers.Id) FROM car_makers INNER JOIN countries ON car_makers.Country = countries.CountryId AND countries.CountryName = 'France'
SELECT COUNT(*) FROM (SELECT DISTINCT car_makers.Id FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France')
SELECT COUNT(DISTINCT cn.Model) FROM car_names AS cn JOIN car_makers AS cm ON cn.MakeId = cm.Id JOIN countries AS c ON cm.Country = c.CountryId WHERE c.CountryName = 'USA'
SELECT COUNT(DISTINCT cn.Model) FROM car_names AS cn JOIN car_makers AS cm ON cn.MakeId = cm.Id JOIN countries AS c ON cm.Country = c.CountryId WHERE c.CountryName = 'usa'
SELECT AVG(MPG) AS average_mpg FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) AS Average_Miles_Per_Gallon FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = '8' AND Year = 1974 GROUP BY Year
SELECT `FullName`, `Model` FROM `car_makers` JOIN `model_list` ON `car_makers`.`Id` = `model_list`.`Maker`
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT DISTINCT countries.CountryName, countries.CountryId FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country
SELECT c.CountryId, c.CountryName FROM countries c WHERE EXISTS (SELECT 1 FROM car_makers cm WHERE cm.Country = c.CountryId)
SELECT COUNT(Id) AS CarCount FROM cars_data WHERE Horsepower > 150
SELECT COUNT(Id) AS CarCount FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) AS AverageWeight FROM cars_data GROUP BY Year ORDER BY AverageWeight DESC
SELECT Year, AVG(Weight) AS Average_Weight FROM cars_data GROUP BY Year ORDER BY Year DESC, Average_Weight ASC
SELECT countries.CountryName FROM countries INNER JOIN continents ON countries.Continent = continents.ContId INNER JOIN car_makers ON countries.CountryId = car_makers.Country WHERE continents.Continent = 'Europe' GROUP BY countries.CountryName HAVING COUNT(car_makers.Id) >= 3
SELECT c.CountryName FROM countries AS c JOIN car_makers AS cm ON c.CountryId = cm.Country JOIN continents AS ct ON c.Continent = ct.ContId WHERE ct.Continent = 'Europe' GROUP BY c.CountryName HAVING COUNT(cm.Id) >= 3
SELECT car_names.Make, MAX(cars_data.Horsepower) AS MaximumHorsepower FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId AND cars_data.Cylinders = 3 GROUP BY car_names.Make
SELECT car_names.Make, MAX(cars_data.Horsepower) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3 GROUP BY car_names.Make HAVING MAX(cars_data.Horsepower) = (SELECT MAX(Horsepower) FROM cars_data WHERE Cylinders = 3)
SELECT cn.Model FROM car_names cn INNER JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.MPG = (SELECT MAX(MPG) FROM cars_data)
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE MPG = (SELECT MAX(MPG) FROM cars_data))
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(cars_data.Horsepower) FROM cars_data WHERE cars_data.Year < 1980
SELECT AVG(Edispl) FROM cars_data cd, car_names cn WHERE cd.Id = cn.MakeId AND cn.Model = 'Volvo'
SELECT AVG(cars_data.Edispl) AS AvgEdispl FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.FullName = 'Volvo Corporation'
SELECT DISTINCT Cylinders, MAX(Accelerate) OVER (PARTITION BY Cylinders) AS MaxAcceleration FROM cars_data
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders ORDER BY Cylinders DESC
SELECT M.ModelId FROM model_list M INNER JOIN car_names C ON M.Model = C.Model GROUP BY M.ModelId HAVING COUNT(DISTINCT C.MakeId) = (SELECT MAX(COUNTS) FROM (SELECT COUNT(DISTINCT MakeId) AS COUNTS FROM car_names GROUP BY Model) AS SubQuery)
WITH RankedModels AS (SELECT model_list.ModelId, RANK() OVER (ORDER BY COUNT(DISTINCT car_names.MakeId) DESC) AS Rank FROM model_list JOIN car_names ON model_list.Model = car_names.Model GROUP BY model_list.ModelId) SELECT ModelId FROM RankedModels WHERE Rank = 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(DISTINCT Id) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(Id) AS CarCount FROM cars_data WHERE Year = '1980'
SELECT COUNT(*) FROM cars_data WHERE Year = 1980 AND Id IS NOT NULL
SELECT COUNT(*) FROM model_list m JOIN car_makers c ON m.Maker = c.Id WHERE c.FullName = 'American Motor Company'
SELECT COUNT(*) FROM model_list m JOIN car_makers c ON m.Maker = c.Id WHERE c.FullName = 'American Motor Company'
SELECT cm.FullName, cm.Id FROM car_makers cm LEFT JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName HAVING COUNT(ml.Model) > 3
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.Maker HAVING COUNT(model_list.Model) > 3
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight > 3500) OR MakeId IN (SELECT ModelId FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE FullName = 'General Motors'))
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM car_makers WHERE Maker = 'General Motors' UNION SELECT Id FROM cars_data WHERE Weight > 3500)
SELECT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000 GROUP BY Year
SELECT DISTINCT a.Year FROM cars_data a JOIN cars_data b ON a.Year = b.Year WHERE a.Weight < 4000 AND b.Weight > 3000
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data LIMIT 1)
SELECT c.Horsepower FROM cars_data c WHERE c.Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Cylinders FROM (SELECT * FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model = 'Volvo' ORDER BY Accelerate) AS VolvoCars LIMIT 1
SELECT Cylinders FROM cars_data WHERE Accelerate = (SELECT MIN(Accelerate) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo')
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Horsepower FROM cars_data ORDER BY Horsepower DESC LIMIT 1)
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM (SELECT Country, COUNT(*) AS TotalMakers FROM car_makers GROUP BY Country HAVING TotalMakers > 2) AS CountQuery
SELECT COUNT(country) FROM (SELECT Country, COUNT(Id) AS MakerCount FROM car_makers GROUP BY Country HAVING MakerCount > 2) AS C
SELECT COUNT(DISTINCT Id) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) AS NumberOfCars FROM cars_data WHERE Cylinders > 6
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Cylinders = 4) ORDER BY (SELECT Horsepower FROM cars_data WHERE cars_data.Id = car_names.MakeId) DESC LIMIT 1
SELECT Model FROM (SELECT car_names.Model, cars_data.Horsepower FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Cylinders = 4) AS SubQuery ORDER BY Horsepower DESC LIMIT 1
SELECT cn.MakeId, cm.Maker FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId JOIN car_makers cm ON cn.MakeId = cm.Id WHERE cd.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders <= 3
SELECT cn.MakeId, cn.Make FROM car_names cn, cars_data cd WHERE cn.MakeId = cd.Id AND cd.Horsepower NOT IN (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders < 4
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980 GROUP BY Cylinders, Year
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980 GROUP BY Cylinders, Year
SELECT DISTINCT c.Id FROM cars_data c, car_names n, model_list m, car_makers k WHERE c.Weight < 3500 AND c.Id = n.MakeId AND n.Make = m.Model AND m.Maker = k.Id AND k.FullName <> 'Ford Motor Company'
SELECT DISTINCT car_names.Model FROM car_names INNER JOIN cars_data ON car_names.MakeId = cars_data.Id INNER JOIN model_list ON car_names.MakeId = model_list.ModelId INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE cars_data.Weight < 3500 AND car_makers.Maker <> 'Ford Motor Company'
SELECT c.CountryName FROM countries c LEFT JOIN car_makers cm ON c.CountryId = cm.Country WHERE cm.Id IS NULL
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT DISTINCT Country FROM car_makers)
SELECT M.Id, M.Maker FROM car_makers M JOIN model_list L ON M.Id = L.Maker JOIN car_names N ON L.Model = N.Model JOIN cars_data D ON N.MakeId = D.Id GROUP BY M.Id, M.Maker HAVING COUNT(DISTINCT L.Model) >= 2 AND COUNT(D.Id) > 3
SELECT DISTINCT cm.Id, cm.Maker FROM car_makers cm, model_list ml, car_names cn, cars_data cd WHERE cm.Id = ml.Maker AND ml.Model = cn.Model AND cn.MakeId = cd.Id GROUP BY cm.Id, cm.Maker HAVING COUNT(DISTINCT ml.Model) >= 2 AND COUNT(DISTINCT cd.Id) > 3
SELECT c.CountryId, c.CountryName FROM countries c WHERE EXISTS (SELECT 1 FROM car_makers cm WHERE cm.Country = c.CountryId GROUP BY cm.Country HAVING COUNT(cm.Id) > 3) OR EXISTS (SELECT 1 FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model WHERE cn.Model = 'fiat' AND cm.Country = c.CountryId)
SELECT c.CountryId, c.CountryName FROM countries c WHERE EXISTS (SELECT 1 FROM car_makers cm WHERE cm.Country = c.CountryId GROUP BY cm.Country HAVING COUNT(cm.Id) > 3) OR EXISTS (SELECT 1 FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.Model = cn.Model WHERE cn.Model = 'fiat' AND cm.Country = c.CountryId)
SELECT a.Country FROM airlines a WHERE a.Airline LIKE '%JetBlue Airways%'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways' AND Country IS NOT NULL
SELECT a.Abbreviation FROM airlines AS a WHERE a.Airline = 'JetBlue Airways'
SELECT a.Abbreviation FROM airlines a WHERE a.Airline LIKE '%Jetblue Airways%'
SELECT Airline AS AirlineName, Abbreviation AS AirlineAbbreviation FROM airlines WHERE Country = 'USA' GROUP BY Airline, Abbreviation
SELECT airlines.Airline, airlines.Abbreviation FROM airlines WHERE airlines.Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City LIKE 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City LIKE 'Anthony'
SELECT COUNT(*) AS NumberOfAirlines FROM airlines
SELECT COUNT(1) FROM airlines
SELECT COUNT(1) FROM airports
SELECT COUNT(DISTINCT AirportCode) AS UniqueAirports FROM airports
SELECT COUNT(*) AS TotalFlights FROM flights
SELECT COUNT(FlightNo) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL' AND uid IS NOT NULL
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(uid) FROM airlines WHERE Country = 'USA'
SELECT COUNT(uid) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName IN ('Alton')
SELECT City, Country FROM airports WHERE LOWER(AirportName) = 'alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT DISTINCT AirportName FROM airports WHERE City LIKE 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(FlightNo) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) AS FlightCount FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) AS NumberOfFlights FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = (SELECT AirportCode FROM airports WHERE AirportCode = 'ATO')
SELECT COUNT(1) FROM flights, airports WHERE flights.SourceAirport = airports.AirportCode AND airports.City = 'Aberdeen'
SELECT COUNT(1) FROM flights, airports WHERE flights.SourceAirport = airports.AirportCode AND airports.City = 'Aberdeen'
SELECT COUNT(flights.FlightNo) AS NumberOfFlights FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(flights.FlightNo) AS NumberOfFlights FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'
SELECT COUNT(*) FROM flights f INNER JOIN airports src ON f.SourceAirport = src.AirportCode INNER JOIN airports dest ON f.DestAirport = dest.AirportCode WHERE src.City = 'Aberdeen' AND dest.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen') AND DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Ashley')
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights f INNER JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM flights f LEFT JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.DestAirport = 'ASY'
SELECT COUNT(1) FROM flights, airlines, airports WHERE flights.Airline = airlines.uid AND flights.DestAirport = airports.AirportCode AND airlines.Airline = 'United Airlines' AND airports.AirportCode = 'ASY'
SELECT COUNT(1) FROM flights f, airlines a, airports p WHERE f.Airline = a.uid AND f.SourceAirport = p.AirportCode AND a.Airline = 'United Airlines' AND p.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights f JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'
SELECT COUNT(flights.FlightNo) FROM flights LEFT JOIN airlines ON flights.Airline = airlines.uid LEFT JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights, airlines, airports WHERE flights.Airline = airlines.uid AND flights.DestAirport = airports.AirportCode AND airlines.Airline = 'United Airlines' AND airports.AirportName LIKE '%Aberdeen%'
SELECT City FROM airports WHERE AirportCode = (SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) DESC LIMIT 1)
SELECT a.City FROM airports a, (SELECT DestAirport FROM flights GROUP BY DestAirport HAVING COUNT(DestAirport) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM flights GROUP BY DestAirport) sub)) b WHERE a.AirportCode = b.DestAirport
SELECT A.City FROM airports A INNER JOIN (SELECT SourceAirport, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport) F ON A.AirportCode = F.SourceAirport ORDER BY F.FlightCount DESC LIMIT 1
SELECT City FROM (SELECT City, COUNT(*) AS flight_count FROM airports INNER JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City) AS counts WHERE flight_count = (SELECT MAX(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM airports INNER JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City) AS subquery)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT DestAirport AS AirportCode FROM flights UNION ALL SELECT SourceAirport AS AirportCode FROM flights) GROUP BY AirportCode ORDER BY TotalFlights DESC LIMIT 1) AS MaxFlights
WITH FlightCounts AS (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) GROUP BY AirportCode) SELECT AirportCode FROM FlightCounts WHERE TotalFlights = (SELECT MAX(TotalFlights) FROM FlightCounts)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) GROUP BY AirportCode) AS FlightCounts WHERE TotalFlights = (SELECT MIN(TotalFlights) FROM (SELECT COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) GROUP BY AirportCode))
WITH FlightCounts AS (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS CombinedFlights GROUP BY AirportCode) SELECT AirportCode FROM FlightCounts WHERE TotalFlights = (SELECT MIN(TotalFlights) FROM FlightCounts)
SELECT A.Airline FROM airlines A WHERE EXISTS (SELECT 1 FROM flights F WHERE F.Airline = A.uid GROUP BY F.Airline HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM flights GROUP BY Airline) AS MaxCount))
SELECT A.Airline FROM airlines A JOIN (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline) F ON A.uid = F.Airline WHERE F.FlightCount = (SELECT MAX(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) sub)
SELECT A.Abbreviation, A.Country FROM airlines A, (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline HAVING FlightCount = (SELECT MIN(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS Sub)) AS F WHERE A.uid = F.Airline
SELECT A.Abbreviation, A.Country FROM airlines A INNER JOIN (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline HAVING FlightCount = (SELECT MIN(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS SubQuery)) F ON A.uid = F.Airline
SELECT a.Airline FROM airlines a WHERE EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'AHD')
SELECT a.Airline FROM airlines a WHERE EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = 'AHD' GROUP BY Airline)
SELECT a.Airline FROM airlines a WHERE EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'APG') AND EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'CVO')
SELECT a.Airline FROM airlines a WHERE EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'APG') AND EXISTS (SELECT 1 FROM flights f WHERE f.Airline = a.uid AND f.SourceAirport = 'CVO')
WITH CVO_Airlines AS (SELECT Airline FROM flights WHERE SourceAirport = 'CVO'), APG_Airlines AS (SELECT Airline FROM flights WHERE SourceAirport = 'APG') SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM CVO_Airlines) AND uid NOT IN (SELECT Airline FROM APG_Airlines)
SELECT DISTINCT a.Airline FROM airlines a INNER JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' AND a.uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT a.Airline FROM airlines a JOIN (SELECT Airline, COUNT(*) as FlightCount FROM flights GROUP BY Airline HAVING COUNT(*) >= 10) f ON a.uid = f.Airline
SELECT a.Airline FROM airlines a JOIN (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline) fc ON a.uid = fc.Airline WHERE fc.FlightCount >= 10
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline GROUP BY A.uid HAVING COUNT(DISTINCT F.FlightNo) < 200
SELECT A.Airline FROM airlines A WHERE (SELECT COUNT(*) FROM flights F WHERE F.Airline = A.uid) < 200
SELECT DISTINCT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT f.FlightNo FROM flights f INNER JOIN airlines a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG' AND FlightNo IS NOT NULL
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT f.FlightNo FROM flights f WHERE f.DestAirport = 'APG'
SELECT f.FlightNo FROM flights f INNER JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.AirportCode = 'APG'
SELECT DISTINCT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode AND airports.City = 'Aberdeen'
SELECT FlightNo FROM flights AS f JOIN airports AS a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen'
SELECT FlightNo FROM flights f INNER JOIN airports a ON f.DestAirport = a.AirportCode AND a.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(1) FROM flights, airports WHERE flights.DestAirport = airports.AirportCode AND (airports.City = 'Aberdeen' OR airports.City = 'Abilene')
SELECT COUNT(flights.FlightNo) AS TotalFlights FROM flights INNER JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen' OR airports.AirportName = 'Abilene'
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports a WHERE NOT EXISTS (SELECT NULL FROM flights f WHERE f.SourceAirport = a.AirportCode UNION SELECT NULL FROM flights f WHERE f.DestAirport = a.AirportCode)
SELECT COUNT(Employee_ID) AS TotalEmployees FROM employee
SELECT COUNT(DISTINCT Employee_ID) AS UniqueEmployeeCount FROM employee
SELECT Name FROM employee ORDER BY employee.Age, employee.Employee_ID ASC
SELECT Name FROM employee ORDER BY Age ASC, Name ASC
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City, COUNT(*) AS Num_Employees FROM employee GROUP BY City
SELECT DISTINCT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(City) > 1
SELECT e.City FROM employee e WHERE e.Age < 30 GROUP BY e.City HAVING COUNT(e.Employee_ID) > 1
SELECT Location, COUNT(Shop_ID) AS ShopTotal FROM shop GROUP BY Location ORDER BY Location
SELECT COUNT(*), Location FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop AS s WHERE s.Number_products = (SELECT MAX(Number_products) FROM shop AS s2)
SELECT Manager_name, District FROM shop AS s WHERE s.Number_products = (SELECT MAX(Number_products) FROM shop AS s2)
SELECT MIN(shop.Number_products) AS MinimumProducts, MAX(shop.Number_products) AS MaximumProducts FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID
SELECT s.Name FROM shop s WHERE s.Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop s1 WHERE s1.Number_products > (SELECT AVG(s2.Number_products) FROM shop s2)
SELECT e.Name FROM employee e INNER JOIN (SELECT Employee_ID, COUNT(*) AS awards_count FROM evaluation GROUP BY Employee_ID) ev ON e.Employee_ID = ev.Employee_ID WHERE ev.awards_count = (SELECT MAX(awards_count) FROM (SELECT COUNT(*) AS awards_count FROM evaluation GROUP BY Employee_ID) AS subquery)
SELECT e.Name FROM employee e, (SELECT Employee_ID, COUNT(*) AS Awards FROM evaluation GROUP BY Employee_ID) ev WHERE e.Employee_ID = ev.Employee_ID AND ev.Awards = (SELECT MAX(Awards) FROM (SELECT COUNT(*) AS Awards FROM evaluation GROUP BY Employee_ID) AS AwardCounts)
SELECT Name FROM employee e WHERE EXISTS (SELECT 1 FROM evaluation ev WHERE ev.Employee_ID = e.Employee_ID AND ev.Bonus = (SELECT MAX(Bonus) FROM evaluation))
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation WHERE Bonus = (SELECT MAX(Bonus) FROM evaluation))
SELECT Name FROM employee e WHERE NOT EXISTS (SELECT NULL FROM evaluation ev WHERE ev.Employee_ID = e.Employee_ID)
SELECT Name, Employee_ID FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name FROM shop s WHERE EXISTS (SELECT 1 FROM hiring h WHERE h.Shop_ID = s.Shop_ID GROUP BY h.Shop_ID HAVING COUNT(h.Employee_ID) = (SELECT MAX(c) FROM (SELECT COUNT(Employee_ID) AS c FROM hiring GROUP BY Shop_ID) t))
SELECT Name FROM shop WHERE Shop_ID IN (SELECT Shop_ID FROM (SELECT Shop_ID, COUNT(Employee_ID) AS TotalEmployees FROM hiring GROUP BY Shop_ID) AS EmployeeCounts WHERE TotalEmployees = (SELECT MAX(TotalEmployees) FROM (SELECT COUNT(Employee_ID) AS TotalEmployees FROM hiring GROUP BY Shop_ID) AS MaxEmployees))
SELECT s.Name FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID WHERE h.Shop_ID IS NULL
SELECT s.Name FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID WHERE h.Employee_ID IS NULL;
SELECT Name, COUNT(Employee_ID) AS TotalEmployees FROM shop LEFT JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY Name
SELECT s.Name, COUNT(DISTINCT h.Employee_ID) AS Employees FROM shop s LEFT JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name
SELECT TOTAL(evaluation.Bonus) AS TotalBonus FROM evaluation
SELECT SUM(evaluation.Bonus) FROM evaluation
SELECT hiring.Shop_ID, hiring.Employee_ID, hiring.Start_from, hiring.Is_full_time FROM hiring
SELECT Shop_ID AS ShopID, Employee_ID AS EmployeeID, Start_from AS StartDate, Is_full_time AS FullTimeStatus FROM hiring
SELECT DISTINCT District FROM shop WHERE (SELECT COUNT(*) FROM shop s WHERE s.District = shop.District AND s.Number_products < 3000) > 0 AND (SELECT COUNT(*) FROM shop s WHERE s.District = shop.District AND s.Number_products > 10000) > 0
SELECT s.District FROM shop s GROUP BY s.District HAVING MIN(s.Number_products) < 3000 AND MAX(s.Number_products) > 10000
SELECT COUNT(*) FROM (SELECT DISTINCT Location FROM shop) AS unique_locations
SELECT COUNT(*) FROM (SELECT DISTINCT Location FROM shop) AS unique_locations
SELECT COUNT(*) AS DocumentCount FROM Documents
SELECT COUNT(Document_ID) AS NumberOfDocuments FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Documents.Document_ID, Documents.Document_Name, Documents.Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%' COLLATE SQL_Latin1_General_CP1_CI_AS
SELECT D.Document_ID, D.Template_ID, D.Document_Description FROM Documents D WHERE D.Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) AS NumberOfUniqueTemplates FROM Documents
SELECT COUNT(DISTINCT Template_ID) AS NumberOfUniqueTemplates FROM Documents
SELECT COUNT(*) FROM Documents d, Templates t WHERE d.Template_ID = t.Template_ID AND t.Template_Type_Code = 'PPT'
SELECT COUNT(DISTINCT Document_ID) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'PPT'))
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT d.Template_ID, COUNT(*) AS usage_count FROM Documents d GROUP BY d.Template_ID
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T, (SELECT Template_ID, COUNT(*) AS Count FROM Documents GROUP BY Template_ID HAVING Count = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Documents GROUP BY Template_ID) AS Temp)) AS D WHERE T.Template_ID = D.Template_ID
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T WHERE T.Template_ID IN (SELECT D.Template_ID FROM Documents D GROUP BY D.Template_ID HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Documents GROUP BY Template_ID) AS DocumentCounts))
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(DISTINCT Document_ID) > 1
SELECT T.Template_ID FROM Templates T LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1
SELECT DISTINCT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents WHERE Template_ID IS NOT NULL)
SELECT DISTINCT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents WHERE Template_ID IS NOT NULL)
SELECT COUNT(1) FROM Templates
SELECT COUNT(*) AS TotalTemplates FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT T.Template_Type_Code FROM Templates T WHERE T.Template_Type_Code IS NOT NULL
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code IS NOT NULL
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code LIKE 'PP%' OR Template_Type_Code LIKE 'PPT%'
SELECT COUNT(Template_ID) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates t, Ref_Template_Types r WHERE t.Template_Type_Code = r.Template_Type_Code AND r.Template_Type_Description = 'CV'
SELECT T.Version_Number, T.Template_Type_Code FROM Templates AS T WHERE T.Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5 AND Template_Type_Code IS NOT NULL
SELECT r.Template_Type_Code, COUNT(t.Template_ID) FROM Ref_Template_Types AS r LEFT OUTER JOIN Templates AS t ON r.Template_Type_Code = t.Template_Type_Code GROUP BY r.Template_Type_Code
SELECT r.Template_Type_Code, COUNT(t.Template_ID) FROM Ref_Template_Types AS r LEFT JOIN Templates AS t ON r.Template_Type_Code = t.Template_Type_Code GROUP BY r.Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) = (SELECT MAX(template_count) FROM (SELECT COUNT(Template_ID) AS template_count FROM Templates GROUP BY Template_Type_Code) AS subquery)
SELECT Template_Type_Code FROM (SELECT Template_Type_Code, COUNT(*) AS Count FROM Templates GROUP BY Template_Type_Code) AS Temp WHERE Count = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Templates GROUP BY Template_Type_Code) AS Temp2)
SELECT T1.Template_Type_Code FROM Ref_Template_Types AS T1 LEFT JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code HAVING COUNT(T2.Template_ID) < 3
SELECT R.Template_Type_Code FROM Ref_Template_Types R WHERE (SELECT COUNT(*) FROM Templates T WHERE T.Template_Type_Code = R.Template_Type_Code) < 3
SELECT a.Template_Type_Code, a.MinVersion FROM (SELECT Template_Type_Code, MIN(Version_Number) AS MinVersion FROM Templates GROUP BY Template_Type_Code) a
SELECT Template_Type_Code, MIN(Version_Number) AS MinimumVersion FROM Templates GROUP BY Template_Type_Code HAVING MIN(Version_Number) IS NOT NULL
SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents WHERE Document_Name = 'Data base')
SELECT T.Template_Type_Code FROM Templates T WHERE EXISTS (SELECT 1 FROM Documents D WHERE D.Template_ID = T.Template_ID AND D.Document_Name = 'Data base')
SELECT Document_Name FROM Documents, Templates WHERE Documents.Template_ID = Templates.Template_ID AND Templates.Template_Type_Code = 'BK'
SELECT D.Document_Name FROM Documents AS D, Templates AS T WHERE D.Template_ID = T.Template_ID AND T.Template_Type_Code = 'BK'
SELECT T.Template_Type_Code, COUNT(D.Document_ID) AS TotalDocuments FROM Templates T LEFT OUTER JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code
SELECT r.Template_Type_Code, IFNULL(COUNT(d.Document_ID), 0) AS Document_Count FROM Ref_Template_Types r LEFT JOIN Templates t ON r.Template_Type_Code = t.Template_Type_Code LEFT JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY r.Template_Type_Code
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(doc_count) FROM (SELECT COUNT(*) AS doc_count FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code) AS subquery)
WITH CTE AS (SELECT T.Template_Type_Code, COUNT(*) AS NumDocs FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code) SELECT Template_Type_Code FROM CTE WHERE NumDocs = (SELECT MAX(NumDocs) FROM CTE)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types rtt WHERE Template_Type_Code NOT IN (SELECT t.Template_Type_Code FROM Templates t INNER JOIN Documents d ON t.Template_ID = d.Template_ID)
SELECT * FROM Ref_Template_Types
SELECT * FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code LIKE 'AD'
SELECT rtt.Template_Type_Description FROM Ref_Template_Types rtt WHERE rtt.Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description LIKE 'Book'
SELECT r.Template_Type_Code FROM Ref_Template_Types r WHERE r.Template_Type_Description = 'Book'
SELECT DISTINCT Template_Type_Description FROM Ref_Template_Types INNER JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT T.Template_Details FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID
SELECT T.Template_ID FROM Templates T, Ref_Template_Types R WHERE T.Template_Type_Code = R.Template_Type_Code AND R.Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Details = 'Presentation'
SELECT COUNT(Paragraph_ID) FROM Paragraphs WHERE Paragraph_ID IS NOT NULL
SELECT COUNT(Paragraph_ID) FROM Paragraphs WHERE Paragraph_ID IS NOT NULL
SELECT COUNT(DISTINCT Paragraphs.Paragraph_ID) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT COUNT(DISTINCT Paragraphs.Paragraph_ID) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT * FROM Paragraphs WHERE TRIM(Paragraph_Text) = 'Korea'
SELECT * FROM Paragraphs WHERE INSTR(Paragraph_Text, 'Korea') > 0
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents USING(Document_ID) WHERE Document_Name = 'Welcome to NY'
SELECT p.Paragraph_ID, p.Paragraph_Text FROM Paragraphs p, Documents d WHERE p.Document_ID = d.Document_ID AND d.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs WHERE EXISTS (SELECT 1 FROM Documents WHERE Documents.Document_ID = Paragraphs.Document_ID AND Documents.Document_Name = 'Customer reviews')
SELECT Paragraph_Text FROM Paragraphs p, Documents d WHERE p.Document_ID = d.Document_ID AND d.Document_Name = 'Customer reviews'
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS Total_Paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS ParagraphCount FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT doc.Document_ID, doc.Document_Name, COUNT(para.Paragraph_ID) AS TotalParagraphs FROM Documents doc LEFT JOIN Paragraphs para ON doc.Document_ID = para.Document_ID GROUP BY doc.Document_ID, doc.Document_Name
SELECT doc.Document_ID, doc.Document_Name, (SELECT COUNT(*) FROM Paragraphs WHERE Document_ID = doc.Document_ID) AS ParagraphsCount FROM Documents doc
SELECT p.Document_ID FROM Paragraphs p GROUP BY p.Document_ID HAVING COUNT(p.Paragraph_ID) >= 2
SELECT p.Document_ID FROM Paragraphs p GROUP BY p.Document_ID HAVING COUNT(p.Paragraph_ID) >= 2
SELECT D.Document_ID, D.Document_Name FROM Documents D WHERE D.Document_ID IN (SELECT P.Document_ID FROM Paragraphs P GROUP BY P.Document_ID HAVING COUNT(P.Paragraph_ID) = (SELECT MAX(Counted.NumParagraphs) FROM (SELECT COUNT(Paragraph_ID) AS NumParagraphs FROM Paragraphs GROUP BY Document_ID) AS Counted))
SELECT Documents.Document_ID, Documents.Document_Name FROM Documents INNER JOIN (SELECT Document_ID, COUNT(*) AS TotalParagraphs FROM Paragraphs GROUP BY Document_ID) AS ParagraphCount ON Documents.Document_ID = ParagraphCount.Document_ID WHERE ParagraphCount.TotalParagraphs = (SELECT MAX(TotalParagraphs) FROM (SELECT COUNT(*) AS TotalParagraphs FROM Paragraphs GROUP BY Document_ID) AS MaxParagraphs)
SELECT D.Document_ID FROM Documents D JOIN (SELECT Document_ID, COUNT(*) AS Count FROM Paragraphs GROUP BY Document_ID) P ON D.Document_ID = P.Document_ID WHERE P.Count = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM Paragraphs GROUP BY Document_ID) AS SubQuery)
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = (SELECT MIN(ParagraphCount) FROM (SELECT Document_ID, COUNT(Paragraph_ID) AS ParagraphCount FROM Paragraphs GROUP BY Document_ID) AS SubQuery)
SELECT Document_ID FROM (SELECT Document_ID, COUNT(Paragraph_ID) AS ParaCount FROM Paragraphs GROUP BY Document_ID) AS SubQuery WHERE ParaCount BETWEEN 1 AND 2
SELECT d.Document_ID FROM Documents d WHERE d.Document_ID IN (SELECT p.Document_ID FROM Paragraphs p GROUP BY p.Document_ID HAVING COUNT(p.Paragraph_ID) BETWEEN 1 AND 2)
SELECT Document_ID FROM Documents WHERE EXISTS (SELECT 1 FROM Paragraphs WHERE Paragraph_Text = 'Brazil' AND Documents.Document_ID = Paragraphs.Document_ID) AND EXISTS (SELECT 1 FROM Paragraphs WHERE Paragraph_Text = 'Ireland' AND Documents.Document_ID = Paragraphs.Document_ID)
SELECT DISTINCT p1.Document_ID FROM Paragraphs p1, Paragraphs p2 WHERE p1.Document_ID = p2.Document_ID AND p1.Paragraph_Text LIKE '%Brazil%' AND p2.Paragraph_Text LIKE '%Ireland%'
SELECT COUNT(DISTINCT Teacher_ID) FROM teacher
SELECT COUNT(*) AS NumberOfTeachers FROM teacher
SELECT t.Name FROM teacher t ORDER BY t.Age, t.Teacher_ID
SELECT teacher.Name FROM teacher ORDER BY teacher.Age ASC, teacher.Teacher_ID ASC
SELECT teacher.Age AS Age, teacher.Hometown AS Hometown FROM teacher
SELECT teacher.Age AS Age, teacher.Hometown AS Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown NOT IN ('Little Lever Urban District')
SELECT DISTINCT Name FROM teacher WHERE Hometown NOT IN ('Little Lever Urban District')
SELECT Name FROM teacher WHERE (Age = 32) OR (Age = 33)
SELECT Name FROM teacher WHERE (Age = 32) OR (Age = 33)
SELECT t.Hometown FROM teacher t WHERE t.Age = (SELECT MIN(t2.Age) FROM teacher t2)
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher t WHERE t.Age IS NOT NULL)
SELECT teacher.Hometown, COUNT(teacher.Teacher_ID) FROM teacher GROUP BY teacher.Hometown
SELECT Hometown, COUNT(DISTINCT Teacher_ID) AS Teachers FROM teacher GROUP BY Hometown
SELECT Hometown FROM (SELECT Hometown, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM teacher GROUP BY Hometown) sub WHERE rank = 1
SELECT Hometown FROM (SELECT Hometown, COUNT(*) AS freq FROM teacher GROUP BY Hometown) AS T WHERE freq = (SELECT MAX(freq) FROM (SELECT COUNT(*) AS freq FROM teacher GROUP BY Hometown) AS subquery)
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Teacher_ID) >= 2
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(Teacher_ID) >= 2
SELECT t.Name, c.Course FROM teacher t, course c, course_arrange ca WHERE t.Teacher_ID = ca.Teacher_ID AND c.Course_ID = ca.Course_ID
SELECT t.Name, c.Course FROM teacher t, course c, course_arrange ca WHERE t.Teacher_ID = ca.Teacher_ID AND c.Course_ID = ca.Course_ID
SELECT t.Name, c.Course FROM teacher t CROSS JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID CROSS JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC, c.Course ASC
SELECT Name, Course FROM teacher JOIN course_arrange USING (Teacher_ID) JOIN course USING (Course_ID) ORDER BY Name, Course
SELECT teacher.Name FROM teacher INNER JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID INNER JOIN course ON course_arrange.Course_ID = course.Course_ID WHERE course.Course = 'math'
SELECT t.Name FROM teacher t WHERE t.Teacher_ID IN (SELECT ca.Teacher_ID FROM course_arrange ca JOIN course c ON ca.Course_ID = c.Course_ID WHERE c.Course = 'math')
SELECT t.Name AS Teacher_Name, COUNT(DISTINCT ca.Course_ID) AS Course_Count FROM teacher AS t LEFT JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Name
SELECT Name, COUNT(Course_ID) FROM teacher LEFT JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID, teacher.Name
SELECT t.Name FROM teacher t JOIN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING COUNT(DISTINCT Course_ID) >= 2) c ON t.Teacher_ID = c.Teacher_ID
SELECT T.Name FROM teacher AS T JOIN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING COUNT(Course_ID) >= 2) AS C ON T.Teacher_ID = C.Teacher_ID
SELECT t.Name FROM teacher t WHERE t.Teacher_ID NOT IN (SELECT c.Teacher_ID FROM course_arrange c)
SELECT t.Name FROM teacher t WHERE NOT EXISTS (SELECT * FROM course_arrange c WHERE c.Teacher_ID = t.Teacher_ID)
SELECT COUNT(visitor.ID) FROM visitor WHERE visitor.Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > '4' ORDER BY Level_of_membership DESC
SELECT AVG(Age) AS AverageAge FROM visitor WHERE Level_of_membership <= '4'
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > '4' ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum m1 WHERE NOT EXISTS (SELECT 1 FROM museum m2 WHERE m2.Num_of_Staff > m1.Num_of_Staff)
SELECT AVG(Num_of_Staff) FROM museum m WHERE m.Open_Year < 2009
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum' AND Open_Year IS NOT NULL
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum m WHERE m.Open_Year > '2010')
SELECT v.ID, v.Name, v.Age FROM visitor v WHERE v.ID IN (SELECT visitor_ID FROM visit vi GROUP BY vi.visitor_ID, vi.Museum_ID HAVING COUNT(vi.visitor_ID) > 1)
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v JOIN (SELECT visitor_ID, SUM(Total_spent) AS TotalSpent FROM visit GROUP BY visitor_ID) s ON v.ID = s.visitor_ID WHERE s.TotalSpent = (SELECT MAX(TotalSpent) FROM (SELECT SUM(Total_spent) AS TotalSpent FROM visit GROUP BY visitor_ID) t)
SELECT M.Museum_ID, M.Name FROM museum M INNER JOIN (SELECT Museum_ID FROM visit GROUP BY Museum_ID HAVING COUNT(*) = (SELECT MAX(visit_count) FROM (SELECT COUNT(*) AS visit_count FROM visit GROUP BY Museum_ID) AS Counts)) AS V ON M.Museum_ID = V.Museum_ID
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT Name, Age FROM visitor v WHERE EXISTS (SELECT 1 FROM visit vi WHERE vi.visitor_ID = v.ID AND vi.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit))
SELECT AVG(Num_of_Ticket) AS Average, MAX(Num_of_Ticket) AS Maximum FROM visit
SELECT SUM(Total_spent) FROM visit, visitor WHERE visit.visitor_ID = visitor.ID AND visitor.Level_of_membership = 1
SELECT v.Name FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < 2009 GROUP BY v.ID HAVING COUNT(DISTINCT CASE WHEN m.Open_Year > 2011 THEN m.Museum_ID ELSE NULL END) > 0
SELECT COUNT(DISTINCT ID) FROM visitor WHERE ID NOT IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010))
SELECT COUNT(*) FROM museum WHERE Open_Year NOT BETWEEN 2008 AND 2013
SELECT COUNT(1) FROM players
SELECT COUNT(players.player_id) FROM players
SELECT COUNT(*) FROM matches, qualifying_matches;
SELECT COUNT(1) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS 'Average Age of Losers', AVG(winner_age) AS 'Average Age of Winners' FROM matches
SELECT AVG(loser_age) AS 'Average Age of Losers', AVG(winner_age) AS 'Average Age of Winners' FROM matches
SELECT AVG(winner_rank) AS average_winner_rank FROM matches
SELECT AVG(ranking) FROM rankings WHERE player_id IN (SELECT winner_id FROM matches)
SELECT MAX(loser_rank) AS MaxRank FROM matches
SELECT MIN(loser_rank) AS LowestRank FROM matches WHERE loser_rank IS NOT NULL
SELECT COUNT(DISTINCT players.country_code) FROM players
SELECT COUNT(*) FROM (SELECT DISTINCT country_code FROM players) AS unique_countries
SELECT COUNT(DISTINCT loser_name) AS distinct_losers FROM matches
SELECT COUNT(DISTINCT matches.loser_name) FROM matches
SELECT m.tourney_name FROM matches m GROUP BY m.tourney_name HAVING COUNT(m.tourney_name) > 10
SELECT m.tourney_name FROM matches m GROUP BY m.tourney_name HAVING COUNT(m.tourney_name) > 10
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013 INTERSECT SELECT winner_id FROM matches WHERE year = 2016)
SELECT P.first_name, P.last_name FROM players P WHERE P.player_id IN (SELECT M.winner_id FROM matches M WHERE M.year = 2013) INTERSECT SELECT P.first_name, P.last_name FROM players P WHERE P.player_id IN (SELECT M.winner_id FROM matches M WHERE M.year = 2016)
SELECT COUNT(*) FROM matches WHERE year = '2013' OR year = '2016'
SELECT COUNT(*) FROM matches WHERE year BETWEEN 2013 AND 2016 AND year IN (2013, 2016)
SELECT country_code, first_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships') AND player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open')
SELECT P.first_name, P.country_code FROM players P WHERE P.player_id IN (SELECT M.winner_id FROM matches M WHERE M.tourney_name = 'WTA Championships' AND M.winner_id IN (SELECT M.winner_id FROM matches M WHERE M.tourney_name = 'Australian Open'))
SELECT first_name, country_code FROM (SELECT first_name, country_code, RANK() OVER (ORDER BY birth_date) AS rank FROM players) AS Ranked WHERE rank = 1
SELECT P.first_name, P.country_code FROM players P WHERE P.birth_date = (SELECT birth_date FROM players ORDER BY birth_date LIMIT 1)
SELECT first_name, last_name FROM players ORDER BY birth_date ASC, last_name COLLATE NOCASE, player_id
SELECT first_name || ' ' || last_name FROM players ORDER BY birth_date ASC, player_id ASC
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'left' ORDER BY birth_date ASC
SELECT P.first_name, P.country_code FROM players P WHERE EXISTS (SELECT 1 FROM rankings R WHERE R.player_id = P.player_id AND R.tours = (SELECT MAX(tours) FROM rankings))
SELECT P.first_name, P.country_code FROM players P WHERE EXISTS (SELECT 1 FROM rankings R WHERE R.player_id = P.player_id AND R.tours = (SELECT MAX(tours) FROM rankings))
SELECT year FROM matches GROUP BY year ORDER BY COUNT(year) DESC, MIN(year) ASC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(year) DESC, year ASC LIMIT 1
SELECT first_name, last_name, TOTAL(ranking_points) FROM players INNER JOIN matches ON players.player_id = matches.winner_id INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id HAVING COUNT(matches.winner_id) = (SELECT MAX(win_count) FROM (SELECT winner_id, COUNT(*) AS win_count FROM matches GROUP BY winner_id) AS subquery)
SELECT first_name, last_name, total_points FROM players JOIN (SELECT player_id, SUM(ranking_points) AS total_points FROM rankings GROUP BY player_id) AS rank_totals ON players.player_id = rank_totals.player_id WHERE players.player_id = (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT P.first_name, P.last_name FROM players P INNER JOIN matches M ON P.player_id = M.winner_id WHERE M.tourney_name = 'Australian Open' ORDER BY M.winner_rank_points DESC LIMIT 1
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id AND m.tourney_name = 'Australian Open' JOIN rankings r ON p.player_id = r.player_id ORDER BY r.ranking_points DESC LIMIT 1
SELECT m.loser_name, m.winner_name FROM matches m ORDER BY m.minutes DESC LIMIT 1
SELECT m.winner_name, m.loser_name FROM matches m ORDER BY m.minutes DESC LIMIT 1
SELECT players.first_name, players.player_id, AVG(rankings.ranking) FROM players, rankings WHERE players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name
SELECT p.first_name, p.player_id, AVG(COALESCE(r.ranking, 0)) AS avg_ranking FROM players p LEFT JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id
SELECT players.first_name, players.player_id, SUM(rankings.ranking_points) FROM players, rankings WHERE players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name
SELECT first_name, IFNULL(ranking_points, 0) AS total_points FROM players LEFT JOIN rankings ON players.player_id = rankings.player_id
SELECT p.country_code, COUNT(p.player_id) AS total_players FROM players p GROUP BY p.country_code
SELECT p.country_code, COUNT(p.player_id) FROM players p GROUP BY p.country_code
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) = (SELECT MAX(count) FROM (SELECT COUNT(player_id) AS count FROM players GROUP BY country_code) sub)
SELECT country_code FROM (SELECT country_code, COUNT(*) AS num_players FROM players GROUP BY country_code) AS T WHERE num_players = (SELECT MAX(num_players) FROM (SELECT COUNT(*) AS num_players FROM players GROUP BY country_code) AS subquery)
SELECT country_code, COUNT(*) AS total_players FROM players GROUP BY country_code HAVING total_players > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) > 50
SELECT r.ranking_date, SUM(r.tours) FROM rankings r GROUP BY r.ranking_date
SELECT r.ranking_date, SUM(r.tours) FROM rankings r GROUP BY r.ranking_date
SELECT year, COUNT(1) AS num_matches FROM matches GROUP BY year
SELECT year, COUNT(match_num) FROM matches GROUP BY year ORDER BY year
SELECT P.first_name, P.last_name, R.ranking FROM players AS P JOIN rankings AS R ON P.player_id = R.player_id WHERE P.player_id IN (SELECT winner_id FROM matches JOIN players ON matches.winner_id = players.player_id ORDER BY players.birth_date DESC LIMIT 3)
SELECT first_name, last_name, ranking FROM players p JOIN rankings r ON p.player_id = r.player_id JOIN matches m ON m.winner_id = p.player_id ORDER BY p.birth_date DESC LIMIT 3
SELECT COUNT(DISTINCT winner_id) FROM matches INNER JOIN players ON matches.winner_id = players.player_id WHERE tourney_name = 'WTA Championships' AND hand = 'L'
SELECT COUNT(DISTINCT winner_id) FROM matches JOIN players ON matches.winner_id = players.player_id WHERE players.hand = 'L' AND matches.tourney_name LIKE '%WTA Championships%'
SELECT p.first_name, p.country_code, p.birth_date FROM players p INNER JOIN (SELECT winner_id, MAX(ranking_points) AS max_rank FROM matches JOIN rankings ON matches.winner_id = rankings.player_id GROUP BY winner_id ORDER BY max_rank DESC LIMIT 1) sub ON p.player_id = sub.winner_id
SELECT p.first_name, p.country_code, p.birth_date FROM players p WHERE EXISTS (SELECT 1 FROM rankings r WHERE r.player_id = p.player_id AND r.ranking_points = (SELECT MAX(ranking_points) FROM rankings))
SELECT hand, COUNT(player_id) AS count_of_players FROM players GROUP BY hand
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT ship.name, ship.tonnage FROM ship ORDER BY UPPER(ship.name) DESC, ship.tonnage ASC
SELECT b.name, b.date, b.result FROM battle b
SELECT battle.id AS BattleID, MAX(death.killed) AS MaxDeathToll, MIN(death.killed) AS MinDeathToll FROM death LEFT JOIN ship ON death.caused_by_ship_id = ship.id LEFT JOIN battle ON ship.lost_in_battle = battle.id GROUP BY battle.id
SELECT AVG(injured) AS average_injuries FROM death
SELECT d.killed, d.injured FROM death d, ship s WHERE d.caused_by_ship_id = s.id AND s.tonnage = 't'
SELECT name, result FROM battle WHERE NOT bulgarian_commander = 'Boril'
SELECT DISTINCT battle.id, battle.name FROM battle INNER JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'Brig'
SELECT id, name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE id IN (SELECT caused_by_ship_id FROM death GROUP BY caused_by_ship_id HAVING SUM(killed) > 10))
SELECT T1.id, T1.name FROM ship AS T1 JOIN (SELECT caused_by_ship_id, SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id) AS T2 ON T1.id = T2.caused_by_ship_id WHERE T2.total_injuries = (SELECT MAX(total_injuries) FROM (SELECT SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id) AS T3)
SELECT DISTINCT b.name FROM battle b WHERE b.bulgarian_commander = 'Kaloyan' AND b.latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) AS NumberOfUniqueResults FROM battle
SELECT COUNT(battle.id) FROM battle WHERE battle.id NOT IN (SELECT ship.lost_in_battle FROM ship WHERE ship.tonnage = 225)
SELECT b.name, b.date FROM battle b WHERE EXISTS (SELECT NULL FROM ship s WHERE s.lost_in_battle = b.id AND s.name = 'Lettice') AND EXISTS (SELECT NULL FROM ship s WHERE s.lost_in_battle = b.id AND s.name = 'HMS Atalanta')
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE b.id NOT IN (SELECT s.lost_in_battle FROM ship s WHERE s.location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1 AS 'Address Line 1', line_2 AS 'Address Line 2' FROM Addresses
SELECT line_1, line_2 FROM Addresses WHERE line_1 IS NOT NULL AND line_2 IS NOT NULL
SELECT COUNT(DISTINCT course_id) AS TotalUniqueCourses FROM Courses
SELECT COUNT(*) AS CourseCount FROM Courses
SELECT Courses.course_description FROM Courses WHERE Courses.course_name = 'math'
SELECT course_description FROM Courses WHERE course_name LIKE '%math%' OR course_name LIKE '%Mathematics%'
SELECT Addresses.zip_postcode FROM Addresses WHERE Addresses.city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea' AND zip_postcode IS NOT NULL
SELECT D.department_id, D.department_name FROM Departments D WHERE (SELECT COUNT(*) FROM Degree_Programs DP WHERE DP.department_id = D.department_id) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Degree_Programs GROUP BY department_id) sub)
SELECT D.department_id, D.department_name FROM Departments D WHERE D.department_id IN (SELECT DP.department_id FROM Degree_Programs DP GROUP BY DP.department_id HAVING COUNT(DP.degree_program_id) = (SELECT MAX(C) FROM (SELECT COUNT(degree_program_id) AS C FROM Degree_Programs GROUP BY department_id) T))
SELECT COUNT(DISTINCT D.department_id) FROM Departments D WHERE EXISTS (SELECT department_id FROM Degree_Programs DP WHERE DP.department_id = D.department_id)
SELECT COUNT(DISTINCT department_id) FROM Departments WHERE department_id IN (SELECT department_id FROM Degree_Programs)
SELECT COUNT(*) FROM (SELECT DISTINCT degree_summary_name FROM Degree_Programs) AS unique_degrees
SELECT COUNT(degree_summary_name) FROM (SELECT DISTINCT degree_summary_name FROM Degree_Programs) AS unique_degrees
SELECT COUNT(DISTINCT Degree_Programs.degree_program_id) FROM Degree_Programs, Departments WHERE Degree_Programs.department_id = Departments.department_id AND Departments.department_name = 'engineering'
SELECT COUNT(DISTINCT Degree_Programs.degree_program_id) FROM Degree_Programs, Departments WHERE Degree_Programs.department_id = Departments.department_id AND Departments.department_name = 'engineering'
SELECT section_name AS 'Section Name', section_description AS 'Description' FROM Sections
SELECT section_name AS 'Section Name', section_description AS 'Description' FROM Sections
SELECT C.course_name, C.course_id FROM Courses C WHERE (SELECT COUNT(S.section_id) FROM Sections S WHERE S.course_id = C.course_id) <= 2
SELECT C.course_id, C.course_name FROM Courses C LEFT JOIN Sections S ON C.course_id = S.course_id GROUP BY C.course_id HAVING COUNT(S.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT S.semester_name, S.semester_id FROM Semesters S, Student_Enrolment SE WHERE S.semester_id = SE.semester_id GROUP BY S.semester_id, S.semester_name HAVING COUNT(SE.student_id) = (SELECT MAX(total) FROM (SELECT COUNT(student_id) AS total FROM Student_Enrolment GROUP BY semester_id) AS MaxEnrollments)
SELECT semester_name, semester_id FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment GROUP BY semester_id HAVING COUNT(student_id) = (SELECT MAX(c) FROM (SELECT COUNT(student_id) AS c FROM Student_Enrolment GROUP BY semester_id) AS counts))
SELECT department_description FROM Departments WHERE department_name LIKE '%the%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%' ESCAPE '\'
SELECT S.first_name, S.middle_name, S.last_name, S.student_id FROM Students S WHERE (SELECT COUNT(*) FROM Student_Enrolment WHERE student_id = S.student_id GROUP BY semester_id HAVING COUNT(degree_program_id) = 2) >= 1
SELECT S.student_id, S.first_name, S.middle_name, S.last_name FROM Students S WHERE S.student_id IN (SELECT SE.student_id FROM Student_Enrolment SE GROUP BY SE.student_id, SE.semester_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2)
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT Student_Enrolment.student_id FROM Student_Enrolment INNER JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelor')
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelors')
SELECT degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY degree_summary_name HAVING COUNT(Student_Enrolment.student_id) = (SELECT MAX(Count) FROM (SELECT COUNT(student_id) AS Count FROM Student_Enrolment GROUP BY degree_program_id) AS MaxCount)
SELECT degree_summary_name FROM Degree_Programs WHERE degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1)
SELECT D.degree_program_id, D.degree_summary_name FROM Degree_Programs D JOIN Student_Enrolment S ON D.degree_program_id = S.degree_program_id GROUP BY D.degree_program_id, D.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id HAVING COUNT(T2.student_id) = (SELECT MAX(student_count) FROM (SELECT COUNT(*) AS student_count FROM Student_Enrolment GROUP BY degree_program_id) AS subquery)
SELECT student_id, first_name, middle_name, last_name, num_enrollments FROM (SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name, COUNT(Student_Enrolment.student_id) AS num_enrollments, RANK() OVER (ORDER BY COUNT(Student_Enrolment.student_id) DESC) AS rank FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY Students.student_id) WHERE rank = 1
SELECT S.first_name, S.middle_name, S.last_name, S.student_id, COUNT(SE.student_id) AS total_enrollments FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY S.student_id ORDER BY total_enrollments DESC LIMIT 1
SELECT S.semester_name FROM Semesters S LEFT JOIN Student_Enrolment SE ON S.semester_id = SE.semester_id WHERE SE.semester_id IS NULL
SELECT S.semester_name FROM Semesters S LEFT JOIN Student_Enrolment SE ON S.semester_id = SE.semester_id WHERE SE.semester_id IS NULL
SELECT DISTINCT C.course_name FROM Courses C JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id
SELECT course_name FROM Courses c WHERE EXISTS (SELECT NULL FROM Student_Enrolment_Courses sec WHERE sec.course_id = c.course_id)
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses GROUP BY course_id HAVING COUNT(*) = (SELECT MAX(enrollment_count) FROM (SELECT course_id, COUNT(*) AS enrollment_count FROM Student_Enrolment_Courses GROUP BY course_id) AS subquery))
SELECT C.course_name FROM Courses C JOIN (SELECT course_id, COUNT(*) AS total FROM Student_Enrolment_Courses GROUP BY course_id) AS S ON C.course_id = S.course_id WHERE S.total = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM Student_Enrolment_Courses GROUP BY course_id) AS T)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT DISTINCT student_id FROM Student_Enrolment)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT DISTINCT student_id FROM Student_Enrolment)
SELECT T.transcript_id, T.transcript_date FROM Transcripts T INNER JOIN (SELECT transcript_id FROM Transcript_Contents GROUP BY transcript_id HAVING COUNT(student_course_id) >= 2) TC ON T.transcript_id = TC.transcript_id
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts T1 JOIN Transcript_Contents T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(DISTINCT T2.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward' AND cell_mobile_number IS NOT NULL
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE student_id = (SELECT student_id FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1)
SELECT first_name FROM Students WHERE permanent_address_id <> current_address_id
SELECT first_name FROM Students WHERE permanent_address_id <> current_address_id
SELECT address_id, line_1, line_2, line_3 FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students GROUP BY current_address_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT A.address_id, A.line_1, A.line_2 FROM Addresses A WHERE A.address_id = (SELECT address_id FROM (SELECT current_address_id AS address_id FROM Students UNION ALL SELECT permanent_address_id FROM Students) AS combined GROUP BY address_id ORDER BY COUNT(*) DESC, address_id ASC LIMIT 1)
SELECT AVG(CAST(SUBSTRING(CAST(transcript_date AS VARCHAR), 1, 4) AS INT)) FROM Transcripts
SELECT AVG(CAST(transcript_date AS TIMESTAMP)) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts WHERE transcript_date IN (SELECT MIN(transcript_date) FROM Transcripts)
SELECT * FROM Transcripts WHERE transcript_date = (SELECT MIN(T.transcript_date) FROM Transcripts T)
SELECT COUNT(*) AS TotalTranscripts FROM Transcripts
SELECT COUNT(transcript_id) FROM (SELECT transcript_id FROM Transcripts) AS transcript_ids
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(*) AS count FROM Transcript_Contents GROUP BY student_course_id ORDER BY count DESC LIMIT 1
SELECT student_enrolment_id, student_course_id FROM Student_Enrolment_Courses WHERE student_course_id IN (SELECT student_course_id FROM Transcript_Contents GROUP BY student_course_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(T.transcript_date) AS transcript_date, T.transcript_id FROM Transcripts T INNER JOIN (SELECT transcript_id, COUNT(*) AS num_courses FROM Transcript_Contents GROUP BY transcript_id) TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id HAVING TC.num_courses = (SELECT MIN(num_courses) FROM (SELECT COUNT(*) AS num_courses FROM Transcript_Contents GROUP BY transcript_id) sub) ORDER BY T.transcript_id ASC LIMIT 1
SELECT T.transcript_id, T.transcript_date FROM Transcripts T INNER JOIN (SELECT transcript_id, COUNT(*) AS num_results FROM Transcript_Contents GROUP BY transcript_id) TC ON T.transcript_id = TC.transcript_id WHERE TC.num_results = (SELECT MIN(num_results) FROM (SELECT COUNT(*) AS num_results FROM Transcript_Contents GROUP BY transcript_id) sub)
SELECT DISTINCT S.semester_name FROM Semesters S, Student_Enrolment SE, Degree_Programs DP WHERE S.semester_id = SE.semester_id AND SE.degree_program_id = DP.degree_program_id AND DP.degree_summary_name IN ('Master', 'Bachelor') GROUP BY S.semester_id HAVING COUNT(DISTINCT DP.degree_summary_name) = 2
SELECT DISTINCT S1.semester_id FROM Student_Enrolment S1 JOIN Degree_Programs D1 ON S1.degree_program_id = D1.degree_program_id WHERE D1.degree_summary_name LIKE '%Masters%' AND S1.semester_id IN (SELECT S2.semester_id FROM Student_Enrolment S2 JOIN Degree_Programs D2 ON S2.degree_program_id = D2.degree_program_id WHERE D2.degree_summary_name LIKE '%Bachelors%')
SELECT COUNT(DISTINCT S.current_address_id) FROM Students S
SELECT DISTINCT address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country FROM Addresses WHERE EXISTS (SELECT NULL FROM Students WHERE current_address_id = address_id OR permanent_address_id = address_id)
SELECT Students.* FROM Students ORDER BY last_name DESC, first_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC, student_id DESC
SELECT section_description FROM Sections WHERE section_name IN ('H')
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students, Addresses WHERE Students.permanent_address_id = Addresses.address_id AND (Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582')
SELECT first_name FROM Students, Addresses WHERE Students.permanent_address_id = Addresses.address_id AND (Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582')
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT * FROM Cartoon c WHERE c.Directed_by = 'Ben Jones'
SELECT c.Title FROM Cartoon c WHERE c.Directed_by = 'Ben Jones'
SELECT COUNT(*) AS Total FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(Title) AS NumberOfCartoons FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id ASC
SELECT Title AS Cartoon_Name, Directed_by AS Director FROM Cartoon ORDER BY Original_air_date ASC, id ASC
SELECT Title FROM Cartoon WHERE Directed_by IN (SELECT Directed_by FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti')
SELECT Title FROM Cartoon WHERE Directed_by IN (SELECT Directed_by FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti')
SELECT Country, COUNT(*) AS TotalChannels FROM TV_Channel GROUP BY Country HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM TV_Channel GROUP BY Country) AS SubQuery)
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country HAVING COUNT(*) = (SELECT MAX(ChannelCount) FROM (SELECT COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Country) AS SubQuery)
SELECT COUNT(DISTINCT series_name) AS SeriesNameCount, COUNT(DISTINCT Content) AS ContentCount FROM TV_Channel
SELECT COUNT(DISTINCT series_name) AS SeriesCount, COUNT(DISTINCT Content) AS ContentCount FROM TV_Channel
SELECT c.Content FROM TV_Channel AS c WHERE c.series_name = 'Sky Radio'
SELECT c.Content FROM TV_Channel AS c WHERE c.series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name IN ('Sky Radio')
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT T1.Language, T1.Channel_Count FROM (SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language) AS T1 WHERE T1.Channel_Count = (SELECT MIN(Channel_Count) FROM (SELECT COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language) AS T2)
SELECT Language, COUNT(id) AS ChannelCount FROM TV_Channel GROUP BY Language HAVING ChannelCount = (SELECT MIN(ChannelCount) FROM (SELECT COUNT(id) AS ChannelCount FROM TV_Channel GROUP BY Language) AS SubQuery)
SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language
SELECT COUNT(*), Language FROM TV_Channel GROUP BY Language
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Title = 'The Rise of the Blue Beetle!')
SELECT series_name FROM TV_Channel WHERE EXISTS (SELECT 1 FROM Cartoon WHERE Cartoon.Channel = TV_Channel.id AND Cartoon.Title = 'The Rise of the Blue Beetle')
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating ASC, id ASC
SELECT Episode FROM TV_series ORDER BY Rating, id
SELECT Episode, Rating FROM TV_series WHERE Rating IS NOT NULL ORDER BY Rating DESC, Episode LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share) AS Minimum_Share, MAX(Share) AS Maximum_Share FROM TV_series
SELECT MAX(Share) AS Max_Share, MIN(Share) AS Min_Share FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series AS t WHERE t.Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime' AND Weekly_Rank IS NOT NULL
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series WHERE Episode = 'A Love of a Lifetime')
SELECT series_name FROM TV_Channel WHERE EXISTS (SELECT 1 FROM TV_series WHERE TV_series.Channel = TV_Channel.id AND Episode = 'A Love of a Lifetime')
SELECT t.Episode FROM TV_series t INNER JOIN TV_Channel c ON t.Channel = c.id WHERE c.series_name = 'Sky Radio'
SELECT t.Episode FROM TV_series t INNER JOIN TV_Channel c ON t.Channel = c.id WHERE c.series_name = 'Sky Radio'
SELECT Directed_by, COUNT(*) AS TotalCartoons FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(id) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date IN (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Production_code, Channel FROM (SELECT Production_code, Channel, RANK() OVER (ORDER BY Original_air_date DESC) AS rk FROM Cartoon) AS Ranked WHERE rk = 1
SELECT T.Package_Option, T.series_name FROM TV_Channel AS T WHERE T.Hight_definition_TV = 'High definition TV'
SELECT series_name, Package_Option FROM TV_Channel WHERE Hight_definition_TV LIKE 'Yes'
SELECT DISTINCT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'
SELECT DISTINCT c.Country FROM TV_Channel c, Cartoon ct WHERE c.id = ct.Channel AND ct.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel EXCEPT SELECT Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel EXCEPT SELECT Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'
SELECT series_name, Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Michael Chang')
SELECT series_name, Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' AND Channel IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Michael Chang'))
SELECT Pixel_aspect_ratio_PAR AS PAR, Country AS Nation FROM TV_Channel WHERE Language NOT IN ('English')
SELECT Country, Pixel_aspect_ratio_PAR FROM TV_Channel WHERE Language <> 'English' AND Language IS NOT NULL
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel AS T1 WHERE (SELECT COUNT(*) FROM TV_Channel AS T2 WHERE T2.Country = T1.Country) > 2
SELECT T1.id FROM TV_Channel AS T1 WHERE T1.id NOT IN (SELECT T2.Channel FROM Cartoon AS T2 WHERE T2.Directed_by = 'Ben Jones')
SELECT T1.id FROM TV_Channel AS T1 WHERE T1.id NOT IN (SELECT T2.Channel FROM Cartoon AS T2 WHERE T2.Directed_by = 'Ben Jones')
SELECT T1.Package_Option FROM TV_Channel AS T1 WHERE NOT EXISTS (SELECT 1 FROM Cartoon AS T2 WHERE T2.Channel = T1.id AND T2.Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel AS T WHERE T.id NOT IN (SELECT C.Channel FROM Cartoon AS C WHERE C.Directed_by = 'Ben Jones')
SELECT COUNT(DISTINCT Poker_Player_ID) FROM poker_player
SELECT COUNT(DISTINCT Poker_Player_ID) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings, Poker_Player_ID FROM poker_player ORDER BY Earnings DESC, Poker_Player_ID
SELECT p.Final_Table_Made, p.Best_Finish FROM poker_player p
SELECT p.Final_Table_Made, p.Best_Finish FROM poker_player p
SELECT AVG(poker_player.Earnings) AS Average_Earnings FROM poker_player
SELECT AVG(poker_player.Earnings) AS Average_Earnings FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(p.Earnings) FROM poker_player p)
SELECT Money_Rank FROM poker_player AS pp WHERE pp.Earnings = (SELECT MAX(Earnings) FROM poker_player AS pp2)
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000 ORDER BY Final_Table_Made DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000 ORDER BY Final_Table_Made DESC LIMIT 1
SELECT Name FROM people p INNER JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.People_ID IS NOT NULL
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT P.Name FROM people P, poker_player PP WHERE P.People_ID = PP.People_ID ORDER BY PP.Final_Table_Made ASC, PP.Earnings DESC, PP.Poker_Player_ID ASC
SELECT people.Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Final_Table_Made, people.Name, poker_player.Poker_Player_ID
SELECT Birth_Date FROM people WHERE EXISTS (SELECT 1 FROM poker_player WHERE poker_player.People_ID = people.People_ID AND poker_player.Earnings = (SELECT MIN(Earnings) FROM poker_player))
SELECT Birth_Date FROM people WHERE EXISTS (SELECT 1 FROM poker_player WHERE People_ID = people.People_ID AND Earnings = (SELECT MIN(Earnings) FROM poker_player))
SELECT p.Money_Rank FROM poker_player p WHERE EXISTS (SELECT 1 FROM people pe WHERE p.People_ID = pe.People_ID AND pe.Height = (SELECT MAX(Height) FROM people))
SELECT pp.Money_Rank FROM poker_player pp WHERE EXISTS (SELECT 1 FROM people p WHERE p.People_ID = pp.People_ID AND p.Height = (SELECT MAX(Height) FROM people))
SELECT AVG(Earnings) AS AverageEarnings FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200
SELECT AVG(Earnings) AS AverageEarnings FROM poker_player INNER JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200
SELECT people.Name AS PlayerName FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Earnings DESC, people.Name ASC
SELECT people.Name FROM people INNER JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Earnings DESC, people.Name, poker_player.Poker_Player_ID
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT COUNT(*), Nationality FROM people GROUP BY Nationality
SELECT p.Nationality FROM people p GROUP BY p.Nationality ORDER BY COUNT(p.Nationality) DESC LIMIT 1
SELECT p.Nationality FROM people p GROUP BY p.Nationality HAVING COUNT(p.Nationality) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM people GROUP BY Nationality) AS counts)
SELECT DISTINCT Nationality FROM people WHERE Nationality IN (SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) > 1)
SELECT DISTINCT Nationality FROM people WHERE Nationality IN (SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) > 1)
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC
SELECT Name FROM people WHERE Nationality IS NOT 'Russia'
SELECT Name FROM people WHERE Nationality IS NOT 'Russia'
SELECT Name FROM people WHERE NOT EXISTS (SELECT 1 FROM poker_player WHERE poker_player.People_ID = people.People_ID)
SELECT p.Name FROM people p LEFT OUTER JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.People_ID IS NULL
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT p.Nationality) FROM people p
SELECT COUNT(state) FROM (SELECT DISTINCT state FROM AREA_CODE_STATE AS A)
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY 2 DESC
SELECT vote_id, phone_number, state FROM VOTES GROUP BY vote_id, phone_number, state
SELECT MAX(area_code) AS max_area_code, MIN(area_code) AS min_area_code FROM AREA_CODE_STATE
SELECT MAX(VOTES.created) AS LastCreatedDate FROM VOTES WHERE VOTES.state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name <> 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT contestant_number, contestant_name FROM CONTESTANTS WHERE contestant_number IN (SELECT contestant_number FROM VOTES GROUP BY contestant_number HAVING COUNT(vote_id) >= 2)
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS C JOIN VOTES V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number HAVING COUNT(*) = (SELECT MIN(vote_count) FROM (SELECT contestant_number, COUNT(*) AS vote_count FROM VOTES GROUP BY contestant_number) AS votes)
SELECT COUNT(vote_id) FROM VOTES WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES GROUP BY contestant_number)
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES GROUP BY state HAVING COUNT(*) = (SELECT MAX(vote_count) FROM (SELECT COUNT(*) AS vote_count FROM VOTES GROUP BY state) AS subquery))
SELECT V.created, V.state, V.phone_number FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling' AND state IN (SELECT state FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Kelly Clauss'))
SELECT contestant_name FROM CONTESTANTS WHERE INSTR(contestant_name, 'Al') > 0
SELECT c.Name FROM country AS c WHERE c.IndepYear > 1950
SELECT country.Name FROM country WHERE country.IndepYear > 1950 AND country.IndepYear IS NOT NULL
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE 'Republic'
SELECT COUNT(Code) FROM country WHERE GovernmentForm LIKE '%republic%'
SELECT SUM(country.SurfaceArea) FROM country WHERE country.Region = 'Caribbean'
SELECT SUM(country.SurfaceArea) FROM country WHERE country.Region = 'Caribbean'
SELECT DISTINCT Continent FROM country WHERE Name = 'Anguilla'
SELECT c.Continent FROM country c WHERE c.Name = 'Anguilla'
SELECT DISTINCT country.Region FROM country INNER JOIN city ON country.Code = city.CountryCode WHERE city.Name = 'Kabul'
SELECT DISTINCT country.Region FROM country INNER JOIN city ON country.Code = city.CountryCode WHERE city.Name = 'Kabul'
SELECT CL.Language FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code WHERE C.Name = 'Aruba' AND CL.Percentage IN (SELECT MAX(Percentage) FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code WHERE C.Name = 'Aruba')
SELECT DISTINCT Language FROM countrylanguage WHERE CountryCode IN (SELECT CountryCode FROM city WHERE Name = 'Aruba') AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name LIKE 'Brazil'
SELECT Population AS 'Population', LifeExpectancy AS 'Life Expectancy' FROM country WHERE Name = 'Brazil'
SELECT country.Region AS Region, country.Population AS Population FROM country WHERE country.Name = 'Angola'
SELECT Population, Region FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(c.LifeExpectancy) FROM country c WHERE c.Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT SUM(Population) TotalPopulation, MAX(GNP) MaxGNP FROM country WHERE Continent = 'Asia'
SELECT SUM(Population) AS PopulationSum, MAX(GNP) AS MaxGNP FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%' GROUP BY Continent, GovernmentForm
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(c.SurfaceArea) FROM country AS c WHERE c.Continent = 'Asia' OR c.Continent = 'Europe'
SELECT TOTAL(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District LIKE 'Gelderland'
SELECT AVG(GNP) AS Average_GNP, SUM(Population) AS Total_Population FROM country WHERE GovernmentForm = 'US territory'
SELECT AVG(GNP) AS Mean_GNP, SUM(Population) AS Total_Population FROM country WHERE GovernmentForm LIKE '%US territory%'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE Language IS NOT NULL
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE Language IS NOT NULL
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'
SELECT COUNT(Language) AS NumberOfLanguages FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'
SELECT COUNT(Language) AS OfficialLanguages FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Afghanistan' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage cl, country c WHERE cl.CountryCode = c.Code AND c.Name = 'Afghanistan' AND cl.IsOfficial = 'T'
SELECT c.Name FROM country c JOIN (SELECT CountryCode, COUNT(*) AS LangCount FROM countrylanguage GROUP BY CountryCode ORDER BY LangCount DESC LIMIT 1) AS sub ON c.Code = sub.CountryCode
SELECT c.Name FROM country c WHERE (SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE CountryCode = c.Code) = (SELECT MAX(num_languages) FROM (SELECT COUNT(DISTINCT Language) AS num_languages FROM countrylanguage GROUP BY CountryCode))
SELECT T1.Continent FROM (SELECT Continent, COUNT(DISTINCT Language) AS LanguageCount FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent) AS T1 WHERE T1.LanguageCount = (SELECT MAX(LanguageCount) FROM (SELECT Continent, COUNT(DISTINCT Language) AS LanguageCount FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent) AS T2)
WITH LanguageCounts AS (SELECT Continent, COUNT(DISTINCT Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent) SELECT Continent FROM LanguageCounts WHERE NumLanguages = (SELECT MAX(NumLanguages) FROM LanguageCounts)
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage cl1 WHERE cl1.Language = 'English' AND EXISTS (SELECT 1 FROM countrylanguage cl2 WHERE cl2.CountryCode = cl1.CountryCode AND cl2.Language = 'Dutch')
SELECT COUNT(DISTINCT a.CountryCode) FROM countrylanguage a JOIN countrylanguage b ON a.CountryCode = b.CountryCode WHERE a.Language = 'English' AND b.Language = 'Dutch'
SELECT c.Name FROM country c INNER JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode INNER JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'French'
SELECT c.Name FROM country c INNER JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode INNER JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'French'
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl1.IsOfficial = 'T' AND cl2.Language = 'French' AND cl2.IsOfficial = 'T'
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT COUNT(DISTINCT c.Continent) FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese'
SELECT COUNT(DISTINCT Continent) FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Chinese')
SELECT DISTINCT Region FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' OR Language = 'Dutch')
SELECT DISTINCT country.Region FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Dutch' UNION SELECT DISTINCT country.Region FROM country INNER JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English'
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE (Language = 'English' OR Language = 'Dutch') AND IsOfficial = 'T')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE (Language = 'English' OR Language = 'Dutch') AND IsOfficial = 'T')
SELECT CL.Language FROM countrylanguage AS CL INNER JOIN country AS C ON CL.CountryCode = C.Code WHERE C.Continent = 'Asia' AND CL.Percentage = (SELECT MAX(Percentage) FROM countrylanguage AS CL INNER JOIN country AS C ON CL.CountryCode = C.Code WHERE C.Continent = 'Asia')
SELECT T1.Language FROM (SELECT Language, COUNT(*) AS NumCountries FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language) AS T1 WHERE T1.NumCountries = (SELECT MAX(T2.NumCountries) FROM (SELECT COUNT(*) AS NumCountries FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language) AS T2)
SELECT CL.Language FROM countrylanguage AS CL INNER JOIN country AS C ON CL.CountryCode = C.Code WHERE C.GovernmentForm LIKE '%republic%' GROUP BY CL.Language HAVING COUNT(DISTINCT C.Code) = 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm LIKE '%Republic%') AND Language IN (SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(*) = 1)
SELECT Name, Population FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') ORDER BY Population DESC LIMIT 1 OFFSET 0
SELECT Name, Population FROM (SELECT Name, Population, RANK() OVER (ORDER BY Population DESC) AS rank FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')) WHERE rank = 1
SELECT c.Name, c.Population, c.LifeExpectancy FROM country c WHERE c.Continent = 'Asia' AND c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT c.Name, c.Population, c.LifeExpectancy FROM country c JOIN (SELECT MAX(SurfaceArea) AS MaxArea FROM country WHERE Continent = 'Asia') sub ON c.SurfaceArea = sub.MaxArea WHERE c.Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT AVG(LifeExpectancy) FROM country c WHERE NOT EXISTS (SELECT NULL FROM countrylanguage cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English' AND cl.IsOfficial = 'T')
SELECT SUM(Population) FROM country AS c WHERE NOT EXISTS (SELECT * FROM countrylanguage AS cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = '1'
SELECT Language FROM countrylanguage cl INNER JOIN country c ON cl.CountryCode = c.Code WHERE c.HeadOfState LIKE 'Beatrix' AND cl.IsOfficial = 'T'
SELECT COUNT(DISTINCT countrylanguage.Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.IsOfficial = 'T' AND country.IndepYear < 1930
SELECT COUNT(DISTINCT cl.Language) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE c.IndepYear < 1930 AND cl.IsOfficial = 'TRUE'
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(c.SurfaceArea) FROM country c WHERE c.Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe') AND Continent NOT IN ('Europe')
SELECT c1.Name FROM country AS c1 WHERE c1.Continent = 'Africa' AND c1.Population < (SELECT MIN(c2.Population) FROM country AS c2 WHERE c2.Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT Population FROM country WHERE Continent = 'Asia' ORDER BY Population LIMIT 1)
SELECT c.Name FROM country c WHERE c.Continent = 'Asia' AND c.Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country AS c1 WHERE Continent = 'Asia' AND NOT EXISTS (SELECT 1 FROM country AS c2 WHERE c2.Continent = 'Africa' AND c2.Population >= c1.Population)
SELECT DISTINCT c.Code FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English')
SELECT c.Code FROM country c WHERE NOT EXISTS (SELECT NULL FROM countrylanguage cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English')
SELECT c.Code FROM country c LEFT JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language <> 'English' OR cl.Language IS NULL GROUP BY c.Code
SELECT DISTINCT Code FROM country WHERE EXISTS (SELECT 1 FROM countrylanguage WHERE CountryCode = country.Code AND Language <> 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT Code FROM country WHERE GovernmentForm NOT LIKE '%Republic%' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT c.Name FROM city c WHERE EXISTS (SELECT * FROM country co WHERE co.Continent = 'Europe' AND co.Code = c.CountryCode AND NOT EXISTS (SELECT * FROM countrylanguage cl WHERE cl.CountryCode = co.Code AND cl.Language = 'English' AND cl.IsOfficial = 'T'))
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe') EXCEPT SELECT Name FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT DISTINCT c.Name, c.Population FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT DISTINCT c.Name FROM city AS c, country AS co, countrylanguage AS cl WHERE c.CountryCode = co.Code AND co.Code = cl.CountryCode AND co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country GROUP BY Population)
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country GROUP BY Population)
SELECT Name, Population, HeadOfState FROM country c1 WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country c2)
SELECT country.Name, country.Population, country.HeadOfState FROM country WHERE country.SurfaceArea = (SELECT MAX(country.SurfaceArea) FROM country)
SELECT country.Name, COUNT(DISTINCT countrylanguage.Language) AS TotalLanguages FROM country, countrylanguage WHERE country.Code = countrylanguage.CountryCode GROUP BY country.Name HAVING COUNT(DISTINCT countrylanguage.Language) >= 3
SELECT c.Name, COUNT(*) AS LanguageCount FROM country c INNER JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(*) > 2
SELECT district, COUNT(ID) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT c.GovernmentForm, SUM(c.Population) FROM country c WHERE c.GovernmentForm IN (SELECT GovernmentForm FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72) GROUP BY c.GovernmentForm
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExp, SUM(Population) AS SumPopulation FROM country GROUP BY Continent HAVING AvgLifeExp < 72
SELECT c.Continent, SUM(c.Population) AS TotalPopulation, AVG(c.LifeExpectancy) AS AverageLifeExpectancy FROM country AS c GROUP BY c.Continent HAVING AVG(c.LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY Name, Code LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC, Population DESC, Code ASC LIMIT 5;
SELECT Name FROM (SELECT Name, Code, Population FROM country ORDER BY Population DESC LIMIT 3) AS top_countries ORDER BY Name ASC, Code ASC
SELECT Name FROM country ORDER BY Population DESC, Name, Code LIMIT 3
SELECT Name FROM country WHERE Population IN (SELECT Population FROM country ORDER BY Population ASC LIMIT 3) ORDER BY Name ASC, Code ASC
SELECT Name FROM country ORDER BY Population ASC, Name, Code LIMIT 3
SELECT COUNT(*) AS CountryCount FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) AS CountryCount FROM country WHERE Continent = 'Asia'
SELECT country.Name FROM country WHERE country.Continent = 'Europe' AND country.Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000 LIMIT 100
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000 GROUP BY Continent HAVING AVG(SurfaceArea) > 0
SELECT SUM(Population) TotalPopulation, AVG(SurfaceArea) AverageSurfaceArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT c.Name FROM city c WHERE c.Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population >= 160000 AND Population <= 900000
SELECT Language FROM (SELECT Language, RANK() OVER (ORDER BY COUNT(DISTINCT CountryCode) DESC) AS rank FROM countrylanguage GROUP BY Language) sub WHERE rank = 1
SELECT Language FROM (SELECT Language, COUNT(*) AS NumCountries FROM countrylanguage GROUP BY Language) AS LangCount WHERE NumCountries = (SELECT MAX(NumCountries) FROM (SELECT COUNT(*) AS NumCountries FROM countrylanguage GROUP BY Language))
SELECT CL.Language, CL.Percentage, CL.CountryCode, C.Name FROM countrylanguage CL, country C WHERE CL.CountryCode = C.Code AND (CL.CountryCode, CL.Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode)
SELECT c.Code, l.Language FROM country c, countrylanguage l WHERE c.Code = l.CountryCode AND (l.CountryCode, l.Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode)
SELECT COUNT(DISTINCT country.Code) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code);
SELECT COUNT(DISTINCT c.Code) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Spanish' AND cl.IsOfficial = 'T'
SELECT Code FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode, Language HAVING Language = 'Spanish' AND MAX(Percentage) = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish'))
SELECT DISTINCT country.Code FROM country, countrylanguage WHERE country.Code = countrylanguage.CountryCode AND countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(*) AS Total FROM conductor WHERE Conductor_ID IS NOT NULL
SELECT COUNT(1) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC, Conductor_ID ASC
SELECT c.Name FROM conductor c ORDER BY c.Age, c.Conductor_ID
SELECT Name FROM conductor WHERE Nationality NOT IN ('USA')
SELECT Name FROM conductor WHERE Nationality NOT IN ('USA')
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID ASC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID ASC
SELECT AVG(Attendance) AS AvgAttendance FROM show
SELECT AVG(Attendance) AS AvgAttendance FROM show
SELECT MAX(Share) AS Maximum_Share, MIN(Share) AS Minimum_Share FROM performance WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT COUNT(DISTINCT Nationality) AS total_nationalities FROM conductor
SELECT COUNT(DISTINCT Nationality) AS count_of_nationalities FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM (SELECT Name, Year_of_Work, RANK() OVER (ORDER BY Year_of_Work DESC) as rank FROM conductor) WHERE rank = 1
SELECT Name, Orchestra FROM conductor, orchestra WHERE conductor.Conductor_ID = orchestra.Conductor_ID
SELECT Name, Orchestra FROM conductor JOIN orchestra USING (Conductor_ID)
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT DISTINCT c.Name FROM conductor c, orchestra o WHERE c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT c.Name FROM conductor c INNER JOIN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(*) = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(*) AS num_orchestras FROM orchestra GROUP BY Conductor_ID) AS counts)) o ON c.Conductor_ID = o.Conductor_ID
SELECT c.Name FROM conductor c WHERE EXISTS (SELECT 1 FROM orchestra o WHERE o.Conductor_ID = c.Conductor_ID GROUP BY o.Conductor_ID HAVING COUNT(*) = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(*) AS num_orchestras FROM orchestra GROUP BY Conductor_ID) sub))
SELECT DISTINCT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra WHERE Year_of_Founded > 2008)
SELECT Name FROM conductor WHERE EXISTS (SELECT 1 FROM orchestra WHERE Conductor_ID = conductor.Conductor_ID AND Year_of_Founded > 2008)
SELECT Record_Company, COUNT(Orchestra_ID) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) AS Orchestra_Count FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format, COUNT(Orchestra) AS Count FROM orchestra GROUP BY Major_Record_Format ORDER BY Count ASC, Major_Record_Format ASC
SELECT Major_Record_Format, COUNT(Orchestra_ID) AS Frequency, Orchestra_ID FROM orchestra GROUP BY Major_Record_Format, Orchestra_ID ORDER BY Frequency DESC, Major_Record_Format, Orchestra_ID
SELECT Record_Company FROM (SELECT Record_Company, COUNT(Orchestra_ID) AS OrchestraCount FROM orchestra GROUP BY Record_Company) AS SubQuery WHERE OrchestraCount = (SELECT MAX(OrchestraCount) FROM (SELECT COUNT(Orchestra_ID) AS OrchestraCount FROM orchestra GROUP BY Record_Company) AS SubQuery2)
SELECT Record_Company FROM orchestra GROUP BY Record_Company HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM orchestra GROUP BY Record_Company) tmp)
SELECT o.Orchestra FROM orchestra o WHERE NOT EXISTS (SELECT 1 FROM performance p WHERE p.Orchestra_ID = o.Orchestra_ID)
SELECT o.Orchestra FROM orchestra o WHERE NOT EXISTS (SELECT 1 FROM performance p WHERE p.Orchestra_ID = o.Orchestra_ID)
SELECT DISTINCT o.Record_Company FROM orchestra o WHERE EXISTS (SELECT 1 FROM orchestra WHERE Record_Company = o.Record_Company AND Year_of_Founded < 2003) AND EXISTS (SELECT 1 FROM orchestra WHERE Record_Company = o.Record_Company AND Year_of_Founded > 2003)
SELECT DISTINCT o1.Record_Company FROM orchestra o1 JOIN orchestra o2 ON o1.Record_Company = o2.Record_Company WHERE o1.Year_of_Founded < 2003 AND o2.Year_of_Founded > 2003
SELECT COUNT(DISTINCT Orchestra_ID) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'
SELECT COUNT(DISTINCT Orchestra_ID) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT DISTINCT o.Year_of_Founded FROM orchestra o INNER JOIN performance p ON o.Orchestra_ID = p.Orchestra_ID GROUP BY o.Orchestra_ID, o.Year_of_Founded HAVING COUNT(p.Performance_ID) > 1
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(Performance_ID) > 1)
SELECT COUNT(*) FROM Highschooler WHERE ID IS NOT NULL
SELECT COUNT(*) FROM Highschooler WHERE ID IS NOT NULL
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT DISTINCT(Highschooler.grade) FROM Highschooler
SELECT DISTINCT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT h.grade FROM Highschooler h WHERE h.name LIKE 'Kyle'
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.grade = 10
SELECT Highschooler.name FROM Highschooler WHERE Highschooler.grade = 10
SELECT h.ID FROM Highschooler h WHERE h.name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle' AND grade IS NOT NULL
SELECT COUNT(*) FROM Highschooler WHERE grade IN (SELECT DISTINCT grade FROM Highschooler WHERE grade BETWEEN 9 AND 10)
SELECT COUNT(*) AS NumberOfStudents FROM Highschooler WHERE grade BETWEEN 9 AND 10
SELECT grade, COUNT(*) AS count FROM Highschooler GROUP BY grade
SELECT Highschooler.grade, COUNT(Highschooler.ID) AS NumberOfStudents FROM Highschooler GROUP BY Highschooler.grade
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) = (SELECT MAX(count) FROM (SELECT COUNT(ID) AS count FROM Highschooler GROUP BY grade) AS counts)
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) = (SELECT COUNT(ID) FROM Highschooler GROUP BY grade ORDER BY COUNT(ID) DESC LIMIT 1)
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT Highschooler.ID, SUM(CASE WHEN Friend.student_id = Highschooler.ID THEN 1 ELSE 0 END) + SUM(CASE WHEN Friend.friend_id = Highschooler.ID THEN 1 ELSE 0 END) AS total_friends FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id GROUP BY Highschooler.ID
SELECT H.ID, COUNT(DISTINCT CASE WHEN F.student_id = H.ID THEN F.friend_id ELSE F.student_id END) AS total_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id OR H.ID = F.friend_id GROUP BY H.ID
SELECT Highschooler.name AS student_name, COUNT(Friend.friend_id) AS number_of_friends FROM Highschooler LEFT JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.name
SELECT h.name, (SELECT COUNT(*) FROM Friend f WHERE f.student_id = h.ID) AS num_of_friends FROM Highschooler h
SELECT H.name FROM Highschooler H WHERE H.ID = (SELECT ID FROM (SELECT student_id AS ID FROM Friend UNION ALL SELECT friend_id AS ID FROM Friend) F GROUP BY ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT H.name FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F GROUP BY F.student_id HAVING COUNT(F.friend_id) = (SELECT MAX(num_friends) FROM (SELECT student_id, COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id) F))
SELECT DISTINCT H.name FROM Highschooler H, Friend F WHERE H.ID = F.student_id OR H.ID = F.friend_id GROUP BY H.ID HAVING COUNT(*) >= 3
SELECT H.name FROM Highschooler H JOIN (SELECT student_id FROM Friend UNION ALL SELECT friend_id FROM Friend) F ON H.ID = F.student_id GROUP BY H.ID HAVING COUNT(F.student_id) >= 3
SELECT Highschooler.ID AS 'Student ID', Friend_Highschooler.name AS 'Friend Name' FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id JOIN Highschooler AS Friend_Highschooler ON Friend.friend_id = Friend_Highschooler.ID WHERE Highschooler.name = 'Kyle'
SELECT hs.ID, friend.name FROM Highschooler hs JOIN Friend ON hs.ID = Friend.student_id JOIN Highschooler friend ON Friend.friend_id = friend.ID WHERE hs.name = 'Kyle'
SELECT h.ID, COUNT(f.friend_id) FROM Highschooler h LEFT JOIN Friend f ON h.ID = f.student_id WHERE h.name = 'Kyle' GROUP BY h.ID
SELECT ID, (SELECT COUNT(*) FROM Friend WHERE student_id = Highschooler.ID) AS Friends FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend
SELECT H.name FROM Highschooler H WHERE H.ID NOT IN (SELECT F.student_id FROM Friend F UNION SELECT F.friend_id FROM Friend F)
SELECT H.name FROM Highschooler H WHERE NOT EXISTS (SELECT 1 FROM Friend F WHERE F.student_id = H.ID OR F.friend_id = H.ID)
SELECT DISTINCT F.student_id FROM Friend F, Likes L WHERE F.student_id = L.liked_id
SELECT ID FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes)
SELECT name FROM Highschooler WHERE EXISTS (SELECT 1 FROM Friend WHERE student_id = Highschooler.ID) AND EXISTS (SELECT 1 FROM Likes WHERE liked_id = Highschooler.ID)
SELECT H.name FROM Highschooler H INNER JOIN Friend F ON H.ID = F.student_id INNER JOIN Likes L ON H.ID = L.liked_id
SELECT ID, (SELECT COUNT(*) FROM Likes WHERE student_id = H.ID) + (SELECT COUNT(*) FROM Likes WHERE liked_id = H.ID) AS total_likes FROM Highschooler H
SELECT ID, SUM(CASE WHEN student_id = ID THEN 1 ELSE 0 END) AS likes_given, SUM(CASE WHEN liked_id = ID THEN 1 ELSE 0 END) AS likes_received FROM Highschooler LEFT JOIN Likes ON ID = student_id OR ID = liked_id GROUP BY ID
SELECT H.name, (SELECT COUNT(*) FROM Likes WHERE student_id = H.ID) AS likes_given, (SELECT COUNT(*) FROM Likes WHERE liked_id = H.ID) AS likes_received FROM Highschooler H
SELECT H.name, IFNULL(LG.likes_given, 0) AS likes_given, IFNULL(LR.likes_received, 0) AS likes_received FROM Highschooler H LEFT JOIN (SELECT student_id, COUNT(*) AS likes_given FROM Likes GROUP BY student_id) LG ON H.ID = LG.student_id LEFT JOIN (SELECT liked_id, COUNT(*) AS likes_received FROM Likes GROUP BY liked_id) LR ON H.ID = LR.liked_id
SELECT H.name FROM Highschooler H INNER JOIN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) = (SELECT MAX(like_count) FROM (SELECT COUNT(*) AS like_count FROM Likes GROUP BY liked_id) AS subquery)) AS MostLiked ON H.ID = MostLiked.liked_id
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.ID, H.name HAVING COUNT(*) = (SELECT MAX(like_count) FROM (SELECT COUNT(*) AS like_count FROM Likes GROUP BY liked_id) AS subquery)
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) >= 2)
SELECT H.name FROM Highschooler H WHERE H.ID IN (SELECT L.liked_id FROM Likes L GROUP BY L.liked_id HAVING COUNT(*) >= 2)
SELECT H.name FROM Highschooler H WHERE H.grade > 5 AND (SELECT COUNT(*) FROM Friend WHERE student_id = H.ID OR friend_id = H.ID) >= 2
SELECT H.name FROM Highschooler H WHERE H.grade > 5 AND H.ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(*) >= 2 UNION ALL SELECT friend_id FROM Friend GROUP BY friend_id HAVING COUNT(*) >= 2)
SELECT ID, (SELECT COUNT(*) FROM Likes WHERE liked_id = Highschooler.ID) AS likes_count FROM Highschooler WHERE name = 'Kyle'
SELECT H.ID, COUNT(L.liked_id) AS likes_count FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT DISTINCT student_id FROM Friend UNION SELECT DISTINCT friend_id FROM Friend)
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT DISTINCT student_id FROM Friend UNION SELECT DISTINCT friend_id FROM Friend)
SELECT MIN(H.grade) FROM Highschooler H WHERE NOT EXISTS (SELECT 1 FROM Friend F WHERE F.student_id = H.ID OR F.friend_id = H.ID)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT state FROM Owners INTERSECT SELECT state FROM Professionals
SELECT AVG(D.age) FROM Dogs D WHERE D.dog_id IN (SELECT T.dog_id FROM Treatments T)
SELECT AVG(age) FROM Dogs WHERE EXISTS (SELECT 1 FROM Treatments WHERE Treatments.dog_id = Dogs.dog_id)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_id) > 2
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals P LEFT JOIN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2) T ON P.professional_id = T.professional_id WHERE P.state = 'Indiana' OR T.professional_id IS NOT NULL
SELECT Dogs.name FROM Dogs LEFT JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Dogs.dog_id HAVING COALESCE(SUM(Treatments.cost_of_treatment), 0) <= 1000
SELECT D.name FROM Dogs D WHERE D.dog_id NOT IN (SELECT T.dog_id FROM Treatments T GROUP BY T.dog_id HAVING SUM(T.cost_of_treatment) > 1000)
WITH HumanNames AS (SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners) SELECT first_name FROM HumanNames WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT first_name FROM (SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners) AS all_names WHERE NOT EXISTS (SELECT 1 FROM Dogs WHERE name = all_names.first_name)
SELECT DISTINCT P.professional_id, P.role_code, P.email_address FROM Professionals P WHERE P.professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
WITH DogCounts AS (SELECT owner_id, COUNT(*) AS count FROM Dogs GROUP BY owner_id), MaxCount AS (SELECT MAX(count) AS max_count FROM DogCounts) SELECT O.owner_id, O.first_name, O.last_name FROM Owners O JOIN DogCounts DC ON O.owner_id = DC.owner_id JOIN MaxCount MC ON DC.count = MC.max_count
SELECT O.owner_id, O.first_name, O.last_name FROM Owners O JOIN (SELECT owner_id, COUNT(*) AS dog_count FROM Dogs GROUP BY owner_id) D ON O.owner_id = D.owner_id WHERE D.dog_count = (SELECT MAX(dog_count) FROM (SELECT COUNT(*) AS dog_count FROM Dogs GROUP BY owner_id) T)
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals P INNER JOIN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) >= 2) AS T ON P.professional_id = T.professional_id
SELECT DISTINCT P.professional_id, P.role_code, P.first_name FROM Professionals P, Treatments T WHERE P.professional_id = T.professional_id GROUP BY P.professional_id, P.role_code, P.first_name HAVING COUNT(T.treatment_id) >= 2
SELECT B.breed_name FROM Breeds B WHERE B.breed_code = (SELECT D.breed_code FROM Dogs D GROUP BY D.breed_code ORDER BY COUNT(*) DESC LIMIT 1)
WITH DogCounts AS (SELECT breed_code, COUNT(*) AS NumDogs FROM Dogs GROUP BY breed_code), MaxCount AS (SELECT MAX(NumDogs) AS MaxNum FROM DogCounts) SELECT B.breed_name FROM Breeds B JOIN DogCounts D ON B.breed_code = D.breed_code WHERE D.NumDogs = (SELECT MaxNum FROM MaxCount)
WITH TreatmentCounts AS (SELECT O.owner_id, O.last_name, COUNT(T.treatment_id) AS num_treatments FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name) SELECT owner_id, last_name FROM TreatmentCounts WHERE num_treatments = (SELECT MAX(num_treatments) FROM TreatmentCounts)
SELECT O.owner_id, O.last_name FROM Owners O WHERE EXISTS (SELECT 1 FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE D.owner_id = O.owner_id GROUP BY D.owner_id HAVING SUM(T.cost_of_treatment) = (SELECT MAX(total_cost) FROM (SELECT owner_id, SUM(cost_of_treatment) AS total_cost FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY owner_id) AS Costs))
SELECT treatment_type_description FROM Treatment_Types WHERE treatment_type_code IN (SELECT treatment_type_code FROM Treatments GROUP BY treatment_type_code HAVING SUM(cost_of_treatment) = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) AS Sub))
SELECT treatment_type_description FROM Treatment_Types WHERE treatment_type_code = (SELECT treatment_type_code FROM Treatments GROUP BY treatment_type_code ORDER BY SUM(cost_of_treatment) ASC LIMIT 1)
SELECT O.owner_id, O.zip_code FROM Owners O WHERE O.owner_id = (SELECT D.owner_id FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.owner_id ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1)
SELECT O.owner_id, O.zip_code FROM Owners O, (SELECT owner_id, SUM(cost_of_treatment) AS total_spent FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY owner_id) AS Spending WHERE O.owner_id = Spending.owner_id AND Spending.total_spent = (SELECT MAX(total_spent) FROM (SELECT owner_id, SUM(cost_of_treatment) AS total_spent FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY owner_id) AS TotalSpending)
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) > 1)
SELECT P.first_name, P.last_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) GROUP BY professional_id)
SELECT t.date_of_treatment, p.first_name FROM Treatments t INNER JOIN Professionals p ON t.professional_id = p.professional_id
SELECT t.date_of_treatment, p.first_name FROM Treatments t JOIN Professionals p ON t.professional_id = p.professional_id
SELECT cost_of_treatment AS TreatmentCost, treatment_type_description AS Description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM Treatments CROSS JOIN Treatment_Types USING(treatment_type_code)
SELECT DISTINCT O.first_name, O.last_name, S.size_description FROM Owners O, Dogs D, Sizes S WHERE O.owner_id = D.owner_id AND D.size_code = S.size_code ORDER BY O.first_name, O.last_name, S.size_description
SELECT O.first_name, O.last_name, S.size_description FROM Owners O CROSS JOIN Dogs D ON O.owner_id = D.owner_id CROSS JOIN Sizes S ON D.size_code = S.size_code
SELECT O.first_name, D.name FROM Owners AS O, Dogs AS D WHERE O.owner_id = D.owner_id
SELECT O.first_name AS OwnerFirstName, D.name AS DogName FROM Owners O, Dogs D WHERE O.owner_id = D.owner_id
SELECT name, date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code IN (SELECT breed_code FROM (SELECT breed_code, COUNT(*) as count FROM Dogs GROUP BY breed_code ORDER BY count) WHERE count = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Dogs GROUP BY breed_code)))
SELECT name, date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code IN (SELECT breed_code FROM (SELECT breed_code, COUNT(*) AS cnt FROM Dogs GROUP BY breed_code ORDER BY cnt ASC) AS subquery WHERE cnt = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM Dogs GROUP BY breed_code) AS subquery2))
SELECT O.first_name AS OwnerFirstName, D.name AS DogName FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'VA'
SELECT first_name, name FROM Owners INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE state = 'Virginia'
SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT DISTINCT dog_id FROM Treatments)
SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT DISTINCT dog_id FROM Treatments)
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE date_of_birth = (SELECT MAX(date_of_birth) FROM Dogs GROUP BY owner_id))
SELECT O.last_name FROM Owners O INNER JOIN Dogs D ON O.owner_id = D.owner_id WHERE D.date_of_birth = (SELECT MAX(date_of_birth) FROM Dogs GROUP BY date_of_birth)
SELECT DISTINCT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state LIKE 'Hawaii' OR state LIKE 'Wisconsin'
SELECT date_arrived, date_departed FROM Dogs WHERE date_departed IS NOT NULL
SELECT `date_arrived`, `date_departed` FROM `Dogs`
SELECT COUNT(DISTINCT Dogs.dog_id) FROM Dogs INNER JOIN Treatments ON Dogs.dog_id = Treatments.dog_id
SELECT COUNT(*) FROM (SELECT dog_id FROM Treatments GROUP BY dog_id) AS TreatedDogs
SELECT COUNT(DISTINCT T1.professional_id) FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id
SELECT COUNT(DISTINCT pro_id) FROM (SELECT professional_id AS pro_id FROM Treatments) AS subquery
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%' ORDER BY state, city
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT O.first_name, O.last_name, O.email_address FROM Owners O WHERE O.state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE LOWER(state) LIKE LOWER('%North%')
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT MAX(T.cost_of_treatment) FROM Treatments T JOIN (SELECT MAX(date_of_treatment) AS MaxDate FROM Treatments) M ON T.date_of_treatment = M.MaxDate
SELECT cost_of_treatment FROM Treatments WHERE date_of_treatment IN (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT COUNT(*) FROM Dogs d WHERE d.dog_id NOT IN (SELECT DISTINCT t.dog_id FROM Treatments t WHERE t.dog_id IS NOT NULL)
SELECT COUNT(*) FROM Dogs d LEFT JOIN Treatments t ON d.dog_id = t.dog_id WHERE t.dog_id IS NULL
SELECT COUNT(DISTINCT o.owner_id) FROM Owners o WHERE NOT EXISTS (SELECT 1 FROM Dogs d WHERE d.owner_id = o.owner_id);
SELECT COUNT(DISTINCT O.owner_id) FROM Owners O LEFT JOIN Dogs D ON O.owner_id = D.owner_id WHERE D.owner_id IS NULL OR D.abandoned_yn = 'N'
SELECT COUNT(professional_id) FROM Professionals WHERE NOT EXISTS (SELECT NULL FROM Treatments WHERE Treatments.professional_id = Professionals.professional_id)
SELECT COUNT(professional_id) FROM Professionals WHERE NOT EXISTS (SELECT NULL FROM Treatments WHERE Treatments.professional_id = Professionals.professional_id)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 'true'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1
SELECT AVG(Dogs.age) AS avg_age FROM Dogs
SELECT AVG(age) AS AvgAge FROM Dogs
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1
SELECT MAX(age) AS MaximumAge FROM Dogs GROUP BY age ORDER BY age DESC LIMIT 1
SELECT C.charge_type, C.charge_amount FROM Charges C
SELECT c.charge_type, c.charge_amount FROM Charges AS c
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT p.email_address, p.cell_number, p.home_phone FROM Professionals p
SELECT email_address AS Email, cell_number AS CellPhone, home_phone AS HomePhone FROM Professionals
SELECT DISTINCT B.breed_name, S.size_description FROM Breeds B, Sizes S, Dogs D WHERE B.breed_code = D.breed_code AND S.size_code = D.size_code
SELECT DISTINCT breed_name AS BreedType, size_description AS SizeType FROM Breeds, Sizes, Dogs WHERE Breeds.breed_code = Dogs.breed_code AND Sizes.size_code = Dogs.size_code
SELECT first_name, treatment_type_description FROM Professionals INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id INNER JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT first_name, treatment_type_description FROM Professionals INNER JOIN Treatments ON Professionals.professional_id = Treatments.professional_id INNER JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Singer_ID
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship NOT IN ('France')
SELECT Name FROM singer WHERE Citizenship <> 'French'
SELECT s.Name FROM singer s WHERE s.Birth_Year IN (1948, 1949)
SELECT s.Name FROM singer s WHERE s.Birth_Year = 1948 OR s.Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM (SELECT Name, RANK() OVER (ORDER BY Net_Worth_Millions DESC) AS rank FROM singer) WHERE rank = 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) AS SingerCount FROM singer GROUP BY Citizenship
WITH Citizenship_Frequencies AS (SELECT Citizenship, COUNT(*) AS Frequency FROM singer GROUP BY Citizenship) SELECT Citizenship FROM Citizenship_Frequencies WHERE Frequency = (SELECT MAX(Frequency) FROM Citizenship_Frequencies)
SELECT s.Citizenship, COUNT(*) AS Total FROM singer s GROUP BY s.Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) AS Highest_Net_Worth FROM singer GROUP BY Citizenship ORDER BY MAX(Net_Worth_Millions) DESC
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship ORDER BY MAX(Net_Worth_Millions) DESC
SELECT song.Title, singer.Name FROM song LEFT JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.Title, singer.Name FROM song LEFT JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT s.Name FROM singer s, song sg WHERE s.Singer_ID = sg.Singer_ID AND sg.Sales > 300000
SELECT DISTINCT s.Name FROM singer s, song sg WHERE s.Singer_ID = sg.Singer_ID AND sg.Sales > 300000
SELECT s.Name FROM singer s WHERE (SELECT COUNT(*) FROM song sg WHERE sg.Singer_ID = s.Singer_ID) > 1
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song GROUP BY Singer_ID HAVING COUNT(*) > 1)
SELECT Name, Total_Sales FROM (SELECT singer.Name, SUM(song.Sales) AS Total_Sales FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Name) AS Sales_Info
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Singer_ID, s.Name
SELECT s.Name FROM singer s LEFT OUTER JOIN song sg ON s.Singer_ID = sg.Singer_ID WHERE sg.Singer_ID IS NULL
SELECT s.Name FROM singer s WHERE s.Singer_ID NOT IN (SELECT sg.Singer_ID FROM song sg)
SELECT DISTINCT s1.Citizenship FROM singer s1 JOIN singer s2 ON s1.Citizenship = s2.Citizenship WHERE s1.Birth_Year < 1945 AND s2.Birth_Year > 1955
SELECT DISTINCT s1.Citizenship FROM singer s1 JOIN singer s2 ON s1.Citizenship = s2.Citizenship WHERE s1.Birth_Year < 1945 AND s2.Birth_Year > 1955
SELECT COUNT(1) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types, Other_Available_Features WHERE Ref_Feature_Types.feature_type_code = Other_Available_Features.feature_type_code AND Other_Available_Features.feature_name = 'AirCon'
SELECT R.property_type_description FROM Ref_Property_Types R JOIN Properties P ON R.property_type_code = P.property_type_code
SELECT property_name FROM Properties WHERE property_type_code IN ('HSE', 'APT') AND room_count > 1
