SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT s.Name, s.Song_release_year FROM singer s WHERE s.Age = (SELECT MIN(Age) FROM singer)
SELECT s.Name, s.Song_release_year FROM singer s WHERE s.Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT Country, COUNT(*) AS Number_of_Singers FROM singer GROUP BY Country
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT DISTINCT s.Song_Name FROM singer s WHERE s.Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(Capacity), avg(Capacity) FROM stadium
SELECT max(Capacity), avg(Capacity) FROM stadium
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium) ORDER BY Stadium_ID ASC LIMIT 1
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015)
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015)
SELECT Name, (SELECT COUNT(*) FROM concert WHERE Stadium_ID = stadium.Stadium_ID) AS Concerts_Held FROM stadium
SELECT Stadium_ID, COUNT(concert_ID) FROM concert GROUP BY Stadium_ID
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= 2014 GROUP BY s.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Stadium_ID ORDER BY COUNT(c.concert_ID) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year HAVING COUNT(Year) = (SELECT MAX(concert_count) FROM (SELECT Year, COUNT(*) AS concert_count FROM concert GROUP BY Year) sub)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS number_of_singers FROM concert c LEFT JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID
SELECT c.concert_Name AS Concert, c.Theme AS Theme, COUNT(sic.Singer_ID) AS NumberOfSingers FROM concert AS c LEFT JOIN singer_in_concert AS sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID
SELECT Name, COUNT(*) FROM singer JOIN singer_in_concert ON singer.Singer_ID = singer_in_concert.Singer_ID GROUP BY singer.Singer_ID
SELECT singer.Name, (SELECT COUNT(*) FROM singer_in_concert WHERE Singer_ID = singer.Singer_ID) AS ConcertCount FROM singer
SELECT DISTINCT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = 2014
SELECT DISTINCT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM singer_in_concert WHERE concert_ID IN (SELECT concert_ID FROM concert WHERE Year = 2014))
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT DISTINCT s.Name, s.Location FROM stadium s WHERE s.Stadium_ID IN (SELECT c.Stadium_ID FROM concert c WHERE c.Year = 2014 INTERSECT SELECT c.Stadium_ID FROM concert c WHERE c.Year = 2015)
SELECT DISTINCT s.Name, s.Location FROM stadium s WHERE s.Stadium_ID IN (SELECT c.Stadium_ID FROM concert c WHERE c.Year = 2014 INTERSECT SELECT c.Stadium_ID FROM concert c WHERE c.Year = 2015)
SELECT COUNT(*) FROM concert WHERE Stadium_ID IN (SELECT Stadium_ID FROM stadium WHERE Capacity = (SELECT MAX(Capacity) FROM stadium))
SELECT COUNT(c.concert_ID) FROM concert c JOIN stadium s ON c.Stadium_ID = s.Stadium_ID WHERE s.Capacity = (SELECT MAX(Capacity) FROM stadium)
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT count(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT weight FROM Pets WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog'))
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT COUNT(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(DISTINCT Pets.PetID) FROM Pets, Has_Pet, Student WHERE Pets.PetID = Has_Pet.PetID AND Has_Pet.StuID = Student.StuID AND Student.Age > 20
SELECT COUNT(*) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT COUNT(*) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType IN ('cat', 'dog')))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' OR PetType = 'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'cat') AND StuID IN (SELECT StuID FROM Has_Pet HP JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType = 'dog')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT S.StuID FROM Student S WHERE S.StuID NOT IN (SELECT H.StuID FROM Has_Pet H INNER JOIN Pets P ON H.PetID = P.PetID WHERE P.PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaximumAge FROM Pets GROUP BY PetType
SELECT avg(pet_age) AS AverageAge, max(pet_age) AS MaximumAge, PetType FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT DISTINCT s.Fname, s.Age FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT S.StuID, COUNT(P.PetID) FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID JOIN Pets P ON HP.PetID = P.PetID GROUP BY S.StuID
SELECT StuID, COUNT(PetID) AS Num_Pets FROM Has_Pet GROUP BY StuID
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS Number_of_Countries FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS Number_of_Countries FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT count(*) FROM countries
SELECT count(*) FROM countries
SELECT a.FullName, a.Id, (SELECT COUNT(*) FROM model_list WHERE Maker = a.Id) AS ModelCount FROM car_makers a
SELECT m.Id, m.FullName, COUNT(DISTINCT ml.ModelId) AS NumberOfModels FROM car_makers m LEFT JOIN model_list ml ON m.Id = ml.Maker GROUP BY m.Id
SELECT m.Model FROM model_list m JOIN car_names cn ON m.ModelId = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id ORDER BY cd.Horsepower ASC LIMIT 1
SELECT model FROM model_list WHERE ModelId = (SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM cars_data ORDER BY Horsepower ASC LIMIT 1))
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data)))
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data))
SELECT DISTINCT cm.FullName FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker JOIN car_names AS cn ON cn.Model = ml.ModelId JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970
SELECT DISTINCT cm.FullName FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.ModelId = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.Year ASC LIMIT 1
SELECT cm.FullName, cd.Year FROM car_makers AS cm JOIN car_names AS cn ON cm.Id = cn.MakeId JOIN cars_data AS cd ON cn.MakeId = cd.Id ORDER BY cd.Year ASC LIMIT 1
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980
SELECT DISTINCT m.ModelId, m.Model FROM model_list m, car_names cn, cars_data cd WHERE m.ModelId = cn.Model AND cn.MakeId = cd.Id AND cd.Year > 1980
SELECT conts.Continent as ContinentName, COUNT(DISTINCT makers.Id) as NumberOfMakers FROM continents as conts JOIN countries as ctries ON conts.ContId = ctries.Continent LEFT JOIN car_makers as makers ON ctries.CountryId = makers.Country GROUP BY conts.Continent
SELECT continents.Continent, COUNT(car_makers.Id) AS NumberOfCarMakers FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent LEFT JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent
SELECT CountryName FROM countries WHERE CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) = (SELECT MAX(cnt) FROM (SELECT COUNT(Id) AS cnt FROM car_makers GROUP BY Country) x))
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY count(cm.Id) DESC LIMIT 1
SELECT FullName, COUNT(ModelId) FROM car_makers LEFT JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY FullName
SELECT cm1.Id, cm1.FullName, (SELECT COUNT(*) FROM model_list AS ml1 WHERE ml1.Maker = cm1.Id) AS NumberOfModels FROM car_makers AS cm1
SELECT c.Accelerate FROM cars_data c JOIN car_names cn ON c.Id = cn.MakeId WHERE cn.Make = 'amc hornet sportabout (sw)'
SELECT c.Accelerate FROM cars_data c INNER JOIN car_names cn ON c.Id = cn.MakeId INNER JOIN model_list ml ON cn.Model = ml.ModelId WHERE ml.Model = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(DISTINCT car_makers.Id) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'
SELECT COUNT(DISTINCT ml.ModelId) FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id JOIN countries c ON cm.Country = c.CountryId WHERE c.CountryName = 'USA'
SELECT COUNT(DISTINCT ml.Model) FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id JOIN countries c ON cm.Country = c.CountryId WHERE c.CountryName = 'usa'
SELECT AVG(cars_data.MPG) AS AverageMPG FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4 AND MPG != 'NA'
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974 GROUP BY Cylinders, Year
SELECT min(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT c.CountryName, c.CountryId FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId
SELECT c.CountryId, c.CountryName FROM countries c WHERE EXISTS (SELECT 1 FROM car_makers cm WHERE cm.Country = c.CountryId)
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT c.CountryName FROM countries c JOIN continents ct ON c.Continent = ct.ContId JOIN car_makers cm ON cm.Country = c.CountryId WHERE ct.Continent = 'Europe' GROUP BY c.CountryId HAVING COUNT(DISTINcT cm.Id) >= 3
SELECT CountryName FROM countries WHERE Continent IN (SELECT ContId FROM continents WHERE Continent = 'Europe') AND CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) >= 3)
SELECT MAX(Horsepower), Make FROM cars_data JOIN car_names ON Id = MakeId WHERE Cylinders = 3 GROUP BY Make
SELECT MAX(Horsepower), Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Cylinders = 3
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data ORDER BY MPG DESC LIMIT 1))
SELECT m.Model FROM model_list m JOIN car_names cn ON m.ModelId = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id ORDER BY cd.MPG DESC LIMIT 1
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(cars_data.Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.ModelId WHERE model_list.Model = 'volvo'
SELECT AVG(cd.Edispl) FROM cars_data AS cd INNER JOIN car_names AS cn ON cd.Id = cn.MakeId INNER JOIN model_list AS ml ON cn.Model = ml.ModelId INNER JOIN car_makers AS cm ON ml.Maker = cm.Id WHERE cm.Maker = 'Volvo'
SELECT c.Cylinders, MAX(c.Accelerate) FROM cars_data c GROUP BY c.Cylinders
SELECT Cylinders, MAX(Accelerate) AS MaxAccelerate FROM cars_data GROUP BY Cylinders
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(DISTINCT Make) DESC LIMIT 1
WITH ModelCounts AS (SELECT Model, COUNT(*) AS Total FROM car_names GROUP BY Model) SELECT Model FROM ModelCounts ORDER BY Total DESC LIMIT 1
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT count(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company'
SELECT COUNT(model_list.ModelId) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'American Motor Company'
SELECT c.FullName, c.Id FROM car_makers AS c JOIN model_list AS m ON c.Id = m.Maker GROUP BY c.Id HAVING COUNT(m.ModelId) > 3
SELECT C.Id, C.Maker FROM car_makers AS C JOIN model_list AS M ON C.Id = M.Maker GROUP BY C.Id HAVING COUNT(M.ModelId) > 3
SELECT DISTINCT ml.Model FROM model_list ml INNER JOIN car_makers cm ON ml.Maker = cm.Id LEFT JOIN car_names cn ON cn.Model = ml.ModelId LEFT JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500
SELECT DISTINCT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'General Motors') OR ModelId IN (SELECT Model FROM cars_data WHERE Weight > 3500)
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model = (SELECT ModelId FROM model_list WHERE Model = 'volvo')) ORDER BY Accelerate ASC LIMIT 1
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT ModelId FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'Volvo'))) ORDER BY Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT MAX(Accelerate) FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT ml.Model FROM model_list ml INNER JOIN car_names cn ON ml.ModelId = cn.Model INNER JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Cylinders = 4 ORDER BY cd.Horsepower DESC LIMIT 1
SELECT A.Model FROM (SELECT CN.Model, CD.Horsepower FROM car_names CN INNER JOIN cars_data CD ON CN.MakeId = CD.Id WHERE CD.Cylinders = 4) A ORDER BY A.Horsepower DESC LIMIT 1
SELECT cn.MakeId, cn.Make FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND cd.Cylinders <= 3
SELECT CD.Id, CN.Make FROM cars_data CD JOIN car_names CN ON CD.Id = CN.MakeId WHERE CD.Cylinders < 4 AND CD.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)
SELECT max(cars_data.MPG) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 8 OR cars_data.Year < 1980
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT DISTINCT m.ModelId FROM model_list m JOIN car_makers cm ON m.Maker = cm.Id JOIN cars_data cd ON cd.Id = m.Maker WHERE cd.Weight < 3500 AND cm.FullName != 'Ford Motor Company'
SELECT ml.Model FROM model_list AS ml JOIN car_makers AS cm ON ml.Maker = cm.Id JOIN cars_data AS cd ON cd.Id = ml.ModelId WHERE cd.Weight < 3500 AND cm.Maker != 'Ford'
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT cm.Id, cm.Maker FROM car_makers cm WHERE (SELECT COUNT(*) FROM model_list WHERE Maker = cm.Id) >= 2 AND (SELECT COUNT(*) FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Maker = cm.Id)) > 3
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(DISTINCT ml.ModelId) >= 2 AND (SELECT COUNT(*) FROM cars_data cd WHERE cd.Id = cm.Id) > 3
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries LEFT JOIN car_makers ON countries.CountryId = car_makers.Country LEFT JOIN model_list ON car_makers.Id = model_list.Maker WHERE model_list.Model = 'fiat' OR (SELECT COUNT(*) FROM car_makers WHERE car_makers.Country = countries.CountryId) > 3
SELECT c.CountryId, c.CountryName FROM countries c LEFT JOIN car_makers cm ON c.CountryId = cm.Country LEFT JOIN model_list ml ON cm.Id = ml.Maker GROUP BY c.CountryId HAVING COUNT(DISTINCT cm.Id) > 3 OR COUNT(CASE WHEN ml.Model = 'fiat' THEN 1 ELSE NULL END) >= 1
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT DISTINCT a.Airline, a.Abbreviation FROM airlines a WHERE a.Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT count(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton Airport'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT DISTINCT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen';
SELECT COUNT(*) FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ABD'
SELECT count(*) FROM flights AS F JOIN airports AS A1 ON F.SourceAirport = A1.AirportCode JOIN airports AS A2 ON F.DestAirport = A2.AirportCode WHERE A1.City = 'Aberdeen' AND A2.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'
SELECT count(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'
SELECT count(*) FROM flights INNER JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'
SELECT COUNT(DISTINCT flights.FlightNo) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights WHERE Airline = (SELECT uid FROM airlines WHERE Airline = 'United Airlines') AND SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'
SELECT COUNT(DISTINCT FlightNo) FROM flights, airlines, airports WHERE flights.Airline = airlines.uid AND flights.DestAirport = airports.AirportCode AND airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'Aberdeen'
SELECT City FROM airports JOIN flights ON AirportCode = DestAirport GROUP BY City HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT City, COUNT(*) Count FROM airports JOIN flights ON AirportCode = DestAirport GROUP BY City) sub)
SELECT a.City FROM airports a JOIN flights f ON a.AirportCode = f.DestAirport GROUP BY a.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports, flights WHERE airports.AirportCode = flights.SourceAirport GROUP BY City HAVING COUNT(flights.FlightNo) = (SELECT MAX(FlightCount) FROM (SELECT COUNT(FlightNo) as FlightCount FROM flights GROUP BY SourceAirport) as subquery)
SELECT a.City FROM airports a, flights f WHERE a.AirportCode = f.SourceAirport GROUP BY a.City HAVING COUNT(f.SourceAirport) = (SELECT MAX(Cnt) FROM (SELECT COUNT(SourceAirport) AS Cnt FROM flights GROUP BY SourceAirport) tmp)
SELECT a.AirportCode FROM airports a JOIN (SELECT SourceAirport, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport UNION ALL SELECT DestAirport, COUNT(*) FROM flights GROUP BY DestAirport) b ON a.AirportCode = b.SourceAirport GROUP BY a.AirportCode HAVING SUM(b.FlightCount) = (SELECT MAX(c.TotalFlights) FROM (SELECT SourceAirport, SUM(FlightCount) AS TotalFlights FROM (SELECT SourceAirport, COUNT(*) AS FlightCount FROM flights GROUP BY SourceAirport UNION ALL SELECT DestAirport, COUNT(*) FROM flights GROUP BY DestAirport) d GROUP BY SourceAirport) c)
WITH CombinedFlights AS (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport FROM flights) SELECT AirportCode FROM CombinedFlights GROUP BY AirportCode HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM CombinedFlights GROUP BY AirportCode))
SELECT a.AirportCode FROM airports a LEFT JOIN (SELECT SourceAirport, COUNT(*) as OutFlights FROM flights GROUP BY SourceAirport UNION ALL SELECT DestAirport, COUNT(*) as InFlights FROM flights GROUP BY DestAirport) f ON a.AirportCode = f.SourceAirport GROUP BY a.AirportCode ORDER BY COUNT(f.SourceAirport) ASC LIMIT 1
SELECT A.AirportCode FROM airports A LEFT JOIN (SELECT SourceAirport AS Airport FROM flights UNION ALL SELECT DestAirport AS Airport FROM flights) F ON A.AirportCode = F.Airport GROUP BY A.AirportCode ORDER BY COUNT(F.Airport) ASC LIMIT 1
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.uid HAVING COUNT(f.FlightNo) = (SELECT MAX(FlightCount) FROM (SELECT COUNT(FlightNo) AS FlightCount FROM flights GROUP BY Airline))
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM flights GROUP BY Airline)))
SELECT a.Abbreviation, a.Country FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.uid HAVING COUNT(f.FlightNo) = (SELECT MIN(total_flights) FROM (SELECT COUNT(*) AS total_flights FROM flights GROUP BY Airline))
SELECT Abbreviation, Country FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM flights GROUP BY Airline) AS CountTable))
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = 'AHD')
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.uid HAVING COUNT(DISTINCT f.SourceAirport) = 2
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.uid HAVING COUNT(DISTINCT f.SourceAirport) = 2
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT DISTINCT A.Airline FROM airlines A, flights F WHERE A.uid = F.Airline AND F.SourceAirport = 'CVO' AND A.uid NOT IN (SELECT F3.Airline FROM flights F3 WHERE F3.SourceAirport = 'APG')
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.uid HAVING COUNT(*) >= 10
SELECT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.uid HAVING COUNT(*) >= 10
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(FlightNo) < 200)
SELECT A.Airline FROM airlines A WHERE (SELECT COUNT(*) FROM flights F WHERE A.uid = F.Airline) < 200
SELECT DISTINCT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT DISTINCT flights.FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT DISTINCT f.FlightNo FROM flights f INNER JOIN airports a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City IN ('Aberdeen', 'Abilene'))
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City IN ('Aberdeen', 'Abilene'))
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC, Name COLLATE NOCASE
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City, COUNT(*) AS NumberOfEmployees FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT Location, COUNT(Shop_ID) AS Num_Shops FROM shop GROUP BY Location
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT min(Number_products) , max(Number_products) FROM shop
SELECT MIN(Number_products) AS MinProducts, MAX(Number_products) AS MaxProducts FROM shop
SELECT MIN(Number_products) AS MinProducts, MAX(Number_products) AS MaxProducts FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_id HAVING COUNT(Employee_ID) = (SELECT MAX(counts) FROM (SELECT COUNT(Employee_ID) as counts FROM evaluation GROUP BY Employee_ID)))
SELECT e.Name FROM employee e WHERE (SELECT COUNT(*) FROM evaluation ev WHERE ev.Employee_ID = e.Employee_ID) = (SELECT MAX(c) FROM (SELECT COUNT(*) c FROM evaluation GROUP BY Employee_ID) temp)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation WHERE Bonus = (SELECT MAX(Bonus) FROM evaluation))
SELECT e.Name FROM employee e, evaluation ev WHERE e.Employee_ID = ev.Employee_ID AND ev.Bonus = (SELECT MAX(Bonus) FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name, Employee_ID FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID HAVING COUNT(h.Employee_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Employee_ID) as cnt FROM hiring GROUP BY Shop_ID) as max_cnt)
SELECT s.Name FROM shop s, hiring h WHERE s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name HAVING COUNT(h.Employee_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Employee_ID) AS Cnt FROM hiring GROUP BY Shop_ID))
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name, (SELECT COUNT(*) FROM hiring WHERE Shop_ID = shop.Shop_ID) AS NumberOfEmployees FROM shop
SELECT Name, (SELECT COUNT(*) FROM hiring WHERE Shop_ID = shop.Shop_ID) AS Employees FROM shop
SELECT sum(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop GROUP BY District HAVING MIN(Number_products) < 3000 AND MAX(Number_products) > 10000;
SELECT District FROM shop WHERE Number_products < 3000 INTERSECT SELECT District FROM shop WHERE Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)
SELECT COUNT(DISTINCT Template_ID) FROM Templates
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT count(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'
SELECT Templates.Template_ID, COUNT(Documents.Document_ID) FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT Template_ID, Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) = (SELECT MAX(c) FROM (SELECT COUNT(Document_ID) AS c FROM Documents GROUP BY Template_ID) tmp))
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_id GROUP BY T.Template_ID, T.Template_Type_Code HAVING COUNT(D.Document_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Document_ID) AS Cnt FROM Documents GROUP BY Template_ID) Temp)
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT DISTINCT t.Template_ID FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY t.Template_ID HAVING COUNT(DISTINCT d.Document_ID) > 1
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT COUNT(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'P´PT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT r.Template_Type_Code, COUNT(t.Template_ID) AS Template_Count FROM Ref_Template_Types r LEFT JOIN Templates t ON r.Template_Type_Code = t.Template_Type_Code GROUP BY r.Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT T.Template_Type_Code FROM Templates T GROUP BY T.Template_Type_Code HAVING COUNT(T.Template_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Template_ID) AS Cnt FROM Templates GROUP BY Template_Type_Code) Temp)
WITH CountedTemplates AS (SELECT Template_Type_Code, COUNT(*) AS TemplateCount FROM Templates GROUP BY Template_type_code) SELECT Template_Type_Code FROM CountedTemplates WHERE TemplateCount = (SELECT MAX(TemplateCount) FROM CountedTemplates)
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents WHERE Document_Name = 'Data base')
SELECT DISTINCT Template_Type_Code FROM Templates, Documents WHERE Templates.Template_ID = Documents.Template_ID AND Documents.Document_Name = 'Data base'
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT D.Document_Name FROM Documents D JOIN Templates T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT r.Template_Type_Code, COUNT(d.Document_ID) AS Document_Count FROM Ref_Template_Types r LEFT JOIN Templates t ON r.Template_Type_Code = t.Template_Type_Code LEFT JOIN Documents d ON t.Template_ID = d.Template_ID GROUP BY r.Template_Type_Code
SELECT RTT.Template_Type_Code, COUNT(DISTINCT D.Document_ID) AS Document_Count FROM Ref_Template_Types RTT LEFT JOIN Templates T ON RTT.Template_Type_Code=T.Template_Type_Code LEFT JOIN Documents D ON T.Template_ID=D.Template_ID GROUP BY RTT.Template_Type_Code
SELECT Template_Type_Code FROM Templates t JOIN Documents d ON t.Template_ID = d.Template_id GROUP BY t.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code))
SELECT t.Template_Type_Code FROM Templates t INNER JOIN Documents d ON t.Template_ID = d.Template_id GROUP BY t.Template_Type_Code HAVING COUNT(d.Document_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(d2.Document_ID) AS cnt FROM Templates t2 INNER JOIN Documents d2 ON t2.Template_ID = d2.Template_ID GROUP BY t2.Template_Type_Code))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT TTT.Template_Type_Description FROM Ref_Template_Types TTT JOIN Templates T ON TTT.Template_Type_Code = T.Template_Type_Code JOIN Documents D ON T.Template_ID = D.Template_ID
SELECT DISTINCT Template_Details FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN (SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Presentation')
SELECT Template_ID FROM Templates WHERE Template_Details = 'Presentation'
SELECT COUNT(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Documents.Document_Name = 'Summer Show'
SELECT * FROM Paragraphs WHERE Paragraph_Text = 'Korea '
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Document_Name = 'Welcome to NY'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Document_Name = 'Welcome to NY'
SELECT P.Paragraph_Text FROM Paragraphs P INNER JOIN Documents D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS Paragraph_Count FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_Id GROUP BY d.Document_ID ORDER BY d.Document_ID
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS NumberOfParagraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_id GROUP BY d.Document_ID ORDER BY d.Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS ParagraphCount FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS NumberOfParagraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_id GROUP BY d.Document_ID, d.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN Paragraphs P ON D.Document_ID = P.Document_ID GROUP BY D.Document_id, D.Document_Name HAVING COUNT(P.Paragraph_ID) = (SELECT MAX(CountP) FROM (SELECT COUNT(Paragraph_ID) AS CountP FROM Paragraphs GROUP BY Document_ID) AS MaxP)
SELECT Document_ID, Document_Name FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Paragraph_ID) AS Count FROM Paragraphs GROUP BY Document_ID)))
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = (SELECT MIN(p_count) FROM (SELECT COUNT(Paragraph_ID) AS p_count FROM Paragraphs GROUP BY Document_ID))
SELECT d.Document_ID FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID ORDER BY COUNT(p.Paragraph_ID) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2)
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland') GROUP BY Document_ID HAVING COUNT(DISTINCT Paragraph_Text) = 2
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%') AND Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%')
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT DISTINCT t.Name FROM teacher t WHERE t.Hometown <> 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT t.hometown FROM teacher t WHERE t.Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher t GROUP BY Hometown HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM teacher GROUP BY Hometown) AS Counts)
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T.Name, C.Course FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID JOIN course C ON CA.Course_ID = C.Course_ID
SELECT teacher.Name, course.Course FROM teacher JOIN course_arrange ON teacher.Teacher_ID = course_arrange.Teacher_ID JOIN course ON course.Course_ID = course_arrange.Course_ID
SELECT t.Name, c.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC, c.Course ASC
SELECT t.Name, c.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC, c.Course ASC
SELECT T.Name FROM teacher T JOIN course_arrange C ON T.Teacher_ID = C.Teacher_ID JOIN course CO ON C.Course_ID = CO.Course_ID WHERE CO.Course = 'math'
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange WHERE Course_ID IN (SELECT Course_ID FROM course WHERE Course = 'Math'))
SELECT Name, COUNT(Course_ID) FROM teacher, course_arrange WHERE teacher.Teacher_ID = course_arrange.Teacher_ID GROUP BY teacher.Teacher_ID
SELECT Name, COUNT(Course_ID) AS CourseCount FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(DISTINCT ca.Course_ID) >= 2
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name HAVING COUNT(DISTINCT ca.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum WHERE Num_of_Staff = (SELECT MAX(Num_of_Staff) FROM museum)
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT ID, Name, Age FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit GROUP BY visitor_ID, Museum_ID HAVING COUNT(*) > 1)
SELECT vi.ID, vi.Name, vi.Level_of_membership FROM visitor vi, visit vt WHERE vi.ID = vt.visitor_ID GROUP BY vi.ID, vi.Name, vi.Level_of_membership HAVING sum(vt.Total_spent) = (SELECT max(total) FROM (SELECT sum(Total_spent) as total FROM visit GROUP BY visitor_ID))
SELECT m.Museum_ID, m.Name FROM museum m INNER JOIN visit v ON m.Museum_ID = v.Museum_ID GROUP BY m.Museum_ID HAVING COUNT(v.Museum_ID) = (SELECT MAX(c) FROM (SELECT COUNT(*) as c FROM visit GROUP BY Museum_ID) t)
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT Name, Age FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit WHERE Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit))
SELECT avg(Num_of_Ticket), max(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE Level_of_membership = 1
SELECT DISTINCT v.Name FROM visitor v WHERE EXISTS (SELECT * FROM visit vi INNER JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE vi.visitor_ID = v.ID AND m.Open_Year < 2009) AND EXISTS (SELECT * FROM visit vi INNER JOIN museum m ON vi.Museum_ID = m.Museum_ID WHERE vi.visitor_ID = v.ID AND m.Open_Year > 2011)
SELECT COUNT(DISTINCT v.ID) FROM visitor v WHERE NOT EXISTS (SELECT 1 FROM visit vi INNER JOIN museum m ON vi.Museum_ID = m.Museum_ID AND m.Open_Year > 2010 WHERE vi.visitor_ID = v.ID)
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM players
SELECT (SELECT COUNT(*) FROM matches) + (SELECT COUNT(*) FROM qualifying_matches) AS total_matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(l_age.loser_age) AS Average_Loser_Age, AVG(w_age.winner_age) AS Average_Winner_Age FROM matches l_age, matches w_age
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches WHERE loser_rank IS NOT NULL
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(match_num) > 10
SELECT DISTINCT p.first_name || ' ' || p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.year IN (2013, 2016) GROUP BY p.player_id HAVING COUNT(DISTINCT m.year) = 2
SELECT DISTINCT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.year IN (2013, 2016) GROUP BY p.player_id HAVING COUNT(DISTINCT m.year) = 2
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT DISTINCT p.first_name, p.country_code FROM players p INNER JOIN matches m ON m.winner_id = p.player_id WHERE m.tourney_name IN ('Australian Open', 'WTA Championships') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2
SELECT DISTINCT p.first_name, p.country_code FROM players p INNER JOIN matches m ON m.winner_id = p.player_id WHERE m.tourney_name IN ('Australian Open', 'WTA Championships') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date, player_id ASC
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY r.player_id ORDER BY SUM(r.tours) DESC LIMIT 1
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id HAVING SUM(r.tours) = (SELECT MAX(t.tours_sum) FROM (SELECT SUM(tours) AS tours_sum FROM rankings GROUP BY player_id) t)
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC, year ASC LIMIT 1
SELECT year FROM (SELECT year, COUNT(*) as total_matches FROM matches GROUP BY year ORDER BY total_matches DESC, year ASC) AS temp LIMIT 1
SELECT p.first_name, p.last_name, SUM(m.winner_rank_points) AS total_rank_points FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id HAVING COUNT(m.winner_id) = (SELECT MAX(win_count) FROM (SELECT winner_id, COUNT(*) AS win_count FROM matches GROUP BY winner_id))
SELECT p.first_name || ' ' || p.last_name AS full_name, SUM(m.winner_rank_points) AS total_points FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY m.winner_id ORDER BY COUNT(m.winner_id) DESC LIMIT 1;
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' AND m.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT p.first_name, p.last_name FROM players p JOIN matches m ON m.winner_id = p.player_id WHERE m.tourney_name = 'Australian Open' ORDER BY m.winner_rank_points DESC LIMIT 1
SELECT m.loser_name, m.winner_name FROM matches m WHERE m.minutes = (SELECT MAX(minutes) FROM matches)
SELECT m1.winner_name AS Winner, m1.loser_name AS Loser FROM matches m1 WHERE m1.minutes = (SELECT MAX(minutes) FROM matches)
SELECT player_id, first_name, AVG(ranking) AS average_ranking FROM players JOIN rankings USING(player_id) GROUP BY player_id, first_name
SELECT player_id, first_name, AVG(ranking) AS average_ranking FROM players JOIN rankings USING(player_id) GROUP BY player_id, first_name
SELECT players.player_id, players.first_name, COALESCE(SUM(rankings.ranking_points), 0) AS TotalRankingPoints FROM players LEFT JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name
SELECT p.first_name, COALESCE(SUM(r.ranking_points), 0) AS total_points FROM players p LEFT JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT country_code, COUNT(*) AS number_of_players FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
WITH CountryCounts AS (SELECT country_code, COUNT(*) AS PlayerCount FROM players GROUP BY country_code) SELECT country_code FROM CountryCounts WHERE PlayerCount = (SELECT MAX(PlayerCount) FROM CountryCounts)
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) AS total_matches FROM matches GROUP BY year
SELECT p.first_name || ' ' || p.last_name AS winner_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY p.birth_date DESC LIMIT 3
SELECT p.first_name || ' ' || p.last_name AS winner_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY p.birth_date DESC LIMIT 3
SELECT COUNT(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'
SELECT COUNT(DISTINCT winner_id) FROM matches WHERE winner_hand = 'L' AND tourney_name LIKE '%WTA Championships%'
SELECT first_name, country_code, birth_date FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches))
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id ORDER BY SUM(m.winner_rank_points) DESC LIMIT 1
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, date, result FROM battle
SELECT caused_by_ship_id, MAX(killed), MIN(killed) FROM death GROUP BY caused_by_ship_id
SELECT AVG(injured) FROM death
SELECT killed, injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't')
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT b.id, b.name FROM battle AS b, ship AS s WHERE b.id = s.lost_in_battle AND s.ship_type = 'Brig'
SELECT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle JOIN death ON ship.id = death.caused_by_ship_id GROUP BY battle.id, battle.name HAVING SUM(death.killed) > 10
SELECT S.id, S.name FROM ship S JOIN death D ON S.id = D.caused_by_ship_id GROUP BY S.id, S.name HAVING SUM(D.injured) = (SELECT MAX(total_injuries) FROM (SELECT SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id))
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = 225)
SELECT b.name, b.date FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.name IN ('Lettice', 'HMS Atalanta')
SELECT b.name, b.result, b.bulgarian_commander FROM battle b WHERE NOT EXISTS (SELECT 1 FROM ship s WHERE s.lost_in_battle = b.id AND s.location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses;
SELECT count(*) FROM Courses;
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT C.course_description FROM Courses C WHERE C.course_name LIKE '%Math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea';
SELECT Departments.department_name, Departments.department_id FROM Departments INNER JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id GROUP BY Departments.department_id HAVING COUNT(Degree_Programs.degree_program_id) = (SELECT MAX(degree_count) FROM (SELECT COUNT(degree_program_id) AS degree_count FROM Degree_Programs GROUP BY department_id) AS Counts)
SELECT d.department_id, d.department_name FROM Departments d, Degree_Programs dp WHERE d.department_id = dp.department_id GROUP BY d.department_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Degree_Programs GROUP BY department_id) as MaxCount)
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT COUNT(DISTINCT department_id) FROM Departments
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'Engineering'
SELECT COUNT(degree_program_id) FROM Degree_Programs WHERE department_id IN (SELECT department_id FROM Departments WHERE department_name LIKE 'Engineering')
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT c.course_name, c.course_id FROM Courses c LEFT JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id HAVING COUNT(s.section_id) <= 2
SELECT c.course_id, c.course_name FROM Courses c LEFT JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id HAVING COUNT(s.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT S.semester_id, S.semester_name FROM Semesters S WHERE EXISTS (SELECT 1 FROM Student_Enrolment SE WHERE SE.semester_id = S.semester_id GROUP BY SE.semester_id HAVING COUNT(SE.student_id) = (SELECT MAX(COUNT_SE) FROM (SELECT COUNT(student_id) AS COUNT_SE FROM Student_Enrolment GROUP BY semester_id) AS Counts))
SELECT semester_id, semester_name FROM Semesters JOIN Student_Enrolment USING(semester_id) GROUP BY semester_id, semester_name HAVING COUNT(student_id) = (SELECT MAX(count) FROM (SELECT COUNT(student_id) as count FROM Student_Enrolment GROUP BY semester_id) as counts)
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s WHERE s.student_id IN (SELECT se.student_id FROM Student_Enrolment se GROUP BY se.student_id, se.semester_id HAVING COUNT(DISTINCT se.degree_program_id) = 2)
SELECT first_name, middle_name, last_name, student_id FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2)
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name LIKE '%Bachelor%'))
SELECT s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Bachelors'
SELECT DP.degree_summary_name FROM Degree_Programs AS DP JOIN Student_Enrolment AS SE ON DP.degree_program_id = SE.degree_program_id GROUP BY DP.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.degree_summary_name FROM Degree_Programs AS D JOIN Student_Enrolment AS SE ON D.degree_program_id = SE.degree_program_id GROUP BY D.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT degree_program_id, degree_summary_name FROM Degree_Programs WHERE degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) count FROM Student_Enrolment GROUP BY degree_program_id) as counts))
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id HAVING COUNT(Student_Enrolment.student_id) = (SELECT MAX(total_enrolled) FROM (SELECT COUNT(student_id) AS total_enrolled FROM Student_Enrolment GROUP BY degree_program_id) counts)
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_id) AS TotalEnrollment FROM Students s INNER JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(se.student_id) = (SELECT MAX(Total) FROM (SELECT COUNT(student_id) AS Total FROM Student_Enrolment GROUP BY student_id) AS SubQuery) ORDER BY TotalEnrollment DESC
SELECT S.first_name, S.middle_name, S.last_name, S.student_id, COUNT(SE.student_id) AS num_enrollments FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY S.student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT sm.semester_name FROM Semesters sm WHERE NOT EXISTS (SELECT 1 FROM Student_Enrolment WHERE semester_id = sm.semester_id)
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL
SELECT DISTINCT C.course_name FROM Courses C JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id
SELECT course_name FROM Courses WHERE course_id IN (SELECT DISTINCT course_id FROM Student_Enrolment_Courses)
SELECT course_name FROM Courses WHERE course_id IN (SELECT course_id FROM Student_Enrolment_Courses GROUP BY course_id ORDER BY COUNT(student_course_id) DESC LIMIT 1)
SELECT C.course_name FROM Courses C INNER JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id GROUP BY C.course_id HAVING COUNT(SEC.student_course_id) = (SELECT MAX(CNT) FROM (SELECT COUNT(student_course_id) AS CNT FROM Student_Enrolment_Courses GROUP BY course_id) T)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT DISTINCT Students.last_name FROM Students, Addresses WHERE Students.current_address_id = Addresses.address_id AND Addresses.state_province_county = 'North Carolina' AND Students.student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts T1 JOIN Transcript_Contents T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM Addresses a JOIN Students s ON a.address_id = s.current_address_id GROUP BY a.address_id, a.line_1, a.line_2, a.line_3 ORDER BY COUNT(s.student_id) DESC LIMIT 1
SELECT a.address_id, a.line_1, a.line_2 FROM Addresses a INNER JOIN Students s ON a.address_id IN (s.current_address_id, s.permanent_address_id) GROUP BY a.address_id ORDER BY COUNT(*) DESC, a.address_id LIMIT 1
SELECT AVG(SUBSTRING(transcript_date, 1, 4)) FROM Transcripts
SELECT avg(transcript_date) FROM Transcripts
SELECT transcript_date FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT count(*) FROM Transcripts;
SELECT count(*) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT t.student_course_id FROM Transcript_Contents t GROUP BY t.student_course_id HAVING COUNT(t.transcript_id) = (SELECT MAX(c.count) FROM (SELECT COUNT(*) as count FROM Transcript_Contents GROUP BY student_course_id) c)
SELECT course_id, student_enrolment_id FROM Student_Enrolment_Courses WHERE student_course_id IN (SELECT student_course_id FROM Transcript_Contents GROUP BY student_course_id ORDER BY COUNT(transcript_id) DESC LIMIT 1)
SELECT t.transcript_id, t.transcript_date FROM Transcripts t LEFT JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id ORDER BY COUNT(tc.student_course_id) ASC, t.transcript_id ASC LIMIT 1
SELECT t.transcript_date, t.transcript_id FROM Transcripts t LEFT JOIN Transcript_Contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id ORDER BY COUNT(tc.student_course_id) ASC LIMIT 1
SELECT Semester.semester_name FROM Semesters AS Semester WHERE EXISTS (SELECT 1 FROM Student_Enrolment AS Enrolment JOIN Degree_Programs AS Degree ON Enrolment.degree_program_id = Degree.degree_program_id JOIN Departments AS Dept ON Degree.department_id = Dept.department_id WHERE Semester.semester_id = Enrolment.semester_id AND Dept.department_name = 'Master') AND EXISTS (SELECT 1 FROM Student_Enrolment AS Enrolment JOIN Degree_Programs AS Degree ON Enrolment.degree_program_id = Degree.degree_program_id JOIN Departments AS Dept ON Degree.department_id = Dept.department_id WHERE Semester.semester_id = Enrolment.semester_id AND Dept.department_name = 'Bachelor')
SELECT DISTINCT s.semester_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY s.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT current_address_id FROM Students UNION SELECT DISTINCT permanent_address_id FROM Students
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC
SELECT section_description FROM Sections WHERE section_name = 'H'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT DISTINCT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country LIKE 'Haiti') OR cell_mobile_number LIKE '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Country, COUNT(id) AS Total_Channels FROM TV_Channel GROUP BY Country ORDER BY Total_Channels DESC LIMIT 1
SELECT Country, COUNT(*) AS Total FROM TV_Channel GROUP BY Country HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) as Count FROM TV_Channel GROUP BY Country) Subquery)
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(Language) AS Count FROM TV_Channel GROUP BY Language HAVING COUNT(Language) = (SELECT MIN(Count) FROM (SELECT COUNT(Language) AS Count FROM TV_Channel GROUP BY Language) AS Subquery)
SELECT Language, COUNT(*) AS ChannelUsage FROM TV_Channel GROUP BY Language HAVING ChannelUsage = (SELECT MIN(ChannelUsage) FROM (SELECT COUNT(*) AS ChannelUsage FROM TV_Channel GROUP BY Language) AS UsageTable)
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(id) FROM TV_Channel GROUP BY Language
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Title = 'The Rise of the Blue Beetle!')
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Title = 'The Rise of the Blue Beetle')
SELECT Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT Cartoon.Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating ASC, id ASC
SELECT Episode FROM TV_series ORDER BY Rating, id
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3
SELECT min(Share), max(Share) FROM TV_series
SELECT max(Share), min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series WHERE Episode = 'A Love of a Lifetime')
SELECT series_name FROM TV_Channel WHERE id IN (SELECT Channel FROM TV_series WHERE Episode = 'A Love of a Lifetime')
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) AS Total_Cartoons FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Cartoon.Production_code, Cartoon.Channel FROM Cartoon WHERE Cartoon.Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes';
SELECT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT C.Country FROM Cartoon AS A JOIN TV_Channel AS C ON A.Channel = C.id WHERE A.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel EXCEPT SELECT TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel EXCEPT SELECT Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Written_by = 'Todd Casey'
SELECT series_name, Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Michael. Chang')
SELECT C.series_name, C.Country FROM TV_Channel C JOIN Cartoon A ON C.id = A.Channel WHERE A.Directed_by IN ('Ben Jones', 'Michael Chang') GROUP BY C.id HAVING COUNT(DISTINCT A.Directed_by) = 2
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)
SELECT money_rank FROM poker_player WHERE earnings = (SELECT MAX(earnings) FROM poker_player)
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT pe.Name FROM poker_player AS pp JOIN people AS pe ON pp.People_ID = pe.People_ID
SELECT people.Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT p.Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings > 300000
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Final_Table_Made ASC, pp.Earnings DESC, pp.Poker_Player_ID ASC
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Final_Table_Made ASC, p.Name ASC, pp.Poker_Player_ID ASC
SELECT p.Birth_Date FROM people p INNER JOIN poker_player pp ON p.People_ID = pp.People_ID WHERE pp.Earnings = (SELECT MIN(Earnings) FROM poker_player)
SELECT P.Birth_Date FROM people P JOIN poker_player PP ON P.People_ID = PP.People_ID WHERE PP.Earnings = (SELECT MIN(Earnings) FROM poker_player)
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Height = (SELECT MAX(Height) FROM people)
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Height = (SELECT MAX(Height) FROM people)
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT AVG(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Earnings DESC, p.Name ASC
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Earnings DESC, p.Name ASC, pp.Poker_Player_ID ASC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(Nationality) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM people GROUP BY Nationality) t)
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC
SELECT people.Name FROM people WHERE Nationality != (SELECT Nationality FROM people WHERE Nationality = 'Russia')
SELECT Name FROM people WHERE Nationality <> 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE
SELECT max(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name <> 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name HAVING COUNT(v.vote_id) >= 2
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name HAVING COUNT(v.vote_id) = (SELECT MIN(vote_count) FROM (SELECT contestant_number, COUNT(vote_id) AS vote_count FROM VOTES GROUP BY contestant_number) temp)
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT count(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT ac.area_code FROM AREA_CODE_STATE ac WHERE ac.state IN (SELECT v.state FROM VOTES v GROUP BY v.state HAVING COUNT(v.vote_id) = (SELECT COUNT(*) FROM VOTES GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1))
SELECT V.created, V.state, V.phone_number FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES WHERE contestant_number IN (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabitha Gehling') INTERSECT SELECT state FROM VOTES WHERE contestant_number IN (SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Kelly Clauss'))
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE INSTR(GovernmentForm, 'republic') > 0
SELECT COUNT(Code) FROM country WHERE GovernmentForm LIKE '%Republic%'
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT country.Region FROM country WHERE Code IN (SELECT CountryCode FROM city WHERE Name = 'Kabul')
SELECT DISTINCT country.Region FROM country INNER JOIN city ON country.Code = city.CountryCode WHERE city.Name = 'Kabul'
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' ORDER BY Percentage DESC LIMIT 1
SELECT cl.Language FROM countrylanguage cl, country c WHERE cl.CountryCode = c.Code AND c.Name = 'Aruba' AND cl.Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = c.Code)
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia') AND Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT sum(Population), max(GNP) FROM country WHERE Continent = 'Asia'
SELECT sum(Population), max(GNP) FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT total(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland' GROUP BY District
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage AS cl JOIN country AS c ON cl.CountryCode = c.Code WHERE c.Name = 'Aruba'
SELECT COUNT(*) FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.Name = 'Aruba'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name ORDER BY COUNT(cl.Language) DESC LIMIT 1
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code ORDER BY COUNT(cl.Language) DESC LIMIT 1
SELECT DISTINCT C.Continent FROM country C JOIN countrylanguage L ON C.Code = L.Countrycode GROUP BY C.Continent HAVING COUNT(DISTINCT L.Language) = (SELECT MAX(LangCount) FROM (SELECT COUNT(DISTINCT Language) AS LangCount FROM countrylanguage GROUP BY CountryCode))
SELECT c.Continent FROM country c, countrylanguage cl WHERE c.Code = cl.CountryCode GROUP BY c.Continent HAVING COUNT(DISTINCT cl.Language) = (SELECT MAX(language_count) FROM (SELECT COUNT(DISTINCt Language) AS language_count FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent))
SELECT COUNT(*) FROM (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch')
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T'
SELECT c.Name FROM country AS c WHERE EXISTS (SELECT 1 FROM countrylanguage cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English') AND EXISTS (SELECT 1 FROM countrylanguage cl WHERE cl.CountryCode = c.Code AND cl.Language = 'French')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language='English' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language='French')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'French') AND IsOfficial = 'T')
SELECT COUNT(DISTINCT c.Continent) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese'
SELECT COUNT(DISTINCT Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language = 'Chinese'
SELECT DISTINCT c.Region FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch')
SELECT DISTINCT Region FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('Dutch', 'English'))
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T')
SELECT country.Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T')
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE Continent = 'Asia')
SELECT W.Language FROM (SELECT Language, COUNT(CountryCode) as NumNations FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language) W WHERE W.NumNations = (SELECT MAX(NumNations) FROM (SELECT Language, COUNT(CountryCode) as NumNations FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language) X)
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm = 'Republic') GROUP BY Language HAVING COUNT(*) = 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm = 'Republic') GROUP BY Language HAVING COUNT(*) = 1
SELECT c.Name, c.Population FROM city c JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1
SELECT Name, Population FROM city WHERE ID IN (SELECT Capital FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')) ORDER BY Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT AVG(c.LifeExpectancy) FROM country AS c LEFT JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial != 'T' OR cl.Language != 'English'
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(Population) FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language LIKE 'English%')
SELECT SUM(c.Population) FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English')
SELECT countrylanguage.Language FROM countrylanguage INNER JOIN country ON country.Code = countrylanguage.CountryCode WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage INNER JOIN country ON country.Code = countrylanguage.CountryCode WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT min(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT c1.Name FROM country AS c1 WHERE c1.Continent = 'Asia' AND NOT EXISTS (SELECT 1 FROM country AS c2 WHERE c2.Continent = 'Africa' AND c2.Population >= c1.Population)
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT CountryCode FROM countrylanguage WHERE NOT Language = 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT city.Name FROM city INNER JOIN country ON city.CountryCode = country.Code INNER JOIN countrylanguage ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Europe' AND countrylanguage.Language = 'English' AND countrylanguage.IsOfficial <> 'T'
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code WHERE co.Continent = 'Europe' AND c.CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT c.Name, c.Population FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Population, Name, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT C.Name, COUNT(L.Language) FROM country C JOIN countrylanguage L ON C.Code = L.CountryCode GROUP BY C.Code HAVING COUNT(L.Language) >= 3
SELECT c.Name, COUNT(*) AS LanguageCount FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name HAVING COUNT(*) > 2
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT District, COUNT(ID) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, sum(Population) AS TotalPop FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT Continent, AVG(LifeExpectancy) AS AverageLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Continent, AVG(LifeExpectancy) AS AverageLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY Name ASC, Code ASC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY Name ASC, Code ASC LIMIT 5
SELECT Name FROM country WHERE Code IN (SELECT Code FROM country ORDER BY Population DESC LIMIT 3) ORDER BY Name, Code
SELECT Name FROM country WHERE Code IN (SELECT Code FROM country ORDER BY Population DESC LIMIT 3) ORDER BY Name ASC, Code ASC
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3
SELECT Name FROM (SELECT * FROM country ORDER BY Population ASC LIMIT 3) ORDER BY Name, Code
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(cCount) FROM (SELECT COUNT(CountryCode) AS cCount FROM countrylanguage GROUP BY Language))
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(Count) FROM (SELECT COUNT(CountryCode) AS Count FROM countrylanguage GROUP BY Language))
SELECT country.Name, countrylanguage.CountryCode, countrylanguage.Language FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE (countrylanguage.CountryCode, countrylanguage.Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode)
SELECT CountryCode, Language FROM countrylanguage WHERE (CountryCode, Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY Countrycode)
SELECT COUNT(*) FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage cl2 WHERE cl2.CountryCode = countrylanguage.CountryCode))
SELECT COUNT(*) FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T')
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share) AS MaximumShare, MIN(Share) AS MinimumShare FROM performance WHERE Type <> 'Live final'
SELECT count(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT c.Name, o.Orchestra FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID
SELECT c.Name, o.Orchestra FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT c.Name FROM conductor c WHERE c.Conductor_ID IN (SELECT o.Conductor_ID FROM orchestra o GROUP BY o.Conductor_ID HAVING COUNT(o.Orchestra_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(o.Orchestra_ID) AS cnt FROM orchestra o GROUP BY o.Conductor_ID)))
SELECT c.Name FROM conductor c JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name HAVING COUNT(o.Orchestra_ID) = (SELECT MAX(CountOrchestras) FROM (SELECT COUNT(Orchestra_ID) AS CountOrchestras FROM orchestra GROUP BY Conductor_ID) temp)
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra WHERE Year_of_Founded > 2008)
SELECT c.Name FROM conductor c INNER JOIN orchestra o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_format
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_format
SELECT Record_Company FROM orchestra GROUP BY Record_Company HAVING COUNT(Orchestra_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Orchestra_ID) AS count FROM orchestra GROUP BY Record_Company))
SELECT Record_Company FROM orchestra GROUP BY Record_Company HAVING COUNT(Orchestra_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Orchestra_ID) AS Count FROM orchestra GROUP BY Record_Company) AS Counts)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSEct SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format = 'CD' OR Major_Record_Format = 'DVD'
SELECT DISTINCT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1)
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(*) > 1)
SELECT count(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(ID) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) = (SELECT MAX(grade_count) FROM (SELECT grade, COUNT(*) AS grade_count FROM Highschooler GROUP BY grade) as subquery)
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(ID) AS cnt FROM Highschooler GROUP BY grade) AS counts)
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT F.student_id, COUNT(*) AS num_friends FROM (SELECT student_id, friend_id FROM Friend UNION SELECT friend_id, student_id FROM Friend) F GROUP BY F.student_id
SELECT ID, total_friends FROM (SELECT student_id AS ID, COUNT(*) AS total_friends FROM Friend GROUP BY student_id UNION ALL SELECT friend_id, COUNT(*) FROM Friend GROUP BY friend_id) T GROUP BY ID
SELECT H.name, COUNT(F.friend_id) FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name
SELECT H.name, COUNT(DISTINCT F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID
SELECT name FROM Highschooler WHERE ID = (SELECT student_id FROM (SELECT student_id, COUNT(*) as total FROM (SELECT student_id FROM Friend UNION ALL SELECT friend_id AS student_id FROM Friend) all_friendships GROUP BY student_id) AS counts ORDER BY total DESC LIMIT 1)
SELECT H.name FROM Highschooler H WHERE H.ID IN (SELECT student_id FROM (SELECT student_id, COUNT(*) AS friend_count FROM Friend GROUP BY student_id UNION ALL SELECT friend_id AS student_id, COUNT(*) AS friend_count FROM Friend GROUP BY friend_id) AS combined WHERE friend_count = (SELECT MAX(friend_count) FROM (SELECT COUNT(*) AS friend_count FROM Friend GROUP BY student_id UNION ALL SELECT COUNT(*) AS friend_count FROM Friend GROUP BY friend_id) AS max_friend))
SELECT name FROM (SELECT name, count(*) as count FROM Highschooler JOIN Friend ON ID = student_id GROUP BY name UNION SELECT name, count(*) as count FROM Highschooler JOIN Friend ON ID = friend_id GROUP BY name) WHERE count >= 3
SELECT H.name FROM Highschooler H WHERE (SELECT count(*) FROM Friend F WHERE F.student_id = H.ID OR F.friend_id = H.ID) >= 3
SELECT h.ID, f.name FROM Highschooler h JOIN Friend fr ON h.ID = fr.student_id JOIN Highschooler f ON fr.friend_id = f.ID WHERE h.name = 'Kyle'
SELECT H1.ID, H2.name FROM Highschooler H1, Highschooler H2, Friend F WHERE H1.ID = F.student_id AND H2.ID = F.friend_id AND H1.name = 'Kyle'
SELECT H.ID, COUNT(F.friend_id) AS Num_Friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT H.ID as student_id, COUNT(F.friend_id) as number_of_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler WHERE NOT EXISTS (SELECT * FROM Friend WHERE Friend.student_id = Highschooler.ID OR Friend.friend_id = Highschooler.ID)
SELECT ID FROM Highschooler WHERE NOT EXISTS (SELECT * FROM Friend WHERE Friend.student_id = Highschooler.ID OR Friend.friend_id = Highschooler.ID)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT name FROM Highschooler EXCEPT SELECT DISTINCT name FROM Highschooler, Friend WHERE Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id
SELECT DISTINCT F.student_id FROM Friend F JOIN Likes L ON F.student_id = L.liked_id
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes)
SELECT Highschooler.name FROM Highschooler INNER JOIN Friend ON Highschooler.ID = Friend.student_id INNER JOIN Likes ON Highschooler.ID = Likes.student_id
SELECT L.student_id, (COUNT(L.liked_id) + COUNT(DISTINCT R.liked_id)) as total_likes FROM Likes L LEFT JOIN Likes R ON L.student_id = R.liked_id GROUP BY L.student_id
SELECT student_id, COUNT(*) as total_likes FROM (SELECT student_id FROM Likes UNION ALL SELECT liked_id as student_id FROM Likes) AS AllLikes GROUP BY student_id
SELECT h.name, (SELECT COUNT(*) FROM Likes WHERE student_id = h.ID) AS likes_given, (SELECT COUNT(*) FROM Likes WHERE liked_id = h.ID) AS likes_received FROM Highschooler h
SELECT name, (SELECT COUNT(*) FROM Likes WHERE student_id = Highschooler.ID) AS likes_given, (SELECT COUNT(*) FROM Likes WHERE liked_id = Highschooler.ID) AS likes_received FROM Highschooler
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.liked_id GROUP BY Highschooler.ID, Highschooler.name HAVING COUNT(Likes.student_id) = (SELECT MAX(c) FROM (SELECT COUNT(student_id) as c FROM Likes GROUP BY liked_id) x)
SELECT h.name FROM Highschooler h JOIN (SELECT liked_id, COUNT(*) AS like_count FROM Likes GROUP BY liked_id HAVING like_count = (SELECT MAX(counts) FROM (SELECT COUNT(*) AS counts FROM Likes GROUP BY liked_id) AS countsTable)) AS TopLikes ON h.ID = TopLikes.liked_id
SELECT DISTINCT H.name FROM Highschooler H, Likes L WHERE H.ID = L.liked_id GROUP BY L.liked_id HAVING COUNT(L.student_id) >= 2
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id GROUP BY L.liked_id HAVING COUNT(*) >= 2
SELECT H.name FROM Highschooler H WHERE H.grade > 5 AND (SELECT COUNT(*) FROM Friend F WHERE F.student_id = H.ID OR F.friend_id = H.ID) >= 2
SELECT DISTINCT name FROM Highschooler h WHERE grade > 5 AND (SELECT COUNT(*) FROM Friend WHERE student_id = h.ID OR friend_id = h.ID) >= 2
SELECT h.ID, COUNT(*) AS NumOfLikes FROM Highschooler AS h JOIN Likes AS l ON h.ID = l.liked_id WHERE h.name = 'Kyle' GROUP BY h.ID
SELECT a.ID, COUNT(b.liked_id) AS total_likes FROM Highschooler a LEFT JOIN Likes b ON a.ID = b.liked_id WHERE a.name = 'Kyle' GROUP BY a.ID
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler EXCEPT SELECT grade FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT DISTINCT o.state FROM Owners o JOIN Professionals p ON o.state = p.state
SELECT DISTINCT o.state FROM Owners o INNER JOIN Professionals p ON o.state = p.state
SELECT AVG(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT p.professional_id, p.last_name, p.cell_number FROM Professionals p WHERE p.state = 'Indiana' OR p.professional_id IN (SELECT t.professional_id FROM Treatments t GROUP BY t.professional_id HAVING COUNT(t.treatment_id) > 2)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2)
SELECT name FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING SUM(cost_of_treatment) > 1000)
SELECT d.name FROM Dogs d WHERE NOT EXISTS (SELECT NULL FROM Treatments t WHERE t.dog_id = d.dog_id GROUP BY t.dog_id HAVING SUM(t.cost_of_treatment) > 1000)
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT DISTINCT first_name FROM Owners WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT DISTINCT first_name FROM Professionals WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT p.professional_id, p.role_code, p.email_address FROM Professionals p WHERE p.professional_id NOT IN (SELECT t.professional_id FROM Treatments t)
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(dog_id) AS cnt FROM Dogs GROUP BY owner_id) as maxDogs))
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(dog_count) FROM (SELECT COUNT(dog_id) AS dog_count FROM Dogs GROUP BY owner_id)))
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(t.treatment_id) >= 2
SELECT p.professional_id, p.role_code, p.first_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(t.treatment_id) >= 2
SELECT breed_name FROM Breeds WHERE breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(dog_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(dog_id) AS cnt FROM Dogs GROUP BY breed_code) AS cnt_table))
SELECT B.breed_name FROM Breeds B, Dogs D WHERE B.breed_code = D.breed_code GROUP BY D.breed_code HAVING COUNT(*) = (SELECT MAX(C.cnt) FROM (SELECT COUNT(*) AS cnt FROM Dogs GROUP BY breed_code) C)
SELECT O.owner_id, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name HAVING COUNT(T.treatment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(treatment_id) AS cnt FROM Treatments JOIN Dogs ON Treatments.dog_id = Dogs.dog_id GROUP BY owner_id) tmp)
SELECT first.owner_id, first.last_name FROM (SELECT o.owner_id, o.last_name, SUM(t.cost_of_treatment) AS total_cost FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name) first WHERE first.total_cost = (SELECT MAX(total_cost) FROM (SELECT SUM(t.cost_of_treatment) AS total_cost FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id) second)
SELECT ttt.treatment_type_description FROM Treatment_Types ttt JOIN Treatments t ON ttt.treatment_type_code = t.treatment_type_code GROUP BY ttt.treatment_type_code ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1
SELECT tt.treatment_type_description FROM Treatment_Types tt INNER JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code HAVING SUM(t.cost_of_treatment) = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) sub)
SELECT O.owner_id, O.zip_code FROM Owners O INNER JOIN Dogs D on O.owner_id = D.owner_id JOIN Treatments T on D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code HAVING SUM(T.cost_of_treatment) = (SELECT MAX(total_cost) FROM (SELECT SUM(cost_of_treatment) as total_cost FROM Treatments GROUP BY dog_id) as subquery)
SELECT O.owner_id, O.zip_code FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code HAVING SUM(T.cost_of_treatment) = (SELECT MAX(total_cost) FROM (SELECT SUM(T.cost_of_treatment) AS total_cost FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.owner_id) Temp)
SELECT P.professional_id, P.cell_number FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(DISTINCT T.treatment_type_code) >= 2
SELECT p.professional_id, p.cell_number FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.cell_number HAVING COUNT(DISTINCT t.treatment_type_code) >= 2
SELECT p.first_name, p.last_name FROM Professionals p WHERE p.professional_id IN (SELECT t.professional_id FROM Treatments t WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT p.first_name, p.last_name FROM Professionals p WHERE EXISTS (SELECT 1 FROM Treatments t WHERE t.professional_id = p.professional_id AND t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT Treatments.date_of_treatment, Professionals.first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT date_of_treatment, first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT cost_of_treatment, treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code
SELECT o.first_name, o.last_name, s.size_description FROM Owners o, Dogs d, Sizes s WHERE o.owner_id = d.owner_id AND d.size_code = s.size_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT o.first_name, d.name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE D.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) LIMIT 1)
SELECT name, date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM Dogs GROUP BY breed_code)))
SELECT first_name, name FROM Owners INNER JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE state = 'Virginia'
SELECT Owners.first_name, Dogs.name FROM Owners, Dogs WHERE Owners.owner_id = Dogs.owner_id AND Owners.state = 'VA'
SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT date_arrived, date_departed FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE age = (SELECT MIN(age) FROM Dogs))
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE age = (SELECT MIN(age) FROM Dogs))
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT count(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT MAX(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT SUM(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs)
SELECT COUNT(DISTINCT o.owner_id) FROM Owners o LEFT JOIN Dogs d ON o.owner_id = d.owner_id WHERE d.dog_id IS NULL
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(age) FROM Dogs
SELECT AVG(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT charge_type, sum(charge_amount) FROM Charges GROUP BY charge_type
SELECT charge_type, charge_amount FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT breed_name, size_description FROM Breeds CROSS JOIN Sizes;
SELECT DISTINCT B.breed_name, S.size_description FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code JOIN Sizes S ON D.size_code = S.size_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code
SELECT P.first_name, TT.treatment_type_description FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship HAVING COUNT(Citizenship) = (SELECT MAX(cnt) FROM (SELECT Citizenship, COUNT(*) cnt FROM singer GROUP BY Citizenship) t)
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT s.Title AS song_title, si.Name AS singer_name FROM song s JOIN singer si ON s.Singer_ID = si.Singer_ID
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT DISTINCT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID WHERE sg.Sales > 300000
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(sg.Song_ID) > 1
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song GROUP BY Singer_ID HAVING COUNT(Song_ID) > 1)
SELECT singer.Name, SUM(song.Sales) FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Singer_ID
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT RFT.feature_type_name FROM Ref_Feature_Types AS RFT JOIN Other_Available_Features AS OAF ON RFT.feature_type_code = OAF.feature_type_code WHERE OAF.feature_name = 'AirCon'
SELECT Ref_Property_Types.property_type_description, COUNT(Properties.property_id) AS PropertyCount FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code GROUP BY Properties.property_type_code
SELECT property_name FROM Properties WHERE (property_type_code IN ('HSE', 'APT')) AND room_count > 1
