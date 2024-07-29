SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT Name , Country , Age FROM singer ORDER BY Age DESC , Singer_ID ASC
SELECT avg(Age) , min(Age) , max(Age) FROM singer WHERE Country = 'France'
SELECT avg(Age), min(Age), max(Age) FROM singer WHERE Country = 'France'
SELECT S1.Name, S1.Song_release_year FROM singer AS S1 ORDER BY S1.Age ASC LIMIT 1
SELECT Name, Song_release_year FROM singer WHERE Age = (SELECT min(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country , count(*) FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT max(Capacity), avg(Capacity) FROM stadium
SELECT max(Capacity) , avg(Capacity) FROM stadium
SELECT Name, Capacity FROM stadium ORDER BY Average DESC, Stadium_ID ASC LIMIT 1
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1
SELECT count(*) FROM concert WHERE Year IN (2014, 2015)
SELECT count(*) FROM concert WHERE Year IN (2014, 2015)
SELECT Name, COUNT(*) FROM stadium JOIN concert ON stadium.Stadium_ID = concert.Stadium_ID GROUP BY stadium.Name
SELECT Stadium_ID , COUNT(*) FROM concert GROUP BY Stadium_ID
SELECT S.name, S.capacity FROM stadium AS S JOIN concert AS C ON S.Stadium_ID = C.Stadium_ID WHERE C.Year >= 2014 GROUP BY S.Stadium_ID ORDER BY count(*) DESC LIMIT 1
SELECT T2.Name, T2.Capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY count(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium EXCEPT SELECT T1.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2014
SELECT Name FROM stadium EXCEPT SELECT T1.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = 2014
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) FROM concert c JOIN singer_in_concert sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme
SELECT C.concert_Name, C.Theme, COUNT(*) AS NumberOfSingers FROM concert AS C JOIN singer_in_concert AS SIC ON C.concert_ID = SIC.concert_ID GROUP BY C.concert_ID
SELECT s.Name, COUNT(sic.concert_ID) FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Name;
SELECT S.Name, COUNT(*) AS Num_Concerts FROM singer AS S JOIN singer_in_concert AS SC ON S.Singer_ID = SC.Singer_ID GROUP BY S.Singer_ID, S.Name
SELECT DISTINCT T2.Name FROM singer_in_concert AS T1 JOIN singer AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T1.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE "%Hey%"
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE Year = 2015)
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014 INTERSECT SELECT Stadium_ID FROM concert WHERE Year = 2015)
SELECT count(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT count(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT count(*) FROM Pets WHERE weight > 10
SELECT count(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age LIMIT 1
SELECT weight FROM Pets WHERE PetType = 'dog' ORDER BY pet_age ASC LIMIT 1;
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType;
SELECT count(DISTINCT Has_Pet.PetID) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT count(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT count(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE S.Sex = 'F' AND P.PetType = 'dog'
SELECT count(*) FROM Pets AS P JOIN Has_Pet AS HP ON P.PetID = HP.PetID JOIN Student AS S ON HP.StuID = S.StuID WHERE P.PetType = 'dog' AND S.Sex = 'F'
SELECT count(DISTINCT PetType) FROM Pets
SELECT count(DISTINCT PetType) FROM Pets
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType IN ('cat', 'dog')))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'cat' OR PetType = 'dog'))
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = "Cat") INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = "Dog"))
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = "cat" INTERSECT SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = "dog"
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'Cat')
SELECT StuID FROM Student EXCEPT SELECT t1.StuID FROM Student AS t1 JOIN Has_Pet AS t2 ON t1.StuID = t2.StuID JOIN Pets AS t3 ON t2.PetID = t3.PetID WHERE t3.PetType = 'cat'
SELECT StuID FROM Student EXCEPT SELECT T1.StuID FROM Has_Pet AS T1 JOIN Pets AS T2 ON T1.PetID = T2.PetID WHERE T2.PetType = 'cat'
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = "Dog" EXCEPT SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = "Cat")
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = "Dog") EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = "Cat"))
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT avg(pet_age) , max(pet_age) , PetType FROM Pets GROUP BY PetType
SELECT avg(pet_age), max(pet_age), PetType FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT avg(weight), PetType FROM Pets GROUP BY PetType
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT S.StuID, COUNT(P.PetID) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID GROUP BY S.StuID;
SELECT Has_Pet.StuID, COUNT(*) FROM Has_Pet GROUP BY Has_Pet.StuID
SELECT S.Fname, S.Sex FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING count(*) > 1
SELECT T1.Fname, T1.Sex FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID HAVING COUNT(*) > 1
SELECT LName FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet WHERE PetID IN (SELECT PetID FROM Pets WHERE PetType = 'Cat' AND pet_age = 3))
SELECT LName FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = "Cat" AND Pets.pet_age = 3
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT avg(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT T1.ContId, T1.Continent, COUNT(*) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId
SELECT continents.ContId, continents.Continent, COUNT(countries.CountryId) FROM continents LEFT JOIN countries ON continents.ContId = countries.Continent GROUP BY continents.ContId, continents.Continent
SELECT count(*) FROM countries
SELECT count(*) FROM countries;
SELECT c.FullName, c.Id, COUNT(*) FROM car_makers AS c JOIN model_list AS m ON c.Id = m.Maker GROUP BY c.Id, c.FullName
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT Model FROM model_list JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY cars_data.Horsepower ASC LIMIT 1
SELECT Model FROM model_list WHERE Maker IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT Model FROM cars_data ORDER BY Horsepower ASC LIMIT 1))
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data)))
SELECT ModelId FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data)))
SELECT T2.FullName FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T4 ON T3.Model = T4.ModelId JOIN car_makers AS T2 ON T4.Maker = T2.Id WHERE T1.Year = 1970
SELECT DISTINCT T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970
SELECT Make, Year FROM cars_data ORDER BY Year ASC LIMIT 1
SELECT car_makers.FullName, MIN(cars_data.Year) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id GROUP BY car_makers.Id ORDER BY MIN(cars_data.Year) ASC LIMIT 1;
SELECT DISTINCT Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Id IN (SELECT MakeId FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980)))
SELECT ModelId, Model FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE Continent IN (SELECT ContId FROM continents WHERE Continent IS NOT NULL))) AND ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Year > 1980))
SELECT T1.Continent, COUNT(DISTINCT T3.Id) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent JOIN car_makers AS T3 ON T2.CountryId = T3.Country GROUP BY T1.Continent
SELECT C.Continent, COUNT(DISTINCT M.Id) FROM continents AS C JOIN countries AS CO ON C.ContId = CO.Continent JOIN car_makers AS M ON CO.CountryId = M.Country GROUP BY C.Continent
SELECT C.CountryName FROM countries AS C JOIN car_makers AS M ON C.CountryId = M.Country GROUP BY C.CountryName ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.FullName, COUNT(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.FullName
SELECT car_makers.Id, car_makers.FullName, COUNT(*) AS NumberOfModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T3.Model = 'amc hornet sportabout (sw)'
SELECT Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T3.Model = 'amc hornet sportabout (sw)';
SELECT count(*) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT COUNT(DISTINCT Maker) FROM car_makers WHERE Country IN (SELECT CountryId FROM countries WHERE CountryName = 'France')
SELECT count(*) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'USA'
SELECT count(*) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'usa'
SELECT avg(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 4
SELECT min(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT min(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT car_makers.FullName, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker
SELECT C.CountryName, C.CountryId FROM countries AS C JOIN car_makers AS M ON C.CountryId = M.Country GROUP BY C.CountryId, C.CountryName HAVING COUNT(*) >= 1
SELECT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryId HAVING COUNT(car_makers.Id) >= 1
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT count(*) FROM cars_data WHERE Horsepower > 150
SELECT YEAR, AVG(Weight) FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT C.CountryName FROM countries AS C JOIN car_makers AS M ON C.CountryId = M.Country WHERE C.Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') GROUP BY C.CountryId HAVING COUNT(M.Id) >= 3
SELECT CountryName FROM countries WHERE Continent = (SELECT ContId FROM continents WHERE Continent = 'Europe') AND CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) >= 3)
SELECT CN.Make, MAX(CD.Horsepower) FROM car_names AS CN JOIN cars_data AS CD ON CN.MakeId = CD.Id WHERE CD.Cylinders = 3 GROUP BY CN.Make
SELECT MAX(Horsepower), Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Cylinders = 3
SELECT Model FROM car_names JOIN cars_data ON car_names.MakeId = cars_data.Id ORDER BY MPG DESC LIMIT 1
SELECT Model FROM model_list WHERE ModelId = (SELECT Model FROM cars_data ORDER BY CAST(MPG AS REAL) DESC LIMIT 1)
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT avg(Horsepower) FROM cars_data WHERE Year < 1980
SELECT avg(cars_data.Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.ModelId WHERE model_list.Model = 'volvo';
SELECT avg(cars_data.Edispl) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.ModelId JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, max(Accelerate) FROM cars_data GROUP BY Cylinders;
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT Model FROM car_names GROUP BY Model ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT count(*) FROM cars_data WHERE Year = 1980
SELECT count(*) FROM cars_data WHERE Year = 1980
SELECT count(*) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker WHERE T1.FullName = 'American Motor Company'
SELECT count(*) FROM car_makers AS CM JOIN model_list AS ML ON CM.Id = ML.Maker WHERE CM.FullName = 'American Motor Company'
SELECT T1.FullName, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(*) > 3
SELECT T1.Maker, COUNT(T1.Model) FROM model_list AS T1 GROUP BY T1.Maker HAVING COUNT(T1.Model) > 3;
SELECT DISTINCT model_list.Model FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN car_names ON model_list.ModelId = car_names.Model JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE car_makers.FullName = "General Motors" OR cars_data.Weight > 3500
SELECT DISTINCT T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.FullName = 'General Motors' OR T4.Weight > 3500
SELECT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 AND Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC
SELECT Cylinders FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.ModelId WHERE T3.Model = 'volvo' ORDER BY T1.Accelerate ASC LIMIT 1
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT MakeId FROM car_names WHERE Model IN (SELECT ModelId FROM model_list WHERE Maker = (SELECT Id FROM car_makers WHERE Maker = 'Volvo'))) ORDER BY Accelerate ASC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data ORDER BY Horsepower DESC LIMIT 1)
SELECT count(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data ORDER BY Horsepower DESC LIMIT 1)
SELECT count(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING count(*) > 2)
SELECT count(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING count(*) > 2)
SELECT count(*) FROM cars_data WHERE Cylinders > 6
SELECT count(*) FROM cars_data WHERE Cylinders > 6
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN ( SELECT Id FROM cars_data WHERE Cylinders = 4 ORDER BY Horsepower DESC LIMIT 1))
SELECT T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.ModelId = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Cylinders = 4 ORDER BY T3.Horsepower DESC LIMIT 1;
SELECT MakeId, Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND Cylinders <= 3
SELECT T1.MakeId, T1.Make FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Cylinders < 4 AND T2.Horsepower > (SELECT MIN(Horsepower) FROM cars_data)
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT max(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT T1.ModelId FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id JOIN car_names AS T3 ON T1.ModelId = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Weight < 3500 AND T2.FullName != 'Ford Motor Company'
SELECT Model FROM model_list WHERE ModelId IN (SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < 3500)) AND Maker NOT IN (SELECT Id FROM car_makers WHERE Maker = 'Ford')
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING count(DISTINCT T2.ModelId) >= 2 INTERSECT SELECT T3.Id, T3.Maker FROM car_makers AS T3 JOIN car_names AS T4 ON T3.Id = T4.Make GROUP BY T3.Id HAVING count(*) > 3
SELECT car_makers.Id, car_makers.Maker FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.ModelId = car_names.Model GROUP BY car_makers.Id HAVING COUNT(DISTINCT model_list.ModelId) >= 2 AND COUNT(car_names.MakeId) > 3
SELECT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country LEFT JOIN model_list AS T3 ON T2.Id = T3.Maker AND T3.Model = 'fiat' GROUP BY T1.CountryId HAVING count(DISTINCT T2.Id) > 3 OR MAX(T3.Model) = 'fiat';
SELECT c.CountryId, c.CountryName FROM countries AS c LEFT JOIN car_makers AS cm ON c.CountryId = cm.Country LEFT JOIN model_list AS ml ON cm.Id = ml.Maker AND ml.Model = 'Fiat' GROUP BY c.CountryId HAVING COUNT(DISTINCT cm.Id) > 3 OR COUNT(DISTINCT ml.Model) > 0;
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT DISTINCT Airline, Abbreviation FROM airlines WHERE Country = "USA"
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
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA';
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
SELECT count(*) FROM airports AS A JOIN flights AS F ON A.AirportCode = F.SourceAirport WHERE A.City = 'Aberdeen';
SELECT count(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS F JOIN airports AS A ON F.DestAirport = A.AirportCode WHERE A.City = 'Aberdeen';
SELECT count(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT count(*) FROM airports AS src JOIN flights ON src.AirportCode = flights.SourceAirport JOIN airports AS dst ON flights.DestAirport = dst.AirportCode WHERE src.City = 'Aberdeen' AND dst.City = 'Ashley'
SELECT count(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley';
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'JetBlue Airways'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T1.Airline = 'Jetblue Airways'
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'United Airlines' AND F.DestAirport = 'ASY'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.DestAirport = T3.AirportCode WHERE T1.Airline = 'United Airlines' AND T3.AirportCode = 'ASY'
SELECT count(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'United Airlines' AND F.SourceAirport = 'AHD'
SELECT count(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.SourceAirport = 'AHD'
SELECT count(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid JOIN airports AS ap ON f.DestAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.City = 'Aberdeen'
SELECT count(*) FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline JOIN airports AS T3 ON T2.DestAirport = T3.AirportCode WHERE T1.Airline = 'United Airlines' AND T3.City = 'Aberdeen'
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.DestAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City ORDER BY COUNT(*) DESC LIMIT 1
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportQode FROM flights ) AS CombinedAirports GROUP BY AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AirportCode FROM ( SELECT SourceAirport as AirportCode FROM flights UNION ALL SELECT DestAirport as AirportCode FROM flights ) AS AllFlights GROUP BY AirportCode ORDER BY COUNT(*) DESC LIMIT 1
SELECT AirportCode FROM ( SELECT AirportCode, COUNT(*) AS TotalFlights FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportAppCode FROM flights ) GROUP BY AirportCode ORDER BY TotalFlights ASC ) GROUP BY TotalFlights LIMIT 1
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportAdd FROM flights ) AS CombinedAirports GROUP BY AirportCode ORDER BY COUNT(*) ASC
SELECT Airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.uid ORDER BY COUNT(*) DESC LIMIT 1
SELECT Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.Airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid ORDER BY COUNT(*) ASC LIMIT 1
SELECT Abbreviation, Country FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline ORDER BY COUNT(*) ASC LIMIT 1)
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'AHD')
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline WHERE F.DestAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = "AHD"
SELECT Airline FROM ( SELECT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG' INTERSECT SELECT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' )
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport IN ('APG', 'CVO') GROUP BY T1.Airline HAVING COUNT(DISTINCT T2.SourceAirport) = 2
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline WHERE F.SourceAirport = 'CVO' AND F.Airline NOT IN ( SELECT Airline FROM flights WHERE SourceAirport = 'APG' )
SELECT Airline FROM flights WHERE SourceAirport = 'CVO' AND Airline NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'AP-407')
SELECT T1.Airline, T2.Airline FROM flights AS T1 JOIN airlines AS T2 ON T1.Airline = T2.uid GROUP BY T1.Airline HAVING COUNT(*) >= 10
SELECT Airline FROM flights GROUP BY Airline HAVING count(*) >= 10
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights GROUP BY Airline HAVING COUNT(*) < 200)
SELECT Airline FROM (SELECT airlines.uid, airlines.Airline, count(*) as FlightCount FROM airlines JOIN flights ON airlines.uid = flights.Airline GROUP BY airlines.uid) AS FlightCounts WHERE FlightCount < 200
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = "United Airlines"
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT T1.FlightNo FROM flights AS T1 JOIN airports AS T2 ON T1.SourceAirport = T2.AirportCode WHERE T2.AirportCode = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = "APG"
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT DISTINCT T2.FlightNo FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport WHERE T1.City = "Aberdeen"
SELECT FlightNo FROM flights WHERE SourceAirport IN (SELECT AirportCode FROM airports WHERE City = 'Aberdeen')
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights WHERE DestAirport = "Aberdeen"
SELECT COUNT(*) FROM flights AS F JOIN airports AS A ON F.DestAirport = A.AirportCode WHERE A.City IN ('Aberdeen', 'Abilene')
SELECT count(*) FROM flights WHERE DestAirport IN ('Aberdeen', 'Abilene')
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee
SELECT Name FROM employee ORDER BY Age, Employee_ID
SELECT Name FROM employee ORDER BY Age, Name
SELECT City, COUNT(*) FROM employee GROUP BY City
SELECT City, count(*) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT count(*) , Location FROM shop GROUP BY Location
SELECT count(*) , Location FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT min(Number_products), max(Number_products) FROM shop
SELECT min(Number_products), max(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_ID HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM evaluation GROUP BY Employee_ID)))
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY Bonus DESC LIMIT 1
SELECT Name FROM employee JOIN evaluation ON employee.Employee_ID = evaluation.Employee_ID ORDER BY Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Employee_ID, Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT T2.Name FROM shop AS T2 JOIN hiring AS T1 ON T2.Shop_ID = T1.Shop_ID GROUP BY T2.Shop_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT t2.Name FROM hiring AS t1 JOIN shop AS t2 ON t1.Shop_ID = t2.Shop_ID GROUP BY t2.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT s.Name, COUNT(*) FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name
SELECT S.Name, COUNT(*) AS Num_Employees FROM shop AS S JOIN hiring AS H ON S.Shop_ID = H.Shop_ID GROUP BY S.Shop_ID, S.Name
SELECT sum(Bonus) FROM evaluation
SELECT sum(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop WHERE Number_products > 10000 INTERSECT SELECT District FROM shop WHERE Number_products < 3000
SELECT T1.District FROM shop AS T1 WHERE T1.Number_products < 3000 INTERSECT SELECT T1.District FROM shop AS T1 WHERE T1.Number_products > 10000
SELECT count(DISTINCT "Location") FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents
SELECT Document_ID , Document_Name , Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE "%w%"
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = "Robbin CV"
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT count(DISTINCT Template_ID) FROM Documents
SELECT count(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT'
SELECT count(*) FROM Documents AS d JOIN Templates AS t ON d.Template_ID = t.Template_ID JOIN Ref_Template_Types AS rtt ON t.Template_Type_Code = rtt.Template_Type_Code WHERE rtt.Template_Type_Description = "PPT"
SELECT Template_ID , count(*) FROM Documents GROUP BY Template_ID
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT Template_ID, Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents GROUP BY Template_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates T1 JOIN Documents T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(T2.Document_ID) DESC LIMIT 1
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID , Version_Number , Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT');
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT count(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT count(*) FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY count(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING count(*) < 3
SELECT min(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID WHERE D.Document_Name = "Data base"
SELECT Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'
SELECT Documents.Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK'
SELECT Template_Type_Code, COUNT(DISTINCT Document_ID) FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code
SELECT Template_Type_Code, COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT Template_Details FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Details = 'Presentation'
SELECT count(*) FROM Paragraphs;
SELECT count(*) FROM Paragraphs
SELECT count(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show';
SELECT count(*) FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Summer Show'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = 'Korea '
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Document_Name = 'Welcome to NY'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Documents.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_id WHERE Documents.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_Id WHERE Documents.Document_Name = 'Customer reviews'
SELECT Document_ID, COUNT(*) FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT Document_ID, COUNT(Paragraph_ID) AS Num_Paragraphs FROM Paragraphs GROUP BY Document_ID ORDER BY Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(*) FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) >= 2
SELECT Documents.Document_ID, Documents.Document_Name FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name ORDER BY COUNT(*) DESC
SELECT Document_ID, Document_Name FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name ORDER BY COUNT(*) DESC
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING count(*) BETWEEN 1 AND 2;
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text IN ('Brazil', 'Ireland')
SELECT Document_ID FROM Documents WHERE Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%') AND Document_ID IN (SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%')
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age, Teacher_ID
SELECT Name FROM teacher ORDER BY Age, Teacher_ID
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != "Little Lever Urban District"
SELECT DISTINCT t1.Name FROM teacher AS t1 WHERE t1.Hometown != "Little Lever Urban District"
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Name FROM teacher WHERE Age = 32 OR Age = 33
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1
SELECT Hometown , COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown , COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) > 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T2.Name, T3.Course FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrage AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID ORDER BY T2.Name, T1.Course
SELECT T.Name, C.Course FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID ORDER BY T.Name, C.Course
SELECT Name FROM teacher WHERE Teacher_ID IN (SELECT Teacher_ID FROM course_arrange WHERE Course_ID IN (SELECT Course_ID FROM course WHERE Course = 'math'))
SELECT T2.Name FROM teacher AS T2 JOIN course_arrange AS T1 ON T2.Teacher_ID = T1.Teacher_ID JOIN course AS T3 ON T1.Course_ID = T3.Course_ID WHERE T3.Course = 'Math'
SELECT T1.Name, COUNT(*) FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID
SELECT T2.Name, COUNT(*) FROM teacher AS T2 JOIN course_arrange AS T1 ON T2.Teacher_ID = T1.Teacher_ID GROUP BY T2.Name
SELECT T2.Name FROM teacher AS T2 JOIN course_arrange AS T1 ON T2.Teacher_ID = T1.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(*) >= 2
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(*) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT count(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT avg(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT min(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT visitor.ID, visitor.Name, visitor.Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visit.visitor_ID, visit.Museum_ID HAVING COUNT(*) > 1
SELECT visitor.ID, visitor.Name, visitor.Level_of_membership FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID GROUP BY visitor.ID ORDER BY SUM(visit.Total_spent) DESC LIMIT 1
SELECT Museum_ID, Name FROM museum WHERE Museum_ID = (SELECT Museum_ID FROM visit GROUP BY Museum_ID ORDER BY count(*) DESC LIMIT 1)
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT Name, Age FROM visitor JOIN visit ON visitor.ID = visit.visitor_ID ORDER BY Num_of_Ticket DESC LIMIT 1
SELECT avg(Num_of_Ticket) , max(Num_of_Ticket) FROM visit
SELECT sum(Total_spent) FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID WHERE T1.Level_of_membership = 1
SELECT V.Name FROM visitor AS V JOIN visit AS Vi ON V.ID = Vi.visitor_ID JOIN museum AS M ON Vi.Museum_ID = M.Museum_ID WHERE M.Open_Year < 2009 INTERSECT SELECT V.Name FROM visitor AS V JOIN visit AS Vi ON V.ID = Vi.visitor_ID JOIN museum AS M ON Vi.Museum_ID = M.Museum_ID WHERE M.Open_Year > 2011
SELECT count(*) FROM visitor WHERE ID NOT IN (SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE Open_Year > 2010)
SELECT count(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT count(*) FROM players
SELECT count(*) FROM players
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = "USA"
SELECT avg(loser_age), avg(winner_age) FROM matches
SELECT avg(loser_age) AS avg_loser_age, avg(winner_age) AS avg_winner_age FROM matches
SELECT avg(winner_rank) FROM matches
SELECT avg(winner_rank) FROM matches
SELECT min(loser_rank) FROM matches
SELECT min(loser_rank) FROM matches
SELECT count(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10;
SELECT winner_name FROM matches WHERE year = 2013 INTERSECT SELECT winner_name FROM matches WHERE year = 2016
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) INTERSECT SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT count(*) FROM matches WHERE year IN (2013, 2016)
SELECT count(*) FROM matches WHERE year IN (2013, 2016)
SELECT T3.country_code, T3.first_name FROM matches AS T1 JOIN players AS T3 ON T1.winner_id = T3.player_id WHERE T1.tourney_name = "WTA Championships" INTERSECT SELECT T3.country_code, T3.first_name FROM matches AS T1 JOIN players AS T3 ON T1.winner_id = T3.player_id WHERE T1.tourney_name = "Australian Open"
SELECT first_name, country_code FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY winner_id HAVING COUNT(DISTINCT tourney_name) = 2)
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date, last_name, player_id
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date, player_id ASC;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC
SELECT T1.first_name, T1.country_code FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id ORDER BY COUNT(T2.tours) DESC LIMIT 1
SELECT P.first_name, P.country_code FROM players P JOIN rankings R ON P.player_id = R.player_id GROUP BY P.player_id ORDER BY R.tours DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1
SELECT first_name, last_name, sum(winner_rank_points) FROM players JOIN matches ON players.player_id = matches.winner_id GROUP BY players.player_id ORDER BY count(matches.winner_id) DESC LIMIT 1
SELECT Players.first_name || ' ' || Players.last_name AS full_name, SUM(matches.winner_rank_points) AS total_winner_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id GROUP BY matches.winner_id ORDER BY COUNT(matches.winner_id) DESC LIMIT 1
SELECT first_name, last_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT first_name , last_name FROM players JOIN matches ON players.player_id = matches.winner_id WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT T1.loser_name, T1.winner_name FROM matches AS T1 WHERE T1.minutes = (SELECT max(minutes) FROM matches)
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT P.player_id, P.first_name, avg(R.ranking) FROM players AS P JOIN rankings AS R ON P.player_id = R.player_id GROUP BY P.player_id, P.first_name
SELECT players.first_name, players.player_id, COALESCE(AVG(rankings.ranking_points), 0) AS avg_ranking FROM players LEFT JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id
SELECT sum(ranking_points) AS total_ranking_points, first_name, rankings.player_id FROM rankings JOIN players ON rankings.player_id = players.player_id GROUP BY rankings.player_id
SELECT first_name, COALESCE(SUM(ranking_points), 0) AS total_points FROM players LEFT JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, first_name
SELECT country_code, count(*) FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code ORDER BY count(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT ranking_date, sum(tours) FROM rankings GROUP BY ranking_date
SELECT sum(tours), ranking_date FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age LIMIT 3
SELECT first_name, last_name, winner_rank FROM players JOIN matches ON players.player_id = matches.winner_id ORDER BY birth_date DESC LIMIT 3
SELECT count(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L'
SELECT count(*) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships';
SELECT first_name, country_code, birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id ORDER BY T2.winner_rank_points DESC LIMIT 1
SELECT T1.first_name, T1.country_code, T1.birth_date FROM players AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id GROUP BY T1.player_id ORDER BY sum(T2.winner_rank_points) DESC LIMIT 1
SELECT hand, count(*) FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT count(*) FROM ship WHERE disposition_of_ship = "Captured";
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage ASC
SELECT name, date, result FROM battle
SELECT caused_by_ship_id, max(killed), min(killed) FROM death GROUP BY caused_by_ship_id
SELECT avg(injured) FROM death
SELECT killed, injured FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't')
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT B.id, B.name FROM battle B JOIN ship S ON B.id = S.lost_in_battle WHERE S.ship_type = 'Brig'
SELECT B.id, B.name FROM battle AS B JOIN ship AS S ON B.id = S.lost_in_battle JOIN death AS D ON S.id = D.caused_by_ship_id GROUP BY B.id, B.name HAVING SUM(D.killed) > 10
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id ORDER BY SUM(T2.injured) DESC
SELECT DISTINCT T1.name FROM battle AS T1 WHERE T1.bulgarian_commander = 'Kaloyan' AND T1.latin_commander = 'Baldwin I'
SELECT count(DISTinct result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = 225)
SELECT B.name, B.date FROM battle B JOIN ship S ON B.id = S.lost_in_battle WHERE S.name IN ('Lettice', 'HMS Atalanta')
SELECT name, result, bulgarian_commander FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel')
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses;
SELECT line_1, line_2 FROM Addresses;
SELECT count(*) FROM Courses
SELECT count(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'Math'
SELECT course_description FROM Courses WHERE course_name LIKE "%Math%"
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea"
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea"
SELECT D1.department_name, D1.department_id FROM Departments AS D1 JOIN Degree_Programs AS DP ON D1.department_id = DP.department_id GROUP BY D1.department_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.department_name, T1.department_id FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id GROUP BY T1.department_id ORDER BY COUNT(*) DESC
SELECT count(DISTINCT department_id) FROM Degree_Programs
SELECT count(DISTINCT department_id) FROM Degree_Programs
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT count(*) FROM Degree_Programs AS T1 JOIN Departments AS T2 ON T1.department_id = T2.department_id WHERE T2.department_name = 'Engineering'
SELECT count(*) FROM Degree_Programs WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Engineering')
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections
SELECT T1.course_id, T1.course_name FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING count(T2.section_id) <= 2
SELECT T1.course_id, T1.course_name FROM Courses AS T1 LEFT JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T1.semester_id, T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT S1.semester_id, S1.semester_name FROM Semesters S1 JOIN Student_Enrolment SE ON S1.semester_id = SE.semester_id GROUP BY S1.semester_id, S1.semester_name ORDER BY COUNT(SE.student_id) DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE "%computer%"
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT S.first_name, S.middle_name, S.last_name, S.student_id FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id GROUP BY S.student_id, SE.semester_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2
SELECT T1.student_id, T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id, T2.semester_id HAVING COUNT(DISTINCT T2.degree_program_id) = 2
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name LIKE '%Bachelor%'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelors'
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T2.degree_summary_name FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT S1.student_id, S1.first_name, S1.middle_name, S1.last_name, COUNT(*) AS number_of_enrollments FROM Students AS S1 JOIN Student_Enrolment AS SE ON S1.student_id = SE.student_id GROUP BY S1.student_id ORDER BY number_of_enrollments DESC LIMIT 1
SELECT first_name, middle_name, last_batch_name, student_id, COUNT(*) AS num_enrollments FROM Students JOIN Student_Enrolment ON Students.student_id = Student_Enrolment.student_id GROUP BY student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT T1.semester_name FROM Semesters AS T1 LEFT JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id WHERE T2.student_id IS NULL
SELECT DISTINCT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id
SELECT DISTINCT T2.course_name FROM Courses AS T2 JOIN Student_Enrolment_Courses AS T1 ON T2.course_id = T1.course_id
SELECT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id GROUP BY C.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id GROUP BY C.course_name ORDER BY COUNT(DISTINCT SEC.student_enrolment_id) DESC LIMIT 1
SELECT t1.last_name FROM Students AS t1 JOIN Addresses AS t2 ON t1.current_address_id = t2.address_id LEFT JOIN Student_Enrolment AS t3 ON t1.student_id = t3.student_id WHERE t2.state_province_county = 'North Carolina' AND t3.student_id IS NULL
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT T1.transcript_date, T1.transcript_id FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING count(*) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = "Timmothy" AND last_name = "Ward"
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC, student_id ASC LIMIT 1
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id;
SELECT DISTINCT T1.first_name FROM Students AS T1 WHERE T1.current_address_id != T1.permanent_address_id
SELECT current_address_id, line_1, line_2, line_3 FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY current_address_id ORDER BY COUNT(student_id) DESC LIMIT 1;
SELECT `address_id`, `line_1`, `line_2` FROM `Addresses` WHERE `address_id` IN (SELECT `current_address_id` AS `address_id` FROM `Students` UNION ALL SELECT `permanent_address_id` FROM `Students`) GROUP BY `address_id` ORDER BY COUNT(*) DESC, `address_id` ASC LIMIT 1
SELECT AVG(YEAR(transcript_date)) FROM Transcripts
SELECT avg(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT count(*) FROM Transcripts;
SELECT count(*) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT max(transcript_date) FROM Transcripts
SELECT COUNT(transcript_id) as max_transcript_count, student_course_id FROM Transcript_Contents GROUP BY student _course_id ORDER BY max_transcript_count DESC LIMIT 1;
SELECT course_id, count(DISTINCT transcript_id) AS num_transcripts FROM Student_Enrolment_Courses SEC JOIN Transcript_Contents TC ON SEC.student_course_id = TC.student_course_id GROUP BY course_id ORDER BY num_transcripts DESC
SELECT transcript_id, transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, transcript_date ORDER BY COUNT(*) ASC, T.transcript_id ASC LIMIT 1
SELECT transcript_id, transcript_date FROM Transcripts LEFT JOIN Transcript_Contents ON Transcripts.transcript_id = Transcript_Contents.transcript_id GROUP BY Transcripts.transcript_id ORDER BY COUNT(Transcript_Contents.student_course_id) ASC LIMIT 1
SELECT `Semesters`.semester_name FROM Semesters JOIN Student_Enrolment ON Semesters.semester_id = Student_Enrolment.semester_id JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name IN ('Master', 'Bachelor') GROUP BY Semesters.semester_name HAVING COUNT(DISTINCT Degree_Programs.degree_summary_name) = 2
SELECT T1.semester_id FROM Student_Enrolment AS T1 JOIN Degree_Programs AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY T1.semester_id HAVING COUNT(DISTINCT T2.degree_summary_name) = 2
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT A.city FROM Addresses AS A JOIN Students AS S ON A.address_id = S.current_address_id OR A.address_id = S.permanent_address_id
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC
SELECT other_student_details FROM Students ORDER BY other_student_details DESC
SELECT section_description FROM Sections WHERE section_name = 'H'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students WHERE permanent_address_id IN (SELECT address_id FROM Addresses WHERE country = 'Haiti') OR cell_mobile_number = '09700166582'
SELECT first_name FROM Students AS S JOIN Addresses AS A ON S.permanent_address_id = A.address_id WHERE A.country = "Haiti" OR S.cell_mobile_number = "09700166582";
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT count(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT count(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr"
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Title FROM Cartoon WHERE Directed_by IN ("Ben Jones", "Brandon Vietti")
SELECT Country , count(*) FROM TV_Channel GROUP BY Country ORDER BY count(*) DESC LIMIT 1
SELECT Country , COUNT(*) FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(DISTINCT series_name), count(DISTINCT Content) FROM TV_Channel
SELECT count(DISTinct series_name), count(DISTinct Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT count(*) FROM TV_Channel WHERE Language = "English"
SELECT count(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language , count(*) FROM TV_Channel GROUP BY Language ORDER BY count(*) ASC LIMIT 1;
SELECT Language, COUNT(*) FROM TV_Channel GROUP BY Language ORDER BY COUNT(*) ASC;
SELECT Language , COUNT(*) FROM TV_Channel GROUP BY Language
SELECT Language , COUNT(*) FROM TV_Channel GROUP BY Language
SELECT T1.series_name FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Title = 'The Rise of the Blue Beetle!'
SELECT TV_Channel.series_name FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Cartoon.Title = 'The Rise of the Blue Beetle'
SELECT Title FROM Cartoon JOIN TV_Channel ON Cartoon.Channel = TV_Channel.id WHERE TV_Channel.series_name = 'Sky Radio'
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS T ON C.Channel = T.id WHERE T.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating, id
SELECT Episode FROM TV_series ORDER BY Rating, id
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT min(Share), max(Share) FROM TV_series
SELECT max(Share), min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T2.Episode FROM TV_series AS T2 JOIN TV_Channel AS T1 ON T2.Channel = T1.id WHERE T1.series_name = 'Sky Radio'
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = 'Sky Radio'
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) FROM Cartoon GROUP BY Directed_by
SELECT production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = "Yes"
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes';
SELECT Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = "Todd Casey";
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by != "Todd Casey"
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT DISTINCT c.series_name, c.Country FROM TV_Channel AS c JOIN Cartoon AS t ON c.id = t.Channel WHERE t.Directed_by = 'Ben Jones' OR t.Directed_by = 'Michael Chang'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(*) > 2
SELECT TV_Channel.Country, COUNT(TV_Channel.id) FROM TV_Channel GROUP BY TV_Channel.Country HAVING COUNT(TV_Channel.id) > 2
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT count(*) FROM poker_player
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings, Poker_Player_ID FROM poker_player ORDER BY Earnings DESC, Poker_Player_ID ASC
SELECT Final_Table_Made, Best_Finish FROM poker_player;
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT Name FROM people JOIN poker_player ON people.People_ID = poker_player.People_ID
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings > 300000)
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T1.Earnings > 300000
SELECT P.name FROM people AS P JOIN poker_player AS PP ON P.People_ID = PP.People_ID ORDER BY PP.Final_Table_Made ASC, PP.Earnings DESC, PP.Poker_Player_ID ASC
SELECT Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID ORDER BY pp.Final_Table_Made ASC, p.Name ASC, pp.Poker_Player_ID ASC
SELECT t2.Birth_Date FROM poker_player AS t1 JOIN people AS t2 ON t1.People_ID = t2.People_ID WHERE t1.Earnings = (SELECT min(Earnings) FROM poker_player)
SELECT t2.Birth_Date FROM poker_player AS t1 JOIN people AS t2 ON t1.People_ID = t2.People_ID WHERE t1.Earnings = (SELECT min(Earnings) FROM poker_player)
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT Money_Rank FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY Height DESC LIMIT 1
SELECT avg(Earnings) FROM poker_player AS P JOIN people AS Pe ON P.People_ID = Pe.People_ID WHERE Pe.Height > 200
SELECT avg(Earnings) FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE Height > 200
SELECT P.name FROM people AS P JOIN poker_player AS PP ON P.People_ID = PP.People_ID ORDER BY PP.Earnings DESC, P.Name
SELECT Name FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID ORDER BY Earnings DESC, Name ASC, Poker_Player_ID ASC
SELECT Nationality, count(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name, People_ID
SELECT Name, Birth_Date FROM people ORDER BY Name, People_ID
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT Nationality) FROM people
SELECT count(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id , phone_number , state FROM VOTES
SELECT max(area_code), min(area_code) FROM AREA_CODE_STATE
SELECT max(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT `CONTESTANTS`.`contestant_number`, `CONTESTANTS`.`contestant_name` FROM `CONTESTANTS` JOIN `VOTES` ON `CONTESTANTS`.`contestant_number` = `VOTES`.`contestant_number` GROUP BY `CONTESTANTS`.`contestant_number`, `CONTESTANTS`.`contestant_name` HAVING COUNT(*) >= 2
SELECT T1.contestant_number, T2.contestant_name FROM VOTES AS T1 JOIN CONTESTANTS AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM VOTES WHERE state IN ('NY', 'CA');
SELECT count(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1)
SELECT V.created, V.state, V.phone_number FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'
SELECT DISTINCT V1.phone_number FROM VOTES AS V1 JOIN VOTES AS V2 ON V1.phone_number = V2.phone_number JOIN CONTESTANTS AS C1 ON V1.contestant_number = C1.contestant_number JOIN CONTESTANTS AS C2 ON V2.contestant_number = C2.contestant_number WHERE C1.contestant_name = 'Tabatha Gehling' AND C2.contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT count(*) FROM country WHERE GovernmentForm LIKE "%Republic%"
SELECT count(*) FROM country WHERE GovernmentForm LIKE "%Republic%"
SELECT sum(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT sum(SurfaceArea) FROM country WHERE Region = "Caribbean"
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT `Region` FROM `city` JOIN `country` ON `city`.`CountryCode` = `country`.`Code` WHERE `city`.`Name` = 'Kabul'
SELECT Region FROM city WHERE Name = "Kabul"
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') ORDER BY Percentage DESC LIMIT 1
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name = "Brazil"
SELECT Population, LifeExpectancy FROM country WHERE Name = "Brazil"
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = "Angola"
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT avg(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1;
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy LIMIT 1;
SELECT sum(Population) , max(GNP) FROM country WHERE Continent = 'Asia'
SELECT sum(Population) , max(GNP) FROM country WHERE Continent = 'Asia'
SELECT avg(LifeExpectancy) FROM country WHERE Continent = "Africa" AND GovernmentForm LIKE '%Republic%'
SELECT avg(LifeExpectancy) FROM country WHERE Continent = "Africa" AND GovernmentForm LIKE "%republic%"
SELECT sum(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT sum(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT sum(Population) FROM city WHERE District = 'Gelderland'
SELECT sum(Population) FROM city WHERE District = 'Gelderland'
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT avg(GNP), sum(Population) FROM country WHERE GovernmentForm = 'US Territory'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT count(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT count(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba')
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT T2.Name FROM country AS T2 JOIN countrylanguage AS T1 ON T1.CountryCode = T2.Code GROUP BY T1.CountryCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name ORDER BY COUNT(T2.Language) DESC LIMIT 1
SELECT Continent FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY Continent ORDER BY count(DISTINCT cl.Language) DESC LIMIT 1
SELECT Continent FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent ORDER BY COUNT(DISTINCT Language) DESC
SELECT count(*) FROM ( SELECT T1.CountryCode FROM countrylanguage AS T1 WHERE T1.Language = "English" INTERSECT SELECT T2.CountryCode FROM countrylanguage AS T2 WHERE T2.Language = "Dutch" ) AS ResultTable
SELECT count(*) FROM countrylanguage WHERE Language IN ('English', 'Dutch')
SELECT country.Name FROM country JOIN countrylanguage AS cl1 ON country.Code = cl1.CountryCode JOIN countrylanguage AS cl2 ON country.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'French' AND cl1.IsOfficial = 'T' AND cl2.IsOfficial = 'T'
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') INTERSECT SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French')
SELECT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'French') AND cl.IsOfficial = 'T' GROUP BY c.Name HAVING COUNT(*) = 2
SELECT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'French') AND T2.IsOfficial = 'T' GROUP BY T1.Name HAVING COUNT(*) = 2
SELECT count(DISTINCT Continent) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese'
SELECT count(DISTINCT Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = "Chinese"
SELECT DISTINCT country.Region FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language IN ('English', 'Dutch')
SELECT DISTINCT `Region` FROM `country` JOIN `countrylanguage` ON `country`.`Code` = `countrylanguage`.`CountryCode` WHERE `Language` = "Dutch" OR `Language` = "English"
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language IN ('English', 'Dutch') AND IsOfficial = 'T')
SELECT Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE (Language = "English" OR Language = "Dutch") AND IsOfficial = 'T'
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC
SELECT Language FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code WHERE C.Continent = 'Asia' GROUP BY Language ORDER BY COUNT(*) DESC;
SELECT Language FROM countrylanguage AS cl JOIN country AS c ON cl.CountryCode = c.Code WHERE c.GovernmentForm = 'Republic' GROUP BY cl.Language HAVING COUNT(DISTINCT cl.CountryCode) = 1
SELECT Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code GROUP BY cl.Language HAVING COUNT(DISTINCT c.Code) = 1 AND MAX(c.GovernmentForm) = 'Republic'
SELECT Name, Population FROM city WHERE CountryCode IN (SELECT CountryCode FROM countrylanguage WHERE Language = "English" AND IsOfficial = 'T') ORDER BY Population DESC LIMIT 1
SELECT Name, Population FROM city WHERE ID IN (SELECT Capital FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = "English" AND IsOfficial = 'T')) ORDER BY Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE SurfaceArea = (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Asia') AND Continent = 'Asia'
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT avg(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT sum(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE HeadOfState = 'Beatrix') AND IsOfficial = 'T'
SELECT Language FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode = (SELECT Code FROM country WHERE HeadOfState = 'Beatrix')
SELECT count(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT count(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = "Africa" AND Population < (SELECT MIN(Population) FROM country WHERE Continent = "Asia")
SELECT A.Name FROM country A JOIN country B ON A.Population < B.Population WHERE A.Continent = 'Africa' AND B.Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT max(Population) FROM country WHERE Continent = 'Africa')
SELECT T1.Name FROM country AS T1 JOIN country AS T2 ON T1.Continent = 'Asia' AND T2.Continent = 'Africa' WHERE T1.Population > T2.Population GROUP BY T1.Name HAVING COUNT(T2.Name) = (SELECT COUNT(*) FROM country WHERE Continent = 'Africa')
SELECT Code FROM country EXCEPT SELECT CountryCode FROM countrylanguage WHERE Language = 'English'
SELECT CountryCode FROM countrylanguage WHERE Language <> "English"
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe') AND CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe') AND CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT c.Name, c.Population FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population LIMIT 1
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT MIN(Population) FROM country)
SELECT Population, Name, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT Name, Population, HeadOfState FROM country ORDER BY SurfaceArea DESC LIMIT 1
SELECT country.Name, COUNT(*) AS number_of_languages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY country.Code HAVING COUNT(*) >= 3
SELECT Country.Name, COUNT(*) AS LanguageCount FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Country.Name HAVING COUNT(*) > 2
SELECT count(*) AS NumberOfCities, District FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District
SELECT count(*) , District FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
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
SELECT Name FROM country WHERE Continent = "Europe" AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT sum(Population), avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT sum(Population) , avg(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(*) DESC
SELECT CL.CountryCode, C.Name, CL.Language, MAX(CL.Percentage) as Percentage FROM countrylanguage CL JOIN country C ON CL.CountryCode = C.Code GROUP BY CL.CountryCode ORDER BY CL.Percentage DESC
SELECT CountryCode, Language FROM countrylanguage WHERE (CountryCode, Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode)
SELECT count(*) FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT max(Percentage) FROM countrylanguage WHERE CountryCode = countrylanguage.CountryCode))
SELECT count(*) FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age, Conductor_ID
SELECT Name FROM conductor ORDER BY Age, Conductor_ID
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID
SELECT avg(Attendance) FROM show
SELECT avg(Attendance) FROM show
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'
SELECT count(DISTINCT Nationality) FROM conductor
SELECT count(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT C.Name, O.Orchestra FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(DISTINCT T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(DISTINCT T2.Orchestra_ID) > 1
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM conductor AS t1 JOIN orchestra AS t2 ON t1.Conductor_ID = t2.Conductor_ID GROUP BY t1.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID WHERE o.Year_of_Founded > 2008
SELECT DISTINCT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_format ASC
SELECT `Major_Record_Format`, COUNT(`Orchestra_ID`), `Orchestra_ID` FROM `orchestra` GROUP BY `Major_Record_Format` ORDER BY COUNT(`Orchestra_ID`) DESC, `Major_Record_Format`, `Orchestra_ID`
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT O.Year_of_Founded FROM orchestra AS O JOIN performance AS P ON O.Orchestra_ID = P.Orchestra_ID GROUP BY O.Orchestra_ID HAVING COUNT(P.Performance_ID) > 1
SELECT Year_of_Founded FROM orchestra AS T1 JOIN performance AS T2 ON T1.Orchestra_ID = T2.Orchestra_ID GROUP BY T1.Orchestra_ID HAVING COUNT(*) > 1
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler;
SELECT DISTINCT grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = "Kyle"
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT count(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT count(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id, COUNT(DISTINCT friend_id) AS total_friends FROM (SELECT student_id, friend_id FROM Friend UNION ALL SELECT friend_id AS student_id, student_id AS friend_id FROM Friend) AS Combined GROUP BY student_id
SELECT H.ID, H.name, COUNT(*) AS total_friends FROM Highschooler H LEFT JOIN (SELECT student_id, friend_id FROM Friend UNION ALL SELECT friend_id, student_id FROM Friend) AS F ON H.ID = F.student_id GROUP BY H.ID
SELECT Highschooler.name, COUNT(Friend.friend_id) FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id GROUP BY Highschooler.name
SELECT H.name, count(F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.name
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM (SELECT student_id FROM Friend UNION ALL SELECT friend_id AS student_id FROM Friend) AS all_friends GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.name FROM Highschooler AS H JOIN (SELECT student_id FROM Friend UNION ALL SELECT friend_id FROM Friend) AS F ON H.ID = F.student_id GROUP BY H.ID, H.name HAVING COUNT(*) >= 3
SELECT name FROM Highschooler WHERE ID IN ( SELECT student_id FROM Friend GROUP BY student_id HAVING count(friend_id) >= 3 UNION SELECT friend_id FROM Friend GROUP BY friend_id HAVING count(student_id) >= 3 )
SELECT H.ID, F2.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id JOIN Highschooler F2 ON F.friend_id = F2.ID WHERE H.name = 'Kyle'
SELECT H1.ID, H2.name FROM Highschooler AS H1 JOIN Friend ON H1.ID = Friend.student_id JOIN Highschooler AS H2 ON Friend.friend_id = H2.ID WHERE H1.name = 'Kyle'
SELECT H.ID, count(F.friend_id) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID;
SELECT H.ID, COUNT(F.friend_id) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT f.student_id FROM Friend AS f JOIN Likes AS l ON f.student_id = l.liked_id
SELECT DISTINCT T1.student_id FROM Friend AS T1 JOIN Likes AS T2 ON T1.student_id = T2.liked_id
SELECT DISTINCT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.student_id JOIN Likes AS L ON H.ID = L.liked_id
SELECT DISTINCT h.name FROM Highschooler AS h JOIN Friend AS f ON h.ID = f.student_id JOIN Likes AS l ON h.ID = l.student_id
SELECT student_id, COUNT(*) AS total_likes FROM ( SELECT student_id FROM Likes UNION ALL SELECT liked_id AS student_id FROM Likes ) CombinedLikes GROUP BY student_id
SELECT student_id, COUNT(*) AS total_likes FROM (SELECT student_id FROM Likes UNION ALL SELECT liked_id FROM Likes) GROUP BY student_id
SELECT H.name, SUM(CASE WHEN L1.student_id = H.ID THEN 1 ELSE 0 END) AS Likes_Given, SUM(CASE WHEN L2.liked_id = H.ID THEN 1 ELSE 0 END) AS Likes_Received FROM Highschooler H LEFT JOIN Likes L1 ON H.ID = L1.student_id LEFT JOIN Likes L2 ON H.ID = L2.liked_id GROUP BY H.ID, H.name
SELECT H.name, SUM(CASE WHEN L.student_id = H.ID THEN 1 ELSE 0 END) AS likes_given, SUM(CASE WHEN L.liked_id = H.ID THEN 1 ELSE 0 END) AS likes_received FROM Highschooler H LEFT JOIN Likes L ON H.ID = L.student_id OR H.ID = L.liked_id GROUP BY H.ID, H.name
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id GROUP BY L.liked_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id GROUP BY L.liked_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Highschooler.name FROM Highschooler JOIN Likes ON Highschooler.ID = Likes.liked_id GROUP BY Likes.liked_id HAVING COUNT(*) >= 2
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id GROUP BY L.liked_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE grade > 5 AND ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 2 UNION ALL SELECT friend_id FROM Friend GROUP BY friend_id HAVING COUNT(student_id) >= 2)
SELECT H.name FROM Highschooler AS H JOIN (SELECT student_id FROM Friend GROUP BY student_id HAVING count(*) >= 2 UNION ALL SELECT friend_id FROM Friend GROUP BY friend_id HAVING count(*) >= 2) AS F ON H.ID = F.student_id WHERE H.grade > 5
SELECT H.ID, count(*) FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.liked_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT H.ID, COUNT(L.liked_id) FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id WHERE H.name = 'Kyle' GROUP BY H.ID
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT avg(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT O.state FROM Owners AS O JOIN Professionals AS P ON O.state = P.state
SELECT DISTINCT T1.state FROM Owners AS T1 JOIN Professionals AS T2 ON T1.state = T2.state
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT avg(age) FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments)
SELECT professional_id, last_name, cell_number FROM Professionals WHERE state = 'Indiana' UNION SELECT professional_id, last_name, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2)
SELECT DISTINCT T1.professional_id, T1.last_name, T1.cell_number FROM Professionals AS T1 LEFT JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id, T1.last_name, T1.cell_number HAVING T1.state = 'Indiana' OR COUNT(T2.treatment_id) > 2
SELECT name FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING sum(cost_of_treatment) > 1000)
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id JOIN Owners AS O ON D.owner_id = O.owner_id GROUP BY D.dog_id HAVING SUM(T.cost_of_treatment) <= 1000
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT first_name FROM (SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners) AS Names WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals EXCEPT SELECT T1.professional_id, T1.role_code, T1.email_address FROM Professionals AS T1 JOIN Treatments ON T1.professional_id = Treatments.professional_id
SELECT T1.owner_id, T1.first_name, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner in GROUP BY T1.owner_id ORDER BY count(*) DESC LIMIT 1;
SELECT owner_id, first_name, last_name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id GROUP BY Owners.owner_id ORDER BY count(*) DESC LIMIT 1
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(*) >= 2
SELECT T1.professional_id, T1.role_code, T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING count(*) >= 2
SELECT B.breed_name FROM Breeds AS B JOIN Dogs AS D ON B.breed_code = D.breed_code GROUP BY B.breed_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT B.`breed_name` FROM Dogs AS D JOIN Breeds AS B ON D.breed_code = B.breed_code GROUP BY B.breed_name ORDER BY COUNT(D.dog_id) DESC LIMIT 1
SELECT T1.owner_id, T2.last_name FROM Owners AS T2 JOIN Dogs AS T1 ON T2.owner_id = T1.owner_id JOIN Treatments AS T3 ON T1.dog_id = T3.dog_id GROUP BY T1.owner_id, T2.last_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.owner_id, T1.last_name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT t1.treatment_type_description FROM Treatment_Types AS t1 JOIN Treatments AS t2 ON t1.treatment_type_code = t2.treatment_type_code GROUP BY t1.treatment_type_description ORDER BY SUM(t2.cost_of_treatment) ASC LIMIT 1
SELECT treatment_type_description FROM Treatment_Types JOIN Treatments ON Treatment_Types.treatment_type_code = Treatments.treatment_type_code GROUP BY Treatment_Types.treatment_type_code ORDER BY SUM(cost_of_treatment) LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.zip_code ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT T1.professional_id, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(DISTINCT T2.treatment_type_code) >= 2
SELECT professional_id, cell_number FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT first_name, last_name FROM Professionals WHERE professional_id IN (SELECT professional_id FROM Treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments))
SELECT DISTINCT T2.first_name, T2.last_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id WHERE T1.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT date_of_treatment , first_name FROM Treatments JOIN Professionals ON Treatments.professional_id = Professionals.professional_id
SELECT Date_of_treatment , T1.first_name FROM Treatments AS T JOIN Professionals AS T1 ON T.professional_id = T1.professional_id
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment , T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.first_name, T1.last_name, T3.size_description FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Sizes AS T3 ON T2.size_code = T3.size_code
SELECT Owners.first_name, Owners.last_name, Sizes.size_description FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id JOIN Sizes ON Dogs.size_code = Sizes.size_code
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT T1.first_name, T2.name FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id
SELECT D.name, T.date_of_treatment FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code IN ( SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) LIMIT 1 )
SELECT D.name, T.date_of_treatment FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code IN ( SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) = ( SELECT MIN(count) FROM ( SELECT COUNT(*) AS count FROM Dogs GROUP BY breed_code ) AS Temp1 ) ) ORDER BY T.date_of_treatment;
SELECT O.first_name, D.name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia'
SELECT O.first_name, D.name FROM Owners AS O JOIN Dogs AS D ON O.owner_ID = D.owner_ID WHERE O.state = 'Virginia'
SELECT DISTINCT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE age = (SELECT min(age) FROM Dogs))
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE age = (SELECT min(age) FROM Dogs))
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT count(DISTINCT `dog_id`) FROM `Treatments`
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT COUNT(DISTINCT professional_id) FROM Treatments
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE "%West%"
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE "%North%"
SELECT count(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT max(T1.cost_of_treatment) FROM Treatments AS T1 WHERE T1.date_of_treatment = (SELECT max(date_of_treatment) FROM Treatments)
SELECT SUM(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT count(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs)
SELECT count(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs WHERE date_adopted IS NULL)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT avg(age) FROM Dogs
SELECT avg(age) FROM Dogs
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1
SELECT charge_type, sum(charge_amount) FROM Charges GROUP BY charge_type
SELECT charge_type, charge_amount FROM Charges;
SELECT max(charge_amount) FROM Charges
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address , cell_number , home_phone FROM Professionals
SELECT B.breed_name, S.size_description FROM Breeds B CROSS JOIN Sizes S;
SELECT DISTINCT Breeds.breed_name, Sizes.size_description FROM Dogs JOIN Breeds ON Dogs.breed_code = Breeds.breed_code JOIN Sizes ON Dogs.size_code = Sizes.size_code
SELECT T1.first_name, T3.treatment_type_description FROM Professionals T1 JOIN Treatments T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT T1.first_name, T3.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions, Name
SELECT Name FROM singer ORDER BY Net_Worth_Millions, Singer_ID
SELECT Birth_Year , Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship;
SELECT "Citizenship", max("Net_Worth_Millions") FROM "singer" GROUP BY "Citizenship"
SELECT S2.Title, S1.Name FROM singer AS S1 JOIN song AS S2 ON S1.Singer_ID = S2.Singer_ID
SELECT Title, Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT s.Name FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT Name FROM singer AS S JOIN song AS SO ON S.Singer_ID = SO.Singer_ID GROUP BY S.Name HAVING COUNT(*) > 1
SELECT Name FROM singer JOIN song ON singer.Singer_ID = song.Singer_ID GROUP BY singer.Singer_ID HAVING COUNT(song.Song_ID) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT sum(Sales), Singer_ID FROM song GROUP BY Singer_ID
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features
SELECT feature_type_name FROM Ref_Feature_Types JOIN Other_Available_Features ON Ref_Feature_Types.feature_type_code = Other_Available_Features.feature_type_code WHERE Other_Available_Features.feature_name = 'AirCon'
SELECT property_type_description FROM Ref_Property_Types
SELECT property_name FROM Properties WHERE (property_type_code = 'HSE' OR property_type_code = 'APT') AND room_count > 1
