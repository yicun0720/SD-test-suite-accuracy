SELECT COUNT(*) AS singer_count FROM singer_in_concert GROUP BY concert_id
SELECT COUNT(singer_id) FROM singer
SELECT name, country, age FROM singer ORDER BY age DESC, name
SELECT name, country, age FROM singer ORDER BY age DESC, name
SELECT AVG(age) AS average_age, (SELECT MIN(age) FROM singer WHERE country = 'France') AS minimum_age, (SELECT MAX(age) FROM singer WHERE country = 'France') AS maximum_age FROM singer WHERE country = 'France'
SELECT AVG(age) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age FROM singer WHERE country = 'France'
SELECT name, song_release_year FROM singer WHERE (age, song_release_year) = (SELECT MIN(age), MIN(song_release_year) FROM singer)
SELECT song_name, song_release_year FROM singer WHERE age IN (SELECT MIN(age) FROM singer)
SELECT DISTINCT s.country FROM singer s WHERE s.age > 20
SELECT DISTINCT s.country FROM singer s WHERE s.age > 20
SELECT country, COUNT(singer_id) AS singer_count FROM singer_in_concert GROUP BY country
SELECT s.country, COUNT(*) AS num_singers FROM singer s JOIN singer_in_concert sic ON s.singer_id = sic.singer_id GROUP BY s.country
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer) ORDER BY singer_id
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer)
SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000 ORDER BY location, name
SELECT location, name FROM stadium WHERE capacity IN (SELECT capacity FROM stadium WHERE capacity BETWEEN 5000 AND 10000)
SELECT MAX(capacity), AVG(capacity) FROM stadium
SELECT AVG(capacity) AS average_capacity, MAX.capacity AS maximum_capacity FROM (SELECT AVG(capacity) FROM stadium), (SELECT MAX(capacity) AS capacity FROM stadium) AS MAX
SELECT name, capacity FROM stadium WHERE average = (SELECT MAX(average) FROM stadium) LIMIT 1
SELECT s.name, s.capacity FROM stadium s INNER JOIN (SELECT MAX(average) AS max_avg FROM stadium) m ON s.average = m.max_avg
SELECT COUNT(*) FROM (SELECT * FROM concert WHERE year = 2014 OR year = 2015)
SELECT COUNT(concert_id) FROM concert WHERE year = 2014 UNION SELECT COUNT(concert_id) FROM concert WHERE year = 2015
SELECT stadium.name, (SELECT COUNT(*) FROM concert WHERE concert.stadium_id = stadium.stadium_id) AS num_concerts FROM stadium ORDER BY num_concerts DESC
SELECT s.name, COUNT(c.concert_id) FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id GROUP BY s.name
SELECT s.name, s.capacity FROM stadium s WHERE s.stadium_id = (SELECT c.stadium_id FROM concert c WHERE c.year >= 2014 GROUP BY c.stadium_id HAVING COUNT(*) = (SELECT MAX(concert_count) FROM (SELECT stadium_id, COUNT(*) as concert_count FROM concert WHERE year >= 2014 GROUP BY stadium_id)))
SELECT name, capacity FROM stadium WHERE stadium_id = ( SELECT stadium_id FROM concert GROUP BY stadium_id HAVING COUNT(*) = ( SELECT MAX(concert_count) FROM (SELECT COUNT(*) as concert_count FROM concert WHERE year > 2013 GROUP BY stadium_id) ) )
SELECT year FROM (SELECT year, COUNT(*) AS num_concerts FROM concert GROUP BY year HAVING num_concerts = MAX(num_concerts)) AS max_count
SELECT year FROM (SELECT year, COUNT(concert_id) as num_concerts FROM concert GROUP BY year HAVING num_concerts = (SELECT MAX(num_concerts) FROM (SELECT year, COUNT(concert_id) as num_concerts FROM concert GROUP BY year)))
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.stadium_id IS NULL
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.concert_id IS NULL
SELECT s.country FROM singer s WHERE s.age > 40 AND EXISTS (SELECT * FROM singer WHERE age < 30 AND country = s.country)
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id AND c.year = 2014 WHERE c.stadium_id IS NULL
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id AND c.year = 2014 WHERE c.concert_id IS NULL
SELECT c.concert_name, c.theme, COUNT(s.singer_id) AS singer_count FROM concert c JOIN singer_in_concert s ON c.concert_id = s.concert_id GROUP BY c.concert_name, c.theme
SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) as number_of_singers FROM concert JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert.concert_name
SELECT name, (SELECT COUNT(*) FROM singer_in_concert WHERE singer_id = singer.singer_id) AS num_concerts FROM singer GROUP BY name
SELECT name, COUNT(concert.concert_id) AS num_concerts FROM singer JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id JOIN concert ON singer_in_concert.concert_id = concert.concert_id GROUP BY name
SELECT singer.name FROM concert, singer_in_concert, singer WHERE concert.concert_id = singer_in_concert.concert_id AND singer_in_concert.singer_id = singer.singer_id AND concert.year = 2014 GROUP BY singer.name
SELECT s.name FROM singer s WHERE EXISTS (SELECT 1 FROM singer_in_concert sic, concert c WHERE s.singer_id = sic.singer_id AND c.year = 2014 AND sic.concert_id = c.concert_id)
SELECT DISTINCT name, country FROM singer WHERE song_name LIKE '%Hey%'
SELECT name, country FROM singer WHERE song_name LIKE '%Hey%'
SELECT name, location FROM stadium WHERE stadium_id IN (SELECT stadium_id FROM concert WHERE year = 2014) INTERSECT SELECT name, location FROM stadium WHERE stadium_id IN (SELECT stadium_id FROM concert WHERE year = 2015)
SELECT s.name, s.location FROM stadium s, concert c1, concert c2 WHERE s.stadium_id = c1.stadium_id AND s.stadium_id = c2.stadium_id AND c1.year = 2014 AND c2.year = 2015 GROUP BY s.name, s.location
SELECT COUNT(*) FROM concert JOIN (SELECT stadium_id FROM stadium ORDER BY capacity DESC LIMIT 1) AS max_capacity_stadium ON concert.stadium_id = max_capacity_stadium.stadium_id
SELECT COUNT(*) FROM concert WHERE stadium_id IN (SELECT stadium_id FROM stadium WHERE capacity = (SELECT MAX(capacity) FROM stadium) )
SELECT COUNT(*) FROM pets WHERE weight > 10 UNION SELECT COUNT(*) FROM pets WHERE weight > 10
SELECT COUNT(petid) FROM pets WHERE weight > 10
SELECT min(weight) FROM pets WHERE pettype = 'dog'
SELECT min(weight) FROM pets WHERE pettype = 'dog' AND pet_age = (SELECT min(pet_age) FROM pets)
SELECT pettype, MAX(weight) AS max_weight FROM pets GROUP BY pettype
SELECT pettype, MAX(weight) AS max_weight FROM pets GROUP BY pettype ORDER BY pettype
SELECT COUNT(*) FROM has_pet hp JOIN student s ON hp.stuid = s.stuid WHERE s.age > 20
SELECT COUNT(petid) FROM pets JOIN has_pet ON pets.petid = has_pet.petid JOIN student ON has_pet.stuid = student.stuid WHERE age > 20
SELECT COUNT(*) FROM has_pet JOIN student ON has_pet.stuid = student.stuid WHERE student.sex = 'F' AND exists (SELECT * FROM pets WHERE pets.petid = has_pet.petid AND pets.pettype = 'dog')
SELECT COUNT(pets.petid) FROM has_pet JOIN student ON has_pet.stuid = student.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'dog' AND student.sex = 'female'
SELECT count(pettype) as num_distinct_pets FROM pets GROUP BY pettype
SELECT COUNT(*) FROM (SELECT pettype FROM pets GROUP BY pettype HAVING COUNT(*) >= 0)
SELECT fname FROM student WHERE EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' OR pettype = 'dog')
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' OR pettype = 'dog')) GROUP BY fname
SELECT fname FROM student WHERE EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE has_pet.stuid = student.stuid AND pettype = 'cat') AND EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE has_pet.stuid = student.stuid AND pettype = 'dog')
SELECT fname FROM student WHERE stuid IN (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat') AND stuid IN (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'dog')
SELECT major, age FROM student WHERE (SELECT COUNT(*) FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'cat')) = 0
SELECT major, age FROM student s LEFT JOIN has_pet hp ON s.stuid = hp.stuid WHERE hp.petid NOT IN (SELECT petid FROM pets WHERE pettype = 'cat')
SELECT has_pet.stuid FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid LEFT JOIN pets ON has_pet.petid = pets.petid WHERE pettype <> 'cat' OR pettype IS NULL
SELECT stuid FROM student WHERE NOT EXISTS (SELECT * FROM has_pet INNER JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' AND student.stuid = has_pet.stuid)
SELECT fname, age FROM student WHERE EXISTS (SELECT 1 FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'dog')) AND NOT EXISTS (SELECT 1 FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'cat'))
SELECT s.fname FROM student s WHERE (SELECT COUNT(*) FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE hp.stuid = s.stuid AND p.pettype = 'dog') >= 1 AND (SELECT COUNT(*) FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE hp.stuid = s.stuid AND p.pettype = 'cat') = 0
SELECT pettype, weight FROM pets ORDER BY pet_age ASC LIMIT 1
SELECT pettype, weight FROM pets ORDER BY pet_age, weight LIMIT 1
SELECT p.petid, p.weight FROM pets p, has_pet h WHERE p.petid = h.petid AND p.pet_age > 1
SELECT petid, weight FROM pets WHERE pet_age > 1 LIMIT 100
SELECT pettype, AVG(student.age) AS average_age, MAX(student.age) AS max_age FROM pets INNER JOIN has_pet ON pets.petid = has_pet.petid INNER JOIN student ON has_pet.stuid = student.stuid GROUP BY pettype
SELECT pettype, AVG(age) as avg_age, MAX(age) as max_age FROM (SELECT pettype, s.age FROM pets p LEFT JOIN has_pet hp ON p.petid = hp.petid LEFT JOIN student s ON hp.stuid = s.stuid) GROUP BY pettype
SELECT pettype, AVG(weight) AS average_weight FROM pets GROUP BY pettype
SELECT pettype, AVG(weight) average_weight FROM pets GROUP BY pettype
SELECT student.fname, student.age FROM student INNER JOIN has_pet ON student.stuid = has_pet.stuid
SELECT student.fname, student.age FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.fname, student.age
SELECT petid FROM has_pet WHERE stuid = (SELECT stuid FROM student WHERE lname = 'Smith')
SELECT p.petid FROM pets p, has_pet h, student s WHERE s.lname = 'Smith' AND h.stuid = s.stuid AND p.petid = h.petid
SELECT student.stuid, (SELECT COUNT(petid) FROM has_pet WHERE has_pet.stuid = student.stuid) AS num_pets FROM student
SELECT stuid, COUNT(petid) AS pet_count FROM has_pet GROUP BY stuid
SELECT fname, sex FROM student WHERE stuid IN (SELECT stuid FROM has_pet GROUP BY stuid HAVING COUNT(*) > 1)
SELECT student.fname, student.sex FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.stuid HAVING count(has_pet.petid) > 1
SELECT lname FROM student, has_pet, pets WHERE student.stuid = has_pet.stuid AND has_pet.petid = pets.petid AND pettype = 'cat' AND pet_age = 3 LIMIT 1
SELECT lname FROM student WHERE stuid IN (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' AND pet_age = 3)
SELECT AVG(age) FROM student WHERE NOT EXISTS (SELECT * FROM has_pet WHERE has_pet.stuid = student.stuid)
SELECT AVG(age) FROM student WHERE NOT EXISTS (SELECT * FROM has_pet WHERE student.stuid = has_pet.stuid)
SELECT COUNT(*) AS num_continents FROM continents
SELECT count(*) as num_continents FROM continents
SELECT contid, continent, (SELECT COUNT(*) FROM countries WHERE countries.continent = contid) AS country_count FROM continents
SELECT continents.contid, continents.continent, (SELECT COUNT(*) FROM countries WHERE countries.continent = continents.contid) AS country_count FROM continents
SELECT COUNT(*) FROM countries GROUP BY countryid
SELECT COUNT(*) FROM countries GROUP BY countryid
SELECT fullname, id, COUNT(model) AS num_models FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY fullname, id
SELECT car_makers.id, car_makers.fullname, COUNT(*) AS num_models FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id
SELECT model FROM model_list WHERE modelid IN (SELECT id FROM car_names WHERE model = (SELECT model FROM cars_data WHERE horsepower = (SELECT MIN(horsepower) FROM cars_data)))
SELECT model_list.model FROM model_list INNER JOIN car_names ON model_list.model = car_names.model INNER JOIN cars_data ON car_names.makeid = cars_data.id ORDER BY cars_data.horsepower LIMIT 1
SELECT model FROM model_list WHERE modelid IN (SELECT modelid FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE weight < (SELECT AVG(weight) FROM cars_data)))
SELECT mo.model FROM model_list mo JOIN car_names cn ON mo.modelid = cn.model JOIN cars_data cd ON cn.makeid = cd.id WHERE cd.weight < (SELECT AVG(weight) FROM cars_data)
SELECT maker FROM car_makers WHERE id = (SELECT id FROM cars_data WHERE year = 1970 LIMIT 1)
SELECT DISTINCT maker FROM car_makers WHERE id IN (SELECT m.maker FROM model_list m, car_names n, cars_data d WHERE m.model = n.model AND n.makeid = d.id AND d.year = 1970)
SELECT make, MIN(year) as production_time FROM car_names CROSS JOIN cars_data ON car_names.makeid = cars_data.id GROUP BY make
SELECT model_list.maker, year FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE year = (SELECT MIN(year) FROM cars_data) ORDER BY year LIMIT 1
SELECT DISTINCT model FROM model_list WHERE modelid IN (SELECT makeid FROM car_names WHERE modelid IN (SELECT id FROM cars_data WHERE year > 1980))
SELECT model FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE year > 1980) ORDER BY model
SELECT c.continent, COUNT(DISTINCT cm.id) AS maker_count FROM continents c JOIN countries co ON c.contid = co.continent JOIN car_makers cm ON co.countryid = cm.country GROUP BY c.continent
SELECT c.continent, COUNT(cm.maker) AS num_car_makers FROM continents c JOIN countries co ON c.contid = co.continent JOIN car_makers cm ON co.countryid = cm.country GROUP BY c.continent
SELECT c.countryname FROM countries c JOIN (SELECT country, COUNT(maker) AS maker_count FROM car_makers GROUP BY country ORDER BY maker_count DESC LIMIT 1 ) AS top_country ON c.countryid = top_country.country
SELECT countryname FROM countries WHERE countryid = (SELECT country FROM car_makers GROUP BY country HAVING COUNT(id) = (SELECT COUNT(id) AS maker_count FROM car_makers GROUP BY country ORDER BY maker_count DESC LIMIT 1))
SELECT car_makers.fullname, (SELECT COUNT(*) FROM model_list INNER JOIN car_names ON model_list.model = car_names.model WHERE model_list.maker = car_makers.id) AS model_count FROM car_makers
SELECT cm.id, cm.fullname, COUNT(cn.model) FROM car_makers cm LEFT JOIN model_list ml ON cm.id = ml.maker LEFT JOIN car_names cn ON ml.model = cn.model GROUP BY cm.id, cm.fullname
SELECT accelerate FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE model = 'amc hornet sportabout (sw)')
SELECT cars_data.accelerate FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.makeid = model_list.modelid WHERE car_names.model = 'amc hornet sportabout (sw)'
SELECT COUNT(maker) FROM car_makers WHERE country = (SELECT countryid FROM countries WHERE countryname = 'france') GROUP BY country
SELECT COUNT(DISTINCT car_makers.maker) FROM car_makers, countries WHERE car_makers.country = countries.countryid AND countries.countryname = 'France'
SELECT count(model) FROM model_list INNER JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.country = (SELECT countryid FROM countries WHERE countryname = 'usa')
SELECT COUNT(*) FROM model_list INNER JOIN car_makers ON model_list.maker = car_makers.id INNER JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = 'United States'
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 LIMIT 1
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 INTERSECT SELECT AVG(mpg) FROM cars_data
SELECT weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight OFFSET 0 LIMIT 1
SELECT MIN(weight) AS min_weight FROM cars_data WHERE cylinders = 8 AND year = 1974
SELECT DISTINCT maker, model FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON car_names.model = model_list.model GROUP BY maker, model
SELECT maker, model FROM car_makers, model_list, car_names WHERE car_makers.id = model_list.maker AND model_list.model = car_names.model
SELECT c.countryid, c.countryname FROM countries c INNER JOIN car_makers m ON c.countryid = m.country GROUP BY c.countryid
SELECT countryid, countryname FROM countries WHERE countryid IN (SELECT country FROM car_makers) GROUP BY countryid, countryname
SELECT COUNT(*) FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE horsepower > 150)
SELECT COUNT(*) FROM cars_data WHERE horsepower > 150
SELECT year, AVG(weight) AS average_weight FROM cars_data GROUP BY year
SELECT year, AVG(weight) AS average_weight, AVG(year) AS average_year FROM cars_data WHERE year BETWEEN 2010 AND 2020 GROUP BY year
SELECT c.countryname FROM countries c JOIN (SELECT country, COUNT(DISTINCT maker) AS maker_count FROM car_makers GROUP BY country) cm ON c.countryid = cm.country WHERE c.continent = 'europe' AND cm.maker_count >= 3
SELECT countryname FROM countries JOIN car_makers ON countries.countryid = car_makers.country WHERE country IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(maker) >= 3) AND continent IN (SELECT continent FROM continents WHERE continent = 'europe')
SELECT MAX(horsepower), car_names.make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cylinders = 3 GROUP BY make
SELECT model_list.model, cars_data.horsepower FROM model_list JOIN cars_data ON model_list.modelid = car_names.modelid WHERE cars_data.cylinders = 3 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT model_list.model, mpg FROM ((model_list JOIN car_names ON model_list.model = car_names.model) JOIN cars_data ON car_names.makeid = cars_data.id) WHERE mpg = (SELECT MAX(mpg) FROM cars_data)
SELECT c.model FROM cars_data c JOIN (SELECT model, MAX(mpg) AS max_mpg FROM cars_data GROUP BY model) m ON c.model = m.model AND c.mpg = m.max_mpg
SELECT AVG(horsepower) FROM cars_data WHERE year < 1980
SELECT avg(horsepower) as avg_horsepower FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.model = model_list.model WHERE model_list.year < 1980 LIMIT 1
SELECT AVG(edispl) FROM cars_data JOIN (SELECT id, model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE maker = 'volvo')) AS subquery1 ON cars_data.id = (SELECT makeid FROM car_names WHERE model = subquery1.model)
SELECT AVG(edispl) FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE make = (SELECT id FROM car_makers WHERE maker = 'volvo'))
SELECT cylinders, MAX(accelerate) FROM cars_data GROUP BY cylinders ORDER BY cylinders
SELECT DISTINCT cylinders, (SELECT MAX(accelerate) FROM cars_data WHERE cylinders = c.cylinders) AS max_accelerate FROM cars_data c
SELECT model, (SELECT COUNT(*) FROM car_names WHERE model_list.model = car_names.model) as version_count FROM model_list ORDER BY version_count DESC LIMIT 1
SELECT model, versions FROM (SELECT model, COUNT(DISTINCT make) AS versions FROM car_names GROUP BY model) WHERE versions = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT make) AS cnt FROM car_names GROUP BY model))
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4 OFFSET 1
SELECT COUNT(id) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*) FROM cars_data WHERE year = 1980 GROUP BY year
SELECT COUNT(*) FROM cars_data WHERE year = 1980 GROUP BY year
SELECT COUNT(*) FROM model_list JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.fullname = 'American Motor Company'
SELECT count(modelid) FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'American Motor Company')
SELECT cm.id, cm.fullname FROM car_makers cm JOIN model_list ml ON cm.id = ml.maker GROUP BY cm.id, cm.fullname HAVING COUNT(ml.modelid) > 3
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker FROM model_list GROUP BY maker HAVING COUNT(DISTINCT model) > 3)
SELECT DISTINCT model FROM model_list WHERE maker IN (SELECT id FROM car_makers WHERE fullname = 'General Motors') OR EXISTS (SELECT 1 FROM cars_data WHERE cars_data.id = model_list.modelid AND weight > 3500)
SELECT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'General Motors') UNION SELECT model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.weight > 3500 GROUP BY model
SELECT c.year FROM cars_data c INNER JOIN car_names cn ON c.id = cn.makeid INNER JOIN model_list ml ON cn.model = ml.model WHERE c.weight >= 3000 AND c.weight <= 4000
SELECT year FROM cars_data WHERE weight < 4000 AND year IN (SELECT year FROM cars_data WHERE weight > 3000) GROUP BY year HAVING COUNT(*) = 2
SELECT max(horsepower) FROM cars_data WHERE accelerate = (SELECT max(accelerate) FROM cars_data) GROUP BY horsepower
SELECT MAX(horsepower) FROM cars_data WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data)
SELECT cylinders FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.modelid JOIN car_makers ON model_list.maker = car_makers.id WHERE model_list.model = 'volvo' ORDER BY accelerate LIMIT 1
SELECT MIN(cylinders) FROM cars_data WHERE id IN (SELECT makeid FROM car_names WHERE model = 'volvo')
SELECT count(*) FROM cars_data WHERE accelerate > (SELECT max(horsepower) FROM cars_data) AND mpg NOT IN (SELECT mpg FROM cars_data WHERE accelerate = (SELECT max(accelerate) FROM cars_data))
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data) ORDER BY accelerate DESC LIMIT 1
SELECT COUNT(*) FROM ( SELECT country FROM car_makers GROUP BY country HAVING COUNT(*) > 2 ) AS subquery
SELECT COUNT(DISTINCT c.countryname) FROM countries c INNER JOIN (SELECT country, COUNT(*) AS num_makers FROM car_makers GROUP BY country HAVING num_makers > 2) m ON c.countryid = m.country
SELECT COUNT(DISTINCT id) FROM cars_data WHERE cylinders > 6
SELECT COUNT(id) FROM cars_data WHERE cylinders > 6
SELECT model FROM model_list WHERE cylinders = 4 AND horsepower = (SELECT MAX(horsepower) FROM model_list WHERE cylinders = 4)
SELECT model FROM cars_data WHERE cylinders = 4 ORDER BY horsepower DESC LIMIT 1
SELECT car_names.makeid, car_names.make FROM car_names WHERE car_names.makeid IN (SELECT id FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data) AND cars_data.cylinders <= 3)
SELECT makeid, make FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE cylinders < 4 AND horsepower < (SELECT MIN(horsepower) FROM cars_data))
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 AND year < 1980 AND cylinders = 8
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 OR year < 1980
SELECT car_names.model FROM model_list JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE weight < 3500 AND car_makers.fullname != 'Ford Motor Company'
SELECT model FROM car_names WHERE EXISTS (SELECT id FROM cars_data WHERE weight < 3500 AND makeid = cars_data.id) AND makeid NOT IN (SELECT makeid FROM car_names WHERE model = 'ford')
SELECT countryname FROM countries WHERE NOT EXISTS (SELECT 1 FROM car_makers WHERE car_makers.country = countries.countryid) ORDER BY countryname
SELECT DISTINCT c.countryname FROM countries c LEFT JOIN car_makers cm ON c.countryid = cm.country WHERE cm.maker IS NULL
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker, COUNT(modelid) FROM model_list GROUP BY maker HAVING COUNT(modelid) >= 2)
SELECT car_makers.id, car_makers.maker FROM car_makers JOIN (SELECT maker, COUNT(*) AS model_count FROM model_list GROUP BY maker HAVING model_count >= 2) AS m ON car_makers.id = m.maker JOIN (SELECT make, COUNT(*) AS car_count FROM car_names GROUP BY make HAVING car_count > 3) AS c ON car_makers.id = c.make
SELECT countryid, countryname FROM countries WHERE countryid IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(id) > 3) OR countryid IN (SELECT country FROM car_makers JOIN model_list ON car_makers.id = model_list.maker WHERE model = 'fiat')
SELECT c.countryid, c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country GROUP BY c.countryid HAVING COUNT(DISTINCT cm.id) > 3 UNION SELECT c.countryid, c.countryname FROM countries c JOIN car_makers cm ON c.countryid = cm.country JOIN model_list ml ON cm.id = ml.maker WHERE ml.model = 'fiat'
SELECT airports.country FROM airlines JOIN airports ON airlines.abbreviation = airports.countryabbrev WHERE airlines.airline = 'JetBlue Airways'
SELECT country FROM (SELECT * FROM airlines) AS a WHERE a.airline = 'JetBlue Airways'
SELECT abbreviation FROM airlines WHERE airline = 'JetBlue Airways' LIMIT 1
SELECT abbreviation FROM airlines WHERE airline IN ('JetBlue Airways')
SELECT airline, abbreviation FROM airlines WHERE country = 'USA' INTERSECT SELECT airline, abbreviation FROM airlines WHERE countryabbrev = 'USA'
SELECT DISTINCT airline, abbreviation FROM airlines WHERE country = 'USA'
SELECT a.airportcode, a.airportname FROM airports a INNER JOIN airports b ON a.city = b.city WHERE a.city = 'Anthony'
SELECT DISTINCT airportcode, airportname FROM airports WHERE city = 'Anthony'
SELECT COUNT(airline) FROM airlines
SELECT COUNT(*) AS total_airlines FROM airlines GROUP BY airline
SELECT COUNT(*) AS airport_count FROM airports
SELECT COUNT(airportcode) FROM airports
SELECT COUNT(flightno) FROM flights
SELECT COUNT(*) FROM flights GROUP BY airline
SELECT MAX(airline) FROM airlines WHERE abbreviation = 'UAL'
SELECT airline FROM airlines WHERE abbreviation = 'UAL' INTERSECT SELECT airline FROM airlines WHERE abbreviation = 'UAL'
SELECT COUNT(uid) FROM airlines WHERE country = 'USA'
SELECT COUNT(DISTINCT uid) FROM airlines WHERE country = 'USA'
SELECT city, country FROM airports WHERE airportname = 'Alton'
SELECT city, country FROM airports WHERE airportname = 'Alton'
SELECT airportname FROM airports WHERE airportcode = 'AKO'
SELECT airportname FROM airports WHERE airportcode = 'AKO'
SELECT DISTINCT airportname FROM airports WHERE city = 'Aberdeen'
SELECT airportname FROM airports WHERE city = 'Aberdeen'
SELECT COUNT(flightno) FROM flights WHERE sourceairport = 'APG'
SELECT COUNT(*) FROM flights WHERE sourceairport = 'APG' GROUP BY sourceairport
SELECT COUNT(*) FROM flights WHERE destairport IN (SELECT airportcode FROM airports WHERE airportname = 'ATO')
SELECT COUNT(flightno) AS num_flights FROM flights WHERE destairport = 'ATO' INTERSECT SELECT COUNT(flightno) AS num_flights FROM flights WHERE destairport = 'ATO'
SELECT COUNT(flights.sourceairport) FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights LEFT JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE destairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') GROUP BY destairport
SELECT COUNT(flights.destairport) FROM flights, airports WHERE flights.destairport = airports.airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = 'Aberdeen' AND flights.destairport = (SELECT airportcode FROM airports WHERE city = 'Ashley')
SELECT COUNT(*) FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') AND destairport = (SELECT airportcode FROM airports WHERE city = 'Ashley') GROUP BY sourceairport, destairport
SELECT COUNT(*) FROM flights WHERE airline IN (SELECT airline FROM airlines WHERE abbreviation = 'JetBlue')
SELECT COUNT(airline) FROM airlines WHERE airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport IN (SELECT airportcode FROM airports WHERE airportname = 'Airport ASY')
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = 'ASY' INTERSECT SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = 'ASY' LIMIT 1
SELECT COUNT(*) FROM flights WHERE airline IN (SELECT airline FROM airlines WHERE airline = 'United Airlines') AND sourceairport = 'AHD'
SELECT COUNT(1) FROM flights WHERE airline = 'United Airlines' AND sourceairport = 'AHD' GROUP BY airline
SELECT count(*) FROM flights, airports WHERE airline = 'United Airlines' AND destairport = airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport IN (SELECT airportcode FROM airports WHERE city = 'Aberdeen')
SELECT city, COUNT(*) AS num_arriving_flights FROM airports JOIN flights ON airports.airportcode = flights.destairport GROUP BY city ORDER BY num_arriving_flights DESC LIMIT 1
SELECT city FROM airports WHERE airportcode IN ( SELECT destairport FROM flights GROUP BY destairport ORDER BY COUNT(destairport) DESC LIMIT 1 )
SELECT a.city, COUNT(f.sourceairport) AS num_departing_flights FROM airports a LEFT JOIN flights f ON a.airportcode = f.sourceairport GROUP BY a.city ORDER BY num_departing_flights DESC LIMIT 1
SELECT city, frequency FROM (SELECT sourceairport AS city, COUNT(*) AS frequency FROM flights GROUP BY sourceairport) WHERE frequency = (SELECT MAX(frequency) FROM (SELECT sourceairport AS city, COUNT(*) AS frequency FROM flights GROUP BY sourceairport))
SELECT sourceairport, COUNT(*) AS num_flights FROM flights GROUP BY sourceairport ORDER BY num_flights DESC LIMIT 1
SELECT destairport FROM flights GROUP BY destairport ORDER BY COUNT(*) DESC LIMIT 1
SELECT airportcode FROM flights GROUP BY destairport ORDER BY COUNT(*) LIMIT 1
SELECT destairport FROM flights GROUP BY destairport ORDER BY COUNT(*) LIMIT 1
SELECT airline FROM flights GROUP BY airline ORDER BY COUNT(*) DESC LIMIT 1
SELECT airline FROM flights GROUP BY airline ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 0 ROWS
SELECT abbreviation, country FROM airlines WHERE uid = (SELECT uid FROM airlines WHERE airline IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(*) = (SELECT min(cnt) FROM (SELECT COUNT(*) as cnt FROM flights GROUP BY airline))))
SELECT abbreviation, country FROM airlines WHERE uid = ( SELECT uid FROM airlines JOIN flights ON flights.airline = airlines.airline GROUP BY airline HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM flights GROUP BY airline) AS T) )
SELECT airline FROM flights WHERE sourceairport = 'AHD' AND airline IN (SELECT airline FROM flights WHERE sourceairport = 'AHD')
SELECT DISTINCT airline FROM flights WHERE sourceairport = 'AHD'
SELECT DISTINCT airline FROM flights WHERE destairport = 'AHD'
SELECT DISTINCT airline FROM flights WHERE destairport = 'AHD'
SELECT airline FROM flights WHERE destairport = 'APG' AND airline IN (SELECT airline FROM flights WHERE destairport = 'CVO')
SELECT airline FROM (SELECT airline, COUNT(DISTINCT sourceairport) AS dep_count FROM flights WHERE sourceairport = 'APG' OR sourceairport = 'CVO' GROUP BY airline) AS sub WHERE sub.dep_count = 2
SELECT DISTINCT airline FROM flights WHERE sourceairport = 'CVO' AND airline NOT IN (SELECT airline FROM flights WHERE sourceairport = 'APG')
SELECT DISTINCT f1.airline FROM flights f1 WHERE f1.destairport = 'CVO' AND f1.airline NOT IN (SELECT f2.airline FROM flights f2 WHERE f2.sourceairport = 'APG')
SELECT DISTINCT airline FROM flights WHERE airline IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(*) >= 10)
SELECT airline FROM (SELECT airline, COUNT(*) AS num_flights FROM flights GROUP BY airline) WHERE num_flights >= 10
SELECT airline FROM airlines WHERE airline IN (SELECT airline FROM flights GROUP BY airline HAVING COUNT(flightno) < 200)
SELECT a.abbreviation FROM airlines a LEFT JOIN flights f ON a.airline = f.airline GROUP BY a.airline HAVING COUNT(f.airline) < 200
SELECT flights.flightno FROM flights, airlines WHERE flights.airline = airlines.abbreviation AND airlines.airline = 'United Airlines'
SELECT flightno FROM flights WHERE EXISTS (SELECT * FROM airlines WHERE flights.airline = airlines.abbreviation AND airlines.airline = 'United Airlines')
SELECT flightno FROM flights WHERE sourceairport = 'APG'
SELECT f.flightno FROM flights f, airports a WHERE f.sourceairport = a.airportcode AND a.airportcode = 'APG'
SELECT flightno FROM flights WHERE destairport = 'APG' GROUP BY flightno
SELECT flightno FROM flights, airports WHERE flights.destairport = airports.airportcode AND airports.airportcode = 'APG'
SELECT flightno FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen' LIMIT 1)
SELECT flightno FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND airports.city = 'Aberdeen'
SELECT f.flightno FROM flights f INNER JOIN airports a ON f.destairport = a.airportcode WHERE a.city = 'Aberdeen'
SELECT flightno FROM flights WHERE destairport = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE destairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') OR destairport = (SELECT airportcode FROM airports WHERE city = 'Abilene')
SELECT COUNT(flights.flightno) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city IN ('Aberdeen', 'Abilene')
SELECT a.airportname FROM airports a LEFT JOIN flights f1 ON a.airportcode = f1.sourceairport LEFT JOIN flights f2 ON a.airportcode = f2.destairport WHERE f1.sourceairport IS NULL AND f2.destairport IS NULL
SELECT airportname FROM airports WHERE airportcode NOT IN (SELECT sourceairport FROM flights EXCEPT SELECT destairport FROM flights)
SELECT sum(1) FROM employee
SELECT COUNT(*) AS employee_count FROM employee
SELECT DISTINCT name FROM employee ORDER BY age
SELECT name FROM employee GROUP BY name, age ORDER BY age
SELECT city, COUNT(employee_id) AS num_employees FROM employee GROUP BY city ORDER BY num_employees
SELECT city, COUNT(employee_id) FROM employee GROUP BY city
SELECT DISTINCT e1.city FROM employee e1, employee e2 WHERE e1.age < 30 AND e1.city = e2.city AND e1.employee_id <> e2.employee_id
SELECT city FROM employee WHERE age < 30 GROUP BY city HAVING COUNT(DISTINCT employee_id) > 1
SELECT location, COUNT(DISTINCT shop_id) AS num_shops FROM shop GROUP BY location
SELECT s.location, num_shops FROM shop s INNER JOIN (SELECT location, COUNT(*) as num_shops FROM shop GROUP BY location) counts ON s.location = counts.location
SELECT s.manager_name, s.district FROM shop s INNER JOIN (SELECT MAX(number_products) AS max_products FROM shop) x ON s.number_products = x.max_products
SELECT manager_name, district FROM shop WHERE number_products = (SELECT MAX(number_products) FROM shop)
SELECT MIN(number_products) AS min_products, MAX(number_products) AS max_products FROM shop
SELECT MIN(number_products) AS min_products, MAX(number_products) AS max_products FROM shop
SELECT name, location, district FROM shop ORDER BY number_products DESC, name ASC, location DESC
SELECT name, location, district FROM shop ORDER BY number_products DESC OFFSET 5
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop) AND location IN (SELECT location FROM shop)
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT e.name FROM employee e, evaluation eval WHERE e.employee_id = eval.employee_id GROUP BY e.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT e.name FROM employee e WHERE e.employee_id = (SELECT employee_id FROM evaluation GROUP BY employee_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT e.name FROM employee e WHERE EXISTS (SELECT 1 FROM evaluation WHERE employee_id = e.employee_id HAVING MAX(bonus))
SELECT e.name FROM employee e INNER JOIN evaluation ev ON e.employee_id = ev.employee_id ORDER BY ev.bonus DESC LIMIT 1
SELECT e.name FROM employee e LEFT JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.employee_id IS NULL
SELECT name FROM employee WHERE NOT EXISTS (SELECT * FROM evaluation WHERE evaluation.employee_id = employee.employee_id) AND NOT EXISTS (SELECT * FROM hiring WHERE hiring.employee_id = employee.employee_id)
SELECT s.name FROM shop s JOIN (SELECT shop_id, COUNT(employee_id) as emp_count FROM hiring GROUP BY shop_id ORDER BY emp_count DESC LIMIT 1) h ON s.shop_id = h.shop_id
SELECT s.name FROM shop s WHERE (SELECT COUNT(employee_id) FROM hiring h WHERE h.shop_id = s.shop_id) = (SELECT MAX(emp_count) FROM (SELECT shop_id, COUNT(employee_id) as emp_count FROM hiring GROUP BY shop_id) AS counts) LIMIT 1
SELECT name FROM shop WHERE NOT EXISTS (SELECT 1 FROM hiring WHERE hiring.shop_id = shop.shop_id AND employee_id IS NOT NULL)
SELECT s.name FROM shop s LEFT JOIN hiring h ON s.shop_id = h.shop_id GROUP BY s.name HAVING COUNT(h.employee_id) = 0 AND COUNT(h.employee_id) = COUNT(h.is_full_time)
SELECT shop.name, COUNT(*) as num_employees FROM hiring GROUP BY shop_id
SELECT shop.name, COUNT(hiring.employee_id) AS num_employees FROM shop INNER JOIN hiring ON shop.shop_id = hiring.shop_id GROUP BY shop.name
SELECT TOTAL(e.bonus) FROM evaluation e
SELECT SUM(e.bonus) AS total_bonus_amount FROM evaluation AS e
SELECT h.shop_id, h.employee_id, h.start_from, h.is_full_time FROM hiring AS h
SELECT * FROM hiring
SELECT s1.district FROM shop s1 JOIN shop s2 ON s1.district = s2.district WHERE s1.number_products < 3000 AND s2.number_products > 10000
SELECT district FROM shop WHERE number_products < 3000 INTERSECT SELECT district FROM shop WHERE number_products > 10000 ORDER BY district
SELECT COUNT(*) FROM shop GROUP BY location
SELECT DISTINCT COUNT( location ) FROM shop
SELECT COUNT(DISTINCT document_id) FROM paragraphs
SELECT COUNT(*) AS document_count FROM documents
SELECT document_id, document_name, document_description FROM documents
SELECT document_id, document_name, document_description FROM documents WHERE 1 = 1
SELECT documents.document_name, documents.template_id FROM documents WHERE document_description LIKE '%w%' LIMIT 1
SELECT document_name, template_id FROM documents WHERE document_description LIKE '%w%' AND template_id = (SELECT template_id FROM templates)
SELECT document_id, template_id, document_description FROM documents WHERE document_name = 'Robbin CV' AND template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'CV')
SELECT document_id, template_id, document_description FROM documents WHERE document_name = 'Robbin CV'
SELECT COUNT(DISTINCT T.template_id) FROM templates T, documents D WHERE T.template_id = D.template_id
SELECT COUNT(DISTINCT templates.template_id) AS num_templates_used FROM templates WHERE templates.template_id IN (SELECT DISTINCT template_id FROM documents)
SELECT COUNT(*) FROM documents INNER JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = 'PPT'
SELECT COUNT(*) FROM documents INNER JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = 'PPT'
SELECT template_id, (SELECT COUNT(document_id) FROM documents d WHERE t.template_id = d.template_id) AS num_documents FROM templates t
SELECT template_id, (SELECT COUNT(*) FROM documents WHERE template_id = templates.template_id) AS num_documents FROM templates
SELECT templates.template_id, templates.template_type_code FROM templates JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_id, template_type_code FROM templates WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT template_id FROM (SELECT template_id, COUNT(document_id) AS doc_count FROM documents GROUP BY template_id) WHERE doc_count > 1
SELECT template_id FROM templates WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id HAVING COUNT(*) > 1) AND date_effective_to IS NULL
SELECT t.template_id FROM templates t LEFT JOIN documents d ON t.template_id = d.template_id WHERE d.document_id IS NULL
SELECT template_id FROM templates WHERE NOT EXISTS (SELECT * FROM documents WHERE documents.template_id = templates.template_id)
SELECT COUNT(*) FROM templates GROUP BY template_id
SELECT COUNT(*) AS template_count FROM templates
SELECT DISTINCT template_id, version_number, template_type_code FROM templates
SELECT DISTINCT template_id, version_number, template_type_code FROM templates
SELECT template_type_code FROM templates WHERE template_id IN (SELECT DISTINCT template_id FROM documents)
SELECT template_type_code FROM templates WHERE template_type_code IN (SELECT template_type_code FROM ref_template_types)
SELECT template_id FROM templates WHERE template_type_code IN ('PP', 'PPT')
SELECT template_id FROM templates WHERE template_type_code = 'PP' INTERSECT SELECT template_id FROM templates WHERE template_type_code = 'PPT'
SELECT COUNT(*) FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE template_type_description = 'CV'
SELECT COUNT(*) FROM templates WHERE template_type_code = (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'CV')
SELECT templates.version_number, templates.template_type_code FROM templates WHERE templates.version_number > 5
SELECT DISTINCT version_number, template_type_code FROM templates WHERE version_number > 5
SELECT template_type_code, (SELECT COUNT(template_id) FROM templates WHERE template_type_code = rt.template_type_code) AS num_templates FROM ref_template_types rt
SELECT tt.template_type_code, (SELECT COUNT(template_id) FROM templates t WHERE t.template_type_code = tt.template_type_code) as num_templates FROM ref_template_types tt
SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code HAVING COUNT(template_id) = (SELECT MAX(template_count) FROM (SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code))
SELECT template_type_code FROM (SELECT template_type_code, COUNT(*) as template_count FROM templates GROUP BY template_type_code ORDER BY template_count DESC) LIMIT 1
SELECT template_type_code FROM templates WHERE template_type_code IN (SELECT template_type_code FROM templates GROUP BY template_type_code HAVING COUNT(template_id) < 3)
SELECT template_type_code FROM ref_template_types WHERE template_type_code IN (SELECT template_type_code FROM templates GROUP BY template_type_code HAVING COUNT(template_id) < 3)
SELECT MIN(version_number) AS smallest_version, template_type_code FROM templates
SELECT MIN(version_number) AS min_version, template_type_code FROM templates GROUP BY template_type_code
SELECT template_type_code FROM templates WHERE template_id = (SELECT template_id FROM documents WHERE document_name = 'Data base') LIMIT 1
SELECT template_type_code FROM documents JOIN templates USING (template_id) WHERE document_name = 'Data base'
SELECT document_name FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'BK') GROUP BY document_name
SELECT document_name FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'BK')
SELECT template_type_code, (SELECT COUNT(*) FROM documents WHERE documents.template_id = templates.template_id) AS document_count FROM templates GROUP BY template_type_code
SELECT template_type_code, (SELECT COUNT(*) FROM documents d WHERE d.template_id = t.template_id) AS num_documents FROM templates t
SELECT template_type_code FROM templates WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id ORDER BY COUNT(document_id) DESC LIMIT 1)
SELECT template_type_code FROM (SELECT t.template_type_code, COUNT(*) AS doc_count FROM templates t JOIN documents d ON t.template_id = d.template_id GROUP BY t.template_type_code) ORDER BY doc_count DESC LIMIT 1
SELECT template_type_code FROM ref_template_types WHERE template_type_code NOT IN (SELECT template_id FROM documents) AND template_type_code NOT IN (SELECT template_type_code FROM templates)
SELECT template_type_code FROM ref_template_types WHERE template_type_code NOT IN (SELECT template_type_code FROM templates)
SELECT template_type_code, template_type_description FROM ref_template_types
SELECT template_type_code, template_type_description FROM ref_template_types
SELECT template_type_description FROM ref_template_types WHERE template_type_code = 'AD' GROUP BY template_type_description
SELECT template_type_description FROM ref_template_types rt WHERE rt.template_type_code = 'AD'
SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Book' GROUP BY template_type_code
SELECT RTT.template_type_code FROM ref_template_types RTT JOIN templates T ON RTT.template_type_code = T.template_type_code WHERE RTT.template_type_description = 'Book'
SELECT DISTINCT template_type_description FROM ref_template_types JOIN templates ON ref_template_types.template_type_code = templates.template_type_code JOIN documents ON templates.template_id = documents.template_id JOIN paragraphs ON documents.document_id = paragraphs.document_id
SELECT DISTINCT template_type_description FROM ( SELECT t.template_type_description FROM templates t JOIN documents d ON t.template_id = d.template_id )
SELECT template_id FROM templates WHERE template_type_code IN (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Presentation')
SELECT template_id FROM templates WHERE template_type_code = (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Presentation') DISTINCT
SELECT (SELECT COUNT(*) FROM paragraphs) AS total_paragraphs
SELECT TOTAL_COUNT FROM (SELECT COUNT(*) AS TOTAL_COUNT FROM paragraphs)
SELECT COUNT(*) FROM documents d, paragraphs p WHERE d.document_id = p.document_id AND d.document_name = 'Summer Show'
SELECT COUNT(paragraph_id) FROM paragraphs WHERE document_id IN (SELECT document_id FROM documents WHERE document_name = 'Summer Show')
SELECT paragraph_text FROM paragraphs WHERE paragraph_text LIKE 'Korea'
SELECT * FROM paragraphs WHERE document_id IN (SELECT document_id FROM documents WHERE document_name = 'Korea')
SELECT paragraph_id, paragraph_text FROM paragraphs WHERE document_id = (SELECT document_id FROM documents WHERE document_name = 'Welcome to NY')
SELECT paragraph_id, paragraph_text FROM paragraphs WHERE document_id = (SELECT document_id FROM documents WHERE document_name = 'Welcome to NY') ORDER BY paragraph_id
SELECT paragraph_text FROM paragraphs INNER JOIN documents ON paragraphs.document_id = documents.document_id WHERE document_name = 'Customer reviews'
SELECT paragraph_text FROM paragraphs INNER JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = 'Customer reviews'
SELECT document_id, (SELECT count(*) FROM paragraphs WHERE paragraphs.document_id = documents.document_id) AS paragraph_count FROM documents ORDER BY document_id
SELECT document_id, num_paragraphs FROM ( SELECT document_id, COUNT(*) as num_paragraphs FROM paragraphs GROUP BY document_id ) AS doc_paragraph_counts ORDER BY document_id
SELECT document_id, document_name, (SELECT COUNT(*) FROM paragraphs WHERE paragraphs.document_id = documents.document_id) AS paragraph_count FROM documents
SELECT documents.document_id, document_name, (SELECT COUNT(paragraph_id) FROM paragraphs WHERE paragraphs.document_id = documents.document_id) AS num_paragraphs FROM documents
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) >= 2
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(*) > 1
SELECT document_id, document_name FROM documents GROUP BY document_id, document_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT document_id, document_name FROM documents WHERE document_id = (SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) = (SELECT MAX(COUNT(paragraph_id)) FROM paragraphs))
SELECT document_id FROM paragraphs p1 WHERE NOT EXISTS (SELECT 1 FROM paragraphs p2 WHERE p2.document_id = p1.document_id AND p2.paragraph_id <> p1.paragraph_id)
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) LIMIT 1
SELECT document_id FROM paragraphs WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING count(paragraph_id) = 1) INTERSECT SELECT document_id FROM paragraphs WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING count(paragraph_id) = 2)
SELECT document_id FROM documents WHERE document_id IN (SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) = 1 OR COUNT(paragraph_id) = 2)
SELECT document_id FROM paragraphs WHERE paragraph_text = 'Brazil' INTERSECT SELECT document_id FROM paragraphs WHERE paragraph_text = 'Ireland'
SELECT document_id FROM paragraphs WHERE paragraph_text = 'Brazil' UNION SELECT document_id FROM paragraphs WHERE paragraph_text = 'Ireland'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher
SELECT DISTINCT name FROM teacher ORDER BY age
SELECT name FROM teacher ORDER BY age
SELECT age, hometown FROM teacher LIMIT 10
SELECT teacher.age, teacher.hometown FROM teacher
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT name FROM teacher WHERE hometown != 'Little Lever Urban District'
SELECT name FROM teacher WHERE age = 32 UNION ALL SELECT name FROM teacher WHERE age = 33
SELECT name FROM teacher WHERE age = 32 OR age = 33
SELECT hometown FROM teacher WHERE age = (SELECT MIN(age) FROM teacher ORDER BY age ASC)
SELECT hometown FROM teacher WHERE age = (SELECT MIN(age) FROM teacher)
SELECT hometown, COUNT(*) FROM teacher GROUP BY hometown
SELECT hometown, COUNT(teacher_id) AS num_teachers FROM (SELECT DISTINCT hometown, teacher_id FROM teacher) GROUP BY hometown
SELECT hometown, COUNT(hometown) AS num_teachers FROM teacher GROUP BY hometown ORDER BY num_teachers DESC LIMIT 1
SELECT hometown FROM teacher GROUP BY hometown HAVING COUNT(teacher_id) = (SELECT COUNT(teacher_id) FROM teacher GROUP BY hometown ORDER BY COUNT(teacher_id) DESC LIMIT 1)
SELECT DISTINCT t1.hometown FROM teacher t1 INNER JOIN teacher t2 ON t1.hometown = t2.hometown AND t1.teacher_id <> t2.teacher_id
SELECT DISTINCT t1.hometown FROM teacher t1 JOIN teacher t2 ON t1.hometown = t2.hometown WHERE t1.teacher_id != t2.teacher_id
SELECT teacher.name, course.course FROM teacher, course_arrange, course WHERE teacher.teacher_id = course_arrange.teacher_id AND course_arrange.course_id = course.course_id
SELECT teacher.name, course.course FROM teacher, course_arrange, course WHERE teacher.teacher_id = course_arrange.teacher_id AND course_arrange.course_id = course.course_id
SELECT teacher.name, course.course FROM teacher, course_arrange, course WHERE teacher.teacher_id = course_arrange.teacher_id AND course_arrange.course_id = course.course_id ORDER BY teacher.name
SELECT t.name, c.course FROM teacher t JOIN course_arrange ca ON t.teacher_id = ca.teacher_id JOIN course c ON ca.course_id = c.course_id ORDER BY t.name
SELECT t.name FROM teacher t INNER JOIN course_arrange ca ON t.teacher_id = ca.teacher_id INNER JOIN course c ON ca.course_id = c.course_id WHERE c.course = 'Math'
SELECT t.name FROM teacher t, course c, course_arrange ca WHERE t.teacher_id = ca.teacher_id AND c.course_id = ca.course_id AND c.course = 'Math'
SELECT name, (SELECT COUNT(course_id) FROM course_arrange WHERE course_arrange.teacher_id = teacher.teacher_id) FROM teacher
SELECT name, (SELECT COUNT(*) FROM course_arrange WHERE teacher_id = t.teacher_id) AS num_courses FROM teacher t
SELECT name FROM teacher WHERE teacher_id IN (SELECT teacher_id FROM course_arrange GROUP BY teacher_id HAVING COUNT(course_id) >= 2)
SELECT name FROM teacher WHERE teacher_id IN ( SELECT teacher_id FROM course_arrange GROUP BY teacher_id HAVING COUNT(*) >= 2 )
SELECT name FROM teacher WHERE NOT EXISTS (SELECT * FROM course_arrange WHERE teacher.teacher_id = course_arrange.teacher_id)
SELECT t.name FROM teacher t WHERE NOT EXISTS (SELECT * FROM course_arrange ca WHERE t.teacher_id = ca.teacher_id AND ca.course_id IS NOT NULL)
SELECT COUNT(age) FROM visitor WHERE age < 30
SELECT name FROM visitor WHERE level_of_membership > 4 ORDER BY level_of_membership DESC
SELECT AVG(age) FROM visitor WHERE level_of_membership <= 4 UNION SELECT AVG(age) FROM visitor
SELECT name, level_of_membership FROM visitor WHERE level_of_membership > 4 ORDER BY age DESC
SELECT museum_id, name FROM museum ORDER BY num_of_staff DESC LIMIT 1
SELECT AVG(num_of_staff) as average_staff FROM museum WHERE open_year < 2009 LIMIT 1
SELECT open_year, num_of_staff FROM museum WHERE name = 'Plaza Museum'
SELECT m.name FROM museum m INNER JOIN (SELECT MIN(num_of_staff) AS min_staff FROM museum WHERE open_year > 2010) min ON m.num_of_staff > min.min_staff
SELECT id, name, age FROM visitor WHERE id IN (SELECT visitor_id FROM visit GROUP BY visitor_id HAVING COUNT(*) > 1) DISTINCT
SELECT id, name, level_of_membership FROM visitor WHERE id = (SELECT visitor_id FROM (SELECT visitor_id, SUM(total_spent) AS total FROM visit GROUP BY visitor_id ORDER BY total DESC LIMIT 1))
SELECT m.museum_id, m.name FROM museum m WHERE m.museum_id = (SELECT museum_id FROM visit GROUP BY museum_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT m.name FROM museum m LEFT JOIN visit v ON m.museum_id = v.museum_id WHERE v.museum_id IS NULL
SELECT v.name, v.age FROM visitor v JOIN visit vs ON v.id = vs.visitor_id GROUP BY v.name, v.age ORDER BY SUM(vs.num_of_ticket) DESC LIMIT 1
SELECT AVG(num_of_ticket) AS average_tickets, MAX(num_of_ticket) AS max_tickets FROM visit GROUP BY visit.visitor_id
SELECT SUM(num_of_ticket) FROM visit WHERE visitor_id IN (SELECT id FROM visitor WHERE level_of_membership = 1)
SELECT v.name FROM visitor v WHERE EXISTS (SELECT 1 FROM visit vi1 JOIN museum m1 ON vi1.museum_id = m1.museum_id WHERE vi1.visitor_id = v.id AND m1.open_year < 2009) AND EXISTS (SELECT 1 FROM visit vi2 JOIN museum m2 ON vi2.museum_id = m2.museum_id WHERE vi2.visitor_id = v.id AND m2.open_year > 2011)
SELECT COUNT(*) FROM visit WHERE NOT EXISTS (SELECT museum_id FROM museum WHERE museum.museum_id = visit.museum_id AND open_year > 2010)
SELECT count(*) FROM (SELECT DISTINCT museum_id FROM museum WHERE open_year > 2013 OR open_year < 2008)
SELECT COUNT(*) AS total_players FROM players
SELECT COUNT(player_id) FROM players
SELECT TOTAL(MATCH_NUM) FROM MATCHES
SELECT TOTAL(match_num) FROM matches
SELECT players.first_name, players.birth_date FROM players WHERE players.country_code = 'USA'
SELECT first_name, birth_date FROM players WHERE player_id IN (SELECT player_id FROM rankings WHERE ranking_date = (SELECT MAX(ranking_date) FROM rankings) AND player_id IN (SELECT winner_id FROM matches WHERE winner_ioc = 'USA'))
SELECT (AVG(winner_age) + AVG(loser_age)) / 2 as average_age FROM matches
SELECT AVG((julianday('now') - julianday(p1.birth_date))/365.25) AS average_loser_age, AVG((julianday('now') - julianday(p2.birth_date))/365.25) AS average_winner_age FROM matches JOIN players p1 ON matches.loser_id = p1.player_id JOIN players p2 ON matches.winner_id = p2.player_id
SELECT AVG(r.ranking) FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN (SELECT * FROM rankings) r ON p.player_id = r.player_id
SELECT AVG(ranking) FROM rankings WHERE player_id IN (SELECT winner_id FROM matches)
SELECT MAX(ranking) AS highest_rank FROM rankings WHERE player_id IN (SELECT loser_id FROM matches)
SELECT MIN(loser_rank) FROM matches
SELECT COUNT(DISTINCT p.country_code) FROM players p
SELECT COUNT(DISTINCT country_code) FROM (SELECT country_code FROM players)
SELECT COUNT(DISTINCT p.first_name || ' ' || p.last_name) FROM players p, matches m WHERE p.player_id = m.loser_id
SELECT COUNT(loser_name) FROM (SELECT loser_name, COUNT(loser_name) FROM matches GROUP BY loser_name)
SELECT tourney_name FROM (SELECT tourney_name, COUNT(*) as match_count FROM matches GROUP BY tourney_name) WHERE match_count > 10
SELECT tourney_name FROM matches WHERE tourney_name IN ( SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10 )
SELECT p.first_name, p.last_name FROM players p WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) AND player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT first_name, last_name FROM players WHERE player_id IN ( SELECT winner_id FROM matches WHERE year = 2013 ) AND player_id IN ( SELECT winner_id FROM matches WHERE year = 2016 )
SELECT SUM(CASE WHEN year = 2013 OR year = 2016 THEN 1 ELSE 0 END) FROM matches
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016 GROUP BY year
SELECT p.country_code, p.first_name FROM players p WHERE EXISTS (SELECT 1 FROM matches m WHERE m.winner_id = p.player_id AND m.tourney_name = 'WTA Championships') AND EXISTS (SELECT 1 FROM matches m WHERE m.winner_id = p.player_id AND m.tourney_name = 'Australian Open')
SELECT p.first_name, p.country_code FROM players p WHERE EXISTS (SELECT 1 FROM matches m1 WHERE p.player_id = m1.winner_id AND m1.tourney_name = 'WTA Championships') AND EXISTS (SELECT 1 FROM matches m2 WHERE p.player_id = m2.winner_id AND m2.tourney_name = 'Australian Open')
SELECT p.first_name, p.country_code FROM players p JOIN ( SELECT player_id, MIN(birth_date) AS min_birth_date FROM players WHERE birth_date IS NOT NULL ) AS sub ON p.birth_date = sub.min_birth_date
SELECT first_name, country_code FROM players WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT players.first_name, players.last_name FROM players INNER JOIN matches ON players.player_id = matches.winner_id ORDER BY players.birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date DESC, first_name ASC, last_name ASC
SELECT first_name, last_name FROM players WHERE hand = 'L' AND birth_date IS NOT NULL ORDER BY birth_date ASC
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'left' ORDER BY birth_date DESC
SELECT p.first_name, p.country_code FROM players p JOIN (SELECT winner_id, COUNT(tours) AS tour_count FROM matches GROUP BY winner_id ORDER BY tour_count DESC LIMIT 1) AS sub ON p.player_id = sub.winner_id
SELECT first_name, country_code FROM players WHERE player_id = (SELECT player_id FROM rankings GROUP BY player_id HAVING COUNT(tours) = (SELECT MAX(tour_count) FROM (SELECT COUNT(tours) AS tour_count FROM rankings GROUP BY player_id)))
SELECT year FROM (SELECT year, count(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC) LIMIT 1
SELECT YEAR, MAX(match_count) AS max_matches FROM (SELECT year, COUNT(match_num) AS match_count FROM matches GROUP BY year)
SELECT winner_name, winner_rank_points FROM matches GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name, MAX(winner_rank_points) AS max_rank_points FROM matches GROUP BY winner_name ORDER BY max_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' AND winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT winner_name FROM matches WHERE winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open') AND winner_id IN (SELECT player_id FROM players WHERE EXISTS (SELECT ranking_points FROM rankings WHERE player_id = players.player_id))
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT first_name || ' ' || last_name AS winner_name, (SELECT first_name || ' ' || last_name FROM players WHERE player_id = loser_id) AS loser_name FROM players JOIN (SELECT winner_id, loser_id FROM matches ORDER BY minutes DESC LIMIT 1) m ON player_id = winner_id
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p, rankings r WHERE p.player_id = r.player_id GROUP BY p.first_name
SELECT first_name, AVG(ranking) AS avg_ranking FROM players, rankings WHERE players.player_id = rankings.player_id GROUP BY first_name
SELECT first_name, SUM(ranking_points) AS total_ranking_points FROM players INNER JOIN (SELECT player_id, SUM(ranking_points) AS ranking_points FROM rankings GROUP BY player_id) AS subquery ON players.player_id = subquery.player_id
SELECT first_name, SUM(ranking_points) AS total_points FROM players INNER JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code
SELECT country_code, COUNT(*) as player_count FROM players GROUP BY country_code
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(player_id) = ( SELECT MAX(player_count) FROM (SELECT country_code, COUNT(player_id) AS player_count FROM players GROUP BY country_code) )
SELECT country_code, COUNT(player_id) AS player_count FROM players GROUP BY country_code ORDER BY player_count DESC LIMIT 1
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT winner_ioc AS country_code FROM matches UNION SELECT loser_ioc AS country_code FROM matches GROUP BY country_code HAVING COUNT(DISTINCT winner_id) + COUNT(DISTINCT loser_id) > 50
SELECT ranking_date, COUNT(DISTINCT tours) AS total_tours FROM rankings GROUP BY ranking_date ORDER BY ranking_date
SELECT ranking_date, (SELECT COUNT(DISTINCT tours) FROM rankings AS r2 WHERE r2.ranking_date = rankings.ranking_date) AS total_tours FROM rankings GROUP BY ranking_date
SELECT year, (SELECT count(*) FROM matches m2 WHERE m2.year = matches.year) as num_matches FROM matches GROUP BY year
SELECT year, count(match_num) as num_matches FROM matches GROUP BY year
SELECT first_name || ' ' || last_name AS winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id ORDER BY winner_age LIMIT 3
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age LIMIT 3
SELECT COUNT(DISTINCT m.winner_id) FROM matches m JOIN players p ON m.winner_id = p.player_id WHERE tourney_name = 'WTA Championships' AND p.hand = 'L' AND m.winner_id IN (SELECT winner_id FROM matches WHERE tourney_name = 'WTA Championships' AND winner_hand = 'L')
SELECT COUNT(DISTINCT matches.winner_id) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships' AND winner_id IN (SELECT player_id FROM players WHERE hand = 'L')
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY winner_rank_points DESC LIMIT 1)
SELECT first_name, country_code, birth_date FROM players INNER JOIN (SELECT winner_id, MAX(total_points) as max_points FROM (SELECT winner_id, SUM(winner_rank_points) as total_points FROM matches GROUP BY winner_id) ) t ON players.player_id = t.winner_id
SELECT hand, COUNT(player_id) AS player_count FROM players GROUP BY hand
SELECT hand, COUNT(player_id) AS player_count FROM players GROUP BY hand ORDER BY player_count DESC
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured'
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage
SELECT name, date, result FROM battle ORDER BY date
SELECT MAX(injured) AS max_death_toll, MIN(injured) AS min_death_toll FROM death
SELECT AVG(injured) FROM death
SELECT * FROM death WHERE caused_by_ship_id IN (SELECT id FROM ship WHERE tonnage = 't') AND note LIKE '%injury%'
SELECT name, result FROM battle WHERE bulgarian_commander <> 'Boril' AND bulgarian_commander IS NOT NULL
SELECT id, name FROM battle WHERE EXISTS (SELECT * FROM ship WHERE ship.lost_in_battle = battle.id AND ship_type = 'Brig')
SELECT id, name FROM battle WHERE id IN (SELECT caused_by_ship_id FROM death WHERE caused_by_ship_id = ship.id AND killed > 10)
SELECT ship.id, ship.name FROM ship JOIN ( SELECT caused_by_ship_id, SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id ORDER BY total_injuries DESC LIMIT 1 ) AS max_injuries ON ship.id = max_injuries.caused_by_ship_id
SELECT DISTINCT name FROM battle WHERE latin_commander = 'Baldwin I' ORDER BY name LIMIT 10
SELECT COUNT(DISTINCT result) FROM battle
SELECT COUNT(*) FROM battle WHERE NOT EXISTS (SELECT * FROM ship WHERE tonnage = '225' AND lost_in_battle = id)
SELECT name, date FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE name = 'Lettice' OR name = 'HMS Atalanta')
SELECT name, result, bulgarian_commander FROM battle WHERE NOT EXISTS (SELECT 1 FROM ship WHERE lost_in_battle = battle.id AND location = 'English Channel')
SELECT note FROM death WHERE INSTR(note, 'East') > 0
SELECT line_1, line_2 FROM addresses
SELECT line_1, line_2 FROM addresses
SELECT COUNT(*) FROM courses
SELECT SUM(1) FROM courses
SELECT course_description FROM courses WHERE course_id IN (SELECT course_id FROM sections WHERE section_name = 'math') LIMIT 1
SELECT c.course_description FROM courses c INNER JOIN sections s ON c.course_id = s.course_id WHERE s.section_name = 'math'
SELECT zip_postcode FROM addresses WHERE city = 'Port Chelsea' GROUP BY zip_postcode
SELECT MAX(zip_postcode) FROM addresses WHERE city = 'Port Chelsea'
SELECT department_id, department_name FROM departments WHERE department_id = (SELECT department_id FROM degree_programs GROUP BY department_id ORDER BY COUNT(*) DESC)
SELECT department_id, department_name FROM departments WHERE department_id IN (SELECT department_id FROM degree_programs GROUP BY department_id ORDER BY COUNT(degree_program_id) DESC LIMIT 1)
SELECT COUNT(*) FROM (SELECT department_id FROM degree_programs GROUP BY department_id) AS temp_table
SELECT COUNT(*) FROM (SELECT DISTINCT department_id FROM degree_programs) AS subquery
SELECT COUNT(degree_summary_name) FROM degree_programs GROUP BY degree_summary_name
SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs
SELECT COUNT(DISTINCT degree_program_id) FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering')
SELECT COUNT(DISTINCT degree_program_id) FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering')
SELECT section_name, section_description FROM sections
SELECT section_name, section_description FROM sections
SELECT course_id, course_name FROM courses WHERE course_id IN (SELECT course_id FROM sections GROUP BY course_id HAVING COUNT(section_id) <= 2)
SELECT course_name, course_id FROM courses WHERE course_id IN (SELECT course_id FROM sections GROUP BY course_id HAVING COUNT(*) < 2)
SELECT section_name FROM sections ORDER BY section_name DESC LIMIT 10
SELECT section_name FROM sections ORDER BY section_name DESC LIMIT 10
SELECT semester_id, semester_name FROM semesters WHERE semester_id = (SELECT semester_id FROM student_enrolment GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT s.semester_id, s.semester_name FROM semesters s INNER JOIN ( SELECT semester_id, COUNT(student_enrolment_id) AS enrolment_count FROM student_enrolment GROUP BY semester_id ORDER BY enrolment_count DESC LIMIT 1 ) AS max_enrol ON s.semester_id = max_enrol.semester_id
SELECT department_description FROM departments WHERE SUBSTR(department_name, 0, 8) = 'Computer'
SELECT department_description FROM departments WHERE department_name LIKE '%computer%'
SELECT first_name, middle_name, last_name, student_id FROM students WHERE student_id IN ( SELECT student_id FROM student_enrolment GROUP BY student_id, semester_id HAVING COUNT(DISTINCT degree_program_id) = 2 )
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM students s INNER JOIN student_enrolment se ON s.student_id = se.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT se.degree_program_id) = 2
SELECT first_name, middle_name, last_name FROM students WHERE student_id IN (SELECT student_id FROM student_enrolment WHERE degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'))
SELECT first_name, middle_name, last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE student_enrolment.degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelors')
SELECT degree_summary_name, MAX(num_students_enrolled) FROM (SELECT d.degree_summary_name, COUNT(s.student_id) as num_students_enrolled FROM degree_programs d, student_enrolment s WHERE d.degree_program_id = s.degree_program_id GROUP BY d.degree_summary_name) AS subquery
SELECT degree_summary_name FROM degree_programs JOIN (SELECT degree_program_id, COUNT(*) AS student_count FROM student_enrolment GROUP BY degree_program_id ORDER BY student_count DESC LIMIT 1) AS max_students ON degree_programs.degree_program_id = max_students.degree_program_id
SELECT degree_program_id, degree_summary_name FROM degree_programs WHERE degree_program_id = (SELECT degree_program_id FROM (SELECT degree_program_id, COUNT(*) as enrol_count FROM student_enrolment GROUP BY degree_program_id LIMIT 1 OFFSET (SELECT COUNT(*)/2 FROM (SELECT degree_program_id, COUNT(*) as enrol_count FROM student_enrolment GROUP BY degree_program_id))))
SELECT degree_program_id, degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id GROUP BY degree_program_id HAVING COUNT(student_id) = (SELECT MAX(student_count) FROM (SELECT degree_program_id, COUNT(student_id) AS student_count FROM student_enrolment GROUP BY degree_program_id))
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS number_of_enrollments FROM students s JOIN student_enrolment se ON s.student_id = se.student_id GROUP BY s.student_id ORDER BY number_of_enrollments DESC LIMIT 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, COUNT(*) AS enrolment_count FROM students s JOIN ( SELECT student_id, COUNT(*) AS enrolment_count FROM student_enrolment GROUP BY student_id ) sub ON s.student_id = sub.student_id ORDER BY enrolment_count DESC LIMIT 1
SELECT semester_name FROM semesters s WHERE NOT EXISTS (SELECT 1 FROM student_enrolment se WHERE se.semester_id = s.semester_id)
SELECT s.semester_name FROM semesters s LEFT JOIN student_enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL
SELECT DISTINCT course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM courses INNER JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM student_enrolment_courses JOIN courses ON student_enrolment_courses.course_id = courses.course_id GROUP BY course_name HAVING COUNT(*) = ( SELECT MAX(enroll_count) FROM ( SELECT course_id, COUNT(*) AS enroll_count FROM student_enrolment_courses GROUP BY course_id ) )
SELECT course_name FROM courses WHERE course_id = (SELECT course_id FROM (SELECT course_id, COUNT(*) as enrol_count FROM student_enrolment_courses GROUP BY course_id ORDER BY enrol_count DESC LIMIT 1))
SELECT last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id WHERE state_province_county = 'North Carolina' AND student_id NOT IN (SELECT student_id FROM student_enrolment WHERE degree_program_id IS NOT NULL)
SELECT s.last_name FROM students s JOIN addresses a ON s.permanent_address_id = a.address_id LEFT JOIN student_enrolment se ON s.student_id = se.student_id WHERE a.state_province_county = 'North Carolina' AND se.student_id IS NULL
SELECT transcript_date, transcript_id FROM transcripts WHERE transcript_id IN (SELECT transcript_id FROM student_enrolment_courses GROUP BY transcript_id HAVING COUNT(course_id) >= 2)
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id IN (SELECT transcript_id FROM student_enrolment_courses GROUP BY transcript_id HAVING COUNT(course_id) >= 2)
SELECT s.cell_mobile_number FROM students s WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward'
SELECT s.cell_mobile_number FROM students s WHERE s.first_name || ' ' || s.last_name = 'Timmothy Ward'
SELECT s.first_name, s.middle_name, s.last_name FROM students s JOIN student_enrolment se ON s.student_id = se.student_id ORDER BY se.date_first_registered LIMIT 1
SELECT MIN(first_name), MIN(middle_name), MIN(last_name) FROM students
SELECT first_name, middle_name, last_name FROM students ORDER BY date_left FETCH FIRST ROW ONLY
SELECT first_name, middle_name, last_name FROM students WHERE student_id = (SELECT student_id FROM student_enrolment WHERE semester_id = (SELECT MIN(semester_id) FROM student_enrolment) LIMIT 1)
SELECT first_name FROM students WHERE permanent_address_id IN (SELECT address_id FROM addresses) AND current_address_id IN (SELECT address_id FROM addresses) AND permanent_address_id <> current_address_id
SELECT first_name FROM students WHERE EXISTS (SELECT * FROM addresses AS permanent WHERE students.permanent_address_id = permanent.address_id AND NOT EXISTS (SELECT * FROM addresses AS current WHERE students.current_address_id = current.address_id AND permanent.address_id = current.address_id ) )
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM addresses a JOIN students s ON a.address_id = s.current_address_id GROUP BY a.address_id ORDER BY COUNT(s.student_id) DESC LIMIT 1
SELECT a.address_id, a.line_1, a.line_2 FROM addresses a INNER JOIN students s ON a.address_id = s.permanent_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(julianday(transcript_date)) FROM transcripts
SELECT AVG(strftime('%s', transcript_date)) FROM transcripts
SELECT transcript_date, other_details FROM transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_date AS earliest_release_date, other_details FROM transcripts WHERE transcript_date = (SELECT MIN(transcript_date) FROM transcripts)
SELECT COUNT(*) FROM transcripts
SELECT EXISTS (SELECT 1 FROM transcripts)
SELECT MAX(transcript_date) FROM transcripts
SELECT MAX(transcript_date) FROM transcripts
SELECT student_enrolment_courses.student_enrolment_id, COUNT(transcript_id) AS enrollment_count FROM student_enrolment_courses LEFT JOIN transcripts ON student_enrolment_courses.student_enrolment_id = transcripts.student_enrolment_id GROUP BY student_enrolment_courses.student_enrolment_id HAVING enrollment_count = (SELECT MAX(count) FROM (SELECT COUNT(transcript_id) AS count FROM student_enrolment_courses LEFT JOIN transcripts ON student_enrolment_courses.student_enrolment_id = transcripts.student_enrolment_id GROUP BY student_enrolment_courses.student_enrolment_id))
SELECT course_id, enrollment_id FROM student_enrolment_courses WHERE (course_id, student_enrolment_id) IN (SELECT course_id, student_enrolment_id FROM student_enrolment_courses GROUP BY course_id, student_enrolment_id HAVING COUNT(*) = (SELECT MAX(transcript_count) FROM (SELECT course_id, COUNT(*) as transcript_count FROM student_enrolment_courses GROUP BY course_id) as subquery))
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id = (SELECT transcript_id FROM transcript_contents GROUP BY transcript_id ORDER BY COUNT(*) LIMIT 1)
SELECT T.transcript_id, T.transcript_date FROM transcripts T JOIN (SELECT transcript_id, COUNT(*) as num_contents FROM transcript_contents GROUP BY transcript_id ORDER BY num_contents ASC LIMIT 1) TC ON T.transcript_id = TC.transcript_id
SELECT se.semester_name FROM student_enrolment se INNER JOIN degree_programs dp ON se.degree_program_id = dp.degree_program_id WHERE dp.degree_summary_name = 'Master' AND se.semester_id IN (SELECT semester_id FROM student_enrolment WHERE degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'))
SELECT semester_id FROM student_enrolment WHERE degree_program_id = 'Masters' INTERSECT SELECT semester_id FROM student_enrolment WHERE degree_program_id = 'Bachelors'
SELECT COUNT(DISTINCT a.address_id) FROM students s JOIN addresses a ON s.current_address_id = a.address_id
SELECT DISTINCT line_1, line_2, line_3 FROM addresses JOIN students ON addresses.address_id = students.current_address_id OR addresses.address_id = students.permanent_address_id
SELECT last_name, first_name, middle_name FROM students ORDER BY last_name DESC
SELECT last_name, first_name, middle_name FROM students ORDER BY last_name DESC
SELECT section_name FROM sections WHERE section_id = 'h' ORDER BY section_name
SELECT section_description FROM sections WHERE section_name = 'h' AND rowid = (SELECT MIN(rowid) FROM sections WHERE section_name = 'h')
SELECT first_name FROM students WHERE permanent_address_id = (SELECT address_id FROM addresses WHERE country = 'Haiti') AND cell_mobile_number = '09700166582'
SELECT first_name FROM students WHERE permanent_address_id IN (SELECT address_id FROM addresses WHERE country = 'Haiti') AND cell_mobile_number = '09700166582'
SELECT DISTINCT title FROM cartoon ORDER BY title
SELECT title FROM cartoon ORDER BY title COLLATE BINARY
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT DISTINCT(title) FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT COUNT(1) FROM cartoon WHERE written_by = 'Joseph Kuhr'
SELECT (SELECT COUNT(*) FROM cartoon WHERE written_by = 'Joseph Kuhr') AS num_cartoons
SELECT title, directed_by FROM cartoon ORDER BY original_air_date
SELECT title, directed_by FROM cartoon ORDER BY original_air_date
SELECT title FROM cartoon WHERE directed_by LIKE '%Ben Jones%' OR directed_by LIKE '%Brandon Vietti%'
SELECT title FROM cartoon WHERE directed_by IN ('Ben Jones', 'Brandon Vietti')
SELECT T.country, MAX(T.channel_count) AS num_channels FROM (SELECT country, COUNT(*) AS channel_count FROM tv_channel GROUP BY country) AS T
SELECT country, num_channels FROM (SELECT country, COUNT(*) as num_channels FROM tv_channel GROUP BY country ORDER BY num_channels DESC LIMIT 1)
SELECT COUNT(DISTINCT series_name) AS num_series, COUNT(DISTINCT content) AS num_content FROM tv_channel
SELECT COUNT(DISTINCT series_name) + (SELECT COUNT(DISTINCT content) FROM tv_channel) AS total_series_and_content FROM tv_channel
SELECT DISTINCT content FROM tv_channel WHERE series_name = 'Sky Radio' AND country = 'USA'
SELECT c.content FROM tv_channel c, tv_series s WHERE c.id = s.channel AND c.series_name = 'Sky Radio'
SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio' UNION ALL SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio'
SELECT DISTINCT package_option FROM tv_channel, tv_series, cartoon WHERE tv_channel.id = tv_series.channel AND tv_channel.id = cartoon.channel AND (tv_series.series_name = 'Sky Radio' OR cartoon.series_name = 'Sky Radio')
SELECT language, COUNT(*) FROM tv_channel WHERE language = 'English'
SELECT COUNT(DISTINCT id) FROM tv_channel WHERE language = 'English'
SELECT language, MIN(channel_count) AS num_channels FROM ( SELECT language, COUNT(*) AS channel_count FROM tv_channel GROUP BY language )
SELECT language, MIN(channel_count) as min_channels FROM (SELECT language, COUNT(id) as channel_count FROM tv_channel GROUP BY language)
SELECT language, COUNT(language) AS num_channels FROM tv_channel GROUP BY language
SELECT language, COUNT(id) AS num_channels FROM tv_channel GROUP BY language
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE title = 'The Rise of the Blue Beetle!')
SELECT series_name FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id JOIN tv_series ON tv_series.channel = tv_channel.id WHERE cartoon.title = 'The Rise of the Blue Beetle!' GROUP BY series_name
SELECT title FROM cartoon WHERE channel = (SELECT id FROM tv_channel WHERE series_name = 'Sky Radio') AND id IN (SELECT channel FROM tv_series WHERE channel = (SELECT id FROM tv_channel WHERE series_name = 'Sky Radio'))
SELECT title FROM cartoon c WHERE EXISTS (SELECT 1 FROM tv_channel tc WHERE c.channel = tc.id AND tc.series_name = 'Sky Radio')
SELECT episode FROM tv_series ORDER BY rating
SELECT episode FROM tv_series ORDER BY rating
SELECT episode, rating FROM tv_series WHERE rating IN (SELECT DISTINCT rating FROM tv_series ORDER BY rating DESC LIMIT 3)
SELECT episode, rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT MIN(share) FROM tv_series
SELECT TOP 1 MAX(share) AS max_share FROM tv_series
SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime' INTERSECT SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT DISTINCT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT weekly_rank FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT weekly_rank FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT series_name FROM tv_channel WHERE id IN (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime')
SELECT series_name FROM tv_channel INNER JOIN tv_series ON tv_series.channel = tv_channel.id WHERE episode = 'A Love of a Lifetime'
SELECT episode FROM tv_series, tv_channel WHERE tv_series.channel = tv_channel.id AND tv_channel.series_name = 'Sky Radio'
SELECT episode FROM tv_series INNER JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE series_name = 'Sky Radio'
SELECT directed_by, COUNT(*) AS cartoon_count FROM cartoon GROUP BY directed_by
SELECT directed_by, COUNT(*) AS cartoon_count FROM cartoon GROUP BY directed_by
SELECT production_code, channel FROM cartoon WHERE air_date = (SELECT MAX(air_date) FROM cartoon)
SELECT production_code, channel FROM cartoon WHERE air_date = (SELECT MAX(air_date) FROM tv_series INNER JOIN cartoon ON cartoon.channel = tv_series.channel)
SELECT package_option, series_name FROM tv_channel WHERE hight_definition_tv = 'Yes'
SELECT package_option, series_name FROM tv_channel WHERE hight_definition_tv = 'Yes'
SELECT c.country FROM tv_channel c, cartoon ca WHERE c.id = ca.channel AND ca.written_by = 'Todd Casey'
SELECT DISTINCT t.country FROM tv_channel t INNER JOIN cartoon c ON t.id = c.channel WHERE c.written_by = 'Todd Casey'
SELECT DISTINCT t.country FROM tv_channel t WHERE NOT EXISTS ( SELECT 1 FROM cartoon c WHERE c.channel = t.id AND c.written_by = 'Todd Casey' )
SELECT c.country FROM tv_channel c WHERE NOT EXISTS (SELECT 1 FROM cartoon WHERE written_by = 'Todd Casey' AND channel = c.id)
SELECT series_name, country FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones' OR directed_by = 'Michael Chang')
SELECT series_name, country FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones') INTERSECT SELECT series_name, country FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE directed_by = 'Michael Chang')
SELECT pixel_aspect_ratio_par, country FROM tv_channel WHERE language <> 'English' GROUP BY pixel_aspect_ratio_par, country
SELECT pixel_aspect_ratio_par, country FROM tv_channel WHERE language <> 'English' AND id NOT IN (SELECT channel FROM tv_series WHERE channel IS NOT NULL) AND id NOT IN (SELECT channel FROM cartoon WHERE channel IS NOT NULL)
SELECT id FROM tv_channel WHERE country IN (SELECT country FROM tv_channel GROUP BY country HAVING COUNT(DISTINCT id) > 2)
SELECT id FROM tv_channel WHERE id IN ( SELECT channel FROM ( SELECT channel, COUNT(*) AS num_series FROM tv_series GROUP BY channel HAVING num_series > 2 ) )
SELECT id FROM tv_channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones') AND id NOT IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones')
SELECT c.id FROM tv_channel c LEFT JOIN cartoon ca ON c.id = ca.channel WHERE ca.directed_by != 'Ben Jones' OR ca.directed_by IS NULL
SELECT DISTINCT c.package_option FROM tv_channel c LEFT JOIN cartoon t ON c.id = t.channel WHERE t.directed_by != 'Ben Jones' OR t.directed_by IS NULL
SELECT package_option FROM tv_channel WHERE NOT EXISTS (SELECT * FROM cartoon WHERE tv_channel.id = cartoon.channel AND directed_by = 'Ben Jones')
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) AS player_count FROM poker_player
SELECT max(earnings) AS max_earnings FROM poker_player
SELECT earnings FROM poker_player ORDER BY earnings DESC LIMIT 10
SELECT final_table_made, best_finish FROM poker_player
SELECT final_table_made, best_finish FROM poker_player
SELECT AVG(earnings) FROM poker_player GROUP BY earnings
SELECT CAST(AVG(earnings) AS DECIMAL(10,2)) AS average_earnings FROM poker_player
SELECT money_rank FROM poker_player WHERE ROWID = (SELECT ROWID FROM poker_player ORDER BY earnings DESC LIMIT 1)
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT MAX(final_table_made) AS max_final_tables FROM poker_player WHERE earnings < 200000
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000
SELECT name FROM people
SELECT name FROM poker_player pp, people p WHERE pp.people_id = p.people_id
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player WHERE earnings > 300000)
SELECT name FROM people, poker_player WHERE people.people_id = poker_player.people_id AND poker_player.earnings > 300000
SELECT name FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY final_table_made ASC
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player ORDER BY final_table_made)
SELECT birth_date FROM people p, poker_player pp WHERE p.people_id = pp.people_id AND pp.earnings = (SELECT MIN(earnings) FROM poker_player)
SELECT p.birth_date FROM people p, poker_player pp WHERE p.people_id = pp.people_id AND pp.earnings = (SELECT MIN(earnings) FROM poker_player)
SELECT money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY height DESC LIMIT 1
SELECT money_rank FROM poker_player WHERE people_id = (SELECT MAX(people_id) FROM people)
SELECT AVG(earnings) FROM poker_player WHERE EXISTS (SELECT * FROM people WHERE poker_player.people_id = people.people_id AND height > 200)
SELECT AVG(earnings) FROM poker_player WHERE people_id IN (SELECT people_id FROM people WHERE height > 200) LIMIT 1
SELECT p.name FROM people p, poker_player pp WHERE p.people_id = pp.people_id ORDER BY pp.earnings DESC
SELECT name FROM people WHERE people_id IN (SELECT people_id FROM poker_player ORDER BY earnings DESC)
SELECT nationality, COUNT(people_id) AS number_of_people FROM people GROUP BY nationality ORDER BY nationality
SELECT nationality, COUNT(people_id) AS people_count FROM people GROUP BY nationality
SELECT nationality, COUNT(*) as count FROM people GROUP BY nationality ORDER BY count DESC LIMIT 1
SELECT DISTINCT nationality FROM people WHERE people_id IN (SELECT people_id FROM poker_player) ORDER BY people_id
SELECT DISTINCT nationality FROM people AS p1 WHERE EXISTS (SELECT 1 FROM people AS p2 WHERE p1.nationality = p2.nationality AND p1.people_id <> p2.people_id)
SELECT * FROM (SELECT nationality FROM people GROUP BY nationality HAVING COUNT(*) >= 2) subquery
SELECT name, birth_date FROM people ORDER BY name COLLATE BINARY
SELECT name, birth_date FROM people ORDER BY name COLLATE BINARY
SELECT p.name FROM people p WHERE p.nationality <> 'Russia'
SELECT name FROM people EXCEPT SELECT name FROM people WHERE nationality = 'Russia'
SELECT p.name FROM people p LEFT JOIN poker_player pp ON p.people_id = pp.people_id WHERE pp.people_id IS NULL
SELECT name FROM people LEFT JOIN poker_player ON people.people_id = poker_player.people_id WHERE poker_player.people_id IS NULL
SELECT COUNT(*) AS distinct_nationalities FROM (SELECT nationality FROM people GROUP BY nationality)
SELECT COUNT(DISTINCT nationality) AS count_of_nationalities FROM people
SELECT COUNT(state) AS state_count FROM area_code_state
SELECT contestant_number, contestant_name FROM contestants ORDER BY contestant_name DESC
SELECT vote_id, phone_number, state FROM votes LIMIT 100
SELECT MAX(area_code) FROM area_code_state
SELECT MAX(created) AS last_date FROM votes WHERE state = 'CA' ORDER BY created DESC
SELECT C.contestant_name FROM contestants C LEFT JOIN votes V ON C.contestant_number = V.contestant_number WHERE C.contestant_name <> 'Jessie Alloway' AND V.contestant_number IS NOT NULL
SELECT state, created FROM votes
SELECT contestant_number, contestant_name FROM contestants c WHERE (SELECT COUNT(*) FROM votes WHERE contestant_number = c.contestant_number) >= 2
SELECT c.contestant_number, c.contestant_name FROM contestants c JOIN votes v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name ORDER BY COUNT(v.vote_id) LIMIT 1
SELECT COUNT(*) FROM votes WHERE state = 'NY' LIMIT 1 UNION SELECT COUNT(*) FROM votes WHERE state = 'CA' LIMIT 1
SELECT COUNT(c.contestant_number) FROM contestants c LEFT JOIN votes v ON c.contestant_number = v.contestant_number WHERE v.contestant_number IS NULL
SELECT area_code_state.area_code FROM area_code_state WHERE state = (SELECT state FROM votes GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1)
SELECT created, state, phone_number FROM votes JOIN contestants USING (contestant_number) JOIN area_code_state USING (state) WHERE contestant_name = 'Tabatha Gehling'
SELECT a.area_code FROM area_code_state a JOIN votes v ON a.state = v.state JOIN contestants c ON v.contestant_number = c.contestant_number WHERE c.contestant_name = 'Tabatha Gehling' AND EXISTS (SELECT 1 FROM votes v2 JOIN contestants c2 ON v2.contestant_number = c2.contestant_number WHERE c2.contestant_name = 'Kelly Clauss' AND v2.state = a.state)
SELECT contestant_name FROM contestants WHERE contestant_name REGEXP 'Al'
SELECT name FROM country WHERE indepyear > 1950
SELECT name FROM country WHERE indepyear > 1950 AND code IN (SELECT countrycode FROM city)
SELECT COUNT(DISTINCT code) FROM country WHERE governmentform = 'Republic'
SELECT COUNT(DISTINCT code) FROM country WHERE governmentform = 'Republic'
SELECT SUM(surfacearea) AS "Total Surface Area" FROM country WHERE region = 'Caribbean'
SELECT SUM(surfacearea) FROM country WHERE region = 'Carribean'
SELECT continent FROM country WHERE name = 'Anguilla' GROUP BY continent
SELECT c.continent FROM country c, city ct WHERE c.code = ct.countrycode AND ct.name = 'Anguilla'
SELECT region FROM country WHERE code IN (SELECT countrycode FROM city WHERE name = 'Kabul')
SELECT c.region FROM city ci, country c WHERE ci.countrycode = c.code AND ci.name = 'Kabul'
SELECT language FROM countrylanguage WHERE countrycode IN ( SELECT code FROM country WHERE name = 'Aruba' ) AND percentage = ( SELECT MAX(percentage) FROM countrylanguage WHERE countrycode IN ( SELECT code FROM country WHERE name = 'Aruba' ) )
SELECT language FROM countrylanguage WHERE countrycode = 'ABW' AND isofficial = 'T'
SELECT population, lifeexpectancy FROM country WHERE code = (SELECT countrycode FROM city WHERE name = 'Brazil')
SELECT c.population, c.lifeexpectancy FROM country c, city ct WHERE c.code = ct.countrycode AND ct.name = 'Brazil'
SELECT region, MAX(population) AS population FROM country WHERE name = 'Angola' GROUP BY region
SELECT c.region, c.population FROM country c WHERE c.name = 'Angola'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa' ORDER BY AVG(lifeexpectancy) DESC LIMIT 1
SELECT AVG(lifeexpectancy) AS average_life_expectancy FROM country WHERE region = 'Central Africa'
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia')
SELECT (SELECT SUM(population) FROM country WHERE continent = 'Asia') + (SELECT MAX(gnp) FROM country WHERE continent = 'Asia')
SELECT SUM(c.population) FROM (SELECT population FROM country WHERE continent = 'Asia') c
SELECT AVG(lifeexpectancy) FROM country WHERE continent = 'Africa' AND governmentform = 'Republic' ORDER BY lifeexpectancy DESC LIMIT 1
SELECT AVG(lifeexpectancy) as average_life_expectancy FROM country WHERE continent = 'Africa' AND code IN (SELECT countrycode FROM countrylanguage WHERE isofficial = 'T')
SELECT SUM(surfacearea) AS total_surface_area FROM country WHERE continent IN ('Asia', 'Europe')
SELECT SUM(surfacearea) as total_surface_area FROM (SELECT surfacearea FROM country WHERE continent = 'Asia' UNION SELECT surfacearea FROM country WHERE continent = 'Europe')
SELECT SUM(population) AS total_population FROM city WHERE district = 'Gelderland'
SELECT SUM(c.population) FROM city c WHERE c.district = 'Gelderland'
SELECT AVG(gnp), SUM(population) FROM country WHERE governmentform = 'US Territory' GROUP BY governmentform
SELECT AVG(gnp) AS mean_gnp, (SELECT SUM(population) FROM city WHERE countrycode IN (SELECT countrycode FROM countrylanguage WHERE countrycode = country.code)) AS total_population FROM country WHERE region LIKE 'US%'
SELECT COUNT(language) FROM (SELECT DISTINCT language FROM countrylanguage) AS unique_languages_count
SELECT COUNT(*) FROM (SELECT DISTINCT language FROM countrylanguage) as temp_table
SELECT COUNT(DISTINCT governmentform) AS government_types FROM country WHERE continent = 'Africa'
SELECT COUNT(*) AS num_forms FROM country WHERE continent = 'Africa'
SELECT COUNT(*) FROM (SELECT DISTINCT language FROM countrylanguage WHERE countrycode = 'ABW')
SELECT COUNT(*) FROM (SELECT language FROM countrylanguage WHERE countrycode = 'ABW' GROUP BY language)
SELECT COUNT(isofficial) FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT COUNT(language) AS official_languages FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT name FROM country WHERE code = (SELECT countrycode FROM countrylanguage GROUP BY countrycode HAVING COUNT(language) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language) AS lang_count FROM countrylanguage GROUP BY countrycode)))
SELECT name FROM country WHERE code = ( SELECT code FROM countrylanguage GROUP BY countrycode HAVING COUNT(language) = ( SELECT MAX(lang_count) FROM ( SELECT COUNT(language) AS lang_count FROM countrylanguage GROUP BY countrycode ) ) )
SELECT continent FROM countrylanguage GROUP BY continent ORDER BY COUNT(DISTINCT language) DESC LIMIT 1
SELECT continent FROM ( SELECT co.continent, COUNT(DISTINCT cl.language) AS lang_count FROM countrylanguage cl INNER JOIN country co ON co.code = cl.countrycode GROUP BY co.continent ORDER BY lang_count DESC ) LIMIT 1
SELECT COUNT(*) FROM ( SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T' ) INTERSECT SELECT COUNT(*) FROM ( SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' )
SELECT COUNT(*) FROM (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' INTERSECT SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND name IN (SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T'))
SELECT name FROM country WHERE name IN (SELECT name FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE language = 'English') AND name IN (SELECT name FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE language = 'French')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND code IN (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T' INTERSECT SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T')
SELECT COUNT(DISTINCT c.continent) FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language = 'Chinese'
SELECT COUNT(DISTINCT c.continent) FROM country c WHERE (SELECT COUNT(*) FROM countrylanguage cl WHERE c.code = cl.countrycode AND cl.language = 'Chinese') = (SELECT COUNT(DISTINCT cl.countrycode) FROM countrylanguage cl WHERE cl.language = 'Chinese')
SELECT region FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English') OR code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch')
SELECT region FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' OR language = 'English') GROUP BY region
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE (language = 'English' OR language = 'Dutch') AND isofficial = 'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T' UNION SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')
SELECT language FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia') AND percentage = (SELECT MAX(percentage) FROM countrylanguage)
SELECT language FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia') GROUP BY language HAVING COUNT(countrycode) = (SELECT MAX(langcount) FROM (SELECT COUNT(countrycode) AS langcount FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia') GROUP BY language))
SELECT DISTINCT cl.language FROM countrylanguage cl JOIN country c ON cl.countrycode = c.code WHERE c.governmentform = 'Republic' AND NOT EXISTS (SELECT 1 FROM countrylanguage cl2 WHERE cl2.language = cl.language AND cl2.countrycode <> cl.countrycode)
SELECT language FROM countrylanguage WHERE language IN (SELECT language FROM countrylanguage WHERE isofficial = 'T' GROUP BY language HAVING COUNT(*) = 1) AND countrycode IN (SELECT code FROM country WHERE governmentform = 'Republic')
SELECT name FROM city WHERE countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND population = (SELECT MAX(population) FROM (SELECT population FROM city WHERE countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')))
SELECT name FROM city WHERE countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'English') ORDER BY population DESC LIMIT 1
SELECT name, population, lifeexpectancy FROM country WHERE continent = 'Asia' AND surfacearea = (SELECT MAX(surfacearea) FROM country WHERE continent = 'Asia') LIMIT 1
SELECT c.name, c.population, c.lifeexpectancy FROM country c LEFT JOIN ( SELECT continent, MAX(population) as max_pop FROM country WHERE continent = 'Asia' GROUP BY continent ) s ON c.continent = s.continent AND c.population = s.max_pop WHERE c.continent = 'Asia'
SELECT AVG(clife.lifeexpectancy) FROM (SELECT c.lifeexpectancy FROM country c WHERE c.code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')) clife
SELECT AVG(lifeexpectancy) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'N')
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.isofficial = 'F' OR cl.isofficial IS NULL
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' OR cl.language IS NULL
SELECT language FROM countrylanguage WHERE isofficial = 'T' AND countrycode IN (SELECT code FROM country WHERE headofstate = 'Beatrix')
SELECT language FROM countrylanguage cl JOIN country c ON cl.countrycode = c.code WHERE c.headofstate = 'Beatrix' AND cl.isofficial = 'T' LIMIT 1
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE indepyear < 1930) AND isofficial = 'T'
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE indepyear < 1930) AND isofficial = 1
SELECT name FROM country WHERE surfacearea > ALL (SELECT surfacearea FROM country WHERE continent = 'Europe')
SELECT name FROM country WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')
SELECT c1.name FROM country c1, (SELECT MIN(population) AS min_pop FROM country WHERE continent = 'Asia') AS min_pop WHERE c1.continent = 'Africa' AND c1.population < min_pop.min_pop
SELECT c1.name FROM country c1 WHERE c1.continent = 'Africa' AND (SELECT COUNT(*) FROM country c2 WHERE c2.continent = 'Asia' AND c2.population <= c1.population) = 0
SELECT name FROM country WHERE continent = 'Asia' AND NOT EXISTS (SELECT * FROM country WHERE continent = 'Africa' AND population >= country.population)
SELECT c1.name FROM country c1 JOIN country c2 ON c1.continent = 'Asia' AND c2.continent = 'Africa' AND c1.population > c2.population
SELECT code FROM country WHERE NOT EXISTS (SELECT 1 FROM countrylanguage WHERE countrylanguage.countrycode = country.code AND language = 'English') AND code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT c.code FROM country c WHERE NOT EXISTS (SELECT * FROM countrylanguage cl WHERE c.code = cl.countrycode AND cl.language = 'English') AND c.code IN (SELECT countrycode FROM countrylanguage)
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' OR cl.language IS NULL
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language != 'English' OR cl.language IS NULL
SELECT code FROM country WHERE (code, governmentform) NOT IN (SELECT countrycode, 'Republic' FROM countrylanguage WHERE language = 'English')
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND governmentform <> 'Republic'
SELECT city.name FROM city, country WHERE city.countrycode = country.code AND country.continent = 'Europe' AND city.countrycode NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe') AND countrycode IN (SELECT countrycode FROM countrylanguage WHERE language <> 'English' AND isofficial = 'F')
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia') AND countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'Chinese' AND isofficial = 'T') GROUP BY name
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Asia' AND code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Chinese' AND isofficial = 'T'))
SELECT name, indepyear, surfacearea FROM country WHERE population = (SELECT MIN(population) FROM country) ORDER BY population LIMIT 1
SELECT name, indepyear, surfacearea FROM country WHERE population = (SELECT MIN(population) FROM country) AND surfacearea = (SELECT MIN(surfacearea) FROM country)
SELECT c.population, c.name, c.headofstate FROM country AS c WHERE surfacearea = (SELECT MAX(surfacearea) FROM country)
SELECT name, population, headofstate FROM country ORDER BY surfacearea DESC LIMIT 1
SELECT c.name AS country, (SELECT COUNT(DISTINCT language) FROM countrylanguage cl WHERE cl.countrycode = c.code) AS num_languages FROM country c WHERE (SELECT COUNT(DISTINCT language) FROM countrylanguage cl WHERE cl.countrycode = c.code) >= 3
SELECT country.name, (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrylanguage.countrycode = country.code) AS language_count FROM country WHERE (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrylanguage.countrycode = country.code) > 2
SELECT c.district, COUNT(c.id) FROM city c JOIN (SELECT district, AVG(population) AS avg_population FROM city GROUP BY district) a ON c.district = a.district WHERE c.population > a.avg_population GROUP BY c.district
SELECT district, COUNT(name) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district ORDER BY COUNT(name) DESC
SELECT governmentform, (SELECT SUM(population) FROM country c WHERE c.governmentform = country.governmentform) AS total_population FROM country GROUP BY governmentform HAVING AVG(lifeexpectancy) > 72
SELECT governmentform, total_population FROM (SELECT governmentform, SUM(population) AS total_population FROM country GROUP BY governmentform HAVING AVG(lifeexpectancy) > 72) ORDER BY total_population DESC
SELECT c.continent, AVG(c.lifeexpectancy) AS avg_life_expectancy, SUM(c.population) AS total_population FROM country c WHERE c.lifeexpectancy < 72 GROUP BY c.continent
SELECT continent, SUM(population) AS total_population, AVG(lifeexpectancy) AS average_life_expectancy FROM country GROUP BY continent HAVING AVG(lifeexpectancy) < 72 ORDER BY average_life_expectancy
SELECT name, surfacearea FROM country WHERE surfacearea >= ALL (SELECT surfacearea FROM country)
SELECT name, surfacearea FROM country WHERE code IN (SELECT countrycode FROM countrylanguage GROUP BY countrycode ORDER BY SUM(percentage) DESC LIMIT 5)
SELECT name FROM country WHERE population IN (SELECT DISTINCT population FROM country ORDER BY population DESC LIMIT 3)
SELECT name FROM country WHERE population >= ALL (SELECT population FROM country ORDER BY population DESC LIMIT 3)
SELECT name FROM country WHERE population IN (SELECT population FROM country ORDER BY population LIMIT 3)
SELECT name FROM country WHERE population <= ANY (SELECT population FROM country ORDER BY population LIMIT 3)
SELECT COUNT(DISTINCT code) FROM country WHERE continent = 'Asia'
SELECT COUNT(code) AS num_countries FROM country WHERE continent = 'Asia'
SELECT name FROM country WHERE continent = 'Europe' AND population = 80000
SELECT name FROM country WHERE continent = 'Europe' AND population = 80000 AND code IN (SELECT countrycode FROM city WHERE population = 80000)
SELECT SUM(population), AVG(surfacearea) FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT TOTAL(population), AVERAGE(surfacearea) FROM country WHERE continent = 'North America' AND surfacearea > 3000 GROUP BY continent
SELECT name FROM city WHERE population >= 160000 AND population <= 900000 AND population NOT NULL
SELECT name FROM city WHERE population >= 160000 AND population <= 900000 ORDER BY population
SELECT language FROM countrylanguage WHERE countrycode IN (SELECT countrycode FROM countrylanguage GROUP BY countrycode HAVING COUNT(DISTINCT language) = (SELECT MAX(cnt) FROM (SELECT countrycode, COUNT(DISTINCT language) AS cnt FROM countrylanguage GROUP BY countrycode)))
SELECT language FROM (SELECT language, COUNT(DISTINCT countrycode) as num_countries FROM countrylanguage GROUP BY language) as subquery WHERE num_countries = (SELECT MAX(num_countries) FROM (SELECT language, COUNT(DISTINCT countrycode) as num_countries FROM countrylanguage GROUP BY language))
SELECT c.name, cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = c.code)
SELECT c.code, cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE (cl.countrycode, cl.percentage) IN (SELECT countrycode, MAX(percentage) FROM countrylanguage GROUP BY countrycode)
SELECT COUNT(DISTINCT cl.countrycode) FROM countrylanguage cl WHERE language = 'Spanish' AND NOT EXISTS (SELECT * FROM countrylanguage cl2 WHERE cl2.language = 'Spanish' AND cl2.percentage > cl.percentage)
SELECT COUNT(*) FROM country WHERE EXISTS (SELECT 1 FROM countrylanguage WHERE country.code = countrylanguage.countrycode AND language = 'Spanish' AND isofficial = 'T')
SELECT country.code FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Spanish' ORDER BY percentage DESC LIMIT 1)
SELECT cl.code FROM countrylanguage cl WHERE cl.language = 'Spanish' AND cl.isofficial = 'T' AND NOT EXISTS (SELECT * FROM countrylanguage cl2 WHERE cl2.language = 'Spanish' AND cl2.isofficial = 'T' AND cl2.percentage > cl.percentage)
SELECT COUNT(conductor_id) FROM conductor
SELECT COUNT(nationality) FROM conductor
SELECT name FROM conductor ORDER BY age ASC
SELECT name FROM conductor ORDER BY age DESC
SELECT name FROM conductor WHERE nationality <> ALL (SELECT 'USA' FROM conductor)
SELECT c.name FROM conductor c LEFT JOIN orchestra o ON c.conductor_id = o.conductor_id WHERE c.nationality != 'USA'
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT SUM(attendance) * 1.0 / COUNT(*) FROM show
SELECT AVG(attendance * 1.0) FROM show
SELECT MAX(share) AS max_share FROM performance WHERE type <> 'Live final'
SELECT MAX(share), MIN(share) FROM performance WHERE type != 'Live final'
SELECT COUNT(DISTINCT nationality) AS num_of_nationalities FROM conductor
SELECT COUNT(DISTINCT nationality) AS num_of_nationalities FROM conductor
SELECT name FROM conductor ORDER BY age DESC
SELECT name FROM conductor ORDER BY year_of_work DESC OFFSET 0 LIMIT 10
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1 OFFSET 0
SELECT name, MAX(year_of_work) FROM conductor
SELECT c.name, o.orchestra FROM conductor c, orchestra o WHERE c.conductor_id = o.conductor_id
SELECT c.name, o.orchestra FROM conductor c INNER JOIN orchestra o ON c.conductor_id = o.conductor_id
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra GROUP BY conductor_id HAVING COUNT(DISTINCT orchestra) > 1)
SELECT c.name FROM conductor c JOIN ( SELECT conductor_id FROM orchestra GROUP BY conductor_id HAVING COUNT(DISTINCT orchestra) > 1 ) sub ON c.conductor_id = sub.conductor_id
SELECT name FROM conductor GROUP BY conductor_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.name FROM conductor c JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.name ORDER BY COUNT(DISTINCT o.orchestra_id) DESC LIMIT 1
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008)
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008) GROUP BY name
SELECT o.record_company, COUNT(*) AS orchestra_count FROM orchestra o GROUP BY o.record_company
SELECT o.record_company, COUNT(DISTINCT o.orchestra_id) as num_orchestras FROM orchestra o GROUP BY o.record_company
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) ASC
SELECT major_record_format, COUNT(*) AS frequency FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) DESC
SELECT record_company FROM orchestra WHERE orchestra_id IN ( SELECT orchestra_id FROM orchestra GROUP BY orchestra_id ORDER BY COUNT(orchestra_id) DESC LIMIT 1 )
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(DISTINCT orchestra_id) DESC, record_company LIMIT 1
SELECT orchestra FROM orchestra WHERE orchestra_id NOT IN (SELECT DISTINCT orchestra_id FROM performance)
SELECT orchestra FROM orchestra WHERE NOT EXISTS (SELECT 1 FROM performance WHERE performance.orchestra_id = orchestra.orchestra_id) GROUP BY orchestra
SELECT DISTINCT o1.record_company FROM orchestra o1, orchestra o2 WHERE o1.record_company = o2.record_company AND o1.year_of_founded < 2003 AND o2.year_of_founded > 2003
SELECT record_company FROM orchestra WHERE year_of_founded < 2003 AND record_company IN (SELECT record_company FROM orchestra WHERE year_of_founded > 2003)
SELECT COUNT(DISTINCT orchestra) FROM orchestra WHERE major_record_format = 'CD' OR major_record_format = 'DVD'
SELECT COUNT(*) FROM orchestra GROUP BY major_record_format
SELECT year_of_founded FROM orchestra WHERE orchestra_id IN ( SELECT orchestra_id FROM performance GROUP BY orchestra_id HAVING SUM(official_ratings_(millions)) > 1 )
SELECT orchestra, year_of_founded FROM orchestra INNER JOIN ( SELECT orchestra_id FROM performance GROUP BY orchestra_id HAVING COUNT(*) > 1 ) p ON orchestra.orchestra_id = p.orchestra_id
SELECT COUNT(*) FROM highschooler
SELECT MAX(id) - MIN(id) + 1 FROM highschooler
SELECT name, grade FROM highschooler
SELECT name, grade FROM highschooler
SELECT * FROM highschooler
SELECT grade FROM highschooler
SELECT DISTINCT grade FROM highschooler WHERE name = 'Kyle'
SELECT grade FROM highschooler WHERE name = 'Kyle' GROUP BY grade
SELECT name FROM highschooler WHERE grade = 10
SELECT name FROM highschooler WHERE grade IN (10)
SELECT id FROM highschooler WHERE name = 'Kyle' AND grade = '12'
SELECT id FROM highschooler WHERE name = 'Kyle'
SELECT COUNT(*) FROM highschooler WHERE grade IN (9, 10)
SELECT COUNT(*) AS total_count FROM highschooler WHERE grade <= 10
SELECT grade, COUNT(id) AS number_of_students FROM highschooler GROUP BY grade
SELECT grade, COUNT(id) as count FROM highschooler GROUP BY grade
SELECT MAX(grade) FROM (SELECT grade, COUNT(*) as num_highschoolers FROM highschooler GROUP BY grade)
SELECT grade, COUNT(*) as num_students FROM highschooler GROUP BY grade ORDER BY num_students DESC LIMIT 1
SELECT grade FROM (SELECT grade, COUNT(id) as student_count FROM highschooler GROUP BY grade) WHERE student_count >= 4
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(id) >= 4
SELECT h.id AS student_id, (SELECT COUNT(*) FROM friend WHERE friend_id = h.id) AS num_of_friends FROM highschooler h
SELECT h.id, COUNT(f.friend_id) AS num_friends FROM highschooler h LEFT JOIN friend f ON h.id = f.student_id GROUP BY h.id
SELECT h.name, (SELECT COUNT(student_id) FROM friend WHERE friend_id = h.id) AS num_of_friends FROM highschooler h
SELECT highschooler.name, (SELECT COUNT(*) FROM friend WHERE friend.student_id = highschooler.id) AS friend_count FROM highschooler
SELECT h.name FROM highschooler h INNER JOIN friend f ON h.id = f.student_id GROUP BY h.id ORDER BY COUNT(f.friend_id) DESC LIMIT 1
SELECT name FROM highschooler WHERE id = (SELECT friend_id FROM friend GROUP BY friend_id HAVING COUNT(student_id) = (SELECT MAX(cnt) FROM (SELECT friend_id, COUNT(student_id) as cnt FROM friend GROUP BY friend_id)))
SELECT h.name FROM highschooler h INNER JOIN (SELECT student_id, COUNT(friend_id) as num_friends FROM friend GROUP BY student_id HAVING num_friends >= 3) f ON h.id = f.student_id
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(friend_id) AS friend_count FROM friend GROUP BY student_id) f ON h.id = f.student_id WHERE f.friend_count >= 3
SELECT highschooler.name FROM highschooler JOIN friend ON friend.friend_id = highschooler.id WHERE friend.student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT h2.name FROM highschooler h1 JOIN friend ON h1.id = friend.student_id JOIN highschooler h2 ON friend.friend_id = h2.id WHERE h1.name = 'Kyle' AND h2.id IN (SELECT friend_id FROM friend WHERE student_id = h1.id)
SELECT COUNT(*) FROM friend f, highschooler h WHERE (f.student_id = h.id OR f.friend_id = h.id) AND h.name = 'Kyle'
SELECT COUNT(*) FROM friend WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle') UNION SELECT COUNT(*) FROM friend WHERE friend_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT highschooler.id FROM highschooler LEFT JOIN friend ON highschooler.id = friend.student_id OR highschooler.id = friend.friend_id WHERE friend.student_id IS NULL
SELECT id FROM highschooler WHERE NOT EXISTS (SELECT * FROM friend WHERE friend.student_id = highschooler.id) AND NOT EXISTS (SELECT * FROM likes WHERE likes.student_id = highschooler.id) AND NOT EXISTS (SELECT * FROM likes WHERE likes.liked_id = highschooler.id)
SELECT h.name FROM highschooler h WHERE NOT EXISTS (SELECT 1 FROM friend f WHERE f.student_id = h.id)
SELECT h.name FROM highschooler h LEFT JOIN friend f ON h.id = f.student_id WHERE f.friend_id IS NULL
SELECT h.id FROM highschooler h, friend f, likes l WHERE h.id = f.student_id AND h.id = l.liked_id
SELECT h.id FROM highschooler h, friend f, likes l WHERE f.student_id = h.id AND l.student_id = h.id
SELECT h.name FROM highschooler h JOIN friend f ON h.id = f.student_id JOIN likes l ON h.id = l.liked_id
SELECT h.name FROM highschooler h JOIN friend f ON h.id = f.student_id JOIN likes l ON h.id = l.student_id WHERE h.id IN (SELECT liked_id FROM likes)
SELECT student_id, COUNT(liked_id) AS like_count FROM likes GROUP BY student_id
SELECT h.id AS student_id, (SELECT COUNT(l.liked_id) FROM likes l WHERE l.student_id = h.id) AS like_count FROM highschooler h
SELECT h.name, COUNT(*) AS num_likes FROM highschooler h, likes l WHERE h.id = l.student_id GROUP BY h.name
SELECT name, (SELECT COUNT(liked_id) FROM likes WHERE likes.student_id = h.id) as like_count FROM highschooler h
SELECT h.name FROM (SELECT liked_id, COUNT(*) AS like_count FROM likes GROUP BY liked_id ORDER BY like_count DESC LIMIT 1) AS l JOIN highschooler h ON h.id = l.liked_id
SELECT name FROM highschooler WHERE id = (SELECT likes.student_id FROM likes GROUP BY likes.student_id ORDER BY COUNT(likes.liked_id) DESC LIMIT 1)
SELECT h.name FROM highschooler h WHERE (SELECT COUNT(*) FROM likes WHERE student_id = h.id) >= 2
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(*) as num_likes FROM likes GROUP BY student_id) l ON h.id = l.student_id WHERE l.num_likes >= 2
SELECT h.name FROM highschooler h, (SELECT student_id, COUNT(friend_id) as num_friends FROM friend) f WHERE h.id = f.student_id AND h.grade > 5 AND f.num_friends >= 2
SELECT name FROM highschooler WHERE grade > 5 AND id IN (SELECT student_id FROM (SELECT student_id, COUNT(friend_id) as num_friends FROM friend GROUP BY student_id) WHERE num_friends >= 2)
SELECT COUNT(*) FROM likes WHERE student_id IN (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM likes INNER JOIN highschooler ON likes.student_id = highschooler.id WHERE highschooler.name = 'Kyle'
SELECT AVG(h.grade) FROM highschooler h WHERE EXISTS (SELECT 1 FROM friend WHERE student_id = h.id OR friend_id = h.id)
SELECT AVG(grade) FROM highschooler WHERE id IN (SELECT student_id FROM friend)
SELECT MIN(grade) FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT MIN(grade) FROM highschooler WHERE NOT EXISTS (SELECT * FROM friend WHERE friend_id = highschooler.id OR student_id = highschooler.id)
SELECT state FROM owners WHERE state IN (SELECT state FROM professionals GROUP BY state)
SELECT state FROM (SELECT state FROM owners INTERSECT SELECT state FROM professionals)
SELECT AVG(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT AVG(age) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments GROUP BY dog_id)
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' UNION ALL SELECT professional_id, last_name, cell_number FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' UNION SELECT professional_id, last_name, cell_number FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT d.name FROM dogs d WHERE NOT EXISTS (SELECT * FROM treatments t WHERE t.dog_id = d.dog_id GROUP BY t.dog_id HAVING SUM(t.cost_of_treatment) > 1000)
SELECT name FROM dogs WHERE EXISTS (SELECT * FROM treatments WHERE treatments.dog_id = dogs.dog_id GROUP BY owner_id HAVING SUM(cost_of_treatment) <= 1000)
SELECT first_name FROM (SELECT first_name FROM professionals UNION SELECT first_name FROM owners) AS combined_names WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT p.first_name FROM professionals p LEFT JOIN dogs d ON p.first_name = d.name WHERE d.name IS NULL
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments WHERE professional_id IS NOT NULL) OR professional_id IS NULL
SELECT p.professional_id, p.role_code, p.email_address FROM professionals p LEFT JOIN treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL
SELECT owner_id, first_name, last_name FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(num_dogs) FROM (SELECT owner_id, COUNT(dog_id) AS num_dogs FROM dogs GROUP BY owner_id)))
SELECT owners.owner_id, first_name, last_name FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id ORDER BY COUNT(dog_id) DESC LIMIT 1)
SELECT professional_id, role_code, first_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_id) >= 2)
SELECT professional_id, role_code, first_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_id) >= 2)
SELECT b.breed_name FROM breeds b JOIN (SELECT breed_code, COUNT(*) as dog_count FROM dogs GROUP BY breed_code ORDER BY dog_count DESC LIMIT 1) as top_breed ON b.breed_code = top_breed.breed_code
SELECT breed_name FROM breeds WHERE breed_code IN (SELECT breed_code FROM dogs GROUP BY breed_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT owner_id, last_name FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(cnt) FROM (SELECT owner_id, COUNT(dog_id) as cnt FROM dogs GROUP BY owner_id)))
SELECT o.owner_id, o.last_name FROM owners o JOIN dogs d ON o.owner_id = d.owner_id JOIN treatments t ON d.dog_id = t.dog_id GROUP BY o.owner_id, o.last_name ORDER BY (SELECT SUM(cost_of_treatment) FROM treatments WHERE dog_id = d.dog_id) DESC LIMIT 1
SELECT t.treatment_type_description FROM treatments t WHERE t.cost_of_treatment = (SELECT MIN(cost_of_treatment) FROM treatments)
SELECT treatment_type_description FROM (SELECT tt.treatment_type_code, SUM(t.cost_of_treatment) as total_cost, tt.treatment_type_description FROM treatment_types tt JOIN treatments t ON tt.treatment_type_code = t.treatment_type_code GROUP BY tt.treatment_type_code) as subquery WHERE total_cost = (SELECT MIN(total_cost) FROM (SELECT SUM(cost_of_treatment) as total_cost FROM treatments GROUP BY treatment_type_code) as subquery2)
SELECT owner_id, zip_code FROM owners WHERE owner_id = ANY ( SELECT owner_id FROM dogs JOIN treatments ON treatments.dog_id = dogs.dog_id GROUP BY owner_id ORDER BY SUM(cost_of_treatment) DESC LIMIT 1 )
SELECT owner_id, zip_code FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id ORDER BY SUM(cost_of_treatment) DESC LIMIT 1)
SELECT professional_id, cell_number FROM professionals p WHERE EXISTS (SELECT professional_id FROM treatments t1 WHERE p.professional_id = t1.professional_id GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= 2)
SELECT professional_id, cell_number FROM professionals WHERE professional_id IN ( SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) >= ( SELECT COUNT(DISTINCT treatment_type_code) FROM treatments GROUP BY professional_id ORDER BY COUNT(DISTINCT treatment_type_code) DESC LIMIT 1))
SELECT first_name, last_name FROM professionals WHERE professional_id IN ( SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments) )
SELECT first_name, last_name FROM professionals WHERE professional_id IN (SELECT professional_id FROM treatments WHERE cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments GROUP BY professional_id HAVING professional_id = p.professional_id))
SELECT date_of_treatment, first_name FROM treatments NATURAL JOIN professionals
SELECT t.date_of_treatment, p.first_name FROM treatments t INNER JOIN professionals p ON t.professional_id = p.professional_id
SELECT treatment_type_description, cost_of_treatment FROM treatments, treatment_types WHERE treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT cost_of_treatment, treatment_type_description FROM treatments CROSS JOIN treatment_types WHERE treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT first_name, last_name, size_description FROM owners INNER JOIN dogs ON owners.owner_id = dogs.owner_id INNER JOIN sizes ON dogs.size_code = sizes.size_code
SELECT first_name, last_name, size_description FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN sizes ON dogs.size_code = sizes.size_code
SELECT o.first_name, d.name FROM owners o INNER JOIN dogs d ON o.owner_id = d.owner_id
SELECT first_name, name FROM owners, dogs WHERE owners.owner_id = dogs.owner_id
SELECT name, date_of_treatment FROM dogs, treatments WHERE dogs.dog_id = treatments.dog_id AND dogs.breed_code = (SELECT breed_code FROM breeds ORDER BY breed_code LIMIT 1)
SELECT name, date_of_treatment FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code JOIN treatments ON dogs.dog_id = treatments.dog_id JOIN ( SELECT breed_code FROM dogs GROUP BY breed_code HAVING COUNT(*) = 1 ) AS rare_breeds ON dogs.breed_code = rare_breeds.breed_code
SELECT first_name, name FROM owners INNER JOIN dogs ON owners.owner_id = dogs.owner_id WHERE state = 'Virginia'
SELECT o.first_name, d.name FROM owners o INNER JOIN dogs d ON o.owner_id = d.owner_id WHERE o.street LIKE '%Virginia%'
SELECT dogs.date_arrived, dogs.date_departed FROM dogs, treatments WHERE dogs.dog_id = treatments.dog_id
SELECT dogs.date_arrived, dogs.date_departed FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT o.last_name FROM owners o JOIN dogs d ON o.owner_id = d.owner_id WHERE d.age = (SELECT MIN(age) FROM dogs)
SELECT last_name FROM owners WHERE owner_id = (SELECT owner_id FROM dogs ORDER BY date_of_birth LIMIT 1)
SELECT email_address FROM professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT dogs.date_arrived, dogs.date_departed FROM dogs
SELECT * FROM dogs
SELECT COUNT(DISTINCT dog_id) FROM treatments
SELECT COUNT(*) FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT COUNT(professional_id) FROM (SELECT DISTINCT professional_id FROM treatments)
SELECT role_code, street, city, state FROM professionals WHERE city LIKE '%West'
SELECT role_code, street, city, state FROM professionals WHERE city IN (SELECT city FROM professionals WHERE city LIKE '%West%')
SELECT first_name, last_name, email_address FROM owners WHERE state LIKE '%North%' AND state IN (SELECT state FROM owners WHERE state LIKE '%North%')
SELECT first_name, last_name, email_address FROM owners WHERE state IN (SELECT state FROM owners WHERE state LIKE '%North%')
SELECT COUNT(DISTINCT dog_id) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT COUNT(*) FROM (SELECT AVG(age) FROM dogs) AS avg_age
SELECT MAX(cost_of_treatment) FROM treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM treatments) GROUP BY cost_of_treatment
SELECT cost_of_treatment FROM treatments WHERE date_of_treatment = (SELECT MAX(date_of_treatment) FROM treatments) ORDER BY cost_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT DISTINCT dog_id FROM treatments)
SELECT COUNT(*) FROM dogs WHERE NOT EXISTS (SELECT 1 FROM treatments WHERE treatments.dog_id = dogs.dog_id)
SELECT COUNT(*) FROM owners WHERE NOT EXISTS (SELECT * FROM dogs WHERE dogs.owner_id = owners.owner_id)
SELECT count(*) FROM owners LEFT JOIN dogs ON owners.owner_id = dogs.owner_id WHERE dogs.owner_id IS NULL
SELECT COUNT(professional_id) FROM professionals WHERE NOT EXISTS (SELECT 1 FROM treatments WHERE treatments.professional_id = professionals.professional_id)
SELECT COUNT(professional_id) FROM professionals WHERE NOT EXISTS (SELECT 1 FROM treatments WHERE treatments.professional_id = professionals.professional_id)
SELECT D.name, D.age, D.weight FROM dogs D WHERE D.abandoned_yn = 1
SELECT name, age, weight FROM dogs WHERE abandoned_yn = 1
SELECT AVG(strftime('%Y', 'now') - strftime('%Y', date_of_birth)) FROM dogs
SELECT AVG(age) FROM (SELECT DISTINCT age FROM dogs)
SELECT MAX(age) FROM dogs
SELECT MAX(age) AS max_age FROM dogs
SELECT charge_type, charge_amount FROM charges ORDER BY charge_amount DESC
SELECT charge_type, charge_amount FROM charges
SELECT MAX(charge_amount) AS max_charge_cost FROM charges WHERE charge_id = (SELECT charge_id FROM charges ORDER BY charge_amount DESC LIMIT 1)
SELECT charge_amount FROM charges WHERE charge_id = (SELECT charge_id FROM charges WHERE charge_amount = (SELECT MAX(charge_amount) FROM charges))
SELECT distinct email_address, cell_number, home_phone FROM professionals
SELECT email_address, cell_number, home_phone FROM professionals GROUP BY email_address, cell_number, home_phone
SELECT breed_name, size_description FROM breeds CROSS JOIN sizes
SELECT breed_name, size_description FROM dogs, breeds, sizes WHERE dogs.breed_code = breeds.breed_code AND dogs.size_code = sizes.size_code GROUP BY breed_name, size_description
SELECT p.first_name, tt.treatment_type_description FROM treatments t, professionals p, treatment_types tt WHERE t.professional_id = p.professional_id AND t.treatment_type_code = tt.treatment_type_code
SELECT p.first_name, tt.treatment_type_description FROM professionals p INNER JOIN treatments t ON p.professional_id = t.professional_id INNER JOIN treatment_types tt ON t.treatment_type_code = tt.treatment_type_code
SELECT (SELECT COUNT(*) FROM singer) AS singer_count
SELECT COUNT(net_worth_millions) FROM singer
SELECT name FROM singer ORDER BY net_worth_millions
SELECT name FROM singer ORDER BY net_worth_millions
SELECT birth_year, citizenship FROM singer GROUP BY birth_year, citizenship
SELECT singer.birth_year, singer.citizenship FROM singer
SELECT name FROM singer WHERE citizenship != 'France'
SELECT name FROM singer WHERE NOT EXISTS (SELECT 1 FROM singer s2 WHERE s2.citizenship = 'French' AND s2.singer_id = singer.singer_id)
SELECT DISTINCT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949
SELECT name FROM singer WHERE birth_year IN (1948, 1949)
SELECT TOP 1 name FROM singer ORDER BY net_worth_millions DESC
SELECT s.name FROM singer s JOIN (SELECT MAX(net_worth_millions) as max_worth FROM singer) m ON s.net_worth_millions = m.max_worth
SELECT citizenship, COUNT(*) AS num_singers FROM singer GROUP BY citizenship
SELECT citizenship, (SELECT COUNT(*) FROM singer s2 WHERE s2.citizenship = s.citizenship) AS num_singers FROM singer GROUP BY citizenship
SELECT citizenship, COUNT(singer_id) AS num_singers FROM singer GROUP BY citizenship ORDER BY num_singers DESC LIMIT 1
SELECT a.citizenship FROM singer a WHERE (SELECT COUNT(*) FROM singer b WHERE b.citizenship = a.citizenship) = (SELECT MAX(c) FROM (SELECT citizenship, COUNT(*) AS c FROM singer GROUP BY citizenship))
SELECT citizenship, MAX(net_worth_millions) AS max_net_worth FROM singer GROUP BY citizenship
SELECT s1.citizenship, s1.net_worth_millions FROM singer s1 LEFT JOIN singer s2 ON s1.citizenship = s2.citizenship AND s1.net_worth_millions < s2.net_worth_millions WHERE s2.singer_id IS NULL
SELECT song.title, singer.name FROM song, singer WHERE song.singer_id = singer.singer_id
SELECT s.title, r.name FROM song s, singer r WHERE s.singer_id = r.singer_id
SELECT DISTINCT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song WHERE sales > 300000) GROUP BY name
SELECT name FROM singer WHERE singer_id = ANY (SELECT singer_id FROM song WHERE sales > 300000)
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING COUNT(*) > 1)
SELECT name FROM singer WHERE singer_id IN (SELECT singer_id FROM song GROUP BY singer_id HAVING COUNT(*) > 1)
SELECT singer.name, SUM(song.sales) AS total_sales FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name
SELECT name, (SELECT SUM(sales) FROM song WHERE singer_id = singer.singer_id) AS total_sales FROM singer
SELECT name FROM singer WHERE singer_id NOT IN (SELECT DISTINCT singer_id FROM song)
SELECT s.name FROM singer s WHERE NOT EXISTS (SELECT 1 FROM song so WHERE s.singer_id = so.singer_id AND so.singer_id IS NOT NULL)
SELECT citizenship FROM singer WHERE birth_year < 1945 AND EXISTS (SELECT * FROM singer WHERE birth_year > 1955 AND singer.citizenship = citizenship)
SELECT DISTINCT s1.citizenship FROM singer s1, singer s2 WHERE s1.citizenship = s2.citizenship AND s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT COUNT(DISTINCT feature_type_code) FROM ref_feature_types
SELECT RFT.feature_type_name FROM ref_feature_types RFT, other_available_features OAF WHERE RFT.feature_type_code = OAF.feature_type_code AND OAF.feature_name = 'AirCon'
SELECT property_type_description FROM ref_property_types WHERE property_type_code IN (SELECT property_type_code FROM properties)
SELECT property_name FROM properties WHERE property_type_code IN ('House', 'Apartment') AND room_count > 1
