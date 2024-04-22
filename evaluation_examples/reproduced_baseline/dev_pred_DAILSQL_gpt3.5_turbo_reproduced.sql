SELECT count(*) FROM singer 
SELECT count(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'
SELECT avg(Age) , min(Age) , max(Age) FROM singer WHERE Country = 'France'
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT min(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)
SELECT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(Capacity), avg(Capacity) FROM stadium
SELECT avg(capacity), max(capacity) FROM stadium 
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium);
SELECT Name, Capacity FROM stadium WHERE Stadium_ID = (SELECT Stadium_ID FROM concert GROUP BY Stadium_ID ORDER BY AVG(Event_Attendance) DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Year = '2014' OR Year = '2015'
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT s.Name, COUNT(c.concert_ID) FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name
SELECT s.Name, COUNT(c.concert_ID) FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name
SELECT stadium.Name, stadium.Capacity FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID WHERE concert.Year >= 2014 GROUP BY stadium.Stadium_ID ORDER BY COUNT(concert.concert_ID) DESC LIMIT 1;
SELECT Name, Capacity FROM stadium WHERE Stadium_ID IN ( SELECT Stadium_ID FROM concert WHERE Year > 2013 GROUP BY Stadium_ID ORDER BY count(*) DESC LIMIT 1 )
SELECT Year FROM Concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium EXCEPT SELECT T1.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014'
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT concert_Name, Theme, COUNT(Singer_ID) as Number_of_Singers FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID, concert_Name, Theme
SELECT C.concert_Name, C.Theme, COUNT(SI.Singer_ID) FROM concert C JOIN singer_in_concert SI ON C.concert_ID = SI.concert_ID GROUP BY C.concert_Name, C.Theme
SELECT Name, COUNT(concert_ID) FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY Name;
SELECT Name, count(concert_ID) FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY Name
SELECT t2.Name FROM singer AS t2 JOIN singer_in_concert AS t1 ON t1.Singer_ID = t2.Singer_ID JOIN concert AS t3 ON t3.concert_ID = t1.concert_ID WHERE t3.Year = "2014"
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM singer_in_concert WHERE concert_ID IN (SELECT concert_ID FROM concert WHERE Year = '2014'))
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = '2014' INTERSECT SELECT Stadium_ID FROM concert WHERE Year = '2015')
SELECT Name, Location FROM stadium WHERE Stadium_ID IN ( SELECT Stadium_ID FROM concert WHERE Year = '2014' INTERSECT SELECT Stadium_ID FROM concert WHERE Year = '2015' )
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT count(*) FROM Pets WHERE weight > 10;
SELECT count(*) FROM Pets WHERE weight > 10
SELECT MIN(weight) FROM Pets WHERE PetType = 'dog' ORDER BY pet_age LIMIT 1;
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT PetType, max(weight) FROM Pets GROUP BY PetType;
SELECT PetType, max(weight) FROM Pets GROUP BY PetType;
SELECT count(PetID) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)
SELECT count(*) FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE Age > 20)
SELECT count(*) FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID JOIN Student AS T3 ON T1.StuID = T3.StuID WHERE T2.PetType = 'dog' AND T3.Sex = 'F'
SELECT count(*) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T1.Sex = 'F' AND T3.PetType = 'Dog'
SELECT count(DISTINCT PetType) FROM Pets
SELECT count(DISTINCT PetType) FROM Pets
SELECT FName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' OR PetType = 'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType IN ('cat', 'dog'))
SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' INTERSECT SELECT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'dog'
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog'))
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID = (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student EXCEPT SELECT T1.StuID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Cat'
SELECT FName, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog') AND StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat')))
SELECT Fname FROM Student WHERE StuID IN ( SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'dog' ) EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'cat' ) )
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets ORDER BY pet_age LIMIT 1
SELECT Pets.PetID, Pets.weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT avg(pet_age), max(pet_age), PetType FROM Pets GROUP BY PetType
SELECT avg(pet_age) , max(pet_age) , PetType FROM Pets GROUP BY PetType
SELECT PetType , avg(weight) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT p.PetID FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID JOIN Pets p ON hp.PetID = p.PetID WHERE s.LName = 'Smith'
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
SELECT Student.StuID, COUNT(*) FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID GROUP BY Student.StuID
SELECT T1.StuID , count(*) FROM Has_Pet AS T1 GROUP BY T1.StuID
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T2.StuID HAVING count(*) > 1
SELECT FName, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(*) > 1)
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3));
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents;
SELECT count(*) FROM continents 
SELECT T1.ContId, T1.Continent, COUNT(DISTINCT T2.CountryId) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId, T1.Continent
SELECT C.ContId, C.Continent, COUNT(*) FROM continents AS C JOIN countries AS CO ON C.ContId = CO.Continent GROUP BY C.ContId, C.Continent
SELECT count(*) FROM countries 
SELECT count(*) FROM countries;
SELECT FullName, Id, COUNT(*) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY FullName, Id
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumOfModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id;
SELECT model_list.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Horsepower = ( SELECT MIN(Horsepower) FROM cars_data )
SELECT model FROM model_list WHERE ModelId IN (SELECT Model FROM cars_data WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data));
SELECT model FROM car_names WHERE MakeId IN (SELECT MakeId FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data))
SELECT model_list.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data)
SELECT DISTINCT Maker FROM car_makers AS t1 JOIN model_list AS t2 ON t1.Id = t2.Maker JOIN car_names AS t3 ON t2.ModelId = t3.MakeId JOIN cars_data AS t4 ON t3.MakeId = t4.Id WHERE t4.Year = 1970
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970
SELECT T2.Make, T3.Year FROM car_names AS T2 JOIN model_list AS T1 ON T2.Model = T1.ModelId JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year = (SELECT min(Year) FROM cars_data)
SELECT T2.Maker, T1.Year FROM cars_data AS T1 JOIN model_list AS T2 ON T1.Id = T2.ModelId WHERE T1.Year = (SELECT MIN(Year) FROM cars_data)
SELECT DISTINCT Model FROM model_list JOIN cars_data ON model_list.ModelId = cars_data.Id WHERE Year > 1980
SELECT T3.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Year > 1980;
SELECT c.Continent, COUNT(DISTINCT cm.Id) FROM continents c JOIN countries cn ON c.ContId = cn.Continent JOIN car_makers cm ON cm.Country = cn.CountryId GROUP BY c.Continent;
SELECT C.Continent, COUNT(M.Id) FROM continents C JOIN countries CO ON C.ContId = CO.Continent JOIN car_makers M ON CO.CountryId = M.Country GROUP BY C.Continent
SELECT CountryName FROM countries AS c JOIN car_makers AS cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(DISTINCT cm.Id) DESC LIMIT 1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryId ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(model_list.ModelId), car_makers.FullName FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.FullName;
SELECT COUNT(model_list.ModelId), car_makers.Id, car_makers.FullName FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id GROUP BY car_makers.Id, car_makers.FullName
SELECT Accelerate FROM cars_data WHERE Id = ( SELECT MakeId FROM car_names WHERE Model = 'amc hornet sportabout (sw)' )
SELECT t1.Accelerate FROM cars_data AS t1 JOIN car_names AS t2 ON t1.Id = t2.MakeId JOIN model_list AS t3 ON t2.Model = t3.Model JOIN car_makers AS t4 ON t3.Maker = t4.Id WHERE t3.Model = "amc hornet sportabout (sw)"
SELECT COUNT(*) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'France'
SELECT COUNT(DISTINCT Maker) FROM car_makers WHERE Country = 'France'
SELECT COUNT(DISTINCT Model) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN countries AS T3 ON T2.Country = T3.CountryId WHERE T3.CountryName = 'USA';
SELECT COUNT(DISTINCT model_list.ModelId) FROM model_list INNER JOIN car_makers ON car_makers.Id = model_list.Maker INNER JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'United States';
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT avg(MPG) FROM cars_data WHERE Cylinders = 4;
SELECT MIN(weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT min(Weight) FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.ModelId WHERE cd.Cylinders = 8 AND cd.Year = 1974
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker 
SELECT Maker, Model FROM car_makers 
SELECT countries.CountryName, countries.CountryId FROM countries WHERE countries.CountryId IN (SELECT DISTINCT Country FROM car_makers)
SELECT T2.CountryName, T2.CountryId FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT avg(Weight), avg(Year) FROM cars_data GROUP BY Year
SELECT countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country WHERE countries.Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') GROUP BY countries.CountryName HAVING COUNT(DISTINCT car_makers.Maker) >= 3;
SELECT CountryName FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = "Europe") AND CountryName IN (SELECT CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY CountryName HAVING COUNT(DISTINCT car_makers.Id) >= 3)
SELECT max(cars_data.Horsepower) , car_names.Make FROM cars_data JOIN model_list ON cars_data.Id = model_list.Maker JOIN car_names ON model_list.ModelId = car_names.MakeId WHERE cars_data.Cylinders = 3
SELECT max(Horsepower) , Make FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.Model WHERE cd.Cylinders = 3 GROUP BY Make;
SELECT t1.Model FROM model_list AS t1 JOIN cars_data AS t2 ON t1.ModelId = t2.Id ORDER BY MPG DESC LIMIT 1
SELECT m.Model FROM model_list m JOIN cars_data c ON m.ModelId = c.Id ORDER BY c.MPG DESC LIMIT 1;
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Edispl) FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = "volvo")))
SELECT avg(Edispl) FROM cars_data WHERE Id IN ( SELECT MakeId FROM car_names WHERE Model IN ( SELECT Model FROM model_list WHERE Maker = ( SELECT Id FROM car_makers WHERE Maker = 'Volvo' ) ) )
SELECT max(Accelerate), Cylinders FROM cars_data GROUP BY Cylinders
SELECT Cylinders, max(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Model FROM model_list GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT t3.Model FROM model_list AS t3 JOIN car_names AS t2 ON t3.ModelId = t2.Model JOIN cars_data AS t1 ON t1.Id = t2.MakeId GROUP BY t3.Model ORDER BY COUNT(DISTINCT t2.Make) DESC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT count(*) FROM cars_data WHERE Year = 1980;
SELECT count(*) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.FullName = "American Motor Company"
SELECT count(*) FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id WHERE T2.Maker = "American Motor Company" 
SELECT Id, FullName FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING COUNT(model_list.ModelId) > 3
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING count(T2.ModelId) > 3;
SELECT DISTINCT T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE (T1.FullName = 'General Motors' OR T4.Weight > 3500)
SELECT T1.Model FROM model_list AS T1 INNER JOIN car_makers AS T2 ON T1.Maker = T2.Id INNER JOIN cars_data AS T3 ON T1.ModelId = T3.Id WHERE T2.Maker = "General Motors" OR T3.Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT MIN(Cylinders) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model WHERE T3.Model = 'volvo' ORDER BY Accelerate LIMIT 1
SELECT MIN(Cylinders) FROM cars_data AS T1 JOIN car_names AS T2 ON t1.id = t2.makeid JOIN model_list AS T3 ON t2.model = t3.model WHERE t3.maker = (SELECT id FROM car_makers WHERE maker = 'Volvo') ORDER BY t1.accelerate LIMIT 1;
SELECT count(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT count(*) FROM cars_data WHERE accelerate > (SELECT max(horsepower) FROM cars_data)
SELECT count(*) FROM (SELECT CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY CountryName HAVING count(DISTINCT car_makers.Id) > 2)
SELECT count(*) FROM (SELECT CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY CountryName HAVING count(DISTINCT car_makers.Id) > 2)
SELECT count(*) FROM cars_data WHERE Cylinders > 6
SELECT count(*) FROM cars_data WHERE Cylinders > 6;
SELECT Model FROM model_list WHERE ModelId IN ( SELECT Maker FROM car_makers WHERE Id IN ( SELECT MakeId FROM car_names WHERE ModelId IN ( SELECT Id FROM cars_data WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1 ) ) );
SELECT model_list.Model FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN cars_data ON car_makers.Id = cars_data.Id WHERE cars_data.Cylinders = 4 ORDER BY cars_data.Horsepower DESC LIMIT 1;
SELECT MakeId, Make FROM car_names WHERE MakeId IN (SELECT Id FROM car_makers WHERE Id IN (SELECT Make FROM model_list WHERE ModelId IN (SELECT MakeId FROM cars_data WHERE Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders <= 3)))
SELECT MakeId, Make FROM car_names WHERE MakeId NOT IN (SELECT MakeId FROM cars_data WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data)) AND MakeId IN (SELECT MakeId FROM cars_data WHERE Cylinders < 4)
SELECT max(MPG) FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.ModelId JOIN car_makers AS cm ON ml.Maker = cm.Id JOIN countries AS c ON cm.Country = c.CountryId JOIN continents AS cont ON c.Continent = cont.ContId WHERE cd.Cylinders = 8 OR cd.Year < 1980;
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980;
SELECT T2.Model FROM model_list AS T2 JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id JOIN car_makers AS T5 ON T2.Maker = T5.Id WHERE T4.Weight < 3500 AND T5.Maker != 'Ford Motor Company'
SELECT T3.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T1.Weight < 3500 AND T4.Maker != 'Ford Motor Company'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING count(*) >= 2 AND count(DISTINCT T1.Id) > 3
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.ModelId = cn.MakeId GROUP BY cm.Id, cm.Maker HAVING COUNT(DISTINCT ml.ModelId) >= 2 AND COUNT(DISTINCT cn.MakeId) > 3
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(DISTINCT Maker) > 3 OR Maker IN (SELECT Maker FROM model_list WHERE Model = 'fiat'))
SELECT countries.CountryId, countries.CountryName FROM countries WHERE countries.CountryId IN (SELECT car_makers.Country FROM car_makers GROUP BY car_makers.Country HAVING COUNT(DISTINCT car_makers.Id) > 3) OR countries.CountryId IN (SELECT countries.CountryId FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country JOIN model_list ON car_makers.Id = model_list.Maker WHERE model_list.Model = 'Fiat')
SELECT t1.Country FROM airlines AS t1 WHERE t1.Airline = "JetBlue Airways"
SELECT Country FROM airlines WHERE Airline = "Jetblue Airways"; 
SELECT Abbreviation FROM airlines WHERE Airline = "JetBlue Airways"
SELECT Abbreviation FROM airlines WHERE Airline = "Jetblue Airways";
SELECT Airline, Abbreviation FROM airlines WHERE Country = "USA"
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony' 
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT count(*) FROM airlines 
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT COUNT(*) FROM airports;
SELECT count(*) FROM flights
SELECT COUNT(*) FROM flights;
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM Airlines WHERE Abbreviation = 'UAL'
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton';
SELECT AirportName FROM airports WHERE AirportCode = 'AKO' 
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = "Aberdeen" 
SELECT AirportName FROM airports WHERE City = "Aberdeen"
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights AS f JOIN airports AS a ON f.SourceAirport = a.AirportCode WHERE a.AirportCode = 'APG'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT count(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT count(*) FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode WHERE T2.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports AS source ON flights.SourceAirport = source.AirportCode JOIN airports AS dest ON flights.DestAirport = dest.AirportCode WHERE source.City = 'Aberdeen' AND dest.City = 'Ashley';
SELECT count(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'JetBlue Airways')
SELECT count(*) FROM flights WHERE Airline IN (SELECT uid FROM airlines WHERE Airline = 'Jetblue Airways')
SELECT count(*) FROM flights AS t1 JOIN airlines AS t2 ON t1.Airline = t2.uid JOIN airports AS t3 ON t1.DestAirport = t3.AirportCode WHERE t2.Airline = "United Airlines" AND t3.AirportCode = "ASY"
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'United Airlines' AND F.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid JOIN airports AS S ON F.SourceAirport = S.AirportCode WHERE A.Abbreviation = 'UA' AND S.AirportCode = 'AHD';
SELECT COUNT(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid JOIN airports AS S ON F.SourceAirport = S.AirportCode JOIN airports AS D ON F.DestAirport = D.AirportCode WHERE A.Airline = 'United Airlines' AND D.City = 'Aberdeen'
SELECT count(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid JOIN airports AS s ON f.DestAirport = s.AirportCode WHERE a.Airline = 'United Airlines' AND s.City = 'Aberdeen'
SELECT T2.City FROM flights AS T1 JOIN airports AS T2 ON T1.DestAirport = T2.AirportCode GROUP BY T2.City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT City FROM airports WHERE AirportCode IN (SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY count(*) DESC LIMIT 1)
SELECT T2.City FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode GROUP BY T2.City ORDER BY count(*) DESC LIMIT 1;
SELECT City FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY count(*) DESC LIMIT 1)
SELECT SourceAirport AS airport_code FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY count(*) DESC LIMIT 1
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT SourceAirport FROM flights GROUP BY SourceAirport ORDER BY COUNT(*) ASC LIMIT 1
SELECT Airline FROM flights JOIN airlines ON flights.Airline = airlines.uid GROUP BY Airline ORDER BY count(*) DESC LIMIT 1
SELECT Airline, COUNT(FlightNo) AS num_flights FROM flights GROUP BY Airline ORDER BY num_flights DESC LIMIT 1
SELECT Abbreviation, Country FROM airlines WHERE uid = (SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Abbreviation, Country FROM airlines WHERE uid = ( SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) LIMIT 1 )
SELECT Airline FROM airlines WHERE uid IN ( SELECT Airline FROM flights WHERE SourceAirport = 'AHD' )
SELECT Airline FROM flights WHERE SourceAirport = 'AHD'
SELECT t1.Airline FROM airlines AS t1 JOIN flights AS t2 ON t1.uid = t2.Airline JOIN airports AS t3 ON t2.DestAirport = t3.AirportCode WHERE t3.AirportName = 'AHD'
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = "AHD")
SELECT Airline, COUNT(*) FROM flights WHERE SourceAirport = 'APG' OR SourceAirport = 'CVO' GROUP BY Airline HAVING COUNT(DISTINCT SourceAirport) = 2
SELECT T1.Airline FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode JOIN airports AS T3 ON T1.SourceAirport = T3.AirportCode WHERE T2.AirportName = "APG" AND T3.AirportName = "CVO"
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO' AND Airline NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG'))
SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) >= 10
SELECT Airline FROM flights GROUP BY Airline HAVING count(*) >= 10
SELECT Airline FROM airlines WHERE uid NOT IN (SELECT Airline FROM flights GROUP BY Airline HAVING count(*) >= 200)
SELECT Airline FROM flights GROUP BY Airline HAVING count(*) < 200
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines')
SELECT FlightNo FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') 
SELECT T1.FlightNo FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportName = "APG"
SELECT FlightNo FROM flights WHERE SourceAirport = "APG";
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT T2.FlightNo FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T3.City = "Aberdeen"
SELECT FlightNo FROM flights WHERE SourceAirport = (SELECT AirportCode FROM airports WHERE City = "Aberdeen");
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen' );
SELECT count(*) FROM flights AS F JOIN airports AS A ON F.DestAirport = A.AirportCode WHERE A.City = "Aberdeen" OR A.City = "Abilene"
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('ABZ', 'ABI') 
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee 
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC 
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(*) FROM employee GROUP BY City 
SELECT count(*) , City FROM employee GROUP BY City 
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING count(*) > 1
SELECT count(*) , Location FROM shop GROUP BY Location
SELECT count(*) , Location FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT t1.Manager_name, t1.District FROM shop AS t1 JOIN ( SELECT Shop_ID FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop) ) AS t2 ON t1.Shop_ID = t2.Shop_ID;
SELECT min(Number_products), max(Number_products) FROM shop
SELECT min(Number_products) , max(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC 
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)
SELECT t1.Name FROM employee AS t1 JOIN evaluation AS t2 ON t1.Employee_ID = t2.Employee_ID GROUP BY t1.Employee_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID GROUP BY T1.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM employee AS e JOIN evaluation AS ev ON e.Employee_ID = ev.Employee_ID ORDER BY Bonus DESC LIMIT 1
SELECT Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM shop WHERE Shop_ID = (SELECT Shop_ID FROM hiring GROUP BY Shop_ID ORDER BY count(Employee_ID) DESC LIMIT 1)
SELECT Name FROM shop WHERE Shop_ID IN (SELECT Shop_ID FROM hiring GROUP BY Shop_ID ORDER BY count(Employee_ID) DESC LIMIT 1)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT DISTINCT Shop_ID FROM hiring)
SELECT count(*) , t2.Name FROM hiring AS t1 JOIN shop AS t2 ON t1.Shop_ID = t2.Shop_ID GROUP BY t1.Shop_ID, t2.Name
SELECT T2.Name, COUNT(*) FROM hiring AS T1 JOIN shop AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T2.Name
SELECT sum(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring 
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT count(distinct Location) FROM shop
SELECT count(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE "%w%"
SELECT T1.Document_ID, T2.Template_ID, T2.Document_Description FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = "Robbin CV"
SELECT D.Document_ID, D.Template_ID, D.Document_Description FROM Documents D WHERE D.Document_Name = 'Robbin CV'
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT count(*) FROM Templates AS t1 JOIN Documents AS t2 ON t1.Template_ID = t2.Template_ID JOIN Ref_Template_Types AS t3 ON t1.Template_Type_Code = t3.Template_Type_Code WHERE t3.Template_Type_Description = 'PPT'
SELECT T1.Template_ID, COUNT(*) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID;
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT Templates.Template_ID, Templates.Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1;
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(DISTINCT T2.Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types 
SELECT Template_ID FROM Templates WHERE Template_Type_Code = "PP" OR Template_Type_Code = "PPT"
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT count(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code;
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(*) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates;
SELECT MIN(t.Version_Number), t.Template_Type_Code FROM Templates t GROUP BY t.Template_Type_Code
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = "Data base"
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = "Data base"
SELECT T2.Document_Name FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Template_Type_Code = "BK"
SELECT d.Document_Name FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = "BK"
SELECT Templates.Template_Type_Code, COUNT(Documents.Document_ID) FROM Templates INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_Type_Code
SELECT Template_Type_Code, COUNT(Document_ID) FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types 
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types 
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = "AD"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT DISTINCT Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT Template_Type_Description FROM Ref_Template_Types INNER JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code INNER JOIN Documents ON Templates.Template_ID = Documents.Template_ID WHERE Documents.Template_ID IS NOT NULL;
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT count(*) FROM Paragraphs;
SELECT count(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs AS p JOIN Documents AS d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT count(*) FROM documents AS d JOIN paragraphs AS p ON d.document_id = p.document_id WHERE d.document_name = 'Summer Show'
SELECT Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Welcome to NY')
SELECT T1.Paragraph_ID, T1.Paragraph_Text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID = ( SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews' )
SELECT T2.Paragraph_Text FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Customer reviews'
SELECT D.Document_ID, COUNT(*) AS Paragraph_Count FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID;
SELECT Document_ID, COUNT(*) AS Paragraph_Count FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID;
SELECT T1.Document_ID, T1.Document_Name, COUNT(*) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS Paragraph_Count FROM Documents D LEFT JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT T1.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID HAVING count(*) >= 2
SELECT D.Document_ID, D.Document_Name FROM Documents AS D JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T2.Document_ID, T2.Document_Name FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) ASC LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY count(*) ASC LIMIT 1
SELECT D.Document_ID FROM Documents AS D JOIN ( SELECT Document_ID, COUNT(Paragraph_ID) AS Num_Paragraphs FROM Paragraphs GROUP BY Document_ID ) AS P ON D.Document_ID = P.Document_ID WHERE Num_Paragraphs BETWEEN 1 AND 2;
SELECT T1.Document_ID FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID HAVING count(*) BETWEEN 1 AND 2;
SELECT D.Document_ID FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID WHERE P.Paragraph_Text IN ('Brazil', 'Ireland')
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Age , Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != "Little Lever Urban District"
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33 
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown FROM teacher WHERE Age = (SELECT min(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) > 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T.Name, C.Course FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID JOIN course C ON CA.Course_ID = C.Course_ID;
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID
SELECT T2.Name, T1.Course FROM course_arrange AS T3 JOIN course AS T1 ON T3.Course_ID = T1.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name ASC
SELECT T.Name, C.Course FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID ORDER BY T.Name ASC;
SELECT T2.Name FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID WHERE T1.Course = 'Math'
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID WHERE T1.Course_ID IN (SELECT Course_ID FROM course WHERE Course = "Math") 
SELECT T1.Name , COUNT(*) FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name
SELECT T2.Name, COUNT(*) FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T2.Name
SELECT Name FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID HAVING COUNT(*) >= 2
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange GROUP BY Teacher_ID HAVING COUNT(Course_ID) >= 2)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE Age < 30;
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT avg(Age) FROM visitor WHERE Level_of_membership <= 4;
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT "Museum_ID", "Name" FROM museum WHERE "Num_of_Staff" = (SELECT max("Num_of_Staff") FROM museum)
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = "Plaza Museum"
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT min(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT V.ID, V.Name, V.Age FROM visitor V JOIN visit VT ON V.ID = VT.visitor_ID GROUP BY V.ID, V.Name, V.Age HAVING COUNT(VT.Museum_ID) > 1;
SELECT T2.ID, T2.Name, T2.Level_of_membership FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID GROUP BY T1.visitor_ID ORDER BY SUM(T1.Total_spent) DESC LIMIT 1
SELECT T1.Museum_ID, T2.Name FROM visit AS T1 JOIN museum AS T2 ON T1.Museum_ID = T2.Museum_ID GROUP BY T1.Museum_ID ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT Name, Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID ORDER BY Num_of_Ticket DESC LIMIT 1
SELECT avg(Num_of_Ticket) , max(Num_of_Ticket) FROM visit
SELECT sum(T3.Total_spent) FROM visit AS T3 JOIN visitor AS T2 ON T3.visitor_ID = T2.ID WHERE T2.Level_of_membership = 1
SELECT v.Name FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID JOIN museum m ON vt.Museum_ID = m.Museum_ID WHERE m.Open_Year < 2009 INTERSECT SELECT v.Name FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID JOIN museum m ON vt.Museum_ID = m.Museum_ID WHERE m.Open_Year > 2011
SELECT count(*) FROM visitor WHERE ID NOT IN (SELECT visitor_ID FROM visit v JOIN museum m ON v.Museum_ID = m.Museum_ID WHERE m.Open_Year > '2010')
SELECT count(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT count(*) FROM players 
SELECT COUNT(*) FROM players 
SELECT count(*) FROM matches 
SELECT count(*) FROM matches 
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT avg(loser_age) , avg(winner_age) FROM matches
SELECT avg(loser_age), avg(winner_age) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT max(loser_rank) FROM matches 
SELECT max(loser_rank) FROM matches
SELECT count(DISTINCT country_code) FROM players 
SELECT COUNT(DISTINCT country_code) FROM players
SELECT count(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches 
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10;
SELECT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT winner_name FROM matches WHERE year = 2016
SELECT winner_name FROM matches WHERE year = 2013 AND winner_name IN (SELECT winner_name FROM matches WHERE year = 2016)
SELECT count(*) FROM matches WHERE year = 2013 OR year = 2016;
SELECT count(*) FROM matches WHERE year = 2013 OR year = 2016;
SELECT players.country_code, players.first_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'WTA Championships' INTERSECT SELECT players.country_code, players.first_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open'
SELECT players.first_name, players.country_code FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'WTA Championships' INTERSECT SELECT players.first_name, players.country_code FROM players JOIN matches ON players.player_id = matches.winner_id WHERE matches.tourney_name = 'Australian Open'
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date 
SELECT first_name, last_name FROM players WHERE hand = "L" ORDER BY birth_date 
SELECT first_name || ' ' || last_name AS player_full_name FROM players WHERE hand = 'left' ORDER BY birth_date;
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY sum(tours) DESC LIMIT 1
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY sum(tours) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT year, COUNT(*) AS num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1
SELECT T1.first_name, T1.last_name, T2.winner_rank_points FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T2.winner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.first_name, T2.last_name, T1.winner_rank_points FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id GROUP BY T1.winner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT max(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT T1.first_name || ' ' || T1.last_name AS loser_name, T2.first_name || ' ' || T2.last_name AS winner_name FROM players AS T1 JOIN matches ON T1.player_id = matches.loser_id JOIN players AS T2 ON matches.winner_id = T2.player_id WHERE minutes = (SELECT max(minutes) FROM matches)
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches)
SELECT first_name, avg(ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name;
SELECT T1.first_name, avg(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT sum(ranking_points), first_name FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, first_name
SELECT first_name, sum(ranking_points) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT COUNT(*) , country_code FROM players GROUP BY country_code
SELECT players.country_code, COUNT(*) FROM players GROUP BY players.country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING count(player_id) > 50
SELECT ranking_date, sum(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, sum(tours) FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year;
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id ORDER BY winner_age LIMIT 3
SELECT t1.first_name, t1.last_name, t2.winner_rank FROM players AS t1 JOIN matches AS t2 ON t1.player_id = t2.winner_id ORDER BY t2.winner_age ASC LIMIT 3
SELECT count(DISTINCT winner_id) FROM matches WHERE tourney_name = "WTA Championships" AND winner_hand = "L"
SELECT count(*) FROM players AS P JOIN matches AS M ON P.player_id = M.winner_id WHERE P.hand = 'L' AND M.tourney_name = 'WTA Championships';
SELECT first_name, country_code, birth_date FROM players WHERE player_id = ( SELECT winner_id FROM matches ORDER BY winner_rank_points DESC LIMIT 1 )
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T1.player_id ORDER BY sum(T2.winner_rank_points) DESC LIMIT 1
SELECT hand, count(*) FROM players GROUP BY hand;
SELECT hand, COUNT(*) FROM players GROUP BY hand 
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name , date , result FROM battle 
SELECT max(killed) , min(killed) FROM death
SELECT avg(injured) FROM death
SELECT note, killed, injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't')
SELECT name, result FROM battle WHERE bulgarian_commander <> 'Boril'
SELECT id, name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE ship_type = 'Brig')
SELECT id, name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE id IN (SELECT caused_by_ship_id FROM death WHERE killed > 10))
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id ORDER BY SUM(injured) DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I' 
SELECT count(DISTINCT result) FROM battle 
SELECT count(*) FROM battle AS T1 LEFT JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.tonnage != '225' OR T2.tonnage IS NULL
SELECT T1.name, T1.date FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.name = 'Lettice' OR T2.name = 'HMS Atalanta';
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel')
SELECT note FROM death WHERE note LIKE "%East%"
SELECT line_1, line_2 FROM Addresses
SELECT line_1 , line_2 FROM Addresses;
SELECT count(*) FROM Courses;
SELECT count(*) FROM Courses 
SELECT course_description FROM Courses WHERE course_name = "Math"
SELECT course_description FROM Courses WHERE course_name LIKE "%math%"
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea";
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea"
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY count(*) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs;
SELECT count(DISTINCT department_id) FROM Degree_Programs
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT count(*) FROM Degree_Programs WHERE department_id IN (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections
SELECT T1.course_id, T1.course_name FROM Courses AS T1 LEFT JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) <= 2;
SELECT T1.course_id, T1.course_name FROM Courses AS T1 LEFT JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) < 2;
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T2.semester_id, T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T2.semester_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.semester_name, T1.semester_id FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC;
SELECT department_description FROM Departments WHERE department_name LIKE "%computer%"
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT Students.student_id, Students.first_name, Students.middle_name, Students.last_name FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id JOIN Student_Enrolment_Courses ON Student_Enrolment.student_enrolment_id = Student_Enrolment_Courses.student_enrolment_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id JOIN Semesters ON Student_Enrolment.semester_id = Semesters.semester_id GROUP BY Students.student_id, Students.first_name, Students.middle_name, Students.last_name HAVING COUNT(DISTINCT Degree_Programs.degree_program_id) = 2 AND COUNT(DISTINCT Semesters.semester_id) = 1
SELECT student_id, first_name, middle_name, last_name FROM Students WHERE student_id IN ( SELECT student_id FROM Student_Enrolment GROUP BY student_id HAVING COUNT(DISTINCT degree_program_id) = 2 AND COUNT(DISTINCT semester_id) = 1 )
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT T2.first_name, T2.middle_name, T2.last_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T3 ON T1.degree_program_id = T3.degree_program_id JOIN Students AS T2 ON T3.student_id = T2.student_id WHERE T1.degree_summary_name = 'Bachelors'
SELECT T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.degree_summary_name FROM Degree_Programs AS D JOIN Student_Enrolment AS SE ON D.degree_program_id = SE.degree_program_id GROUP BY D.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(T2.student_enrolment_id) AS num_enrollments FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY num_enrollments DESC LIMIT 1;
SELECT T2.first_name, T2.middle_name, T2.last_name, T1.student_id, COUNT(*) AS num_enrollments FROM Student_Enrolment AS T1 JOIN Students AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT T1.semester_name FROM Semesters AS T1 LEFT JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id WHERE T2.semester_id IS NULL
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id;
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Courses.course_name FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id GROUP BY Courses.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.last_name FROM Students AS T1 JOIN Addresses AS T2 ON T1.current_address_id = T2.address_id LEFT JOIN Student_Enrolment AS T3 ON T1.student_id = T3.student_id WHERE T2.state_province_county = 'North Carolina' AND T3.student_enrolment_id IS NULL
SELECT last_name FROM Students WHERE student_id NOT IN (SELECT student_id FROM Student_Enrolment) AND current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina')
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2
SELECT Transcripts.transcript_date, Transcripts.transcript_id FROM Transcripts JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id GROUP BY Transcripts.transcript_id HAVING COUNT(Transcript_Contents.student_course_id) >= 2;
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1 
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered LIMIT 1
SELECT S.first_name, S.middle_name, S.last_name FROM Students S INNER JOIN Student_Enrolment SE ON S.student_id = SE.student_id INNER JOIN Student_Enrolment_Courses SEC ON SE.student_enrolment_id = SEC.student_enrolment_id INNER JOIN Courses C ON SEC.course_id = C.course_id INNER JOIN Transcript_Contents TC ON SEC.student_course_id = TC.student_course_id INNER JOIN Transcripts T ON TC.transcript_id = T.transcript_id ORDER BY T.transcript_date LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC LIMIT 1
SELECT first_name FROM Students WHERE current_address_id <> permanent_address_id
SELECT T1.first_name FROM Students AS T1 JOIN Addresses AS A1 ON T1.current_address_id = A1.address_id JOIN Addresses AS A2 ON T1.permanent_address_id = A2.address_id WHERE A1.line_1 <> A2.line_1 OR A1.line_2 <> A2.line_2 OR A1.line_3 <> A2.line_3 OR A1.city <> A2.city OR A1.zip_postcode <> A2.zip_postcode OR A1.state_province_county <> A2.state_province_county OR A1.country <> A2.country OR A1.other_address_details <> A2.other_address_details;
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.line_3 FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY Students.current_address_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.address_id, T1.line_1, T1.line_2 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY count(*) DESC LIMIT 1
SELECT avg(transcript_date) FROM Transcripts
SELECT avg(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT min(transcript_date), other_details FROM Transcripts GROUP BY transcript_date ORDER BY transcript_date ASC LIMIT 1
SELECT count(*) FROM Transcripts;
SELECT count(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(transcript_id) AS enrollment_count FROM Transcript_Contents GROUP BY student_course_id ORDER BY enrollment_count DESC LIMIT 1;
SELECT count(*) as max_count, course_id FROM Student_Enrolment_Courses GROUP BY course_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.transcript_id, T2.transcript_date FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.transcript_date, T1.transcript_id FROM Transcript_Contents AS T1 JOIN Transcripts AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY count(*) ASC LIMIT 1
SELECT T2.semester_name FROM Student_Enrolment AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T1.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Master' INTERSECT SELECT T2.semester_name FROM Student_Enrolment AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id JOIN Degree_Programs AS T3 ON T1.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT T1.semester_id FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY T1.semester_id HAVING COUNT(DISTINCT T2.degree_summary_name) = 2
SELECT count(DISTINCT current_address_id) FROM Students
SELECT DISTINCT T1.line_1, T1.line_2, T1.line_3, T1.city, T1.zip_postcode, T1.state_province_county, T1.country, T1.other_address_details FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id OR T1.address_id = T2.permanent_address_id
SELECT * FROM Students ORDER BY last_name DESC, first_name DESC, middle_name DESC
SELECT * FROM Students ORDER BY last_name DESC
SELECT course_id, section_name, section_description, other_details FROM Sections WHERE section_name = "h"
SELECT section_description FROM Sections WHERE section_name = "h";
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title;
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones"
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones"
SELECT count(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr"
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date;
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti"
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti"
SELECT Country, count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1;
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel 
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"; 
SELECT T1.Package_Option FROM TV_Channel AS T1 WHERE T1.series_name = "Sky Radio"
SELECT T1.Package_Option FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC LIMIT 1;
SELECT Language, COUNT(*) as num_channels FROM TV_Channel GROUP BY Language ORDER BY num_channels ASC LIMIT 1
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM "TV_Channel" AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle!"
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = "The Rise of the Blue Beetle"
SELECT T2.Title FROM Cartoon AS T2 JOIN TV_Channel AS T1 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio"
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id JOIN TV_series AS T3 ON T2.id = T3.Channel WHERE T2.series_name = "Sky Radio"
SELECT Episode FROM TV_series ORDER BY Rating 
SELECT Episode FROM TV_series ORDER BY Rating 
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT T1.series_name, T2.Episode, T2.Rating FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel ORDER BY T2.Rating DESC LIMIT 3
SELECT min(Share), max(Share) FROM TV_series 
SELECT max(Share) , min(Share) FROM TV_series 
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT T1.Weekly_Rank FROM TV_series AS T1 JOIN Cartoon AS T2 ON T1.Channel = T2.Channel WHERE T2.Title = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT T1.series_name, T1.Country, T1.Language FROM TV_Channel T1 JOIN TV_series T2 ON T1.id = T2.Channel WHERE T2.Episode = "A Love of a Lifetime"
SELECT series_name FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT T1.Episode FROM `TV_series` AS t1 JOIN `TV_Channel` AS t2 ON t1.Channel = t2.id WHERE t2.series_name = "Sky Radio"
SELECT Episode FROM TV_series WHERE series_name = 'Sky Radio'
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT T1.production_code , T1.channel FROM Cartoon AS T1 ORDER BY T1.original_air_date DESC LIMIT 1
SELECT T1.Package_Option, T1.series_name FROM TV_Channel AS T1 WHERE T1.High_definition_TV = 'Yes';
SELECT T1.Package_Option, T2.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.Hight_definition_TV = 'Yes'
SELECT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Written_by = "Todd Casey");
SELECT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = "Todd Casey";
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang');
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.id IN (SELECT id FROM Cartoon WHERE Directed_by = 'Ben Jones') AND T2.id IN (SELECT id FROM Cartoon WHERE Directed_by = 'Michael Chang')
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != "English"
SELECT T1.Pixel_aspect_ratio_PAR, T1.Country FROM TV_Channel AS T1 WHERE T1.Language <> "English"
SELECT id FROM TV_Channel GROUP BY Country HAVING count(*) >= 2
SELECT T2.id FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id GROUP BY T1.Channel HAVING count(*) > 2;
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT T1.Package_Option FROM TV_Channel AS T1 WHERE T1.id NOT IN (SELECT T2.Channel FROM Cartoon AS T2 WHERE T2.Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made , Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player 
SELECT avg(Earnings) FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT p.Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000;
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Final_Table_Made ASC
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Final_Table_Made ASC
SELECT p.birth_date FROM poker_player AS pp JOIN people AS p ON pp.people_id = p.people_id ORDER BY pp.earnings ASC LIMIT 1;
SELECT Birth_Date FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings ASC LIMIT 1
SELECT Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT avg(Earnings) FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE p.Height > 200
SELECT avg(Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T1.Earnings DESC
SELECT Nationality, count(*) FROM people GROUP BY Nationality
SELECT Nationality , count(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING count(*) > 1
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != "Russia"
SELECT Name FROM people WHERE Nationality != "Russia"
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES;
SELECT max(area_code) , min(area_code) FROM AREA_CODE_STATE
SELECT max(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT contestant_number, contestant_name FROM CONTESTANTS WHERE contestant_number IN (SELECT contestant_number FROM VOTES GROUP BY contestant_number HAVING COUNT(*) >= 2)
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T2.contestant_number ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE JOIN VOTES ON AREA_CODE_STATE.state = VOTES.state GROUP BY area_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT created, state, phone_number FROM VOTES JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number WHERE CONTESTANTS.contestant_name = 'Tabatha Gehling'
SELECT T1.area_code FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number JOIN CONTESTANTS AS T3 ON T1.contestant_number = T3.contestant_number JOIN AREA_CODE_STATE AS T4 ON T1.state = T4.state WHERE T2.contestant_name = 'Tabatha Gehling' INTERSECT SELECT T1.area_code FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number JOIN CONTESTANTS AS T3 ON T1.contestant_number = T3.contestant_number JOIN AREA_CODE_STATE AS T4 ON T1.state = T4.state WHERE T3.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE "%Al%"
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT count(*) FROM country WHERE GovernmentForm = 'Republic'
SELECT sum(SurfaceArea) FROM country WHERE Region = "Caribbean"
SELECT SUM(SurfaceArea) FROM country WHERE Region = "Carribean"
SELECT Continent FROM country WHERE Name = "Anguilla";
SELECT T2.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = "Anguilla"
SELECT Region FROM city JOIN country ON city.CountryCode = country.Code WHERE city.Name = "Kabul"
SELECT T2.Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = "Kabul";
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' AND IsOfficial = 'T' ORDER BY Percentage DESC LIMIT 1;
SELECT Population, LifeExpectancy FROM country WHERE Name = "Brazil"
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = "Angola"
SELECT Region, Population FROM country WHERE Name = "Angola";
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1;
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1;
SELECT sum(c.Population), max(c.GNP) FROM country c WHERE c.Continent = 'Asia'
SELECT SUM(Population) AS TotalPopulation, MAX(GNP) AS LargestGNP FROM country WHERE Continent = 'Asia'
SELECT avg(LifeExpectancy) FROM country WHERE Continent = "Africa" AND GovernmentForm = "Republic"
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm = 'Republic'
SELECT sum(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'
SELECT sum(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT sum(Population) FROM city WHERE District = "Gelderland"
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT avg(GNP) , sum(Population) FROM country WHERE Region = 'Americas' AND GovernmentForm = 'Nonmetropolitan Territory of the US'
SELECT COUNT(DISTINCT Language) FROM countrylanguage 
SELECT COUNT(DISTINCT Language) FROM countryLanguage
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'ABW'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AF' AND IsOfficial = 'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AF' AND IsOfficial = 'T'
SELECT T1.Name FROM country AS T1 JOIN countryLanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT t1.Name FROM country AS t1 JOIN countrylanguage AS t2 ON t1.Code = t2.CountryCode GROUP BY t1.Name ORDER BY COUNT(t2.Language) DESC LIMIT 1
SELECT Continent, count(DISTINCT Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code GROUP BY Continent ORDER BY count(DISTINCT Language) DESC LIMIT 1;
SELECT Continent FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent ORDER BY COUNT(distinct Language) DESC LIMIT 1
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') GROUP BY CountryCode HAVING COUNT(DISTINCT Language) = 2;
SELECT count(*) FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T'
SELECT c.Name FROM country c WHERE EXISTS (SELECT 1 FROM countrylanguage cl WHERE c.Code = cl.CountryCode AND cl.Language = 'English') AND EXISTS (SELECT 1 FROM countrylanguage cl WHERE c.Code = cl.CountryCode AND cl.Language = 'French')
SELECT T1.Name FROM country AS T1 WHERE EXISTS (SELECT * FROM countrylanguage AS T2 WHERE T1.Code = T2.CountryCode AND T2.Language IN ('English', 'French') GROUP BY T2.CountryCode HAVING COUNT(DISTINCT T2.Language) = 2)
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = "English" AND IsOfficial = "T" INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = "French" AND IsOfficial = "T")
SELECT count(DISTINCT Continent) FROM country AS T1 JOIN countryLanguage AS T2 ON T1.Code = T2.CountryCode WHERE Language = 'Chinese'
SELECT COUNT(DISTINCT c.Continent) FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese'
SELECT Region FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' OR Language = 'Dutch')
SELECT DISTINCT Region FROM country WHERE Code IN (SELECT CountryCode FROM countryLanguage WHERE Language IN ('Dutch', 'English'))
SELECT Name FROM country WHERE Code IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' OR Language = 'Dutch' AND IsOfficial = 'T' )
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') OR Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch' AND IsOfficial = 'T');
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language ORDER BY SUM(Percentage) DESC LIMIT 1
SELECT cl.Language FROM countrylanguage AS cl JOIN country AS c ON cl.CountryCode = c.Code WHERE c.Continent = "Asia" GROUP BY cl.Language ORDER BY COUNT(DISTINCT cl.CountryCode) DESC LIMIT 1;
SELECT cl.Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = "Republic" GROUP BY cl.Language HAVING COUNT(DISTINCT cl.CountryCode) = 1;
SELECT Language FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code WHERE GovernmentForm = 'Republic' GROUP BY Language HAVING COUNT(DISTINCT C.Code) = 1
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' ORDER BY city.Population DESC LIMIT 1;
SELECT T1.Name FROM city AS T1 JOIN countrylanguage AS T2 ON T1.CountryCode = T2.CountryCode WHERE T2.Language = 'English' ORDER BY T1.Population DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT avg(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT avg(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT sum(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE HeadOfState = "Beatrix" AND IsOfficial = "T")
SELECT T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.HeadOfState = "Beatrix" AND T2.IsOfficial = "T"
SELECT count(DISTINCT Language) FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930) AND IsOfficial = 'T'
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT c.Name FROM country AS c WHERE c.SurfaceArea > (SELECT max(c1.SurfaceArea) FROM country AS c1 WHERE c1.Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = "Europe")
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT min(Population) FROM country WHERE Continent = 'Asia')
SELECT country.Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT min(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT max(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT max(Population) FROM country WHERE Continent = 'Africa')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language != 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm != 'Republic'
SELECT c.Code FROM country AS c LEFT JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language != 'English' AND c.GovernmentForm != 'Republic'
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F'
SELECT city.Name FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode JOIN country ON city.CountryCode = country.Code WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F'
SELECT DISTINCT c.Name FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population LIMIT 1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population LIMIT 1
SELECT Population, Name, HeadOfState FROM country WHERE SurfaceArea = ( SELECT MAX ( SurfaceArea ) FROM country );
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT c.Name, COUNT(cl.Language) AS num_languages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(cl.Language) >= 3;
SELECT Name, COUNT(Language) FROM country JOIN countryLanguage ON country.Code = countryLanguage.CountryCode GROUP BY country.Code HAVING COUNT(Language) > 2;
SELECT district, count(*) FROM city WHERE population > (SELECT avg(population) FROM city) GROUP BY district
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, SUM(Population) FROM country WHERE GovernmentForm IN (SELECT GovernmentForm FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72) GROUP BY GovernmentForm
SELECT c.Continent, AVG(c.LifeExpectancy) as avg_life_expectancy, SUM(c.Population) as total_population FROM country c GROUP BY c.Continent HAVING AVG(c.LifeExpectancy) < 72;
SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT count(*) FROM country WHERE Continent = 'Asia';
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = "Europe" AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population) , AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT sum(Population) , avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT t2.Language FROM countrylanguage AS t1 JOIN countrylanguage AS t2 ON t1.Language = t2.Language GROUP BY t2.Language ORDER BY COUNT(DISTINCT t1.CountryCode) DESC LIMIT 1;
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1;
SELECT country.Name, countrylanguage.Language FROM country JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE countrylanguage.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code);
SELECT c.Code, cl.Language FROM country c INNER JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = c.Code) ORDER BY c.Code;
SELECT count(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT max(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT count(*) FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT T1.CountryCode FROM countrylanguage AS T1 WHERE T1.Language = 'Spanish' ORDER BY T1.Percentage DESC LIMIT 1;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T' AND Percentage > 50
SELECT count(*) FROM conductor 
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT avg(Attendance) FROM show
SELECT avg(Attendance) FROM show
SELECT max(Share) , min(Share) FROM performance WHERE Type != "Live final"
SELECT max(Share), min(Share) FROM performance WHERE Type != "Live final"
SELECT count(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC 
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY SUM(T1.Year_of_Work) DESC LIMIT 1
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID 
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(DISTINCT T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T2.Conductor_ID HAVING COUNT(*) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID ORDER BY count(*) DESC LIMIT 1
SELECT t1.Name FROM conductor AS t1 JOIN orchestra AS t2 ON t1.Conductor_ID = t2.Conductor_ID GROUP BY t2.Conductor_ID ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra WHERE Year_of_Founded > 2008)
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra WHERE Year_of_Founded > 2008)
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM Orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT count(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT count(*) FROM orchestra WHERE Major_Record_Format = "CD" OR Major_Record_Format = "DVD";
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING count(*) > 1)
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1)
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler 
SELECT grade FROM Highschooler 
SELECT Grade FROM Highschooler 
SELECT grade FROM Highschooler WHERE name = "Kyle"; 
SELECT grade FROM Highschooler WHERE name = "Kyle"
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10 
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = "Kyle"
SELECT COUNT(*) FROM Highschooler WHERE grade <= 10 
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT grade, count(*) FROM Highschooler GROUP BY grade
SELECT grade, count(*) FROM Highschooler GROUP BY grade
SELECT Grade FROM Highschooler GROUP BY Grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4;
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4 
SELECT student_id, COUNT(friend_id) FROM Friend GROUP BY student_id 
SELECT student_id, count(friend_id) FROM Friend GROUP BY student_id 
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.name;
SELECT name, count(*) FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID;
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id GROUP BY H.ID ORDER BY count(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN ( SELECT student_id FROM Friend GROUP BY student_id ORDER BY COUNT(friend_id) DESC LIMIT 1 )
SELECT t1.name FROM Highschooler AS t1 JOIN Friend AS t2 ON t1.ID = t2.student_id GROUP BY t2.student_id HAVING count(*) >= 3
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id HAVING COUNT(*) >= 3
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.friend_id WHERE F.student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT T2.name FROM Highschooler AS T1 JOIN Friend AS F ON T1.ID = F.student_id JOIN Highschooler AS T2 ON F.friend_id = T2.ID WHERE T1.name = "Kyle"
SELECT COUNT(friend_id) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM Friend WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN(SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT DISTINCT f1.student_id FROM Friend f1 JOIN Friend f2 ON f1.student_id = f2.friend_id AND f1.friend_id = f2.student_id JOIN Likes l ON f1.student_id = l.student_id
SELECT DISTINCT student_id FROM Friend INTERSECT SELECT DISTINCT student_id FROM Likes
SELECT H.name FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F) AND H.ID IN (SELECT L.liked_id FROM Likes L)
SELECT T1.name FROM Highschooler AS T1 WHERE EXISTS (SELECT 1 FROM Friend WHERE student_id = T1.ID) AND EXISTS (SELECT 1 FROM Likes WHERE student_id = T1.ID)
SELECT student_id, count(liked_id) FROM Likes GROUP BY student_id
SELECT student_id , COUNT(*) FROM Likes GROUP BY student_id
SELECT T1.name, COUNT(T2.liked_id) FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID
SELECT name, COUNT(liked_id) FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.student_id GROUP BY Highschooler.name;
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Likes GROUP BY student_id ORDER BY count(*) DESC LIMIT 1)
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY L.student_id HAVING COUNT(*) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.student_id GROUP BY T2.student_id HAVING COUNT(*) >= 2
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.grade > 5 GROUP BY T1.ID HAVING COUNT(T2.friend_id) >= 2
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2)
SELECT count(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle') 
SELECT count(*) FROM Likes WHERE student_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle')
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) 
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend)
SELECT min(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) 
SELECT state FROM Owners WHERE state IN (SELECT state FROM Professionals)
SELECT DISTINCT Owners.state FROM Owners JOIN Professionals ON Owners.state = Professionals.state
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT name FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments WHERE cost_of_treatment > 1000)
SELECT D.name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE T.cost_of_treatment <= 1000
SELECT first_name FROM Owners WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT first_name FROM Professionals WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT First_name FROM Owners WHERE First_name NOT IN (SELECT Name FROM Dogs) UNION SELECT First_name FROM Professionals WHERE First_name NOT IN (SELECT Name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY count(*) DESC LIMIT 1)
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id = ( SELECT owner_id FROM Dogs GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT professional_id, role_code, first_name FROM Professionals JOIN Treatments ON Treatments.professional_id = Professionals.professional_id GROUP BY Treatments.professional_id HAVING COUNT(*) >= 2;
SELECT professional_id, role_code, first_name FROM Professionals JOIN Treatments ON Professionals.professional_id = Treatments.professional_id GROUP BY professional_id HAVING count(*) >= 2
SELECT breed_name FROM Breeds JOIN Dogs ON Breeds.breed_code = Dogs.breed_code GROUP BY Breeds.breed_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT b.breed_name FROM Breeds b JOIN Dogs d ON b.breed_code = d.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1;
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT Treatment_Types.treatment_type_description FROM Treatment_Types JOIN Treatments ON Treatment_Types.treatment_type_code = Treatments.treatment_type_code GROUP BY Treatments.treatment_type_code ORDER BY sum(Treatments.cost_of_treatment) LIMIT 1;
SELECT treatment_type_description FROM Treatment_Types JOIN Treatments ON Treatment_Types.treatment_type_code = Treatments.treatment_type_code GROUP BY Treatment_Types.treatment_type_code ORDER BY SUM(cost_of_treatment) ASC LIMIT 1;
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY sum(T3.cost_of_treatment) DESC LIMIT 1
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT first_name, last_name FROM Professionals WHERE professional_id IN ( SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments) )
SELECT date_of_treatment, first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT date_of_treatment, Professionals.first_name FROM Treatments INNER JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code;
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id;
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT D.name, T.date_of_treatment FROM Dogs AS D JOIN Breeds AS B ON D.breed_code = B.breed_code JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE B.breed_code = (SELECT breed_code FROM Breeds ORDER BY breed_code LIMIT 1)
SELECT d.name, t.date_of_treatment FROM Dogs AS d JOIN Breeds AS b ON d.breed_code = b.breed_code JOIN Treatments AS t ON d.dog_id = t.dog_id WHERE b.breed_code = (SELECT breed_code FROM Breeds ORDER BY breed_code DESC LIMIT 1)
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'
SELECT D.date_arrived, D.date_departed FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id;
SELECT last_name FROM Owners WHERE owner_id = (SELECT owner_id FROM Dogs WHERE age = (SELECT min(age) FROM Dogs))
SELECT o.last_name FROM owners AS o JOIN dogs AS d ON o.owner_id = d.owner_id WHERE d.date_of_birth = (SELECT MIN(date_of_birth) FROM dogs)
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state = "Hawaii" OR state = "Wisconsin";
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived , date_departed FROM Dogs 
SELECT count(DISTINCT dog_id) FROM Treatments;
SELECT count(*) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE "%West%"
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE "%West%"
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE "%North%"
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE "%North%"
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT max(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT max(date_of_treatment) FROM Treatments)
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT DISTINCT dog_id FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_departed IS NULL)
SELECT count(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_departed IS NULL)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT count(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = "1"
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = "1"
SELECT AVG(Age) FROM Dogs
SELECT avg(age) FROM Dogs
SELECT MAX(age) FROM Dogs;
SELECT MAX(age) FROM Dogs
SELECT charge_type, charge_amount FROM Charges
SELECT charge_type, charge_amount FROM Charges;
SELECT max(charge_amount) FROM Charges
SELECT MAX(charge_amount) FROM Charges;
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT breed_code, size_code FROM Breeds, Sizes
SELECT DISTINCT breed_code, size_code FROM Dogs
SELECT T2.first_name, T3.treatment_type_description FROM Professionals AS T2 JOIN Treatments AS T1 ON T2.professional_id = T1.professional_id JOIN Treatment_Types AS T3 ON T1.treatment_type_code = T3.treatment_type_code
SELECT T2.first_name , T1.treatment_type_description FROM Treatment_Types AS T1 JOIN Treatments AS T3 ON T1.treatment_type_code = T3.treatment_type_code JOIN Professionals AS T2 ON T3.professional_id = T2.professional_id
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year , Citizenship FROM singer
SELECT Birth_Year , Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != "France"
SELECT Name FROM singer WHERE Citizenship <> "French"
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship;
SELECT Citizenship, max(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT T1.Title, T2.Name FROM song AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT Title, Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song WHERE Sales > 300000)
SELECT DISTINCT Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1
SELECT t1.Name FROM singer AS t1 JOIN song AS t2 ON t1.Singer_ID = t2.Singer_ID GROUP BY t2.Singer_ID HAVING count(*) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID
SELECT Name, sum(Sales) FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features;
SELECT feature_type_name FROM Ref_Feature_Types WHERE feature_type_code = (SELECT feature_type_code FROM Other_Available_Features WHERE feature_name = "AirCon");
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = "code"
SELECT property_name FROM Properties WHERE property_type_code IN ('HSE', 'APT') AND room_count > 1
