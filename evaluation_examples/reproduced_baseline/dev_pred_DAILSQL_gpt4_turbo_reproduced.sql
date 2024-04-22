SELECT count(*) FROM singer
SELECT count(*) FROM singer
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT Name, Country, Age FROM singer ORDER BY Age DESC
SELECT avg(Age) AS Average_Age, min(Age) AS Minimum_Age, max(Age) AS Maximum_Age FROM singer WHERE Country = 'France'
SELECT AVG(Age) AS Average_Age, MIN(Age) AS Minimum_Age, MAX(Age) AS Maximum_Age FROM singer WHERE Country = 'France';
SELECT s.Name, s.Song_Name, s.Song_release_year FROM singer AS s ORDER BY s.Age ASC LIMIT 1;
SELECT Song_Name, Song_release_year FROM singer WHERE Age = (SELECT MIN(Age) FROM singer);
SELECT DISTINCT Country FROM singer WHERE Age > 20
SELECT DISTINCT "Country" FROM "singer" WHERE "Age" > 20
SELECT Country, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Country;
SELECT Country, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Country;
SELECT s.Song_Name FROM singer s WHERE s.Age > (SELECT AVG(Age) FROM singer) ORDER BY s.Song_Name;
SELECT DISTINCT s.Song_Name FROM singer AS s WHERE s.Age > (SELECT AVG(Age) FROM singer);
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT Location, Name FROM stadium WHERE Capacity BETWEEN 5000 AND 10000
SELECT MAX(Capacity) AS Maximum_Capacity, AVG(Capacity) AS Average_Capacity FROM stadium;
SELECT AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM stadium;
SELECT Name, Capacity FROM stadium WHERE Average = (SELECT MAX(Average) FROM stadium);
SELECT Name, Capacity FROM stadium ORDER BY Average DESC LIMIT 1;
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT COUNT(*) FROM concert WHERE Year IN ('2014', '2015')
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Name;
SELECT s.Stadium_ID, s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM stadium s LEFT JOIN concert c ON s.Stadium_ID = c.Stadium_ID GROUP BY s.Stadium_ID, s.Name
SELECT s.Name, s.Capacity FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year >= '2014' GROUP BY s.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT S.Name, S.Capacity FROM stadium AS S JOIN concert AS C ON S.Stadium_ID = C.Stadium_ID WHERE C.Year > '2013' GROUP BY S.Stadium_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Year FROM concert GROUP BY Year ORDER BY count(*) DESC LIMIT 1;
SELECT Year FROM concert GROUP BY Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert);
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert)
SELECT Country FROM singer WHERE Age > 40 INTERSECT SELECT Country FROM singer WHERE Age < 30
SELECT Name FROM stadium EXCEPT SELECT T1.Name FROM stadium AS T1 JOIN concert AS T2 ON T1.Stadium_ID = T2.Stadium_ID WHERE T2.Year = '2014'
SELECT Name FROM stadium WHERE Stadium_ID NOT IN (SELECT Stadium_ID FROM concert WHERE Year = '2014')
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS NumberOfSingers FROM concert AS c JOIN singer_in_concert AS sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme;
SELECT c.concert_Name, c.Theme, COUNT(sic.Singer_ID) AS NumberOfSingers FROM concert AS c JOIN singer_in_concert AS sic ON c.concert_ID = sic.concert_ID GROUP BY c.concert_ID, c.concert_Name, c.Theme;
SELECT s.Name, COUNT(c.concert_ID) AS Number_of_Concerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID JOIN concert c ON sic.concert_ID = c.concert_ID GROUP BY s.Singer_ID, s.Name;
SELECT s.Name, COUNT(c.concert_ID) AS NumberOfConcerts FROM singer s JOIN singer_in_concert sic ON s.Singer_ID = sic.Singer_ID GROUP BY s.Singer_ID, s.Name;
SELECT DISTINCT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014';
SELECT DISTINCT s.Name FROM singer AS s JOIN singer_in_concert AS sic ON s.Singer_ID = sic.Singer_ID JOIN concert AS c ON sic.concert_ID = c.concert_ID WHERE c.Year = '2014';
SELECT s.Name, s.Country FROM singer AS s WHERE s.Song_Name LIKE '%Hey%'
SELECT Name, Country FROM singer WHERE Song_Name LIKE "%Hey%";
SELECT DISTINCT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year = '2014' INTERSECT SELECT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year = '2015';
SELECT DISTINCT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year = '2014' INTERSECT SELECT DISTINCT s.Name, s.Location FROM stadium s JOIN concert c ON s.Stadium_ID = c.Stadium_ID WHERE c.Year = '2015'
SELECT COUNT(*) AS NumberOfConcerts FROM concert WHERE Stadium_ID = ( SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1 );
SELECT COUNT(*) AS NumberOfConcerts FROM concert WHERE Stadium_ID = ( SELECT Stadium_ID FROM stadium ORDER BY Capacity DESC LIMIT 1 );
SELECT count(*) FROM Pets WHERE weight > 10
SELECT count(*) FROM Pets WHERE weight > 10
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT weight FROM Pets WHERE PetType = 'dog' AND pet_age = (SELECT MIN(pet_age) FROM Pets WHERE PetType = 'dog')
SELECT PetType, max(weight) FROM Pets GROUP BY PetType
SELECT PetType, MAX(weight) AS MaxWeight FROM Pets GROUP BY PetType;
SELECT COUNT(*) AS NumberOfPets FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID WHERE S.Age > 20;
SELECT count(*) FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.Age > 20
SELECT COUNT(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE S.Sex = 'F' AND P.PetType = 'Dog';
SELECT COUNT(*) FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE S.Sex = 'F' AND P.PetType = 'Dog';
SELECT count(DISTINCT PetType) FROM Pets
SELECT count(DISTINCT PetType) FROM Pets;
SELECT DISTINCT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' OR P.PetType = 'dog'
SELECT DISTINCT S.Fname FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' OR P.PetType = 'dog'
SELECT Fname FROM Student WHERE StuID IN ( SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat' INTERSECT SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog' )
SELECT Fname FROM Student WHERE StuID IN ( SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'Cat' ) INTERSECT SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'Dog' ) )
SELECT DISTINCT S.Major, S.Age FROM Student AS S LEFT JOIN Has_Pet AS HP ON S.StuID = HP.StuID LEFT JOIN Pets AS P ON HP.PetID = P.PetID AND P.PetType = 'cat' WHERE P.PetID IS NULL;
SELECT DISTINCT S.StuID, S.Major, S.Age FROM Student S LEFT JOIN Has_Pet HP ON S.StuID = HP.StuID LEFT JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType != 'cat' OR P.PetType IS NULL;
SELECT DISTINCT S.StuID FROM Student S LEFT JOIN Has_Pet HP ON S.StuID = HP.StuID LEFT JOIN Pets P ON HP.PetID = P.PetID WHERE P.PetType != 'cat' OR P.PetType IS NULL;
SELECT StuID FROM Student EXCEPT SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'Cat';
SELECT Fname, Age FROM Student WHERE StuID IN ( SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'Dog' ) EXCEPT SELECT StuID FROM Has_Pet WHERE PetID IN ( SELECT PetID FROM Pets WHERE PetType = 'Cat' ) )
SELECT Fname FROM Student WHERE StuID IN ( SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'dog' ) AND StuID NOT IN ( SELECT StuID FROM Has_Pet JOIN Pets ON Has_Pet.PetID = Pets.PetID WHERE PetType = 'cat' )
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetType, weight FROM Pets ORDER BY pet_age ASC LIMIT 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetID, weight FROM Pets WHERE pet_age > 1
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType
SELECT PetType, AVG(pet_age) AS AverageAge, MAX(pet_age) AS MaxAge FROM Pets GROUP BY PetType
SELECT PetType, AVG(weight) FROM Pets GROUP BY PetType;
SELECT PetType, AVG(weight) AS AverageWeight FROM Pets GROUP BY PetType;
SELECT DISTINCT S.Fname, S.Age FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID
SELECT DISTINCT T1.Fname, T1.Age FROM Student AS T1 JOIN Has_Pet AS T2 ON T1.StuID = T2.StuID
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith'
SELECT PetID FROM Has_Pet JOIN Student ON Has_Pet.StuID = Student.StuID WHERE Student.LName = 'Smith';
SELECT S.StuID, COUNT(P.PetID) AS NumberOfPets FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID GROUP BY S.StuID;
SELECT Has_Pet.StuID, COUNT(Has_Pet.PetID) AS NumberOfPets FROM Has_Pet GROUP BY Has_Pet.StuID;
SELECT S.Fname, S.Sex FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1;
SELECT S.Fname, S.Sex FROM Student S JOIN Has_Pet HP ON S.StuID = HP.StuID GROUP BY S.StuID HAVING COUNT(HP.PetID) > 1;
SELECT S.LName FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3
SELECT S.LName FROM Student AS S JOIN Has_Pet AS HP ON S.StuID = HP.StuID JOIN Pets AS P ON HP.PetID = P.PetID WHERE P.PetType = 'cat' AND P.pet_age = 3;
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT AVG(Age) FROM Student WHERE StuID NOT IN (SELECT StuID FROM Has_Pet)
SELECT count(*) FROM continents
SELECT count(*) FROM continents
SELECT C.ContId, C.Continent, COUNT(*) AS NumberOfCountries FROM continents AS C JOIN countries AS T ON C.ContId = T.Continent GROUP BY C.ContId, C.Continent;
SELECT c.ContId, c.Continent, COUNT(t.CountryId) AS NumberOfCountries FROM continents AS c LEFT JOIN countries AS t ON c.ContId = t.Continent GROUP BY c.ContId, c.Continent
SELECT count(*) FROM countries
SELECT count(*) FROM countries;
SELECT cm.FullName, cm.Id, COUNT(ml.ModelId) AS NumberOfModels FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName;
SELECT car_makers.Id, car_makers.FullName, COUNT(model_list.ModelId) AS NumberOfModels FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.Id, car_makers.FullName;
SELECT cn.Model, cd.Horsepower FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId ORDER BY CAST(cd.Horsepower AS INTEGER) ASC LIMIT 1;
SELECT cn.Model FROM car_names cn JOIN cars_data cd ON cn.MakeId = cd.Id WHERE cd.Horsepower = ( SELECT MIN(CAST(Horsepower AS INTEGER)) FROM cars_data WHERE Horsepower != 'NA' -- Assuming 'NA' is used for missing data );
SELECT model_list.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.ModelId WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT model_list.Model FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE cars_data.Weight < (SELECT AVG(Weight) FROM cars_data);
SELECT DISTINCT cm.Maker FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker JOIN car_names AS cn ON ml.ModelId = cn.Model JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cd.Year = 1970;
SELECT DISTINCT T2.FullName FROM cars_data AS T1 JOIN car_names AS T3 ON T1.Id = T3.MakeId JOIN model_list AS T4 ON T3.Model = T4.Model JOIN car_makers AS T2 ON T4.Maker = T2.Id WHERE T1.Year = 1970
SELECT car_names.Make, cars_data.Year FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId ORDER BY cars_data.Year ASC LIMIT 1;
SELECT cm.FullName AS Maker, cd.Year AS Year FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.Model JOIN car_makers AS cm ON ml.Maker = cm.Id ORDER BY cd.Year ASC LIMIT 1;
SELECT DISTINCT model_list.Model FROM model_list JOIN car_names ON model_list.ModelId = car_names.MakeId JOIN cars_data ON car_names.MakeId = cars_data.Id WHERE cars_data.Year > 1980
SELECT DISTINCT ml.Model FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.Model WHERE cd.Year > 1980;
SELECT C.Continent, COUNT(DISTINCT M.Id) AS NumberOfCarMakers FROM continents AS C JOIN countries AS N ON C.ContId = N.Continent JOIN car_makers AS M ON N.CountryId = M.Country GROUP BY C.Continent;
SELECT c.Continent AS ContinentName, COUNT(DISTINCT cm.Id) AS NumberOfCarMakers FROM continents c JOIN countries co ON c.ContId = co.Continent JOIN car_makers cm ON co.CountryId = cm.Country GROUP BY c.Continent;
SELECT c.CountryName FROM countries AS c JOIN car_makers AS cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(cm.Id) DESC LIMIT 1;
SELECT c.CountryName FROM countries AS c JOIN car_makers AS cm ON c.CountryId = cm.Country GROUP BY c.CountryName ORDER BY COUNT(cm.Id) DESC LIMIT 1;
SELECT COUNT(model_list.ModelId) AS ModelCount, car_makers.FullName FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker GROUP BY car_makers.FullName;
SELECT cm.Id, cm.FullName, COUNT(ml.ModelId) AS NumberOfModels FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName;
SELECT Accelerate FROM cars_data WHERE Id IN ( SELECT MakeId FROM car_names WHERE Model = 'amc hornet sportabout (sw)' );
SELECT c.Accelerate FROM cars_data AS c JOIN car_names AS n ON c.Id = n.MakeId WHERE n.Model = 'amc hornet sportabout (sw)';
SELECT COUNT(*) FROM car_makers AS cm JOIN countries AS c ON cm.Country = c.CountryId WHERE c.CountryName = 'France';
SELECT COUNT(DISTINCT car_makers.Id) FROM car_makers JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'France';
SELECT COUNT(DISTINCT model_list.Model) FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'USA';
SELECT COUNT(DISTINCT model_list.Model) AS NumberOfModels FROM model_list JOIN car_makers ON model_list.Maker = car_makers.Id JOIN countries ON car_makers.Country = countries.CountryId WHERE countries.CountryName = 'United States';
SELECT AVG(CAST(MPG AS REAL)) FROM cars_data WHERE Cylinders = 4
SELECT AVG(CAST(MPG AS FLOAT)) AS AverageMPG FROM cars_data WHERE Cylinders = 4;
SELECT MIN(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT min(Weight) FROM cars_data WHERE Cylinders = 8 AND Year = 1974
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker;
SELECT car_makers.Maker, model_list.Model FROM car_makers JOIN model_list ON car_makers.Id = model_list.Maker;
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country
SELECT DISTINCT countries.CountryId, countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country
SELECT COUNT(*) FROM cars_data WHERE CAST(Horsepower AS INTEGER) > 150;
SELECT COUNT(*) FROM cars_data WHERE Horsepower > 150;
SELECT Year, AVG(Weight) AS Average_Weight FROM cars_data GROUP BY Year;
SELECT AVG(Weight) AS Average_Weight, Year FROM cars_data GROUP BY Year;
SELECT c.CountryName FROM countries AS c JOIN car_makers AS cm ON c.CountryId = cm.Country JOIN continents AS ct ON c.Continent = ct.ContId WHERE ct.Continent = 'Europe' GROUP BY c.CountryName HAVING COUNT(DISTINCT cm.Id) >= 3;
SELECT c.CountryName FROM countries AS c JOIN continents AS ct ON c.Continent = ct.ContId LEFT JOIN car_makers AS cm ON cm.Country = c.CountryId WHERE ct.Continent = 'Europe' GROUP BY c.CountryName HAVING COUNT(cm.Id) >= 3;
SELECT max(cars_data.Horsepower) AS MaxHorsepower, car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3 GROUP BY car_names.Make;
SELECT max(cast(cars_data.Horsepower as INTEGER)) as MaxHorsepower, car_names.Make FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId WHERE cars_data.Cylinders = 3 GROUP BY car_names.Make ORDER BY MaxHorsepower DESC LIMIT 1;
SELECT cn.Model, cd.MPG FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId ORDER BY cd.MPG DESC LIMIT 1;
SELECT cn.Model FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId ORDER BY CAST(cd.MPG AS FLOAT) DESC LIMIT 1;
SELECT AVG(CAST(cars_data.Horsepower AS INTEGER)) AS AvgHorsepower FROM cars_data WHERE cars_data.Year < 1980;
SELECT AVG(CAST(Horsepower AS INTEGER)) FROM cars_data WHERE Year < 1980
SELECT AVG(cars_data.Edispl) AS AvgEdispl FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model WHERE model_list.Model = 'Volvo';
SELECT AVG(cars_data.Edispl) AS AvgEdispl FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.Model JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo';
SELECT Cylinders, MAX(Accelerate) AS MaxAcceleration FROM cars_data GROUP BY Cylinders
SELECT Cylinders, MAX(Accelerate) FROM cars_data GROUP BY Cylinders
SELECT Model, COUNT(DISTINCT Make) AS NumberOfMakes FROM car_names GROUP BY Model ORDER BY NumberOfMakes DESC LIMIT 1;
SELECT cn.Model, COUNT(*) AS VersionCount FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId GROUP BY cn.Model ORDER BY VersionCount DESC LIMIT 1;
SELECT count(*) FROM cars_data WHERE Cylinders > 4;
SELECT count(*) FROM cars_data WHERE Cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT COUNT(*) FROM cars_data WHERE Year = 1980;
SELECT COUNT(*) FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.FullName = 'American Motor Company';
SELECT COUNT(*) AS NumberOfModels FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker WHERE cm.Maker = 'American Motor Company';
SELECT cm.Id, cm.FullName FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.FullName HAVING COUNT(ml.Model) > 3;
SELECT cm.Id, cm.Maker FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id HAVING COUNT(ml.Model) > 3;
SELECT DISTINCT T3.Model FROM car_makers AS T1 JOIN model_list AS T2 ON T1.Id = T2.Maker JOIN car_names AS T3 ON T2.ModelId = T3.Model JOIN cars_data AS T4 ON T3.MakeId = T4.Id WHERE T1.FullName = 'General Motors' OR T4.Weight > 3500
SELECT DISTINCT ml.Model FROM model_list AS ml JOIN car_makers AS cm ON ml.Maker = cm.Id LEFT JOIN car_names AS cn ON ml.Model = cn.Model LEFT JOIN cars_data AS cd ON cn.MakeId = cd.Id WHERE cm.FullName = 'General Motors' OR cd.Weight > 3500;
SELECT DISTINCT Year FROM cars_data WHERE Weight >= 3000 AND Weight <= 4000;
SELECT DISTINCT Year FROM cars_data WHERE Weight < 4000 INTERSECT SELECT DISTINCT Year FROM cars_data WHERE Weight > 3000
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Horsepower FROM cars_data ORDER BY Accelerate DESC LIMIT 1
SELECT Cylinders FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.Model WHERE ml.Model = 'volvo' ORDER BY cd.Accelerate ASC LIMIT 1;
SELECT Cylinders FROM cars_data JOIN car_names ON cars_data.Id = car_names.MakeId JOIN model_list ON car_names.Model = model_list.ModelId JOIN car_makers ON model_list.Maker = car_makers.Id WHERE car_makers.Maker = 'Volvo' ORDER BY cars_data.Accelerate ASC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE Accelerate > (SELECT Accelerate FROM cars_data WHERE Horsepower = (SELECT MAX(Horsepower) FROM cars_data));
SELECT COUNT(*) FROM cars_data WHERE Accelerate > ( SELECT Accelerate FROM cars_data WHERE Horsepower = ( SELECT MAX(Horsepower) FROM cars_data ) );
SELECT COUNT(*) FROM ( SELECT Country FROM car_makers GROUP BY Country HAVING COUNT(*) > 2 ) AS subquery
SELECT count(*) FROM ( SELECT countries.CountryName FROM countries JOIN car_makers ON countries.CountryId = car_makers.Country GROUP BY countries.CountryName HAVING count(car_makers.Id) > 2 )
SELECT count(*) FROM cars_data WHERE Cylinders > 6;
SELECT COUNT(*) AS NumberOfCars FROM cars_data WHERE Cylinders > 6;
SELECT cn.Model FROM cars_data cd JOIN car_names cn ON cd.Id = cn.MakeId WHERE cd.Cylinders = 4 ORDER BY CAST(cd.Horsepower AS INTEGER) DESC LIMIT 1;
SELECT cn.Model, MAX(CAST(cd.Horsepower AS INTEGER)) AS MaxHorsepower FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId WHERE cd.Cylinders = 4 GROUP BY cn.Model ORDER BY MaxHorsepower DESC LIMIT 1;
SELECT c.MakeId, cn.Make FROM cars_data AS c JOIN car_names AS cn ON c.Id = cn.MakeId WHERE c.Horsepower > (SELECT MIN(Horsepower) FROM cars_data WHERE Horsepower != 'NA') AND c.Cylinders <= 3;
SELECT c.MakeId, cn.Make FROM cars_data AS c JOIN car_names AS cn ON c.Id = cn.MakeId WHERE c.Horsepower > (SELECT MIN(Horsepower) FROM cars_data) AND c.Cylinders < 4;
SELECT MAX(MPG) FROM cars_data WHERE Cylinders = 8 OR Year < 1980;
SELECT MAX(cars_data.MPG) FROM cars_data WHERE cars_data.Cylinders = 8 OR cars_data.Year < 1980
SELECT ml.Model FROM cars_data AS cd JOIN car_names AS cn ON cd.Id = cn.MakeId JOIN model_list AS ml ON cn.Model = ml.ModelId JOIN car_makers AS cm ON ml.Maker = cm.Id WHERE cd.Weight < 3500 AND cm.FullName != 'Ford Motor Company';
SELECT ml.Model FROM model_list AS ml JOIN car_makers AS cm ON ml.Maker = cm.Id JOIN car_names AS cn ON cn.Model = ml.ModelId JOIN cars_data AS cd ON cd.Id = cn.MakeId WHERE cd.Weight < 3500 AND cm.FullName != 'Ford Motor Company';
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers);
SELECT CountryName FROM countries WHERE CountryId NOT IN (SELECT Country FROM car_makers)
SELECT cm.Id, cm.Maker FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker GROUP BY cm.Id, cm.Maker HAVING COUNT(DISTINCT ml.ModelId) >= 2 AND (SELECT COUNT(DISTINCT Maker) FROM car_makers) > 3;
SELECT cm.Id, cm.Maker FROM car_makers AS cm JOIN model_list AS ml ON cm.Id = ml.Maker JOIN car_names AS cn ON ml.Model = cn.Model GROUP BY cm.Id, cm.Maker HAVING COUNT(DISTINCT ml.Model) >= 2 AND COUNT(cn.MakeId) > 3;
sql placeholder
SELECT DISTINCT c.CountryId, c.CountryName FROM countries AS c LEFT JOIN car_makers AS cm ON c.CountryId = cm.Country LEFT JOIN model_list AS ml ON cm.Id = ml.Maker WHERE ml.Model = 'Fiat' OR c.CountryId IN ( SELECT cm.Country FROM car_makers AS cm GROUP BY cm.Country HAVING COUNT(cm.Id) > 3 )
SELECT Country FROM airlines WHERE Airline = "JetBlue Airways";
SELECT Country FROM airlines WHERE Airline = 'Jetblue Airways';
SELECT Abbreviation FROM airlines WHERE Airline = "JetBlue Airways"
SELECT Abbreviation FROM airlines WHERE Airline = "Jetblue Airways";
SELECT Airline, Abbreviation FROM airlines WHERE Country = "USA"
SELECT Airline, Abbreviation FROM airlines WHERE Country = 'USA';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony';
SELECT AirportCode, AirportName FROM airports WHERE City = 'Anthony'
SELECT count(*) FROM airlines
SELECT count(*) FROM airlines
SELECT count(*) FROM airports
SELECT COUNT(*) FROM airports;
SELECT count(*) FROM flights
SELECT COUNT(*) FROM flights
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT Airline FROM airlines WHERE Abbreviation = 'UAL'
SELECT count(*) FROM airlines WHERE Country = 'USA';
SELECT count(*) FROM airlines WHERE Country = 'USA'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT City, Country FROM airports WHERE AirportName = 'Alton'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE AirportCode = 'AKO'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT AirportName FROM airports WHERE City = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'APG';
SELECT count(*) FROM flights WHERE SourceAirport = 'APG'
SELECT count(*) FROM flights WHERE DestAirport = 'ATO';
SELECT count(*) FROM flights WHERE DestAirport = 'ATO'
SELECT COUNT(*) FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = 'Aberdeen';
SELECT count(*) FROM flights AS f JOIN airports AS a ON f.SourceAirport = a.AirportCode WHERE a.City = 'Aberdeen'
SELECT count(*) FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = 'Aberdeen';
SELECT count(*) FROM flights WHERE DestAirport = 'ABZ';
SELECT COUNT(*) FROM flights AS f JOIN airports AS src ON f.SourceAirport = src.AirportCode JOIN airports AS dest ON f.DestAirport = dest.AirportCode WHERE src.City = 'Aberdeen' AND dest.City = 'Ashley';
SELECT COUNT(*) FROM flights WHERE SourceAirport = 'Aberdeen' AND DestAirport = 'Ashley'
SELECT count(*) FROM airlines AS t1 JOIN flights AS t2 ON t1.uid = t2.Airline WHERE t1.Airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = "Jetblue Airways"
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.DestAirport = 'ASY';
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid WHERE a.Airline = 'United Airlines' AND f.DestAirport = 'ASY'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid JOIN airports AS ap ON f.SourceAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.AirportCode = 'AHD';
SELECT COUNT(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid WHERE A.Airline = 'United Airlines' AND F.SourceAirport = 'AHD'
SELECT COUNT(*) FROM flights AS F JOIN airlines AS A ON F.Airline = A.uid JOIN airports AS AP ON F.DestAirport = AP.AirportCode WHERE A.Airline = 'United Airlines' AND AP.City = 'Aberdeen'
SELECT COUNT(*) FROM flights AS f JOIN airlines AS a ON f.Airline = a.uid JOIN airports AS ap ON f.DestAirport = ap.AirportCode WHERE a.Airline = 'United Airlines' AND ap.City = 'Aberdeen';
SELECT a.City, COUNT(*) AS NumberOfArrivingFlights FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode GROUP BY a.City ORDER BY NumberOfArrivingFlights DESC LIMIT 1;
SELECT a.City, COUNT(*) AS DestinationCount FROM flights f JOIN airports a ON f.DestAirport = a.AirportCode GROUP BY a.City ORDER BY DestinationCount DESC LIMIT 1;
SELECT airports.City FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY airports.City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT airports.City FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode GROUP BY airports.City ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights ) AS CombinedFlights GROUP BY AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights ) AS AllFlights GROUP BY AirportCode ORDER BY COUNT(*) DESC LIMIT 1;
SELECT DestAirport FROM flights GROUP BY DestAirport ORDER BY COUNT(*) ASC LIMIT 1;
SELECT AirportCode FROM ( SELECT SourceAirport AS AirportCode FROM flights UNION ALL SELECT DestAirport AS AirportCode FROM flights ) AS AllFlights GROUP BY AirportCode ORDER BY COUNT(*) ASC LIMIT 1;
SELECT a.Airline FROM airlines a JOIN flights f ON a.uid = f.Airline GROUP BY a.Airline ORDER BY COUNT(*) DESC LIMIT 1;
SELECT a.Airline, COUNT(*) AS NumberOfFlights FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline GROUP BY a.Airline ORDER BY NumberOfFlights DESC LIMIT 1;
SELECT A.Abbreviation, A.Country FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline GROUP BY A.uid, A.Abbreviation, A.Country ORDER BY COUNT(*) ASC LIMIT 1;
SELECT A.Abbreviation, A.Country FROM airlines A JOIN flights F ON A.uid = F.Airline GROUP BY A.uid, A.Abbreviation, A.Country ORDER BY COUNT(*) ASC LIMIT 1;
SELECT DISTINCT airlines.Airline FROM airlines JOIN flights ON airlines.uid = flights.Airline WHERE flights.SourceAirport = 'AHD'
SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'AHD';
SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.DestAirport = 'AHD';
SELECT A.Airline FROM airlines A JOIN flights F ON A.uid = F.Airline WHERE F.DestAirport = 'AHD'
SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f1 ON a.uid = f1.Airline JOIN flights AS f2 ON a.uid = f2.Airline WHERE f1.SourceAirport = 'APG' AND f2.SourceAirport = 'CVO';
SELECT A.Airline FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline WHERE F.SourceAirport = 'APG' INTERSECT SELECT A.Airline FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline WHERE F.SourceAirport = 'CVO';
SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG';
SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'CVO' EXCEPT SELECT DISTINCT a.Airline FROM airlines AS a JOIN flights AS f ON a.uid = f.Airline WHERE f.SourceAirport = 'APG';
SELECT A.Airline FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline GROUP BY A.uid, A.Airline HAVING COUNT(*) >= 10;
SELECT A.Airline, COUNT(*) AS NumberOfFlights FROM airlines AS A JOIN flights AS F ON A.uid = F.Airline GROUP BY A.uid HAVING COUNT(*) >= 10;
SELECT a.Airline FROM airlines a LEFT JOIN flights f ON a.uid = f.Airline GROUP BY a.uid HAVING COUNT(f.FlightNo) < 200;
SELECT A.Airline, COUNT(F.FlightNo) AS NumberOfFlights FROM airlines AS A LEFT JOIN flights AS F ON A.uid = F.Airline GROUP BY A.uid, A.Airline HAVING COUNT(F.FlightNo) < 200;
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = "United Airlines"
SELECT FlightNo FROM flights JOIN airlines ON flights.Airline = airlines.uid WHERE airlines.Airline = "United Airlines";
SELECT FlightNo FROM flights WHERE SourceAirport = "APG"
SELECT FlightNo FROM flights WHERE SourceAirport = "APG";
SELECT FlightNo FROM flights WHERE DestAirport = "APG"
SELECT FlightNo FROM flights WHERE DestAirport = 'APG'
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT FlightNo FROM flights JOIN airports ON flights.SourceAirport = airports.AirportCode WHERE airports.City = "Aberdeen";
SELECT f.FlightNo FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City = 'Aberdeen';
SELECT FlightNo FROM flights JOIN airports ON flights.DestAirport = airports.AirportCode WHERE airports.City = "Aberdeen"
SELECT count(*) FROM flights AS f JOIN airports AS a ON f.DestAirport = a.AirportCode WHERE a.City IN ('Aberdeen', 'Abilene')
SELECT count(*) FROM flights WHERE DestAirport = 'Aberdeen' OR DestAirport = 'Abilene'
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT AirportName FROM airports WHERE AirportCode NOT IN (SELECT SourceAirport FROM flights) AND AirportCode NOT IN (SELECT DestAirport FROM flights)
SELECT count(*) FROM employee
SELECT count(*) FROM employee;
SELECT Name FROM employee ORDER BY Age ASC
SELECT Name FROM employee ORDER BY Age ASC
SELECT City, COUNT(Employee_ID) AS Number_of_Employees FROM employee GROUP BY City
SELECT City, COUNT(*) AS NumberOfEmployees FROM employee GROUP BY City;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING COUNT(*) > 1;
SELECT City FROM employee WHERE Age < 30 GROUP BY City HAVING count(*) > 1
SELECT Location, COUNT(*) AS NumberOfShops FROM shop GROUP BY Location;
SELECT Location, COUNT(*) AS NumberOfShops FROM shop GROUP BY Location;
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT Manager_name, District FROM shop ORDER BY Number_products DESC LIMIT 1
SELECT min(Number_products), max(Number_products) FROM shop
SELECT min(Number_products), max(Number_products) FROM shop
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name, Location, District FROM shop ORDER BY Number_products DESC
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT Name FROM shop WHERE Number_products > (SELECT AVG(Number_products) FROM shop)
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT e.Name FROM employee e JOIN evaluation ev ON e.Employee_ID = ev.Employee_ID GROUP BY e.Employee_ID, e.Name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT E.Name FROM employee E JOIN evaluation EV ON E.Employee_ID = EV.Employee_ID ORDER BY EV.Bonus DESC LIMIT 1
SELECT T1.Name FROM employee AS T1 JOIN evaluation AS T2 ON T1.Employee_ID = T2.Employee_ID ORDER BY T2.Bonus DESC LIMIT 1
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT Name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)
SELECT s.Name FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1;
SELECT s.Name FROM shop AS s JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID ORDER BY COUNT(h.Employee_ID) DESC LIMIT 1;
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT Name FROM shop WHERE Shop_ID NOT IN (SELECT Shop_ID FROM hiring)
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop s JOIN hiring h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name;
SELECT s.Name, COUNT(h.Employee_ID) AS Number_of_Employees FROM shop AS s LEFT JOIN hiring AS h ON s.Shop_ID = h.Shop_ID GROUP BY s.Shop_ID, s.Name;
SELECT SUM(Bonus) FROM evaluation;
SELECT SUM(Bonus) FROM evaluation;
SELECT * FROM hiring
SELECT * FROM hiring
SELECT DISTINCT s1.District FROM shop AS s1 JOIN shop AS s2 ON s1.District = s2.District WHERE s1.Number_products < 3000 AND s2.Number_products > 10000
SELECT DISTINCT s.District FROM shop AS s WHERE s.Number_products < 3000 INTERSECT SELECT DISTINCT s.District FROM shop AS s WHERE s.Number_products > 10000
SELECT COUNT(DISTINCT Location) FROM shop;
SELECT count(DISTINCT Location) FROM shop
SELECT count(*) FROM Documents
SELECT count(*) FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_ID, Document_Name, Document_Description FROM Documents;
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE '%w%'
SELECT Document_Name, Template_ID FROM Documents WHERE Document_Description LIKE "%w%"
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = "Robbin CV"
SELECT Document_ID, Template_ID, Document_Description FROM Documents WHERE Document_Name = 'Robbin CV'
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT COUNT(DISTINCT Template_ID) FROM Documents
SELECT count(*) FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Code = 'PPT'
SELECT COUNT(*) FROM Documents AS d JOIN Templates AS t ON d.Template_ID = t.Template_ID WHERE t.Template_Type_Code = 'PPT';
SELECT Template_ID, COUNT(*) AS NumberOfDocuments FROM Templates LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Templates.Template_ID;
SELECT Template_ID, COUNT(*) AS Usage_Count FROM Documents GROUP BY Template_ID
SELECT T1.Template_ID, T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID GROUP BY T1.Template_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Template_ID, T2.Template_Type_Code FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code JOIN Documents AS T3 ON T1.Template_ID = T3.Template_ID GROUP BY T1.Template_ID, T2.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T.Template_ID FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID GROUP BY T.Template_ID HAVING COUNT(D.Document_ID) > 1;
SELECT Template_ID FROM Documents GROUP BY Template_ID HAVING COUNT(*) > 1
SELECT Template_ID FROM Templates EXCEPT SELECT Template_ID FROM Documents
SELECT Template_ID FROM Templates WHERE Template_ID NOT IN (SELECT Template_ID FROM Documents);
SELECT count(*) FROM Templates
SELECT count(*) FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates
SELECT Template_ID, Version_Number, Template_Type_Code FROM Templates;
SELECT distinct(Template_Type_Code) FROM Templates
SELECT DISTINCT Template_Type_Code FROM Ref_Template_Types;
SELECT Template_ID FROM Templates WHERE Template_Type_Code = 'PP' OR Template_Type_Code = 'PPT'
SELECT Template_ID FROM Templates WHERE Template_Type_Code IN ('PP', 'PPT')
SELECT count(*) FROM Templates WHERE Template_Type_Code = 'CV';
SELECT count(*) FROM Templates WHERE Template_Type_Code = 'CV'
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Version_Number, Template_Type_Code FROM Templates WHERE Version_Number > 5
SELECT Template_Type_Code, COUNT(*) AS NumberOfTemplates FROM Templates GROUP BY Template_Type_Code;
SELECT Template_Type_Code, COUNT(*) FROM Templates GROUP BY Template_Type_Code
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT Template_Type_Code FROM Templates GROUP BY Template_Type_Code HAVING COUNT(*) < 3
SELECT MIN(Version_Number), Template_Type_Code FROM Templates GROUP BY Template_Type_Code ORDER BY MIN(Version_Number) ASC LIMIT 1;
SELECT MIN(Templates.Version_Number) AS Lowest_Version_Number, Templates.Template_Type_Code FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code GROUP BY Templates.Template_Type_Code ORDER BY Lowest_Version_Number ASC LIMIT 1;
SELECT T1.Template_Type_Code FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID = T2.Template_ID WHERE T1.Document_Name = "Data base"
SELECT T1.Template_Type_Code FROM Templates AS T1 JOIN Documents AS T2 ON T1.Template_ID = T2.Template_ID WHERE T2.Document_Name = 'Data base';
SELECT Document_Name FROM Documents AS D JOIN Templates AS T ON D.Template_ID = T.Template_ID WHERE T.Template_Type_Code = 'BK'
SELECT Documents.Document_Name FROM Documents JOIN Templates ON Documents.Template_ID = Templates.Template_ID WHERE Templates.Template_Type_Code = 'BK';
SELECT Ref_Template_Types.Template_Type_Code, COUNT(Documents.Document_ID) AS NumberOfDocuments FROM Ref_Template_Types LEFT JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code LEFT JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Ref_Template_Types.Template_Type_Code;
SELECT RTT.Template_Type_Code, COUNT(D.Document_ID) AS Document_Count FROM Ref_Template_Types RTT LEFT JOIN Templates T ON RTT.Template_Type_Code = T.Template_Type_Code LEFT JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY RTT.Template_Type_Code;
SELECT Template_Type_Code FROM Templates JOIN Documents ON Templates.Template_ID = Documents.Template_ID GROUP BY Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T.Template_Type_Code FROM Templates T JOIN Documents D ON T.Template_ID = D.Template_ID GROUP BY T.Template_Type_Code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Template_Type_Code FROM Ref_Template_Types EXCEPT SELECT DISTINCT T.Template_Type_Code FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Code NOT IN (SELECT Template_Type_Code FROM Templates)
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Code, Template_Type_Description FROM Ref_Template_Types
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Description FROM Ref_Template_Types WHERE Template_Type_Code = 'AD'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = 'Book'
SELECT Template_Type_Code FROM Ref_Template_Types WHERE Template_Type_Description = "Book"
SELECT DISTINCT Ref_Template_Types.Template_Type_Description FROM Ref_Template_Types JOIN Templates ON Ref_Template_Types.Template_Type_Code = Templates.Template_Type_Code JOIN Documents ON Templates.Template_ID = Documents.Template_ID
SELECT DISTINCT T.Template_Details FROM Templates AS T JOIN Documents AS D ON T.Template_ID = D.Template_ID
SELECT Templates.Template_ID FROM Templates JOIN Ref_Template_Types ON Templates.Template_Type_Code = Ref_Template_Types.Template_Type_Code WHERE Ref_Template_Types.Template_Type_Description = 'Presentation';
SELECT Template_ID FROM Templates AS T1 JOIN Ref_Template_Types AS T2 ON T1.Template_Type_Code = T2.Template_Type_Code WHERE T2.Template_Type_Description = 'Presentation'
SELECT count(*) FROM Paragraphs;
SELECT count(*) FROM Paragraphs
SELECT COUNT(*) FROM Paragraphs AS p JOIN Documents AS d ON p.Document_ID = d.Document_ID WHERE d.Document_Name = 'Summer Show'
SELECT count(*) FROM Documents AS t1 JOIN Paragraphs AS t2 ON t1.Document_ID = t2.Document_ID WHERE t1.Document_Name = 'Summer Show'
SELECT Other_Details FROM Paragraphs WHERE Paragraph_Text = "Korea ";
SELECT Paragraph_Text, Other_Details FROM Paragraphs WHERE Paragraph_Text LIKE '%Korea%'
SELECT Paragraph_ID, Paragraph_Text FROM Paragraphs JOIN Documents ON Paragraphs.Document_ID = Documents.Document_ID WHERE Documents.Document_Name = 'Welcome to NY'
SELECT T2.Paragraph_ID, T2.Paragraph_Text FROM Documents AS T1 JOIN Paragraphs AS T2 ON T1.Document_ID = T2.Document_ID WHERE T1.Document_Name = 'Welcome to NY';
SELECT Paragraph_Text FROM Paragraphs AS P JOIN Documents AS D ON P.Document_ID = D.Document_ID WHERE D.Document_Name = 'Customer reviews'
SELECT Paragraph_Text FROM Paragraphs AS T1 JOIN Documents AS T2 ON T1.Document_ID = T2.Document_ID WHERE T2.Document_Name = 'Customer reviews'
SELECT Documents.Document_ID, COUNT(Paragraphs.Paragraph_ID) AS NumberOfParagraphs FROM Documents LEFT JOIN Paragraphs ON Documents.Document_ID = Paragraphs.Document_ID GROUP BY Documents.Document_ID ORDER BY Documents.Document_ID
SELECT D.Document_ID, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents AS D LEFT JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID ORDER BY D.Document_ID;
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents AS D LEFT JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name;
SELECT D.Document_ID, D.Document_Name, COUNT(P.Paragraph_ID) AS NumberOfParagraphs FROM Documents AS D LEFT JOIN Paragraphs AS P ON D.Document_ID = P.Document_ID GROUP BY D.Document_ID, D.Document_Name;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) >= 2
SELECT D1.Document_ID FROM Documents AS D1 JOIN Paragraphs AS P1 ON D1.Document_ID = P1.Document_ID GROUP BY D1.Document_ID HAVING COUNT(P1.Paragraph_ID) >= 2
SELECT d.Document_ID, d.Document_Name FROM Documents AS d JOIN Paragraphs AS p ON d.Document_ID = p.Document_ID GROUP BY d.Document_ID, d.Document_Name ORDER BY COUNT(p.Paragraph_ID) DESC LIMIT 1;
SELECT D1.Document_ID, D1.Document_Name FROM Documents AS D1 JOIN Paragraphs AS P1 ON D1.Document_ID = P1.Document_ID GROUP BY D1.Document_ID, D1.Document_Name ORDER BY COUNT(P1.Paragraph_ID) DESC LIMIT 1;
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_ID FROM Documents AS D JOIN (SELECT Document_ID, COUNT(*) AS ParagraphCount FROM Paragraphs GROUP BY Document_ID) AS P ON D.Document_ID = P.Document_ID WHERE P.ParagraphCount BETWEEN 1 AND 2
SELECT Document_ID FROM Paragraphs GROUP BY Document_ID HAVING COUNT(*) BETWEEN 1 AND 2
SELECT DISTINCT d1.Document_ID FROM Paragraphs AS p1 JOIN Documents AS d1 ON p1.Document_ID = d1.Document_ID WHERE p1.Paragraph_Text LIKE '%Brazil%' AND EXISTS ( SELECT 1 FROM Paragraphs AS p2 WHERE p2.Document_ID = p1.Document_ID AND p2.Paragraph_Text LIKE '%Ireland%' );
SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Brazil' INTERSECT SELECT Document_ID FROM Paragraphs WHERE Paragraph_Text = 'Ireland';
SELECT count(*) FROM teacher
SELECT count(*) FROM teacher
SELECT Name FROM teacher ORDER BY Age ASC
SELECT Name FROM teacher ORDER BY Age ASC;
SELECT Age, Hometown FROM teacher
SELECT Age, Hometown FROM teacher
SELECT Name FROM teacher WHERE Hometown != 'Little Lever Urban District'
SELECT Name FROM teacher WHERE Hometown != "Little Lever Urban District"
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33';
SELECT Name FROM teacher WHERE Age = '32' OR Age = '33'
SELECT Hometown FROM teacher ORDER BY Age ASC LIMIT 1;
SELECT Hometown FROM teacher WHERE Age = (SELECT MIN(Age) FROM teacher)
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown, COUNT(*) FROM teacher GROUP BY Hometown
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1
SELECT Hometown, COUNT(*) AS NumberOfTeachers FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT Hometown, COUNT(*) AS NumberOfTeachers FROM teacher GROUP BY Hometown HAVING COUNT(*) >= 2
SELECT T.Name, C.Course FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID
SELECT T2.Name, T1.Course FROM course AS T1 JOIN course_arrange AS T3 ON T1.Course_ID = T3.Course_ID JOIN teacher AS T2 ON T3.Teacher_ID = T2.Teacher_ID
SELECT t.Name, c.Course FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID JOIN course c ON ca.Course_ID = c.Course_ID ORDER BY t.Name ASC;
SELECT T.teacher.Name, C.Course FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID ORDER BY T.Name ASC;
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID WHERE C.Course = 'Math'
SELECT T.Name FROM teacher AS T JOIN course_arrange AS CA ON T.Teacher_ID = CA.Teacher_ID JOIN course AS C ON CA.Course_ID = C.Course_ID WHERE C.Course = 'Math'
SELECT t.Name, COUNT(c.Course_ID) AS NumberOfCourses FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name;
SELECT t.Name, COUNT(ca.Course_ID) AS NumberOfCourses FROM teacher AS t JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID, t.Name;
SELECT t.Name FROM teacher t JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID HAVING COUNT(ca.Course_ID) >= 2;
SELECT t.Name FROM teacher AS t JOIN course_arrange AS ca ON t.Teacher_ID = ca.Teacher_ID GROUP BY t.Teacher_ID HAVING COUNT(ca.Course_ID) >= 2;
SELECT t.Name FROM teacher t LEFT JOIN course_arrange ca ON t.Teacher_ID = ca.Teacher_ID WHERE ca.Course_ID IS NULL;
SELECT Name FROM teacher WHERE Teacher_ID NOT IN (SELECT Teacher_ID FROM course_arrange)
SELECT COUNT(*) FROM visitor WHERE Age < 30;
SELECT Name FROM visitor WHERE Level_of_membership > 4 ORDER BY Level_of_membership DESC
SELECT avg(Age) FROM visitor WHERE Level_of_membership <= 4
SELECT Name, Level_of_membership FROM visitor WHERE Level_of_membership > 4 ORDER BY Age DESC;
SELECT Museum_ID, Name FROM museum ORDER BY Num_of_Staff DESC LIMIT 1;
SELECT avg(Num_of_Staff) FROM museum WHERE Open_Year < '2009'
SELECT Open_Year, Num_of_Staff FROM museum WHERE Name = "Plaza Museum"
SELECT Name FROM museum WHERE Num_of_Staff > (SELECT min(Num_of_Staff) FROM museum WHERE Open_Year > '2010')
SELECT V.ID, V.Name, V.Age FROM visitor V JOIN visit VT ON V.ID = VT.visitor_ID GROUP BY VT.visitor_ID, VT.Museum_ID HAVING COUNT(*) > 1
SELECT v.ID, v.Name, v.Level_of_membership FROM visitor v JOIN visit vt ON v.ID = vt.visitor_ID GROUP BY v.ID, v.Name, v.Level_of_membership ORDER BY SUM(vt.Total_spent) DESC LIMIT 1;
SELECT M.Museum_ID, M.Name FROM museum AS M JOIN visit AS V ON M.Museum_ID = V.Museum_ID GROUP BY M.Museum_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Name FROM museum WHERE Museum_ID NOT IN (SELECT Museum_ID FROM visit)
SELECT T1.Name, T1.Age FROM visitor AS T1 JOIN visit AS T2 ON T1.ID = T2.visitor_ID ORDER BY T2.Num_of_Ticket DESC LIMIT 1;
SELECT avg(Num_of_Ticket), max(Num_of_Ticket) FROM visit
SELECT SUM(v.Total_spent) AS Total_Ticket_Expense FROM visitor AS vis JOIN visit AS v ON vis.ID = v.visitor_ID WHERE vis.Level_of_membership = 1;
SELECT DISTINCT v.Name FROM visitor AS v JOIN visit AS vi ON v.ID = vi.visitor_ID JOIN museum AS m ON vi.Museum_ID = m.Museum_ID WHERE m.Open_Year < '2009' AND v.ID IN ( SELECT vi2.visitor_ID FROM visit AS vi2 JOIN museum AS m2 ON vi2.Museum_ID = m2.Museum_ID WHERE m2.Open_Year > '2011' )
SELECT count(*) FROM visitor WHERE ID NOT IN ( SELECT visitor_ID FROM visit AS V JOIN museum AS M ON V.Museum_ID = M.Museum_ID WHERE M.Open_Year > '2010' )
SELECT count(*) FROM museum WHERE Open_Year > '2013' OR Open_Year < '2008'
SELECT count(*) FROM players
SELECT count(*) FROM players;
SELECT count(*) FROM matches
SELECT count(*) FROM matches
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE country_code = 'USA'
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches;
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches;
SELECT AVG(winner_rank) AS average_winner_rank FROM matches;
SELECT AVG(winner_rank) AS average_winner_rank FROM matches;
SELECT MIN(loser_rank) AS highest_loser_rank FROM matches;
SELECT MIN(loser_rank) AS Best_Loser_Rank FROM matches;
SELECT count(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT count(DISTINCT loser_name) FROM matches
SELECT count(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(match_num) > 10;
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING count(*) > 10
SELECT winner_name FROM matches WHERE year = 2016 INTERSECT SELECT winner_name FROM matches WHERE year = 2013
SELECT p.first_name, p.last_name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.year = 2013 INTERSECT SELECT p.first_name, p.last_name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.year = 2016;
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016);
SELECT count(*) FROM matches WHERE year IN (2013, 2016);
SELECT DISTINCT p.country_code, p.first_name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.tourney_name = 'WTA Championships' INTERSECT SELECT p.country_code, p.first_name FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open';
SELECT DISTINCT p.first_name, p.country_code FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id WHERE m.tourney_name IN ('WTA Championships', 'Australian Open') GROUP BY p.player_id HAVING COUNT(DISTINCT m.tourney_name) = 2;
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date ASC LIMIT 1;
SELECT first_name, last_name FROM players ORDER BY birth_date ASC
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date;
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'L' ORDER BY birth_date ASC;
SELECT p.first_name, p.country_code FROM players AS p JOIN rankings AS r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY COUNT(r.tours) DESC LIMIT 1;
SELECT p.first_name, p.country_code FROM players AS p JOIN rankings AS r ON p.player_id = r.player_id GROUP BY p.player_id ORDER BY SUM(r.tours) DESC LIMIT 1;
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT year FROM matches GROUP BY year ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.first_name, p.last_name, r.ranking_points FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id JOIN rankings AS r ON p.player_id = r.player_id GROUP BY p.player_id, r.ranking_points ORDER BY COUNT(m.winner_id) DESC LIMIT 1;
sql placeholer
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT p.first_name, p.last_name, m.winner_rank_points FROM players p JOIN matches m ON p.player_id = m.winner_id WHERE m.tourney_name = 'Australian Open' ORDER BY m.winner_rank_points DESC LIMIT 1;
SELECT m.loser_name, m.winner_name FROM matches m ORDER BY m.minutes DESC LIMIT 1;
SELECT m.winner_name, m.loser_name FROM matches m ORDER BY m.minutes DESC LIMIT 1;
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name;
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.player_id, p.first_name;
SELECT country_code, COUNT(*) AS number_of_players FROM players GROUP BY country_code;
SELECT country_code, COUNT(*) AS number_of_players FROM players GROUP BY country_code;
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT country_code FROM players GROUP BY country_code HAVING count(*) > 50
SELECT ranking_date, SUM(tours) AS total_tours FROM rankings GROUP BY ranking_date;
SELECT ranking_date, SUM(tours) FROM rankings GROUP BY ranking_date;
SELECT year, COUNT(*) AS total_matches FROM matches GROUP BY year
SELECT year, COUNT(*) AS total_matches FROM matches GROUP BY year ORDER BY year;
SELECT p.first_name, p.last_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY p.birth_date DESC LIMIT 3;
SELECT p.first_name, p.last_name, m.winner_rank FROM players p JOIN matches m ON p.player_id = m.winner_id ORDER BY m.winner_age LIMIT 3;
SELECT COUNT(DISTINCT winner_id) FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L';
SELECT count(*) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'
SELECT p.first_name, p.country_code, p.birth_date FROM players AS p JOIN matches AS m ON p.player_id = m.winner_id ORDER BY m.winner_rank_points DESC LIMIT 1;
SELECT p.first_name, p.country_code, p.birth_date FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id ORDER BY SUM(m.winner_rank_points) DESC LIMIT 1;
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand;
SELECT hand, COUNT(*) AS number_of_players FROM players GROUP BY hand;
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC
SELECT name, date, result FROM battle;
SELECT S.lost_in_battle AS Battle_ID, max(Total_Deaths) AS Maximum_Death_Toll, min(Total_Deaths) AS Minimum_Death_Toll FROM (SELECT caused_by_ship_id, SUM(killed) AS Total_Deaths FROM death GROUP BY caused_by_ship_id) AS D JOIN ship AS S ON D.caused_by_ship_id = S.id GROUP BY S.lost_in_battle;
SELECT AVG(death.injured) AS average_injuries FROM death JOIN ship ON death.caused_by_ship_id = ship.id;
SELECT d.killed, d.injured, s.name AS ship_name FROM death AS d JOIN ship AS s ON d.caused_by_ship_id = s.id WHERE s.tonnage = 't';
SELECT name, result FROM battle WHERE bulgarian_commander != 'Boril'
SELECT DISTINCT battle.id, battle.name FROM battle JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'Brig'
SELECT B.id, B.name FROM battle B JOIN ship S ON B.id = S.lost_in_battle JOIN death D ON S.id = D.caused_by_ship_id GROUP BY B.id, B.name HAVING SUM(D.killed) > 10
SELECT T1.id, T1.name FROM ship AS T1 JOIN death AS T2 ON T1.id = T2.caused_by_ship_id GROUP BY T1.id ORDER BY SUM(T2.injured) DESC LIMIT 1;
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' AND latin_commander = 'Baldwin I'
SELECT count(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE id NOT IN ( SELECT lost_in_battle FROM ship WHERE tonnage = '225' )
SELECT b.name, b.date FROM battle b JOIN ship s1 ON b.id = s1.lost_in_battle JOIN ship s2 ON b.id = s2.lost_in_battle WHERE s1.name = 'Lettice' AND s2.name = 'HMS Atalanta';
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle WHERE s.id IS NULL OR s.location != 'English Channel'
SELECT note FROM death WHERE note LIKE "%East%"
SELECT line_1, line_2 FROM Addresses;
SELECT line_1, line_2 FROM Addresses;
SELECT count(*) FROM Courses
SELECT count(*) FROM Courses
SELECT course_description FROM Courses WHERE course_name = "Math";
SELECT `course_description` FROM `Courses` WHERE `course_name` LIKE '%math%';
SELECT zip_postcode FROM Addresses WHERE city = "Port Chelsea";
SELECT `zip_postcode` FROM `Addresses` WHERE `city` = "Port Chelsea"
SELECT D.department_name, D.department_id, COUNT(DP.degree_program_id) AS number_of_degrees FROM Departments AS D JOIN Degree_Programs AS DP ON D.department_id = DP.department_id GROUP BY D.department_id, D.department_name ORDER BY number_of_degrees DESC LIMIT 1;
SELECT D.department_id, D.department_name FROM Departments AS D JOIN Degree_Programs AS DP ON D.department_id = DP.department_id GROUP BY D.department_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs;
SELECT COUNT(DISTINCT department_id) FROM Degree_Programs;
SELECT count(DISTINCT degree_summary_name) FROM Degree_Programs
SELECT COUNT(DISTINCT degree_program_id) FROM Degree_Programs;
SELECT COUNT(*) AS number_of_degrees FROM Degree_Programs dp JOIN Departments d ON dp.department_id = d.department_id WHERE d.department_name = 'Engineering';
SELECT COUNT(*) FROM Degree_Programs AS dp JOIN Departments AS d ON dp.department_id = d.department_id WHERE d.department_name = 'Engineering'
SELECT section_name, section_description FROM Sections;
SELECT section_name, section_description FROM Sections;
SELECT C.course_id, C.course_name FROM Courses C LEFT JOIN Sections S ON C.course_id = S.course_id GROUP BY C.course_id HAVING COUNT(S.section_id) <= 2;
SELECT C.course_id, C.course_name FROM Courses C LEFT JOIN Sections S ON C.course_id = S.course_id GROUP BY C.course_id HAVING COUNT(S.section_id) < 2;
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT section_name FROM Sections ORDER BY section_name DESC
SELECT S.semester_id, S.semester_name, COUNT(*) AS total_students FROM Semesters AS S JOIN Student_Enrolment AS SE ON S.semester_id = SE.semester_id GROUP BY S.semester_id, S.semester_name ORDER BY total_students DESC LIMIT 1;
SELECT S.semester_id, S.semester_name, COUNT(DISTINCT SE.student_id) AS total_students FROM Semesters S JOIN Student_Enrolment SE ON S.semester_id = SE.semester_id GROUP BY S.semester_id, S.semester_name ORDER BY total_students DESC LIMIT 1;
SELECT department_description FROM Departments WHERE department_name LIKE "%computer%"
SELECT department_description FROM Departments WHERE department_name LIKE '%computer%'
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, SE.semester_id, COUNT(DISTINCT SE.degree_program_id) AS num_degree_programs FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id GROUP BY S.student_id, SE.semester_id HAVING num_degree_programs = 2;
SELECT S.student_id, S.first_name, S.middle_name, S.last_name, COUNT(DISTINCT SE.degree_program_id) AS num_degree_programs FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id GROUP BY S.student_id, SE.semester_id HAVING COUNT(DISTINCT SE.degree_program_id) = 2;
SELECT S.first_name, S.middle_name, S.last_name FROM Students AS S JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id JOIN Degree_Programs AS DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name LIKE '%Bachelor%'
SELECT S.first_name, S.middle_name, S.last_name FROM Students S JOIN Student_Enrolment SE ON S.student_id = SE.student_id JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id WHERE DP.degree_summary_name LIKE '%Bachelors%';
SELECT DP.degree_summary_name FROM Student_Enrolment SE JOIN Degree_Programs DP ON SE.degree_program_id = DP.degree_program_id GROUP BY DP.degree_summary_name ORDER BY COUNT(SE.student_id) DESC LIMIT 1;
SELECT D.degree_summary_name FROM Degree_Programs AS D JOIN Student_Enrolment AS SE ON D.degree_program_id = SE.degree_program_id GROUP BY D.degree_program_id, D.degree_summary_name ORDER BY COUNT(SE.student_id) DESC LIMIT 1;
SELECT Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name FROM Degree_Programs JOIN Student_Enrolment ON Degree_Programs.degree_program_id = Student_Enrolment.degree_program_id GROUP BY Degree_Programs.degree_program_id, Degree_Programs.degree_summary_name ORDER BY COUNT(Student_Enrolment.student_id) DESC LIMIT 1;
SELECT DP.degree_program_id, DP.degree_summary_name FROM Degree_Programs AS DP JOIN Student_Enrolment AS SE ON DP.degree_program_id = SE.degree_program_id GROUP BY DP.degree_program_id, DP.degree_summary_name ORDER BY COUNT(SE.student_id) DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(se.student_id) AS number_of_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY number_of_enrollments DESC LIMIT 1;
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS number_of_enrollments FROM Students s JOIN Student_Enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY number_of_enrollments DESC LIMIT 1;
SELECT semester_name FROM Semesters WHERE semester_id NOT IN ( SELECT DISTINCT semester_id FROM Student_Enrolment );
SELECT S.semester_name FROM Semesters AS S LEFT JOIN Student_Enrolment AS SE ON S.semester_id = SE.semester_id WHERE SE.student_id IS NULL
SELECT DISTINCT Courses.course_name FROM Courses JOIN Student_Enrolment_Courses ON Courses.course_id = Student_Enrolment_Courses.course_id
SELECT DISTINCT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id;
SELECT C.course_name FROM Courses AS C JOIN Student_Enrolment_Courses AS SEC ON C.course_id = SEC.course_id GROUP BY C.course_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT C.course_name FROM Courses C JOIN Student_Enrolment_Courses SEC ON C.course_id = SEC.course_id JOIN Student_Enrolment SE ON SEC.student_enrolment_id = SE.student_enrolment_id GROUP BY C.course_name ORDER BY COUNT(SE.student_id) DESC LIMIT 1;
SELECT DISTINCT S.last_name FROM Students AS S JOIN Addresses AS A ON S.current_address_id = A.address_id LEFT JOIN Student_Enrolment AS SE ON S.student_id = SE.student_id WHERE A.state_province_county = 'North Carolina' AND SE.student_id IS NULL;
SELECT DISTINCT s.last_name FROM Students s JOIN Addresses a ON s.current_address_id = a.address_id LEFT JOIN Student_Enrolment se ON s.student_id = se.student_id WHERE a.state_province_county = 'North Carolina' AND se.student_id IS NULL;
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id HAVING COUNT(TC.student_course_id) >= 2;
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date HAVING COUNT(TC.student_course_id) >= 2;
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT cell_mobile_number FROM Students WHERE first_name = 'Timmothy' AND last_name = 'Ward';
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM Students ORDER BY date_first_registered ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1;
SELECT first_name, middle_name, last_name FROM Students WHERE date_left IS NOT NULL ORDER BY date_left ASC LIMIT 1;
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id;
SELECT first_name FROM Students WHERE current_address_id != permanent_address_id;
SELECT Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.line_3 FROM Students JOIN Addresses ON Students.current_address_id = Addresses.address_id GROUP BY Addresses.address_id, Addresses.line_1, Addresses.line_2, Addresses.line_3 ORDER BY COUNT(Students.student_id) DESC LIMIT 1;
SELECT A.address_id, A.line_1, A.line_2, COUNT(*) AS student_count FROM Addresses AS A JOIN Students AS S ON A.address_id = S.current_address_id GROUP BY A.address_id ORDER BY student_count DESC LIMIT 1;
SELECT AVG(transcript_date) FROM Transcripts
SELECT FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(transcript_date))) AS average_transcript_date FROM Transcripts;
SELECT transcript_date, other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT MIN(transcript_date) AS earliest_transcript_date, other_details FROM Transcripts;
SELECT count(*) FROM Transcripts;
SELECT count(*) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT MAX(transcript_date) FROM Transcripts
SELECT student_course_id, COUNT(*) AS times_in_transcripts FROM Transcript_Contents GROUP BY student_course_id ORDER BY times_in_transcripts DESC LIMIT 1;
SELECT student_course_id, COUNT(transcript_id) AS transcript_count FROM Transcript_Contents GROUP BY student_course_id ORDER BY transcript_count DESC LIMIT 1;
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id, T.transcript_date ORDER BY COUNT(TC.student_course_id) ASC LIMIT 1;
SELECT T.transcript_id, T.transcript_date FROM Transcripts AS T JOIN Transcript_Contents AS TC ON T.transcript_id = TC.transcript_id GROUP BY T.transcript_id ORDER BY COUNT(TC.student_course_id) ASC LIMIT 1;
sql placeholder
SELECT DISTINCT s.semester_id FROM Semesters s JOIN Student_Enrolment se ON s.semester_id = se.semester_id JOIN Degree_Programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name IN ('Masters', 'Bachelors') GROUP BY s.semester_id HAVING COUNT(DISTINCT dp.degree_summary_name) = 2;
SELECT count(DISTINCT current_address_id) FROM Students;
SELECT DISTINCT a.line_1, a.line_2, a.line_3, a.city, a.zip_postcode, a.state_province_county, a.country FROM Addresses AS a JOIN Students AS s ON a.address_id = s.current_address_id UNION SELECT DISTINCT a.line_1, a.line_2, a.line_3, a.city, a.zip_postcode, a.state_province_county, a.country FROM Addresses AS a JOIN Students AS s ON a.address_id = s.permanent_address_id;
SELECT * FROM Students ORDER BY first_name DESC, middle_name DESC, last_name DESC
SELECT other_student_details FROM Students ORDER BY other_student_details DESC
SELECT section_id, course_id, section_name, section_description, other_details FROM Sections WHERE section_name = 'h';
SELECT section_description FROM Sections WHERE section_name = "h";
SELECT DISTINCT s.first_name FROM Students AS s JOIN Addresses AS a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' OR s.cell_mobile_number = '09700166582';
SELECT DISTINCT S.first_name FROM Students AS S JOIN Addresses AS A ON S.permanent_address_id = A.address_id WHERE A.country = 'Haiti' OR S.cell_mobile_number = '09700166582';
SELECT Title FROM Cartoon ORDER BY Title ASC
SELECT Title FROM Cartoon ORDER BY Title ASC;
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones"
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones'
SELECT count(*) FROM Cartoon WHERE Written_by = "Joseph Kuhr"
SELECT COUNT(*) FROM Cartoon WHERE Written_by = 'Joseph Kuhr';
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title, Directed_by FROM Cartoon ORDER BY Original_air_date
SELECT Title FROM Cartoon WHERE Directed_by = "Ben Jones" OR Directed_by = "Brandon Vietti";
SELECT Title FROM Cartoon WHERE Directed_by = 'Ben Jones' OR Directed_by = 'Brandon Vietti'
SELECT Country, COUNT(*) AS NumberOfTVChannels FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Country, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Country ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name) AS number_of_series, COUNT(DISTINCT Content) AS number_of_contents FROM TV_Channel
SELECT 'Series Count' AS Type, count(DISTINCT series_name) AS Count FROM TV_Channel UNION SELECT 'Content Count' AS Type, count
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Content FROM TV_Channel WHERE series_name = "Sky Radio";
SELECT Package_Option FROM TV_Channel WHERE series_name = "Sky Radio"
SELECT Package_Option FROM TV_Channel WHERE series_name = 'Sky Radio';
SELECT COUNT(*) FROM TV_Channel WHERE Language = 'English'
SELECT count(*) FROM TV_Channel WHERE Language = 'English';
SELECT Language, COUNT(*) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY Channel_Count ASC LIMIT 1;
SELECT Language, COUNT(id) AS Channel_Count FROM TV_Channel GROUP BY Language ORDER BY COUNT(id) ASC LIMIT 1;
SELECT Language, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Language;
SELECT Language, COUNT(*) AS NumberOfChannels FROM TV_Channel GROUP BY Language;
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = "The Rise of the Blue Beetle!"
SELECT T2.series_name FROM Cartoon AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T1.Title = "The Rise of the Blue Beetle"
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS T ON C.Channel = T.id WHERE T.series_name = "Sky Radio";
SELECT C.Title FROM Cartoon AS C JOIN TV_Channel AS T ON C.Channel = T.id WHERE T.series_name = 'Sky Radio';
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode FROM TV_series ORDER BY Rating
SELECT Episode, Rating FROM TV_series ORDER BY Rating DESC LIMIT 3;
SELECT T1.Episode, T1.Rating FROM TV_series AS T1 ORDER BY T1.Rating DESC LIMIT 3
SELECT MIN(Share) AS Min_Share, MAX(Share) AS Max_Share FROM TV_series;
SELECT max(Share) , min(Share) FROM TV_series
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Air_Date FROM TV_series WHERE Episode = "A Love of a Lifetime";
SELECT Weekly_Rank FROM TV_series WHERE Episode = "A Love of a Lifetime"
SELECT Weekly_Rank FROM TV_series WHERE Episode = 'A Love of a Lifetime'
SELECT T1.series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = "A Love of a Lifetime";
SELECT series_name FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T2.Episode = 'A Love of a Lifetime'
SELECT T1.Episode FROM TV_series AS T1 JOIN TV_Channel AS T2 ON T1.Channel = T2.id WHERE T2.series_name = "Sky Radio"
SELECT T2.Episode FROM TV_Channel AS T1 JOIN TV_series AS T2 ON T1.id = T2.Channel WHERE T1.series_name = "Sky Radio"
SELECT Directed_by, COUNT(*) AS Number_of_Cartoons FROM Cartoon GROUP BY Directed_by
SELECT Directed_by, COUNT(*) AS NumberOfCartoons FROM Cartoon GROUP BY Directed_by
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1
SELECT Production_code, Channel FROM Cartoon ORDER BY Original_air_date DESC LIMIT 1;
SELECT Package_Option, series_name FROM TV_Channel WHERE Hight_definition_TV = 'Yes'
SELECT TV_Channel.Package_Option, TV_series.series_name FROM TV_Channel JOIN TV_series ON TV_Channel.id = TV_series.Channel WHERE TV_Channel.Hight_definition_TV = 'Yes';
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = 'Todd Casey';
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Written_by = "Todd Casey";
SELECT DISTINCT T1.Country FROM TV_Channel AS T1 WHERE T1.id NOT IN ( SELECT T2.Channel FROM Cartoon AS T2 WHERE T2.Written_by = 'Todd Casey' );
SELECT Country FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Written_by = 'Todd Casey')
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by IN ("Ben Jones", "Michael Chang")
SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones' INTERSECT SELECT T1.series_name, T1.Country FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Michael Chang';
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != "English"
SELECT Pixel_aspect_ratio_PAR, Country FROM TV_Channel WHERE Language != 'English'
SELECT Country, COUNT(id) AS ChannelCount FROM TV_Channel GROUP BY Country HAVING COUNT(id) > 2;
SELECT Channel FROM TV_series GROUP BY Channel HAVING COUNT(*) > 2;
SELECT id FROM TV_Channel EXCEPT SELECT T1.id FROM TV_Channel AS T1 JOIN Cartoon AS T2 ON T1.id = T2.Channel WHERE T2.Directed_by = 'Ben Jones'
SELECT id FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT Package_Option FROM TV_Channel WHERE id NOT IN (SELECT Channel FROM Cartoon WHERE Directed_by = 'Ben Jones')
SELECT count(*) FROM poker_player;
SELECT count(*) FROM poker_player
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Earnings FROM poker_player ORDER BY Earnings DESC
SELECT Final_Table_Made, Best_Finish FROM poker_player
SELECT T1.Final_Table_Made, T1.Best_Finish FROM poker_player AS T1
SELECT avg(Earnings) FROM poker_player;
SELECT avg(Earnings) FROM poker_player
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT Money_Rank FROM poker_player ORDER BY Earnings DESC LIMIT 1
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000;
SELECT max(Final_Table_Made) FROM poker_player WHERE Earnings < 200000
SELECT T2.Name FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID;
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID;
SELECT p.Name FROM poker_player AS pp JOIN people AS p ON pp.People_ID = p.People_ID WHERE pp.Earnings > 300000;
SELECT P.name FROM people AS P JOIN poker_player AS PP ON P.People_ID = PP.People_ID WHERE PP.Earnings > 300000
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Final_Table_Made ASC;
SELECT P.Name FROM people AS P JOIN poker_player AS PP ON P.People_ID = PP.People_ID ORDER BY PP.Final_Table_Made ASC
SELECT P.Birth_Date FROM people P JOIN poker_player PP ON P.People_ID = PP.People_ID ORDER BY PP.Earnings ASC LIMIT 1;
SELECT P.Birth_Date FROM people AS P JOIN poker_player AS PP ON P.People_ID = PP.People_ID ORDER BY PP.Earnings ASC LIMIT 1;
SELECT T1.Money_Rank FROM poker_player AS T1 JOIN people AS T2 ON T1.People_ID = T2.People_ID ORDER BY T2.Height DESC LIMIT 1;
SELECT p.Money_Rank FROM poker_player AS p JOIN people AS pe ON p.People_ID = pe.People_ID ORDER BY pe.Height DESC LIMIT 1;
SELECT AVG(poker_player.Earnings) AS Average_Earnings FROM poker_player JOIN people ON poker_player.People_ID = people.People_ID WHERE people.Height > 200;
SELECT AVG(p.Earnings) FROM poker_player AS p JOIN people AS pe ON p.People_ID = pe.People_ID WHERE pe.Height > 200;
SELECT P.Name FROM poker_player P JOIN people Pe ON P.People_ID = Pe.People_ID ORDER BY P.Earnings DESC
SELECT p.Name FROM poker_player pp JOIN people p ON pp.People_ID = p.People_ID ORDER BY pp.Earnings DESC;
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM people GROUP BY Nationality;
SELECT Nationality, COUNT(*) AS NumberOfPeople FROM people GROUP BY Nationality;
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Nationality FROM people GROUP BY Nationality HAVING count(*) >= 2
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name, Birth_Date FROM people ORDER BY Name ASC
SELECT Name FROM people WHERE Nationality != "Russia"
SELECT Name FROM people WHERE Nationality != 'Russia'
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT Name FROM people WHERE People_ID NOT IN (SELECT People_ID FROM poker_player)
SELECT COUNT(DISTINCT Nationality) FROM people;
SELECT count(DISTINCT Nationality) FROM people
SELECT COUNT(DISTINCT state) FROM AREA_CODE_STATE;
SELECT contestant_number, contestant_name FROM CONTESTANTS ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM VOTES
SELECT max(area_code), min(area_code) FROM AREA_CODE_STATE
SELECT MAX(created) FROM VOTES WHERE state = 'CA';
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name != 'Jessie Alloway'
SELECT DISTINCT state, created FROM VOTES;
SELECT C.contestant_number, C.contestant_name FROM CONTESTANTS AS C JOIN VOTES AS V ON C.contestant_number = V.contestant_number GROUP BY C.contestant_number, C.contestant_name HAVING COUNT(V.vote_id) >= 2;
SELECT T1.contestant_number, T1.contestant_name FROM CONTESTANTS AS T1 JOIN VOTES AS T2 ON T1.contestant_number = T2.contestant_number GROUP BY T1.contestant_number, T1.contestant_name ORDER BY COUNT(T2.vote_id) ASC LIMIT 1;
SELECT count(*) FROM VOTES WHERE state IN ('NY', 'CA')
SELECT count(*) FROM CONTESTANTS WHERE contestant_number NOT IN (SELECT contestant_number FROM VOTES)
SELECT SUBSTRING(phone_number, 1, 3) AS area_code, COUNT(*) AS vote_count FROM VOTES GROUP BY area_code ORDER BY vote_count DESC LIMIT 1;
SELECT V.created, V.state, V.phone_number FROM VOTES AS V JOIN CONTESTANTS AS C ON V.contestant_number = C.contestant_number WHERE C.contestant_name = 'Tabatha Gehling';
SELECT area_code FROM VOTES JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state WHERE contestant_number = ( SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Tabatha Gehling' ) INTERSECT SELECT area_code FROM VOTES JOIN AREA_CODE_STATE ON VOTES.state = AREA_CODE_STATE.state WHERE contestant_number = ( SELECT contestant_number FROM CONTESTANTS WHERE contestant_name = 'Kelly Clauss' );
SELECT contestant_name FROM CONTESTANTS WHERE contestant_name LIKE "%Al%"
SELECT Name FROM country WHERE IndepYear > 1950
SELECT Name FROM country WHERE IndepYear > 1950
SELECT count(*) FROM country WHERE GovernmentForm LIKE "%Republic%"
SELECT count(*) FROM country WHERE GovernmentForm LIKE '%republic%'
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean';
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Region = 'Caribbean';
SELECT `Continent` FROM `country` WHERE `Name` = 'Anguilla';
SELECT T1.Continent FROM country AS T1 JOIN city AS T2 ON T1.Code = T2.CountryCode WHERE T2.Name = "Anguilla";
SELECT `Region` FROM `city` JOIN `country` ON city.CountryCode = country.Code WHERE city.Name = 'Kabul'
SELECT `Region` FROM `city` JOIN `country` ON city.CountryCode = country.Code WHERE city.Name = "Kabul";
SELECT Language FROM countrylanguage WHERE CountryCode = 'ABW' ORDER BY Percentage DESC LIMIT 1;
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba') AND IsOfficial = 'T'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Population, LifeExpectancy FROM country WHERE Name = 'Brazil'
SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT Region, Population FROM country WHERE Name = 'Angola';
SELECT AVG(LifeExpectancy) FROM country WHERE Region = 'Central Africa';
SELECT AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country WHERE Region = 'Central Africa';
SELECT `Name` FROM `country` WHERE `Continent` = 'Asia' ORDER BY `LifeExpectancy` ASC LIMIT 1
SELECT Name FROM country WHERE Continent = 'Asia' ORDER BY LifeExpectancy ASC LIMIT 1;
SELECT SUM(Population) AS TotalPopulation, MAX(GNP) AS MaxGNP FROM country WHERE Continent = 'Asia';
SELECT SUM(Population) AS TotalPopulation, MAX(GNP) AS LargestGNP FROM country WHERE Continent = 'Asia';
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT avg(LifeExpectancy) FROM country WHERE Continent = 'Africa' AND GovernmentForm LIKE '%Republic%'
SELECT SUM(SurfaceArea) AS TotalSurfaceArea FROM country WHERE Continent IN ('Asia', 'Europe');
SELECT SUM(SurfaceArea) FROM country WHERE Continent = 'Asia' OR Continent = 'Europe';
SELECT SUM(Population) FROM city WHERE District = 'Gelderland';
SELECT SUM(Population) FROM city WHERE District = 'Gelderland'
SELECT AVG(GNP) AS Average_GNP, SUM(Population) AS Total_Population FROM country WHERE GovernmentForm = 'US Territory';
SELECT AVG(GNP) AS MeanGNP, SUM(Population) AS TotalPopulation FROM country WHERE GovernmentForm LIKE '%US%';
SELECT COUNT(DISTINCT Language) FROM countrylanguage;
SELECT COUNT(DISTINCT Language) FROM countrylanguage
SELECT COUNT(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa';
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent = 'Africa'
SELECT COUNT(*) FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Aruba');
SELECT count(*) FROM countrylanguage AS CL JOIN country AS C ON CL.CountryCode = C.Code WHERE C.Name = 'Aruba';
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T'
SELECT count(*) FROM countrylanguage WHERE CountryCode = 'AFG' AND IsOfficial = 'T';
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Code ORDER BY NumberOfLanguages DESC LIMIT 1;
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Code ORDER BY NumberOfLanguages DESC LIMIT 1;
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1;
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS LanguageCount FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Continent ORDER BY LanguageCount DESC LIMIT 1;
SELECT COUNT(DISTINCT cl1.CountryCode) FROM countrylanguage AS cl1 JOIN countrylanguage AS cl2 ON cl1.CountryCode = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'Dutch';
SELECT COUNT(DISTINCT CountryCode) FROM ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' INTERSECT SELECT CountryCode FROM countrylanguage WHERE Language = 'Dutch' )
SELECT DISTINCT c.Name FROM country AS c JOIN countrylanguage AS cl1 ON c.Code = cl1.CountryCode JOIN countrylanguage AS cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl2.Language = 'French';
SELECT `Country`.`Name` FROM `country` JOIN `countrylanguage` ON `country`.`Code` = `countrylanguage`.`CountryCode` WHERE `countrylanguage`.`Language` = 'English' INTERSECT SELECT `Country`.`Name` FROM `country` JOIN `countrylanguage` ON `country`.`Code` = `countrylanguage`.`CountryCode` WHERE `countrylanguage`.`Language` = 'French'
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'T' INTERSECT SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';
SELECT DISTINCT c.Name FROM country AS c JOIN countrylanguage AS cl1 ON c.Code = cl1.CountryCode JOIN countrylanguage AS cl2 ON c.Code = cl2.CountryCode WHERE cl1.Language = 'English' AND cl1.IsOfficial = 'T' AND cl2.Language = 'French' AND cl2.IsOfficial = 'T';
SELECT COUNT(DISTINCT T1.Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T2.Language = 'Chinese';
SELECT COUNT(DISTINCT Continent) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'Chinese'
SELECT DISTINCT c.Region FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language IN ('English', 'Dutch');
SELECT DISTINCT `Region` FROM `country` AS c JOIN `countrylanguage` AS cl ON c.`Code` = cl.`CountryCode` WHERE cl.`Language` IN ('Dutch', 'English')
SELECT DISTINCT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' OR cl.Language = 'Dutch') AND cl.IsOfficial = 'T';
SELECT DISTINCT c.Name FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE (cl.Language = 'English' OR cl.Language = 'Dutch') AND cl.IsOfficial = 'T';
SELECT cl.Language, SUM(c.Population * cl.Percentage / 100) AS TotalPopulation FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.Continent = 'Asia' GROUP BY cl.Language ORDER BY TotalPopulation DESC LIMIT 1;
SELECT Language, COUNT(DISTINCT CountryCode) AS NumberOfNations FROM countrylanguage JOIN country ON countrylanguage.CountryCode = country.Code WHERE country.Continent = 'Asia' GROUP BY Language ORDER BY NumberOfNations DESC LIMIT 1;
SELECT CL.Language FROM countrylanguage AS CL JOIN country AS C ON CL.CountryCode = C.Code WHERE C.GovernmentForm LIKE '%Republic%' GROUP BY CL.Language HAVING COUNT(DISTINCT CL.CountryCode) = 1;
SELECT Language FROM countrylanguage cl JOIN country c ON cl.CountryCode = c.Code WHERE c.GovernmentForm LIKE '%republic%' GROUP BY Language HAVING COUNT(DISTINCT c.Code) = 1;
SELECT c.Name AS CityName, c.Population FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE cl.Language = 'English' ORDER BY c.Population DESC LIMIT 1;
SELECT c.Name, c.Population FROM city AS c JOIN countrylanguage AS cl ON c.CountryCode = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'T' ORDER BY c.Population DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1;
SELECT Name, Population, LifeExpectancy FROM country WHERE Continent = 'Asia' ORDER BY SurfaceArea DESC LIMIT 1
SELECT AVG(c.LifeExpectancy) FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode WHERE cl.Language = 'English' AND cl.IsOfficial = 'F';
SELECT AVG(LifeExpectancy) FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = "English" AND IsOfficial = "T")
SELECT SUM(c.Population) FROM country AS c WHERE NOT EXISTS ( SELECT 1 FROM countrylanguage AS cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English' AND cl.IsOfficial = 'T' );
SELECT SUM(c.Population) AS TotalPopulation FROM country c WHERE NOT EXISTS ( SELECT 1 FROM countrylanguage cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English' )
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE HeadOfState = 'Beatrix') AND IsOfficial = 'T'
SELECT Language FROM countrylanguage WHERE CountryCode = (SELECT Code FROM country WHERE HeadOfState = 'Beatrix') AND IsOfficial = 'T';
SELECT COUNT(DISTINCT countrylanguage.Language) FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.IndepYear < 1930 AND countrylanguage.IsOfficial = 'T';
SELECT count(DISTINCT T2.Language) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code = T2.CountryCode WHERE T1.IndepYear < 1930 AND T2.IsOfficial = 'T'
SELECT Name FROM country WHERE SurfaceArea > ( SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe' );
SELECT Name FROM country WHERE SurfaceArea > ( SELECT MAX(SurfaceArea) FROM country WHERE Continent = 'Europe' );
SELECT Name FROM country WHERE Continent = 'Africa' AND Population < (SELECT MIN(Population) FROM country WHERE Continent = 'Asia');
SELECT A.Name FROM country AS A WHERE A.Continent = 'Africa' AND A.Population < ( SELECT MIN(B.Population) FROM country AS B WHERE B.Continent = 'Asia' );
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > ( SELECT MAX(Population) FROM country WHERE Continent = 'Africa' );
SELECT Name FROM country WHERE Continent = 'Asia' AND Population > ( SELECT MAX(Population) FROM country WHERE Continent = 'Africa' );
SELECT Code FROM country WHERE NOT EXISTS ( SELECT 1 FROM countrylanguage WHERE countrylanguage.CountryCode = country.Code AND countrylanguage.Language = 'English' );
SELECT Code FROM country WHERE Code NOT IN ( SELECT CountryCode FROM countrylanguage WHERE Language = 'English' )
SELECT DISTINCT CountryCode FROM countrylanguage WHERE Language != 'English'
SELECT DISTINCT `CountryCode` FROM `countrylanguage` WHERE `Language` != 'English'
SELECT Code FROM country WHERE Code NOT IN (SELECT CountryCode FROM countrylanguage WHERE Language = 'English') AND GovernmentForm NOT LIKE '%Republic%'
SELECT c.Code FROM country AS c WHERE c.GovernmentForm NOT LIKE '%Republic%' AND NOT EXISTS ( SELECT 1 FROM countrylanguage AS cl WHERE cl.CountryCode = c.Code AND cl.Language = 'English' )
SELECT c.Name AS CityName FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial != 'T';
SELECT c.Name FROM city c JOIN country co ON c.CountryCode = co.Code JOIN countrylanguage cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Europe' AND cl.Language = 'English' AND cl.IsOfficial = 'F';
SELECT DISTINCT c.Name FROM city AS c JOIN country AS co ON c.CountryCode = co.Code JOIN countrylanguage AS cl ON co.Code = cl.CountryCode WHERE co.Continent = 'Asia' AND cl.Language = 'Chinese' AND cl.IsOfficial = 'T'
SELECT DISTINCT city.Name FROM city JOIN country ON city.CountryCode = country.Code JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE country.Continent = 'Asia' AND countrylanguage.Language = 'Chinese' AND countrylanguage.IsOfficial = 'T'
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1
SELECT Name, IndepYear, SurfaceArea FROM country ORDER BY Population ASC LIMIT 1;
SELECT Name, Population, HeadOfState AS Leader FROM country ORDER BY SurfaceArea DESC LIMIT 1;
SELECT Name, Population, HeadOfState FROM country WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM country);
SELECT c.Name, COUNT(l.Language) AS NumberOfLanguages FROM country AS c JOIN countrylanguage AS l ON c.Code = l.CountryCode GROUP BY c.Code HAVING COUNT(l.Language) >= 3
SELECT c.Name, COUNT(cl.Language) AS NumberOfLanguages FROM country AS c JOIN countrylanguage AS cl ON c.Code = cl.CountryCode GROUP BY c.Code HAVING COUNT(cl.Language) > 2;
SELECT District, COUNT(*) AS NumCities FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT District, COUNT(*) AS CitiesAboveAverage FROM city WHERE Population > (SELECT AVG(Population) FROM city) GROUP BY District;
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72;
SELECT GovernmentForm, SUM(Population) AS TotalPopulation FROM country GROUP BY GovernmentForm HAVING AVG(LifeExpectancy) > 72 This query will select the government forms and the total population for each government form from the `country` table. It groups the results by `GovernmentForm` and filters these groups to include only those where the average life expectancy is greater than 72 years. This is achieved using the `HAVING` clause, which applies conditions to groups defined by the `GROUP BY` clause.
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy, SUM(Population) AS TotalPopulation FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72;
SELECT Continent, SUM(Population) AS TotalPopulation, AVG(LifeExpectancy) AS AverageLifeExpectancy FROM country GROUP BY Continent HAVING AVG(LifeExpectancy) < 72;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea DESC LIMIT 5;
SELECT Name FROM country ORDER BY Population DESC LIMIT 3
SELECT Name FROM country ORDER BY Population DESC LIMIT 3;
SELECT Name FROM country ORDER BY Population ASC LIMIT 3;
SELECT Name FROM country ORDER BY Population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE Continent = 'Asia';
SELECT count(*) FROM country WHERE Continent = 'Asia'
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT Name FROM country WHERE Continent = 'Europe' AND Population = 80000
SELECT sum(Population) AS TotalPopulation, avg(SurfaceArea) AS AverageArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT SUM(Population) AS TotalPopulation, AVG(SurfaceArea) AS AverageSurfaceArea FROM country WHERE Continent = 'North America' AND SurfaceArea > 3000;
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Name FROM city WHERE Population BETWEEN 160000 AND 900000
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(CountryCode) DESC LIMIT 1;
SELECT Language FROM countrylanguage GROUP BY Language ORDER BY COUNT(DISTINCT CountryCode) DESC LIMIT 1
SELECT CountryCode, Language, MAX(Percentage) AS MaxPercentage FROM countrylanguage GROUP BY CountryCode;
SELECT cl.CountryCode, cl.Language, MAX(cl.Percentage) AS MaxPercentage FROM countrylanguage AS cl GROUP BY cl.CountryCode
SELECT COUNT(*) AS NumberOfCountries FROM ( SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND Percentage = ( SELECT MAX(Percentage) FROM countrylanguage WHERE CountryCode = countrylanguage.CountryCode ) ) AS SpanishDominantCountries;
SELECT COUNT(*) FROM countrylanguage WHERE Language = 'Spanish' AND Percentage > 50.0;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' ORDER BY Percentage DESC LIMIT 1;
SELECT CountryCode FROM countrylanguage WHERE Language = 'Spanish' AND IsOfficial = 'T'
SELECT count(*) FROM conductor
SELECT count(*) FROM conductor
SELECT Name FROM conductor ORDER BY Age ASC
SELECT Name FROM conductor ORDER BY Age
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Name FROM conductor WHERE Nationality != 'USA'
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT Record_Company FROM orchestra ORDER BY Year_of_Founded DESC
SELECT AVG(Attendance) FROM show;
SELECT AVG(Attendance) FROM show
SELECT max(Share), min(Share) FROM performance WHERE Type != "Live final"
SELECT max(Share), min(Share) FROM performance WHERE Type != 'Live final'
SELECT count(DISTINCT Nationality) FROM conductor
SELECT count(DISTINCT Nationality) FROM conductor
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC
SELECT Name FROM conductor ORDER BY Year_of_Work DESC LIMIT 1
SELECT T1.Name FROM conductor AS T1 ORDER BY T1.Year_of_Work DESC LIMIT 1
SELECT c.Name AS Conductor_Name, o.Orchestra AS Orchestra_Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID;
SELECT C.Name, O.Orchestra FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID
SELECT c.Name, COUNT(o.Orchestra_ID) AS NumberOfOrchestras FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name HAVING COUNT(o.Orchestra_ID) > 1;
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID, c.Name HAVING COUNT(DISTINCT o.Orchestra_ID) > 1;
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT c.Name FROM conductor AS c JOIN orchestra AS o ON c.Conductor_ID = o.Conductor_ID GROUP BY c.Conductor_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT C.Name FROM conductor AS C JOIN orchestra AS O ON C.Conductor_ID = O.Conductor_ID WHERE O.Year_of_Founded > 2008
SELECT DISTINCT T1.Name FROM conductor AS T1 JOIN orchestra AS T2 ON T1.Conductor_ID = T2.Conductor_ID WHERE T2.Year_of_Founded > 2008
SELECT Record_Company, COUNT(*) FROM orchestra GROUP BY Record_Company
SELECT Record_Company, COUNT(*) AS NumberOfOrchestras FROM orchestra GROUP BY Record_Company
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) ASC
SELECT Major_Record_Format FROM orchestra GROUP BY Major_Record_Format ORDER BY COUNT(*) DESC
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Record_Company FROM orchestra GROUP BY Record_Company ORDER BY COUNT(*) DESC LIMIT 1
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT Record_Company FROM orchestra WHERE Year_of_Founded < 2003 INTERSECT SELECT Record_Company FROM orchestra WHERE Year_of_Founded > 2003
SELECT count(*) FROM orchestra WHERE Major_Record_Format = "CD" OR Major_Record_Format = "DVD"
SELECT count(*) FROM orchestra WHERE Major_Record_Format = "CD" OR Major_Record_Format = "DVD";
SELECT O.Year_of_Founded FROM orchestra O JOIN performance P ON O.Orchestra_ID = P.Orchestra_ID GROUP BY O.Orchestra_ID HAVING COUNT(P.Performance_ID) > 1
SELECT O.Year_of_Founded FROM orchestra AS O JOIN performance AS P ON O.Orchestra_ID = P.Orchestra_ID GROUP BY O.Orchestra_ID HAVING COUNT(P.Performance_ID) > 1
SELECT count(*) FROM Highschooler
SELECT count(*) FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT name, grade FROM Highschooler;
SELECT grade FROM Highschooler
SELECT name, grade FROM Highschooler
SELECT grade FROM Highschooler WHERE name = "Kyle";
SELECT grade FROM Highschooler WHERE name = 'Kyle'
SELECT name FROM Highschooler WHERE grade = 10
SELECT name FROM Highschooler WHERE grade = 10;
SELECT ID FROM Highschooler WHERE name = 'Kyle'
SELECT ID FROM Highschooler WHERE name = 'Kyle';
SELECT count(*) FROM Highschooler WHERE grade IN (9, 10)
SELECT count(*) FROM Highschooler WHERE grade = 9 OR grade = 10
SELECT grade, COUNT(*) AS number_of_students FROM Highschooler GROUP BY grade;
SELECT grade, COUNT(*) AS number_of_students FROM Highschooler GROUP BY grade;
SELECT grade FROM Highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade ORDER BY count(*) DESC LIMIT 1
SELECT grade FROM Highschooler GROUP BY grade HAVING count(*) >= 4
SELECT grade FROM Highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT student_id, COUNT(friend_id) AS number_of_friends FROM Friend GROUP BY student_id;
SELECT student_id, COUNT(DISTINCT friend_id) AS number_of_friends FROM Friend GROUP BY student_id;
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name;
SELECT H.name, COUNT(F.friend_id) AS num_friends FROM Highschooler H LEFT JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name
SELECT H.name FROM Highschooler H JOIN ( SELECT student_id AS ID, COUNT(*) AS num_friends FROM Friend GROUP BY student_id UNION ALL SELECT friend_id AS ID, COUNT(*) AS num_friends FROM Friend GROUP BY friend_id ) AS F ON H.ID = F.ID GROUP BY H.ID ORDER BY SUM(F.num_friends) DESC LIMIT 1;
SELECT H.name, COUNT(*) AS num_friends FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name ORDER BY num_friends DESC LIMIT 1;
SELECT H.name FROM Highschooler H JOIN ( SELECT student_id FROM Friend GROUP BY student_id HAVING COUNT(friend_id) >= 3 ) AS F ON H.ID = F.student_id
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID HAVING COUNT(DISTINCT F.friend_id) >= 3
SELECT H2.name FROM Highschooler AS H1 JOIN Friend AS F ON H1.ID = F.student_id JOIN Highschooler AS H2 ON F.friend_id = H2.ID WHERE H1.name = 'Kyle';
SELECT H.name FROM Highschooler AS H JOIN Friend AS F ON H.ID = F.friend_id JOIN Highschooler AS K ON F.student_id = K.ID WHERE K.name = 'Kyle'
SELECT COUNT(*) FROM ( SELECT friend_id AS friend FROM Friend JOIN Highschooler ON Highschooler.ID = Friend.student_id WHERE Highschooler.name = 'Kyle' UNION SELECT student_id AS friend FROM Friend JOIN Highschooler ON Highschooler.ID = Friend.friend_id WHERE Highschooler.name = 'Kyle' ) AS KyleFriends;
SELECT count(*) FROM Friend AS F JOIN Highschooler AS H ON F.student_id = H.ID WHERE H.name = 'Kyle'
SELECT ID FROM Highschooler EXCEPT SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend
SELECT ID FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend UNION SELECT friend_id FROM Friend)
SELECT name FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes;
SELECT DISTINCT T1.ID FROM Highschooler AS T1 JOIN Friend AS T2 ON T1.ID = T2.student_id JOIN Likes AS T3 ON T1.ID = T3.student_id WHERE T1.ID IN (SELECT student_id FROM Likes) AND T1.ID IN (SELECT student_id FROM Friend)
SELECT DISTINCT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id JOIN Likes L ON H.ID = L.liked_id
SELECT DISTINCT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id JOIN Likes L ON H.ID = L.student_id WHERE H.ID IN (SELECT student_id FROM Friend) AND H.ID IN (SELECT student_id FROM Likes)
SELECT student_id, COUNT(*) AS number_of_likes FROM Likes GROUP BY student_id;
SELECT student_id, COUNT(*) FROM Likes GROUP BY student_id
SELECT H.name, COUNT(*) AS num_likes FROM Highschooler H JOIN Likes L ON H.ID = L.student_id GROUP BY H.ID, H.name
SELECT H.name, COUNT(*) AS NumberOfLikes FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID, H.name
SELECT H.name FROM Highschooler H JOIN Likes L ON H.ID = L.liked_id GROUP BY H.ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID HAVING COUNT(*) >= 2
SELECT H.name FROM Highschooler AS H JOIN Likes AS L ON H.ID = L.student_id GROUP BY H.ID HAVING COUNT(*) >= 2
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name HAVING H.grade > 5 AND COUNT(DISTINCT F.friend_id) >= 2
SELECT H.name FROM Highschooler H JOIN Friend F ON H.ID = F.student_id GROUP BY H.ID, H.name, H.grade HAVING H.grade > 5 AND COUNT(F.friend_id) >= 2
SELECT COUNT(*) FROM Likes WHERE liked_id = (SELECT ID FROM Highschooler WHERE name = 'Kyle');
SELECT count(*) FROM Likes JOIN Highschooler ON Highschooler.ID = Likes.student_id WHERE Highschooler.name = 'Kyle';
SELECT AVG(H.grade) FROM Highschooler H WHERE H.ID IN (SELECT F.student_id FROM Friend F) OR H.ID IN (SELECT F.friend_id FROM Friend F);
SELECT AVG(h.grade) AS average_grade FROM Highschooler h JOIN Friend f ON h.ID = f.student_id
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT MIN(grade) FROM Highschooler WHERE ID NOT IN (SELECT student_id FROM Friend) AND ID NOT IN (SELECT friend_id FROM Friend)
SELECT DISTINCT O.state FROM Owners AS O JOIN Professionals AS P ON O.state = P.state
SELECT DISTINCT o.state FROM Owners AS o JOIN Professionals AS p ON o.state = p.state
SELECT AVG(CAST(d.age AS DECIMAL(10,2))) AS average_age FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id;
SELECT AVG(CAST(d.age AS DECIMAL(10,2))) AS average_age FROM Dogs d JOIN Treatments t ON d.dog_id = t.dog_id;
SELECT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P LEFT JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.last_name, P.cell_number HAVING P.state = 'Indiana' OR COUNT(T.treatment_id) > 2;
SELECT DISTINCT P.professional_id, P.last_name, P.cell_number FROM Professionals AS P LEFT JOIN Treatments AS T ON P.professional_id = T.professional_id WHERE P.state = 'Indiana' OR P.professional_id IN ( SELECT professional_id FROM Treatments GROUP BY professional_id HAVING COUNT(treatment_id) > 2 );
SELECT DISTINCT D.name FROM Dogs AS D LEFT JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id HAVING COALESCE(SUM(T.cost_of_treatment), 0) <= 1000;
SELECT D.name FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY D.dog_id, D.name HAVING SUM(T.cost_of_treatment) <= 1000;
SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners EXCEPT SELECT name FROM Dogs
SELECT first_name FROM ( SELECT first_name FROM Professionals UNION SELECT first_name FROM Owners ) AS PeopleNames WHERE first_name NOT IN (SELECT name FROM Dogs)
SELECT professional_id, role_code, email_address FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT professional_id, role_code, email_address FROM Professionals EXCEPT SELECT P.professional_id, P.role_code, P.email_address FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id;
SELECT O.owner_id, O.first_name, O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id GROUP BY O.owner_id, O.first_name, O.last_name ORDER BY COUNT(D.dog_id) DESC LIMIT 1;
SELECT o.owner_id, o.first_name, o.last_name FROM Owners AS o JOIN Dogs AS d ON o.owner_id = d.owner_id GROUP BY o.owner_id, o.first_name, o.last_name ORDER BY COUNT(d.dog_id) DESC LIMIT 1;
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.role_code, P.first_name HAVING COUNT(*) >= 2;
SELECT P.professional_id, P.role_code, P.first_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id, P.role_code, P.first_name HAVING COUNT(*) >= 2;
SELECT B.breed_name FROM Breeds B JOIN Dogs D ON B.breed_code = D.breed_code GROUP BY B.breed_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT B.breed_name FROM Dogs AS D JOIN Breeds AS B ON D.breed_code = B.breed_code GROUP BY B.breed_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT o.owner_id, o.last_name, COUNT(t.treatment_id) AS number_of_treatments FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY number_of_treatments DESC LIMIT 1;
SELECT O.owner_id, O.last_name, SUM(T.cost_of_treatment) AS total_spent FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.last_name ORDER BY total_spent DESC LIMIT 1;
SELECT tt.treatment_type_description FROM Treatment_Types AS tt JOIN Treatments AS t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code ORDER BY SUM(t.cost_of_treatment) ASC LIMIT 1;
SELECT TT.treatment_type_description FROM Treatment_Types TT JOIN Treatments T ON TT.treatment_type_code = T.treatment_type_code GROUP BY TT.treatment_type_code, TT.treatment_type_description ORDER BY SUM(T.cost_of_treatment) ASC LIMIT 1;
SELECT O.owner_id, O.zip_code FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1;
SELECT O.owner_id, O.zip_code FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id JOIN Treatments AS T ON D.dog_id = T.dog_id GROUP BY O.owner_id, O.zip_code ORDER BY SUM(T.cost_of_treatment) DESC LIMIT 1;
SELECT P.professional_id, P.cell_number FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(DISTINCT T.treatment_type_code) >= 2;
SELECT P.professional_id, P.cell_number FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id GROUP BY P.professional_id HAVING COUNT(DISTINCT T.treatment_type_code) >= 2;
SELECT DISTINCT p.first_name, p.last_name FROM Professionals AS p JOIN Treatments AS t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments);
SELECT DISTINCT P.first_name, P.last_name FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id WHERE T.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM Treatments);
SELECT T.date_of_treatment, P.first_name FROM Treatments AS T JOIN Professionals AS P ON T.professional_id = P.professional_id;
SELECT T.date_of_treatment, P.first_name FROM Treatments AS T JOIN Professionals AS P ON T.professional_id = P.professional_id;
SELECT T.cost_of_treatment, TT.treatment_type_description FROM Treatments AS T JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code;
SELECT Treatments.cost_of_treatment, Treatment_Types.treatment_type_description FROM Treatments JOIN Treatment_Types ON Treatments.treatment_type_code = Treatment_Types.treatment_type_code;
SELECT O.first_name, O.last_name, S.size_description FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id JOIN Sizes S ON D.size_code = S.size_code;
SELECT o.first_name, o.last_name, s.size_description FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id JOIN Sizes s ON d.size_code = s.size_code;
SELECT O.first_name AS Owner_First_Name, D.name AS Dog_Name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id;
SELECT O.first_name, D.name AS dog_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id;
SELECT D.name AS Dog_Name, T.date_of_treatment AS Treatment_Date FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id WHERE D.breed_code = ( SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT D.name AS Dog_Name, T.date_of_treatment AS Treatment_Date FROM Dogs D JOIN Treatments T ON D.dog_id = T.dog_id WHERE D.breed_code IN ( SELECT breed_code FROM Dogs GROUP BY breed_code ORDER BY COUNT(*) ASC LIMIT 1 )
SELECT O.first_name AS OwnerFirstName, D.name AS DogName FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id WHERE O.state = 'Virginia';
SELECT o.first_name, d.name AS dog_name FROM Owners o JOIN Dogs d ON o.owner_id = d.owner_id WHERE o.state = 'Virginia';
SELECT Dogs.date_arrived, Dogs.date_departed FROM Dogs JOIN Treatments ON Dogs.dog_id = Treatments.dog_id GROUP BY Dogs.dog_id;
SELECT D.date_arrived, D.date_departed FROM Dogs AS D JOIN Treatments AS T ON D.dog_id = T.dog_id
SELECT O.last_name FROM Owners AS O JOIN Dogs AS D ON O.owner_id = D.owner_id ORDER BY D.date_of_birth DESC LIMIT 1;
SELECT O.last_name FROM Owners O JOIN Dogs D ON O.owner_id = D.owner_id ORDER BY D.date_of_birth DESC LIMIT 1;
SELECT email_address FROM Professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM Professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT date_arrived, date_departed FROM Dogs;
SELECT date_arrived, date_departed FROM Dogs
SELECT COUNT(DISTINCT dog_id) FROM Treatments
SELECT COUNT(DISTINCT dog_id) FROM Treatments;
SELECT COUNT(DISTINCT professional_id) FROM Treatments;
SELECT COUNT(DISTINCT `professional_id`) FROM `Treatments`
SELECT P.role_code, P.street, P.city, P.state FROM Professionals AS P WHERE P.city LIKE '%West%'
SELECT role_code, street, city, state FROM Professionals WHERE city LIKE '%West%'
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE "%North%"
SELECT first_name, last_name, email_address FROM Owners WHERE state LIKE "%North%"
SELECT count(*) FROM Dogs WHERE age < (SELECT avg(age) FROM Dogs)
SELECT COUNT(*) FROM Dogs WHERE CAST(age AS SIGNED) < (SELECT AVG(CAST(age AS SIGNED)) FROM Dogs);
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1;
SELECT cost_of_treatment FROM Treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments);
SELECT COUNT(*) FROM Dogs WHERE dog_id NOT IN (SELECT dog_id FROM Treatments);
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN (SELECT owner_id FROM Dogs);
SELECT COUNT(*) FROM Owners WHERE owner_id NOT IN ( SELECT owner_id FROM Dogs WHERE date_adopted IS NULL AND date_departed IS NULL )
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT count(*) FROM Professionals WHERE professional_id NOT IN (SELECT professional_id FROM Treatments)
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT name, age, weight FROM Dogs WHERE abandoned_yn = '1'
SELECT AVG(CAST(age AS DECIMAL(10,2))) AS average_age FROM Dogs;
SELECT AVG(CAST(age AS UNSIGNED)) AS average_age FROM Dogs;
SELECT MAX(age) FROM Dogs;
SELECT age FROM Dogs ORDER BY age DESC LIMIT 1;
SELECT charge_type, SUM(charge_amount) AS total_amount FROM Charges GROUP BY charge_type;
SELECT charge_type, charge_amount FROM Charges;
SELECT MAX(charge_amount) FROM Charges
SELECT charge_amount FROM Charges ORDER BY charge_amount DESC LIMIT 1;
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT email_address, cell_number, home_phone FROM Professionals
SELECT B.breed_name, S.size_description FROM Breeds B JOIN Sizes S CROSS JOIN
SELECT DISTINCT b.breed_name, s.size_description FROM Dogs d JOIN Breeds b ON d.breed_code = b.breed_code JOIN Sizes s ON d.size_code = s.size_code;
SELECT P.first_name, TT.treatment_type_description FROM Professionals AS P JOIN Treatments AS T ON P.professional_id = T.professional_id JOIN Treatment_Types AS TT ON T.treatment_type_code = TT.treatment_type_code;
SELECT P.first_name AS Professional_First_Name, TT.treatment_type_description AS Treatment_Description FROM Professionals P JOIN Treatments T ON P.professional_id = T.professional_id JOIN Treatment_Types TT ON T.treatment_type_code = TT.treatment_type_code;
SELECT count(*) FROM singer;
SELECT count(*) FROM singer
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Name FROM singer ORDER BY Net_Worth_Millions ASC
SELECT Birth_Year, Citizenship FROM singer
SELECT Birth_Year, Citizenship FROM singer
SELECT Name FROM singer WHERE Citizenship != "France"
SELECT Name FROM singer WHERE Citizenship != 'French'
SELECT Name FROM singer WHERE Birth_Year = 1948 OR Birth_Year = 1949
SELECT Name FROM singer WHERE Birth_Year IN (1948, 1949)
SELECT Name FROM singer ORDER BY Net_Worth_Millions DESC LIMIT 1
SELECT T1.Name FROM singer AS T1 ORDER BY T1.Net_Worth_Millions DESC LIMIT 1;
SELECT Citizenship, COUNT(*) FROM singer GROUP BY Citizenship
SELECT Citizenship, COUNT(*) AS NumberOfSingers FROM singer GROUP BY Citizenship;
SELECT Citizenship FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1
SELECT Citizenship, COUNT(*) AS Num_Singers FROM singer GROUP BY Citizenship ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship
SELECT Citizenship, MAX(Net_Worth_Millions) AS Max_Net_Worth FROM singer GROUP BY Citizenship;
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID
SELECT song.Title, singer.Name FROM song JOIN singer ON song.Singer_ID = singer.Singer_ID;
SELECT DISTINCT s.Name FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID WHERE so.Sales > 300000
SELECT DISTINCT T1.Name FROM singer AS T1 JOIN song AS T2 ON T1.Singer_ID = T2.Singer_ID WHERE T2.Sales > 300000
SELECT s.Name FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name HAVING COUNT(so.Song_ID) > 1;
SELECT s.Name FROM singer s JOIN song sg ON s.Singer_ID = sg.Singer_ID GROUP BY s.Singer_ID HAVING COUNT(sg.Song_ID) > 1;
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer AS s JOIN song AS so ON s.Singer_ID = so.Singer_ID GROUP BY s.Singer_ID, s.Name
SELECT s.Name, SUM(so.Sales) AS Total_Sales FROM singer s JOIN song so ON s.Singer_ID = so.Singer_ID GROUP BY s.Name;
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Name FROM singer WHERE Singer_ID NOT IN (SELECT Singer_ID FROM song)
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT Citizenship FROM singer WHERE Birth_Year < 1945 INTERSECT SELECT Citizenship FROM singer WHERE Birth_Year > 1955
SELECT count(*) FROM Other_Available_Features
SELECT T1.feature_type_name FROM Ref_Feature_Types AS T1 JOIN Other_Available_Features AS T2 ON T1.feature_type_code = T2.feature_type_code WHERE T2.feature_name = "AirCon";
SELECT DISTINCT p.property_type_code, rpt.property_type_description FROM Properties p JOIN Ref_Property_Types rpt ON p.property_type_code = rpt.property_type_code;
SELECT property_name FROM Properties WHERE (property_type_code IN (SELECT property_type_code FROM Ref_Property_Types WHERE property_type_description = 'House' OR property_type_description = 'Apartment')) AND room_count > 1;