SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID
SELECT Name, Country, Age FROM singer ORDER BY Age DESC, Singer_ID ASC
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'France'
SELECT AVG(Age), MIN(Age), MAX(Age) FROM singer WHERE Country = 'French'
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT min(Age) FROM singer)
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer)
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT Country, COUNT(Singer_ID) FROM singer GROUP BY Country
SELECT Country, COUNT(*) FROM singer GROUP BY Country
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)
SELECT DISTINCT Song_Name FROM singer WHERE Age > (SELECT avg(Age) FROM singer)
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity), AVG(Average) FROM stadium
SELECT MAX(Capacity), AVG(Capacity) FROM stadium
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT max(Average) FROM stadium) ORDER BY Stadium_ID ASC LIMIT 1
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT max(Average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE Year = 2014 OR Year = 2015
SELECT COUNT(*) FROM concert WHERE Year IN (2014, 2015)
SELECT T1.Name, COUNT(T2.concert_ID) FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID GROUP BY T1.Name
SELECT Stadium_ID, COUNT(concert_ID) FROM concert GROUP BY Stadium_ID
SELECT T2.Name, T2.Capacity FROM concert AS T1 JOIN stadium AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T1.Year >= 2014 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T1.Capacity FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year > 2013 GROUP BY T1.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = 2014)
SELECT T1.concert_Name, T1.Theme, COUNT(T2.Singer_ID) FROM concert AS T1 LEFT JOIN singer_in_concert AS T2 ON T1.concert_ID = T2.concert_ID GROUP BY T1.concert_ID, T1.concert_Name, T1.Theme
SELECT concert_Name, Theme, COUNT(Singer_ID) AS number_of_singers FROM concert JOIN singer_in_concert ON concert.concert_ID = singer_in_concert.concert_ID GROUP BY concert.concert_ID, concert_Name, Theme
SELECT T1.Name, COUNT(T2.concert_ID) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT T1.Name, COUNT(DISTINCT T2.concert_ID) FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN singer_in_concert AS T2 ON T1.Singer_ID = T2.Singer_ID JOIN concert AS T3 ON T2.concert_ID = T3.concert_ID WHERE T3.Year = 2014
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE '%Hey%'
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014) AND Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2015)
SELECT Name, Location FROM stadium WHERE Stadium_ID IN (SELECT Stadium_ID FROM concert WHERE Year = 2014) INTERSECT SELECT Stadium_ID FROM concert WHERE Year = 2015
SELECT COUNT(*) FROM concert WHERE Stadium_ID = (SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE Stadium_ID IN (SELECT Stadium_ID FROM stadium WHERE Capacity = (SELECT MAX(Capacity) FROM stadium))
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT COUNT(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT weight FROM Pets WHERE pet_age = (SELECT min(pet_age) FROM Pets WHERE PetType = 'dog') AND PetType = 'dog'
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) FROM Pets GROUP BY PetType
SELECT COUNT(T1.PetID) FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID WHERE T2.Age > 20
SELECT COUNT(DISTINCT T1.PetID) FROM Has_Pet AS T1 JOIN Student AS T2 ON T1.StuID = T2.StuID WHERE T2.Age > 20
SELECT COUNT(*) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Pets.PetType = 'dog' AND Student.Sex = 'F'
SELECT COUNT(*) FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Pets.PetType = 'dog' AND Student.Sex = 'female'
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT COUNT(DISTINCT PetType) FROM Pets
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType IN ('cat', 'dog')
SELECT DISTINCT T1.Fname FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID JOIN Pets AS T3 ON T2.PetID = T3.PetID WHERE T3.PetType = 'cat' OR T3.PetType = 'dog'
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') AND StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog')
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat') AND StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Major, Age FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT StuID FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog') AND StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT Fname FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog') AND StuID NOT IN (SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat')
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetType, weight FROM Pets WHERE pet_age = (SELECT MIN(pet_age) FROM Pets)
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS Average_Age, MAX(pet_age) AS Max_Age FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS average_age, MAX(pet_age) AS max_age FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType
SELECT Fname, Age FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet)
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT Pets.PetID FROM Pets JOIN Has_Pet ON Pets.PetID = Has_Pet.PetID JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
SELECT T2.PetID FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID WHERE T1.LName = 'Smith'
SELECT StuID, COUNT(PetID) AS NumberOfPets FROM Has_Pet GROUP BY StuID
SELECT T1.StuID, COUNT(T2.PetID) FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID GROUP BY T1.StuID
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT Fname, Sex FROM Student WHERE StuID IN (SELECT StuID FROM Has_Pet GROUP BY StuID HAVING COUNT(PetID) > 1)
SELECT Student.LName FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Pets.pet_age = 3
SELECT Student.LName FROM Student JOIN Has_Pet ON Student.StuID = Has_Pet.StuID JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE Pets.PetType = 'cat' AND Pets.pet_age = 3
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT COUNT(DISTINCT Continent) FROM continents
SELECT COUNT(DISTINCT Continent) FROM continents
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) FROM continents AS T1 JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId, T1.Continent
SELECT T1.ContId, T1.Continent, COUNT(T2.CountryId) FROM continents AS T1 LEFT JOIN countries AS T2 ON T1.ContId = T2.Continent GROUP BY T1.ContId, T1.Continent
SELECT COUNT(*) FROM countries
SELECT COUNT(*) FROM countries
SELECT T1.FullName, T1.Id, COUNT(T2.Model) FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.FullName
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumberOfModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.Horsepower ASC LIMIT 1
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Horsepower = (SELECT min(Horsepower) FROM cars_data))
SELECT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data))
SELECT MakeId FROM car_names WHERE Id IN (SELECT Id FROM cars_data WHERE Weight < (SELECT avg(Weight) FROM cars_data))
SELECT DISTINCT T1.FullName FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year = 1970
SELECT DISTINCT T1.FullName FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.Model = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T4.Year = 1970
SELECT T1.Make, T2.Year FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year = (SELECT min(Year) FROM cars_data)
SELECT T1.FullName, MIN(T3.Year) FROM car_makers AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN cars_data AS T3 ON T2.MakeId = T3.Id
SELECT DISTINCT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Year > 1980
SELECT DISTINCT T1.ModelId, T1.Model FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model JOIN cars_data AS T3 ON T2.MakeId = T3.Id WHERE T3.Year > 1980
SELECT T1.Continent, COUNT(DISTINCT T2.Id) FROM continents AS T1 JOIN countries AS T3 ON T1.ContId = T3.Continent JOIN car_makers AS T2 ON T3.CountryId = T2.Country GROUP BY T1.Continent
SELECT T3.Continent, COUNT(T1.Id) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId JOIN continents AS T3 ON T2.Continent = T3.ContId GROUP BY T3.Continent
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T2.CountryName HAVING COUNT(T1.Id) = (SELECT MAX(car_count) FROM (SELECT COUNT(Id) AS car_count FROM car_makers GROUP BY Country) AS subquery)
SELECT T2.CountryName FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId GROUP BY T1.Country HAVING COUNT(T1.Id) = (SELECT MAX(MakerCount) FROM (SELECT COUNT(Id) AS MakerCount FROM car_makers GROUP BY Country) AS SubQuery)
SELECT COUNT(T1.Model), T2.FullName FROM model_list AS T1 JOIN car_makers AS T2 ON T1.Maker = T2.Id GROUP BY T2.FullName
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.Model) FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName
SELECT T1.Accelerate FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'amc hornet sportabout (sw)'
SELECT Accelerate FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE car_names.Model = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France'
SELECT COUNT(DISTINCT T1.Id) FROM car_makers AS T1 JOIN countries AS T2 ON T1.Country = T2.CountryId WHERE T2.CountryName = 'France'
SELECT COUNT(DISTINCT T1.Model) FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T2.Country = 'USA'
SELECT COUNT(DISTINCT T1.Model) FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T2.FullName = 'usa'
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT AVG(MPG) FROM cars_data WHERE Cylinders = 4
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = '1974'
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT T1.FullName, T2.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT T1.FullName, T2.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker
SELECT DISTINCT T1.CountryName, T1.CountryId FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country
SELECT DISTINCT T1.CountryId, T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country WHERE EXISTS (SELECT 1 FROM car_makers WHERE Country = T1.CountryId)
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT Year, AVG(Weight) FROM cars_data GROUP BY Year
SELECT T1.CountryName FROM countries AS T1 JOIN continents AS T2 ON T1.Continent = T2.ContId JOIN car_makers AS T3 ON T1.CountryId = T3.Country WHERE T2.Continent = 'Europe' GROUP BY T1.CountryName HAVING COUNT(T3.Id) >= 3
SELECT T1.CountryName FROM countries AS T1 JOIN car_makers AS T2 ON T1.CountryId = T2.Country GROUP BY T1.CountryName HAVING COUNT(T2.Id) >= 3 AND T1.Continent = 'Europe'
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3
SELECT MAX(T1.Horsepower), T2.Make FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 3 GROUP BY T2.Make ORDER BY MAX(T1.Horsepower) DESC LIMIT 1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id ORDER BY T2.MPG DESC LIMIT 1
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(Horsepower) FROM cars_data WHERE Year < 1980
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'Volvo'
SELECT AVG(T1.Edispl) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN model_list AS T3 ON T2.Model = T3.Model JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.FullName = 'Volvo'
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT T1.ModelId FROM model_list AS T1 JOIN car_names AS T2 ON T1.Model = T2.Model GROUP BY T1.ModelId ORDER BY COUNT(DISTINCT T2.MakeId) DESC LIMIT 1
SELECT MakeId FROM car_names GROUP BY MakeId ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM cars_data WHERE Year = 1980
SELECT COUNT(*) FROM car_names JOIN car_makers ON car_names.MakeId = car_makers.Id WHERE car_makers.FullName = 'American Motor Company'
SELECT COUNT(T1.Model) FROM car_names AS T1 JOIN car_makers AS T2 ON T1.MakeId = T2.Id WHERE T2.FullName = 'American Motor Company'
SELECT T1.FullName, T1.Id FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id HAVING COUNT(T2.Model) > 3
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker GROUP BY T1.Id, T1.Maker HAVING COUNT(T2.Model) > 3
SELECT DISTINCT T1.Model FROM car_names AS T1 JOIN model_list AS T2 ON T1.MakeId = T2.ModelId JOIN car_makers AS T3 ON T2.Maker = T3.Id JOIN cars_data AS T4 ON T1.MakeId = T4.Id WHERE T3.FullName = 'General Motors' OR T4.Weight > 3500
SELECT DISTINCT T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id JOIN model_list AS T3 ON T1.MakeId = T3.ModelId JOIN car_makers AS T4 ON T3.Maker = T4.Id WHERE T4.Maker = 'General Motors' OR T2.Weight > 3500
SELECT DISTINCT Year FROM cars_data WHERE Weight BETWEEN 3000 AND 4000
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data WHERE Accelerate = (SELECT MAX(Accelerate) FROM cars_data)
SELECT Cylinders FROM cars_data WHERE Accelerate = (SELECT min(Accelerate) FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T2.Model = 'Volvo') AND Id IN (SELECT MakeId FROM car_names WHERE Model = 'Volvo')
SELECT Cylinders FROM cars_data WHERE Id IN (SELECT Id FROM cars_data WHERE Accelerate = (SELECT min(Accelerate) FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo'))
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT max(Horsepower) FROM cars_data)
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT max(Horsepower) FROM cars_data)
SELECT COUNT(*) FROM (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(Id) > 2) AS subquery
SELECT COUNT(DISTINCT CountryId) FROM car_makers GROUP BY CountryId HAVING COUNT(*) > 2
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT COUNT(*) FROM cars_data WHERE Cylinders > 6
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T2.Model FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId WHERE T1.Cylinders = 4 ORDER BY T1.Horsepower DESC LIMIT 1
SELECT T2.MakeId, T3.Maker FROM cars_data AS T1 JOIN car_names AS T2 ON T1.Id = T2.MakeId JOIN car_makers AS T3 ON T2.MakeId = T3.Id WHERE T1.Horsepower > (SELECT min(Horsepower) FROM cars_data) AND T1.Cylinders <= 3
SELECT T1.MakeId, T1.Model FROM car_names AS T1 JOIN cars_data AS T2 ON T1.MakeId = T2.Id WHERE T2.Horsepower > (SELECT min(Horsepower) FROM cars_data) AND T2.Cylinders < 4
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980
SELECT ModelId FROM model_list WHERE ModelId IN (SELECT Id FROM cars_data WHERE Weight < 3500) AND Maker NOT IN (SELECT Id FROM car_makers WHERE FullName = 'Ford Motor Company')
SELECT DISTINCT Model FROM car_names WHERE MakeId IN (SELECT Id FROM cars_data WHERE Weight < 3500) AND MakeId NOT IN (SELECT ModelId FROM model_list WHERE Maker IN (SELECT Id FROM car_makers WHERE Maker = 'Ford Motor Company'))
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T3 ON T1.Id = T3.Maker JOIN car_names AS T2 ON T3.Model = T2.Model GROUP BY T1.Id, T1.Maker HAVING COUNT(DISTINCT T3.Model) >= 2 AND COUNT(T2.Model) > 3
SELECT T1.Id, T1.Maker FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.MakeId JOIN cars_data AS T4 ON T3.MakeId = T4.Id GROUP BY T1.Id, T1.Maker HAVING COUNT(DISTINCT T2.ModelId) >= 2 AND COUNT(DISTINCT T4.Id) > 3
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (SELECT Country FROM car_makers WHERE Id IN (SELECT Maker FROM model_list WHERE Model = 'fiat')) OR CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 3)
SELECT CountryId, CountryName FROM countries WHERE CountryId IN (SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 3) OR CountryId IN (SELECT Country FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker JOIN car_names ON model_list.Model = car_names.Model WHERE car_names.Model = 'Fiat')
SELECT Country FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'JetBlue Airways'
SELECT Abbreviation FROM airlines WHERE Airline = 'Jetblue Airways'
SELECT DISTINCT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airlines
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM airports
SELECT COUNT(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT COUNT(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT DISTINCT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports AS source ON flights.SourceAirport = source.AirportCode JOIN airports AS dest ON flights.DestAirport = dest.AirportCode WHERE source.City = 'Aberdeen' AND dest.City = 'Ashley'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'Jetblue Airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.AirportCode = 'ASY'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.AirportCode = 'ASY'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines' AND flights.SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.AirportCode = 'AHD'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.Airline = airlines.uid JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airlines.Airline = 'United Airlines' AND airports.City = 'Aberdeen'
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY City HAVING COUNT(*) = (SELECT MAX(CountFlights) FROM (SELECT COUNT(*) AS CountFlights FROM airports JOIN flights ON airports.AirportCode = flights.DestAirport GROUP BY City) AS SubQuery)
SELECT T1.City FROM airports AS T1 JOIN (SELECT DestAirport, COUNT(*) AS frequency FROM flights GROUP BY DestAirport) AS T2 ON T1.AirportCode = T2.DestAirport ORDER BY T2.frequency DESC LIMIT 1
SELECT T1.City FROM airports AS T1 JOIN flights AS T2 ON T1.AirportCode = T2.SourceAirport GROUP BY T1.City ORDER BY COUNT(*) DESC LIMIT 1
SELECT City FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City HAVING COUNT(*) = (SELECT MAX(frequency) FROM (SELECT COUNT(*) AS frequency FROM airports JOIN flights ON airports.AirportCode = flights.SourceAirport GROUP BY City) AS subquery)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS Result WHERE TotalFlights = (SELECT MAX(TotalFlights) FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS MaxResult)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS Result WHERE TotalFlights = (SELECT MAX(TotalFlights) FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS MaxFlights)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS FlightCounts WHERE TotalFlights = (SELECT MIN(TotalFlights) FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS MinFlights)
SELECT AirportCode FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS Result WHERE TotalFlights = (SELECT MIN(TotalFlights) FROM (SELECT AirportCode, COUNT(*) AS TotalFlights FROM (SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights) AS Combined GROUP BY AirportCode) AS MinFlights)
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) = (SELECT MAX(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS SubQuery)
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM flights GROUP BY Airline) AS SubQuery)
SELECT T1.Abbreviation, T1.Country FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.uid, T1.Abbreviation, T1.Country HAVING COUNT(*) = (SELECT MIN(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS SubQuery)
SELECT A.Abbreviation, A.Country FROM airlines A JOIN flights F ON A.uid = F.Airline GROUP BY A.uid, A.Abbreviation, A.Country HAVING COUNT(F.FlightNo) = (SELECT MIN(FlightCount) FROM (SELECT COUNT(*) AS FlightCount FROM flights GROUP BY Airline) AS SubQuery)
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.SourceAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT DISTINCT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline WHERE T2.DestAirport = 'AHD'
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG') INTERSECT SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG') INTERSECT SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT Airline FROM airlines WHERE uid IN (SELECT Airline FROM flights WHERE SourceAirport = 'CVO') AND uid NOT IN (SELECT Airline FROM flights WHERE SourceAirport = 'APG')
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) >= 10
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200
SELECT T1.Airline FROM airlines AS T1 JOIN flights AS T2 ON T1.uid = T2.Airline GROUP BY T1.Airline HAVING COUNT(*) < 200
SELECT DISTINCT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = 'United Airlines'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE SourceAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT DISTINCT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen'
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE City = 'Aberdeen'
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen' OR airports.City = 'Abilene'
SELECT COUNT(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.AirportName = 'Aberdeen' OR airports.AirportName = 'Abilene'
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT AirportCode FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights UNION SELECT DestAirport FROM flights)
SELECT COUNT(*) FROM employee
SELECT COUNT(*) FROM employee
SELECT Name FROM employee ORDER BY Age, Employee_ID
SELECT Name FROM employee ORDER BY Age, Name
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City, COUNT(Employee_ID) FROM employee GROUP BY City
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location
SELECT Location, COUNT(Shop_ID) FROM shop GROUP BY Location
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT max(Number_products) FROM shop)
SELECT Manager_name, District FROM shop WHERE Number_products = (SELECT max(Number_products) FROM shop)
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT MIN(Number_products), MAX(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC, Shop_ID ASC
SELECT Name FROM shop WHERE Number_products > (SELECT avg(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation GROUP BY Employee_ID HAVING COUNT(*) = (SELECT MAX(awards_count) FROM (SELECT COUNT(*) AS awards_count FROM evaluation GROUP BY Employee_ID) AS subquery))
SELECT E.Name FROM employee E JOIN (SELECT Employee_ID, COUNT(*) AS AwardsCount FROM evaluation GROUP BY Employee_ID) AS A ON E.Employee_ID = A.Employee_ID WHERE A.AwardsCount = (SELECT MAX(AwardsCount) FROM (SELECT COUNT(*) AS AwardsCount FROM evaluation GROUP BY Employee_ID) AS Sub)
SELECT Name FROM employee WHERE Employee_ID IN (SELECT Employee_ID FROM evaluation WHERE Bonus = (SELECT max(Bonus) FROM evaluation))
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name, Employee_ID FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM shop WHERE Shop_ID IN (SELECT Shop_ID FROM hiring GROUP BY Shop_ID HAVING COUNT(Employee_ID) = (SELECT MAX(num_employees) FROM (SELECT COUNT(Employee_ID) AS num_employees FROM hiring GROUP BY Shop_ID) AS subquery))
SELECT T1.Name FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name ORDER BY COUNT(T2.Employee_ID) DESC LIMIT 1
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT T1.Name, COUNT(T2.Employee_ID) FROM shop AS T1 JOIN hiring AS T2 ON T1.Shop_ID = T2.Shop_ID GROUP BY T1.Name
SELECT S.Name, COUNT(H.Employee_ID) FROM shop S LEFT JOIN hiring H ON S.Shop_ID = H.Shop_ID GROUP BY S.Name
SELECT SUM(Bonus) FROM evaluation
SELECT SUM(Bonus) FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT District FROM shop WHERE District IN (SELECT District FROM shop WHERE Number_products < 3000) AND District IN (SELECT District FROM shop WHERE Number_products > 10000)
SELECT District FROM shop WHERE District IN (SELECT District FROM shop WHERE Number_products < 3000) AND District IN (SELECT District FROM shop WHERE Number_products > 10000)
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(DISTINCT Location) FROM shop
SELECT COUNT(*) FROM Documents
SELECT COUNT(*) FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_ID, Document_Name, Document_Description FROM Documents
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID JOIN Ref_Template_Types AS RTT ON T.Template_Type_Code = RTT.Template_Type_Code WHERE RTT.Template_Type_Description = 'PPT'
SELECT T1.Template_ID, COUNT(T2.Document_ID) FROM Templates AS T1 LEFT JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID
SELECT Template_ID, COUNT(*) FROM Documents GROUP BY Template_ID
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID, T1.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Documents GROUP BY Template_ID) AS subquery)
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 WHERE T1.Template_ID IN (SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) = (SELECT MAX(doc_count) FROM (SELECT COUNT(*) AS doc_count FROM Documents GROUP BY Template_ID) AS subquery))
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT T1.Template_ID FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID HAVING COUNT(DISTINCT T2.Document_ID) > 1
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents)
SELECT COUNT(*) FROM Templates
SELECT COUNT(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT COUNT(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT COUNT(*) FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT T1.Template_Type_Code, COUNT(T2.Template_ID) FROM Ref_Template_Types AS T1 JOIN Templates AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code, COUNT(T1.Template_ID) FROM Templates AS T1 GROUP BY T1.Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Templates GROUP BY Template_Type_Code) AS counts)
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) = (SELECT MAX(template_count) FROM (SELECT COUNT(*) AS template_count FROM Templates GROUP BY Template_Type_Code) AS subquery)
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(Template_ID) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code, MIN(Version_Number) FROM Templates GROUP BY Template_Type_Code
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = 'Data base'
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base'
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'
SELECT T1.Document_Name FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Template_Type_Code = 'BK'
SELECT T1.Template_Type_Code, COUNT(T2.Document_ID) FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code, COUNT(T2.Document_ID) FROM Ref_Template_Types AS T1 JOIN Templates AS T3 ON T1.Template_Type_Code = T3.Template_Type_Code JOIN Documents AS T2 ON T3.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(num_docs) FROM (SELECT COUNT(*) AS num_docs FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_Type_Code) AS subquery)
SELECT T2.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code HAVING COUNT(*) = (SELECT MAX(usage_count) FROM (SELECT COUNT(*) AS usage_count FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T2.Template_Type_Code) AS subquery)
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates WHERE Template_ID IN (SELECT Template_ID FROM Documents))
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT DISTINCT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT DISTINCT T3.Template_Type_Description FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID JOIN Ref_Template_Types AS T3 ON T2.Template_Type_Code = T3.Template_Type_Code
SELECT DISTINCT T1.Template_Details FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID
SELECT T1.Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT Template_ID FROM Templates WHERE Template_Details LIKE '%Presentation%'
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT COUNT(*) FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Summer Show'
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT * FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT T1.Paragraph_ID, T1.Paragraph_Text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Welcome to NY'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Customer reviews'
SELECT T1.Document_ID, COUNT(T2.Paragraph_ID) AS NumberOfParagraphs FROM Documents AS T1 LEFT JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY T1.Document_ID
SELECT T1.Document_ID, COUNT(T2.Paragraph_ID) AS NumberOfParagraphs FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID ORDER BY T1.Document_ID
SELECT Documents.Document_ID, Documents.Document_Name, COUNT(Paragraphs.Paragraph_ID) AS NumberOfParagraphs FROM Documents JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID, Documents.Document_Name
SELECT T1.Document_ID, T1.Document_Name, COUNT(T2.Paragraph_ID) FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID GROUP BY T1.Document_ID, T1.Document_Name
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT D.Document_ID, D.Document_Name FROM Documents D JOIN (SELECT Document_ID, COUNT(*) AS ParagraphCount FROM Paragraphs GROUP BY Document_ID) P ON D.Document_ID = P.Document_ID WHERE P.ParagraphCount = (SELECT MAX(ParagraphCount) FROM (SELECT COUNT(*) AS ParagraphCount FROM Paragraphs GROUP BY Document_ID) T)
SELECT D.Document_ID, D.Document_Name FROM Documents D WHERE D.Document_ID IN (SELECT P.Document_ID FROM Paragraphs P GROUP BY P.Document_ID HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Paragraphs GROUP BY Document_ID) AS SubQuery))
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) = (SELECT MIN(counts) FROM (SELECT COUNT(*) AS counts FROM Paragraphs GROUP BY Document_ID) AS subquery)
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Paragraphs GROUP BY Document_ID) AS subquery)
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(Paragraph_ID) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland'
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Brazil%' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text LIKE '%Ireland%'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age, Teacher_ID
SELECT Name FROM teacher ORDER BY Age, Teacher_ID
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT DISTINCT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Age IN (32, 33)
SELECT Name FROM teacher WHERE Age IN (32, 33)
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown FROM teacher WHERE Age = (SELECT min(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(Teacher_ID) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) = (SELECT MAX(frequency) FROM (SELECT COUNT(*) AS frequency FROM teacher GROUP BY Hometown) AS subquery)
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) > 1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T1.Name, T2.Course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.Teacher_ID = T3.Teacher_ID JOIN course AS T2 ON T3.Course_ID = T2.Course_ID
SELECT T1.Name, T2.Course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.Teacher_ID = T3.Teacher_ID JOIN course AS T2 ON T3.Course_ID = T2.Course_ID
SELECT T1.Name, T2.Course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.Teacher_ID = T3.Teacher_ID JOIN course AS T2 ON T3.Course_ID = T2.Course_ID ORDER BY T1.Name ASC, T2.Course ASC
SELECT T1.Name, T2.Course FROM teacher AS T1 JOIN course_arrange AS T3 ON T1.Teacher_ID = T3.Teacher_ID JOIN course AS T2 ON T3.Course_ID = T2.Course_ID ORDER BY T1.Name ASC, T2.Course ASC
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID WHERE T3.Course = 'math'
SELECT DISTINCT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID JOIN course AS T3 ON T2.Course_ID = T3.Course_ID WHERE T3.Course = 'math'
SELECT T1.Name, COUNT(T2.Course_ID) FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name
SELECT T1.Name, COUNT(T2.Course_ID) FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Name
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(DISTINCT T2.Course_ID) >= 2
SELECT T1.Name FROM teacher AS T1 JOIN course_arrange AS T2 ON T1.Teacher_ID = T2.Teacher_ID GROUP BY T1.Teacher_ID HAVING COUNT(DISTINCT T2.Course_ID) >= 2
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT AVG(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC
SELECT Museum_ID, Name FROM museum WHERE Num_of_Staff = (SELECT max(Num_of_Staff) FROM museum)
SELECT AVG(Num_of_Staff) FROM museum WHERE Open_Year < 2009
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = 'Plaza Museum'
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT min(Num_of_Staff) FROM museum WHERE Open_Year > 2010)
SELECT ID, Name, Age FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit GROUP BY visitor_ID HAVING COUNT(*) > 1)
SELECT T1.ID, T1.Name, T1.Level_of_membership FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID GROUP BY T1.ID, T1.Name, T1.Level_of_membership HAVING SUM(T2.Total_spent) = (SELECT MAX(total_spent) FROM (SELECT SUM(Total_spent) AS total_spent FROM visit GROUP BY visitor_ID) AS subquery)
SELECT T1.Museum_ID, T1.Name FROM museum AS T1 JOIN (SELECT Museum_ID, COUNT(*) AS visit_count FROM visit GROUP BY Museum_ID ORDER BY visit_count DESC LIMIT 1) AS T2 ON T1.Museum_ID = T2.Museum_ID
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT Name, Age FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit WHERE Num_of_Ticket = (SELECT max(Num_of_Ticket) FROM visit))
SELECT AVG(Num_of_Ticket), MAX(Num_of_Ticket) FROM visit
SELECT SUM(T1.Total_spent) FROM visit AS T1 JOIN visitor AS T2 ON T1.visitor_ID = T2.ID WHERE T2.Level_of_membership = 1
SELECT Name FROM visitor WHERE ID IN (SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE museum.Open_Year < 2009) AND ID IN (SELECT visitor_ID FROM visit JOIN museum ON visit.Museum_ID = museum.Museum_ID WHERE museum.Open_Year > 2011)
SELECT COUNT(DISTINCT visitor.ID) FROM visitor WHERE visitor.ID NOT IN (SELECT visitor_ID FROM visit WHERE Museum_ID IN (SELECT Museum_ID FROM museum WHERE Open_Year > 2010))
SELECT COUNT(*) FROM museum WHERE Open_Year > 2013 OR Open_Year < 2008
SELECT COUNT(DISTINCT player_id) FROM players
SELECT COUNT(*) FROM players
SELECT COUNT(*) FROM matches
SELECT COUNT(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches
SELECT AVG(winner_rank) FROM matches
SELECT AVG(T1.ranking) FROM rankings AS T1 JOIN matches AS T2 ON T1.player_id = T2.winner_id
SELECT MIN(loser_rank) FROM matches
SELECT MIN(T1.ranking) FROM rankings AS T1 JOIN matches AS T2 ON T1.player_id = T2.loser_id
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) INTERSECT SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) AND player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT country_code, first_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships') AND player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open')
SELECT first_name, country_code FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships' INTERSECT SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open')
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT min(birth_date) FROM players)
SELECT first_name, last_name FROM players ORDER BY birth_date, last_name, player_id
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date, player_id
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name, country_code FROM players WHERE player_id IN (SELECT player_id FROM rankings ORDER BY tours DESC LIMIT 1)
SELECT first_name, country_code FROM players WHERE player_id IN (SELECT player_id FROM rankings ORDER BY tours DESC LIMIT 1)
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC, year ASC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY count(*) DESC, year ASC LIMIT 1
SELECT P.first_name, P.last_name, SUM(R.ranking_points) FROM players P JOIN matches M ON P.player_id = M.winner_id JOIN rankings R ON P.player_id = R.player_id GROUP BY P.player_id HAVING COUNT(M.winner_id) = (SELECT COUNT(*) FROM matches GROUP BY winner_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT P.first_name, P.last_name, SUM(R.ranking_points) FROM players P JOIN matches M ON P.player_id = M.winner_id JOIN rankings R ON P.player_id = R.player_id GROUP BY P.player_id ORDER BY COUNT(M.winner_id) DESC LIMIT 1
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1)
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'Australian Open' AND winner_id IN (SELECT player_id FROM rankings ORDER BY ranking_points DESC LIMIT 1))
SELECT P1.first_name AS winner_first_name, P1.last_name AS winner_last_name, P2.first_name AS loser_first_name, P2.last_name AS loser_last_name FROM matches JOIN players AS P1 ON matches.winner_id = P1.player_id JOIN players AS P2 ON matches.loser_id = P2.player_id WHERE matches.minutes = (SELECT max(minutes) FROM matches)
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT T1.first_name, T1.player_id, AVG(T2.ranking) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id, T1.first_name
SELECT T1.first_name, T1.player_id, COALESCE(AVG(T2.ranking_points), 0) FROM players AS T1 LEFT JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT T1.first_name, T1.player_id, SUM(T2.ranking_points) FROM players AS T1 JOIN rankings AS T2 ON T1.player_id = T2.player_id GROUP BY T1.player_id
SELECT T1.first_name, COALESCE(T2.ranking_points, 0) AS total_ranking_points FROM players AS T1 LEFT JOIN rankings AS T2 ON T1.player_id = T2.player_id
SELECT country_code, COUNT(player_id) AS number_of_players FROM players GROUP BY country_code
SELECT country_code, COUNT(*) FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code HAVING count(*) = (SELECT max(player_count) FROM (SELECT count(*) AS player_count FROM players GROUP BY country_code) AS counts)
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM players GROUP BY country_code) AS subquery)
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT year, COUNT(*) FROM matches GROUP BY year
SELECT P.first_name, P.last_name, R.ranking FROM players P JOIN rankings R ON P.player_id = R.player_id WHERE P.player_id IN (SELECT player_id FROM players ORDER BY birth_date DESC LIMIT 3)
SELECT P.first_name, P.last_name, R.ranking FROM players P JOIN matches M ON P.player_id = M.winner_id JOIN rankings R ON P.player_id = R.player_id ORDER BY P.birth_date DESC LIMIT 3
SELECT COUNT(DISTINCT T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T1.tourney_name = 'WTA Championships' AND T2.hand = 'L'
SELECT count(DISTINCT T1.winner_id) FROM matches AS T1 JOIN players AS T2 ON T1.winner_id = T2.player_id WHERE T2.hand = 'left' AND T1.tourney_name = 'WTA Championships'
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches JOIN rankings ON matches.winner_id = rankings.player_id ORDER BY ranking_points DESC LIMIT 1)
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT player_id FROM rankings ORDER BY ranking_points DESC LIMIT 1)
SELECT hand, COUNT(player_id) FROM players GROUP BY hand
SELECT hand, COUNT(*) FROM players GROUP BY hand
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage
SELECT name, date, result FROM battle
SELECT MAX(killed), MIN(killed) FROM death
SELECT AVG(injured) FROM death
SELECT T1.killed, T1.injured FROM death AS T1 JOIN ship AS T2 ON T1.caused_by_ship_id = T2.id WHERE T2.tonnage = 't'
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.ship_type = 'Brig'
SELECT T1.id, T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle JOIN death AS T3 ON T2.id = T3.caused_by_ship_id GROUP BY T1.id, T1.name HAVING SUM(T3.killed) > 10
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id, T1.name HAVING SUM(T2.injured) = (SELECT MAX(total_injuries) FROM (SELECT SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id) AS subquery)
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = 225)
SELECT b.name, b.date FROM battle b JOIN ship s ON b.id = s.lost_in_battle WHERE s.name IN ('Lettice', 'HMS Atalanta') GROUP BY b.id HAVING COUNT(DISTINCT s.name) = 2
SELECT T1.name, T1.result, T1.bulgarian_commander FROM battle AS T1 JOIN ship AS T2 ON T1.id = T2.lost_in_battle WHERE T2.location = 'English Channel' AND T2.disposition_of_ship IS NULL
SELECT note FROM death WHERE note LIKE '%East%'
SELECT line_1, line_2 FROM Addresses
SELECT line_1, line_2 FROM Addresses
SELECT COUNT(*) FROM Courses
SELECT COUNT(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = 'math'
SELECT course_description FROM Courses WHERE course_name LIKE '%math%'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM Addresses WHERE city = 'Port Chelsea'
SELECT D.department_id, D.department_name FROM Departments D JOIN Degree_Programs DP ON D.department_id = DP.department_id GROUP BY D.department_id, D.department_name HAVING COUNT(DP.degree_program_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(degree_program_id) AS Cnt FROM Degree_Programs GROUP BY department_id) AS Sub)
SELECT D.department_id, D.department_name FROM Departments D JOIN Degree_Programs DP ON D.department_id = DP.department_id GROUP BY D.department_id, D.department_name HAVING COUNT(*) = (SELECT MAX(degree_count) FROM (SELECT COUNT(*) AS degree_count FROM Degree_Programs GROUP BY department_id) AS subquery)
SELECT COUNT(DISTINCT T1.department_id) FROM Departments AS T1 JOIN Degree_Programs AS T2 ON T1.department_id = T2.department_id
SELECT COUNT(DISTINCT department_id) FROM Departments JOIN Degree_Programs ON Departments.department_id = Degree_Programs.department_id
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(*) FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'Engineering'
SELECT COUNT(*) FROM Degree_Programs JOIN Departments ON Degree_Programs.department_id = Departments.department_id WHERE Departments.department_name = 'Engineering'
SELECT section_name, section_description FROM Sections
SELECT section_name, section_description FROM Sections
SELECT T1.course_id, T1.course_name FROM Courses AS T1 JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id HAVING COUNT(T2.section_id) <= 2
SELECT T1.course_id, T1.course_name FROM Courses AS T1 LEFT JOIN Sections AS T2 ON T1.course_id = T2.course_id GROUP BY T1.course_id, T1.course_name HAVING COUNT(T2.section_id) < 2
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT T1.semester_id, T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id, T1.semester_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.semester_id, T1.semester_name FROM Semesters AS T1 JOIN Student_Enrolment AS T2 ON T1.semester_id = T2.semester_id GROUP BY T1.semester_id, T1.semester_name HAVING COUNT(T2.student_id) = (SELECT MAX(count) FROM (SELECT COUNT(T3.student_id) AS count FROM Student_Enrolment AS T3 GROUP BY T3.semester_id) AS T4)
SELECT department_description FROM Departments WHERE department_name LIKE '%the computer%'
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT S.first_name, S.middle_name, S.last_name, S.student_id FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY SE.student_id, SE.semester_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2
SELECT S.student_id, S.first_name, S.middle_name, S.last_name FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY SE.student_id, SE.semester_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelor'
SELECT T1.first_name, T1.middle_name, T1.last_name FROM Students AS T1 JOIN Student_Enrolment AS T2 ON T1.student_id = T2.student_id JOIN Degree_Programs AS T3 ON T2.degree_program_id = T3.degree_program_id WHERE T3.degree_summary_name = 'Bachelors'
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_summary_name ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT T1.degree_summary_name FROM Degree_Programs AS T1 JOIN (SELECT degree_program_id, COUNT(student_id) AS num_students FROM Student_Enrolment GROUP BY degree_program_id) AS T2 ON T1.degree_program_id = T2.degree_program_id WHERE T2.num_students = (SELECT MAX(num_students) FROM (SELECT COUNT(student_id) AS num_students FROM Student_Enrolment GROUP BY degree_program_id) AS T3)
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 JOIN Student_Enrolment AS T2 ON T1.degree_program_id = T2.degree_program_id GROUP BY T1.degree_program_id, T1.degree_summary_name ORDER BY COUNT(T2.student_enrolment_id) DESC LIMIT 1
SELECT T1.degree_program_id, T1.degree_summary_name FROM Degree_Programs AS T1 WHERE T1.degree_program_id IN (SELECT degree_program_id FROM Student_Enrolment GROUP BY degree_program_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, COUNT(E.student_id) AS num_enrollments FROM Students S JOIN Student_Enrolment E ON S.student_id = E.student_id GROUP BY S.student_id HAVING COUNT(E.student_id) = (SELECT MAX(enrollment_count) FROM (SELECT student_id, COUNT(*) AS enrollment_count FROM Student_Enrolment GROUP BY student_id) AS subquery)
SELECT S.first_name, S.middle_name, S.last_name, S.student_id, COUNT(*) AS num_enrollments FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id GROUP BY S.student_id ORDER BY num_enrollments DESC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT semester_id FROM Student_Enrolment)
SELECT semester_name FROM Semesters WHERE semester_id NOT IN (SELECT DISTINCT semester_id FROM Student_Enrolment)
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT DISTINCT T1.course_name FROM Courses AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.course_id = T2.course_id
SELECT T1.course_name FROM Courses AS T1 JOIN (SELECT course_id, COUNT(*) AS enrollment_count FROM Student_Enrolment_Courses GROUP BY course_id) AS T2 ON T1.course_id = T2.course_id WHERE T2.enrollment_count = (SELECT MAX(enrollment_count) FROM (SELECT course_id, COUNT(*) AS enrollment_count FROM Student_Enrolment_Courses GROUP BY course_id) AS T3)
SELECT T1.course_name FROM Courses AS T1 JOIN (SELECT course_id, COUNT(*) AS student_count FROM Student_Enrolment_Courses GROUP BY course_id) AS T2 ON T1.course_id = T2.course_id WHERE T2.student_count = (SELECT MAX(student_count) FROM (SELECT course_id, COUNT(*) AS student_count FROM Student_Enrolment_Courses GROUP BY course_id) AS T3)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT last_name FROM Students WHERE current_address_id IN (SELECT address_id FROM Addresses WHERE state_province_county = 'North Carolina') AND student_id NOT IN (SELECT student_id FROM Student_Enrolment)
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN Transcript_Contents AS T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id HAVING COUNT(T2.student_course_id) >= 2
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left, student_id LIMIT 1
SELECT first_name, middle_name, last_name FROM Students WHERE student_id = (SELECT student_id FROM Student_Enrolment WHERE student_enrolment_id IN (SELECT student_enrolment_id FROM Student_Enrolment_Courses WHERE student_course_id IN (SELECT student_course_id FROM Transcript_Contents WHERE transcript_id IN (SELECT transcript_id FROM Transcripts ORDER BY transcript_date ASC, student_id ASC LIMIT 1))))
SELECT first_name FROM Students WHERE permanent_address_id != current_address_id
SELECT first_name FROM Students WHERE permanent_address_id != current_address_id
SELECT T1.address_id, T1.line_1, T1.line_2, T1.line_3 FROM Addresses AS T1 JOIN Students AS T2 ON T1.address_id = T2.current_address_id GROUP BY T1.address_id ORDER BY COUNT(T2.student_id) DESC LIMIT 1
SELECT A.address_id, A.line_1, A.line_2 FROM Addresses A WHERE A.address_id = (SELECT address_id FROM (SELECT current_address_id AS address_id FROM Students UNION ALL SELECT permanent_address_id FROM Students) AS combined GROUP BY address_id ORDER BY COUNT(*) DESC, address_id ASC LIMIT 1)
SELECT AVG(EXTRACT(YEAR FROM transcript_date)) FROM Transcripts
SELECT AVG(transcript_date) FROM Transcripts
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date LIMIT 1
SELECT * FROM Transcripts WHERE transcript_date = (SELECT min(transcript_date) FROM Transcripts)
SELECT COUNT(*) FROM Transcripts
SELECT COUNT(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(*) AS count FROM Transcript_Contents GROUP BY student_course_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT student_course_id, COUNT(*) AS count FROM Transcript_Contents GROUP BY student_course_id) AS counts)
SELECT T1.student_course_id, T2.student_enrolment_id FROM Transcript_Contents AS T1 JOIN Student_Enrolment_Courses AS T2 ON T1.student_course_id = T2.student_course_id GROUP BY T1.student_course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts T1 LEFT JOIN Transcript_Contents T2 ON T1.transcript_id = T2.transcript_id GROUP BY T1.transcript_id, T1.transcript_date ORDER BY COUNT(T2.student_course_id) ASC, T1.transcript_id ASC LIMIT 1
SELECT T1.transcript_id, T1.transcript_date FROM Transcripts AS T1 JOIN (SELECT transcript_id, COUNT(*) AS cnt FROM Transcript_Contents GROUP BY transcript_id) AS T2 ON T1.transcript_id = T2.transcript_id ORDER BY T2.cnt ASC LIMIT 1
SELECT semester_name FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Master')) INTERSECT SELECT semester_name FROM Semesters WHERE semester_id IN (SELECT semester_id FROM Student_Enrolment WHERE degree_program_id IN (SELECT degree_program_id FROM Degree_Programs WHERE degree_summary_name = 'Bachelor'))
SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Masters' INTERSECT SELECT semester_id FROM Student_Enrolment JOIN Degree_Programs ON Student_Enrolment.degree_program_id = Degree_Programs.degree_program_id WHERE Degree_Programs.degree_summary_name = 'Bachelors'
SELECT COUNT(DISTINCT current_address_id) FROM Students
SELECT DISTINCT address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country FROM Addresses WHERE address_id IN (SELECT current_address_id FROM Students UNION SELECT permanent_address_id FROM Students)
SELECT * FROM Students ORDER BY last_name DESC
SELECT other_student_details FROM Students ORDER BY last_name DESC
SELECT section_description FROM Sections WHERE section_name = 'H'
SELECT section_description FROM Sections WHERE section_name = 'h'
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582'
SELECT first_name FROM Students JOIN Addresses ON Students.permanent_address_id = Addresses.address_id WHERE Addresses.country = 'Haiti' OR Students.cell_mobile_number = '09700166582'
SELECT Title FROM Cartoon ORDER BY Title
SELECT Title FROM Cartoon ORDER BY Title
SELECT * FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr'
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date, id ASC
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Title FROM Cartoon WHERE Directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT Country, COUNT(id) FROM TV_Channel GROUP BY Country ORDER BY COUNT(id) DESC LIMIT 1
SELECT Country, COUNT(id) AS ChannelCount FROM TV_Channel GROUP BY Country ORDER BY ChannelCount DESC LIMIT 1
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT COUNT(DISTINCT series_name), COUNT(DISTINCT Content) FROM TV_Channel
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Content FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1
SELECT Language, COUNT(id) AS num_channels FROM TV_Channel GROUP BY Language HAVING COUNT(id) = (SELECT MIN(num_channels) FROM (SELECT COUNT(id) AS num_channels FROM TV_Channel GROUP BY Language) AS subquery)
SELECT Language, COUNT(DISTINCT id) FROM TV_Channel GROUP BY Language
SELECT Language, COUNT(id) FROM TV_Channel GROUP BY Language
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle!'
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = 'The Rise of the Blue Beetle'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT T1.Title FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT Episode FROM TV_series ORDER BY Rating, id
SELECT Episode FROM TV_series ORDER BY Rating DESC, id ASC
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC, Episode ASC LIMIT 3
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3
SELECT MIN(Share), MAX(Share) FROM TV_series
SELECT MAX(Share), MIN(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Air_Date FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T2.series_name FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = 'Sky Radio'
SELECT Directed_by, COUNT(id) FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(id) FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon WHERE Original_air_date = (SELECT max(Original_air_date) FROM Cartoon)
SELECT T1.Production_code, T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id ORDER BY T1.Original_air_date DESC LIMIT 1
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'High definition TV'
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey'
SELECT DISTINCT T2.Country FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Written_by = 'Todd Casey'
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT DISTINCT Country FROM TV_Channel WHERE Country NOT IN (SELECT DISTINCT Country FROM TV_Channel JOIN Cartoon ON TV_Channel.id = Cartoon.Channel WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ('Ben Jones', 'Michael Chang')
SELECT series_name, Country FROM TV_Channel WHERE id IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Michael Chang')
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel WHERE Country IN (SELECT Country FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2)
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings, Poker_Player_ID FROM poker_player ORDER BY Earnings DESC, Poker_Player_ID ASC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT AVG(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player WHERE Earnings = (SELECT max(Earnings) FROM poker_player)
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT MAX(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Earnings > 300000
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC, T2.Earnings DESC, T2.Poker_Player_ID ASC
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Final_Table_Made ASC, T1.Name ASC, T2.Poker_Player_ID ASC
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings = (SELECT min(Earnings) FROM poker_player))
SELECT Birth_Date FROM people WHERE People_ID IN (SELECT People_ID FROM poker_player WHERE Earnings = (SELECT min(Earnings) FROM poker_player))
SELECT Money_Rank FROM poker_player WHERE People_ID IN (SELECT People_ID FROM people WHERE Height = (SELECT max(Height) FROM people))
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1
SELECT AVG(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT AVG(T1.Earnings) FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID WHERE T2.Height > 200
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC, T1.Name
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Earnings DESC, T1.Name ASC, T2.Poker_Player_ID ASC
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM people GROUP BY Nationality
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) > 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(People_ID) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC, People_ID ASC
SELECT Name, Birth_Date FROM people ORDER BY Name, People_ID
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT MAX(area_code), MIN(area_code) FROM AREA_CODE_STATE
SELECT MAX(created) FROM VOTES WHERE state = 'CA'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number HAVING COUNT(T2.vote_id) >= 2
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number, T1.contestant_name ORDER BY COUNT(T2.vote_id) ASC LIMIT 1
SELECT COUNT(*) FROM VOTES WHERE state = 'NY' OR state = 'CA'
SELECT COUNT(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT DISTINCT contestant_number FROM VOTES)
SELECT area_code FROM AREA_CODE_STATE WHERE state IN (SELECT state FROM VOTES GROUP BY state HAVING count(*) = (SELECT max(vote_count) FROM (SELECT count(*) AS vote_count FROM VOTES GROUP BY state) AS subquery))
SELECT V.created, V.state, V.phone_number FROM VOTES V JOIN CONTESTANTS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling'
SELECT area_code FROM VOTES JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number WHERE contestant_name = 'Tabatha Gehling' INTERSECT SELECT area_code FROM VOTES JOIN CONTESTANTS ON VOTES.contestant_number = CONTESTANTS.contestant_number WHERE contestant_name = 'Kelly Clauss'
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE '%Al%'
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%Republic%'
SELECT COUNT(*) FROM country WHERE GovernmentForm LIKE '%republic%'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT SUM(SurfaceArea) FROM country WHERE Region = 'Caribbean'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT Continent FROM country WHERE Name = 'Anguilla'
SELECT T2.Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'
SELECT T2.Region FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE T1.Name = 'Kabul'
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' AND Percentage = (SELECT max(Percentage) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba')
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba' AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT Region, Population FROM country WHERE Name = 'Angola'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa'
SELECT Name FROM country WHERE Continent = 'Asia' AND LifeExpectancy = (SELECT MIN(LifeExpectancy) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'
SELECT SUM(Population), MAX(GNP) FROM country WHERE Continent = 'Asia'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT AVG(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(SurfaceArea) FROM country WHERE Continent IN ('Asia', 'Europe')
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm = 'US territory'
SELECT AVG(GNP), SUM(Population) FROM country WHERE GovernmentForm LIKE '%US territory%'
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'
SELECT COUNT(Language) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Aruba'
SELECT COUNT(*) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Afghanistan' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(*) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Name = 'Afghanistan' AND countrylanguage.IsOfficial = 'T'
SELECT Name FROM country WHERE Code = (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage GROUP BY CountryCode HAVING COUNT(*) = (SELECT MAX(num_languages) FROM (SELECT COUNT(*) AS num_languages FROM countrylanguage GROUP BY CountryCode)))
SELECT Continent FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent HAVING COUNT(DISTINCT Language) = (SELECT MAX(LanguageCount) FROM (SELECT COUNT(DISTINCT Language) AS LanguageCount FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent))
SELECT Continent FROM (SELECT Continent, COUNT(DISTINCT Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent) AS ContinentLanguageCounts WHERE NumLanguages = (SELECT MAX(NumLanguages) FROM (SELECT COUNT(DISTINCT Language) AS NumLanguages FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode GROUP BY Continent) AS MaxLanguages)
SELECT COUNT(*) FROM (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch')
SELECT COUNT(DISTINCT CountryCode) FROM countrylanguage WHERE Language IN ('English', 'Dutch') GROUP BY CountryCode HAVING COUNT(DISTINCT Language) = 2
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') INTERSECT SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T') AND Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT Name FROM country WHERE Code IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'French' AND IsOfficial = 'T')
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese'
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'English' OR T2.Language = 'Dutch'
SELECT DISTINCT T1.Region FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Dutch' OR T2.Language = 'English'
SELECT DISTINCT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE (T2.Language = 'English' OR T2.Language = 'Dutch') AND T2.IsOfficial = 'T'
SELECT DISTINCT T1.Name FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language IN ('English', 'Dutch') AND T2.IsOfficial = 'T'
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' AND Percentage = (SELECT max(Percentage) FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia')
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language HAVING COUNT(*) = (SELECT MAX(NumCountries) FROM (SELECT COUNT(*) AS NumCountries FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language) AS SubQuery)
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE GovernmentForm LIKE '%Republic%' GROUP BY Language HAVING COUNT(DISTINCT country.Code) = 1
SELECT Language FROM countrylanguage WHERE CountryCode IN (SELECT Code FROM country WHERE GovernmentForm LIKE '%Republic%') GROUP BY Language HAVING COUNT(*) = 1
SELECT Name, Population FROM city WHERE ID IN (SELECT city.ID FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English') ORDER BY Population DESC LIMIT 1
SELECT Name, Population FROM city WHERE ID IN (SELECT city_id FROM countrylanguage WHERE Language = 'English') ORDER BY Population DESC LIMIT 1
SELECT Name, Population, LifeExpectancy FROM country WHERE SurfaceArea = (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Asia') AND Continent = 'Asia'
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' AND SurfaceArea = (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Asia')
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'F')
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT SUM(Population) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'
SELECT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.HeadOfState = 'Beatrix' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(DISTINCT Language) FROM countrylanguage WHERE IsOfficial = 'T' AND CountryCode IN (SELECT Code FROM country WHERE IndepYear < 1930)
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE SurfaceArea > (SELECT max(SurfaceArea) FROM country WHERE Continent = 'Europe')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT min(Population) FROM country WHERE Continent = 'Asia')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > (SELECT max(Population) FROM country WHERE Continent = 'Africa')
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > ALL (SELECT Population FROM country WHERE Continent = 'Africa')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE GovernmentForm != 'Republic' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Code FROM country WHERE GovernmentForm NOT LIKE '%Republic%' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English')
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe' AND Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T'))
SELECT Name FROM city WHERE CountryCode IN (SELECT Code FROM country WHERE Continent = 'Europe') AND CountryCode NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English' AND IsOfficial = 'T')
SELECT DISTINCT T1.Name, T1.Population FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT DISTINCT T1.Name FROM city AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code JOIN countrylanguage AS T3 ON T2.Code = T3.CountryCode WHERE T2.Continent = 'Asia' AND T3.Language = 'Chinese' AND T3.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT min(Population) FROM country)
SELECT Name, IndepYear, SurfaceArea FROM country WHERE Population = (SELECT min(Population) FROM country)
SELECT Population, Name, HeadOfState FROM country WHERE SurfaceArea = (SELECT max(SurfaceArea) FROM country)
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT max(SurfaceArea) FROM country)
SELECT T1.Name, COUNT(T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Code HAVING COUNT(T2.Language) >= 3
SELECT T1.Name, COUNT(T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode GROUP BY T1.Name HAVING COUNT(T2.Language) > 2
SELECT city.District, COUNT(*) AS NumberOfCities FROM city WHERE city.Population > (SELECT AVG(Population) FROM city) GROUP BY city.District;
SELECT District, COUNT(*) FROM city WHERE Population > (SELECT avg(Population) FROM city) GROUP BY District
SELECT GovernmentForm, SUM(Population) FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Continent, SUM(Population), AVG(LifeExpectancy) FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC, Name, Code LIMIT 5
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC, Population DESC, Code ASC LIMIT 5
SELECT Name FROM country ORDER BY Population DESC, Name, Code LIMIT 3
SELECT Name FROM country ORDER BY Population DESC, Name ASC, Code ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC, Code ASC LIMIT 3
SELECT Name FROM country ORDER BY Population ASC, Name ASC, Code ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT COUNT(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT SUM(Population), AVG(SurfaceArea) FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM countrylanguage GROUP BY Language))
SELECT Language FROM countrylanguage GROUP BY Language HAVING COUNT(*) = (SELECT MAX(num_countries) FROM (SELECT COUNT(*) AS num_countries FROM countrylanguage GROUP BY Language))
SELECT T1.Language, T1.Percentage, T1.CountryCode, T2.Name FROM countrylanguage AS T1 JOIN country AS T2 ON T1.CountryCode = T2.Code WHERE (T1.CountryCode, T1.Percentage) IN (SELECT CountryCode, MAX(Percentage) FROM countrylanguage GROUP BY CountryCode)
SELECT T1.Code, T2.Language FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE (T2.Percentage, T2.CountryCode) IN (SELECT max(Percentage), CountryCode FROM countrylanguage GROUP BY CountryCode)
SELECT COUNT(DISTINCT T1.Code) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.Percentage = (SELECT MAX(T3.Percentage) FROM countrylanguage AS T3 WHERE T3.CountryCode = T1.Code)
SELECT COUNT(DISTINCT T1.Code) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Spanish' AND T2.IsOfficial = 'T'
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = (SELECT max(Percentage) FROM countrylanguage WHERE Language = 'Spanish')
SELECT country.Code FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'Spanish' AND countrylanguage.IsOfficial = 'T'
SELECT COUNT(*) FROM conductor
SELECT COUNT(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age, Conductor_ID
SELECT Name FROM conductor ORDER BY Age, Conductor_ID
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC, Orchestra_ID
SELECT AVG(Attendance) FROM show
SELECT AVG(Attendance) FROM show
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT MAX(Share), MIN(Share) FROM performance WHERE Type != 'Live final'
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT COUNT(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID ASC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC, Conductor_ID
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT MAX(Year_of_Work) FROM conductor)
SELECT Name FROM conductor WHERE Year_of_Work = (SELECT max(Year_of_Work) FROM conductor)
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T1.Name, T2.Orchestra FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(DISTINCT T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(DISTINCT T2.Orchestra_ID) > 1
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID GROUP BY T1.Conductor_ID HAVING COUNT(*) = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(*) AS num_orchestras FROM orchestra GROUP BY Conductor_ID) AS subquery)
SELECT Name FROM conductor WHERE Conductor_ID IN (SELECT Conductor_ID FROM orchestra GROUP BY Conductor_ID HAVING COUNT(*) = (SELECT MAX(num_orchestras) FROM (SELECT COUNT(*) AS num_orchestras FROM orchestra GROUP BY Conductor_ID) AS counts))
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(Orchestra_ID) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(Orchestra_ID) FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format, COUNT(*) FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*), Major_Record_Format
SELECT Major_Record_Format, COUNT(*) AS Frequency FROM orchestra GROUP BY Major_Record_Format ORDER BY Frequency DESC, Major_Record_Format, Orchestra_ID
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Record_Company IN (SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003) AND Record_Company IN (SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format IN ('CD', 'DVD')
SELECT Year_of_Founded FROM orchestra JOIN performance ON orchestra.Orchestra_ID = performance.Orchestra_ID GROUP BY orchestra.Orchestra_ID HAVING COUNT(performance.Performance_ID) > 1
SELECT Year_of_Founded FROM orchestra WHERE Orchestra_ID IN (SELECT Orchestra_ID FROM performance GROUP BY Orchestra_ID HAVING COUNT(Performance_ID) > 1)
SELECT COUNT(*) FROM Highschooler
SELECT COUNT(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT DISTINCT grade FROM Highschooler
SELECT ID, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT grade, COUNT(ID) FROM Highschooler GROUP BY grade
SELECT grade, COUNT(ID) FROM Highschooler GROUP BY grade
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(ID) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(ID) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(ID) >= 4
SELECT student_id, COUNT(friend_id) AS total_friends FROM Friend GROUP BY student_id UNION ALL SELECT friend_id, COUNT(student_id) AS total_friends FROM Friend GROUP BY friend_id
SELECT student_id, COUNT(DISTINCT friend_id) AS num_friends FROM Friend GROUP BY student_id UNION ALL SELECT friend_id AS student_id, COUNT(DISTINCT student_id) AS num_friends FROM Friend GROUP BY friend_id
SELECT H.name, COUNT(F.friend_id) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name
SELECT H.name, COUNT(F.friend_id) FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.name
SELECT name FROM Highschooler WHERE ID = (SELECT student_id FROM (SELECT student_id, COUNT(*) AS total_friends FROM (SELECT student_id FROM Friend UNION ALL SELECT friend_id AS student_id FROM Friend) AS all_friends GROUP BY student_id) AS total_counts ORDER BY total_friends DESC LIMIT 1)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) = (SELECT MAX(num_friends) FROM (SELECT COUNT(friend_id) AS num_friends FROM Friend GROUP BY student_id) AS subquery))
SELECT T1.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id OR T1.ID = T2.friend_id GROUP BY T1.ID HAVING COUNT(DISTINCT T2.friend_id) + COUNT(DISTINCT T2.student_id) >= 6
SELECT name FROM Highschooler WHERE ID IN (SELECT ID FROM (SELECT Highschooler.ID FROM Highschooler JOIN Friend ON Highschooler.ID = Friend.student_id OR Highschooler.ID = Friend.friend_id GROUP BY Highschooler.ID HAVING COUNT(*) >= 3) AS SubQuery)
SELECT T1.ID, T3.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Highschooler AS T3 ON T2.friend_id = T3.ID WHERE T1.name = 'Kyle'
SELECT T1.ID, T3.name FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Highschooler AS T3 ON T2.friend_id = T3.ID WHERE T1.name = 'Kyle'
SELECT T1.ID, COUNT(T2.friend_id) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle' GROUP BY T1.ID
SELECT T1.ID, COUNT(T2.friend_id) FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id WHERE T1.name = 'Kyle' GROUP BY T1.ID
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT ID FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes)
SELECT ID FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT liked_id FROM Likes)
SELECT name FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend) AND ID IN (SELECT student_id FROM Likes)
SELECT ID, (SELECT COUNT(*) FROM Likes WHERE student_id = Highschooler.ID) + (SELECT COUNT(*) FROM Likes WHERE liked_id = Highschooler.ID) AS total_likes FROM Highschooler
SELECT T1.ID, COUNT(DISTINCT T2.student_id) AS given_likes, COUNT(DISTINCT T2.liked_id) AS received_likes FROM Highschooler AS T1 LEFT JOIN Likes AS T2 ON T1.ID = T2.student_id OR T1.ID = T2.liked_id GROUP BY T1.ID
SELECT H.name, COUNT(DISTINCT L1.liked_id) AS likes_given, COUNT(DISTINCT L2.student_id) AS likes_received FROM Highschooler H LEFT JOIN Likes L1 ON H.ID = L1.student_id LEFT JOIN Likes L2 ON H.ID = L2.liked_id GROUP BY H.name
SELECT H.name, COUNT(DISTINCT L1.liked_id) AS likes_given, COUNT(DISTINCT L2.student_id) AS likes_received FROM Highschooler H LEFT JOIN Likes L1 ON H.ID = L1.student_id LEFT JOIN Likes L2 ON H.ID = L2.liked_id GROUP BY H.name
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T1.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) = (SELECT MAX(like_count) FROM (SELECT COUNT(*) AS like_count FROM Likes GROUP BY liked_id) AS counts))
SELECT T1.name FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id GROUP BY T2.liked_id HAVING COUNT(*) >= 2
SELECT name FROM Highschooler WHERE ID IN (SELECT liked_id FROM Likes GROUP BY liked_id HAVING COUNT(*) >= 2)
SELECT H.name FROM Highschooler H WHERE H.grade > 5 AND (SELECT COUNT(*) FROM Friend F WHERE F.student_id = H.ID OR F.friend_id = H.ID) >= 2
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id OR H.ID = F.friend_id WHERE H.grade > 5 GROUP BY H.ID HAVING COUNT(DISTINCT F.friend_id) >= 2 OR COUNT(DISTINCT F.student_id) >= 2
SELECT T1.ID, COUNT(*) AS num_likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id WHERE T1.name = 'Kyle' GROUP BY T1.ID
SELECT T1.ID, COUNT(*) AS num_likes FROM Highschooler AS T1 JOIN Likes AS T2 ON T1.ID = T2.liked_id WHERE T1.name = 'Kyle' GROUP BY T1.ID
SELECT AVG(grade) FROM Highschooler WHERE ID IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT AVG(T1.grade) FROM Highschooler AS T1 WHERE T1.ID IN (SELECT T2.student_id FROM Friend AS T2 UNION SELECT T2.friend_id FROM Friend AS T2)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT min(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT O.state FROM Owners O JOIN Professionals P ON O.state = P.state
SELECT state FROM Owners WHERE state IN (SELECT state FROM Professionals)
SELECT AVG(T1.age) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT AVG(T1.age) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals P WHERE P.state = 'IN' OR P.professional_id IN (SELECT T.professional_id FROM Treatments T GROUP BY T.professional_id HAVING COUNT(*) > 2)
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals P WHERE P.state = 'Indiana' OR P.professional_id IN (SELECT T.professional_id FROM Treatments T GROUP BY T.professional_id HAVING COUNT(*) > 2)
SELECT name FROM Dogs WHERE dog_id IN (SELECT dog_id FROM Treatments GROUP BY dog_id HAVING SUM(cost_of_treatment) <= 1000)
SELECT D.name FROM Dogs D WHERE D.dog_id IN (SELECT T.dog_id FROM Treatments T GROUP BY T.dog_id HAVING SUM(T.cost_of_treatment) <= 1000)
SELECT first_name FROM Professionals WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT first_name FROM Owners WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT first_name FROM Professionals WHERE first_name NOT IN (SELECT name FROM Dogs) UNION SELECT first_name FROM Owners WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT O.owner_id, O.first_name, O.last_name FROM Owners O JOIN (SELECT owner_id FROM Dogs GROUP BY owner_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Dogs GROUP BY owner_id) AS counts)) D ON O.owner_id = D.owner_id
SELECT O.owner_id, O.first_name, O.last_name FROM Owners O WHERE O.owner_id IN (SELECT D.owner_id FROM Dogs D GROUP BY D.owner_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Dogs GROUP BY owner_id) AS counts))
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(T.treatment_id) >= 2
SELECT T1.professional_id, T1.role_code, T1.first_name FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(T2.professional_id) >= 2
SELECT B.breed_name FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code GROUP BY B.breed_name HAVING COUNT(D.dog_id) = (SELECT MAX(count) FROM (SELECT COUNT(dog_id) AS count FROM Dogs GROUP BY breed_code) AS MaxCount)
SELECT T2.breed_name FROM Dogs AS T1 JOIN Breeds AS T2 ON T1.breed_code = T2.breed_code GROUP BY T1.breed_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT O.owner_id, O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name HAVING COUNT(T.treatment_id) = (SELECT MAX(treatment_count) FROM (SELECT COUNT(T.treatment_id) AS treatment_count FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name) AS subquery)
SELECT O.owner_id, O.last_name FROM Owners O WHERE O.owner_id IN (SELECT D.owner_id FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.owner_id HAVING SUM(T.cost_of_treatment) = (SELECT MAX(total_spent) FROM (SELECT owner_id, SUM(cost_of_treatment) AS total_spent FROM Treatments JOIN Dogs ON Treatments.dog_id = Dogs.dog_id GROUP BY owner_id) AS total_costs))
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 WHERE T1.treatment_type_code IN (SELECT T2.treatment_type_code FROM Treatments AS T2 GROUP BY T2.treatment_type_code HAVING SUM(T2.cost_of_treatment) = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) AS SubQuery))
SELECT T1.treatment_type_description FROM Treatment_Types AS T1 JOIN (SELECT treatment_type_code, SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) AS T2 ON T1.treatment_type_code = T2.treatment_type_code WHERE T2.total_cost = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) AS total_cost FROM Treatments GROUP BY treatment_type_code) AS T3)
SELECT T1.owner_id, T1.zip_code FROM Owners AS T1 JOIN Dogs AS T2 ON T1.owner_id = T2.owner_id JOIN Treatments AS T3 ON T2.dog_id = T3.dog_id GROUP BY T1.owner_id, T1.zip_code ORDER BY SUM(T3.cost_of_treatment) DESC LIMIT 1
SELECT O.owner_id, O.zip_code FROM Owners O WHERE O.owner_id IN (SELECT D.owner_id FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.owner_id HAVING SUM(T.cost_of_treatment) = (SELECT MAX(total_spent) FROM (SELECT D.owner_id, SUM(T.cost_of_treatment) AS total_spent FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id GROUP BY D.owner_id) AS total_spending))
SELECT T1.professional_id, T2.cell_number FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(DISTINCT T1.treatment_type_code) >= 2
SELECT T1.professional_id, T1.cell_number FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id GROUP BY T1.professional_id HAVING COUNT(DISTINCT T2.treatment_type_code) >= 2
SELECT P.first_name, P.last_name FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < (SELECT avg(cost_of_treatment) FROM Treatments)
SELECT DISTINCT p.first_name, p.last_name FROM Professionals p JOIN Treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments)
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.date_of_treatment, T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id = T2.professional_id
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT T1.cost_of_treatment, T2.treatment_type_description FROM Treatments AS T1 JOIN Treatment_Types AS T2 ON T1.treatment_type_code = T2.treatment_type_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id
SELECT Dogs.name, Treatments.date_of_treatment FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id WHERE Dogs.breed_code IN (SELECT breed_code FROM (SELECT breed_code, COUNT(*) AS count FROM Dogs GROUP BY breed_code) AS BreedCounts WHERE count = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Dogs GROUP BY breed_code) AS SubBreedCounts))
SELECT D.name, T.date_of_treatment FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE D.breed_code IN (SELECT breed_code FROM Dogs GROUP BY breed_code HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM Dogs GROUP BY breed_code) AS sub))
SELECT O.first_name, D.name FROM Dogs AS D JOIN Owners AS O ON D.owner_id = O.owner_id WHERE O.state = 'Virginia'
SELECT Owners.first_name, Dogs.name FROM Owners JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Owners.state = 'Virginia'
SELECT DISTINCT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT DISTINCT T1.date_arrived, T1.date_departed FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT last_name FROM Owners WHERE owner_id IN (SELECT owner_id FROM Dogs WHERE date_of_birth = (SELECT max(date_of_birth) FROM Dogs))
SELECT O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE D.date_of_birth = (SELECT max(date_of_birth) FROM Dogs)
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT T1.dog_id) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT COUNT(DISTINCT T1.dog_id) FROM Dogs AS T1 JOIN Treatments AS T2 ON T1.dog_id = T2.dog_id
SELECT COUNT(DISTINCT T1.professional_id) FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id
SELECT COUNT(DISTINCT T1.professional_id) FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE '%North%'
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE age < (SELECT AVG(age) FROM Dogs)
SELECT max(cost_of_treatment) FROM Treatments WHERE date_of_treatment = (SELECT max(date_of_treatment) FROM Treatments)
SELECT cost_of_treatment FROM Treatments WHERE date_of_treatment = (SELECT max(date_of_treatment) FROM Treatments)
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments)
SELECT COUNT(*) FROM Owners LEFT JOIN Dogs ON Owners.owner_id = Dogs.owner_id WHERE Dogs.owner_id IS NULL
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM Dogs WHERE abandoned_yn = 'N')
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT COUNT(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = 1
SELECT AVG(age) FROM Dogs
SELECT AVG(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT MAX(age) FROM Dogs
SELECT charge_type, charge_amount FROM Charges
SELECT charge_type, charge_amount FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT MAX(charge_amount) FROM Charges
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT DISTINCT T1.breed_name, T3.size_description FROM Breeds AS T1 JOIN Dogs AS T2 ON T1.breed_code = T2.breed_code JOIN Sizes AS T3 ON T2.size_code = T3.size_code
SELECT DISTINCT T1.breed_name, T2.size_description FROM Dogs AS T3 JOIN Breeds AS T1 ON T3.breed_code = T1.breed_code JOIN Sizes AS T2 ON T3.size_code = T2.size_code
SELECT T1.first_name, T3.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT T1.first_name, T3.treatment_type_description FROM Professionals AS T1 JOIN Treatments AS T2 ON T1.professional_id = T2.professional_id JOIN Treatment_Types AS T3 ON T2.treatment_type_code = T3.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Name ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC, Singer_ID ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != 'France'
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT max(Net_Worth_Millions) FROM singer)
SELECT Name FROM singer WHERE Net_Worth_Millions = (SELECT MAX(Net_Worth_Millions) FROM singer)
SELECT Citizenship, COUNT(Singer_ID) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(Singer_ID) FROM singer GROUP BY Citizenship
SELECT Citizenship FROM singer GROUP BY Citizenship HAVING COUNT(*) = (SELECT MAX(freq) FROM (SELECT COUNT(*) AS freq FROM singer GROUP BY Citizenship) AS subquery)
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) FROM singer GROUP BY Citizenship
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Singer_ID HAVING COUNT(*) > 1
SELECT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name HAVING COUNT(T2.Song_ID) > 1
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT T1.Name, SUM(T2.Sales) FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID GROUP BY T1.Name
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Citizenship IN (SELECT Citizenship FROM singer WHERE Birth_Year < 1945) INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT COUNT(*) FROM Other_Available_Features
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 JOIN Other_Available_Features AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T2.feature_name = 'AirCon'
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code
SELECT property_name FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code WHERE (Ref_Property_Types.property_type_description = 'house' OR Ref_Property_Types.property_type_description = 'apartment') AND room_count > 1