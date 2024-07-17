SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT s.Name, s.Country, s.Age FROM singer s ORDER BY s.Age DESC, s.Singer_ID
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'
SELECT s.Name, s.Song_release_year FROM singer s WHERE s.Age = (SELECT MIN(Age) FROM singer)
SELECT s.Name, s.Song_Name, s.Song_release_year FROM singer AS s WHERE s.Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT singer.Country FROM singer WHERE singer.Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country , count(*) FROM singer GROUP BY Country
SELECT Country , COUNT(*) FROM singer GROUP BY Country
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT AVG(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(Capacity), avg(Capacity) FROM stadium
SELECT max(Capacity) , avg(Capacity) FROM stadium
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium) ORDER BY Stadium_ID ASC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT count(*) FROM concert WHERE Year IN (2014, 2015)
SELECT count(*) FROM concert WHERE Year IN (2014, 2015)
SELECT s.Name, COUNT(c.concert_ID) AS number_of_concerts FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID, s.Name
SELECT Stadium_ID , COUNT(*) FROM concert GROUP BY Stadium_ID
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY count(*) DESC LIMIT 1
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year > 2013 GROUP BY s.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS number_of_singers FROM concert c LEFT JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme
SELECT C.concert_Name, C.Theme, COUNT(SIC.Singer_ID) AS NumberOfSingers FROM concert AS C JOIN singer_in_concert AS SIC ON C.concert_ID = SIC.concert_ID GROUP BY C.concert_ID, C.concert_Name, C.Theme
SELECT S.Name, COUNT(*) FROM singer AS S JOIN singer_in_concert AS SC ON S.Singer_ID = SC.Singer_ID GROUP BY S.Singer_ID, S.Name
SELECT s.Name, COUNT(sic.concert_ID) AS NumberOfConcerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name
SELECT DISTINCT T2.Name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT DISTINCT s.Name FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID WHERE c.Year = 2014
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE Year = 2015)
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE Year = 2015)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT count(*) FROM Pets WHERE weight > 10
SELECT count(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT count(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT count(DISTINCT PetID) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(*) FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Student.Sex = 'F' AND Pets.PetType = 'dog'
SELECT count(*) FROM Pets AS P JOIN Has_Pet AS HP ON P.PetID = HP.PetID JOIN Student AS S ON HP.StuID = S.StuID WHERE P.PetType = 'dog' AND S.Sex = 'F'
SELECT count(DISTINCT PetType) FROM Pets
SELECT count(DISTINCT PetType) FROM Pets
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType IN ('cat', 'dog')))
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'Cat' OR T3.PetType = 'Dog'
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat') INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog'))
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat'))
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT fname, age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Dog') EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat'))
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT avg(pet_age), max(pet_age), PetType FROM Pets GROUP BY PetType
SELECT avg(pet_age), max(pet_age), PetType FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT avg(weight), PetType FROM Pets GROUP BY PetType
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT DISTINCT s.Fname, s.Age FROM Student s JOIN Has_Pet hp ON s.StuID = hp.StuID
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT PetID FROM Has_Pet WHERE StuID IN (SELECT StuID FROM Student WHERE LName = 'Smith')
SELECT StuID, COUNT(*) AS NumberOfPets FROM Has_Pet GROUP BY StuID
SELECT StuID, COUNT(PetID) AS Number_of_Pets FROM Has_Pet GROUP BY StuID
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' AND pet_age = 3))
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS num_countries FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) AS num_countries FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT count(*) FROM countries
SELECT count(*) FROM countries;
SELECT CM.FullName, CM.Id, COUNT(ML.ModelId) FROM car_makers AS CM JOIN model_list AS ML ON CM.Id = ML.Maker GROUP BY CM.Id, CM.FullName;
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS ModelCount FROM car_makers LEFT JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT Model FROM model_list WHERE ModelId = (SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM cars_data ORDER BY Horsepower ASC LIMIT 1))
SELECT Model FROM model_list WHERE Maker IN (SELECT MakeId FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE Horsepower = (SELECT MIN(Horsepower) FROM cars_data))
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data)))
SELECT ModelId FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT AVG(Weight) FROM cars_data)))
SELECT DISTINCT T2.FullName FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T4 ON T3.Model = T4.ModelId JOIN car_makers AS T2 ON T4.Maker = T2.Id WHERE T1.Year = 1970
SELECT DISTINCT car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year = 1970
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.Year ASC LIMIT 1
SELECT car_makers.FullName, MIN(cars_data.Year) FROM car_makers JOIN car_names ON car_makers.Id = car_names.MakeId JOIN cars_data ON car_names.MakeId = cars_data.Id GROUP BY car_makers.FullName ORDER BY MIN(cars_data.Year) LIMIT 1
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980
SELECT DISTINCT model_list.ModelId, model_list.Model FROM model_list JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980
SELECT C.Continent, COUNT(DISTinct M.Id) FROM continents AS C JOIN countries AS N ON C.ContId = N.Continent JOIN car_makers AS M ON N.CountryId = M.Country GROUP BY C.Continent
SELECT continents.Continent, COUNT(DISTINCT car_makers.Id) AS NumberOfCarMakers FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent LEFT JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY continents.Continent
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryName HAVING COUNT(cm.Id) = ( SELECT MAX(total) FROM ( SELECT COUNT(Id) AS total FROM car_makers GROUP BY Country ) AS max_makers )
SELECT C.CountryName FROM countries AS C JOIN car_makers AS CM ON C.CountryId = CM.Country GROUP BY C.CountryId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) , T2.FullName FROM car_makers AS T2 JOIN model_list AS T1 ON T2.Id = T1.Maker GROUP BY T2.FullName
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Make = 'amc hornet sportabout (sw)'
SELECT cars_data.Accelerate FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN model_list ON car_names.Model = model_list.ModelId WHERE model_list.Model = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM car_makers WHERE Country = (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(DISTINCT Maker) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'
SELECT COUNT(DISTINCT model_list.ModelId) FROM model_list JOIN car_makers ON car_makers.Id = model_list.Maker JOIN countries ON countries.CountryId = car_makers.Country WHERE countries.CountryName = 'USA'
SELECT COUNT(ModelId) FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'usa'))
SELECT avg(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT min(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT c.CountryId, c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country GROUP BY c.CountryId, c.CountryName HAVING COUNT(cm.Id) >= 1
SELECT CountryName, CountryId FROM countries WHERE CountryId IN (SELECT Country FROM car_makers)
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT c.CountryName FROM countries c JOIN car_makers cm ON c.CountryId = cm.Country WHERE c.Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') GROUP BY c.CountryId HAVING COUNT(cm.Id) >= 3
SELECT CountryName FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') AND CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) >= 3)
SELECT MAX(car_names.Make) AS Make, MAX(cars_data.Horsepower) AS MaxHorsepower FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3 GROUP BY car_names.Make
SELECT max(Horsepower), Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Cylinders = 3
SELECT cn.Make, ml.Model FROM cars_data cd JOIN car_names cn ON cn.MakeId = cd.Id JOIN model_list ml ON ml.ModelId = cn.Model WHERE cd.MPG = (SELECT MAX(MPG) FROM cars_data);
SELECT Model FROM model_list WHERE ModelId = (SELECT Model FROM car_names WHERE MakeId = (SELECT Id FROM cars_data ORDER BY MPG DESC LIMIT 1))
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT avg(Edispl) FROM cars_data AS CD JOIN car_names AS CN ON CD.Id = CN.MakeId JOIN model_list AS ML ON CN.Model = ML.ModelId WHERE ML.Model = 'Volvo'
SELECT avg(Edispl) FROM cars_data INNER JOIN car_names ON cars_data.Id = car_names.MakeId INNER JOIN model_list ON car_names.Model = model_list.ModelId INNER JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders;
SELECT max(cars_data.Accelerate) AS max_accelerate, cars_data.Cylinders FROM cars_data GROUP BY cars_data.Cylinders
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT Model FROM car_names GROUP BY Model ORDER BY count(*) DESC LIMIT 1
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT count(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company'
SELECT count(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company'
SELECT T1.FullName, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) > 3
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id HAVING count(model_list.ModelId) > 3
SELECT DISTINCT m.Model FROM model_list m JOIN car_makers cm ON m.Maker = cm.Id LEFT JOIN car_names cn ON cn.Model = m.ModelId LEFT JOIN cars_data cd ON cd.Id = cn.MakeId WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500
SELECT DISTINCT m.Model FROM model_list AS m JOIN car_makers AS cm ON m.Maker = cm.Id LEFT JOIN car_names AS cn ON m.ModelId = cn.Model LEFT JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cm.Maker = 'General Motors' OR cd.Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT ModelId FROM model_list WHERE Model = 'volvo')) ORDER BY Accelerate ASC LIMIT 1
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT ModelId FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'Volvo'))) ORDER BY Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data))
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2)
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT count(*) FROM cars_data WHERE Cylinders > 6
SELECT T1.Model FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T3.Model = T1.ModelId JOIN cars_data AS T4 ON T4.Id = T3.MakeId WHERE T4.Cylinders = 4 ORDER BY T4.Horsepower DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T1.Cylinders = 4 GROUP BY T2.Model ORDER BY MAX(T1.Horsepower) DESC LIMIT 1
SELECT MakeId, Make FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders <= 3)
SELECT CN.MakeId, CN.Make FROM car_names CN JOIN cars_data CD ON CN.MakeId = CD.Id WHERE CD.Cylinders < 4 AND CD.Horsepower != (SELECT MIN(Horsepower) FROM cars_data)
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT ml.ModelId FROM model_list ml JOIN car_makers cm ON ml.Maker = cm.Id JOIN car_names cn ON cn.Model = ml.ModelId JOIN cars_data cd ON cd.Id = cn.MakeId WHERE cd.Weight < 3500 AND cm.FullName <> 'Ford Motorcerfort Company'
SELECT Model FROM model_list WHERE Maker NOT IN (SELECT Id FROM car_makers WHERE Maker = 'Ford') AND ModelId IN (SELECT Model FROM cars_data WHERE Weight < 3500)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT cm.Id, cm.Maker FROM car_makers cm JOIN model_list ml ON cm.Id = ml.Maker JOIN car_names cn ON ml.ModelId = cn.Model JOIN cars_data cd ON cn.MakeId = cd.Id GROUP BY cm.Id HAVING COUNT(DISTINCT ml.ModelId) >= 2 AND COUNT(cd.Id) > 3
SELECT C.Maker, COUNT(DISTINCT ML.ModelId) AS ModelCount, COUNT(DISTINCT CD.Id) AS CarCount FROM car_makers C JOIN model_list ML ON C.Id = ML.Maker JOIN car_names CN ON ML.ModelId = CN.Model JOIN cars_data CD ON CN.MakeId = CD.Id GROUP BY C.Id HAVING ModelCount >= 2 AND CarCount > 3
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country LEFT JOIN model_list ON car_makers.Id = model_list.Maker WHERE model_list.Model = 'fiat' GROUP BY countries.CountryId HAVING count(DISTINCT car_makers.Id) > 3 OR count(model_list.Model) > 0
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON car_makers.Country = countries.CountryId LEFT JOIN model_list ON model_list.Maker = car_makers.Id AND model_list.Model = 'fiat' GROUP BY countries.CountryId HAVING COUNT(DISTINCT car_makers.Id) > 3 OR COUNT(DISTINCT model_list.ModelId) >= 1;
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT DISTINCT a.Airline, a.Abbreviation FROM airlines a WHERE a.Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT count(*) FROM airlines
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT count(*) FROM airports
SELECT count(*) FROM flights
SELECT count(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT count(*) FROM airlines WHERE Country = 'USA';
SELECT count(*) FROM airlines WHERE Country = 'USA';
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT DISTINCT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT count(*) FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE DestAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT COUNT(*) FROM flights WHERE DestAirport = 'Aberdeen'
SELECT count(*) FROM airports AS src JOIN flights ON src.AirportCode = flights.SourceAirport JOIN airports AS dst ON flights.DestAirport = dst.AirportCode WHERE src.City = 'Aberdeen' AND dst.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'JetBlue Airways'
SELECT count(*) FROM airlines AS al JOIN flights AS fl ON al.uid = fl.Airline WHERE al.Airline = 'Jetblue Airways'
SELECT count(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.DestAirport = 'ASY'
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'United Airlines' AND F.DestAirport = 'ASY'
SELECT count(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.SourceAirport = T3.AirportCode WHERE T1.Airline = 'United Airlines' AND T3.AirportCode = 'AHD'
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid JOIN airports AS P ON F.DestAirport = P.AirportCode WHERE A.Airline = 'United Airlines' AND P.City = 'Aberdeen'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.DestAirport = T3.AirportCode WHERE T1.Airline = 'United Airlines' AND T3.City = 'Aberdeen'
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1
SELECT airports.City FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY airports.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports WHERE AirportCode IN (SELECT SourceAirport FROM flights GROUP BY SourceAirport HAVING COUNT(SourceAirport) = (SELECT MAX(cnt) FROM (SELECT COUNT(SourceAirport) AS cnt FROM flights GROUP BY SourceAirport)))
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportAddr FROM flights ) AS CombinedAirports GROUP BY AirportCode HAVING COUNT(*) = ( SELECT MAX(FlightCount) FROM ( SELECT COUNT(*) AS FlightCount FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportAddr FROM flights ) AS TotalFlights GROUP BY AirportCode ) )
SELECT AirportCode FROM airports WHERE AirportCode IN ( SELECT SourceAirport FROM ( SELECT SourceAirport, COUNT(*) AS TotalFlights FROM flights GROUP BY SourceAirport ) UNION ALL SELECT DestAirport FROM ( SELECT DestAirport, COUNT(*) AS TotalFlights FROM flights GROUP BY DestAirport ) ) GROUP BY AirportCode HAVING COUNT(*) = ( SELECT MAX(FlightCount) FROM ( SELECT AirportCode, COUNT(*) AS FlightCount FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights ) AS AllFlights GROUP BY AirportCode ) AS MaxFlights )
SELECT AirportCode FROM ( SELECT AirportCode, COUNT(*) as TotalFlights FROM ( SELECT SourceAirport as AirportCode FROM flights UNION ALL SELECT DestAirport FROM flights ) AS Flights GROUP BY AirportCode ) AS AirportFlightCounts ORDER BY TotalFlights ASC LIMIT 1;
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportAsset FROM flights ) AS CombinedFlights GROUP BY AirportCode HAVING COUNT(*) = ( SELECT MIN(TotalFlights) FROM ( SELECT COUNT(*) AS TotalFlights FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights ) AS SubgroupedFlights GROUP BY AirportCode ) AS MinFlights )
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline GROUP BY A.uid HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM flights GROUP BY Airline))
SELECT A.Airline FROM airlines A WHERE A.uid IN (SELECT F.Airline FROM flights F GROUP BY F.Airline HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM flights GROUP BY Airline)))
SELECT a.Abbreviation, a.Country FROM airlines a JOIN flights f ON f.Airline = a.uid GROUP BY a.uid, a.Abbreviation, a.Country HAVING COUNT(*) = ( SELECT MIN(flight_count) FROM ( SELECT COUNT(*) AS flight_count FROM flights GROUP BY Airline ) )
SELECT Abbreviation, Country FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) = (SELECT MIN(FlightCount) FROM (SELECT Airline, COUNT(*) AS FlightCount FROM flights GROUP BY Airline) as FlightCounts))
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'AHD')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'AHD')
SELECT A.Airline FROM airlines A INNER JOIN flights F ON A.uid = F.Airline WHERE F.DestAirport = 'AHD' GROUP BY A.Airline
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE DestAirport = 'AHD')
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'C011') GROUP BY a.uid HAVING COUNT(DISTINCT f.SourceAirport) = 2
SELECT DISTINCT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline WHERE f.SourceAirport IN ('APG', 'CVO') GROUP BY a.uid HAVING COUNT(DISTINCT f.SourceAirport) = 2
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT Airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'CVO' EXCEPT SELECT Airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'APG'
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline GROUP BY A.uid HAVING COUNT(F.FlightNo) >= 10
SELECT A1.uid, A1.Airline FROM airlines AS A1 JOIN flights AS F1 ON A1.uid = F1.Airline GROUP BY A1.uid, A1.Airline HAVING count(*) >= 10
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(FlightNo) < 200)
SELECT Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY Airline HAVING count(*) < 200
SELECT T1.FlightNo FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines'
SELECT T1.FlightNo FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid WHERE T2.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT DISTINCT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport = 'ABZ'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights WHERE DestAirport IN ('Aberdeen', 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age ASC, Employee_ID ASC
SELECT Name FROM employee ORDER BY Age ASC, Name ASC
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT COUNT(*) AS number_of_shops, Location FROM shop GROUP BY Location
SELECT count(*) , Location FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT MAX(Number_products) FROM shop)
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 3
SELECT min(Number_products), max(Number_products) FROM shop
SELECT min(Number_products), max(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_ID HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM evaluation GROUP BY Employee_ID)))
SELECT E.Name FROM employee E WHERE (SELECT COUNT(*) FROM evaluation EV WHERE EV.Employee_ID = E.Employee_ID) = (SELECT MAX(Award_Count) FROM (SELECT COUNT(*) AS Award_Count FROM evaluation GROUP BY Employee_ID) AS AwardStats)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation WHERE Bonus = (SELECT MAX(Bonus) FROM evaluation))
SELECT Name FROM employee WHERE Employee_ID = (SELECT Employee_ID FROM evaluation ORDER BY Bonus DESC LIMIT 1)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Employee_ID, Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name FROM shop s INNER JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name HAVING COUNT(h.Employee_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Employee_ID) as count FROM hiring GROUP BY Shop_ID))
SELECT Name FROM shop JOIN hiring ON shop.Shop_ID = hiring.Shop_ID GROUP BY shop.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT s.Name , COUNT(*) FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Name
SELECT S.name, count(*) FROM shop S JOIN hiring H ON S.Shop_ID = H.Shop_ID GROUP BY S.Shop_ID, S.Name
SELECT sum(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop GROUP BY District HAVING MIN(Number_products) < 3000 AND MAX(Number_products) > 10000;
SELECT District FROM shop WHERE Number_products > 10000 INTERSECT SELECT District FROM shop WHERE Number_products < 3000
SELECT count(DISTINCT "Location") FROM shop
SELECT count(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT document_id, document_name, document_description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM Documents WHERE Template_ID IN (SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PPT')
SELECT count(*) FROM Documents AS doc JOIN Templates AS temp ON doc.Template_ID = temp.Template_ID JOIN Ref_Template_Types AS rt ON temp.Template_Type_Code = rt.Template_Type_Code WHERE rt.Template_Type_Description = 'PPT'
SELECT Template_ID , count(*) FROM Documents GROUP BY Template_ID
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT Template_ID, Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(Document_ID) = (SELECT MAX(Document_Count) FROM (SELECT Template_ID, COUNT(Document_ID) AS Document_Count FROM Documents GROUP BY Template_ID) tmp))
SELECT T.Template_ID, T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID, T.Template_Type_Code HAVING COUNT(D.Document_ID) = (SELECT MAX(counts) FROM (SELECT COUNT(Document_ID) AS counts FROM Documents GROUP BY Template_ID))
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID , Version_Number , Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT count(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT count(*) FROM Templates INNER JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) c FROM Templates GROUP BY Template_type_Code))
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(*) < 3;
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = 'Data base'
SELECT Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'
SELECT Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'
SELECT Ref_Template_Types.Template_Type_Code, COUNT(Documents.Document_ID) AS num_documents FROM Ref_Template_Types LEFT JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code
SELECT Ref_Template_Types.Template_Type_Code, COUNT(DISTINCT Documents.Document_ID) AS Document_Count FROM Ref_Template_Types LEFT JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code
SELECT Template_Type_Code FROM Documents d JOIN Templates t ON d.Template_ID = t.Template_ID GROUP BY t.Template_Type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_id GROUP BY T.Template_Type_Code HAVING COUNT(D.Document_ID) = ( SELECT MAX(cnt) FROM ( SELECT T1.Template_Type_Code, COUNT(D1.Document_ID) AS cnt FROM Templates T1 JOIN Documents D1 ON T1.Template_ID = D1.Template_ID GROUP BY T1.Template_Type_Code ) Temp )
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT tt.Template_Type_Code FROM Ref_Template_Types tt LEFT JOIN Templates t ON tt.Template_Type_Code = t.Template_Type_Code LEFT JOIN Documents d ON t.Template_ID = d.Template_ID WHERE d.Document_ID IS NULL GROUP BY tt.Template_Type_Code
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT Template_Details FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Template_Type_Description = 'Presentation';
SELECT Template_ID FROM Templates WHERE Template_Details LIKE '%Presentation%'
SELECT count(*) FROM Paragraphs;
SELECT count(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Paragraphs AS p JOIN Documents AS d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea '
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraphs.Paragraph_ID, Paragraphs.Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT P.Paragraph_ID, P.Paragraph_Text FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_id WHERE D.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs WHERE Document_ID IN (SELECT Document_ID FROM Documents WHERE Document_Name = 'Customer reviews')
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Document_Name = 'Customer reviews'
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS NumberOfParagraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT d.Document_ID, COUNT(p.Paragraph_ID) AS NumberOfParagraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_id = p.Document_id GROUP BY d.Document_ID ORDER BY d.Document_ID
SELECT d.Document_ID, d.Document_Name, COUNT(p.Paragraph_ID) AS Number_of_Paragraphs FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS num_paragraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) >= 2;
SELECT D.document_id, D.document_name FROM Documents D WHERE D.document_id IN (SELECT document_id FROM Paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) = (SELECT MAX(Counted) FROM (SELECT document_id, COUNT(paragraph_id) AS Counted FROM Paragraphs GROUP BY document_id) AS ParagraphCounts))
SELECT Document_ID, Document_Name FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = (SELECT MAX(paragraph_count) FROM (SELECT Document_ID, COUNT(Paragraph_ID) AS paragraph_count FROM Paragraphs GROUP BY Document_ID)))
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) = (SELECT MIN(paragraph_count) FROM (SELECT Document_ID, COUNT(Paragraph_ID) AS paragraph_count FROM Paragraphs GROUP BY Document_ID))
SELECT Document_ID FROM Documents d LEFT JOIN Paragraphs p ON d.Document_ID = p.Document`_ID GROUP BY d.Document_ID ORDER BY COUNT(p.Paragraph_ID) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2;
SELECT DISTINCT Documents.Document_ID FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID WHERE Paragraphs.Paragraph_Text IN ('Brazil', 'Ireland')
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%') AND Document_ID IN (SELECT Document_id FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%')
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC
SELECT Name FROM teacher ORDER BY Age ASC, Teacher_ID ASC
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT DISTINCT t2.Name FROM teacher AS t2 WHERE t2.Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown FROM teacher ORDER BY Age LIMIT 1
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) > 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T.Name, C.Course FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID JOIN course C ON CA.Course_ID = C.Course_ID
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID
SELECT T.Name, C.Course FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID JOIN course C ON CA.Course_ID = C.Course_ID ORDER BY T.Name ASC, C.Course ASC
SELECT t.Name, c.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC, c.Course ASC
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID WHERE T3.Course = 'math'
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange WHERE Course_ID IN (SELECT Course_ID FROM course WHERE Course = 'Math'))
SELECT T.Name, COUNT(*) AS NumberOfCourses FROM teacher T JOIN course_arrange A ON T.Teacher_ID = A.Teacher_ID GROUP BY T.Teacher_ID, T.Name
SELECT T.Name, COUNT(*) FROM teacher AS T JOIN course_arrange AS C ON T.Teacher_ID = C.Teacher_ID GROUP BY T.Teacher_ID, T.Name
SELECT T.Name FROM teacher T JOIN course_arrange CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Teacher_ID HAVING COUNT(DISTINCT CA.Course_ID) >= 2
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID GROUP BY T.Teacher_ID HAVING COUNT(DISTINCT CA.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT avg(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum WHERE Num_of_Staff = (SELECT MAX(Num_of_Staff) FROM museum)
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year , Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT MIN(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor INNER JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visit.visitor_ID, visit.Museum_ID HAVING COUNT(visit.Museum_ID) > 1
SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID ORDER BY SUM(T2.Total_spent) DESC LIMIT 1
SELECT Museum_ID, Name FROM museum JOIN visit ON museum.Museum_ID = visit.Museum_ID GROUP BY museum.Museum_ID ORDER BY COUNT(*) DESC
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT v.Name, v.Age FROM visitor v JOIN visit vi ON v.ID = vi.visitor_ID WHERE vi.Num_of_Ticket = (SELECT MAX(Num_of_Ticket) FROM visit)
SELECT avg(Num_of_Ticket), max(Num_of_Ticket) FROM visit
SELECT SUM(Total_spent) FROM visit JOIN visitor ON visit.visitor_ID = visitor.ID WHERE visitor.Level_of_membership = 1
SELECT Name FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year < 2009)) INTERSECT SELECT Name FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2011))
SELECT count(DISTINCT V.ID) FROM visitor AS V LEFT JOIN (SELECT visit.visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE museum.Open_Year > 2010) AS RecentVisits ON V.ID = RecentVisits.visitor_ID WHERE RecentVisits.visitor_ID IS NULL
SELECT count(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT count(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT avg(winner_rank) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MIN(loser_rank) FROM matches WHERE loser_rank IS NOT NULL;
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10;
SELECT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT winner_name FROM matches WHERE year = 2016
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) AND player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT count(*) FROM matches WHERE year IN (2013, 2016)
SELECT count(*) FROM matches WHERE year IN (2013, 2016)
SELECT p.country_code, p.first_name FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2
SELECT DISTINCT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, last_name FROM players ORDER BY birth_date, last_name, player_id ASC
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date, player_id ASC;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT first_name, country_code FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id ORDER BY SUM(rankings.tours) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1
SELECT first_name, last_name, SUM(winner_rank_points) FROM players JOIN matches ON players.player_id = matches.winner_id GROUP BY player_id HAVING COUNT(matches.winner_id) = (SELECT MAX(winner_count) FROM (SELECT winner_id, COUNT(winner_id) AS winner_count FROM matches GROUP BY winner_id))
SELECT players.first_name || ' ' || players.last_name AS winner_full_name, SUM(matches.winner_rank_points) AS total_winner_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id GROUP BY matches.winner_id ORDER BY COUNT(matches.winner_id) DESC LIMIT 1;
SELECT first_name, last_name FROM players WHERE player_id = (SELECT winner_id FROM matches WHERE winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open'))
SELECT first_name, last_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT loser_name, winner_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches)
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1;
SELECT P.player_id, P.first_name, avg(R.ranking) AS average_ranking FROM players AS P JOIN rankings AS R ON P.player_id = R.player_id GROUP BY P.player_id, P.first_name
SELECT p.first_name, p.player_id, COALESCE(AVG(r.ranking_points), 0) AS average_ranking FROM players p LEFT JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id
SELECT players.player_id, players.first_name, SUM(rankings.ranking_points) AS total_ranking_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name
SELECT players.first_name, COALESCE(SUM(rankings.ranking_points), 0) AS total_ranking_points FROM players LEFT JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) = (SELECT MAX(count) FROM (SELECT COUNT(player_id) AS count FROM players GROUP BY country_name))
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) AS matches_played FROM matches GROUP BY year
SELECT winner_name, winner_rank FROM matches WHERE winner_id IN (SELECT player_id FROM players ORDER BY birth_date DESC LIMIT 3)
SELECT first_name, last_name, winner_rank FROM players JOIN matches ON players.player_id = matches.winner_id ORDER BY birth_date DESC LIMIT 3;
SELECT count(DISTINCT winner_id) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'
SELECT count(*) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships';
SELECT P.first_name, P.country_code, P.birth_date FROM players P INNER JOIN matches M ON P.player_id = M.winner_id WHERE M.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches)
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY SUM(winner_rank_points) DESC LIMIT 1)
SELECT hand, count(*) FROM players GROUP BY hand;
SELECT hand , COUNT(*) FROM players GROUP BY hand;
SELECT count(*) FROM ship WHERE disposition_of_ship = 'Captured';
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage ASC
SELECT name, date, result FROM battle
SELECT caused_by_ship_id, max(killed), min(killed) FROM death GROUP BY caused_by_ship_id
SELECT avg(injured) FROM death
SELECT T1.killed, T1.injured FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id WHERE T2.tonnage = 't'
SELECT name , result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'Brig'
SELECT B.id, B.name FROM battle B JOIN ship S ON B.id = S.lost_in_battle JOIN death D ON S.id = D.caused_by_ship_id GROUP BY B.id, B.name HAVING SUM(D.killed) > 10
SELECT S.id, S.name FROM ship S, death D WHERE S.id = D.caused_by_ship_id GROUP BY S.id, S.name HAVING SUM(D.injured) = (SELECT MAX(total_injuries) FROM (SELECT SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id))
SELECT DISTINCT b.name FROM battle b WHERE b.bulgarian_commander = 'Kaloyan' AND b.latin_commander = 'Baldwin I'
SELECT count(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = 225)
SELECT b.name, b.date FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.name IN ('Lettice', 'HMS Atalanta')
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle WHERE s.location != 'English Channel' OR s.location IS NULL
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses;
SELECT count(*) FROM Courses
SELECT count(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name LIKE '%math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea';
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.department_id, d.department_name FROM Departments d JOIN Degree_Programs dp ON d.department_id = dp.department_id GROUP BY d.department_id, d.department_name HAVING COUNT(dp.degree_program_id) = (SELECT MAX(c.total) FROM (SELECT department_id, COUNT(degree_program_id) AS total FROM Degree_Programs GROUP BY department_id) c)
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs
SELECT count(DISTINCT department_id) FROM Departments
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs
SELECT count(*) FROM Degree_Programs AS DP JOIN Departments AS D ON DP.department_id = D.department_id WHERE D.department_name = 'Engineering'
SELECT COUNT(*) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections
SELECT c.course_id, c.course_name FROM Courses c LEFT JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id HAVING COUNT(s.section_id) <= 2
SELECT c.course_name, c.course_id FROM Courses c LEFT JOIN Sections s ON c.course_id = s.course_id GROUP BY c.course_id HAVING COUNT(s.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT S1.semester_id, S1.semester_name FROM Semesters AS S1 JOIN Student_Enrolment AS S2 ON S1.semester_id = S2.semester_id GROUP BY S1.semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.semester_id, T2.semester_name FROM Student_Enrolment AS T1 JOIN Semesters AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id, T2.semester_name ORDER BY COUNT(*) DESC
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name HAVING COUNT(DISTINCT se.degree_program_id) >= 2
SELECT T1.first_name, T1.middle_name, T1.last_name, T1.student_id FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id, T2.semester_id HAVING COUNT(DISTINCT T2.degree_program_id) >= 2
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name LIKE '%Bachelor%'))
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelors'))
SELECT DP.degree_summary_name FROM Degree_Programs DP JOIN Student_Enrolment SE ON DP.degree_program_id = SE.degree_program_id GROUP BY DP.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT degree_program_id, degree_summary_name FROM Degree_Programs WHERE degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id HAVING COUNT(Student_Enrolment.student_id) = ( SELECT MAX(enroll_count) FROM ( SELECT degree_program_id, COUNT(student_id) AS enroll_count FROM Student_Enrolment GROUP BY degree_program_id ) AS max_enrollments )
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name, COUNT(*) AS enrollment_count FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id ORDER BY enrollment_count DESC LIMIT 1;
SELECT S.first_name, S.middle_name, S.last_pt_name, S.student_id, COUNT(*) AS number_of_enrollments FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id GROUP BY S.student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT sem.semester_name FROM Semesters sem WHERE NOT EXISTS (SELECT 1 FROM Student_Enrolment se WHERE se.semester_id = sem.semester_id)
SELECT s.semester_name FROM Semesters s LEFT JOIN Student_Enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL
SELECT DISTINCT c.course_name FROM Courses AS c JOIN Student_Enrolment_Courses AS sec ON c.course_id = sec.course_id
SELECT DISTINCT C.course_name FROM Courses C JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id
SELECT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id GROUP BY C.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id GROUP BY C.course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT Students.last_name FROM Students WHERE Students.current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND Students.student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(*) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE student_id IN (SELECT student_id FROM Student_Enrolment WHERE semester_id = (SELECT semester_id FROM Semesters ORDER BY semester_description LIMIT 1)) ORDER BY student_id LIMIT 1
SELECT first_name FROM Students WHERE current_address_id != permanent_address.first_address_id
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id
SELECT `current_address_id`, `line_1`, `line_2`, `line_3` FROM `Students` JOIN `Addresses` ON `Students`.`current_address_id` = `Addresses`.`address_id` GROUP BY `current_address_id` ORDER BY COUNT(`student_id`) DESC LIMIT 1;
SELECT address_id, line_1, line_2 FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students UNION SELECT permanent_address_id FROM Students) GROUP BY address_id ORDER BY COUNT(*) DESC, address_id ASC LIMIT 1
SELECT AVG(YEAR(transcript_date)) FROM Transcripts
SELECT avg(transcript_date) FROM Transcripts
SELECT transcript_date FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT `transcript_date`, `other_details` FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT count(*) FROM Transcripts;
SELECT count(*) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT MAX(counts) AS max_times FROM (SELECT student_course_id, COUNT(transcript_id) AS counts FROM Transcript_Contents GROUP BY student_course_id) tc; SELECT student_course_id FROM Transcript_Contents GROUP BY student_course_id HAVING COUNT(transcript_id) = (SELECT MAX(counts) FROM (SELECT student_course_id, COUNT(transcript_id) AS counts FROM Transcript_Contents GROUP BY student_course_id) temp)
SELECT course_id, student_enrolment_id FROM Student_Enrolment_Courses WHERE student_course_id IN (SELECT student_course_id FROM Transcript_Contents GROUP BY student_course_id ORDER BY COUNT(transcript_id) DESC LIMIT 1)
SELECT transcript_id, transcript_date FROM Transcripts ORDER BY (SELECT COUNT(*) FROM Transcript_Contents WHERE Transcript_Contents.transcript_id = Transcripts.transcript_id) ASC, transcript_id ASC LIMIT 1
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id ORDER BY count(*) ASC LIMIT 1
SELECT DISTINCT s.semester_name FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Degree_Programs dp ON dp.degree_program_id = se.degree_program_id WHERE dp.degree_summary_name IN ('Master', 'Bachelor') GROUP BY s.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2
SELECT DISTINCT se.semester_id FROM Semesters se JOIN Student_Enrolment se1 ON se.semester_id = se1.semester_id JOIN Degree_Programs dp ON se1.degree_program_id = dp.degree_program_id GROUP BY se.semester_id HAVING COUNT(DISTINCT CASE WHEN dp.degree_summary_name LIKE '%Masters%' THEN 'Masters' WHEN dp.degree_summary_name LIKE '%Bachelors%' THEN 'Bachelors' END) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students UNION SELECT permanent_address_id FROM Students)
SELECT * FROM Students ORDER BY student_id DESC
SELECT other_student_details FROM Students ORDER BY other_student_details DESC
SELECT section_description FROM Sections WHERE section_name = 'H'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students AS S JOIN Addresses AS A ON S.permanent_address_id = A.address_id WHERE A.country = 'Haiti' OR S.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT C.Title FROM Cartoon C WHERE C.Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Country, COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Country, COUNT(id) FROM TV_Channel GROUP BY Country ORDER BY COUNT(id) DESC LIMIT 1
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT count(*) FROM TV_Channel WHERE Language = 'English'
SELECT count(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(id) AS num_channels FROM TV_Channel GROUP BY Language HAVING COUNT(id) = (SELECT MIN(channel_count) FROM (SELECT COUNT(id) AS channel_count FROM TV_Channel GROUP BY Language))
SELECT Language, COUNT(*) AS ChannelCount FROM TV_Channel GROUP BY Language HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM TV_Channel GROUP BY Language))
SELECT Language , COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language , COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT t1.series_name FROM TV_Channel AS t1 JOIN Cartoon AS t2 ON t1.id = t2.Channel WHERE t2.Title = 'The Rise of the Blue Beetle'
SELECT Title FROM Cartoon AS C JOIN TV_Channel AS T ON C.Channel = T.id WHERE T.series_name = 'Sky Radio'
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS T ON C.Channel = T.id WHERE T.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating ASC, id ASC
SELECT Episode FROM TV_series ORDER BY Rating DESC, id ASC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT min(Share), max(Share) FROM TV_series
SELECT max(Share), min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT TV_Channel.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = 'A Love of a Lifetime'
SELECT series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_series.Episode = 'A Love of a Lifetime'
SELECT Episode FROM TV_series WHERE Channel IN (SELECT id FROM TV_Channel WHERE series_name = 'Sky Radio')
SELECT Episode FROM TV_series JOIN TV_Channel ON TV_series.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT Directed_by, count(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT MAX(Original_air_date) FROM Cartoon)
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes';
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes';
SELECT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey';
SELECT c.Country FROM TV_Channel c LEFT JOIN Cartoon cr ON c.id = cr.Channel WHERE cr.Written_by = 'Todd *Casey' AND cr.id IS NULL
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT TV_Channel.series_name, TV_Channel.Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT DISTINCT t1.series_name, t1.Country FROM TV_Channel AS t1 JOIN Cartoon AS t2 ON t1.id = t2.Channel WHERE t2.Directed_by = 'Ben Jones' OR t2.Directed_by = 'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2
SELECT TV_Channel.id FROM TV_Channel GROUP BY Country HAVING count(*) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings, Poker_Player_ID FROM poker_player ORDER BY Earnings DESC, Poker_Player_ID ASC
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made , Best_Finish FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT MAX(Earnings) FROM poker_player)
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID WHERE Earnings > 300000
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings > 300000)
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Final_Table_Made ASC, poker_player.Earnings DESC, poker_player.Poker_Player_ID ASC
SELECT people.Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY poker_player.Final_Table_Made ASC, people.Name ASC, poker_player.Poker_Player_ID ASC
SELECT birth_date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings = (SELECT MIN(Earnings) FROM poker_player))
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings = (SELECT MIN(Earnings) FROM poker_player))
SELECT pp.Money_Rank FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID WHERE p.Height = (SELECT MAX(Height) FROM people)
SELECT PP.Money_Rank FROM poker_player PP INNER JOIN people P ON PP.People_ID = P.People_ID WHERE P.Height = (SELECT MAX(Height) FROM people)
SELECT avg(Earnings) FROM poker_player AS P JOIN people AS PE ON P.People_ID = PE.People_ID WHERE PE.Height > 200
SELECT avg(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT Name FROM people p JOIN poker_player pp ON p.People_ID = pp.People_ID ORDER BY pp.Earnings DESC, p.Name ASC
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID ORDER BY poker_player.Earnings DESC, people.Name ASC, poker_player.Poker_Player_ID ASC
SELECT Nationality, count(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(num) FROM (SELECT COUNT(*) AS num FROM people GROUP BY Nationality))
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT p.Name, p.Birth_Date FROM people p ORDER BY p.Name ASC, p.People_ID ASC
SELECT Name, Birth_Date FROM people ORDER BY Name, People_ID ASC
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT max(area_code), min(area_code) FROM AREA_CODE_STATE
SELECT max(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS C JOIN VOTES V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2
SELECT c.contestant_number, c.contestant_name FROM CONTESTANTS c JOIN VOTES v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name HAVING COUNT(v.vote_id) = (SELECT MIN(vote_count) FROM (SELECT COUNT(vote_id) AS vote_count FROM VOTES GROUP BY contestant_number) AS SubQuery)
SELECT COUNT(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT count(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1)
SELECT created, V.state, phone_number FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number WHERE contestant_name = 'Tabatha Gehling'
SELECT DISTINCT A.area_code FROM VOTES AS V JOIN AREA_CODE_STATE AS A ON A.state = V.state WHERE V.contestant_number IN ( SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling' UNION ALL SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Kelly Clauss' ) GROUP BY A.area_code HAVING COUNT(DISTINCT V.contestant_number) = 2
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%Republic%'
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%Republic%'
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Region FROM city WHERE Name = 'Kabul'
SELECT Region FROM city WHERE Name = 'Kabul'
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1
SELECT sum(Population), max(GNP) FROM country WHERE Continent = 'Asia'
SELECT sum(Population), max(GNP) FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT sum(Population) FROM city WHERE District = 'Gelderland';
SELECT sum(Population) FROM city WHERE District = 'Gelderland'
SELECT avg(GNP) , sum(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT c.Name FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Name ORDER BY COUNT(cl.Language) DESC LIMIT 1
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(Language) DESC)
SELECT continent FROM country AS C JOIN countrylanguage AS L ON C.Code = L.CountryCode GROUP BY continent ORDER BY COUNT(DISTINCT L.Language) DESC
SELECT Continent FROM (SELECT c.Continent, COUNT(DISTINCT cl.Language) AS num_languages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ) AS result WHERE num_languages = ( SELECT MAX(num_languages) FROM ( SELECT c.Continent, COUNT(DISTINCT cl.Language) AS num_languages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Continent ) AS max_result )
SELECT COUNT(DISTINCT c.Code) FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch') GROUP BY c.Code HAVING COUNT(DISTINCT cl.Language) = 2
SELECT COUNT(DISTINCT `CountryCode`) FROM `countrylanguage` WHERE `Language` IN ('English', 'Dutch')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French')
SELECT country.Name FROM country JOIN countrylanguage cl ON country.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') GROUP BY country.Name HAVING COUNT(DISTINCT cl.Language) = 2
SELECT c.Name FROM country c JOIN countrylanguage cl1 ON c.Code = cl1.CountryCode AND cl1.Language = 'English' AND cl1.IsOfficial = 'T' JOIN countrylanguage cl2 ON c.Code = cl2.CountryCode AND cl2.Language = 'French' AND cl2.IsOfficial = 'T'
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'French') AND IsOfficial = 'T')
SELECT count(DISTINCT country.Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese'
SELECT COUNT(DISTINCT Continent) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Chinese';
SELECT DISTINCT Region FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE Language IN ('English', 'Dutch')
SELECT DISTINCT Region FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('Dutch', 'English'))
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T')
SELECT CL.Language FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code WHERE C.Continent = 'Asia' AND CL.Percentage = ( SELECT MAX(Percentage) FROM countrylanguage cl2 JOIN country c2 ON cl2.CountryCode = c2.Code WHERE c2.Continent = 'Asia' )
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Asia') GROUP BY Language))
SELECT Language FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T2.GovernmentForm LIKE '%republic%' GROUP BY T1.Language HAVING COUNT(*) = 1
SELECT Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY cl.Language HAVING COUNT(cl.CountryCode) = 1 AND MAX(c.GovernmentForm) = 'Republic'
SELECT Name, Population FROM city WHERE ID = (SELECT Capital FROM country WHERE Code = (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' ORDER BY Percentage DESC LIMIT 1)) AND Population = (SELECT MAX(Population) FROM city WHERE CountryCode = (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T'))
SELECT Name, Population FROM city WHERE ID IN (SELECT Capital FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')) ORDER BY Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT Name, Population, LifeExpectancy FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT avg(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(c.Population) FROM country c WHERE c.Code NOT IN (SELECT cl.CountryCode FROM countrylanguage cl WHERE cl.Language = 'English')
SELECT Language FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE HeadOfState = 'Beatrix')
SELECT Language FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE c.HeadOfState = 'Beatrix' AND cl.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage INNER JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT min(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT MAX(Population) FROM country WHERE Continent = 'Africa')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Europe' AND NOT (countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T')
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language LIKE '%English%' AND IsOfficial = 'T'))
SELECT City.Name, City.Population FROM city JOIN country ON City.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Population, Name, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT c.Name, c.Population, c.HeadOfState FROM country c WHERE c.SurfaceArea = (SELECT MAX(SurfaceArea) FROM country)
SELECT C.Name, COUNT(CL.Language) FROM country AS C JOIN countrylanguage AS CL ON C.Code = CL.CountryCode GROUP BY C.Code HAVING COUNT(CL.Language) >= 3;
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country c JOIN countrylanguage cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(cl.Language) > 2
SELECT District, COUNT(ID) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT District, COUNT(ID) FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT sum(Population), GovernmentForm FROM country WHERE LifeExpectancy > 72 GROUP BY GovernmentForm
SELECT Continent, avg(LifeExpectancy) AS AverageLifeExpectancy, sum(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING avg(LifeExpectancy) < 72
SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY Name ASC, Code ASC LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC, Population DESC, Code ASC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC, Name ASC, Code ASC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC, Name ASC, Code ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(LanguageCount) FROM (SELECT Language, COUNT(CountryCode) AS LanguageCount FROM countrylanguage GROUP BY Language))
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(CountryCode) = (SELECT MAX(LangCount) FROM (SELECT COUNT(CountryCode) AS LangCount FROM countrylanguage GROUP BY Language))
SELECT country.Name, country.Code, countrylanguage.Language, countrylanguage.Percentage FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE (country.Code, countrylanguage.Percentage) IN ( SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode )
SELECT CountryCode, Language, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = countrylanguage.CountryCode)
SELECT count(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT MAX(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC, Conductor_ID ASC
SELECT Name FROM conductor ORDER BY Age, Conductor_ID
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID ASC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID
SELECT avg(Attendance) FROM show
SELECT avg(Attendance) FROM show
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share) AS MaxShare, MIN(Share) AS MinShare FROM performance WHERE Type != 'Live final'
SELECT count(DISTinct Nationality) FROM conductor
SELECT count(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT C.Name, O.Orchestra FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID
SELECT C.Name, O.Orchestra FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID HAVING COUNT(DISTINCT o.Orchestra_ID) > 1
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(Orchestra_ID) > 1)
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(Orchestra_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Orchestra_ID) AS count FROM orchestra GROUP BY Conductor_ID)))
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(Orchestra_ID) = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(Orchestra_ID) AS num_orchestras FROM orchestra GROUP BY Conductor_ID) AS orchestra_counts))
SELECT DISTINCT C.Name FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID WHERE O.Year_of_Founded > 2008
SELECT DISTINCT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_format ORDER BY COUNT(*), Major_Record_Format ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Param ORDER BY COUNT(*) DESC, Major_Record_Format ASC, Orchestra_ID ASC
SELECT Record_Company FROM orchestra GROUP BY Record_Company HAVING COUNT(Orchestra_ID) = (SELECT MAX(company_count) FROM (SELECT COUNT(Orchestra_ID) AS company_count FROM orchestra GROUP BY Record_Company))
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY orchestra.Orchestra_ID HAVING COUNT(performance.Performance_ID) > 1
SELECT Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(*) > 1
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler;
SELECT DISTINCT grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT count(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, count(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) = (SELECT MAX(count) FROM (SELECT grade, COUNT(ID) AS count FROM Highschooler GROUP BY grade) temp)
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4;
SELECT student_id, COUNT(*) AS total_friends FROM (SELECT student_id FROM Friend UNION ALL SELECT friend_id AS student_id FROM Friend) AS AllFriends GROUP BY student_id
SELECT H.ID, COUNT(DISTINCT F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN ( SELECT student_id, friend_id FROM Friend UNION SELECT friend_id, student_id FROM Friend ) AS F ON H.ID = F.student_id GROUP BY H.ID
SELECT H.name, COUNT(F.friend_id) FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name
SELECT Highschooler.name, count(Friend.friend_id) FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.ID, Highschooler.name
SELECT name FROM Highschooler WHERE ID = (SELECT student_id FROM (SELECT student_id, COUNT(*) AS total_friends FROM (SELECT student_id FROM Friend UNION ALL SELECT friend_id AS student_id FROM Friend) AS all_friends GROUP BY student_id ORDER BY total_friends DESC LIMIT 1) AS result)
SELECT H.name FROM Highschooler H JOIN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) = (SELECT MAX(FriendsCount) FROM (SELECT student_id, COUNT(friend_id) AS FriendsCount FROM Friend GROUP BY student_id) AS FriendCounts)) AS MostFriends ON H.ID = MostFriends.student_id
SELECT H.name FROM Highschooler H JOIN (SELECT student_id FROM Friend UNION ALL SELECT friend_id FROM Friend) F ON H.ID = F.student_id GROUP BY H.ID, H.name HAVING COUNT(*) >= 3
SELECT name FROM Highschooler WHERE ID IN ( SELECT student_id FROM Friend GROUP BY student_id HAVING count(friend_id) >= 3 UNION SELECT friend_id FROM Friend GROUP BY friend_id HAVING count(student_Id) >= 3 )
SELECT H.ID, H1.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id JOIN Highschooler AS H1 ON F.friend_id = H1.ID WHERE H.name = 'Kyle'
SELECT H1.ID, H2.name FROM Highschooler H1 JOIN Friend F ON H1.ID = F.student_id JOIN Highschooler H2 ON F.friend_id = H2.ID WHERE H1.name = 'Kyle'
SELECT H.ID, COUNT(F.friend_id) FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT H.ID, COUNT(F.friend_id) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT Friend.student_id FROM Friend JOIN Likes ON Friend.student_id = Likes.liked_id
SELECT DISTINCT T1.student_id FROM Friend AS T1 JOIN Likes AS T2 ON T1.student_id = T2.liked_id
SELECT DISTINCT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id JOIN Likes l ON h.ID = l.liked_id
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT student_id FROM Likes);
SELECT student_id, COUNT(*) as total_likes FROM ( SELECT student_id FROM Likes UNION ALL SELECT liked_id as student_id FROM Likes ) AS combined_likes GROUP BY student_id
SELECT student_id, count(*) as total_likes FROM (SELECT student_id FROM Likes UNION ALL SELECT liked_id FROM Likes) AS combined GROUP BY student_id
SELECT H.name, COUNT(DISTINCT L1.liked_id) AS LikesGiven, COUNT(DISTINCT L2.student_id) AS LikesReceived FROM Highschooler H LEFT JOIN Likes L1 ON H.ID = L1.student_id LEFT JOIN Likes L2 ON H.ID = L2.liked_id GROUP BY H.ID, H.name
SELECT Highschooler.name, COUNT(DISTINCT Likes.student_id) AS likes_given, COUNT(DISTINCT Likes.liked_id) AS likes_received FROM Highschooler LEFT JOIN Likes ON Highschooler.ID = Likes.student_id LEFT JOIN Likes AS LikesReceived ON Highschooler.ID = LikesReceived.liked_id GROUP BY Highschooler.name
SELECT H.name FROM Highschooler H JOIN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) = (SELECT MAX(counts) from (SELECT COUNT(*) as counts FROM Likes GROUP BY liked_id) as likes_count)) as MostLiked ON H.ID = MostLiked.liked_id
SELECT h.name FROM Highschooler h JOIN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(student_id) = (SELECT MAX(counts) FROM (SELECT COUNT(student_id) AS counts FROM Likes GROUP BY liked_id) c)) liked_max ON h.ID = liked_max.liked_id
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(student_id) >= 2)
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id GROUP BY L.liked_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2 UNION SELECT friend_id FROM Friend GROUP BY friend_id HAVING COUNT(student_id) >= 2)
SELECT DISTINCT h.name FROM Highschooler h JOIN Friend f ON h.ID = f.student_id OR h.ID = f.friend_id GROUP BY h.ID, h.name, h.grade HAVING h.grade > 5 AND COUNT(DISTINCT f.friend_id) >= 2
SELECT H.ID, count(*) FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT H.ID, COUNT(*) AS number_of_likes FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT O.state FROM Owners O INNER JOIN Professionals P ON O.state = P.state
SELECT DISTINCT T1.state FROM Owners AS T1 JOIN Professionals AS T2 ON T1.state = T2.state
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2)
SELECT name FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING SUM(cost_of_treatment) > 1000)
SELECT D.name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id WHERE NOT EXISTS (SELECT 1 FROM Treatments AS T WHERE T.dog_id = D.dog_id GROUP BY T.dog_id HAVING SUM(T.cost_of_treatment) > 1000)
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT first_name FROM (SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners) AS names WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT O.owner_id, O.first_name, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id GROUP BY O.owner_id, O.first_name, O.last_name HAVING COUNT(D.dog_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(dog_id) AS cnt FROM Dogs GROUP BY owner_id))
SELECT owner_id, first_name, last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(dog_id) AS cnt FROM Dogs GROUP BY owner_id)))
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_id) >= 2
SELECT T1.professional_id, T1.role_code, T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(*) >= 2
SELECT B.breed_name FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code GROUP BY B.breed_name HAVING COUNT(D.dog_id) = (SELECT MAX(count) FROM (SELECT COUNT(dog_id) AS count FROM Dogs GROUP BY breed_code))
SELECT B.breed_name FROM Dogs D JOIN Breeds B ON D.breed_code = B.breed_code GROUP BY D.breed_code ORDER BY COUNT(D.dog_id) DESC LIMIT 1
SELECT O.owner_id, O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name HAVING COUNT(T.treatment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(T.treatment_id) AS cnt FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY O.owner_id))
SELECT o.owner_id, o.last_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1
SELECT treatment_type_description FROM Treatment_Types tt JOIN Treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1
SELECT treatment_type_description FROM Treatment_Types WHERE treatment_type_code = (SELECT treatment_type_code FROM Treatments GROUP BY treatment_type_code ORDER BY SUM(cost_of_treatment) ASC LIMIT 1)
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT owner_id, zip_code FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING SUM(cost_of_treatment) = (SELECT MAX(total_cost) FROM (SELECT dog_id, SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY dog_id) t)))
SELECT P.professional_id, P.cell_number FROM Professionals P WHERE P.professional_id IN (SELECT T.professional_id FROM Treatments T GROUP BY T.professional_id HAVING COUNT(DISTINCT T.treatment_type_code) >= 2)
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT P.first_name, P.last_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT date_of_treatment , first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT Date_of_treatment , T1.first_name FROM Treatments AS T JOIN Professionals AS T1 ON T.professional_id = T1.professional_id
SELECT T1.cost_of_treatment , T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.first_name, T1.last_name, T3.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Sizes AS T3 ON T2.size_code = T3.size_code
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT D.name AS Dog_Name, T.date_of_treatment AS Treatment_Date FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code IN ( SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) = ( SELECT MIN(breed_count) FROM (SELECT COUNT(*) AS breed_count FROM Dogs GROUP BY breed_code) AS BreedCounts ) )
SELECT d.name, t.date_of_treatment FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id WHERE breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(dog_id) = (SELECT MIN(counts) FROM (SELECT COUNT(dog_id) AS counts FROM Dogs GROUP BY breed_code)))
SELECT o.first_name, d.name FROM Dogs d JOIN Owners o ON d.owner_id = o.owner_id WHERE o.state = 'Virginia'
SELECT o.first_name, d.name FROM Owners o INNER JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia'
SELECT DISTINCT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE age = (SELECT MIN(age) FROM Dogs))
SELECT O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE D.date_of_birth = (SELECT MAX(date_of_birth) FROM Dogs)
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT p.email_address FROM Professionals p WHERE p.state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT count(DISTINCT `dog_id`) FROM `Treatments`
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT MAX(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT SUM(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs)
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_adopted IS NULL)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT avg(age) FROM Dogs
SELECT avg(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT max(age) FROM Dogs
SELECT charge_type, sum(charge_amount) FROM Charges GROUP BY charge_type
SELECT charge_type, charge_amount FROM Charges;
SELECT MAX(charge_amount) FROM Charges
SELECT charge_amount FROM Charges WHERE charge_amount = (SELECT MAX(charge_amount) FROM Charges);
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT b.breed_name, s.size_description FROM Breeds b CROSS JOIN Sizes s
SELECT DISTINCT b.breed_name, s.size_description FROM Dogs d JOIN Breeds b ON d.breed_code = b.breed_code JOIN Sizes s ON d.size_code = s.size_code
SELECT T1.first_name, T3.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT T2.first_name, T4.treatment_type_description FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T4 ON T1.treatment_type_code = T4.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Singer_ID ASC
SELECT Birth_Year , Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT "Citizenship", COUNT(*) FROM singer GROUP BY "Citizenship"
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT T2.Title, T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID
SELECT Title, Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT Name FROM singer WHERE Singer_ID IN (SELECT Singer_ID FROM song GROUP BY Singer_ID HAVING COUNT(Song_ID) > 1)
SELECT Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID HAVING COUNT(song.Song_ID) > 1
SELECT singer.Name, SUM(song.Sales) FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID
SELECT sum(sales) , Singer_ID FROM song GROUP BY Singer_ID
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types AS FT JOIN Other_Available_Features AS OAF ON FT.feature_type_code = OAF.feature_type_code WHERE OAF.feature_name = 'AirCon'
SELECT `Ref_Property_Types`.`property_type_description`, COUNT(`Properties`.`property_id`) AS `PropertyCount` FROM `Ref_Property_Types` JOIN `Properties` ON `Ref_Property_Types`.`property_type_code` = `Properties`.`property_type_code` GROUP BY `Ref_Property_Types`.`property_type_code`
SELECT property_name FROM Properties WHERE (property_type_code = 'house' OR property_type_code = 'apartment') AND room_count > 1
