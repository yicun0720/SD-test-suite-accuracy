SELECT COUNT(*) AS singer_count FROM singer_in_concert
SELECT COUNT(*) FROM (SELECT DISTINCT singer_id FROM singer_in_concert)
SELECT name, country, age FROM singer ORDER BY age, country
SELECT DISTINCT name, country, age FROM singer ORDER BY age DESC
SELECT AVG(age) AS average_age, MIN(age) AS min_age, MAX(age) AS max_age FROM singer WHERE country = 'France'
SELECT MIN(age) FROM singer WHERE country = 'France' GROUP BY country
SELECT name, song_release_year FROM singer WHERE age = (SELECT MIN(age) FROM singer) AND song_release_year = (SELECT MIN(song_release_year) FROM singer)
SELECT song_name, song_release_year FROM singer WHERE age = (SELECT MIN(age) FROM singer) GROUP BY song_name
SELECT DISTINCT s.country FROM singer s INNER JOIN singer_in_concert sic ON s.singer_id = sic.singer_id WHERE s.age > 20
SELECT DISTINCT s.country FROM singer s WHERE s.age > 20
SELECT s.country, COUNT(sc.singer_id) AS singer_count FROM singer s LEFT JOIN singer_in_concert sc ON s.singer_id = sc.singer_id GROUP BY s.country
SELECT s.country, COUNT(DISTINCT sic.singer_id) AS num_singers FROM singer_in_concert sic JOIN singer s ON sic.singer_id = s.singer_id GROUP BY s.country
SELECT s.song_name FROM singer s JOIN (SELECT AVG(age) as avg_age FROM singer) a WHERE s.age > a.avg_age
SELECT DISTINCT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer)
SELECT location, name FROM stadium WHERE capacity > 4999 AND capacity < 10001 ORDER BY location, name
SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000
SELECT MAX(capacity) AS maximum_capacity, AVG(capacity) AS average_capacity FROM stadium WHERE capacity IS NOT NULL
SELECT AVG(capacity) AS average_capacity, MAX(capacity) AS maximum_capacity FROM stadium
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium)
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium)
SELECT COUNT(*) FROM concert WHERE year = 2014 UNION ALL SELECT COUNT(*) FROM concert WHERE year = 2015
SELECT COUNT(*) FROM concert WHERE year = 2014 OR year = 2015
SELECT stadium.name, COUNT(concert.concert_id) AS num_concerts FROM stadium LEFT JOIN concert ON stadium.stadium_id = concert.stadium_id GROUP BY stadium.name
SELECT s.name, COUNT(c.concert_id) FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id GROUP BY s.name
SELECT name, capacity FROM stadium WHERE stadium_id = (SELECT stadium_id FROM concert WHERE year >= 2014 GROUP BY stadium_id HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM concert WHERE year >= 2014 GROUP BY stadium_id))
SELECT name, capacity FROM stadium WHERE stadium_id = ( SELECT stadium_id FROM concert GROUP BY stadium_id HAVING COUNT(*) = ( SELECT MAX(concert_count) FROM (SELECT COUNT(*) as concert_count FROM concert WHERE year > 2013 GROUP BY stadium_id) ) )
SELECT year FROM (SELECT year, ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rnk FROM concert GROUP BY year) WHERE rnk = 1
SELECT MAX(year) FROM (SELECT year, COUNT(concert_id) as num_concerts FROM concert GROUP BY year) as subquery
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.stadium_id IS NULL
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.concert_id IS NULL
SELECT DISTINCT s1.country FROM singer s1 JOIN singer s2 ON s1.country = s2.country WHERE s1.age > 40 AND s2.age < 30
SELECT name FROM stadium WHERE stadium_id IN (SELECT stadium_id FROM concert WHERE year != 2014)
SELECT name FROM stadium WHERE NOT EXISTS (SELECT * FROM concert WHERE concert.stadium_id = stadium.stadium_id AND year = 2014)
SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) AS singer_count FROM concert LEFT JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert.concert_name, concert.theme
SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) as number_of_singers FROM concert LEFT JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert.concert_name, concert.theme
SELECT s.name, COUNT(sc.concert_id) AS num_concerts FROM singer s LEFT JOIN singer_in_concert sc ON s.singer_id = sc.singer_id GROUP BY s.name
SELECT name, COUNT(singer_in_concert.concert_id) AS num_concerts FROM singer LEFT JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id GROUP BY singer.name
SELECT singer.name FROM concert LEFT JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id LEFT JOIN singer ON singer_in_concert.singer_id = singer.singer_id WHERE concert.year = 2014
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM singer_in_concert WHERE concert_id IN (SELECT concert_id FROM concert WHERE year = 2014))
SELECT name, country FROM singer WHERE song_name LIKE '%Hey%' GROUP BY name, country
SELECT name, country FROM singer WHERE song_name LIKE '%Hey%' GROUP BY name, country
SELECT s.name, s.location FROM stadium s INNER JOIN concert c1 ON s.stadium_id = c1.stadium_id INNER JOIN concert c2 ON s.stadium_id = c2.stadium_id WHERE c1.year = 2014 AND c2.year = 2015
SELECT s.name, s.location FROM stadium s INNER JOIN (SELECT stadium_id FROM concert WHERE year = 2014 INTERSECT SELECT stadium_id FROM concert WHERE year = 2015) c ON s.stadium_id = c.stadium_id
SELECT COUNT(*) FROM concert WHERE stadium_id = (SELECT stadium_id FROM stadium ORDER BY capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE stadium_id = (SELECT stadium_id FROM (SELECT stadium_id FROM stadium ORDER BY capacity DESC LIMIT 1) )
SELECT COUNT(petid) FROM pets WHERE weight > 10
SELECT COUNT(*) FROM pets p, has_pet hp WHERE p.weight > 10 AND p.petid = hp.petid
SELECT weight FROM pets WHERE pettype = 'dog' AND pet_age = (SELECT min(pet_age) FROM pets WHERE pettype = 'dog') LIMIT 1
SELECT min(weight) FROM pets WHERE pettype = 'dog' AND pet_age = (SELECT min(pet_age) FROM pets WHERE pettype = 'dog')
SELECT pettype, weight AS max_weight FROM pets p1 WHERE NOT EXISTS (SELECT * FROM pets p2 WHERE p2.pettype = p1.pettype AND p2.weight > p1.weight)
SELECT pettype, weight FROM pets p1 WHERE weight = (SELECT MAX(weight) FROM pets WHERE pettype = p1.pettype) GROUP BY pettype, weight
SELECT COUNT(*) FROM has_pet hp WHERE EXISTS (SELECT * FROM student WHERE has_pet.stuid = student.stuid AND age > 20)
SELECT COUNT(petid) FROM pets WHERE petid IN (SELECT petid FROM has_pet WHERE stuid IN (SELECT stuid FROM student WHERE age > 20))
SELECT COUNT(*) FROM has_pet JOIN student ON has_pet.stuid = student.stuid JOIN pets ON has_pet.petid = pets.petid WHERE sex = 'F' AND pettype = 'dog'
SELECT COUNT(*) FROM has_pet JOIN student ON has_pet.stuid = student.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'dog' AND student.sex = 'female' GROUP BY student.sex
SELECT distinct pettype FROM pets
SELECT COUNT(*) FROM (SELECT DISTINCT pettype FROM pets) WHERE pettype IS NOT NULL
SELECT fname FROM student WHERE EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' OR pettype = 'dog')
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' OR pettype = 'dog')) GROUP BY fname
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat') AND stuid IN (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'dog')
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat')) AND stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'dog'))
SELECT major, age FROM student WHERE NOT EXISTS (SELECT * FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'cat'))
SELECT major, age FROM student s LEFT JOIN has_pet hp ON s.stuid = hp.stuid WHERE hp.petid NOT IN (SELECT petid FROM pets WHERE pettype = 'cat')
SELECT stuid FROM student WHERE NOT EXISTS (SELECT 1 FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'cat'))
SELECT stuid FROM student WHERE stuid NOT IN (SELECT stuid FROM has_pet) OR stuid NOT IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat'))
SELECT s.fname, s.age FROM student s LEFT JOIN has_pet hp1 ON s.stuid = hp1.stuid LEFT JOIN pets p1 ON hp1.petid = p1.petid AND p1.pettype = 'dog' WHERE NOT EXISTS (SELECT 1 FROM has_pet hp2 LEFT JOIN pets p2 ON hp2.petid = p2.petid WHERE hp2.stuid = s.stuid AND p2.pettype = 'cat')
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'dog')) AND stuid NOT IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat'))
SELECT pettype, weight FROM pets WHERE pet_age = (SELECT MIN(pet_age) FROM pets) AND weight = (SELECT MIN(weight) FROM pets) ORDER BY pettype DESC LIMIT 1
SELECT pettype, weight FROM pets WHERE pet_age = (SELECT MIN(pet_age) FROM pets) UNION SELECT pettype, weight FROM pets WHERE weight = (SELECT MAX(weight) FROM pets)
SELECT petid, weight FROM pets WHERE pet_age > 1 ORDER BY petid
SELECT pets.petid, pets.weight FROM pets JOIN has_pet ON pets.petid = has_pet.petid WHERE pets.pet_age > 1
SELECT pettype, AVG(age) AS average_age, MAX(age) AS max_age FROM pets LEFT JOIN has_pet ON pets.petid = has_pet.petid LEFT JOIN student ON has_pet.stuid = student.stuid GROUP BY pettype
SELECT pettype, AVG(age) as avg_age, MAX(age) as max_age FROM (SELECT pettype, s.age FROM pets p JOIN has_pet hp ON p.petid = hp.petid JOIN student s ON hp.stuid = s.stuid) GROUP BY pettype
SELECT pettype, AVG(weight) average_weight FROM pets GROUP BY pettype HAVING AVG(weight) IS NOT NULL
SELECT pettype, AVG(weight) average_weight FROM pets GROUP BY pettype
SELECT s.fname, s.age FROM student s WHERE EXISTS (SELECT 1 FROM has_pet h WHERE h.stuid = s.stuid)
SELECT fname, age FROM student JOIN has_pet ON student.stuid = has_pet.stuid
SELECT pets.petid FROM pets INNER JOIN has_pet ON pets.petid = has_pet.petid INNER JOIN student ON has_pet.stuid = student.stuid WHERE student.lname = 'Smith'
SELECT pets.petid FROM pets JOIN has_pet ON pets.petid = has_pet.petid JOIN student ON has_pet.stuid = student.stuid WHERE student.lname = 'Smith'
SELECT student.stuid, COUNT(has_pet.petid) AS num_pets FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.stuid
SELECT student.stuid, (SELECT COUNT(petid) FROM has_pet WHERE has_pet.stuid = student.stuid) AS pet_count FROM student
SELECT s.fname, s.sex FROM student s JOIN (SELECT stuid, COUNT(petid) AS num_pets FROM has_pet GROUP BY stuid) pcount ON s.stuid = pcount.stuid WHERE pcount.num_pets > 1
SELECT s.fname, s.sex FROM student s WHERE EXISTS (SELECT * FROM has_pet h WHERE s.stuid = h.stuid GROUP BY h.stuid HAVING COUNT(h.petid) > 1)
SELECT student.lname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' AND pet_age = 3 LIMIT 1
SELECT lname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' AND pet_age = 3
SELECT AVG(age) FROM student WHERE NOT EXISTS (SELECT 1 FROM has_pet WHERE has_pet.stuid = student.stuid)
SELECT AVG(s.age) FROM student s WHERE NOT EXISTS (SELECT * FROM has_pet hp WHERE s.stuid = hp.stuid)
SELECT continent FROM continents GROUP BY continent
SELECT count(distinct continent) as num_continents FROM continents
SELECT contid, continent, COUNT(*) AS country_count FROM continents JOIN countries ON continents.contid = countries.continent GROUP BY continents.contid
SELECT contid, continent, (SELECT COUNT(countryid) FROM countries WHERE countries.continent = continents.contid) AS country_count FROM continents
SELECT MAX(countryid) FROM countries
SELECT COUNT(*) FROM (SELECT countryid FROM countries)
SELECT fullname, id, COUNT(model) AS num_models FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY fullname, id
SELECT c.id, c.fullname, COUNT(m.modelid) AS num_models FROM car_makers c LEFT JOIN model_list m ON c.id = m.maker GROUP BY c.id
SELECT model_list.model FROM model_list, cars_data, car_names WHERE model_list.modelid = cars_data.id AND model_list.model = car_names.model AND cars_data.horsepower = (SELECT MIN(horsepower) FROM cars_data) ORDER BY model_list.model LIMIT 1
SELECT model_list.model FROM model_list INNER JOIN car_names ON model_list.model = car_names.model INNER JOIN cars_data ON car_names.makeid = cars_data.id ORDER BY cars_data.horsepower LIMIT 1
SELECT model FROM model_list WHERE modelid IN (SELECT modelid FROM car_names WHERE makeid = (SELECT makeid FROM cars_data WHERE weight < (SELECT AVG(weight) FROM cars_data)))
SELECT model FROM model_list WHERE EXISTS (SELECT 1 FROM car_names WHERE model_list.modelid = car_names.modelid AND makeid = cars_data.id AND weight < (SELECT AVG(weight) FROM cars_data))
SELECT DISTINCT maker FROM car_makers WHERE id IN (SELECT id FROM cars_data WHERE year = 1970)
SELECT DISTINCT model_list.maker FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year = 1970
SELECT car_names.make, MIN(cars_data.year) as production_time FROM car_names INNER JOIN cars_data ON car_names.makeid = cars_data.id GROUP BY car_names.make
SELECT model_list.maker, year FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.model = model_list.model INNER JOIN car_makers ON model_list.maker = car_makers.id WHERE year = (SELECT MIN(year) FROM cars_data) LIMIT 1
SELECT DISTINCT model FROM model_list WHERE model IN (SELECT model FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE year > 1980))
SELECT car_names.model FROM model_list INNER JOIN car_names ON model_list.model = car_names.model WHERE makeid IN (SELECT id FROM cars_data WHERE year > 1980)
SELECT c.continent, COUNT(DISTINCT cm.id) AS maker_count FROM continents c JOIN countries co ON c.contid = co.continent JOIN car_makers cm ON co.countryid = cm.country GROUP BY c.continent
SELECT c.continent, COUNT(cm.maker) AS num_car_makers FROM continents c LEFT JOIN countries co ON c.contid = co.continent LEFT JOIN car_makers cm ON co.countryid = cm.country GROUP BY c.continent
SELECT c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country GROUP BY c.countryid, c.countryname ORDER BY COUNT(cm.maker) DESC LIMIT 1
SELECT countryname FROM countries WHERE countryid = (SELECT country FROM car_makers GROUP BY country HAVING COUNT(id) = (SELECT COUNT(id) AS maker_count FROM car_makers GROUP BY country ORDER BY maker_count DESC LIMIT 1))
SELECT car_makers.fullname, COUNT(model_list.modelid) AS model_count FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.fullname
SELECT maker, COUNT(modelid) AS model_count, car_makers.id, car_makers.fullname FROM model_list INNER JOIN car_makers ON car_makers.id = model_list.maker GROUP BY maker, car_makers.id, car_makers.fullname
SELECT accelerate FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE model = 'amc hornet sportabout (sw)')
SELECT cars_data.accelerate FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.makeid = model_list.modelid WHERE car_names.model = 'amc hornet sportabout (sw)'
SELECT COUNT(maker) FROM car_makers JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = 'france'
SELECT COUNT(DISTINCT maker) FROM car_makers WHERE country IN (SELECT countryid FROM countries WHERE countryname = 'France')
SELECT count(model) FROM model_list WHERE maker IN (SELECT id FROM car_makers WHERE country = (SELECT countryid FROM countries WHERE countryname = 'usa'))
SELECT COUNT(*) FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE country = 'United States') GROUP BY model, maker
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 EXCEPT SELECT AVG(mpg) FROM cars_data WHERE cylinders <> 4
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 EXCEPT SELECT AVG(mpg) FROM cars_data
SELECT weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight FETCH FIRST ROW ONLY
SELECT MIN(weight) AS min_weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight LIMIT 1
SELECT maker, model FROM car_makers INNER JOIN model_list ON car_makers.id = model_list.maker INNER JOIN car_names ON car_names.model = model_list.model GROUP BY maker, model
SELECT maker, model FROM car_makers JOIN model_list USING (maker)
SELECT c.countryid, c.countryname FROM countries c INNER JOIN car_makers m ON c.countryid = m.country GROUP BY c.countryid
SELECT c.countryid, c.countryname FROM countries c, car_makers cm WHERE c.countryid = cm.country GROUP BY c.countryid, c.countryname
SELECT COUNT(*) FROM cars_data WHERE horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE horsepower > 150 UNION ALL SELECT COUNT(*) FROM cars_data WHERE horsepower > 150
SELECT year, AVG(weight) AS avg_weight FROM cars_data GROUP BY year
SELECT year, AVG(weight) AS average_weight, AVG(year) AS average_year FROM cars_data WHERE weight > 3000 GROUP BY year
SELECT c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country WHERE c.continent = 'europe' GROUP BY c.countryname HAVING COUNT(DISTINCT cm.maker) >= 3
SELECT c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country WHERE c.continent = (SELECT contid FROM continents WHERE continent = 'europe') GROUP BY c.countryname HAVING COUNT(DISTINCT cm.maker) >= 3
SELECT MAX(horsepower), make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cylinders = 3
SELECT car_makers.fullname, MAX(cars_data.horsepower) FROM car_makers, model_list, car_names, cars_data WHERE car_makers.id = model_list.maker AND model_list.model = car_names.model AND car_names.makeid = cars_data.id AND cars_data.cylinders = 3 GROUP BY car_makers.fullname
SELECT car_names.model, mpg FROM model_list RIGHT JOIN car_names ON model_list.model = car_names.model RIGHT JOIN cars_data ON car_names.makeid = cars_data.id ORDER BY mpg DESC LIMIT 1
SELECT c.model FROM cars_data c JOIN (SELECT model, MAX(mpg) AS max_mpg FROM cars_data GROUP BY model) m ON c.model = m.model AND c.mpg = m.max_mpg
SELECT AVG(horsepower) FROM cars_data WHERE year < 1980 AND id IN (SELECT makeid FROM car_names WHERE model IN (SELECT modelid FROM model_list WHERE year < 1980))
SELECT avg(horsepower) as avg_horsepower FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.model = model_list.model WHERE model_list.year < 1980
SELECT AVG(edispl) FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE model = (SELECT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE maker = 'volvo')))
SELECT AVG(edispl) FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE model_list.maker = 'volvo'
SELECT cylinders, MAX(accelerate) AS max_accelerate FROM cars_data GROUP BY cylinders
SELECT DISTINCT cylinders, (SELECT MAX(accelerate) FROM cars_data WHERE cylinders = c.cylinders) AS max_accelerate FROM cars_data c
SELECT model, version_count FROM (SELECT model, COUNT(model) as version_count FROM model_list GROUP BY model ORDER BY version_count DESC) LIMIT 1
SELECT model, versions FROM (SELECT model, COUNT(DISTINCT make) AS versions FROM car_names GROUP BY model) WHERE versions = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT make) AS cnt FROM car_names GROUP BY model))
SELECT COUNT(*) FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid WHERE cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4 OFFSET 0
SELECT COUNT(*) FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid WHERE year = 1980
SELECT SUM(1) FROM cars_data WHERE year = 1980
SELECT COUNT(DISTINCT model) FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'American Motor Company')
SELECT COUNT(modelid) FROM model_list WHERE maker IN (SELECT id FROM car_makers WHERE fullname = 'American Motor Company')
SELECT id, fullname FROM car_makers WHERE id IN (SELECT maker FROM model_list GROUP BY maker HAVING COUNT(*) > 3)
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker FROM model_list GROUP BY maker HAVING COUNT(modelid) > 3)
SELECT DISTINCT model FROM model_list WHERE maker IN (SELECT id FROM car_makers WHERE fullname = 'General Motors') OR EXISTS (SELECT 1 FROM cars_data WHERE cars_data.id = model_list.modelid AND weight > 3500)
SELECT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'General Motors') UNION SELECT model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id HAVING cars_data.weight > 3500
SELECT year FROM cars_data WHERE weight >= 3000 AND weight <= 4000 LIMIT 10
SELECT year FROM (SELECT year, weight FROM cars_data WHERE weight < 4000 UNION SELECT year, weight FROM cars_data WHERE weight > 3000) GROUP BY year HAVING COUNT(DISTINCT weight) > 1
SELECT c.horsepower FROM cars_data c WHERE c.accelerate = (SELECT max(accelerate) FROM cars_data)
SELECT c.horsepower FROM cars_data c WHERE c.accelerate = (SELECT MAX(accelerate) FROM cars_data)
SELECT cylinders FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE model = 'volvo') ORDER BY accelerate LIMIT 1
SELECT cylinders FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE model = 'volvo') ORDER BY accelerate LIMIT 1
SELECT count(*) FROM cars_data WHERE accelerate > (SELECT max(horsepower) FROM cars_data) LIMIT 1
SELECT COUNT(*) FROM (SELECT * FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data))
SELECT COUNT(*) FROM ( SELECT countries.countryid FROM car_makers JOIN countries ON car_makers.country = countries.countryid GROUP BY countries.countryid HAVING COUNT(*) > 2 ) AS subquery
SELECT COUNT(*) FROM (SELECT c.countryid, COUNT(DISTINCT m.id) AS num_makers FROM countries c INNER JOIN car_makers m ON c.countryid = m.country GROUP BY c.countryid HAVING num_makers > 2) AS subquery
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6 LIMIT 1
SELECT COUNT(*) AS "Number of cars with over 6 cylinders" FROM cars_data WHERE cylinders > 6
SELECT model FROM model_list WHERE cylinders = 4 AND horsepower = (SELECT MAX(horsepower) FROM model_list WHERE cylinders = 4) LIMIT 1
SELECT model, MAX(horsepower) FROM cars_data WHERE cylinders = 4 GROUP BY model HAVING MAX(horsepower) = (SELECT MAX(horsepower) FROM cars_data WHERE cylinders = 4)
SELECT makeid, make FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE horsepower > (SELECT MIN(horsepower) FROM cars_data) AND cylinders <= 3)
SELECT c.makeid, c.make FROM car_names c JOIN cars_data d ON c.makeid = d.id WHERE d.cylinders < 4 AND d.horsepower < (SELECT MIN(horsepower) FROM cars_data) GROUP BY c.makeid, c.make
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 AND year < 1980 ORDER BY mpg DESC LIMIT 1
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 OR year < 1980 ORDER BY mpg DESC LIMIT 1
SELECT car_names.model FROM model_list JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE weight < 3500 AND car_makers.fullname != 'Ford Motor Company'
SELECT model FROM car_names WHERE EXISTS (SELECT id FROM cars_data WHERE weight < 3500 AND makeid = cars_data.id) AND makeid NOT IN (SELECT makeid FROM car_names WHERE model = 'ford')
SELECT countryname FROM countries LEFT JOIN car_makers ON countries.countryid = car_makers.country WHERE car_makers.country IS NULL
SELECT countryname FROM countries WHERE NOT EXISTS (SELECT 1 FROM car_makers WHERE car_makers.country = countries.countryid)
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker FROM model_list GROUP BY maker HAVING COUNT(modelid) > 1)
SELECT cm.id, cm.maker FROM car_makers cm JOIN (SELECT maker, COUNT(*) as model_count FROM model_list GROUP BY maker HAVING model_count >= 2) ml ON cm.id = ml.maker JOIN (SELECT make, COUNT(*) as car_count FROM car_names GROUP BY make HAVING car_count > 3) cn ON cm.id = cn.make
SELECT countryid, countryname FROM countries WHERE countryid IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(id) > 3) OR countryid IN (SELECT country FROM car_makers JOIN model_list ON car_makers.id = model_list.maker WHERE model = 'fiat')
SELECT c.countryid, c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country GROUP BY c.countryid HAVING COUNT(DISTINCT cm.id) > 3 UNION SELECT c.countryid, c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country JOIN model_list ml ON cm.id = ml.maker WHERE ml.model = 'fiat'
SELECT airports.country FROM airlines JOIN airports ON airlines.abbreviation = airports.countryabbrev WHERE airlines.airline = 'JetBlue Airways'
SELECT DISTINCT country FROM airlines WHERE airline LIKE '%JetBlue%'
SELECT a.abbreviation FROM airports AS a JOIN flights AS f ON a.airportcode = f.sourceairport WHERE f.airline = 'JetBlue Airways'
SELECT DISTINCT abbreviation FROM airlines WHERE airline = 'JetBlue Airways'
SELECT DISTINCT airline, abbreviation FROM airlines WHERE country = 'USA'
SELECT DISTINCT airline, abbreviation FROM airlines WHERE country = 'USA' ORDER BY airline
SELECT DISTINCT airportcode, airportname FROM airports WHERE city = 'Anthony'
SELECT DISTINCT airportcode, airportname FROM airports WHERE city = 'Anthony'
SELECT COUNT(DISTINCT airline) FROM airlines
SELECT COUNT(abbreviation) FROM airlines
SELECT COUNT(*) AS "Number of Airports" FROM airports
SELECT COUNT(1) FROM airports
SELECT EXISTS (SELECT 1 FROM flights) AS any_flights
SELECT SUM(1) FROM flights
SELECT airline FROM airlines WHERE abbreviation = 'UAL' GROUP BY airline
SELECT max(airline) FROM airlines WHERE abbreviation = 'UAL'
SELECT COUNT(*) FROM airlines WHERE country = 'USA'
SELECT COUNT(1) FROM airlines WHERE country = 'USA'
SELECT city, country FROM airports WHERE airportname = 'Alton'
SELECT city, country FROM airports WHERE airportcode = (SELECT sourceairport FROM flights WHERE destairport IN (SELECT airportcode FROM airports WHERE city = 'Alton'))
SELECT MAX(airportname) FROM airports WHERE airportcode = 'AKO'
SELECT airportname FROM airports WHERE airportcode = 'AKO' EXCEPT SELECT airportname FROM airports WHERE airportcode != 'AKO'
SELECT airportname FROM airports WHERE city = 'Aberdeen'
SELECT airportname FROM airports WHERE city = 'Aberdeen' UNION SELECT airportname FROM airports WHERE city = 'Aberdeen'
SELECT COUNT(*) FROM flights f INNER JOIN airports a ON f.sourceairport = a.airportcode WHERE f.sourceairport = 'APG'
SELECT COUNT(1) FROM flights WHERE sourceairport = 'APG'
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode AND airports.airportname = 'ATO'
SELECT COUNT(flightno) AS num_flights FROM flights WHERE destairport = 'ATO' INTERSECT SELECT COUNT(flightno) AS num_flights FROM flights WHERE destairport = 'ATO'
SELECT COUNT(*) FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') GROUP BY sourceairport
SELECT COUNT(*) FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND airports.city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE destairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') GROUP BY destairport
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.destairport = airports.airportcode WHERE city = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = 'Aberdeen' AND flights.destairport = (SELECT airportcode FROM airports WHERE city = 'Ashley')
SELECT COUNT(*) FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') AND destairport = (SELECT airportcode FROM airports WHERE city = 'Ashley') GROUP BY sourceairport, destairport
SELECT COUNT(*) FROM flights WHERE airline IN (SELECT airline FROM airlines WHERE abbreviation = 'JetBlue Airways')
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.airline = 'JetBlue Airways'
SELECT count(*) FROM airlines JOIN flights ON airlines.airline = flights.airline JOIN airports ON flights.destairport = airports.airportcode WHERE airlines.airline = 'United Airlines' AND airports.airportname = 'Airport ASY'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = 'ASY' EXCEPT SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = 'ASY' LIMIT 1
SELECT COUNT(*) FROM flights WHERE airline LIKE 'United Airlines' AND sourceairport LIKE 'AHD'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND sourceairport = 'AHD' HAVING COUNT(*) > 0
SELECT count(*) FROM flights, airports WHERE airline = 'United Airlines' AND destairport = airportcode AND airportname = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airline = 'United Airlines' AND airports.city = 'Aberdeen'
SELECT city, COUNT(*) AS num_arriving_flights FROM airports JOIN flights ON airports.airportcode = flights.destairport GROUP BY city ORDER BY num_arriving_flights DESC LIMIT 1
SELECT city FROM ( SELECT city, COUNT(destairport) AS dest_count FROM flights JOIN airports ON flights.destairport = airports.airportcode GROUP BY city ) a ORDER BY dest_count DESC LIMIT 1
SELECT city, COUNT(sourceairport) AS num_departing_flights FROM airports JOIN flights USING (airportcode) GROUP BY city ORDER BY num_departing_flights DESC LIMIT 1
SELECT a.city, COUNT(f.sourceairport) AS freq FROM flights f INNER JOIN airports a ON f.sourceairport = a.airportcode GROUP BY f.sourceairport ORDER BY freq DESC LIMIT 1
SELECT destairport, COUNT(*) AS num_flights FROM flights GROUP BY destairport ORDER BY num_flights DESC LIMIT 1
SELECT A.airportcode FROM (SELECT destairport, COUNT(*) AS num_flights FROM flights GROUP BY destairport ORDER BY num_flights DESC LIMIT 1) A
SELECT airportcode FROM (SELECT destairport, COUNT(*) as cnt FROM flights GROUP BY destairport ORDER BY cnt LIMIT 1) AS subquery
SELECT a.airportcode FROM airports a JOIN flights f ON a.airportcode = f.destairport GROUP BY a.airportcode ORDER BY COUNT(*) ASC LIMIT 1
SELECT a1.airline FROM (SELECT airline, COUNT(*) AS flight_count FROM flights GROUP BY airline) a1 LEFT JOIN (SELECT airline, COUNT(*) AS flight_count FROM flights GROUP BY airline) a2 ON a1.flight_count < a2.flight_count WHERE a2.airline IS NULL
SELECT airline FROM (SELECT airline, RANK() OVER (ORDER BY COUNT(*) DESC) AS flight_rank FROM flights GROUP BY airline) AS ranked_flights WHERE flight_rank = 1
SELECT abbreviation, country FROM airlines WHERE uid = (SELECT uid FROM airlines WHERE airline = (SELECT airline FROM (SELECT airline, COUNT(*) as cnt FROM flights GROUP BY airline ORDER BY cnt LIMIT 1)))
SELECT abbreviation, country FROM airlines WHERE uid = ( SELECT uid FROM airlines JOIN flights ON flights.airline = airlines.airline GROUP BY airline ORDER BY COUNT(*) LIMIT 1 )
SELECT airline FROM flights WHERE sourceairport = 'AHD'
SELECT airline FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND sourceairport = 'AHD'
SELECT DISTINCT a.airline FROM flights f LEFT JOIN airlines a ON f.airline = a.airline WHERE f.destairport = 'AHD'
SELECT DISTINCT a.airline FROM flights AS f INNER JOIN airlines AS a ON f.airline = a.airline WHERE f.destairport = 'AHD'
SELECT airline FROM flights WHERE destairport = 'APG' AND airline IN (SELECT airline FROM flights WHERE destairport = 'CVO')
SELECT a1.airline FROM airlines a1 JOIN flights f1 ON a1.airline = f1.airline JOIN flights f2 ON a1.airline = f2.airline WHERE f1.sourceairport = 'APG' AND f2.sourceairport = 'CVO'
SELECT DISTINCT airline FROM flights WHERE sourceairport = 'CVO' EXCEPT SELECT airline FROM flights WHERE sourceairport = 'APG'
SELECT DISTINCT f.airline FROM flights f LEFT JOIN flights f2 ON f.airline = f2.airline AND f2.sourceairport = 'APG' WHERE f.destairport = 'CVO' AND f2.sourceairport IS NULL
SELECT airline FROM flights GROUP BY airline HAVING EXISTS (SELECT * FROM flights AS f2 WHERE f2.airline = flights.airline HAVING COUNT(*) >= 10)
SELECT DISTINCT airline FROM flights WHERE airline IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(*) >= 10)
SELECT airline FROM airlines WHERE airline IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(flightno) < 200)
SELECT abbreviation FROM airlines a WHERE NOT EXISTS (SELECT * FROM flights f WHERE f.airline = a.airline GROUP BY f.airline HAVING COUNT(*) >= 200)
SELECT f.flightno FROM flights f, airlines a WHERE f.airline = a.uid AND a.airline = 'United Airlines'
SELECT flightno FROM flights INNER JOIN airlines ON flights.airline = airlines.abbreviation WHERE airlines.airline = 'United Airlines'
SELECT f.flightno FROM flights f INNER JOIN airports a ON f.sourceairport = a.airportcode WHERE a.airportname = 'APG'
SELECT flightno FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.airportcode = 'APG'
SELECT flightno FROM flights WHERE destairport IN (SELECT airportcode FROM airports WHERE airportname = 'APG')
SELECT flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.airportcode = 'APG'
SELECT flightno FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') ORDER BY flightno
SELECT flightno FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND airports.city = 'Aberdeen'
SELECT flightno FROM flights WHERE EXISTS (SELECT * FROM airports WHERE airports.airportcode = flights.destairport AND city = 'Aberdeen')
SELECT DISTINCT flightno FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE city IN ('Aberdeen', 'Abilene')
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = 'Aberdeen' OR airports.city = 'Abilene'
SELECT airportname FROM airports WHERE airportcode NOT IN (SELECT sourceairport FROM flights) AND airportcode NOT IN (SELECT destairport FROM flights)
SELECT airportname FROM airports WHERE NOT EXISTS (SELECT * FROM flights WHERE sourceairport = airportcode) AND NOT EXISTS (SELECT * FROM flights WHERE destairport = airportcode)
SELECT EXISTS (SELECT 1 FROM employee limit 1)
SELECT MAX(employee_id) FROM employee
SELECT name FROM employee ORDER BY age ASC, name
SELECT name FROM employee ORDER BY age
SELECT DISTINCT city, COUNT(employee_id) AS num_employees FROM employee GROUP BY city
SELECT city, (SELECT COUNT(*) FROM employee WHERE city = e.city) as employee_count FROM employee e GROUP BY city
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING COUNT(*) > 1
SELECT DISTINCT e.city FROM employee e JOIN employee e2 ON e.city = e2.city AND e.age < 30 AND e2.age < 30 AND e.employee_id <> e2.employee_id
SELECT location, COUNT(*) AS num_shops FROM shop GROUP BY location
SELECT s.location, num_shops FROM shop s INNER JOIN (SELECT location, COUNT(*) as num_shops FROM shop GROUP BY location) counts ON s.location = counts.location
SELECT manager_name, district FROM shop WHERE number_products = (SELECT MAX(number_products) FROM shop)
SELECT manager_name, district FROM shop WHERE number_products = (SELECT MAX(number_products) FROM shop) FETCH FIRST ROW ONLY
SELECT MIN(number_products) FROM shop
SELECT MIN(number_products) FROM shop
SELECT name, location, district FROM shop ORDER BY number_products DESC, name ASC, location DESC
SELECT name, location, district FROM shop ORDER BY number_products DESC OFFSET 5
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop) AND location IN (SELECT location FROM shop)
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop) AND location IS NOT NULL ORDER BY name
SELECT name FROM employee WHERE employee_id = ( SELECT employee_id FROM ( SELECT employee_id, COUNT(*) as awards_count FROM evaluation GROUP BY employee_id ORDER BY awards_count DESC LIMIT 1 ) )
SELECT name FROM employee WHERE employee_id = (SELECT employee_id FROM evaluation GROUP BY employee_id HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) as c FROM evaluation GROUP BY employee_id)))
SELECT e.name FROM employee e WHERE EXISTS (SELECT 1 FROM evaluation WHERE employee_id = e.employee_id ORDER BY bonus DESC LIMIT 1)
SELECT e.name FROM employee e JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.bonus = (SELECT MAX(bonus) FROM evaluation)
SELECT e.name FROM employee e LEFT JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.employee_id IS NULL
SELECT e.name FROM employee e LEFT JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.employee_id IS NULL
SELECT name FROM shop WHERE shop_id = (SELECT shop_id FROM hiring GROUP BY shop_id ORDER BY COUNT(employee_id) DESC LIMIT 1 OFFSET 0 FETCH NEXT ROW ONLY)
SELECT name FROM shop GROUP BY shop_id ORDER BY COUNT(employee_id) DESC LIMIT 1
SELECT DISTINCT s.name FROM shop s LEFT JOIN hiring h ON s.shop_id = h.shop_id WHERE h.shop_id IS NULL
SELECT s.name FROM shop s WHERE NOT EXISTS (SELECT 1 FROM hiring h WHERE h.shop_id = s.shop_id)
SELECT shop.name, COUNT(*) as num_employees FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY shop.name
SELECT name, COUNT(employee_id) AS num_employees FROM hiring INNER JOIN shop ON shop.shop_id = hiring.shop_id GROUP BY shop.name
SELECT SUM(e.bonus) FROM evaluation e
SELECT total_bonus_amount FROM (SELECT SUM(bonus) AS total_bonus_amount FROM evaluation)
SELECT shop_id, employee_id, start_from, is_full_time FROM hiring
SELECT shop_id, employee_id, start_from, is_full_time FROM hiring
SELECT district FROM shop WHERE (number_products < 3000 AND district IN (SELECT district FROM shop WHERE number_products > 10000))
SELECT district FROM shop WHERE number_products < 3000 AND district IN (SELECT district FROM shop WHERE number_products > 10000) LIMIT 10
SELECT COUNT(DISTINCT district) FROM shop
SELECT COUNT(DISTINCT location) FROM shop
SELECT COUNT(DISTINCT document_id) FROM (SELECT document_id FROM documents UNION SELECT document_id FROM paragraphs)
SELECT COUNT(*) AS document_count FROM documents GROUP BY document_id HAVING COUNT(*) > 0
SELECT document_id, document_name, document_description FROM documents
SELECT document_id, document_name, document_description FROM documents WHERE document_description IS NOT NULL
SELECT document_name, template_id FROM documents WHERE document_description LIKE '%w%'
SELECT document_name, templates.template_id FROM documents INNER JOIN templates ON documents.template_id = templates.template_id WHERE document_description LIKE '%w%'
SELECT d.document_id, d.template_id, d.document_description FROM documents d WHERE d.document_name = 'Robbin CV'
SELECT document_id, template_id, document_description FROM documents WHERE document_name = 'Robbin CV'
SELECT COUNT(DISTINCT template_id) FROM (SELECT template_id FROM documents UNION SELECT template_id FROM templates)
SELECT COUNT(DISTINCT templates.template_id) AS num_templates_used FROM templates JOIN documents ON documents.template_id = templates.template_id
SELECT COUNT(*) FROM documents WHERE template_id = (SELECT template_id FROM templates WHERE template_type_code = 'PPT')
SELECT COUNT(*) FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'PPT')
SELECT t.template_id, (SELECT COUNT(*) FROM documents WHERE template_id = t.template_id) AS num_documents FROM templates t
SELECT template_id, (SELECT COUNT(*) FROM documents WHERE template_id = templates.template_id) AS num_documents FROM templates
SELECT t.template_id, t.template_type_code FROM templates t JOIN documents d ON t.template_id = d.template_id GROUP BY t.template_id HAVING COUNT(*) = ( SELECT COUNT(*) FROM documents GROUP BY template_id ORDER BY COUNT(*) DESC LIMIT 1 )
SELECT template_id, template_type_code FROM templates GROUP BY template_id, template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_id FROM templates WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id HAVING COUNT(document_id) > 1)
SELECT template_id FROM (SELECT template_id, COUNT(*) AS doc_count FROM documents GROUP BY template_id HAVING COUNT(*) > 1 ) AS subquery
SELECT template_id FROM templates WHERE template_id NOT IN (SELECT DISTINCT template_id FROM documents)
SELECT template_id FROM templates WHERE NOT EXISTS (SELECT * FROM documents WHERE documents.template_id = templates.template_id)
SELECT COUNT(*) FROM (SELECT DISTINCT template_id FROM templates)
SELECT SUM(1) FROM templates
SELECT template_id, version_number, template_type_code FROM templates
SELECT template_id, version_number, template_type_code FROM templates
SELECT DISTINCT templates.template_type_code FROM templates INNER JOIN documents ON templates.template_id = documents.template_id
SELECT template_type_code FROM templates WHERE template_type_code IN (SELECT template_type_code FROM ref_template_types)
SELECT DISTINCT template_id FROM templates WHERE template_type_code = 'PP' OR template_type_code = 'PPT'
SELECT DISTINCT template_id FROM templates WHERE template_type_code = 'PP' OR template_type_code = 'PPT'
SELECT COUNT(*) FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE template_type_description = 'CV'
SELECT COUNT(DISTINCT template_id) FROM templates WHERE template_type_code = 'CV'
SELECT version_number, template_type_code FROM templates WHERE version_number > 5 ORDER BY version_number
SELECT version_number, template_type_code FROM templates WHERE version_number > 5 UNION SELECT version_number, template_type_code FROM templates WHERE template_type_code IN (SELECT template_type_code FROM documents)
SELECT template_type_code, (SELECT COUNT(template_id) FROM templates WHERE templates.template_type_code = ref_template_types.template_type_code) AS num_templates FROM ref_template_types
SELECT template_type_code, COUNT(template_id) as num_templates FROM templates GROUP BY template_type_code HAVING COUNT(template_id) > 0
SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code HAVING COUNT(template_id) = (SELECT MAX(template_count) FROM (SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code))
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t.template_type_code FROM templates t LEFT JOIN (SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code) t_count ON t.template_type_code = t_count.template_type_code WHERE COALESCE(template_count, 0) < 3
SELECT rt.template_type_code FROM ref_template_types rt WHERE NOT EXISTS (SELECT template_id FROM templates t WHERE t.template_type_code = rt.template_type_code GROUP BY template_id HAVING COUNT(template_id) >= 3)
SELECT version_number, template_type_code FROM templates WHERE version_number = (SELECT MIN(version_number) FROM templates) ORDER BY template_type_code ASC LIMIT 1
SELECT MIN(version_number) AS min_version, template_type_code FROM templates GROUP BY template_type_code
SELECT template_type_code FROM templates WHERE template_id IN (SELECT template_id FROM documents WHERE document_name = 'Data base')
SELECT template_type_code FROM templates JOIN documents ON templates.template_id = documents.template_id WHERE document_name = 'Data base'
SELECT document_name FROM documents WHERE EXISTS (SELECT 1 FROM templates WHERE templates.template_id = documents.template_id AND templates.template_type_code = 'BK')
SELECT DISTINCT document_name FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = 'BK'
SELECT template_type_code, COUNT(*) AS document_count FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY template_type_code
SELECT template_type_code, COUNT(DISTINCT documents.document_id) AS num_documents FROM templates JOIN documents ON templates.template_id = documents.template_id GROUP BY template_type_code
SELECT template_type_code FROM (SELECT template_type_code, MAX(doc_count) AS max_docs FROM (SELECT T.template_type_code, COUNT(D.document_id) AS doc_count FROM templates T JOIN documents D ON T.template_id = D.template_id GROUP BY T.template_type_code)) WHERE doc_count = max_docs
SELECT tt.template_type_code FROM ref_template_types tt JOIN templates t ON tt.template_type_code = t.template_type_code GROUP BY tt.template_type_code ORDER BY COUNT(t.template_id) DESC LIMIT 1
SELECT templates.template_type_code FROM ref_template_types LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code WHERE templates.template_type_code IS NULL
SELECT templates.template_type_code FROM ref_template_types LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code WHERE templates.template_type_code IS NULL
SELECT template_type_code, template_type_description FROM ref_template_types
SELECT ref_template_types.template_type_code, template_type_description FROM templates JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
SELECT template_type_description FROM ref_template_types t WHERE t.template_type_code = 'AD'
SELECT template_type_description FROM ref_template_types rt WHERE rt.template_type_code = 'AD'
SELECT template_type_code FROM ref_template_types WHERE template_type_description LIKE 'Book'
SELECT t.template_type_code FROM ref_template_types t WHERE t.template_type_description = 'Book'
SELECT DISTINCT template_type_description FROM ref_template_types INNER JOIN templates ON ref_template_types.template_type_code = templates.template_type_code INNER JOIN documents ON templates.template_id = documents.template_id INNER JOIN paragraphs ON documents.document_id = paragraphs.document_id
SELECT DISTINCT rt.template_type_description FROM ref_template_types rt JOIN templates t ON rt.template_type_code = t.template_type_code JOIN documents d ON t.template_id = d.template_id
SELECT template_id FROM templates t WHERE template_type_code = ANY (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Presentation')
SELECT template_id FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE ref_template_types.template_type_description = 'Presentation'
SELECT (SELECT COUNT(*) FROM paragraphs) AS total_paragraphs
SELECT 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 AS paragraph_count
SELECT COUNT(*) FROM (SELECT * FROM paragraphs WHERE document_id IN (SELECT document_id FROM documents WHERE document_name = 'Summer Show'))
SELECT COUNT(*) FROM paragraphs WHERE document_id = (SELECT document_id FROM documents WHERE document_name = 'Summer Show') GROUP BY document_id
SELECT paragraph_text FROM paragraphs WHERE paragraph_text LIKE 'Korea'
SELECT paragraph_text, other_details FROM paragraphs WHERE paragraph_text LIKE '%Korea%'
SELECT paragraph_id, paragraph_text FROM paragraphs, documents WHERE paragraphs.document_id = documents.document_id AND documents.document_name = 'Welcome to NY'
SELECT paragraph_id, paragraph_text FROM paragraphs JOIN documents ON documents.document_id = paragraphs.document_id WHERE documents.document_name = 'Welcome to NY'
SELECT DISTINCT paragraph_text FROM paragraphs LEFT JOIN documents ON paragraphs.document_id = documents.document_id WHERE document_name = 'Customer reviews'
SELECT paragraph_text FROM paragraphs p, documents d WHERE p.document_id = d.document_id AND d.document_name = 'Customer reviews'
SELECT d.document_id, COUNT(p.paragraph_id) AS paragraph_count FROM documents d LEFT JOIN paragraphs p ON d.document_id = p.document_id GROUP BY d.document_id ORDER BY d.document_id
SELECT d.document_id, COUNT(p.paragraph_id) AS num_paragraphs FROM documents d JOIN paragraphs p ON d.document_id = p.document_id GROUP BY d.document_id ORDER BY d.document_id
SELECT document_id, document_name, (SELECT COUNT(*) FROM paragraphs WHERE paragraphs.document_id = documents.document_id) AS paragraph_count FROM documents
SELECT d.document_id, d.document_name, (SELECT COUNT(*) FROM paragraphs WHERE paragraphs.document_id = d.document_id) AS num_paragraphs FROM documents d
SELECT document_id FROM documents WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) >= 2)
SELECT D.document_id FROM documents D JOIN paragraphs P ON D.document_id = P.document_id GROUP BY D.document_id HAVING COUNT(*) >= 2
SELECT d.document_id, d.document_name FROM documents d JOIN paragraphs p ON d.document_id = p.document_id GROUP BY d.document_id, d.document_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT documents.document_id, document_name FROM documents WHERE documents.document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) = MAX(COUNT(paragraph_id)))
SELECT document_id FROM paragraphs p1 WHERE NOT EXISTS (SELECT 1 FROM paragraphs p2 WHERE p2.document_id = p1.document_id AND p2.paragraph_id <> p1.paragraph_id)
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) LIMIT 1
SELECT document_id FROM paragraphs WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING(count(paragraph_id) >= 1) AND (count(paragraph_id) <= 2))
SELECT document_id FROM documents WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) BETWEEN 1 AND 2)
SELECT document_id FROM paragraphs WHERE paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM paragraphs WHERE paragraph_text = 'Ireland'
SELECT document_id FROM paragraphs WHERE paragraph_text = 'Brazil' UNION SELECT document_id FROM paragraphs WHERE paragraph_text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher WHERE teacher_id IS NOT NULL
SELECT DISTINCT name FROM teacher ORDER BY age
SELECT name FROM teacher ORDER BY age + 0 ASC
SELECT DISTINCT age, hometown FROM teacher
SELECT age, hometown FROM teacher
SELECT name FROM teacher WHERE EXISTS (SELECT * FROM teacher t2 WHERE t2.teacher_id = teacher.teacher_id AND t2.hometown <> 'Little Lever Urban District')
SELECT name FROM teacher WHERE hometown <> 'Little Lever Urban District'
SELECT name FROM teacher WHERE age = 32 OR age = 33 GROUP BY name
SELECT name FROM teacher WHERE age = 32 UNION SELECT name FROM teacher WHERE age = 33
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT hometown FROM teacher WHERE age = (SELECT MIN(age) FROM teacher) ORDER BY teacher_id DESC LIMIT 1
SELECT DISTINCT hometown, COUNT(teacher_id) FROM teacher GROUP BY hometown
SELECT t1.hometown, COUNT(t2.teacher_id) AS num_teachers FROM teacher t1 LEFT JOIN teacher t2 ON t1.hometown = t2.hometown GROUP BY t1.hometown
SELECT hometown FROM (SELECT DISTINCT hometown, COUNT(*) AS num_teachers FROM teacher GROUP BY hometown ORDER BY num_teachers DESC) LIMIT 1
SELECT hometown FROM (SELECT hometown, RANK() OVER (ORDER BY COUNT(teacher_id) DESC) as rnk FROM teacher GROUP BY hometown) WHERE rnk = 1
SELECT DISTINCT t1.hometown FROM teacher t1, teacher t2 WHERE t1.hometown = t2.hometown AND t1.teacher_id != t2.teacher_id
SELECT DISTINCT t1.hometown FROM teacher t1 JOIN teacher t2 ON t1.hometown = t2.hometown AND t1.teacher_id != t2.teacher_id
SELECT teacher.name, course.course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT teacher.name, course.course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT name, course FROM teacher LEFT JOIN course_arrange USING (teacher_id) LEFT JOIN course USING (course_id) ORDER BY name
SELECT teacher.name, course.course FROM teacher, course_arrange, course WHERE teacher.teacher_id = course_arrange.teacher_id AND course_arrange.course_id = course.course_id ORDER BY teacher.name
SELECT t.name FROM teacher t INNER JOIN course_arrange ca ON t.teacher_id = ca.teacher_id INNER JOIN course c ON ca.course_id = c.course_id WHERE c.course = 'Math'
SELECT t.name FROM teacher t JOIN course_arrange ca ON t.teacher_id = ca.teacher_id JOIN course c ON ca.course_id = c.course_id WHERE c.course = 'Math'
SELECT name, (SELECT COUNT(course_id) FROM course_arrange WHERE course_arrange.teacher_id = teacher.teacher_id) FROM teacher
SELECT name, COUNT(course_id) FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY name
SELECT DISTINCT name FROM teacher WHERE teacher_id IN (SELECT teacher_id FROM course_arrange GROUP BY teacher_id HAVING COUNT(course_id) >= 2)
SELECT name FROM teacher WHERE teacher_id IN ( SELECT teacher_id FROM course_arrange GROUP BY teacher_id HAVING COUNT(teacher_id) > 1 )
SELECT name FROM teacher WHERE NOT EXISTS (SELECT * FROM course_arrange WHERE teacher.teacher_id = course_arrange.teacher_id)
SELECT DISTINCT t.name FROM teacher t LEFT JOIN course_arrange ca ON t.teacher_id = ca.teacher_id WHERE ca.teacher_id IS NULL
SELECT COUNT(*) FROM visitor WHERE age < 30 GROUP BY age
SELECT name FROM visitor WHERE level_of_membership > 4 ORDER BY level_of_membership DESC
SELECT AVG(age) AS average_age FROM visitor WHERE level_of_membership <= 4
SELECT name, level_of_membership FROM visitor WHERE level_of_membership > 4 ORDER BY age DESC, name ASC
SELECT museum_id, name FROM museum WHERE num_of_staff = (SELECT MAX(num_of_staff) FROM museum)
SELECT ROUND(AVG(num_of_staff), 2) FROM museum WHERE open_year < 2009
SELECT DISTINCT open_year, num_of_staff FROM museum WHERE name = 'Plaza Museum'
SELECT m.name FROM museum m INNER JOIN (SELECT MIN(num_of_staff) AS min_staff FROM museum WHERE open_year > 2010) min ON m.num_of_staff > min.min_staff
SELECT id, name, age FROM visitor WHERE id IN (SELECT visitor_id FROM visit GROUP BY visitor_id HAVING COUNT(*) > 1) ORDER BY age LIMIT 10
SELECT v.id, v.name, v.level_of_membership FROM visitor v INNER JOIN visit vi ON v.id = vi.visitor_id WHERE vi.total_spent = (SELECT MAX(total_spent) FROM visit)
SELECT museum_id, name FROM museum WHERE museum_id = (SELECT museum_id FROM visit GROUP BY museum_id ORDER BY total_spent DESC LIMIT 1)
SELECT m.name FROM museum m WHERE NOT EXISTS (SELECT 1 FROM visit v WHERE m.museum_id = v.museum_id)
SELECT v.name, v.age FROM visitor v JOIN visit vs ON v.id = vs.visitor_id GROUP BY v.name, v.age ORDER BY SUM(vs.num_of_ticket) DESC LIMIT 1
SELECT AVG(num_of_ticket), MAX(num_of_ticket) FROM visit
SELECT SUM(total_spent) FROM visit JOIN visitor ON visit.visitor_id = visitor.id WHERE visitor.level_of_membership = 1 GROUP BY visitor_id, level_of_membership
SELECT name FROM visitor WHERE id IN (SELECT visitor_id FROM visit WHERE museum_id IN (SELECT museum_id FROM museum WHERE open_year < 2009) ) AND id IN (SELECT visitor_id FROM visit WHERE museum_id IN (SELECT museum_id FROM museum WHERE open_year > 2011) )
SELECT COUNT(*) FROM visit WHERE museum_id NOT IN (SELECT museum_id FROM museum WHERE open_year > 2010)
SELECT count(*) FROM (SELECT DISTINCT museum_id FROM museum WHERE open_year > 2013 OR open_year < 2008)
SELECT (SELECT COUNT(1) FROM players) AS total_players
SELECT MAX(player_id) FROM players
SELECT COUNT(DISTINCT match_num) FROM matches
SELECT SUM(1) FROM matches
SELECT first_name, birth_date FROM players JOIN country_code ON players.country_code = country_code.code WHERE country_code.code = 'USA'
SELECT DISTINCT first_name, birth_date FROM players INNER JOIN matches ON players.player_id = matches.winner_id WHERE matches.winner_ioc = 'USA'
SELECT (SUM(winner_age) + SUM(loser_age)) / (COUNT(winner_age) + COUNT(loser_age)) as average_age FROM (SELECT winner_age FROM matches UNION ALL SELECT loser_age FROM matches)
SELECT AVG(DATE('now') - p1.birth_date) AS average_loser_age, AVG(DATE('now') - p2.birth_date) AS average_winner_age FROM matches JOIN players p1 ON matches.loser_id = p1.player_id JOIN players p2 ON matches.winner_id = p2.player_id
SELECT AVG(r.ranking) FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id GROUP BY m.winner_id
SELECT AVG(ranking) FROM rankings r JOIN matches m ON r.player_id = m.winner_id
SELECT MAX(ranking) AS highest_rank FROM rankings INNER JOIN matches ON rankings.player_id = matches.loser_id GROUP BY loser_id
SELECT MIN(ranking) FROM rankings WHERE player_id = (SELECT player_id FROM players WHERE player_id = loser_id)
SELECT COUNT(DISTINCT country_code) total_country_codes FROM players
SELECT DISTINCT country_code FROM players
SELECT COUNT(DISTINCT p.first_name || ' ' || p.last_name) FROM players p, matches m WHERE p.player_id = m.loser_id
SELECT COUNT(*) FROM (SELECT loser_name FROM matches GROUP BY loser_name)
SELECT m.tourney_name FROM (SELECT tourney_name, COUNT(*) as match_count FROM matches GROUP BY tourney_name) as m WHERE m.match_count > 10
SELECT m.tourney_name FROM (SELECT tourney_name, COUNT(*) as match_count FROM matches GROUP BY tourney_name HAVING match_count > 10) AS m
SELECT first_name, last_name FROM players WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) AND player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT first_name, last_name FROM players WHERE player_id IN ( SELECT winner_id FROM matches WHERE year = 2013 ) AND player_id IN ( SELECT winner_id FROM matches WHERE year = 2016 )
SELECT SUM(CASE WHEN year = 2013 OR year = 2016 THEN 1 ELSE 0 END) FROM matches
SELECT SUM(matches.year = 2013 OR matches.year = 2016) FROM matches
SELECT country_code, first_name FROM (SELECT p.country_code, p.first_name, m.tourney_name FROM players p JOIN matches m ON p.player_id = m.winner_id) AS result GROUP BY country_code, first_name HAVING COUNT(DISTINCT tourney_name) = 2
SELECT p.first_name, p.country_code FROM players p JOIN matches m1 ON p.player_id = m1.winner_id JOIN matches m2 ON p.player_id = m2.winner_id WHERE m1.tourney_name = 'WTA Championships' AND m2.tourney_name = 'Australian Open' GROUP BY p.first_name, p.country_code
SELECT p.first_name, p.country_code FROM players p JOIN ( SELECT player_id, MIN(birth_date) AS min_birth_date FROM players WHERE birth_date IS NOT NULL ) AS sub ON p.birth_date = sub.min_birth_date
SELECT first_name, country_code FROM players p1 WHERE NOT EXISTS (SELECT * FROM players p2 WHERE p2.birth_date < p1.birth_date)
SELECT players.first_name, players.last_name FROM players INNER JOIN matches ON players.player_id = matches.winner_id ORDER BY players.birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players GROUP BY full_name ORDER BY birth_date
SELECT first_name, last_name FROM players WHERE hand = 'L' GROUP BY first_name, last_name ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'left' ORDER BY birth_date DESC
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id ORDER BY COUNT(m.tours) DESC LIMIT 1
SELECT p.first_name, p.country_code FROM players p JOIN rankings r ON p.player_id = r.player_id WHERE r.tours = (SELECT MAX(tours) FROM rankings)
SELECT year FROM matches GROUP BY year HAVING COUNT(*) = (SELECT MAX(match_count) FROM (SELECT year, count(*) as match_count FROM matches GROUP BY year))
SELECT year, (SELECT COUNT(DISTINCT match_num) FROM (SELECT DISTINCT year, match_num FROM matches) sub WHERE sub.year = matches.year) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1
SELECT winner_name, winner_rank_points FROM matches GROUP BY winner_name HAVING COUNT(*) = (SELECT MAX(win_count) FROM (SELECT COUNT(*) AS win_count FROM matches GROUP BY winner_name))
SELECT winner_name, winner_rank_points FROM matches GROUP BY winner_name HAVING winner_rank_points = MAX(winner_rank_points)
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT winner_name, loser_name FROM matches WHERE minutes = (SELECT MAX(minutes) FROM matches) ORDER BY winner_name FETCH FIRST ROW ONLY
SELECT m.winner_name, m.loser_name FROM matches m JOIN (SELECT MAX(minutes) AS max_minutes FROM matches) t ON m.minutes = t.max_minutes
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p INNER JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT first_name, AVG(ranking) AS avg_ranking FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT p.first_name, SUM(r.ranking_points) AS total_ranking_points FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT p.first_name, SUM(r.ranking_points) AS total_points FROM players p INNER JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT country_code, (SELECT COUNT(*) FROM players p2 WHERE p2.country_code = p1.country_code) AS player_count FROM players p1 GROUP BY country_code
SELECT p.country_code, COUNT(DISTINCT p.player_id) as player_count FROM players p LEFT JOIN players p2 ON p.country_code = p2.country_code GROUP BY p.country_code
SELECT p.country_code FROM players p JOIN ( SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code ORDER BY num_players DESC LIMIT 1 ) sub ON p.country_code = sub.country_code
SELECT winner_ioc AS country_code, COUNT(winner_id) AS player_count FROM matches GROUP BY country_code ORDER BY player_count DESC LIMIT 1
SELECT country_code FROM players WHERE country_code IN (SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50)
SELECT winner_ioc AS country_code FROM matches UNION SELECT loser_ioc AS country_code FROM matches GROUP BY country_code HAVING COUNT(DISTINCT winner_id) + COUNT(DISTINCT loser_id) > 50
SELECT ranking_date, COUNT(DISTINCT tours) AS total_tours FROM rankings GROUP BY ranking_date ORDER BY ranking_date
SELECT ranking_date, (SELECT COUNT(*) FROM (SELECT tours FROM rankings WHERE ranking_date = r.ranking_date GROUP BY tours)) AS total_tours FROM rankings AS r GROUP BY ranking_date
SELECT year, COUNT(*) as num_matches FROM matches GROUP BY year
SELECT m.year, count(m.match_num) as num_matches FROM (SELECT distinct year FROM matches) y LEFT JOIN matches m ON m.year = y.year GROUP BY m.year
SELECT p.first_name || ' ' || p.last_name AS winner_name, r.ranking AS winner_rank FROM (SELECT * FROM matches ORDER BY winner_age LIMIT 3) m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id ORDER BY p.birth_date
SELECT winner_name, winner_rank FROM matches WHERE winner_age IN (SELECT winner_age FROM matches ORDER BY winner_age LIMIT 3)
SELECT COUNT(DISTINCT m.winner_id) FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id WHERE tourney_name = 'WTA Championships' AND p.hand = 'L'
SELECT COUNT(DISTINCT winner_id) FROM matches INNER JOIN players ON matches.winner_id = players.player_id WHERE matches.winner_hand = 'L' AND tourney_name = 'WTA Championships'
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches GROUP BY winner_id HAVING MAX(winner_rank_points))
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY SUM(winner_rank_points) DESC LIMIT 1)
SELECT DISTINCT hand, COUNT(player_id) AS player_count FROM players GROUP BY hand
SELECT hand, COUNT(*) AS player_count FROM players GROUP BY hand
SELECT SUM(CASE WHEN disposition_of_ship = 'Captured' THEN 1 ELSE 0 END) AS number_of_ships FROM ship
SELECT name, tonnage FROM ship ORDER BY name DESC COLLATE NOCASE
SELECT b.name, b.date, b.result FROM battle b WHERE b.result IS NOT NULL
SELECT MAX(injured) AS max_death_toll, MIN(injured) AS min_death_toll FROM death JOIN ship ON death.caused_by_ship_id = ship.id GROUP BY ship.name
SELECT (SUM(injured) * 1.0) / COUNT(*) FROM death
SELECT * FROM death d, ship s WHERE d.caused_by_ship_id = s.id AND s.tonnage = 't'
SELECT name, result FROM battle WHERE bulgarian_commander <> 'Boril' AND bulgarian_commander != ''
SELECT id, name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE ship_type = 'Brig') UNION SELECT id, name FROM battle WHERE id IN (SELECT caused_by_ship_id FROM death)
SELECT b.id, b.name FROM battle b JOIN death d ON b.id = d.caused_by_ship_id GROUP BY b.id HAVING SUM(d.killed) > 10
SELECT caused_by_ship_id, ship.name FROM death JOIN ship ON death.caused_by_ship_id = ship.id GROUP BY caused_by_ship_id, ship.name ORDER BY SUM(injured) DESC LIMIT 1
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' ORDER BY name LIMIT 10
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle AND s.tonnage = '225' WHERE s.id IS NULL
SELECT battle.name, battle.date FROM battle INNER JOIN ship ON ship.lost_in_battle = battle.id WHERE ship.name = 'Lettice' OR ship.name = 'HMS Atalanta'
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN ship s ON b.id = s.lost_in_battle WHERE s.id IS NULL AND s.location = 'English Channel'
SELECT note FROM death WHERE note REGEXP 'East'
SELECT line_1, line_2 FROM addresses WHERE line_1 <> '' UNION SELECT line_2, line_1 FROM addresses WHERE line_2 <> ''
SELECT DISTINCT line_1, line_2 FROM addresses
SELECT COUNT(course_name) FROM courses
SELECT SUM(1) FROM courses
SELECT C.course_description FROM courses C JOIN sections S ON C.course_id = S.course_id WHERE S.section_name = 'math'
SELECT c.course_description FROM courses c INNER JOIN sections s ON c.course_id = s.course_id WHERE s.section_name = 'math'
SELECT a.zip_postcode FROM addresses a INNER JOIN cities c ON a.city_id = c.city_id WHERE c.city_name = 'Port Chelsea'
SELECT a.zip_postcode FROM addresses a JOIN departments d ON a.zip_postcode = d.zip_postcode WHERE d.department_name = 'Port Chelsea'
SELECT d.department_id, d.department_name FROM departments d JOIN ( SELECT department_id, COUNT(*) as degree_count FROM degree_programs GROUP BY department_id ORDER BY degree_count DESC LIMIT 1 ) dp ON d.department_id = dp.department_id
SELECT department_id, department_name FROM departments WHERE department_id IN (SELECT department_id FROM degree_programs GROUP BY department_id ORDER BY COUNT(degree_program_id) DESC LIMIT 1)
SELECT COUNT(*) FROM (SELECT department_id FROM degree_programs GROUP BY department_id) AS temp_table
SELECT COUNT(DISTINCT department_name) FROM departments
SELECT COUNT(*) FROM (SELECT DISTINCT degree_summary_name FROM degree_programs) as counts
SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs WHERE department_id IS NOT NULL
SELECT COUNT(*) FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering') LIMIT 1
SELECT COUNT(*) AS total_degrees FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering')
SELECT section_name, section_description FROM sections
SELECT section_name, section_description FROM sections
SELECT course_id, course_name FROM courses WHERE course_id IN (SELECT course_id FROM sections GROUP BY course_id HAVING COUNT(*) <= 2)
SELECT c.course_name, c.course_id FROM courses c LEFT JOIN (SELECT course_id, COUNT(section_id) AS num_sections FROM sections GROUP BY course_id) s ON c.course_id = s.course_id WHERE num_sections < 2 OR num_sections IS NULL
SELECT DISTINCT section_name FROM sections ORDER BY section_name DESC
SELECT section_name FROM sections GROUP BY section_name ORDER BY section_name DESC
SELECT semester_id, semester_name FROM semesters WHERE semester_id = (SELECT semester_id FROM student_enrolment GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT s.semester_id, s.semester_name FROM semesters s JOIN student_enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name HAVING COUNT(se.student_enrolment_id) = (SELECT MAX(enrolment_count) FROM (SELECT semester_id, COUNT(student_enrolment_id) AS enrolment_count FROM student_enrolment GROUP BY semester_id) AS max_enrolment)
SELECT department_description FROM departments WHERE SUBSTR(department_name, 0, 8) = 'Computer'
SELECT department_description FROM departments WHERE department_name LIKE 'Computer%'
SELECT s.first_name, s.middle_name, s.last_name, se.student_id FROM students s JOIN student_enrolment se ON s.student_id = se.student_id WHERE se.degree_program_id IN ( SELECT degree_program_id FROM student_enrolment WHERE semester_id = se.semester_id GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2 )
SELECT student_id, first_name, middle_name, last_name FROM students INNER JOIN student_enrolment ON students.student_id = student_enrolment.student_id GROUP BY student_id HAVING COUNT(DISTINCT degree_program_id) = 2
SELECT first_name, middle_name, last_name FROM students, student_enrolment WHERE students.student_id = student_enrolment.student_id AND degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor')
SELECT first_name, middle_name, last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_summary_name = 'Bachelors'
SELECT degree_summary_name, MAX(num_students_enrolled) FROM (SELECT degree_summary_name, COUNT(student_id) as num_students_enrolled FROM degree_programs dp JOIN student_enrolment se ON dp.degree_program_id = se.degree_program_id GROUP BY degree_summary_name) AS subquery
SELECT degree_summary_name FROM degree_programs WHERE degree_program_id = (SELECT degree_program_id FROM student_enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1)
SELECT degree_program_id, degree_summary_name FROM degree_programs WHERE degree_program_id = (SELECT degree_program_id FROM (SELECT degree_program_id, COUNT(*) as enrol_count FROM student_enrolment GROUP BY degree_program_id LIMIT 1 OFFSET (SELECT COUNT(*)/2 FROM (SELECT degree_program_id, COUNT(*) as enrol_count FROM student_enrolment GROUP BY degree_program_id))))
SELECT degree_program_id, degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1
SELECT student_id, first_name, middle_name, last_name, COUNT(*) AS number_of_enrollments FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id GROUP BY student_id ORDER BY number_of_enrollments DESC LIMIT 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS enrolment_count FROM students s LEFT JOIN student_enrolment se ON s.student_id = se.student_id GROUP BY s.student_id, s.first_name, s.middle_name, s.last_name ORDER BY enrolment_count DESC LIMIT 1
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT DISTINCT course_name FROM courses INNER JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM courses INNER JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM student_enrolment_courses JOIN courses ON student_enrolment_courses.course_id = courses.course_id GROUP BY course_name HAVING COUNT(*) = ( SELECT MAX(enroll_count) FROM ( SELECT course_id, COUNT(*) AS enroll_count FROM student_enrolment_courses GROUP BY course_id ) )
SELECT c.course_name FROM courses c JOIN student_enrolment_courses sec ON c.course_id = sec.course_id JOIN student_enrolment se ON sec.student_enrolment_id = se.student_enrolment_id GROUP BY c.course_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id WHERE state_province_county = 'North Carolina' AND NOT EXISTS (SELECT 1 FROM student_enrolment WHERE student_enrolment.student_id = students.student_id AND student_enrolment.degree_program_id IS NOT NULL)
SELECT last_name FROM students s JOIN addresses a ON s.permanent_address_id = a.address_id WHERE a.state_province_county = 'North Carolina' AND NOT EXISTS (SELECT 1 FROM student_enrolment se WHERE s.student_id = se.student_id AND se.degree_program_id IS NOT NULL)
SELECT t.transcript_date, t.transcript_id FROM transcripts t JOIN (SELECT transcript_id FROM student_enrolment_courses GROUP BY transcript_id HAVING COUNT(*) >= 2 ) sec ON t.transcript_id = sec.transcript_id
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id IN (SELECT transcript_id FROM student_enrolment_courses GROUP BY transcript_id HAVING COUNT(*) > 1)
SELECT s.cell_mobile_number FROM students s WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward'
SELECT s.cell_mobile_number FROM students s WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM students WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM students) ORDER BY student_id LIMIT 1
SELECT MIN(first_name), MIN(middle_name), MIN(last_name) FROM students
SELECT s.first_name, s.middle_name, s.last_name FROM students s INNER JOIN student_enrolment se ON s.student_id = se.student_id ORDER BY se.date_left FETCH FIRST ROW ONLY
SELECT students.first_name, students.middle_name, students.last_name FROM students INNER JOIN student_enrolment ON students.student_id = student_enrolment.student_id ORDER BY student_enrolment.semester_id LIMIT 1
SELECT first_name FROM students WHERE permanent_address_id != current_address_id
SELECT first_name FROM students WHERE EXISTS (SELECT * FROM addresses AS permanent JOIN addresses AS current ON permanent.address_id <> current.address_id WHERE students.permanent_address_id = permanent.address_id AND students.current_address_id = current.address_id )
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM addresses a JOIN students s ON a.address_id = s.current_address_id GROUP BY a.address_id HAVING COUNT(s.student_id) = ( SELECT MAX(student_count) FROM ( SELECT COUNT(student_id) as student_count FROM students GROUP BY current_address_id ) )
SELECT a.address_id, a.line_1, a.line_2 FROM addresses a JOIN students s ON a.address_id = s.permanent_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(s.student_id) DESC LIMIT 1
SELECT AVG(strftime('%s', transcript_date)) FROM transcripts
SELECT AVG(strftime('%s', transcript_date)) FROM transcripts
SELECT transcript_date, other_details FROM transcripts WHERE transcript_id = (SELECT MIN(transcript_id) FROM transcript_contents)
SELECT transcript_date AS earliest_release_date, other_details FROM transcripts WHERE transcript_date = (SELECT MIN(transcript_date) FROM transcripts)
SELECT COUNT(transcript_id) FROM transcripts
SELECT EXISTS (SELECT 1 FROM transcripts)
SELECT MAX(transcript_date) FROM transcripts
SELECT MAX(transcript_date) FROM transcripts
SELECT student_enrolment_courses.student_enrolment_id, COUNT(transcript_id) AS enrollment_count FROM student_enrolment_courses LEFT JOIN transcripts ON student_enrolment_courses.student_enrolment_id = transcripts.student_enrolment_id GROUP BY student_enrolment_courses.student_enrolment_id ORDER BY enrollment_count DESC LIMIT 1
SELECT course_id, COUNT(*) as num_transcripts FROM student_enrolment_courses GROUP BY course_id ORDER BY num_transcripts DESC LIMIT 1
SELECT t.transcript_id, t.transcript_date FROM transcripts t LEFT JOIN transcript_contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date ORDER BY COUNT(tc.transcript_id) LIMIT 1
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id = (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id ORDER BY COUNT(*) ASC LIMIT 1)
SELECT s1.semester_name FROM semesters s1 INNER JOIN student_enrolment se1 ON s1.semester_id = se1.semester_id INNER JOIN (SELECT DISTINCT semester_id FROM student_enrolment WHERE degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor')) s2 ON s1.semester_id = s2.semester_id INNER JOIN student_enrolment se2 ON s2.semester_id = se2.semester_id WHERE se1.degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Master')
SELECT semester_id FROM student_enrolment GROUP BY semester_id HAVING COUNT(DISTINCT degree_program_id) = 2
SELECT COUNT(DISTINCT addresses.address_id) FROM students JOIN addresses ON students.current_address_id = addresses.address_id
SELECT DISTINCT line_1, line_2, line_3 FROM addresses JOIN students ON addresses.address_id = students.current_address_id OR addresses.address_id = students.permanent_address_id
SELECT * FROM students ORDER BY last_name DESC
SELECT first_name, last_name FROM students ORDER BY last_name DESC
SELECT section_name FROM sections WHERE section_id = 'h'
SELECT section_description FROM sections WHERE section_name = 'h'
SELECT first_name FROM students WHERE permanent_address_id = (SELECT address_id FROM addresses WHERE country = 'Haiti') UNION SELECT first_name FROM students WHERE cell_mobile_number = '09700166582'
SELECT s.first_name FROM students s JOIN addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' UNION SELECT s1.first_name FROM students s1 WHERE s1.cell_mobile_number = '09700166582'
SELECT title FROM cartoon GROUP BY title ORDER BY title COLLATE NOCASE
SELECT title FROM cartoon ORDER BY title COLLATE NOCASE
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT DISTINCT(title) FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT COUNT(1) FROM cartoon WHERE written_by = 'Joseph Kuhr'
SELECT COUNT(*) AS "Number of Cartoons" FROM cartoon WHERE written_by = 'Joseph Kuhr'
SELECT c.title, c.directed_by FROM cartoon c ORDER BY c.original_air_date DESC
SELECT c.title, c.directed_by FROM cartoon c, tv_channel t WHERE c.channel = t.id ORDER BY c.original_air_date
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones' UNION ALL SELECT title FROM cartoon WHERE directed_by = 'Brandon Vietti'
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones' EXCEPT SELECT title FROM cartoon WHERE directed_by != 'Brandon Vietti'
SELECT country, COUNT(*) AS num_channels FROM tv_channel GROUP BY country HAVING num_channels = (SELECT MAX(channel_count) FROM (SELECT COUNT(*) AS channel_count FROM tv_channel GROUP BY country) AS counts)
SELECT country, num_channels FROM (SELECT country, COUNT(*) as num_channels FROM tv_channel GROUP BY country) HAVING num_channels = (SELECT MAX(num_channels) FROM (SELECT country, COUNT(*) as num_channels FROM tv_channel GROUP BY country))
SELECT DISTINCT COUNT(series_name) AS different_series_count, COUNT(content) AS different_content_count FROM tv_channel
SELECT COUNT(series_name) AS total_series, COUNT(content) AS total_content FROM (SELECT DISTINCT series_name, content FROM tv_channel)
SELECT DISTINCT content FROM tv_channel WHERE series_name = 'Sky Radio'
SELECT content FROM tv_channel JOIN tv_series ON tv_channel.id = tv_series.channel WHERE tv_channel.series_name = 'Sky Radio'
SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio' UNION SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio'
SELECT package_option FROM tv_channel INNER JOIN tv_series ON tv_channel.id = tv_series.channel WHERE tv_series.series_name = 'Sky Radio' UNION SELECT package_option FROM tv_channel INNER JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.series_name = 'Sky Radio'
SELECT language, (SELECT COUNT(*) FROM tv_channel WHERE language = 'English') AS count FROM tv_channel WHERE language = 'English'
SELECT tv_channel.id FROM tv_channel WHERE language = 'English'
SELECT language, MIN(channel_count) AS num_channels FROM ( SELECT language, COUNT(*) AS channel_count FROM tv_channel GROUP BY language ) AS subquery
SELECT language, num_channels FROM (SELECT language, COUNT(id) as num_channels FROM tv_channel GROUP BY language HAVING num_channels = (SELECT MIN(channel_count) FROM (SELECT COUNT(id) as channel_count FROM tv_channel GROUP BY language)))
SELECT language, (SELECT COUNT(*) FROM tv_channel WHERE language = tv_channel.language) AS num_channels FROM tv_channel GROUP BY language
SELECT language, (SELECT COUNT(*) FROM tv_channel WHERE tv_channel.language = c.language) AS num_channels FROM (SELECT DISTINCT language FROM tv_channel) c GROUP BY language
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE title = 'The Rise of the Blue Beetle!')
SELECT series_name FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id JOIN tv_series ON tv_series.channel = tv_channel.id WHERE cartoon.title = 'The Rise of the Blue Beetle!' GROUP BY series_name
SELECT c.title FROM cartoon c INNER JOIN tv_channel tc ON c.channel = tc.id WHERE tc.series_name = 'Sky Radio'
SELECT c.title FROM cartoon c JOIN tv_channel tc ON c.channel = tc.id JOIN tv_series ts ON c.channel = ts.channel WHERE tc.series_name = 'Sky Radio'
SELECT episode FROM tv_series WHERE rating IS NOT NULL ORDER BY rating
SELECT episode FROM tv_series ORDER BY rating
SELECT episode, rating FROM tv_series GROUP BY episode, rating HAVING rating IN (SELECT rating FROM tv_series ORDER BY rating DESC LIMIT 3) ORDER BY rating DESC
SELECT episode, rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT MIN(share) AS minimum_share FROM tv_series UNION ALL SELECT MAX(share) AS maximum_share FROM tv_series
SELECT TOP 1 share AS min_share FROM tv_series ORDER BY share ASC
SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime' ORDER BY air_date LIMIT 1
SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime' GROUP BY air_date
SELECT tv_series.weekly_rank FROM tv_series JOIN cartoon ON tv_series.channel = cartoon.channel WHERE tv_series.episode = 'A Love of a Lifetime'
SELECT t1.weekly_rank FROM tv_series t1, tv_series t2 WHERE t1.id = t2.id AND t2.episode = 'A Love of a Lifetime'
SELECT c.series_name FROM (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime') s JOIN tv_channel c ON s.channel = c.id
SELECT tv_channel.series_name FROM tv_channel INNER JOIN tv_series ON tv_channel.id = tv_series.channel WHERE tv_series.episode = 'A Love of a Lifetime'
SELECT episode FROM tv_series JOIN tv_channel ON tv_series.channel = tv_channel.id AND tv_channel.series_name = 'Sky Radio'
SELECT episode FROM tv_series INNER JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE series_name = 'Sky Radio'
SELECT directed_by, (SELECT COUNT(*) FROM cartoon c WHERE c.directed_by = cartoon.directed_by) AS cartoon_count FROM cartoon GROUP BY directed_by
SELECT directed_by, (SELECT COUNT(*) FROM cartoon c WHERE c.directed_by = cartoon.directed_by) AS cartoon_count FROM cartoon c
SELECT production_code, channel FROM cartoon WHERE air_date = (SELECT MAX(air_date) FROM tv_series INNER JOIN cartoon ON tv_series.id = cartoon.id)
SELECT cartoon.production_code, cartoon.channel FROM cartoon INNER JOIN tv_series ON cartoon.channel = tv_series.channel ORDER BY tv_series.air_date DESC LIMIT 1
SELECT package_option, series_name FROM tv_channel WHERE hight_definition_tv = 'Yes'
SELECT tv_channel.package_option, tv_channel.series_name FROM tv_channel JOIN tv_series ON tv_channel.id = tv_series.channel JOIN cartoon ON tv_channel.id = cartoon.channel WHERE tv_channel.hight_definition_tv = 'Yes'
SELECT t.country FROM tv_channel t INNER JOIN cartoon x ON t.id = x.channel WHERE x.written_by = 'Todd Casey'
SELECT DISTINCT t.country FROM tv_channel t, cartoon c WHERE t.id = c.channel AND c.written_by = 'Todd Casey' GROUP BY t.country
SELECT DISTINCT t.country FROM tv_channel t WHERE NOT EXISTS ( SELECT 1 FROM cartoon c WHERE c.channel = t.id AND c.written_by = 'Todd Casey' )
SELECT c.country FROM tv_channel c WHERE NOT EXISTS (SELECT 1 FROM cartoon WHERE written_by = 'Todd Casey' AND channel = c.id) GROUP BY c.country
SELECT tv_channel.series_name, tv_channel.country FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.directed_by = 'Ben Jones' OR cartoon.directed_by = 'Michael Chang'
SELECT t.series_name, t.country FROM tv_channel t WHERE id IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones') AND id IN (SELECT channel FROM cartoon WHERE directed_by = 'Michael Chang')
SELECT pixel_aspect_ratio_par, country FROM tv_channel WHERE language <> 'English' GROUP BY pixel_aspect_ratio_par, country
SELECT tv_channel.pixel_aspect_ratio_par, tv_channel.country FROM tv_channel LEFT JOIN tv_series ON tv_channel.id = tv_series.channel LEFT JOIN cartoon ON tv_channel.id = cartoon.channel WHERE language <> 'English'
SELECT id FROM tv_channel GROUP BY country HAVING COUNT(id) > 2
SELECT t.id FROM tv_channel t JOIN ( SELECT channel, COUNT(*) AS num_series FROM tv_series GROUP BY channel HAVING COUNT(channel) > 2 ) s ON t.id = s.channel
SELECT id FROM tv_channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones') AND id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones')
SELECT DISTINCT t.id FROM tv_channel t LEFT JOIN cartoon c ON t.id = c.channel WHERE c.id IS NULL OR c.directed_by != 'Ben Jones'
SELECT package_option FROM tv_channel c LEFT JOIN cartoon t ON c.id = t.channel GROUP BY c.package_option HAVING SUM(CASE WHEN t.directed_by = 'Ben Jones' THEN 1 ELSE 0 END) = 0
SELECT package_option FROM tv_channel WHERE NOT EXISTS (SELECT * FROM cartoon WHERE tv_channel.id = cartoon.channel AND directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player UNION SELECT COUNT(*) FROM people
SELECT COUNT(*) AS player_count FROM poker_player
SELECT p.earnings FROM poker_player p ORDER BY p.earnings DESC
SELECT MAX(earnings) AS max_earnings FROM poker_player
SELECT final_table_made, best_finish FROM poker_player
SELECT final_table_made, best_finish FROM poker_player
SELECT AVG(earnings) FROM poker_player WHERE earnings IS NOT NULL
SELECT CAST(AVG(earnings) AS DECIMAL(10,2)) AS average_earnings FROM poker_player
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT money_rank FROM poker_player JOIN (SELECT MAX(earnings) as max_earnings FROM poker_player) as subq ON poker_player.earnings = subq.max_earnings
SELECT final_table_made FROM poker_player WHERE earnings < 200000 ORDER BY final_table_made DESC FETCH FIRST ROW ONLY
SELECT final_table_made FROM poker_player WHERE final_table_made = (SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000) ORDER BY final_table_made DESC LIMIT 1
SELECT name FROM people GROUP BY name
SELECT DISTINCT name FROM people JOIN poker_player ON people.people_id = poker_player.people_id
SELECT name FROM poker_player p JOIN people pe ON p.people_id = pe.people_id WHERE earnings > 300000
SELECT p.name FROM people p INNER JOIN poker_player pp ON p.people_id = pp.people_id WHERE pp.earnings > 300000
SELECT p.name FROM poker_player AS pp JOIN people AS p ON pp.people_id = p.people_id ORDER BY pp.final_table_made ASC
SELECT p.name FROM people AS p INNER JOIN poker_player AS pp ON p.people_id = pp.people_id ORDER BY pp.final_table_made
SELECT p.birth_date FROM people p, poker_player pp WHERE p.people_id = pp.people_id AND pp.earnings = (SELECT MIN(earnings) FROM poker_player)
SELECT p2.birth_date FROM poker_player p1 JOIN people p2 ON p1.people_id = p2.people_id WHERE p1.earnings = (SELECT MIN(earnings) FROM poker_player)
SELECT money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY height DESC LIMIT 1
SELECT money_rank FROM poker_player WHERE people_id = (SELECT people_id FROM people WHERE height = (SELECT MAX(height) FROM people)) ORDER BY money_rank LIMIT 1
SELECT AVG(earnings) FROM poker_player WHERE EXISTS (SELECT * FROM people WHERE poker_player.people_id = people.people_id AND height > 200)
SELECT AVG(earnings) FROM poker_player WHERE people_id IN (SELECT people_id FROM people WHERE height > 200) ORDER BY earnings DESC
SELECT p.name FROM people p, poker_player pp WHERE p.people_id = pp.people_id ORDER BY pp.earnings DESC
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player ORDER BY earnings DESC) ORDER BY earnings DESC
SELECT DISTINCT nationality, COUNT(*) AS number_of_people FROM people GROUP BY nationality
SELECT DISTINCT nationality, (SELECT COUNT(*) FROM people p2 WHERE p2.nationality = p1.nationality) AS people_count FROM people p1
SELECT TOP 1 nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC
SELECT p.nationality FROM people p JOIN poker_player pp ON p.people_id = pp.people_id GROUP BY p.nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT nationality FROM people AS p1 WHERE EXISTS (SELECT 1 FROM people AS p2 WHERE p1.nationality = p2.nationality AND p1.people_id <> p2.people_id)
SELECT DISTINCT nationality FROM people p1 WHERE EXISTS (SELECT 1 FROM people p2 WHERE p1.nationality = p2.nationality AND p1.people_id <> p2.people_id)
SELECT name, birth_date FROM people ORDER BY replace(name, ' ', '')
SELECT name, birth_date FROM people ORDER BY name COLLATE BINARY DESC
SELECT name FROM people WHERE nationality <> 'Russia' GROUP BY name
SELECT name FROM people WHERE nationality <> 'Russia' LIMIT 100
SELECT name FROM people WHERE NOT EXISTS (SELECT 1 FROM poker_player WHERE poker_player.people_id = people.people_id)
SELECT name FROM people LEFT JOIN poker_player ON people.people_id = poker_player.people_id WHERE poker_player.people_id IS NULL
SELECT DISTINCT nationality FROM people
SELECT COUNT(DISTINCT nationality) FROM poker_player INNER JOIN people ON poker_player.people_id = people.people_id
SELECT COUNT(state) FROM area_code_state GROUP BY state
SELECT contestant_number, contestant_name FROM contestants ORDER BY contestant_name DESC
SELECT v.vote_id, v.phone_number, a.state FROM votes AS v, area_code_state AS a WHERE v.state = a.state
SELECT area_code AS max_area_code FROM area_code_state WHERE area_code = (SELECT MAX(area_code) FROM area_code_state)
SELECT created AS last_date FROM votes WHERE state = 'CA' ORDER BY created DESC LIMIT 1
SELECT C.contestant_name FROM contestants C LEFT JOIN votes V ON C.contestant_number = V.contestant_number WHERE C.contestant_name <> 'Jessie Alloway' AND V.contestant_number IS NOT NULL
SELECT DISTINCT state, created FROM votes
SELECT contestant_number, contestant_name FROM contestants INNER JOIN (SELECT contestant_number, COUNT(*) AS num_votes FROM votes GROUP BY contestant_number HAVING COUNT(*) >= 2) v ON contestants.contestant_number = v.contestant_number
SELECT c.contestant_number, c.contestant_name FROM contestants c JOIN votes v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name ORDER BY COUNT(v.vote_id) LIMIT 1
SELECT (SELECT COUNT(*) FROM votes WHERE state = 'NY') + (SELECT COUNT(*) FROM votes WHERE state = 'CA')
SELECT COUNT(*) FROM contestants WHERE NOT EXISTS (SELECT 1 FROM votes v WHERE v.contestant_number = contestants.contestant_number)
SELECT area_code_state.area_code FROM votes JOIN area_code_state ON votes.state = area_code_state.state GROUP BY area_code_state.area_code HAVING COUNT(*) = (SELECT MAX(vote_count) FROM (SELECT COUNT(*) AS vote_count FROM votes GROUP BY state))
SELECT created, state, phone_number FROM votes JOIN contestants USING (contestant_number) JOIN area_code_state USING (state) WHERE contestant_name = 'Tabatha Gehling'
SELECT a.area_code FROM area_code_state a JOIN votes v ON a.state = v.state JOIN contestants c ON v.contestant_number = c.contestant_number WHERE c.contestant_name = 'Tabatha Gehling' OR c.contestant_name = 'Kelly Clauss' GROUP BY a.area_code HAVING COUNT(DISTINCT c.contestant_number) = 2
SELECT contestant_name FROM contestants WHERE contestant_name LIKE 'Al%' OR contestant_name LIKE '% Al%'
SELECT name FROM country WHERE indepyear > 1950
SELECT name FROM country WHERE indepyear > 1950 ORDER BY name
SELECT COUNT(name) FROM country WHERE governmentform = 'Republic'
SELECT COUNT(*) FROM country WHERE governmentform = 'Republic' HAVING COUNT(*) > 0
SELECT total_surface_area FROM (SELECT SUM(surfacearea) total_surface_area FROM country WHERE region = 'Caribbean') AS total
SELECT SUM(surfacearea) FROM country WHERE region = 'Carribean'
SELECT continent FROM country WHERE name IN ('Anguilla')
SELECT c.continent FROM city ct JOIN country c ON ct.countrycode = c.code WHERE ct.name = 'Anguilla'
SELECT c.region FROM country c, city t WHERE t.name = 'Kabul' AND t.countrycode = c.code
SELECT country.region FROM city JOIN country ON city.countrycode = country.code WHERE city.name = 'Kabul'
SELECT language FROM countrylanguage WHERE countrycode = (SELECT code FROM country WHERE name = 'Aruba') AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = (SELECT code FROM country WHERE name = 'Aruba'))
SELECT language FROM countrylanguage WHERE countrycode = 'ABW' AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = 'ABW')
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil' UNION SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil'
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil'
SELECT * FROM (SELECT region, population FROM country WHERE name = 'Angola') AS subquery
SELECT region, population FROM country WHERE name = 'Angola'
SELECT ROUND(AVG(lifeexpectancy), 2) FROM country WHERE region = 'Central Africa'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia' ORDER BY lifeexpectancy LIMIT 1)
SELECT SUM(c.population) AS total_population, (SELECT MAX(c.gnp) FROM country c WHERE c.continent = 'Asia') AS max_gnp FROM country c WHERE c.continent = 'Asia'
SELECT SUM(city.population) FROM city JOIN country ON city.countrycode = country.code WHERE country.continent = 'Asia'
SELECT AVG(lifeexpectancy) AS avg_life_expectancy FROM country WHERE continent = 'Africa' AND governmentform = 'Republic' HAVING avg_life_expectancy IS NOT NULL
SELECT AVG(lifeexpectancy) as average_life_expectancy FROM country WHERE continent = 'Africa' AND code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT SUM(surfacearea) AS total_surface_area FROM (SELECT * FROM country WHERE continent = 'Asia' OR continent = 'Europe')
SELECT SUM(surfacearea) as total_surface_area FROM (SELECT surfacearea FROM country WHERE continent = 'Asia' UNION ALL SELECT surfacearea FROM country WHERE continent = 'Europe') as subquery
SELECT population FROM city WHERE district = 'Gelderland'
SELECT SUM(c.population) FROM city c WHERE c.district = 'Gelderland'
SELECT AVG(gnp) AS avg_gnp, SUM(population) AS total_population FROM country WHERE governmentform = 'US Territory' HAVING COUNT(*) > 0
SELECT AVG(gnp) AS mean_gnp, (SELECT SUM(population) FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'US')) AS total_population FROM country
SELECT COUNT(language) FROM (SELECT DISTINCT language FROM countrylanguage) AS unique_languages_count
SELECT COUNT(*) FROM (SELECT DISTINCT language FROM countrylanguage) as temp_table
SELECT COUNT(DISTINCT governmentform) FROM country WHERE continent = 'Africa' HAVING COUNT(*) > 0
SELECT DISTINCT governmentform, continent FROM country WHERE continent = 'Africa'
SELECT MAX(1) FROM countrylanguage WHERE countrycode = 'ABW'
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = 'ABW'
SELECT DISTINCT language FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT COUNT(*) AS official_languages FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT name FROM country WHERE code = (SELECT countrycode FROM countrylanguage GROUP BY countrycode HAVING COUNT(language) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language) AS lang_count FROM countrylanguage GROUP BY countrycode)))
SELECT c.name FROM country c WHERE EXISTS ( SELECT countrycode FROM countrylanguage cl WHERE cl.countrycode = c.code GROUP BY countrycode HAVING COUNT(language) = ( SELECT MAX(lang_count) FROM ( SELECT COUNT(language) AS lang_count FROM countrylanguage GROUP BY countrycode ) ) )
SELECT continent FROM countrylanguage GROUP BY continent HAVING COUNT(DISTINCT language) = ( SELECT COUNT(DISTINCT language) FROM countrylanguage GROUP BY continent ORDER BY COUNT(DISTINCT language) DESC LIMIT 1 )
SELECT c1.continent FROM country c1 JOIN ( SELECT countrycode, COUNT(DISTINCT language) AS lang_count FROM countrylanguage GROUP BY countrycode ) cl ON c1.code = cl.countrycode ORDER BY lang_count DESC LIMIT 1
SELECT COUNT(*) FROM ( SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T' INTERSECT SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' ) AS subquery
SELECT COUNT(*) FROM (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' INTERSECT SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T')
SELECT c1.name FROM country c1, countrylanguage cl1, countrylanguage cl2 WHERE c1.code = cl1.countrycode AND c1.code = cl2.countrycode AND cl1.language = 'English' AND cl2.language = 'French'
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') INTERSECT SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T')
SELECT name FROM country WHERE (SELECT GROUP_CONCAT(language) FROM countrylanguage WHERE countrylanguage.countrycode = country.code AND isofficial = 'T') = 'English,French'
SELECT DISTINCT continent FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Chinese')
SELECT COUNT(*) FROM ( SELECT cl.countrycode FROM countrylanguage cl WHERE cl.language = 'Chinese' GROUP BY cl.countrycode ) AS subquery JOIN country c ON subquery.countrycode = c.code
SELECT DISTINCT region FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English') OR code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch')
SELECT DISTINCT country.region FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE language IN ('Dutch', 'English')
SELECT name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE language IN ('English', 'Dutch') AND isofficial = 'T'
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T' UNION SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')
SELECT language FROM (SELECT language, SUM(percentage) AS total_percentage FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia') GROUP BY language) AS subquery ORDER BY total_percentage DESC LIMIT 1
SELECT cl.language FROM countrylanguage cl JOIN country c ON cl.countrycode = c.code WHERE c.continent = 'Asia' GROUP BY cl.language ORDER BY SUM(cl.percentage) DESC LIMIT 1
SELECT language FROM countrylanguage cl INNER JOIN country c ON cl.countrycode = c.code WHERE c.governmentform = 'Republic' GROUP BY language HAVING COUNT(DISTINCT cl.countrycode) = 1
SELECT language FROM countrylanguage WHERE language IN (SELECT language FROM countrylanguage WHERE isofficial = 'T' GROUP BY language HAVING COUNT(*) = 1) AND countrycode IN (SELECT code FROM country WHERE governmentform = 'Republic')
SELECT c.name FROM city c JOIN countrylanguage cl ON c.countrycode = cl.countrycode WHERE cl.language = 'English' AND cl.isofficial = 'T' ORDER BY c.population DESC LIMIT 1
SELECT name FROM city WHERE countrycode = (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' ORDER BY percentage DESC LIMIT 1) ORDER BY population DESC LIMIT 1
SELECT name, population, lifeexpectancy FROM country WHERE continent = 'Asia' AND surfacearea = (SELECT MAX(surfacearea) FROM country WHERE continent = 'Asia')
SELECT name, population, lifeexpectancy FROM country WHERE continent = 'Asia' AND population = (SELECT MAX(population) FROM country WHERE continent = 'Asia') ORDER BY population DESC LIMIT 1
SELECT AVG(lifeexpectancy) FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'F')
SELECT AVG(lifeexpectancy) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'N')
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' OR cl.language IS NULL
SELECT SUM(population) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language <> 'English')
SELECT language FROM countrylanguage cl, country c WHERE c.headofstate = 'Beatrix' AND cl.isofficial = 'T' AND cl.countrycode = c.code
SELECT language FROM countrylanguage cl, country c WHERE cl.countrycode = c.code AND c.headofstate = 'Beatrix' AND cl.isofficial = 'T' LIMIT 1
SELECT COUNT(DISTINCT language) FROM countrylanguage JOIN country USING (countrycode) WHERE indepyear < 1930 AND isofficial = 'T'
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE (countrycode, isofficial) IN (SELECT code, 'T' FROM country WHERE indepyear < 1930)
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent <> 'Europe')
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe') ORDER BY name
SELECT c1.name FROM country c1, (SELECT MIN(population) AS min_pop FROM country WHERE continent = 'Asia') AS min_pop WHERE c1.continent = 'Africa' AND c1.population < min_pop.min_pop
SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MIN(population) FROM (SELECT population FROM country WHERE continent = 'Asia'))
SELECT c1.name FROM country c1 WHERE c1.continent = 'Asia' AND (SELECT MAX(population) FROM country WHERE continent = 'Africa') < ALL (SELECT population FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE continent = 'Asia' AND population > (SELECT * FROM (SELECT MAX(population) FROM country WHERE continent = 'Africa'))
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language <> 'English')
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode GROUP BY c.code HAVING SUM(CASE WHEN cl.language = 'English' THEN 1 ELSE 0 END) = 0
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language != 'English')
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language != 'English' OR cl.language IS NULL
SELECT c.code FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' AND c.governmentform <> 'Republic'
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND governmentform <> 'Republic'
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe' EXCEPT SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe') AND countrycode IN (SELECT countrycode FROM countrylanguage WHERE language <> 'English' AND isofficial = 'F')
SELECT name FROM city WHERE countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'Chinese' AND isofficial = 'T') AND countrycode IN (SELECT code FROM country WHERE continent = 'Asia')
SELECT city.name FROM city JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode JOIN country ON city.countrycode = country.code WHERE country.continent = 'Asia' AND countrylanguage.language = 'Chinese' AND countrylanguage.isofficial = 'T'
SELECT name, indepyear, surfacearea FROM country WHERE population = (SELECT MIN(population) FROM country) ORDER BY population ASC FETCH NEXT ROW ONLY
SELECT c.name, c.indepyear, c.surfacearea FROM country c JOIN (SELECT MIN(population) AS min_pop FROM country) AS sub WHERE c.population = sub.min_pop
SELECT c.population, c.name, c.headofstate FROM country c WHERE surfacearea = (SELECT MAX(surfacearea) FROM country) GROUP BY c.population, c.name, c.headofstate
SELECT c.name, c.population, c.headofstate FROM country c INNER JOIN (SELECT MAX(surfacearea) as max_area FROM country) m ON c.surfacearea = m.max_area
SELECT name AS country, COUNT(language) AS num_languages FROM countrylanguage cl JOIN country c ON cl.countrycode = c.code GROUP BY c.name HAVING COUNT(DISTINCT language) >= 3
SELECT country.name, (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = country.code) AS language_count FROM country GROUP BY country.name HAVING language_count > 2
SELECT district, COUNT(*) AS city_count FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district HAVING city_count > 1
SELECT district, COUNT(name) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district ORDER BY COUNT(name) DESC LIMIT 10
SELECT governmentform, (SELECT SUM(c.population) FROM city c WHERE c.countrycode = country.code) AS total_population FROM country WHERE lifeexpectancy > 72 GROUP BY governmentform
SELECT governmentform, total_population FROM (SELECT governmentform, SUM(population) AS total_population FROM country GROUP BY governmentform HAVING AVG(lifeexpectancy) > 72) ORDER BY total_population DESC
SELECT continent, AVG(lifeexpectancy) AS avg_life_expectancy, SUM(population) AS total_population FROM country GROUP BY continent HAVING avg_life_expectancy < 72 ORDER BY avg_life_expectancy
SELECT continent, SUM(population) AS total_population, AVG(lifeexpectancy) AS average_life_expectancy FROM country GROUP BY continent HAVING AVG(lifeexpectancy) < 72 ORDER BY total_population DESC
SELECT name, surfacearea FROM country WHERE surfacearea >= ALL (SELECT surfacearea FROM country)
SELECT c.name, c.surfacearea FROM country c, (SELECT code, MAX(surfacearea) as max_area FROM country GROUP BY code ORDER BY max_area DESC LIMIT 5) m WHERE c.code = m.code
SELECT name FROM (SELECT name, ROW_NUMBER() OVER (ORDER BY population DESC) as rnk FROM country) WHERE rnk <= 3
SELECT name FROM country WHERE population >= (SELECT min(population) FROM (SELECT population FROM country ORDER BY population DESC LIMIT 3))
SELECT name FROM country WHERE population <= ALL (SELECT population FROM country ORDER BY population LIMIT 3)
SELECT name FROM country ORDER BY population LIMIT 3 OFFSET (SELECT COUNT(*) FROM country) - 3
SELECT COUNT(countrycode) FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia')
SELECT COUNT(*) FROM country WHERE continent = 'Asia' HAVING COUNT(*) > 0
SELECT name FROM country WHERE continent = 'Europe' AND population = 80000 LIMIT 1
SELECT c.name FROM country c INNER JOIN city ct ON c.code = ct.countrycode WHERE c.continent = 'Europe' AND c.population = 80000 AND ct.population = 80000
SELECT SUM(population) AS total_population, AVG(surfacearea) AS average_area FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT SUM(population) AS total_population, AVG(surfacearea) AS avg_surface_area FROM country WHERE continent = 'North America' AND surfacearea > 3000 GROUP BY continent
SELECT name FROM city WHERE population >= 160000 AND population <= 900000
SELECT name FROM city WHERE population >= 160000 AND population <= 900000 ORDER BY population
SELECT language, COUNT(DISTINCT countrycode) AS num_countries FROM countrylanguage GROUP BY language ORDER BY num_countries DESC LIMIT 1
SELECT language FROM (SELECT language, COUNT(DISTINCT countrycode) as num_countries FROM countrylanguage GROUP BY language) as subquery ORDER BY num_countries DESC LIMIT 1
SELECT c.name, cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = c.code) GROUP BY c.name
SELECT c.code AS cl.countrycode, cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = cl.countrycode)
SELECT COUNT(DISTINCT countrycode) FROM countrylanguage WHERE language = 'Spanish' AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE language = 'Spanish')
SELECT COUNT(*) FROM country WHERE (SELECT COUNT(*) FROM countrylanguage WHERE country.code = countrylanguage.countrycode AND language = 'Spanish' AND isofficial = 'T') > 0
SELECT country.code FROM country JOIN (SELECT countrycode, MAX(percentage) AS max_percentage FROM countrylanguage WHERE language = 'Spanish' GROUP BY countrycode) AS max_per ON country.code = max_per.countrycode
SELECT code FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Spanish' AND isofficial = 'T' AND percentage >= ALL (SELECT percentage FROM countrylanguage WHERE language = 'Spanish'))
SELECT conductor_id FROM orchestra GROUP BY conductor_id
SELECT COUNT(conductor_id) AS "Number of Conductors" FROM conductor
SELECT name FROM conductor ORDER BY conductor.age ASC
SELECT conductor.name FROM conductor ORDER BY conductor.age
SELECT name FROM conductor WHERE nationality != 'USA'
SELECT name FROM conductor WHERE nationality NOT LIKE 'USA'
SELECT distinct record_company FROM orchestra WHERE year_of_founded IS NOT NULL ORDER BY max(year_of_founded) OVER (PARTITION BY record_company) DESC
SELECT DISTINCT record_company FROM orchestra ORDER BY year_of_founded DESC LIMIT 10
SELECT AVG(attendance) AS "Average Attendance" FROM show
SELECT AVG(CAST(attendance AS FLOAT)) FROM show
SELECT MAX(share) FROM performance WHERE type <> 'Live final'
SELECT MAX(share), MIN(share) FROM performance WHERE type != 'Live final'
SELECT COUNT(DISTINCT nationality) AS num_of_nationalities FROM conductor
SELECT COUNT(DISTINCT nationality) FROM conductor
SELECT name FROM conductor ORDER BY strftime('%Y', 'now') - age DESC
SELECT conductor.name FROM conductor ORDER BY year_of_work DESC
SELECT name FROM conductor ORDER BY year_of_work DESC FETCH FIRST ROW ONLY
SELECT name FROM conductor WHERE year_of_work = (SELECT MAX(year_of_work) FROM conductor) FETCH FIRST ROW ONLY
SELECT c.name, o.orchestra FROM conductor c, orchestra o WHERE c.conductor_id = o.conductor_id
SELECT conductor.name, orchestra.orchestra FROM conductor RIGHT JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
SELECT DISTINCT c.name FROM conductor c JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.conductor_id, c.name HAVING COUNT(DISTINCT o.orchestra_id) > 1
SELECT c.name FROM conductor c JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.name HAVING COUNT(DISTINCT o.orchestra) > 1
SELECT c.name FROM conductor c INNER JOIN (SELECT conductor_id FROM orchestra GROUP BY conductor_id ORDER BY COUNT(orchestra_id) DESC LIMIT 1) o ON c.conductor_id = o.conductor_id
SELECT c.name FROM conductor c JOIN (SELECT conductor_id, COUNT(orchestra_id) as num_orchestras FROM orchestra GROUP BY conductor_id ORDER BY num_orchestras DESC LIMIT 1) as top_conductor ON c.conductor_id = top_conductor.conductor_id
SELECT name FROM conductor WHERE conductor_id = ANY (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008)
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008) GROUP BY name
SELECT DISTINCT record_company, COUNT(*) AS orchestra_count FROM orchestra
SELECT o.record_company, COUNT(DISTINCT o.orchestra_id) as num_orchestras FROM orchestra o GROUP BY o.record_company
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) ASC
SELECT DISTINCT major_record_format FROM orchestra ORDER BY (SELECT COUNT(*) FROM orchestra o WHERE o.major_record_format = orchestra.major_record_format) DESC
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(orchestra_id) DESC FETCH FIRST ROW ONLY
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(orchestra_id) DESC LIMIT 1
SELECT orchestra.orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.orchestra_id IS NULL
SELECT orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.orchestra_id IS NULL
SELECT record_company FROM orchestra WHERE year_of_founded < 2003 AND record_company IN (SELECT record_company FROM orchestra WHERE year_of_founded > 2003)
SELECT record_company FROM orchestra GROUP BY record_company HAVING SUM(CASE WHEN year_of_founded < 2003 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN year_of_founded > 2003 THEN 1 ELSE 0 END) > 0
SELECT COUNT(*) FROM orchestra WHERE major_record_format IN ('CD', 'DVD')
SELECT COUNT(*) FROM (SELECT DISTINCT orchestra_id FROM orchestra WHERE major_record_format = 'CD' UNION SELECT DISTINCT orchestra_id FROM orchestra WHERE major_record_format = 'DVD')
SELECT year_of_founded FROM orchestra WHERE orchestra_id IN ( SELECT orchestra_id FROM performance GROUP BY orchestra_id HAVING COUNT(*) > 1 )
SELECT distinct o.orchestra, o.year_of_founded FROM orchestra o JOIN performance p ON o.orchestra_id = p.orchestra_id GROUP BY o.orchestra, o.year_of_founded HAVING COUNT(p.performance_id) > 1
SELECT DISTINCT name FROM highschooler
SELECT MAX(id) - MIN(id) + 1 FROM highschooler
SELECT name, grade FROM highschooler WHERE grade >= 9
SELECT name, grade FROM highschooler
SELECT DISTINCT grade FROM highschooler
SELECT grade FROM highschooler WHERE grade <> ''
SELECT DISTINCT grade FROM highschooler WHERE name = 'Kyle'
SELECT DISTINCT grade FROM highschooler WHERE name = 'Kyle'
SELECT name FROM highschooler WHERE grade LIKE '10'
SELECT name FROM highschooler WHERE grade LIKE '10'
SELECT id FROM highschooler WHERE name = 'Kyle'
SELECT id FROM highschooler WHERE name = 'Kyle'
SELECT COUNT( DISTINCT id) FROM highschooler WHERE grade = 9 OR grade = 10
SELECT SUM(CASE WHEN grade = 9 OR grade = 10 THEN 1 ELSE 0 END) AS total_highschoolers FROM highschooler
SELECT grade, (SELECT COUNT(id) FROM highschooler h2 WHERE h2.grade = highschooler.grade) AS number_of_students FROM highschooler GROUP BY grade
SELECT grade, COUNT(*) as count FROM highschooler GROUP BY grade
SELECT MAX(grade) FROM (SELECT grade, COUNT(*) as num_highschoolers FROM highschooler GROUP BY grade)
SELECT grade FROM (SELECT grade, PERCENT_RANK() OVER (ORDER BY COUNT(*) DESC) as rnk FROM highschooler GROUP BY grade) t WHERE t.rnk = 0
SELECT grade FROM (SELECT grade, COUNT(id) as student_count FROM highschooler GROUP BY grade) WHERE student_count >= 4
SELECT DISTINCT grade FROM highschooler WHERE grade IN (SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*) >= 4)
SELECT h.id AS student_id, COUNT(f.friend_id) AS num_of_friends FROM highschooler h LEFT JOIN friend f ON h.id = f.student_id GROUP BY h.id
SELECT id, COUNT(friend_id) AS num_friends FROM highschooler INNER JOIN friend ON id = student_id GROUP BY id
SELECT h.name, COUNT(f.student_id) AS num_of_friends FROM highschooler h, friend f WHERE h.id = f.student_id GROUP BY h.name
SELECT h.name, COUNT(f.friend_id) AS friend_count FROM highschooler h JOIN friend f ON h.id = f.student_id GROUP BY h.name
SELECT name FROM highschooler WHERE id = (SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(friend_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(friend_id) AS cnt FROM friend GROUP BY student_id)))
SELECT name FROM highschooler WHERE id = (SELECT friend_id FROM friend GROUP BY friend_id HAVING COUNT(student_id) = (SELECT MAX(cnt) FROM (SELECT friend_id, COUNT(student_id) as cnt FROM friend GROUP BY friend_id)))
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(id) >= 3)
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM (SELECT student_id, COUNT(friend_id) AS friend_count FROM friend GROUP BY student_id) WHERE friend_count >= 3)
SELECT h2.name FROM highschooler h1 JOIN friend ON friend.student_id = h1.id JOIN highschooler h2 ON friend.friend_id = h2.id WHERE h1.name = 'Kyle'
SELECT name FROM highschooler WHERE id IN (SELECT friend_id FROM friend WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')) AND name <> 'Kyle'
SELECT COUNT(*) FROM friend WHERE student_id IN (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM friend WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle') AND friend_id IN (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT highschooler.id FROM highschooler LEFT JOIN friend ON highschooler.id = friend.student_id OR highschooler.id = friend.friend_id WHERE friend.student_id IS NULL
SELECT h.id FROM highschooler h LEFT JOIN friend f ON h.id = f.student_id WHERE f.student_id IS NULL
SELECT h.name FROM highschooler h WHERE NOT EXISTS (SELECT 1 FROM friend f WHERE f.student_id = h.id) AND NOT EXISTS (SELECT 1 FROM friend f2 WHERE f2.friend_id = h.id)
SELECT name FROM highschooler WHERE NOT EXISTS (SELECT 1 FROM friend WHERE student_id = highschooler.id)
SELECT id FROM highschooler WHERE id IN (SELECT student_id FROM friend) AND id IN (SELECT liked_id FROM likes) AND id IN (SELECT student_id FROM likes)
SELECT id FROM highschooler WHERE id IN (SELECT f.student_id FROM friend) AND id IN (SELECT l.student_id FROM likes)
SELECT DISTINCT name FROM highschooler WHERE id IN (SELECT student_id FROM friend WHERE student_id IN (SELECT liked_id FROM likes))
SELECT name FROM highschooler WHERE id IN (SELECT student_id FROM friend) AND id IN (SELECT student_id FROM likes)
SELECT student_id, COUNT(liked_id) AS like_count FROM likes GROUP BY student_id ORDER BY student_id
SELECT student_id, COUNT(liked_id) FROM likes GROUP BY student_id
SELECT name, (SELECT COUNT(liked_id) FROM likes WHERE student_id = h.id) AS num_likes FROM highschooler h
SELECT name, COUNT(liked_id) FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY name, likes.student_id
SELECT h.name FROM highschooler h JOIN likes l ON h.id = l.liked_id GROUP BY h.id, h.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM highschooler WHERE id = (SELECT student_id FROM likes GROUP BY student_id HAVING COUNT(liked_id) = (SELECT MAX(likecount) FROM (SELECT COUNT(liked_id) as likecount FROM likes GROUP BY student_id)))
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(liked_id) AS like_count FROM likes GROUP BY student_id HAVING like_count >= 2) l ON h.id = l.student_id
SELECT h.name FROM highschooler h WHERE EXISTS (SELECT 1 FROM likes l WHERE l.student_id = h.id GROUP BY l.student_id HAVING COUNT(*) >= 2)
SELECT name FROM highschooler WHERE grade > 5 AND id IN (SELECT student_id FROM friend GROUP BY student_id HAVING COUNT(friend_id) >= 2) AND id IN (SELECT student_id FROM likes GROUP BY student_id)
SELECT h.name FROM highschooler h JOIN friend f ON h.id = f.student_id GROUP BY h.id, h.name, h.grade HAVING h.grade > 5 AND COUNT(f.friend_id) >= 2
SELECT COUNT(*) FROM likes WHERE student_id IN (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM likes WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle') AND liked_id IN (SELECT id FROM highschooler)
SELECT AVG(h.grade) FROM highschooler h WHERE EXISTS (SELECT 1 FROM friend WHERE student_id = h.id OR friend_id = h.id)
SELECT AVG(grade) FROM highschooler WHERE id IN (SELECT student_id FROM likes)
SELECT MIN(grade) FROM highschooler WHERE NOT EXISTS (SELECT * FROM friend WHERE friend.friend_id = highschooler.id)
SELECT MIN(grade) FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend) AND id NOT IN (SELECT friend_id FROM friend UNION SELECT student_id FROM friend)
SELECT DISTINCT owners.state FROM owners INNER JOIN professionals ON owners.state = professionals.state
SELECT DISTINCT o.state FROM owners o, professionals p WHERE o.state = p.state
SELECT AVG(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT AVG(dogs.age) FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' AND professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' LIMIT 10
SELECT d.name FROM dogs d LEFT JOIN treatments t ON d.dog_id = t.dog_id GROUP BY d.name HAVING MAX(t.cost_of_treatment) <= 1000
SELECT name FROM dogs JOIN (SELECT dog_id, owner_id FROM treatments GROUP BY owner_id HAVING SUM(cost_of_treatment) <= 1000) AS t1 ON dogs.dog_id = t1.dog_id
SELECT DISTINCT first_name FROM (SELECT first_name FROM professionals UNION SELECT first_name FROM owners) AS combined_names WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT first_name FROM professionals WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT professional_id, role_code, email_address FROM professionals WHERE NOT EXISTS (SELECT 1 FROM treatments WHERE treatments.professional_id = professionals.professional_id) AND professional_id IS NOT NULL
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments WHERE professional_id IS NOT NULL)
SELECT owner_id, first_name, last_name FROM dogs JOIN owners ON dogs.owner_id = owners.owner_id GROUP BY owner_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT owners.owner_id, first_name, last_name FROM owners JOIN (SELECT owner_id, COUNT(dog_id) AS dog_count FROM dogs GROUP BY owner_id ORDER BY dog_count DESC LIMIT 1) AS max_dog_count ON owners.owner_id = max_dog_count.owner_id
SELECT p.professional_id, p.role_code, p.first_name FROM professionals p INNER JOIN treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(t.treatment_id) >= 2
SELECT professional_id, role_code, first_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) >= 2)
SELECT b.breed_name FROM breeds b LEFT JOIN dogs d ON b.breed_code = d.breed_code GROUP BY b.breed_name ORDER BY COUNT(d.breed_code) DESC LIMIT 1
SELECT breed_name FROM breeds WHERE breed_code IN (SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT o.owner_id, o.last_name FROM owners o JOIN (SELECT owner_id, COUNT(dog_id) as num_treatments FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id GROUP BY owner_id ORDER BY num_treatments DESC LIMIT 1) t ON o.owner_id = t.owner_id
SELECT o.owner_id, o.last_name FROM owners o JOIN dogs d ON o.owner_id = d.owner_id JOIN treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1
SELECT t.treatment_type_description FROM treatments t WHERE t.cost_of_treatment = (SELECT MIN(cost_of_treatment) FROM treatments)
SELECT t.treatment_type_description FROM treatment_types t JOIN treatments tr ON t.treatment_type_code = tr.treatment_type_code GROUP BY t.treatment_type_code ORDER BY SUM(tr.cost_of_treatment) LIMIT 1
SELECT o1.owner_id, o1.zip_code FROM owners o1 JOIN ( SELECT d.owner_id FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id GROUP BY d.owner_id ORDER BY SUM(t.cost_of_treatment) DESC LIMIT 1 ) o2 ON o1.owner_id = o2.owner_id
SELECT owner_id, zip_code FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id ORDER BY SUM(cost_of_treatment) DESC LIMIT 1)
SELECT professional_id, cell_number FROM professionals p WHERE EXISTS (SELECT professional_id FROM treatments t1 WHERE p.professional_id = t1.professional_id GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT professional_id, cell_number FROM professionals WHERE professional_id IN ( SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) = (SELECT MAX(C) FROM ( SELECT professional_id, COUNT(DISTINCT treatment_type_code) AS C FROM treatments GROUP BY professional_id)))
SELECT first_name, last_name FROM professionals WHERE professional_id IN ( SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments) GROUP BY professional_id HAVING cost_of_treatment < AVG(cost_of_treatment) )
SELECT first_name, last_name FROM professionals p WHERE EXISTS (SELECT * FROM treatments t WHERE p.professional_id = t.professional_id AND t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments))
SELECT date_of_treatment, first_name FROM treatments LEFT JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT date_of_treatment, first_name FROM treatments NATURAL JOIN professionals
SELECT treatment_type_description, cost_of_treatment FROM treatments RIGHT JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT t.cost_of_treatment, tt.treatment_type_description FROM treatments AS t, treatment_types AS tt WHERE t.treatment_type_code = tt.treatment_type_code
SELECT first_name, last_name, size_description FROM owners LEFT OUTER JOIN dogs ON owners.owner_id = dogs.owner_id LEFT OUTER JOIN sizes ON dogs.size_code = sizes.size_code
SELECT owners.first_name, owners.last_name, sizes.size_description FROM owners CROSS JOIN dogs JOIN sizes ON dogs.size_code = sizes.size_code WHERE owners.owner_id = dogs.owner_id
SELECT owners.first_name, dogs.name FROM owners INNER JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT first_name, name FROM owners JOIN dogs USING(owner_id)
SELECT d.name, t.date_of_treatment FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id WHERE d.breed_code = (SELECT breed_code FROM breeds ORDER BY breed_code LIMIT 1)
SELECT name, date_of_treatment FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code JOIN treatments ON dogs.dog_id = treatments.dog_id JOIN ( SELECT breed_code FROM dogs GROUP BY breed_code HAVING COUNT(*) = 1 ) AS rare_breeds ON dogs.breed_code = rare_breeds.breed_code
SELECT first_name, name FROM owners INNER JOIN dogs ON owners.owner_id = dogs.owner_id WHERE state = 'Virginia'
SELECT o.first_name, d.name FROM owners o JOIN dogs d ON o.owner_id = d.owner_id WHERE o.street LIKE '%Virginia%'
SELECT d.date_arrived, d.date_departed FROM dogs d INNER JOIN treatments t ON d.dog_id = t.dog_id
SELECT date_arrived, date_departed FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE date_departed IS NOT NULL
SELECT last_name FROM owners WHERE owner_id = ( SELECT owner_id FROM dogs WHERE age = (SELECT MIN(age) FROM dogs) )
SELECT last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id WHERE date_of_birth = (SELECT MIN(date_of_birth) FROM dogs)
SELECT email_address FROM professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT dogs.date_arrived, dogs.date_departed FROM dogs
SELECT DISTINCT date_arrived, date_departed FROM dogs
SELECT COUNT(*) FROM (SELECT dog_id FROM treatments GROUP BY dog_id)
SELECT COUNT(*) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT COUNT(DISTINCT professional_id) FROM treatments INNER JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT COUNT(*) FROM professionals WHERE EXISTS (SELECT 1 FROM treatments WHERE treatments.professional_id = professionals.professional_id)
SELECT role_code, street, city, state FROM professionals WHERE city LIKE '%West'
SELECT role_code, street, city, state FROM professionals WHERE city IN (SELECT city FROM professionals WHERE city LIKE '%West')
SELECT first_name, last_name, email_address FROM owners WHERE state LIKE '%North%' LIMIT 10
SELECT first_name, last_name, email_address FROM owners WHERE state IN (SELECT state FROM owners WHERE state LIKE '%North%')
SELECT DISTINCT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs) AND owner_id IN (SELECT owner_id FROM owners)
SELECT MAX(cost_of_treatment) FROM treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM treatments) ORDER BY cost_of_treatment DESC
SELECT cost_of_treatment FROM treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM treatments)
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments WHERE treatment_id IS NOT NULL)
SELECT COUNT(*) FROM dogs LEFT JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE treatments.dog_id IS NULL AND abandoned_yn = 'N'
SELECT COUNT(*) FROM owners WHERE NOT EXISTS (SELECT * FROM dogs WHERE dogs.owner_id = owners.owner_id) AND owners.owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT count(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs WHERE abandoned_yn = 'N')
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT dogs.name, dogs.age, dogs.weight FROM dogs WHERE abandoned_yn = 1
SELECT dogs.name, dogs.age, dogs.weight FROM dogs WHERE dogs.abandoned_yn = 1
SELECT AVG(strftime('%Y', 'now') - strftime('%Y', date_of_birth)) FROM dogs
SELECT SUM(age) * 1.0 / COUNT(age) AS avg_age FROM dogs
SELECT MAX(age) FROM dogs
SELECT DATEDIFF('year', MIN(date_of_birth), MAX(date_of_birth)) AS max_age FROM dogs
SELECT DISTINCT charge_type, charge_amount FROM charges
SELECT DISTINCT charge_type, charge_amount FROM charges
SELECT MAX(charge_amount) AS max_charge_cost FROM charges WHERE charge_amount = (SELECT MAX(charge_amount) FROM charges)
SELECT charge_amount FROM charges WHERE charge_type = (SELECT charge_type FROM charges GROUP BY charge_type ORDER BY COUNT(*) DESC LIMIT 1)
SELECT distinct email_address, cell_number, home_phone FROM professionals
SELECT email_address, cell_number, home_phone FROM professionals INNER JOIN treatments ON treatments.professional_id = professionals.professional_id
SELECT breed_name, size_description FROM breeds FULL OUTER JOIN sizes ON 1 = 1
SELECT breed_name, size_description FROM dogs, breeds, sizes WHERE dogs.breed_code = breeds.breed_code AND dogs.size_code = sizes.size_code GROUP BY breed_name, size_description
SELECT p.first_name, tt.treatment_type_description FROM treatments AS t INNER JOIN professionals AS p ON t.professional_id = p.professional_id INNER JOIN treatment_types AS tt ON t.treatment_type_code = tt.treatment_type_code
SELECT first_name, treatment_type_description FROM professionals INNER JOIN treatments ON professionals.professional_id = treatments.professional_id INNER JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT COUNT(*) FROM (SELECT DISTINCT singer_id FROM song) AS subquery
SELECT EXISTS (SELECT 1 FROM singer)
SELECT name FROM singer ORDER BY net_worth_millions ASC
SELECT name FROM singer ORDER BY net_worth_millions
SELECT birth_year, citizenship FROM singer GROUP BY birth_year, citizenship
SELECT singer.birth_year, singer.citizenship FROM singer
SELECT name FROM singer WHERE citizenship != 'France'
SELECT name FROM singer WHERE NOT EXISTS (SELECT 1 FROM singer s2 WHERE s2.citizenship = 'French' AND s2.singer_id = singer.singer_id)
SELECT name FROM singer WHERE birth_year = 1948 UNION ALL SELECT name FROM singer WHERE birth_year = 1949
SELECT DISTINCT name FROM singer WHERE birth_year = 1948 UNION SELECT name FROM singer WHERE birth_year = 1949
SELECT TOP 1 name FROM singer ORDER BY net_worth_millions DESC
SELECT TOP 1 name FROM singer ORDER BY net_worth_millions DESC
SELECT citizenship, (SELECT COUNT(*) FROM singer s2 WHERE s2.citizenship = singer.citizenship) AS num_singers FROM singer
SELECT s.citizenship, COUNT(s.singer_id) FROM singer s LEFT JOIN song so ON s.singer_id = so.singer_id GROUP BY s.citizenship
SELECT TOP 1 citizenship FROM singer GROUP BY citizenship ORDER BY COUNT(singer_id) DESC
SELECT a.citizenship FROM singer a GROUP BY a.citizenship HAVING COUNT (a.citizenship) = (SELECT MAX(b.cnt) FROM (SELECT COUNT(citizenship) AS cnt FROM singer GROUP BY citizenship) b)
SELECT DISTINCT s1.citizenship, s1.net_worth_millions AS max_net_worth FROM singer s1 WHERE s1.net_worth_millions = (SELECT MAX(s2.net_worth_millions) FROM singer s2 WHERE s2.citizenship = s1.citizenship)
SELECT citizenship, net_worth_millions FROM singer s1 WHERE NOT EXISTS (SELECT * FROM singer s2 WHERE s1.citizenship = s2.citizenship AND s1.net_worth_millions < s2.net_worth_millions) GROUP BY citizenship
SELECT song.title, singer.name FROM song LEFT JOIN singer ON song.singer_id = singer.singer_id
SELECT song.title, singer.name FROM song LEFT JOIN singer ON song.singer_id = singer.singer_id
SELECT DISTINCT name FROM singer WHERE EXISTS (SELECT 1 FROM song WHERE singer.singer_id = song.singer_id AND sales > 300000)
SELECT name FROM singer WHERE EXISTS (SELECT 1 FROM song WHERE song.singer_id = singer.singer_id AND sales > 300000)
SELECT DISTINCT s.name FROM singer s INNER JOIN (SELECT singer_id, COUNT(*) as song_count FROM song GROUP BY singer_id HAVING song_count > 1) sc ON s.singer_id = sc.singer_id
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING COUNT(title) > 1)
SELECT singer.name, SUM(song.sales) AS total_sales FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name
SELECT name, SUM(sales) AS total_sales FROM singer INNER JOIN song ON singer.singer_id = song.singer_id GROUP BY name
SELECT name FROM singer WHERE NOT EXISTS (SELECT * FROM song WHERE song.singer_id = singer.singer_id AND song.singer_id IS NOT NULL)
SELECT name FROM singer WHERE NOT EXISTS (SELECT 1 FROM song WHERE song.singer_id = singer.singer_id)
SELECT citizenship FROM singer WHERE birth_year < 1945 AND EXISTS (SELECT * FROM singer WHERE birth_year > 1955 AND singer.citizenship = citizenship)
SELECT DISTINCT s1.citizenship FROM singer s1 INNER JOIN singer s2 ON s1.citizenship = s2.citizenship WHERE s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT COUNT(property_id) FROM other_property_features
SELECT feature_type_name FROM ref_feature_types WHERE feature_type_code IN (SELECT feature_type_code FROM other_available_features WHERE feature_name = 'AirCon')
SELECT pt.property_type_description FROM properties p JOIN ref_property_types pt ON p.property_type_code = pt.property_type_code
SELECT property_name FROM properties WHERE property_type_code = 'House' AND room_count > 1
