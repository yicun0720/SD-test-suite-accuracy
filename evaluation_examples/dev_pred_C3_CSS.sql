SELECT COUNT(*) AS singer_count FROM concert JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id
SELECT COUNT(*) FROM (SELECT DISTINCT name, country, song_name, age FROM singer)
SELECT name, country, age FROM singer GROUP BY age, name, country ORDER BY age DESC
SELECT name, country, age FROM singer ORDER BY age DESC, name
SELECT AVG(age) AS average_age, MIN(age) AS min_age, MAX(age) AS max_age FROM singer WHERE country = 'France'
SELECT AVG(age) AS average_age FROM singer WHERE country = 'France' UNION SELECT MIN(age) AS min_age FROM singer WHERE country = 'France' UNION SELECT MAX(age) AS max_age FROM singer WHERE country = 'France'
SELECT name, song_release_year FROM singer ORDER BY age ASC LIMIT 1
SELECT song_name, song_release_year FROM singer WHERE age = (SELECT MIN(age) FROM singer)
SELECT DISTINCT country FROM singer WHERE age > 20 UNION SELECT country FROM singer WHERE age > 20
SELECT DISTINCT country FROM singer WHERE age > 20 ORDER BY country
SELECT country, (SELECT COUNT(DISTINCT singer_id) FROM singer_in_concert WHERE singer_id = s.singer_id) AS singer_count FROM singer s
SELECT country, COUNT(singer_id) AS num_singers FROM singer GROUP BY country
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer) EXCEPT SELECT song_name FROM singer
SELECT song_name FROM singer WHERE age > (SELECT AVG(age) FROM singer)
SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000 ORDER BY location, name
SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000 ORDER BY name
SELECT MAX(capacity), AVG(capacity) FROM stadium
SELECT AVG(capacity) AS average_capacity, MAX(capacity) AS maximum_capacity FROM stadium
SELECT name, capacity FROM stadium ORDER BY average DESC LIMIT 1
SELECT name, capacity FROM stadium ORDER BY average DESC LIMIT 1
SELECT SUM(CASE WHEN year = 2014 OR year = 2015 THEN 1 ELSE 0 END) FROM concert
SELECT COUNT(DISTINCT concert_id) FROM concert WHERE year = 2014 UNION SELECT COUNT(DISTINCT concert_id) FROM concert WHERE year = 2015
SELECT stadium.name, (SELECT COUNT(*) FROM concert WHERE concert.stadium_id = stadium.stadium_id) AS num_concerts FROM stadium ORDER BY num_concerts DESC
SELECT name, COUNT(*) FROM concert WHERE stadium_id IN (SELECT stadium_id FROM stadium) GROUP BY stadium_id
SELECT name, capacity FROM stadium WHERE stadium_id = (SELECT stadium_id FROM (SELECT s.stadium_id, COUNT(c.concert_id) as concert_count FROM stadium s JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.year >= 2014 GROUP BY s.stadium_id ORDER BY concert_count DESC LIMIT 1) )
SELECT name, capacity FROM stadium WHERE stadium_id = ( SELECT stadium_id FROM ( SELECT s.stadium_id, COUNT(*) as concert_count FROM stadium s JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.year > 2013 GROUP BY s.stadium_id ORDER BY concert_count DESC LIMIT 1 ) )
SELECT year, COUNT(*) AS num_concerts FROM concert GROUP BY year ORDER BY num_concerts DESC LIMIT 1
SELECT year FROM (SELECT year, COUNT(concert_id) as num_concerts FROM concert GROUP BY year ORDER BY num_concerts DESC LIMIT 1)
SELECT name FROM stadium EXCEPT SELECT s.name FROM stadium s INNER JOIN concert c ON s.stadium_id = c.stadium_id
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id WHERE c.concert_id IS NULL
SELECT s.country FROM singer s WHERE s.age > 40 AND s.country IN (SELECT country FROM singer WHERE age < 30)
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id AND c.year = 2014 WHERE c.stadium_id IS NULL
SELECT s.name FROM stadium s LEFT JOIN concert c ON s.stadium_id = c.stadium_id AND c.year = 2014 WHERE c.concert_id IS NULL
SELECT concert_name, theme, COUNT(singer_in_concert.singer_id) AS singer_count FROM concert LEFT JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert_name, theme
SELECT concert.concert_name, concert.theme, (SELECT COUNT(singer_id) FROM singer_in_concert WHERE singer_in_concert.concert_id = concert.concert_id) as number_of_singers FROM concert
SELECT name, COUNT(*) AS num_concerts FROM singer JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id GROUP BY name
SELECT name, (SELECT COUNT(*) FROM concert JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id WHERE singer_in_concert.singer_id = singer.singer_id) AS num_concerts FROM singer
SELECT singer.name FROM concert, singer_in_concert, singer WHERE concert.concert_id = singer_in_concert.concert_id AND singer_in_concert.singer_id = singer.singer_id AND concert.year = 2014
SELECT s.name FROM singer s, singer_in_concert sic, concert c WHERE s.singer_id = sic.singer_id AND sic.concert_id = c.concert_id AND c.year = 2014
SELECT DISTINCT name, country FROM singer WHERE song_name LIKE '%Hey%'
SELECT name, country FROM singer WHERE song_name LIKE '%Hey%'
SELECT s.name, s.location FROM stadium s INNER JOIN concert c1 ON s.stadium_id = c1.stadium_id INNER JOIN concert c2 ON s.stadium_id = c2.stadium_id WHERE c1.year = 2014 AND c2.year = 2015
SELECT s.name, s.location FROM stadium s JOIN concert c1 ON s.stadium_id = c1.stadium_id JOIN concert c2 ON s.stadium_id = c2.stadium_id WHERE c1.year = 2014 AND c2.year = 2015
SELECT COUNT(*) FROM concert WHERE stadium_id = (SELECT stadium_id FROM stadium ORDER BY capacity DESC LIMIT 1)
SELECT COUNT(*) FROM concert WHERE stadium_id = (SELECT stadium_id FROM stadium WHERE capacity = (SELECT MAX(capacity) FROM stadium) )
SELECT COUNT(*) FROM pets WHERE weight > 10
SELECT COUNT(*) FROM pets WHERE weight > 10 HAVING COUNT(*) > 1
SELECT weight FROM pets WHERE pettype = 'dog' AND pet_age = (SELECT min(pet_age) FROM pets WHERE pettype = 'dog') ORDER BY pet_age ASC LIMIT 1
SELECT weight FROM pets WHERE pettype = 'dog' HAVING pet_age = (SELECT min(pet_age) FROM pets WHERE pettype = 'dog')
SELECT p.pettype, p.weight AS max_weight FROM pets p INNER JOIN (SELECT pettype, MAX(weight) AS max_weight FROM pets GROUP BY pettype) max_weight_pet ON p.pettype = max_weight_pet.pettype AND p.weight = max_weight_pet.max_weight
SELECT pettype, MAX(weight) AS max_weight FROM (SELECT * FROM pets ORDER BY pettype, weight DESC) GROUP BY pettype
SELECT COUNT(*) FROM has_pet WHERE stuid IN (SELECT stuid FROM student WHERE age > 20) GROUP BY stuid HAVING COUNT(*) > 0
SELECT COUNT(petid) FROM pets JOIN has_pet ON pets.petid = has_pet.petid JOIN student ON has_pet.stuid = student.stuid WHERE age > 20
SELECT COUNT(*) FROM has_pet, student, pets WHERE has_pet.stuid = student.stuid AND has_pet.petid = pets.petid AND student.sex = 'F' AND pets.pettype = 'dog'
SELECT COUNT(*) FROM has_pet, student, pets WHERE has_pet.stuid = student.stuid AND has_pet.petid = pets.petid AND pets.pettype = 'dog' AND student.sex = 'female' HAVING COUNT(*) > 0
SELECT count(distinct pettype) FROM pets
SELECT COUNT(DISTINCT pettype) FROM pets
SELECT fname FROM student WHERE EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat') OR EXISTS (SELECT * FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'dog')
SELECT fname FROM student WHERE stuid = ANY (SELECT stuid FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' OR pettype = 'dog')
SELECT fname FROM student WHERE (SELECT COUNT(DISTINCT pettype) FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE student.stuid = has_pet.stuid) = 2
SELECT s.fname FROM student s JOIN has_pet hc ON s.stuid = hc.stuid JOIN pets c ON hc.petid = c.petid AND c.pettype = 'cat' JOIN has_pet hd ON s.stuid = hd.stuid JOIN pets d ON hd.petid = d.petid AND d.pettype = 'dog'
SELECT major, age FROM student WHERE (SELECT COUNT(*) FROM has_pet WHERE has_pet.stuid = student.stuid AND has_pet.petid IN (SELECT petid FROM pets WHERE pettype = 'cat')) = 0
SELECT major, age FROM student s LEFT JOIN (SELECT hp.stuid, hp.petid FROM has_pet hp INNER JOIN pets p ON hp.petid = p.petid WHERE p.pettype = 'cat') c ON s.stuid = c.stuid WHERE c.petid IS NULL
SELECT has_pet.stuid FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid LEFT JOIN pets ON has_pet.petid = pets.petid WHERE pettype != 'cat' OR pettype IS NULL
SELECT stuid FROM student WHERE NOT EXISTS (SELECT * FROM has_pet INNER JOIN pets ON has_pet.petid = pets.petid WHERE pettype = 'cat' AND student.stuid = has_pet.stuid)
SELECT s.fname, s.age FROM student s JOIN has_pet hp1 ON s.stuid = hp1.stuid JOIN pets p1 ON hp1.petid = p1.petid AND p1.pettype = 'dog' LEFT JOIN has_pet hp2 ON s.stuid = hp2.stuid LEFT JOIN pets p2 ON hp2.petid = p2.petid AND p2.pettype = 'cat' WHERE hp2.petid IS NULL
SELECT s.fname FROM student s WHERE (SELECT COUNT(*) FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE hp.stuid = s.stuid AND p.pettype = 'dog') >= 1 AND (SELECT COUNT(*) FROM has_pet hp JOIN pets p ON hp.petid = p.petid WHERE hp.stuid = s.stuid AND p.pettype = 'cat') = 0
SELECT pettype, weight FROM pets ORDER BY pet_age ASC LIMIT 1
SELECT pettype, weight FROM pets ORDER BY pet_age ASC, weight DESC LIMIT 1
SELECT petid, weight FROM pets WHERE pet_age > 1 EXCEPT SELECT petid, weight FROM pets WHERE pet_age <= 1
SELECT pets.petid, pets.weight FROM pets, has_pet WHERE pets.petid = has_pet.petid AND pets.pet_age > 1
SELECT pettype, AVG(age) AS average_age, MAX(age) AS max_age FROM pets NATURAL JOIN has_pet NATURAL JOIN student GROUP BY pettype
SELECT pettype, AVG(age) as avg_age, MAX(age) as max_age FROM pets p, has_pet hp, student s WHERE p.petid = hp.petid AND hp.stuid = s.stuid GROUP BY pettype
SELECT pettype, AVG(weight) average_weight FROM pets GROUP BY pettype ORDER BY pettype
SELECT pettype, AVG(weight) AS average_weight FROM pets GROUP BY pettype ORDER BY average_weight
SELECT fname, age FROM (SELECT stuid FROM has_pet) AS p JOIN student ON p.stuid = student.stuid
SELECT student.fname, student.age FROM student, has_pet WHERE student.stuid = has_pet.stuid
SELECT pets.petid FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE student.lname = 'Smith'
SELECT p.petid FROM pets p, has_pet h, student s WHERE s.lname = 'Smith' AND h.stuid = s.stuid AND p.petid = h.petid
SELECT student.stuid, COUNT(has_pet.petid) AS num_pets FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.stuid
SELECT stuid, COUNT(pets.petid) AS pet_count FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid GROUP BY student.stuid
SELECT s.fname, s.sex FROM student s JOIN (SELECT stuid, COUNT(petid) AS num_pets FROM has_pet GROUP BY stuid) pcount ON s.stuid = pcount.stuid WHERE pcount.num_pets > 1
SELECT s.fname, s.sex FROM student s WHERE (SELECT COUNT(*) FROM has_pet hp WHERE s.stuid = hp.stuid) > 1
SELECT lname FROM student, has_pet, pets WHERE student.stuid = has_pet.stuid AND has_pet.petid = pets.petid AND pettype = 'cat' AND pet_age = 3 LIMIT 1
SELECT lname FROM student WHERE stuid IN (SELECT stuid FROM has_pet WHERE petid IN (SELECT petid FROM pets WHERE pettype = 'cat' AND pet_age = 3)) LIMIT 1
SELECT AVG(age) FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid WHERE has_pet.stuid IS NULL
SELECT AVG(s.age) FROM student s LEFT JOIN has_pet hp ON s.stuid = hp.stuid WHERE hp.stuid IS NULL
SELECT COUNT(*) AS num_continents FROM continents
SELECT count(1) as num_continents FROM continents
SELECT contid, continent, (SELECT COUNT(*) FROM countries WHERE countries.continent = continents.contid) AS country_count FROM continents
SELECT continents.contid, continents.continent, (SELECT COUNT(*) FROM countries WHERE countries.continent = continents.contid) AS country_count FROM continents
SELECT countryname FROM countries ORDER BY countryid DESC LIMIT 1
SELECT COUNT(*) FROM countries
SELECT fullname, id, (SELECT COUNT(*) FROM model_list WHERE model_list.maker = car_makers.id) AS num_models FROM car_makers
SELECT car_makers.id, car_makers.fullname, num_models FROM car_makers JOIN (SELECT maker, COUNT(modelid) AS num_models FROM model_list GROUP BY maker) AS model_count ON car_makers.id = model_count.maker
SELECT model FROM model_list WHERE modelid IN (SELECT id FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE horsepower = (SELECT MIN(horsepower) FROM cars_data)))
SELECT model FROM car_names, cars_data, model_list WHERE car_names.makeid = cars_data.id AND car_names.model = model_list.model ORDER BY cars_data.horsepower ASC LIMIT 1
SELECT model FROM model_list WHERE modelid = (SELECT modelid FROM car_names WHERE makeid = (SELECT id FROM cars_data WHERE weight < (SELECT AVG(weight) FROM cars_data)))
SELECT model FROM model_list WHERE EXISTS (SELECT 1 FROM car_names WHERE model_list.modelid = car_names.modelid AND makeid = cars_data.id AND weight < (SELECT AVG(weight) FROM cars_data))
SELECT maker FROM car_makers WHERE id IN (SELECT id FROM cars_data WHERE year = 1970) GROUP BY maker HAVING COUNT(*) > 0
SELECT DISTINCT maker FROM car_makers JOIN car_names ON car_makers.id = car_names.make JOIN cars_data ON car_names.makeid = cars_data.id WHERE year = 1970
SELECT make, MIN(year) as production_time FROM car_names, cars_data WHERE car_names.makeid = cars_data.id GROUP BY make
SELECT maker, MIN(year) as earliest_year FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.model = model_list.model INNER JOIN car_makers ON model_list.maker = car_makers.id GROUP BY maker ORDER BY earliest_year LIMIT 1
SELECT DISTINCT car_names.model FROM model_list JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year > 1980
SELECT model FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE year > 1980) ORDER BY model
SELECT contid AS continent, COUNT(DISTINCT id) AS maker_count FROM continents JOIN countries ON continents.contid = countries.continent JOIN car_makers ON countries.countryid = car_makers.country GROUP BY continent
SELECT c.continent, (SELECT COUNT(m.maker) FROM car_makers m JOIN countries ct ON m.country = ct.countryid WHERE ct.continent = c.contid) AS num_car_makers FROM continents c
SELECT countryname FROM countries WHERE countryid = (SELECT country FROM car_makers GROUP BY country HAVING COUNT(maker) = (SELECT MAX(maker_count) FROM (SELECT country, COUNT(maker) AS maker_count FROM car_makers GROUP BY country)))
SELECT countryname FROM countries WHERE countryid = (SELECT country FROM car_makers GROUP BY country HAVING COUNT(id) = (SELECT MAX(maker_count) FROM (SELECT country, COUNT(id) AS maker_count FROM car_makers GROUP BY country)))
SELECT fullname, model_count FROM (SELECT car_makers.fullname, COUNT(model_list.modelid) AS model_count FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.fullname) AS subquery
SELECT m.maker, COUNT(m.model) AS model_count, cm.id, cm.fullname FROM model_list m JOIN car_makers cm ON m.maker = cm.id GROUP BY m.maker, cm.id, cm.fullname
SELECT cd.accelerate FROM cars_data cd, car_names cn WHERE cd.id = cn.makeid AND cn.model = 'amc hornet sportabout (sw)'
SELECT cars_data.accelerate FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.makeid = model_list.modelid WHERE car_names.model = 'amc hornet sportabout (sw)'
SELECT COUNT(maker) FROM car_makers WHERE country = (SELECT countryid FROM countries WHERE countryname = 'france') LIMIT 1
SELECT COUNT(DISTINCT maker) FROM car_makers, countries WHERE car_makers.country = countries.countryid AND countries.countryname = 'France'
SELECT count(DISTINCT model) FROM model_list JOIN car_makers ON model_list.maker = car_makers.id WHERE car_makers.country = 'usa'
SELECT COUNT(*) FROM model_list, car_makers WHERE model_list.maker = car_makers.id AND car_makers.country = 'United States'
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 EXCEPT SELECT AVG(mpg) FROM cars_data WHERE cylinders <> 4
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4 AND cylinders = 4
SELECT MIN(weight) FROM cars_data WHERE cylinders = 8 AND year = 1974 FETCH FIRST ROW ONLY
SELECT MIN(weight) AS min_weight FROM cars_data WHERE cylinders = 8 AND year = 1974 ORDER BY weight LIMIT 1
SELECT maker, model FROM car_makers, model_list, car_names WHERE car_makers.id = model_list.maker AND car_names.model = model_list.model
SELECT maker, model FROM car_makers, model_list, car_names WHERE car_makers.id = model_list.maker AND model_list.model = car_names.model
SELECT DISTINCT c.countryid, c.countryname FROM countries c INNER JOIN car_makers m ON c.countryid = m.country
SELECT c.countryid, c.countryname FROM countries c INNER JOIN car_makers cm ON c.countryid = cm.country
SELECT COUNT(id) FROM cars_data WHERE horsepower > 150
SELECT COUNT(*) FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model WHERE cars_data.horsepower > 150
SELECT year, AVG(weight) AS avg_weight FROM cars_data GROUP BY year
SELECT year, AVG(weight) AS average_weight, AVG(year) AS average_year FROM cars_data WHERE year BETWEEN 2010 AND 2020 GROUP BY year
SELECT c.countryname FROM countries c JOIN (SELECT country, COUNT(DISTINCT maker) AS maker_count FROM car_makers GROUP BY country) cm ON c.countryid = cm.country WHERE c.continent = 'europe' AND cm.maker_count >= 3
SELECT countryname FROM countries WHERE continent = (SELECT contid FROM continents WHERE continent = 'europe') AND countryid IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(DISTINCT maker) >= 3)
SELECT MAX(horsepower), make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cylinders = 3
SELECT model_list.model, cars_data.horsepower FROM model_list JOIN cars_data ON model_list.modelid = car_names.modelid WHERE cars_data.cylinders = 3 ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT model, mpg FROM model_list, car_names, cars_data WHERE model_list.model = car_names.model AND car_names.makeid = cars_data.id ORDER BY mpg DESC LIMIT 1
SELECT model FROM cars_data GROUP BY model HAVING mpg = MAX(mpg)
SELECT AVG(cars_data.horsepower) FROM cars_data, car_names, model_list WHERE cars_data.id = car_names.makeid AND car_names.model = model_list.modelid AND cars_data.year < 1980
SELECT avg(horsepower) as avg_horsepower FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid INNER JOIN model_list ON car_names.model = model_list.model WHERE model_list.year < 1980 GROUP BY model_list.year HAVING model_list.year < 1980
SELECT AVG(edispl) FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE model = (SELECT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE maker = 'volvo')))
SELECT AVG(edispl) FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE make = (SELECT id FROM car_makers WHERE maker = 'volvo'))
SELECT c1.cylinders, c1.accelerate FROM cars_data c1 WHERE c1.accelerate = (SELECT MAX(c2.accelerate) FROM cars_data c2 WHERE c1.cylinders = c2.cylinders) ORDER BY cylinders
SELECT DISTINCT cylinders, (SELECT MAX(accelerate) FROM cars_data WHERE cylinders = c.cylinders) AS max_accelerate FROM cars_data c
SELECT model, version_count FROM (SELECT model, COUNT(model) as version_count FROM model_list GROUP BY model ORDER BY version_count DESC) LIMIT 1
SELECT model, versions FROM (SELECT model, COUNT(DISTINCT make) AS versions FROM car_names GROUP BY model) WHERE versions = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT make) AS cnt FROM car_names GROUP BY model))
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4 HAVING COUNT(*) > 1
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4 HAVING COUNT(*) > 0
SELECT year, COUNT(*) FROM cars_data GROUP BY year HAVING year = 1980
SELECT COUNT(*) FROM cars_data WHERE year = 1980 HAVING COUNT(*) > 0
SELECT COUNT(modelid) FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'American Motor Company')
SELECT count(modelid) FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'American Motor Company')
SELECT car_makers.id, car_makers.fullname FROM car_makers INNER JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id, car_makers.fullname HAVING COUNT(model_list.modelid) > 3
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker FROM model_list GROUP BY maker HAVING COUNT(modelid) > 3)
SELECT DISTINCT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'General Motors') OR maker IN (SELECT id FROM car_makers WHERE weight > 3500)
SELECT model FROM model_list WHERE maker = (SELECT id FROM car_makers WHERE fullname = 'General Motors') UNION SELECT model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.weight > 3500
SELECT c.year FROM cars_data c INNER JOIN car_names cn ON c.id = cn.makeid INNER JOIN model_list ml ON cn.model = ml.model WHERE c.weight >= 3000 AND c.weight <= 4000
SELECT year FROM (SELECT year, weight FROM cars_data WHERE weight < 4000 UNION SELECT year, weight FROM cars_data WHERE weight > 3000) GROUP BY year HAVING COUNT(DISTINCT weight) > 1
SELECT c.horsepower FROM cars_data c WHERE c.accelerate = (SELECT max(accelerate) FROM cars_data)
SELECT horsepower FROM cars_data WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data) AND ROWNUM = 1
SELECT cylinders FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE model = 'volvo' ORDER BY accelerate LIMIT 1)
SELECT cylinders FROM cars_data WHERE id = (SELECT makeid FROM car_names WHERE model = 'volvo' ORDER BY accelerate LIMIT 1)
SELECT count(*) FROM cars_data a WHERE a.accelerate > (SELECT max(horsepower) FROM cars_data)
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data) ORDER BY accelerate DESC LIMIT 1
SELECT COUNT(DISTINCT countryid) FROM ( SELECT countries.countryid FROM car_makers JOIN countries ON car_makers.country = countries.countryid GROUP BY countries.countryid HAVING COUNT(*) > 2 )
SELECT COUNT(DISTINCT c.countryname) FROM countries c INNER JOIN (SELECT country, COUNT(*) AS num_makers FROM car_makers GROUP BY country HAVING num_makers > 2) m ON c.countryid = m.country
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6 ORDER BY cylinders DESC
SELECT COUNT(1) AS car_count FROM cars_data WHERE cylinders > 6
SELECT M.model FROM model_list AS M JOIN cars_data AS C ON M.id = C.id WHERE C.cylinders = 4 ORDER BY C.horsepower DESC LIMIT 1
SELECT model, MAX(horsepower) FROM cars_data WHERE cylinders = 4 GROUP BY model HAVING MAX(horsepower) = (SELECT MAX(horsepower) FROM cars_data WHERE cylinders = 4)
SELECT car_names.makeid, car_names.make FROM car_names JOIN cars_data ON cars_data.id = car_names.makeid WHERE cars_data.cylinders <= 3 AND cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data)
SELECT c.id, c.make FROM car_names c JOIN cars_data d ON c.makeid = d.id WHERE d.cylinders < 4 AND d.horsepower < (SELECT MIN(horsepower) FROM cars_data)
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 AND year < 1980 ORDER BY mpg DESC LIMIT 1
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 OR year < 1980 ORDER BY mpg DESC LIMIT 1
SELECT car_names.model FROM model_list JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE weight < 3500 AND maker <> 'Ford Motor Company'
SELECT model FROM car_names WHERE makeid IN (SELECT id FROM cars_data WHERE weight < 3500) AND model_list.maker != (SELECT id FROM car_makers WHERE fullname = 'Ford Motor Company')
SELECT DISTINCT countryname FROM countries LEFT JOIN car_makers ON countries.countryid = car_makers.country WHERE car_makers.country IS NULL
SELECT DISTINCT c.countryname FROM countries c LEFT JOIN car_makers cm ON c.countryid = cm.country WHERE cm.maker IS NULL
SELECT id, maker FROM car_makers WHERE id IN (SELECT maker, COUNT(modelid) FROM model_list GROUP BY maker HAVING COUNT(modelid) > 1)
SELECT car_makers.id, car_makers.maker FROM car_makers JOIN (SELECT maker, COUNT(*) AS model_count FROM model_list GROUP BY maker HAVING model_count >= 2) AS m ON car_makers.id = m.maker JOIN (SELECT make, COUNT(*) AS car_count FROM car_names GROUP BY make HAVING car_count > 3) AS c ON car_makers.id = c.make
SELECT countryid, countryname FROM countries WHERE countryid IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(DISTINCT id) > 3) OR countryid IN (SELECT country FROM car_makers INNER JOIN model_list ON car_makers.id = model_list.maker WHERE model = 'fiat')
SELECT countryid, countryname FROM countries WHERE countryid IN (SELECT country FROM car_makers GROUP BY country HAVING COUNT(*) > 3) OR countryid IN (SELECT country FROM car_makers INNER JOIN model_list ON car_makers.id = model_list.maker WHERE model = 'fiat')
SELECT a.country FROM airlines a WHERE a.airline = 'JetBlue Airways'
SELECT a.country FROM airlines a WHERE a.airline = 'JetBlue Airways'
SELECT abbreviation FROM airlines WHERE airline = 'JetBlue Airways' EXCEPT SELECT abbreviation FROM airlines WHERE country = 'United States'
SELECT abbreviation FROM airlines WHERE airline = 'JetBlue Airways' LIMIT 1
SELECT * FROM airlines WHERE country = 'USA'
SELECT airline, abbreviation FROM airlines WHERE country = 'USA' EXCEPT SELECT airline, abbreviation FROM airlines WHERE country != 'USA'
SELECT airportcode, airportname FROM airports WHERE city = 'Anthony' EXCEPT SELECT airportcode, airportname FROM airports WHERE city != 'Anthony'
SELECT a.airportcode, a.airportname FROM airports a JOIN flights f ON a.airportcode = f.sourceairport WHERE a.city = 'Anthony'
SELECT COUNT(*) airlines_count FROM airlines
SELECT COUNT(DISTINCT airline) AS total_airlines FROM airlines GROUP BY abbreviation
SELECT COUNT(*) FROM airports
SELECT COUNT(airportcode) AS total FROM airports
SELECT EXISTS (SELECT 1 FROM flights) AS any_flights
SELECT COUNT(*) FROM flights GROUP BY airline
SELECT airline FROM airlines WHERE abbreviation = 'UAL' EXCEPT SELECT airline FROM airlines WHERE abbreviation <> 'UAL'
SELECT airline FROM airlines WHERE abbreviation = 'UAL'
SELECT COUNT(1) FROM airlines WHERE country = 'USA'
SELECT COUNT(airline) FROM airlines WHERE country = 'USA'
SELECT city, country FROM airports WHERE airportcode IN (SELECT destairport FROM flights WHERE sourceairport = 'Alton')
SELECT city, country FROM airports WHERE airportcode IN (SELECT sourceairport FROM flights WHERE destairport = 'Alton')
SELECT airportname FROM airports WHERE airportcode = 'AKO' EXCEPT SELECT airportname FROM airports WHERE airportcode <> 'AKO'
SELECT airportname FROM airports WHERE airportcode = 'AKO' EXCEPT SELECT airportname FROM airports WHERE airportcode != 'AKO'
SELECT airportname FROM airports WHERE city = 'Aberdeen' EXCEPT SELECT airportname FROM airports WHERE city != 'Aberdeen'
SELECT airportname FROM airports WHERE city = 'Aberdeen' EXCEPT SELECT airportname FROM airports WHERE city != 'Aberdeen'
SELECT COUNT(1) FROM flights WHERE sourceairport = 'APG'
SELECT COUNT(1) FROM flights WHERE sourceairport = 'APG'
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.airportname = 'ATO'
SELECT COUNT(*) FROM flights WHERE destairport = 'ATO'
SELECT COUNT(*) FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND airports.city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE destairport = 'Aberdeen'
SELECT COUNT(flights.destairport) FROM flights, airports WHERE flights.destairport = airports.airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'Aberdeen') AND destairport = (SELECT airportcode FROM airports WHERE city = 'Ashley')
SELECT COUNT(*) FROM flights f JOIN airports a1 ON f.sourceairport = a1.airportcode JOIN airports a2 ON f.destairport = a2.airportcode WHERE a1.city = 'Aberdeen' AND a2.city = 'Ashley'
SELECT count(*) FROM flights WHERE airline = 'JetBlue Airways'
SELECT COUNT(*) FROM flights WHERE airline = 'JetBlue'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = (SELECT airportcode FROM airports WHERE airportname = 'Airport ASY')
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport = 'ASY' LIMIT 1
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND sourceairport = 'AHD' HAVING COUNT(*) > 0
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND sourceairport = 'AHD' HAVING COUNT(*) > 0
SELECT count(*) FROM flights, airports WHERE airline = 'United Airlines' AND destairport = airportcode AND city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE airline = 'United Airlines' AND destairport IN (SELECT airportcode FROM airports WHERE city = 'Aberdeen')
SELECT city, num_arriving_flights FROM (SELECT city, COUNT(*) AS num_arriving_flights FROM airports JOIN flights ON airports.airportcode = flights.destairport GROUP BY city HAVING num_arriving_flights = (SELECT MAX(arriving_count) FROM (SELECT COUNT(*) AS arriving_count FROM flights GROUP BY destairport))) ORDER BY num_arriving_flights DESC LIMIT 1
SELECT city FROM airports WHERE airportcode = (SELECT destairport FROM flights GROUP BY destairport HAVING COUNT(destairport) = MAX(COUNT(destairport)))
SELECT city, count(*) AS num_departing_flights FROM airports JOIN flights ON airportcode = sourceairport GROUP BY city ORDER BY num_departing_flights DESC LIMIT 1
SELECT a.city, COUNT(f.sourceairport) AS freq FROM flights f INNER JOIN airports a ON f.sourceairport = a.airportcode GROUP BY f.sourceairport ORDER BY freq DESC LIMIT 1
SELECT destairport, COUNT(*) AS num_flights FROM flights GROUP BY destairport ORDER BY num_flights DESC LIMIT 1
SELECT A.airportcode FROM (SELECT destairport, COUNT(*) AS num_flights FROM flights GROUP BY destairport ORDER BY num_flights DESC LIMIT 1) A
SELECT airportcode FROM flights GROUP BY destairport HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM flights GROUP BY destairport)) LIMIT 1
SELECT a.airportcode FROM airports a JOIN flights f ON a.airportcode = f.destairport GROUP BY a.airportcode ORDER BY COUNT(*) LIMIT 1
SELECT a.airline FROM (SELECT airline, COUNT(*) AS flight_count FROM flights GROUP BY airline) a ORDER BY a.flight_count DESC LIMIT 1
SELECT airline FROM flights GROUP BY airline HAVING COUNT(*) = (SELECT MAX(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM flights GROUP BY airline))
SELECT abbreviation, country FROM airlines WHERE ROWID = (SELECT ROWID FROM (SELECT ROWID, COUNT(*) as cnt FROM flights GROUP BY airline ORDER BY cnt ASC LIMIT 1))
SELECT abbreviation, country FROM airlines WHERE abbreviation = ( SELECT abbreviation FROM airlines JOIN flights ON flights.airline = airlines.airline GROUP BY airline ORDER BY COUNT(*) LIMIT 1 OFFSET 0 )
SELECT airline FROM flights WHERE sourceairport = 'AHD' AND EXISTS (SELECT 1 FROM flights INNER JOIN airports ON flights.sourceairport = airports.airportcode WHERE flights.airline = airline AND airports.airportcode = 'AHD')
SELECT airline FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND sourceairport = 'AHD'
SELECT a.airline FROM flights f, airlines a WHERE f.airline = a.airline AND f.destairport = 'AHD'
SELECT airline FROM flights WHERE destairport = 'AHD' UNION ALL SELECT airline FROM flights WHERE destairport = 'AHD'
SELECT a.airline FROM (SELECT DISTINCT airline FROM flights WHERE destairport = 'APG') a JOIN (SELECT DISTINCT airline FROM flights WHERE destairport = 'CVO') b ON a.airline = b.airline
SELECT airline FROM (SELECT airline, COUNT(DISTINCT sourceairport) AS dep_count FROM flights WHERE sourceairport IN ('APG', 'CVO') GROUP BY airline) AS sub WHERE sub.dep_count = 2
SELECT DISTINCT airline FROM flights WHERE sourceairport = 'CVO' EXCEPT SELECT airline FROM flights WHERE sourceairport = 'APG'
SELECT DISTINCT a.airline FROM flights a WHERE a.destairport = 'CVO' EXCEPT SELECT distinct b.airline FROM flights b WHERE b.sourceairport = 'APG'
SELECT a.airline FROM airlines a INNER JOIN flights f ON a.airline = f.airline GROUP BY a.airline HAVING COUNT(DISTINCT f.flightno) >= 10
SELECT airline FROM (SELECT airline, COUNT(*) AS num_flights FROM flights GROUP BY airline) WHERE num_flights >= 10
SELECT airline FROM flights GROUP BY airline HAVING COUNT(flightno < 200)
SELECT a.abbreviation FROM airlines a WHERE (SELECT COUNT(*) FROM flights WHERE airline = a.airline) < 200
SELECT flights.flightno FROM flights, airlines WHERE flights.airline = airlines.abbreviation AND airlines.airline = 'United Airlines'
SELECT flightno FROM flights INNER JOIN airlines ON flights.airline = airlines.abbreviation WHERE airlines.airline = 'United Airlines'
SELECT flightno FROM flights f, airports a WHERE f.sourceairport = a.airportcode AND a.airportname = 'APG'
SELECT f.flightno FROM flights f, airports a WHERE f.sourceairport = a.airportcode AND a.airportcode = 'APG'
SELECT f.flightno FROM flights f, airports a WHERE f.destairport = a.airportcode AND a.airportname = 'APG'
SELECT flightno FROM flights, airports WHERE flights.destairport = airports.airportcode AND airports.airportcode = 'APG'
SELECT f.flightno FROM flights f, airports a WHERE f.sourceairport = a.airportcode AND a.city = 'Aberdeen'
SELECT flightno FROM flights, airports WHERE flights.sourceairport = airports.airportcode AND airports.city = 'Aberdeen'
SELECT f.flightno FROM flights f INNER JOIN airports a ON f.destairport = a.airportcode WHERE a.city = 'Aberdeen'
SELECT flightno FROM flights WHERE destairport = 'Aberdeen'
SELECT COUNT(*) FROM flights, airports WHERE flights.destairport = airports.airportcode AND city IN ('Aberdeen', 'Abilene')
SELECT COUNT(flights.flightno) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city IN ('Aberdeen', 'Abilene')
SELECT a.airportname FROM airports a LEFT JOIN flights f1 ON a.airportcode = f1.sourceairport LEFT JOIN flights f2 ON a.airportcode = f2.destairport WHERE f1.sourceairport IS NULL AND f2.destairport IS NULL
SELECT airportname FROM airports WHERE NOT EXISTS (SELECT * FROM flights WHERE sourceairport = airportcode) AND NOT EXISTS (SELECT * FROM flights WHERE destairport = airportcode)
SELECT employee_id FROM employee ORDER BY employee_id ASC LIMIT 1
SELECT (SELECT COUNT(*) FROM employee) AS employee_count
SELECT name FROM employee WHERE age IS NOT NULL ORDER BY age ASC, name
SELECT name FROM employee ORDER BY age ASC
SELECT e.city, COUNT(e.employee_id) AS num_employees FROM employee e GROUP BY e.city ORDER BY e.city
SELECT e.city, COUNT(h.employee_id) FROM employee e INNER JOIN hiring h ON e.employee_id = h.employee_id GROUP BY e.city
SELECT DISTINCT e1.city FROM employee e1, employee e2 WHERE e1.age < 30 AND e1.city = e2.city AND e1.employee_id <> e2.employee_id
SELECT DISTINCT e1.city FROM employee e1, employee e2 WHERE e1.city = e2.city AND e1.age < 30 AND e2.age < 30 AND e1.employee_id <> e2.employee_id
SELECT location, COUNT(DISTINCT shop_id) AS num_shops FROM shop GROUP BY location HAVING COUNT(DISTINCT shop_id) > 0
SELECT s.location, num_shops FROM shop s INNER JOIN (SELECT location, COUNT(*) as num_shops FROM shop GROUP BY location) counts ON s.location = counts.location
SELECT manager_name, district FROM (SELECT * FROM shop ORDER BY number_products DESC LIMIT 1) AS s
SELECT s.manager_name, s.district FROM shop s JOIN (SELECT shop_id FROM hiring GROUP BY shop_id ORDER BY COUNT(*) DESC LIMIT 1) t ON s.shop_id = t.shop_id
SELECT MIN(number_products) AS min_products FROM shop UNION ALL SELECT MAX(number_products) AS max_products FROM shop
SELECT MIN(number_products) AS min_products, MAX(number_products) AS max_products FROM shop
SELECT s.name, s.location, s.district FROM shop s ORDER BY s.number_products DESC LIMIT 100
SELECT shop.name, shop.location, shop.district FROM shop ORDER BY shop.number_products DESC
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop) AND location IN (SELECT location FROM shop)
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT e.name FROM employee e WHERE EXISTS ( SELECT * FROM evaluation eval WHERE e.employee_id = eval.employee_id GROUP BY eval.employee_id HAVING COUNT(eval.employee_id) = ( SELECT MAX(count) FROM ( SELECT COUNT(employee_id) AS count FROM evaluation GROUP BY employee_id ) ) )
SELECT e.name FROM employee e WHERE EXISTS (SELECT * FROM evaluation ev WHERE ev.employee_id = e.employee_id GROUP BY ev.employee_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM evaluation GROUP BY employee_id)))
SELECT e.name FROM employee e, evaluation ev WHERE e.employee_id = ev.employee_id AND ev.bonus = (SELECT MAX(bonus) FROM evaluation)
SELECT name FROM employee WHERE employee_id = (SELECT employee_id FROM evaluation ORDER BY bonus DESC LIMIT 1)
SELECT name FROM employee EXCEPT SELECT e.name FROM employee e JOIN evaluation ev ON e.employee_id = ev.employee_id
SELECT e.name FROM employee e LEFT JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.employee_id IS NULL
SELECT s.name FROM shop s JOIN hiring h ON s.shop_id = h.shop_id GROUP BY s.name HAVING COUNT(h.employee_id) = (SELECT MAX(emp_count) FROM (SELECT shop_id, COUNT(employee_id) as emp_count FROM hiring GROUP BY shop_id))
SELECT name FROM shop GROUP BY shop_id ORDER BY COUNT(employee_id) DESC LIMIT 1
SELECT DISTINCT s.name FROM shop s LEFT JOIN hiring h ON s.shop_id = h.shop_id WHERE h.shop_id IS NULL
SELECT s.name FROM shop s LEFT JOIN hiring h ON s.shop_id = h.shop_id GROUP BY s.name HAVING COUNT(h.employee_id) = 0 AND COUNT(h.employee_id) = COUNT(h.is_full_time)
SELECT shop.name, COUNT(hiring.employee_id) as num_employees FROM hiring JOIN shop ON hiring.shop_id = shop.shop_id GROUP BY shop.name
SELECT s.name, e.num_employees FROM shop s LEFT JOIN (SELECT shop_id, COUNT(employee_id) AS num_employees FROM hiring GROUP BY shop_id) e ON s.shop_id = e.shop_id
SELECT SUM(e.bonus) FROM evaluation e
SELECT SUM(bonus) AS total_bonus FROM evaluation
SELECT shop_id, employee_id, start_from, is_full_time FROM hiring AS h
SELECT h.shop_id, h.employee_id, h.start_from, h.is_full_time FROM hiring h
SELECT s1.district FROM shop s1 JOIN shop s2 ON s1.district = s2.district WHERE s1.number_products < 3000 AND s2.number_products > 10000
SELECT district FROM shop WHERE number_products < 3000 AND district IN (SELECT district FROM shop WHERE number_products > 10000)
SELECT COUNT(DISTINCT location) AS num_locations FROM shop
SELECT COUNT( DISTINCT location ) AS num_locations FROM shop s
SELECT COUNT(*) FROM documents WHERE document_id IS NOT NULL
SELECT COUNT(*) AS document_count FROM documents GROUP BY document_id HAVING COUNT(*) > 0
SELECT document_id, document_name, document_description FROM documents
SELECT d.document_id, d.document_name, d.document_description FROM documents d
SELECT document_name, template_id FROM documents WHERE document_description LIKE '%w%' DISTINCT
SELECT document_name, templates.template_id FROM documents INNER JOIN templates ON documents.template_id = templates.template_id WHERE document_description LIKE '%w%'
SELECT d.document_id, d.template_id, d.document_description FROM documents d WHERE d.document_name = 'Robbin CV'
SELECT document_id, template_id, document_description FROM documents WHERE document_name = 'Robbin CV'
SELECT COUNT(DISTINCT T1.template_id) FROM templates T1 JOIN documents D ON T1.template_id = D.template_id
SELECT COUNT(*) AS num_templates_used FROM (SELECT DISTINCT templates.template_id FROM templates JOIN documents ON documents.template_id = templates.template_id)
SELECT COUNT(*) FROM documents WHERE template_id = (SELECT template_id FROM templates WHERE template_type_code = 'PPT')
SELECT COUNT(*) FROM documents INNER JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = 'PPT'
SELECT t.template_id, COUNT(p.document_id) AS num_documents FROM paragraphs p JOIN documents d ON p.document_id = d.document_id JOIN templates t ON d.template_id = t.template_id GROUP BY t.template_id
SELECT t.template_id, COUNT(d.document_id) AS num_documents FROM templates t JOIN documents d ON t.template_id = d.template_id GROUP BY t.template_id
SELECT template_id, template_type_code FROM documents GROUP BY template_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_id, template_type_code FROM templates GROUP BY template_id, template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT template_id FROM (SELECT template_id, COUNT(document_id) AS doc_count FROM documents GROUP BY template_id) WHERE doc_count > 1
SELECT template_id FROM templates WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id HAVING COUNT(*) > 1)
SELECT t.template_id FROM templates t LEFT JOIN documents d ON t.template_id = d.template_id WHERE d.document_id IS NULL
SELECT t.template_id FROM templates t LEFT JOIN documents d ON t.template_id = d.template_id WHERE d.template_id IS NULL
SELECT COUNT(1) AS total_templates FROM templates
SELECT COUNT(ALL template_id) FROM templates
SELECT t.template_id, t.version_number, t.template_type_code FROM templates t
SELECT t.template_id, t.version_number, t.template_type_code FROM templates t
SELECT DISTINCT templates.template_type_code FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
SELECT template_type_code FROM templates WHERE template_type_code IN (SELECT template_type_code FROM ref_template_types) UNION SELECT template_type_code FROM ref_template_types WHERE template_type_code IN (SELECT template_type_code FROM templates)
SELECT template_id FROM templates WHERE template_type_code = 'PP' LIMIT 10
SELECT template_id FROM templates WHERE template_type_code = 'PP' LIMIT 10
SELECT COUNT(*) FROM templates WHERE template_type_code = 'CV'
SELECT COUNT(*) FROM templates t, documents d WHERE t.template_id = d.template_id AND t.template_type_code = 'CV'
SELECT version_number, template_type_code FROM templates WHERE version_number > 5 LIMIT 1
SELECT DISTINCT version_number, template_type_code FROM templates WHERE version_number > 5
SELECT template_type_code, COUNT(template_id) AS num_templates FROM (SELECT * FROM templates GROUP BY template_type_code)
SELECT template_type_code, COUNT(template_id) as num_templates FROM templates GROUP BY template_type_code ORDER BY COUNT(template_id) DESC
SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code ORDER BY template_count DESC LIMIT 1
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT t.template_type_code FROM templates t WHERE (SELECT COUNT(template_id) FROM templates WHERE template_type_code = t.template_type_code) < 3
SELECT template_type_code FROM ref_template_types WHERE template_type_code IN (SELECT t1.template_type_code FROM ref_template_types t1 LEFT JOIN templates t2 ON t1.template_type_code = t2.template_type_code GROUP BY t1.template_type_code HAVING COUNT(t2.template_id) < 3)
SELECT version_number, template_type_code FROM templates WHERE version_number = (SELECT MIN(version_number) FROM templates) ORDER BY template_type_code ASC LIMIT 1
SELECT MIN(version_number) AS min_version, template_type_code FROM templates GROUP BY template_type_code ORDER BY template_type_code
SELECT template_type_code FROM templates WHERE template_id = (SELECT template_id FROM documents WHERE document_name = 'Data base')
SELECT t.template_type_code FROM documents d, templates t WHERE d.template_id = t.template_id AND d.document_name = 'Data base'
SELECT document_name FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'BK') UNION SELECT document_name FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'BK')
SELECT document_name FROM documents WHERE template_id = (SELECT template_id FROM templates WHERE template_type_code = 'BK')
SELECT t.template_type_code, (SELECT COUNT(*) FROM documents d WHERE d.template_id = t.template_id) AS document_count FROM templates t
SELECT template_type_code, (SELECT COUNT(*) FROM documents d WHERE d.template_id = t.template_id) AS num_documents FROM templates t
SELECT template_type_code, COUNT(document_id) AS num_docs FROM documents GROUP BY template_type_code ORDER BY num_docs DESC LIMIT 1
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT templates.template_type_code FROM ref_template_types LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code WHERE templates.template_type_code IS NULL
SELECT t.template_type_code FROM ref_template_types t LEFT JOIN templates tem ON t.template_type_code = tem.template_type_code LEFT JOIN documents d ON tem.template_id = d.template_id WHERE d.document_id IS NULL
SELECT template_type_code, template_type_description FROM ref_template_types
SELECT ref_template_types.template_type_code, template_type_description FROM templates JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
SELECT template_type_description FROM ref_template_types WHERE template_type_code = 'AD'
SELECT t.template_type_description FROM ref_template_types t WHERE t.template_type_code = 'AD'
SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Book' EXCEPT SELECT template_type_code FROM ref_template_types
SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Book' ORDER BY template_type_code LIMIT 1
SELECT DISTINCT rtt.template_type_description FROM ref_template_types rtt INNER JOIN templates t ON rtt.template_type_code = t.template_type_code INNER JOIN documents d ON t.template_id = d.template_id INNER JOIN paragraphs p ON d.document_id = p.document_id
SELECT DISTINCT template_type_description FROM ( SELECT t.template_type_description FROM templates t JOIN documents d ON t.template_id = d.template_id )
SELECT template_id FROM templates WHERE template_type_code = (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Presentation')
SELECT template_id FROM templates WHERE template_type_code = (SELECT template_type_code FROM ref_template_types WHERE template_type_description = 'Presentation')
SELECT COUNT(*) AS total_paragraphs FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id
SELECT 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 AS paragraph_count
SELECT COUNT(*) FROM documents d, paragraphs p WHERE d.document_id = p.document_id AND d.document_name = 'Summer Show'
SELECT COUNT(*) FROM paragraphs p, documents d WHERE p.document_id = d.document_id AND d.document_name = 'Summer Show'
SELECT paragraph_text FROM paragraphs WHERE paragraph_text = 'Korea' AND document_id = (SELECT document_id FROM documents WHERE document_name = 'Korea')
SELECT * FROM paragraphs p JOIN documents d ON p.document_id = d.document_id WHERE p.paragraph_text = 'Korea'
SELECT p.paragraph_id, p.paragraph_text FROM paragraphs p, documents d WHERE p.document_id = d.document_id AND d.document_name = 'Welcome to NY'
SELECT paragraph_id, paragraph_text FROM paragraphs WHERE document_id = (SELECT document_id FROM documents WHERE document_name = 'Welcome to NY') ORDER BY paragraph_id
SELECT paragraph_text FROM paragraphs WHERE document_id = (SELECT document_id FROM documents WHERE document_name = 'Customer reviews') LIMIT 100
SELECT paragraph_text FROM paragraphs p, documents d WHERE p.document_id = d.document_id AND d.document_name = 'Customer reviews'
SELECT document_id, (SELECT count(*) FROM paragraphs WHERE paragraphs.document_id = documents.document_id) AS paragraph_count FROM documents ORDER BY document_id
SELECT document_id, COUNT(*) as num_paragraphs FROM paragraphs GROUP BY document_id ORDER BY document_id
SELECT documents.document_id, documents.document_name, COUNT(paragraphs.paragraph_id) AS paragraph_count FROM documents LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id
SELECT documents.document_id, document_name, COUNT(paragraphs.paragraph_id) AS num_paragraphs FROM documents LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id, document_name
SELECT distinct document_id FROM paragraphs p1 WHERE 2 <= (SELECT count(*) FROM paragraphs p2 WHERE p1.document_id = p2.document_id)
SELECT document_id FROM documents GROUP BY document_id HAVING COUNT(*) >= 2
SELECT document_id, document_name FROM documents GROUP BY document_id, document_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT document_id, document_name FROM documents WHERE document_id = (SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(paragraph_id) DESC LIMIT 1)
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) LIMIT 1
SELECT document_id FROM paragraphs GROUP BY document_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT document_id FROM paragraphs GROUP BY document_id HAVING COUNT(paragraph_id) BETWEEN 1 AND 2
SELECT document_id FROM documents WHERE template_id IN (SELECT template_id FROM documents GROUP BY template_id HAVING COUNT(paragraph_id) BETWEEN 1 AND 2)
SELECT documents.document_id FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE paragraph_text IN ('Brazil', 'Ireland')
SELECT documents.document_id FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE paragraph_text = 'Brazil' INTERSECT SELECT documents.document_id FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id WHERE paragraph_text = 'Ireland'
SELECT COUNT(*) FROM (SELECT teacher_id FROM course_arrange GROUP BY teacher_id HAVING COUNT(course_id) > 0)
SELECT COUNT(*) FROM teacher
SELECT name FROM teacher ORDER BY age ASC
SELECT name FROM teacher GROUP BY age ORDER BY age ASC
SELECT age, hometown FROM teacher LIMIT 10
SELECT t.age, t.hometown FROM teacher t
SELECT name FROM teacher WHERE EXISTS (SELECT * FROM teacher t2 WHERE t2.teacher_id = teacher.teacher_id AND t2.hometown <> 'Little Lever Urban District')
SELECT name FROM teacher WHERE hometown <> 'Little Lever Urban District'
SELECT name FROM teacher WHERE age = 32 INTERSECT SELECT name FROM teacher WHERE age = 33
SELECT name FROM teacher WHERE age = 32 OR age = 33 INTERSECT SELECT name FROM teacher WHERE age = 33
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT hometown FROM teacher ORDER BY age ASC LIMIT 1
SELECT DISTINCT hometown, (SELECT COUNT(*) FROM teacher WHERE hometown = t.hometown) as num_teachers FROM teacher t
SELECT hometown, (SELECT COUNT(*) FROM teacher WHERE hometown = t.hometown) AS num_teachers FROM teacher t GROUP BY hometown
SELECT hometown, COUNT(hometown) AS num_teachers FROM teacher GROUP BY hometown ORDER BY num_teachers DESC LIMIT 1
SELECT TOP 1 hometown FROM teacher GROUP BY hometown ORDER BY COUNT(teacher_id) DESC
SELECT hometown FROM (SELECT hometown, COUNT(*) as num_teachers FROM teacher GROUP BY hometown) WHERE num_teachers >= 2
SELECT DISTINCT t1.hometown FROM teacher t1 JOIN teacher t2 ON t1.hometown = t2.hometown AND t1.teacher_id != t2.teacher_id
SELECT t.name, c.course FROM teacher t JOIN course_arrange ca ON t.teacher_id = ca.teacher_id JOIN course c ON ca.course_id = c.course_id
SELECT name, course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course_arrange.course_id = course.course_id
SELECT t.name, c.course FROM teacher t, course_arrange ca, course c WHERE t.teacher_id = ca.teacher_id AND ca.course_id = c.course_id ORDER BY t.name
SELECT t.name, c.course FROM teacher t, course_arrange ca, course c WHERE t.teacher_id = ca.teacher_id AND ca.course_id = c.course_id ORDER BY t.name
SELECT teacher.name FROM teacher, course_arrange, course WHERE teacher.teacher_id = course_arrange.teacher_id AND course_arrange.course_id = course.course_id AND course.course = 'Math' LIMIT 1
SELECT t.name FROM teacher t, course c, course_arrange ca WHERE t.teacher_id = ca.teacher_id AND c.course_id = ca.course_id AND c.course = 'Math'
SELECT name, (SELECT COUNT(*) FROM course_arrange WHERE course_arrange.teacher_id = teacher.teacher_id) AS course_count FROM teacher GROUP BY teacher.name
SELECT name, (SELECT COUNT(*) FROM course_arrange WHERE teacher_id = teacher.teacher_id) AS num_courses FROM teacher
SELECT name FROM (SELECT t.name, COUNT(ca.course_id) AS course_count FROM teacher t JOIN course_arrange ca ON t.teacher_id = ca.teacher_id GROUP BY t.teacher_id) AS sub WHERE course_count >= 2
SELECT name FROM teacher t WHERE (SELECT COUNT(*) FROM course_arrange WHERE teacher_id = t.teacher_id) >= 2
SELECT t.name FROM teacher t LEFT JOIN course_arrange ca ON t.teacher_id = ca.teacher_id WHERE ca.teacher_id IS NULL
SELECT DISTINCT t.name FROM teacher t LEFT JOIN course_arrange ca ON t.teacher_id = ca.teacher_id WHERE ca.teacher_id IS NULL
SELECT COUNT(age) FROM visitor WHERE age < 30
SELECT name FROM visitor WHERE level_of_membership > 4 ORDER BY level_of_membership DESC
SELECT AVG(age) FROM visitor WHERE level_of_membership <= 4
SELECT name, level_of_membership FROM visitor WHERE level_of_membership > 4 ORDER BY age DESC, name ASC
SELECT museum_id, name FROM museum ORDER BY num_of_staff DESC LIMIT 1
SELECT AVG(num_of_staff) as average_staff FROM museum WHERE strftime('%Y', open_year) < '2009'
SELECT open_year, num_of_staff FROM museum WHERE name = 'Plaza Museum'
SELECT name FROM museum WHERE open_year > 2010 AND num_of_staff > (SELECT MIN(num_of_staff) FROM museum WHERE open_year > 2010)
SELECT DISTINCT v.id, v.name, v.age FROM visitor v INNER JOIN visit vi ON v.id = vi.visitor_id GROUP BY v.id, v.name, v.age HAVING COUNT(vi.museum_id) > 1
SELECT v.id, v.name, v.level_of_membership FROM visitor v WHERE v.id = (SELECT visitor_id FROM visit GROUP BY visitor_id ORDER BY SUM(total_spent) DESC LIMIT 1)
SELECT m.museum_id, m.name FROM museum m JOIN (SELECT museum_id, COUNT(*) AS visit_count FROM visit GROUP BY museum_id ORDER BY visit_count DESC LIMIT 1) v ON m.museum_id = v.museum_id
SELECT m.name FROM museum m LEFT JOIN visit v ON m.museum_id = v.museum_id WHERE v.museum_id IS NULL
SELECT name, age FROM visitor WHERE id = (SELECT visitor_id FROM visit GROUP BY visitor_id HAVING SUM(num_of_ticket) = (SELECT MAX(total_tickets) FROM (SELECT visitor_id, SUM(num_of_ticket) as total_tickets FROM visit GROUP BY visitor_id)))
SELECT AVG(num_of_ticket), MAX(num_of_ticket) FROM visit
SELECT SUM(visit.num_of_ticket) FROM visit JOIN visitor ON visit.visitor_id = visitor.id WHERE visitor.level_of_membership = 1
SELECT v.name FROM visitor v JOIN visit vi1 ON v.id = vi1.visitor_id JOIN visit vi2 ON vi1.visitor_id = vi2.visitor_id JOIN museum m1 ON vi1.museum_id = m1.museum_id JOIN museum m2 ON vi2.museum_id = m2.museum_id WHERE m1.open_year < 2009 AND m2.open_year > 2011
SELECT COUNT(*) FROM (SELECT visitor_id, count(DISTINCT museum_id) AS num_museums_visited FROM visit GROUP BY visitor_id HAVING max(open_year) <= 2010)
SELECT COUNT(*) FROM museum WHERE open_year > 2013 EXCEPT SELECT COUNT(*) FROM museum WHERE open_year <= 2008
SELECT COUNT(*) FROM players
SELECT AVG(player_id) FROM players
SELECT TOTAL(MATCH_NUM) FROM MATCHES
SELECT COUNT(match_num) FROM matches
SELECT p.first_name, p.birth_date FROM players p WHERE country_code = 'USA'
SELECT DISTINCT p.first_name, p.birth_date FROM players p, matches m WHERE p.player_id = m.winner_id AND m.winner_ioc = 'USA'
SELECT AVG(winner_age) as average_winner_age FROM matches UNION SELECT AVG(loser_age) as average_loser_age FROM matches
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches
SELECT AVG(ranking) FROM players p JOIN matches m ON p.player_id = m.winner_id JOIN rankings r ON p.player_id = r.player_id
SELECT AVG(ranking) FROM rankings r JOIN matches m ON r.player_id = m.winner_id
SELECT MAX(ranking) AS highest_rank FROM rankings WHERE player_id = (SELECT loser_id FROM matches ORDER BY loser_rank DESC LIMIT 1)
SELECT ranking FROM rankings WHERE player_id = (SELECT loser_id FROM matches WHERE loser_rank = (SELECT MIN(loser_rank) FROM matches))
SELECT COUNT(DISTINCT p.country_code) FROM players p
SELECT COUNT(DISTINCT country_code) FROM (SELECT DISTINCT country_code FROM players GROUP BY country_code)
SELECT COUNT(DISTINCT p.last_name) FROM players p INNER JOIN matches m ON p.player_id = m.loser_id
SELECT COUNT(loser_name) FROM (SELECT loser_name FROM matches GROUP BY loser_name)
SELECT m.tourney_name FROM (SELECT tourney_name, COUNT(*) as match_count FROM matches GROUP BY tourney_name) as m WHERE m.match_count > 10
SELECT DISTINCT tourney_name FROM matches WHERE tourney_id IN (SELECT tourney_id FROM matches GROUP BY tourney_id HAVING COUNT(match_num) > 10)
SELECT p.first_name, p.last_name FROM players p WHERE player_id IN (SELECT winner_id FROM matches WHERE year = 2013) AND player_id IN (SELECT winner_id FROM matches WHERE year = 2016)
SELECT first_name, last_name FROM players WHERE player_id IN ( SELECT winner_id FROM matches WHERE year = 2013 ) INTERSECT SELECT first_name, last_name FROM players WHERE player_id IN ( SELECT winner_id FROM matches WHERE year = 2016 )
SELECT SUM(CASE WHEN year = 2013 OR year = 2016 THEN 1 ELSE 0 END) FROM matches
SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016 HAVING COUNT(year) > 0
SELECT country_code, first_name FROM (SELECT p.country_code, p.first_name, m.tourney_name FROM players p JOIN matches m ON p.player_id = m.winner_id) AS result GROUP BY country_code, first_name HAVING COUNT(DISTINCT tourney_name) = 2
SELECT p.first_name, p.country_code FROM players p WHERE EXISTS (SELECT 1 FROM matches m1 WHERE p.player_id = m1.winner_id AND m1.tourney_name = 'WTA Championships') AND EXISTS (SELECT 1 FROM matches m2 WHERE p.player_id = m2.winner_id AND m2.tourney_name = 'Australian Open')
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, country_code FROM players ORDER BY birth_date LIMIT 1
SELECT first_name, last_name FROM players ORDER BY birth_date ASC
SELECT first_name || ' ' || last_name AS full_name FROM players ORDER BY birth_date DESC, first_name ASC, last_name ASC
SELECT first_name, last_name FROM players WHERE hand = 'L' ORDER BY birth_date
SELECT first_name || ' ' || last_name AS full_name FROM players WHERE hand = 'left' ORDER BY birth_date ASC
SELECT p.first_name, p.country_code FROM players p JOIN matches m ON p.player_id = m.winner_id GROUP BY p.player_id ORDER BY COUNT(m.tours) DESC LIMIT 1
SELECT first_name, country_code FROM players WHERE player_id = (SELECT player_id FROM rankings GROUP BY player_id ORDER BY COUNT(DISTINCT tours) DESC LIMIT 1)
SELECT year FROM (SELECT year, count(*) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC) LIMIT 1
SELECT year, (SELECT COUNT(DISTINCT match_num) FROM matches m2 WHERE m2.year = matches.year) as num_matches FROM matches GROUP BY year ORDER BY num_matches DESC LIMIT 1
SELECT winner_name, winner_rank_points FROM matches JOIN players ON matches.winner_id = players.player_id GROUP BY winner_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT winner_name, max_rank_points FROM (SELECT winner_name, MAX(winner_rank_points) AS max_rank_points FROM matches GROUP BY winner_name) AS subquery ORDER BY max_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE tourney_name = 'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1
SELECT winner_name FROM matches WHERE winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches WHERE tourney_name = 'Australian Open')
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT winner_name, loser_name FROM matches ORDER BY minutes DESC LIMIT 1
SELECT p.first_name, AVG(r.ranking) AS average_ranking FROM players p, rankings r WHERE p.player_id = r.player_id GROUP BY p.first_name
SELECT p.first_name, AVG(r.ranking) AS avg_ranking FROM players p JOIN rankings r ON p.player_id = r.player_id GROUP BY p.first_name
SELECT first_name, SUM(ranking_points) AS total_ranking_points FROM players INNER JOIN (SELECT player_id, SUM(ranking_points) AS ranking_points FROM rankings GROUP BY player_id) AS subquery ON players.player_id = subquery.player_id
SELECT p.first_name, SUM(r.ranking_points) AS total_points FROM players p, rankings r WHERE p.player_id = r.player_id GROUP BY p.first_name
SELECT country_code, count(player_id) as player_count FROM players GROUP BY country_code ORDER BY player_count DESC
SELECT country_code, (SELECT COUNT(DISTINCT player_id) FROM players p2 WHERE p2.country_code = p.country_code) as player_count FROM players p GROUP BY country_code
SELECT P.country_code FROM players P LEFT JOIN ( SELECT country_code, COUNT(player_id) AS num_players FROM players GROUP BY country_code ORDER BY num_players DESC LIMIT 1 ) sub ON P.country_code = sub.country_code WHERE sub.num_players = (SELECT MAX(num_players) FROM (SELECT COUNT(player_id) AS num_players FROM players GROUP BY country_code))
SELECT country_code, COUNT(player_id) AS player_count FROM players GROUP BY country_code ORDER BY player_count DESC LIMIT 1
SELECT DISTINCT country_code FROM players p1 WHERE (SELECT COUNT(*) FROM players p2 WHERE p1.country_code = p2.country_code) > 50
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(DISTINCT player_id) > 50
SELECT ranking_date, COUNT(DISTINCT tours) AS total_tours FROM rankings GROUP BY ranking_date ORDER BY ranking_date
SELECT ranking_date, COUNT(DISTINCT tours) AS total_tours FROM rankings GROUP BY ranking_date ORDER BY ranking_date
SELECT year, (SELECT count(match_num) FROM matches m2 WHERE m2.year = m.year) as num_matches FROM matches m GROUP BY year
SELECT year, count(match_num) as num_matches FROM matches GROUP BY year
SELECT first_name || ' ' || last_name AS winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id ORDER BY winner_age LIMIT 3
SELECT winner_name, winner_rank FROM matches ORDER BY winner_age LIMIT 3
SELECT COUNT(DISTINCT m.winner_id) FROM matches m JOIN players p ON m.winner_id = p.player_id JOIN rankings r ON p.player_id = r.player_id WHERE tourney_name = 'WTA Championships' AND p.hand = 'L'
SELECT COUNT(DISTINCT winner_id) FROM matches WHERE winner_hand = 'L' AND tourney_name = 'WTA Championships'
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM (SELECT winner_id, MAX(winner_rank_points) AS max_rank FROM matches) WHERE winner_rank_points = max_rank)
SELECT first_name, country_code, birth_date FROM players WHERE player_id = (SELECT winner_id FROM matches GROUP BY winner_id ORDER BY SUM(winner_rank_points) DESC LIMIT 1)
SELECT hand, COUNT(player_id) AS player_count FROM players GROUP BY hand ORDER BY player_count DESC
SELECT hand, COUNT(player_id) AS player_count FROM players GROUP BY hand ORDER BY player_count DESC
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'Captured' GROUP BY disposition_of_ship
SELECT name, tonnage FROM ship ORDER BY name DESC, tonnage
SELECT b.name AS battle_name, b.date AS battle_date, b.result AS battle_result FROM battle b
SELECT MAX(injured) AS max_death_toll, MIN(injured) AS min_death_toll FROM death GROUP BY caused_by_ship_id, note
SELECT AVG(injured * 1.0) FROM death
SELECT * FROM death d, ship s WHERE d.caused_by_ship_id = s.id AND s.tonnage = 't'
SELECT name, result FROM battle WHERE instr(bulgarian_commander, 'Boril') = 0
SELECT id, name FROM battle WHERE id IN (SELECT lost_in_battle FROM ship WHERE ship_type = 'Brig') INTERSECT SELECT id, name FROM battle WHERE id IN (SELECT caused_by_ship_id FROM death)
SELECT id, name FROM battle WHERE id IN (SELECT caused_by_ship_id FROM death WHERE caused_by_ship_id = ship.id AND killed > 10)
SELECT ship.id, ship.name FROM ship JOIN ( SELECT caused_by_ship_id, SUM(injured) AS total_injuries FROM death GROUP BY caused_by_ship_id ORDER BY total_injuries DESC LIMIT 1 ) AS max_injuries ON ship.id = max_injuries.caused_by_ship_id
SELECT DISTINCT name FROM battle WHERE bulgarian_commander = 'Kaloyan' ORDER BY name LIMIT 10
SELECT COUNT(DISTINCT result) AS num_results FROM battle
SELECT COUNT(*) FROM battle b LEFT JOIN (SELECT DISTINCT lost_in_battle FROM ship WHERE tonnage = '225') s ON b.id = s.lost_in_battle WHERE s.lost_in_battle IS NULL
SELECT b.name, b.date FROM battle b JOIN ship s ON s.lost_in_battle = b.id WHERE s.name = 'Lettice' UNION SELECT b.name, b.date JOIN ship s ON s.lost_in_battle = b.id WHERE s.name = 'HMS Atalanta'
SELECT b.name, b.result, b.bulgarian_commander FROM battle b LEFT JOIN (SELECT lost_in_battle FROM ship WHERE location = 'English Channel') s ON b.id = s.lost_in_battle WHERE s.lost_in_battle IS NULL
SELECT note FROM death WHERE SUBSTR(note,INSTR(note,'East'),LENGTH('East')) = 'East'
SELECT line_1, line_2 FROM addresses GROUP BY line_1, line_2
SELECT a.line_1, a.line_2 FROM addresses a, addresses b WHERE a.address_id = b.address_id
SELECT COUNT(*) FROM courses
SELECT COUNT(course_id) FROM courses
SELECT course_description FROM courses WHERE course_name = 'math'
SELECT course_description FROM courses WHERE course_id = (SELECT course_id FROM sections WHERE section_name = 'math' GROUP BY course_id HAVING COUNT(*) > 0)
SELECT zip_postcode FROM addresses WHERE city = 'Port Chelsea' INTERSECT SELECT zip_postcode FROM addresses WHERE city = 'Port Chelsea'
SELECT zip_postcode FROM addresses WHERE city = 'Port Chelsea' INTERSECT SELECT zip_postcode FROM addresses WHERE city = 'Port Chelsea'
SELECT d.department_id, d.department_name FROM departments d JOIN ( SELECT department_id, COUNT(*) as degree_count FROM degree_programs GROUP BY department_id ORDER BY degree_count DESC LIMIT 1 ) dp ON d.department_id = dp.department_id
SELECT d.department_id, d.department_name FROM departments d JOIN degree_programs dp ON d.department_id = dp.department_id GROUP BY d.department_id ORDER BY COUNT(dp.degree_program_id) DESC LIMIT 1
SELECT COUNT(DISTINCT department_id) FROM degree_programs UNION SELECT COUNT(*) FROM departments
SELECT COUNT(DISTINCT department_id) FROM degree_programs UNION SELECT COUNT(DISTINCT department_id) FROM departments
SELECT COUNT(*) FROM (SELECT DISTINCT degree_summary_name FROM degree_programs) as counts
SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs WHERE department_id IS NOT NULL
SELECT COUNT(*) FROM degree_programs JOIN departments ON degree_programs.department_id = departments.department_id WHERE department_name = 'engineering'
SELECT COUNT(*) FROM degree_programs JOIN departments ON degree_programs.department_id = departments.department_id WHERE department_name = 'engineering'
SELECT section_name, section_description FROM sections
SELECT section_name, section_description FROM sections
SELECT course_id, course_name FROM courses WHERE course_id IN (SELECT course_id FROM sections GROUP BY course_id HAVING COUNT(*) <= 2)
SELECT c.course_name, c.course_id FROM courses c LEFT JOIN (SELECT course_id, COUNT(section_id) AS num_sections FROM sections GROUP BY course_id) s ON c.course_id = s.course_id WHERE num_sections < 2 OR num_sections IS NULL
SELECT section_name FROM sections GROUP BY section_name HAVING COUNT(section_name) > 0 ORDER BY section_name DESC
SELECT section_name FROM sections ORDER BY section_name DESC LIMIT 10
SELECT semester_id, semester_name FROM semesters WHERE semester_id = (SELECT semester_id FROM student_enrolment GROUP BY semester_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT semester_id, semester_name FROM semesters WHERE semester_id = ( SELECT semester_id FROM student_enrolment GROUP BY semester_id ORDER BY COUNT(student_enrolment_id) DESC LIMIT 1 )
SELECT department_description FROM departments WHERE SUBSTR(department_name, 0, 8) = 'Computer'
SELECT department_description FROM departments WHERE department_name = 'Computer Science'
SELECT s.first_name, s.middle_name, s.last_name, se.student_id FROM students s JOIN student_enrolment se ON s.student_id = se.student_id WHERE (SELECT COUNT(DISTINCT degree_program_id) FROM student_enrolment se2 WHERE se2.student_id = s.student_id AND se2.semester_id = se.semester_id) = 2
SELECT s.student_id, s.first_name, s.middle_name, s.last_name FROM students s INNER JOIN student_enrolment se ON s.student_id = se.student_id WHERE (SELECT COUNT(DISTINCT degree_program_id) FROM student_enrolment WHERE student_id = s.student_id) = 2
SELECT s.first_name, s.middle_name, s.last_name FROM students s INNER JOIN student_enrolment se ON s.student_id = se.student_id INNER JOIN degree_programs d ON se.degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor')
SELECT first_name, middle_name, last_name FROM students, student_enrolment, degree_programs WHERE students.student_id = student_enrolment.student_id AND student_enrolment.degree_program_id = degree_programs.degree_program_id AND degree_summary_name = 'Bachelors'
SELECT degree_summary_name, COUNT(student_enrolment_id) as num_students_enrolled FROM student_enrolment se JOIN degree_programs dp ON se.degree_program_id = dp.degree_program_id GROUP BY degree_summary_name ORDER BY num_students_enrolled DESC LIMIT 1
SELECT degree_summary_name FROM degree_programs ORDER BY (SELECT COUNT(*) FROM student_enrolment WHERE student_enrolment.degree_program_id = degree_programs.degree_program_id) DESC LIMIT 1
SELECT degree_program_id, degree_summary_name FROM degree_programs WHERE degree_program_id = (SELECT degree_program_id FROM (SELECT degree_program_id, COUNT(*) as enrol_count FROM student_enrolment GROUP BY degree_program_id ORDER BY enrol_count DESC LIMIT 1) AS subquery)
SELECT degree_program_id, degree_summary_name FROM student_enrolment JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE student_enrolment.degree_program_id = (SELECT degree_program_id FROM student_enrolment GROUP BY degree_program_id ORDER BY COUNT(student_id) DESC LIMIT 1)
SELECT student_id, first_name, middle_name, last_name, (SELECT COUNT(*) FROM student_enrolment WHERE student_id = students.student_id) AS number_of_enrollments FROM students ORDER BY number_of_enrollments DESC LIMIT 1
SELECT s.student_id, s.first_name, s.middle_name, s.last_name, MAX(enrolment_count) AS max_enrolment_count FROM students s JOIN ( SELECT student_id, COUNT(*) AS enrolment_count FROM student_enrolment GROUP BY student_id ) sub ON s.student_id = sub.student_id
SELECT semester_name FROM semesters s LEFT JOIN student_enrolment se ON s.semester_id = se.semester_id WHERE se.student_enrolment_id IS NULL
SELECT s.semester_name FROM semesters s LEFT JOIN student_enrolment se ON s.semester_id = se.semester_id WHERE se.student_id IS NULL
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_enrolment_courses WHERE student_enrolment_id IN (SELECT student_enrolment_id FROM student_enrolment WHERE degree_program_id IS NOT NULL))
SELECT course_name FROM courses INNER JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM courses WHERE course_id = ( SELECT course_id FROM ( SELECT course_id, COUNT(*) AS enroll_count FROM student_enrolment_courses GROUP BY course_id ORDER BY enroll_count DESC LIMIT 1 ) )
SELECT course_name FROM courses GROUP BY course_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id LEFT JOIN student_enrolment ON students.student_id = student_enrolment.student_id WHERE state_province_county = 'North Carolina' AND degree_program_id IS NULL
SELECT s.last_name FROM students s JOIN addresses a ON s.permanent_address_id = a.address_id LEFT JOIN student_enrolment se ON s.student_id = se.student_id WHERE a.state_province_county = 'North Carolina' AND se.student_id IS NULL
SELECT transcript_date, transcript_id FROM transcripts t WHERE (SELECT COUNT(course_id) FROM student_enrolment_courses sec WHERE t.transcript_id = sec.transcript_id) >= 2
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id IN (SELECT s.transcript_id FROM (SELECT transcript_id, COUNT(course_id) as course_count FROM student_enrolment_courses GROUP BY transcript_id) s WHERE s.course_count >= 2)
SELECT s.cell_mobile_number FROM students s WHERE s.first_name = 'Timmothy' AND s.last_name = 'Ward'
SELECT a.cell_mobile_number FROM students a WHERE a.first_name = 'Timmothy' AND a.last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM students WHERE student_id = (SELECT student_id FROM student_enrolment ORDER BY date_first_registered ASC, student_id ASC FETCH FIRST ROW ONLY)
SELECT MIN(first_name), MIN(middle_name), MIN(last_name) FROM students
SELECT first_name, middle_name, last_name FROM students ORDER BY date_left LIMIT 1
SELECT s.first_name, s.middle_name, s.last_name FROM students s, student_enrolment se WHERE s.student_id = se.student_id ORDER BY se.semester_id LIMIT 1
SELECT s.first_name FROM students s JOIN addresses pa ON s.permanent_address_id = pa.address_id JOIN addresses ca ON s.current_address_id = ca.address_id WHERE pa.line_1 || pa.line_2 || pa.line_3 || pa.city <> ca.line_1 || ca.line_2 || ca.line_3 || ca.city
SELECT first_name FROM students WHERE EXISTS (SELECT * FROM addresses AS permanent WHERE students.permanent_address_id = permanent.address_id AND EXISTS (SELECT * FROM addresses AS current WHERE students.current_address_id = current.address_id AND permanent.address_id <> current.address_id ) )
SELECT a.address_id, a.line_1, a.line_2, a.line_3 FROM addresses a WHERE a.address_id = ( SELECT current_address_id FROM students GROUP BY current_address_id ORDER BY COUNT(student_id) DESC LIMIT 1 )
SELECT a.address_id, a.line_1, a.line_2 FROM addresses a INNER JOIN students s ON a.address_id = s.permanent_address_id GROUP BY a.address_id, a.line_1, a.line_2 ORDER BY COUNT(*) DESC LIMIT 1
SELECT AVG(julianday(transcript_date) * 86400.0) FROM transcripts
SELECT AVG(DATE(transcript_date)) FROM transcripts
SELECT MIN(transcript_date) AS first_transcript_date, MAX(other_details) AS details FROM transcripts
SELECT t1.transcript_date AS earliest_release_date, t1.other_details FROM transcripts t1 WHERE t1.transcript_date = (SELECT MIN(t2.transcript_date) FROM transcripts t2)
SELECT COUNT(*) FROM transcripts
SELECT GROUP_CONCAT(transcript_id) FROM transcripts
SELECT TOP 1 transcript_date FROM transcripts ORDER BY transcript_date DESC
SELECT transcript_date FROM transcripts ORDER BY transcript_date DESC LIMIT 1
SELECT student_enrolment_id, COUNT(transcript_id) AS enrollment_count FROM student_enrolment_courses INNER JOIN transcripts ON student_enrolment_courses.student_enrolment_id = transcripts.student_enrolment_id GROUP BY student_enrolment_id ORDER BY enrollment_count DESC LIMIT 1
SELECT course_id, enrollment_id FROM (SELECT course_id, student_enrolment_id as enrollment_id, RANK() OVER (PARTITION BY course_id ORDER BY count(*) DESC) as ranking FROM student_enrolment_courses GROUP BY course_id, enrollment_id) as ranked WHERE ranking = 1
SELECT t.transcript_id, t.transcript_date FROM transcripts t JOIN transcript_contents tc ON t.transcript_id = tc.transcript_id GROUP BY t.transcript_id, t.transcript_date ORDER BY COUNT(tc.transcript_id) LIMIT 1
SELECT transcript_id, transcript_date FROM transcripts ORDER BY (SELECT COUNT(*) FROM transcript_contents WHERE transcript_contents.transcript_id = transcripts.transcript_id) ASC LIMIT 1
SELECT se1.semester_name FROM semesters se1 INNER JOIN student_enrolment as se2 ON se1.semester_id = se2.semester_id WHERE se2.degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Master') AND se1.semester_id IN (SELECT semester_id FROM student_enrolment WHERE degree_program_id = (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelor'))
SELECT semester_id FROM student_enrolment WHERE degree_program_id = 'Masters' AND semester_id IN (SELECT semester_id FROM student_enrolment WHERE degree_program_id = 'Bachelors')
SELECT COUNT(DISTINCT current_address_id) FROM students WHERE current_address_id IS NOT NULL
SELECT a.line_1, a.line_2, a.line_3 FROM addresses a, students s WHERE a.address_id = s.current_address_id OR a.address_id = s.permanent_address_id
SELECT last_name, first_name, current_address_id FROM students ORDER BY last_name DESC
SELECT last_name, first_name FROM students ORDER BY last_name DESC
SELECT section_name FROM sections WHERE section_id = 'h' ORDER BY section_name
SELECT section_description FROM sections WHERE section_name = 'h'
SELECT first_name FROM students WHERE permanent_address_id = (SELECT address_id FROM addresses WHERE country = 'Haiti')
SELECT s.first_name FROM students s JOIN addresses a ON s.permanent_address_id = a.address_id WHERE a.country = 'Haiti' UNION SELECT s1.first_name FROM students s1 WHERE s1.cell_mobile_number = '09700166582'
SELECT title FROM cartoon GROUP BY title HAVING COUNT(title) >= 1 ORDER BY title
SELECT title FROM cartoon ORDER BY title ASC
SELECT c.title FROM cartoon c, tv_channel t WHERE c.channel = t.id AND t.directed_by = 'Ben Jones'
SELECT DISTINCT(title) FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT COUNT(1) FROM cartoon WHERE written_by = 'Joseph Kuhr'
SELECT COUNT(*) FROM cartoon WHERE written_by = 'Joseph Kuhr' HAVING COUNT(*) > 0
SELECT cartoon.title, cartoon.directed_by FROM cartoon ORDER BY cartoon.original_air_date ASC
SELECT title, directed_by FROM cartoon WHERE channel IN (SELECT id FROM tv_channel) ORDER BY original_air_date
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones' EXCEPT SELECT title FROM cartoon WHERE directed_by != 'Brandon Vietti'
SELECT title FROM cartoon WHERE directed_by = 'Ben Jones' EXCEPT SELECT title FROM cartoon WHERE directed_by != 'Brandon Vietti'
SELECT c.country, (SELECT COUNT(*) FROM tv_channel WHERE country = c.country) AS num_channels FROM tv_channel c ORDER BY num_channels DESC LIMIT 1
SELECT country, num_channels FROM (SELECT country, COUNT(*) as num_channels FROM tv_channel GROUP BY country ORDER BY num_channels DESC LIMIT 1)
SELECT COUNT(DISTINCT series_name) AS num_series, COUNT(DISTINCT content) AS num_content FROM tv_channel
SELECT COUNT(DISTINCT series_name) AS total_series, (SELECT COUNT(DISTINCT content) FROM tv_channel GROUP BY content) AS total_content FROM tv_channel
SELECT content FROM tv_channel WHERE series_name = 'Sky Radio' EXCEPT SELECT content FROM cartoon WHERE channel = (SELECT id FROM tv_channel WHERE series_name = 'Sky Radio')
SELECT content FROM tv_channel JOIN tv_series ON tv_channel.id = tv_series.channel WHERE tv_channel.series_name = 'Sky Radio'
SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio' EXCEPT SELECT package_option FROM tv_channel WHERE series_name = 'Sky Radio'
SELECT package_option FROM tv_channel WHERE id = (SELECT channel FROM tv_series WHERE series_name = 'Sky Radio') AND id = (SELECT channel FROM cartoon WHERE series_name = 'Sky Radio')
SELECT language, COUNT(language) FROM tv_channel WHERE language = 'English'
SELECT COUNT(language) FROM tv_channel WHERE language = 'English'
SELECT language, MIN(num_channels) AS num_channels FROM ( SELECT language, COUNT(*) AS num_channels FROM tv_channel GROUP BY language ) ORDER BY num_channels
SELECT language, MIN(channel_count) as min_channels FROM (SELECT language, COUNT(id) as channel_count FROM tv_channel GROUP BY language)
SELECT language, COUNT(language) AS num_channels FROM tv_channel GROUP BY language ORDER BY num_channels DESC
SELECT DISTINCT language, (SELECT COUNT(*) FROM tv_channel WHERE language = t.language) AS num_channels FROM tv_channel t ORDER BY language
SELECT series_name FROM cartoon, tv_channel WHERE cartoon.channel = tv_channel.id AND cartoon.title = 'The Rise of the Blue Beetle!'
SELECT series_name FROM tv_series, tv_channel, cartoon WHERE cartoon.channel = tv_channel.id AND tv_series.channel = tv_channel.id AND cartoon.title = 'The Rise of the Blue Beetle!'
SELECT c.title FROM cartoon c INNER JOIN tv_channel tc ON c.channel = tc.id WHERE tc.series_name = 'Sky Radio'
SELECT title FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE tv_channel.series_name = 'Sky Radio'
SELECT episode FROM tv_series WHERE rating IS NOT NULL ORDER BY rating
SELECT episode FROM tv_series ORDER BY rating DESC, episode
SELECT episode, rating FROM tv_series WHERE rating IN (SELECT rating FROM tv_series ORDER BY rating DESC LIMIT 3) ORDER BY rating DESC
SELECT episode, rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT MIN(share) AS min_share, MAX(share) AS max_share FROM tv_series
SELECT MAX(share) AS max_share, MIN(share) AS min_share FROM tv_series
SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime' ORDER BY air_date LIMIT 1
SELECT air_date FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT weekly_rank FROM tv_series WHERE episode = 'A Love of a Lifetime'
SELECT weekly_rank FROM tv_series WHERE episode = 'A Love of a Lifetime' AND air_date = (SELECT MAX(air_date) FROM tv_series WHERE episode = 'A Love of a Lifetime')
SELECT series_name FROM tv_channel WHERE id = (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime')
SELECT series_name FROM tv_channel WHERE id = (SELECT channel FROM tv_series WHERE episode = 'A Love of a Lifetime')
SELECT tv_series.episode FROM tv_series, tv_channel WHERE tv_series.channel = tv_channel.id AND tv_channel.series_name = 'Sky Radio'
SELECT episode FROM tv_series INNER JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE series_name = 'Sky Radio'
SELECT directed_by, COUNT(*) AS cartoon_count FROM cartoon GROUP BY directed_by ORDER BY cartoon_count DESC
SELECT c.directed_by, COUNT(c.id) AS cartoon_count FROM cartoon c GROUP BY c.directed_by
SELECT production_code, channel FROM cartoon WHERE air_date = (SELECT MAX(air_date) FROM (SELECT * FROM cartoon) AS c INNER JOIN tv_series ON c.id = tv_series.id INNER JOIN tv_channel ON tv_series.channel = tv_channel.id)
SELECT c.production_code, c.channel FROM cartoon c WHERE c.title = (SELECT title FROM cartoon ORDER BY date(air_date) DESC LIMIT 1)
SELECT package_option, series_name FROM tv_channel WHERE high_definition_tv = 1
SELECT t.package_option, t.series_name FROM (SELECT * FROM tv_channel WHERE hight_definition_tv = 'Yes') AS t
SELECT c.country FROM tv_channel c INNER JOIN cartoon ca ON c.id = ca.channel WHERE ca.written_by = 'Todd Casey'
SELECT t.country FROM tv_channel t INNER JOIN cartoon c ON t.id = c.channel WHERE c.written_by = 'Todd Casey'
SELECT DISTINCT t.country FROM tv_channel t LEFT JOIN cartoon c ON t.id = c.channel AND c.written_by = 'Todd Casey' WHERE c.channel IS NULL
SELECT country FROM tv_channel EXCEPT SELECT c.country FROM tv_channel c JOIN cartoon ca ON c.id = ca.channel AND ca.written_by = 'Todd Casey'
SELECT tv_channel.series_name, tv_channel.country FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.directed_by = 'Ben Jones' INTERSECT SELECT tv_channel.series_name, tv_channel.country FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.directed_by = 'Michael Chang'
SELECT series_name, country FROM tv_channel WHERE id IN (SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones') AND id IN (SELECT channel FROM cartoon WHERE directed_by = 'Michael Chang')
SELECT distinct pixel_aspect_ratio_par, country FROM tv_channel WHERE language <> 'English'
SELECT tv_channel.pixel_aspect_ratio_par, tv_channel.country FROM tv_channel WHERE language <> 'English' ORDER BY country
SELECT t1.id FROM tv_channel t1 JOIN (SELECT country, COUNT(id) AS num_channels FROM tv_channel GROUP BY country HAVING num_channels > 2) t2 ON t1.country = t2.country
SELECT id FROM tv_channel WHERE id IN ( SELECT channel FROM ( SELECT channel, COUNT(*) AS num_series FROM tv_series GROUP BY channel HAVING num_series > 2 ) )
SELECT id FROM tv_channel EXCEPT SELECT channel FROM cartoon WHERE directed_by = 'Ben Jones'
SELECT c.id FROM tv_channel c LEFT JOIN cartoon ca ON c.id = ca.channel WHERE ca.directed_by != 'Ben Jones' OR ca.directed_by IS NULL
SELECT package_option FROM tv_channel c LEFT JOIN cartoon t ON c.id = t.channel GROUP BY c.package_option HAVING SUM(CASE WHEN t.directed_by = 'Ben Jones' THEN 1 ELSE 0 END) = 0
SELECT DISTINCT package_option FROM tv_channel LEFT JOIN cartoon ON tv_channel.id = cartoon.channel WHERE directed_by <> 'Ben Jones' AND directed_by IS NOT NULL
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) FROM poker_player GROUP BY poker_player_id HAVING COUNT(poker_player_id) > 0
SELECT p.earnings FROM poker_player p ORDER BY p.earnings DESC
SELECT earnings FROM poker_player ORDER BY earnings DESC
SELECT final_table_made, best_finish FROM poker_player
SELECT final_table_made, best_finish FROM poker_player
SELECT AVG(earnings) FROM poker_player
SELECT AVG(earnings) FROM poker_player
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT money_rank FROM poker_player ORDER BY earnings DESC LIMIT 1
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000 GROUP BY earnings HAVING MAX(final_table_made)
SELECT final_table_made FROM poker_player WHERE final_table_made = (SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000) ORDER BY final_table_made DESC LIMIT 1
SELECT p.name FROM people p
SELECT name FROM people
SELECT pe.name FROM poker_player p, people pe WHERE p.people_id = pe.people_id AND p.earnings > 300000
SELECT name FROM people p, poker_player pp WHERE p.people_id = pp.people_id AND pp.earnings > 300000
SELECT name FROM poker_player p JOIN people pe ON p.people_id = pe.people_id ORDER BY final_table_made ASC
SELECT p.name FROM people AS p INNER JOIN poker_player AS pp ON p.people_id = pp.people_id ORDER BY pp.final_table_made ASC
SELECT p.birth_date FROM people p, poker_player pp WHERE p.people_id = pp.people_id ORDER BY pp.earnings LIMIT 1
SELECT P.birth_date FROM people P JOIN poker_player PP ON P.people_id = PP.people_id WHERE PP.earnings = (SELECT MIN(earnings) FROM poker_player)
SELECT money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY height DESC LIMIT 1
SELECT money_rank FROM poker_player JOIN (SELECT people_id FROM people ORDER BY height DESC LIMIT 1) T ON poker_player.people_id = T.people_id
SELECT AVG(earnings) FROM poker_player, people WHERE poker_player.people_id = people.people_id AND height > 200
SELECT AVG(earnings) FROM poker_player, people WHERE poker_player.people_id = people.people_id AND height > 200
SELECT name FROM poker_player as pp JOIN people as p ON pp.people_id = p.people_id ORDER BY earnings DESC
SELECT P.name FROM (SELECT people_id, name FROM people) AS P JOIN poker_player AS PP ON P.people_id = PP.people_id ORDER BY PP.earnings DESC
SELECT nationality, (SELECT COUNT(*) FROM people WHERE nationality = p.nationality) AS number_of_people FROM people p GROUP BY nationality
SELECT nationality, (SELECT COUNT(*) FROM people p2 WHERE p2.nationality = p1.nationality) AS people_count FROM people p1 GROUP BY nationality
SELECT nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT nationality FROM people INNER JOIN poker_player ON people.people_id = poker_player.people_id GROUP BY people.nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT nationality FROM people p1 WHERE (SELECT COUNT(*) FROM people p2 WHERE p1.nationality = p2.nationality) >= 2
SELECT nationality FROM (SELECT nationality, COUNT(*) as count FROM people GROUP BY nationality) WHERE count >= 2
SELECT name, birth_date FROM people ORDER BY name ASC
SELECT name, birth_date FROM people ORDER BY name COLLATE BINARY DESC
SELECT name FROM people WHERE people.nationality <> 'Russia'
SELECT name FROM people WHERE nationality <> 'Russia' LIMIT 100
SELECT p.name FROM people p LEFT JOIN poker_player pp ON p.people_id = pp.people_id WHERE pp.people_id IS NULL
SELECT DISTINCT p.name FROM people p LEFT JOIN poker_player pp ON p.people_id = pp.people_id WHERE pp.people_id IS NULL
SELECT COUNT(DISTINCT(nationality)) AS distinct_nationalities FROM people
SELECT COUNT(DISTINCT nationality) FROM people
SELECT COUNT(DISTINCT state) AS state_count FROM area_code_state
SELECT contestant_number, contestant_name FROM contestants ORDER BY contestant_name DESC
SELECT v.vote_id, v.phone_number, v.state FROM votes v
SELECT area_code FROM area_code_state WHERE area_code = (SELECT MAX(area_code) FROM area_code_state)
SELECT MAX(created) AS last_date FROM votes WHERE state = 'CA' ORDER BY created DESC
SELECT contestant_name FROM contestants WHERE contestant_name != 'Jessie Alloway' LIMIT 10
SELECT state, created FROM votes GROUP BY state, created
SELECT contestant_number, contestant_name FROM contestants INNER JOIN (SELECT contestant_number, COUNT(*) AS num_votes FROM votes GROUP BY contestant_number HAVING COUNT(*) >= 2) v ON contestants.contestant_number = v.contestant_number
SELECT c.contestant_number, c.contestant_name FROM contestants c JOIN votes v ON c.contestant_number = v.contestant_number GROUP BY c.contestant_number, c.contestant_name ORDER BY COUNT(v.vote_id) LIMIT 1
SELECT COUNT(*) FROM votes WHERE state = 'NY' EXCEPT SELECT COUNT(*) FROM votes WHERE state = 'CA'
SELECT COUNT(c.contestant_number) FROM contestants c LEFT JOIN votes v ON c.contestant_number = v.contestant_number WHERE v.contestant_number IS NULL
SELECT area_code_state.area_code, COUNT(votes.phone_number) AS vote_count FROM votes JOIN area_code_state ON votes.state = area_code_state.state GROUP BY area_code_state.area_code ORDER BY vote_count DESC LIMIT 1
SELECT votes.created, area_code_state.state, votes.phone_number FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number JOIN area_code_state ON votes.state = area_code_state.state WHERE contestants.contestant_name = 'Tabatha Gehling'
SELECT a.area_code FROM area_code_state a JOIN votes v ON a.state = v.state JOIN contestants c ON v.contestant_number = c.contestant_number WHERE c.contestant_name = 'Tabatha Gehling' AND EXISTS (SELECT 1 FROM votes v2 JOIN contestants c2 ON v2.contestant_number = c2.contestant_number WHERE c2.contestant_name = 'Kelly Clauss' AND v2.state = a.state)
SELECT contestant_name FROM contestants WHERE SUBSTR(contestant_name, INSTR(contestant_name, 'Al'), LENGTH('Al')) = 'Al'
SELECT name FROM country WHERE indepyear > 1950
SELECT name FROM country WHERE indepyear > 1950 ORDER BY name
SELECT COUNT(DISTINCT code) FROM country WHERE governmentform = 'Republic'
SELECT COUNT(*) FROM country WHERE governmentform = 'Republic' EXCEPT SELECT COUNT(*) FROM country WHERE governmentform = 'Monarchy'
SELECT SUM(surfacearea) AS "Total Surface Area" FROM country WHERE region = 'Caribbean'
SELECT SUM(surfacearea) FROM country WHERE continent = 'Carribean' EXCEPT SELECT SUM(surfacearea) FROM country WHERE region = 'Carribean'
SELECT continent FROM country WHERE name = 'Anguilla' ORDER BY continent LIMIT 1
SELECT c.continent FROM country c, city ct WHERE c.code = ct.countrycode AND ct.name = 'Anguilla'
SELECT c.region FROM country c, city t WHERE t.name = 'Kabul' AND t.countrycode = c.code
SELECT c.region FROM city AS ci, country AS c WHERE ci.countrycode = c.code AND ci.name = 'Kabul'
SELECT cl.language FROM countrylanguage cl INNER JOIN ( SELECT code FROM country WHERE name = 'Aruba' ) c ON cl.countrycode = c.code ORDER BY cl.percentage DESC LIMIT 1
SELECT language FROM countrylanguage WHERE countrycode = 'ABW' AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = 'ABW') AND isofficial = 'T'
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil' INTERSECT SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil'
SELECT c.population, c.lifeexpectancy FROM country c JOIN city ct ON c.code = ct.countrycode WHERE ct.name = 'Brazil'
SELECT c.region, c.population FROM country c JOIN city ci ON c.code = ci.countrycode WHERE c.name = 'Angola'
SELECT * FROM country WHERE name = 'Angola'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa' ORDER BY AVG(lifeexpectancy) DESC LIMIT 1
SELECT AVG(lifeexpectancy) AS average_life_expectancy FROM country WHERE region = 'Central Africa'
SELECT c.name FROM country c JOIN (SELECT MIN(lifeexpectancy) as min_life FROM country WHERE continent = 'Asia') sub ON c.lifeexpectancy = sub.min_life WHERE c.continent = 'Asia'
SELECT name FROM country WHERE continent = 'Asia' AND lifeexpectancy = (SELECT MIN(lifeexpectancy) FROM country WHERE continent = 'Asia' ORDER BY lifeexpectancy LIMIT 1)
SELECT SUM(population), MAX(gnp) FROM country WHERE continent = 'Asia'
SELECT SUM(c.population) FROM (SELECT population FROM country WHERE continent = 'Asia') c
SELECT AVG(lifeexpectancy) FROM country WHERE continent = 'Africa' AND governmentform = 'Republic' ORDER BY lifeexpectancy DESC LIMIT 1
SELECT AVG(lifeexpectancy) as average_life_expectancy FROM country WHERE continent = 'Africa' AND governmentform = 'Republic' ORDER BY average_life_expectancy DESC LIMIT 1
SELECT continent, SUM(surfacearea) AS total_surface_area FROM country WHERE continent = 'Asia' OR continent = 'Europe' GROUP BY continent ORDER BY total_surface_area DESC LIMIT 1
SELECT SUM(surfacearea) as total_surface_area FROM (SELECT surfacearea FROM country WHERE continent = 'Asia' UNION ALL SELECT surfacearea FROM country WHERE continent = 'Europe') as subquery
SELECT sum(population) FROM city WHERE district = 'Gelderland'
SELECT SUM(population) FROM city WHERE district = 'Gelderland'
SELECT AVG(gnp) AS avg_gnp, SUM(population) AS total_population FROM country WHERE governmentform = 'US Territory'
SELECT AVG(gnp) AS mean_gnp, (SELECT SUM(population) FROM city WHERE countrycode = (SELECT code FROM country WHERE continent = 'US')) AS total_population FROM country
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT COUNT(*) FROM (SELECT DISTINCT governmentform FROM country WHERE continent = 'Africa') t
SELECT COUNT(DISTINCT governmentform) FROM country WHERE continent = 'Africa'
SELECT SUM(1) FROM countrylanguage WHERE countrycode = 'ABW'
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = 'ABW'
SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT COUNT(DISTINCT language) AS official_languages FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T'
SELECT c.name FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode GROUP BY c.name ORDER BY COUNT(cl.language) DESC LIMIT 1
SELECT name FROM country WHERE code = ( SELECT countrycode FROM countrylanguage GROUP BY countrycode ORDER BY COUNT(language) DESC LIMIT 1 )
SELECT c.continent FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode GROUP BY c.continent ORDER BY COUNT(DISTINCT cl.language) DESC LIMIT 1
SELECT c1.continent FROM country c1 JOIN ( SELECT countrycode, COUNT(DISTINCT language) AS lang_count FROM countrylanguage GROUP BY countrycode ) cl ON c1.code = cl.countrycode ORDER BY lang_count DESC LIMIT 1
SELECT COUNT(*) FROM countrylanguage WHERE language IN ('Dutch', 'English') AND isofficial = 'T'
SELECT COUNT(DISTINCT cl.countrycode) FROM countrylanguage cl WHERE cl.language IN ('English', 'Dutch') AND cl.isofficial = 'T'
SELECT name FROM country WHERE (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = code AND language IN ('English', 'French') AND isofficial = 'T') = 2
SELECT name FROM country WHERE name IN (SELECT name FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE language = 'English') AND name IN (SELECT name FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE language = 'French')
SELECT name FROM country WHERE code = (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') AND code = (SELECT countrycode FROM countrylanguage WHERE language = 'French' AND isofficial = 'T')
SELECT name FROM country WHERE (SELECT GROUP_CONCAT(language) FROM countrylanguage WHERE countrylanguage.countrycode = country.code AND isofficial = 'T') = 'English,French'
SELECT COUNT(DISTINCT continent) FROM (SELECT c.continent FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language = 'Chinese')
SELECT COUNT(DISTINCT c.continent) FROM country c WHERE (SELECT COUNT(*) FROM countrylanguage cl WHERE c.code = cl.countrycode AND cl.language = 'Chinese') > 0
SELECT region FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language IN ('English', 'Dutch'))
SELECT DISTINCT region FROM country ORDER BY region WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' UNION SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T') UNION SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Dutch' AND isofficial = 'T')
SELECT name FROM country WHERE code IN (SELECT countrycode FROM countrylanguage WHERE (language = 'Dutch' OR language = 'English') AND isofficial = 'T')
SELECT language FROM countrylanguage AS cl JOIN country AS c ON cl.countrycode = c.code WHERE c.continent = 'Asia' GROUP BY language ORDER BY SUM(percentage) DESC LIMIT 1
SELECT language FROM countrylanguage AS cl JOIN country AS c ON cl.countrycode = c.code WHERE c.continent = 'Asia' GROUP BY language ORDER BY COUNT(DISTINCT c.code) DESC LIMIT 1
SELECT language FROM countrylanguage cl JOIN country c ON cl.countrycode = c.code WHERE c.governmentform = 'Republic' GROUP BY language HAVING COUNT(DISTINCT cl.countrycode) = 1
SELECT language FROM countrylanguage WHERE countrycode IN (SELECT code FROM country WHERE governmentform = 'Republic') GROUP BY language HAVING COUNT(DISTINCT countrycode) = 1 AND COUNT(*) = 1
SELECT c.name FROM city c JOIN countrylanguage cl ON c.countrycode = cl.countrycode WHERE cl.language = 'English' AND cl.isofficial = 'T' ORDER BY c.population DESC LIMIT 1
SELECT c.name FROM city c JOIN countrylanguage cl ON c.countrycode = cl.countrycode WHERE cl.language = 'English' ORDER BY c.population DESC LIMIT 1
SELECT name, population, lifeexpectancy FROM country WHERE continent = 'Asia' ORDER BY surfacearea DESC, population DESC, lifeexpectancy DESC LIMIT 1
SELECT c.name, c.population, c.lifeexpectancy FROM country c LEFT JOIN ( SELECT continent, MAX(population) as max_pop FROM country WHERE continent = 'Asia' GROUP BY continent ) s ON c.continent = s.continent AND c.population = s.max_pop WHERE c.continent = 'Asia'
SELECT AVG(country.lifeexpectancy) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE language != 'English' AND isofficial = 'F'
SELECT AVG(lifeexpectancy) FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T')
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.isofficial = 'F' OR cl.isofficial IS NULL
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode AND cl.language <> 'English' OR cl.language IS NULL
SELECT language FROM countrylanguage cl, country c WHERE c.headofstate = 'Beatrix' AND cl.isofficial = 'T' AND cl.countrycode = c.code
SELECT language FROM countrylanguage cl, country c WHERE cl.countrycode = c.code AND c.headofstate = 'Beatrix' AND cl.isofficial = 'T' LIMIT 1
SELECT COUNT(DISTINCT countrylanguage.language) FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.indepyear < 1930 AND countrylanguage.isofficial = 'T'
SELECT COUNT(DISTINCT language) FROM countrylanguage cl, country c WHERE cl.countrycode = c.code AND c.indepyear < 1930 AND cl.isofficial = 'T'
SELECT c1.name FROM country c1 WHERE c1.surfacearea > ALL (SELECT surfacearea FROM country c2 WHERE c2.continent = 'Europe')
SELECT name FROM country WHERE surfacearea > (SELECT surfacearea FROM country WHERE continent = 'Europe' ORDER BY surfacearea DESC LIMIT 1)
SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MAX(population) FROM country WHERE continent = 'Asia')
SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MAX(population) FROM country WHERE continent = 'Asia')
SELECT c1.name FROM country c1 WHERE c1.continent = 'Asia' AND (SELECT MAX(population) FROM country WHERE continent = 'Africa') < ALL (SELECT population FROM country WHERE continent = 'Asia')
SELECT c1.name FROM country c1 JOIN country c2 ON c1.continent = 'Asia' AND c2.continent = 'Africa' AND c1.population > c2.population
SELECT code FROM country WHERE code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English')
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode GROUP BY c.code HAVING SUM(CASE WHEN cl.language = 'English' THEN 1 ELSE 0 END) = 0
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' OR cl.language IS NULL
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language != 'English' OR cl.language IS NULL
SELECT c.code FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' AND c.governmentform <> 'Republic'
SELECT c.code FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode AND cl.language = 'English' AND cl.isofficial = 'T' WHERE cl.countrycode IS NULL AND c.governmentform != 'Republic'
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe' AND code NOT IN (SELECT countrycode FROM countrylanguage WHERE language = 'English' AND isofficial = 'T'))
SELECT name FROM city WHERE countrycode IN (SELECT code FROM country WHERE continent = 'Europe') AND countrycode IN (SELECT countrycode FROM countrylanguage WHERE language <> 'English' AND isofficial = 'F')
SELECT c.name FROM city c, country co, countrylanguage cl WHERE c.countrycode = co.code AND cl.countrycode = co.code AND co.continent = 'Asia' AND cl.language = 'Chinese' AND cl.isofficial = 'T'
SELECT city.name FROM city JOIN country ON city.countrycode = country.code WHERE country.continent = 'Asia' AND city.countrycode IN (SELECT countrycode FROM countrylanguage WHERE language = 'Chinese' AND isofficial = 'T')
SELECT name, indepyear, surfacearea FROM country WHERE population = (SELECT MIN(population) FROM country) ORDER BY population ASC LIMIT 1
SELECT name, indepyear, surfacearea FROM country WHERE population = (SELECT MIN(population) FROM country) EXCEPT SELECT name, indepyear, surfacearea FROM country WHERE surfacearea = (SELECT MIN(surfacearea) FROM country)
SELECT c.population, c.name, c.headofstate FROM country c WHERE surfacearea = (SELECT MAX(surfacearea) FROM country) GROUP BY c.population, c.name, c.headofstate
SELECT name, population, headofstate FROM country WHERE surfacearea = (SELECT surfacearea FROM country ORDER BY surfacearea DESC LIMIT 1)
SELECT c.name AS country, (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = c.code) AS num_languages FROM country c HAVING num_languages >= 3
SELECT country.name, (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = country.code) AS language_count FROM country GROUP BY country.name HAVING (SELECT COUNT(DISTINCT language) FROM countrylanguage WHERE countrycode = country.code) > 2
SELECT c.district, COUNT(c.id) FROM city c JOIN (SELECT district, AVG(population) AS avg_population FROM city GROUP BY district) a ON c.district = a.district WHERE c.population > a.avg_population GROUP BY c.district
SELECT district, COUNT(name) FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district ORDER BY COUNT(name) DESC
SELECT governmentform, (SELECT SUM(population) FROM city WHERE city.countrycode = country.code) AS total_population FROM country WHERE AVG(lifeexpectancy) > 72 GROUP BY governmentform
SELECT governmentform, SUM(population) AS total_population FROM country WHERE lifeexpectancy > 72 GROUP BY governmentform ORDER BY total_population DESC
SELECT c.continent, AVG(c.lifeexpectancy) AS avg_life_expectancy, SUM(c.population) AS total_population FROM country c WHERE c.lifeexpectancy < 72 GROUP BY c.continent
SELECT continent, SUM(population) AS total_population, AVG(lifeexpectancy) AS average_life_expectancy FROM country GROUP BY continent HAVING AVG(lifeexpectancy) < 72
SELECT name, surfacearea FROM (SELECT name, surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5) ORDER BY surfacearea DESC
SELECT c.name, c.surfacearea FROM country c, (SELECT code, MAX(surfacearea) as max_area FROM country GROUP BY code ORDER BY max_area DESC LIMIT 5) m WHERE c.code = m.code
SELECT c.name FROM country c JOIN (SELECT name, population FROM country ORDER BY population DESC LIMIT 3) sub ON c.name = sub.name
SELECT c.name FROM (SELECT name, population FROM country ORDER BY population DESC LIMIT 3) AS c
SELECT name FROM country WHERE population <= (SELECT population FROM (SELECT population FROM country ORDER BY population LIMIT 3))
SELECT name FROM country ORDER BY population LIMIT 3
SELECT count(*) FROM country WHERE continent = "Asia"
SELECT COUNT(*) FROM country WHERE continent = 'Asia' HAVING COUNT(*) > 0
SELECT name FROM country WHERE continent = 'Europe' AND population = 80000 ORDER BY name
SELECT c.name FROM country c, city ct WHERE c.code = ct.countrycode AND c.continent = 'Europe' AND c.population = 80000 AND ct.population = 80000
SELECT SUM(population) AS total_population, AVG(surfacearea) AS average_area FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT SUM(population), (SELECT AVG(surfacearea) FROM country WHERE continent = 'North America' AND surfacearea > 3000) AS avg_surface_area FROM country WHERE continent = 'North America' AND surfacearea > 3000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT language, COUNT(DISTINCT countrycode) AS num_countries FROM countrylanguage GROUP BY language ORDER BY num_countries DESC LIMIT 1
SELECT language FROM (SELECT language, COUNT(DISTINCT countrycode) as num_countries FROM countrylanguage GROUP BY language) as subquery ORDER BY num_countries DESC LIMIT 1
SELECT * FROM ( SELECT c.name, cl.language, ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY cl.percentage DESC) rn FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode ) WHERE rn = 1
SELECT c.code AS cl.countrycode, cl.language FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE countrycode = cl.countrycode)
SELECT COUNT(*) FROM countrylanguage WHERE language = 'Spanish' AND percentage = (SELECT MAX(percentage) FROM countrylanguage WHERE language = 'Spanish')
SELECT COUNT(DISTINCT countrycode) FROM countrylanguage WHERE language = 'Spanish' AND isofficial = 'T'
SELECT c.code FROM countrylanguage l JOIN country c ON l.countrycode = c.code WHERE l.language = 'Spanish' ORDER BY l.percentage DESC LIMIT 1
SELECT code FROM countrylanguage WHERE language = 'Spanish' AND isofficial = 'T' ORDER BY percentage DESC
SELECT DISTINCT conductor_id, COUNT(*) FROM orchestra GROUP BY conductor_id
SELECT COUNT(age) FROM conductor
SELECT name FROM conductor WHERE age IS NOT NULL ORDER BY age
SELECT name FROM conductor ORDER BY age DESC
SELECT name FROM conductor WHERE nationality <> 'USA'
SELECT name FROM conductor WHERE nationality != 'USA'
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT AVG(attendance) FROM show
SELECT AVG(attendance) FROM show
SELECT share FROM performance WHERE type <> 'Live final' ORDER BY share DESC LIMIT 1
SELECT MAX(share) as max_share, MIN(share) as min_share FROM performance WHERE type != 'Live final'
SELECT COUNT(DISTINCT c.nationality) AS num_of_nationalities FROM conductor c
SELECT COUNT(DISTINCT nationality) AS total_conductor_nationalities FROM conductor
SELECT name FROM conductor ORDER BY age DESC
SELECT name FROM conductor ORDER BY year_of_work DESC
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1
SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1
SELECT c.name, o.orchestra FROM conductor c, orchestra o WHERE c.conductor_id = o.conductor_id
SELECT conductor.name, orchestra.orchestra FROM conductor, orchestra WHERE conductor.conductor_id = orchestra.conductor_id
SELECT c.name FROM conductor c JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.conductor_id, c.name HAVING COUNT(o.orchestra_id) > 1
SELECT c.name FROM conductor c JOIN ( SELECT conductor_id FROM orchestra GROUP BY conductor_id HAVING COUNT(DISTINCT orchestra) > 1 ) sub ON c.conductor_id = sub.conductor_id
SELECT name FROM conductor GROUP BY conductor_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM conductor GROUP BY conductor_id ORDER BY COUNT(orchestra_id) DESC LIMIT 1
SELECT name FROM conductor WHERE conductor_id = (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008)
SELECT name FROM conductor WHERE conductor_id IN (SELECT conductor_id FROM orchestra WHERE year_of_founded > 2008)
SELECT record_company, (SELECT COUNT(*) FROM orchestra o2 WHERE o2.record_company = o.record_company) AS orchestra_count FROM orchestra o GROUP BY record_company
SELECT record_company, (SELECT COUNT(orchestra_id) FROM orchestra o2 WHERE o2.record_company = o.record_company) as num_orchestras FROM orchestra o GROUP BY record_company
SELECT major_record_format FROM orchestra GROUP BY major_record_format ORDER BY COUNT(*) ASC
SELECT major_record_format, COUNT(*) AS frequency FROM orchestra GROUP BY major_record_format ORDER BY frequency DESC
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(orchestra_id) DESC LIMIT 1
SELECT record_company FROM orchestra GROUP BY record_company ORDER BY COUNT(DISTINCT orchestra_id) DESC, record_company LIMIT 1
SELECT orchestra.orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.orchestra_id IS NULL
SELECT orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.orchestra_id IS NULL
SELECT DISTINCT o1.record_company FROM orchestra o1 INNER JOIN orchestra o2 ON o1.record_company = o2.record_company WHERE o1.year_of_founded < 2003 AND o2.year_of_founded > 2003
SELECT DISTINCT o1.record_company FROM orchestra o1, orchestra o2 WHERE o1.record_company = o2.record_company AND o1.year_of_founded < 2003 AND o2.year_of_founded > 2003
SELECT COUNT(orchestra_id) FROM orchestra WHERE major_record_format = 'CD' UNION SELECT COUNT(orchestra_id) FROM orchestra WHERE major_record_format = 'DVD'
SELECT COUNT(DISTINCT orchestra_id) FROM orchestra WHERE major_record_format = 'CD' EXCEPT SELECT COUNT(DISTINCT orchestra_id) FROM orchestra WHERE major_record_format = 'DVD'
SELECT DISTINCT o.year_of_founded FROM orchestra o JOIN performance p ON o.orchestra_id = p.orchestra_id GROUP BY o.orchestra_id HAVING COUNT(p.performance_id) > 1
SELECT orchestra, year_of_founded FROM orchestra INNER JOIN ( SELECT orchestra_id FROM performance GROUP BY orchestra_id HAVING COUNT(*) > 1 ) p ON orchestra.orchestra_id = p.orchestra_id
SELECT * FROM highschooler WHERE grade IS NOT NULL
SELECT 1 FROM highschooler GROUP BY id HAVING COUNT(*)
SELECT name, grade FROM highschooler WHERE grade IS NOT NULL
SELECT name, grade FROM highschooler
SELECT grade FROM highschooler WHERE grade IS NOT NULL
SELECT grade FROM highschooler GROUP BY grade ORDER BY grade
SELECT grade FROM highschooler WHERE id IN (SELECT student_id FROM likes WHERE liked_id = (SELECT id FROM highschooler WHERE name = 'Kyle')) LIMIT 1
SELECT grade FROM highschooler WHERE name = 'Kyle' INTERSECT SELECT grade FROM highschooler WHERE name = 'Kyle'
SELECT name FROM highschooler HAVING grade = '10'
SELECT DISTINCT name FROM highschooler WHERE grade = 10
SELECT id FROM highschooler WHERE name = 'Kyle' EXCEPT SELECT id FROM highschooler WHERE name != 'Kyle'
SELECT id FROM highschooler WHERE name = 'Kyle' ORDER BY id LIMIT 1
SELECT COUNT(*) FROM highschooler WHERE grade = 9 OR grade = 10 GROUP BY grade
SELECT COUNT(id) AS total_highschoolers FROM highschooler WHERE grade >= 9 AND grade <= 10
SELECT grade, COUNT(*) AS number_of_students FROM highschooler GROUP BY grade ORDER BY number_of_students DESC
SELECT grade, (SELECT count(*) FROM highschooler h2 WHERE h2.grade = highschooler.grade) as count FROM highschooler GROUP BY grade
SELECT grade FROM highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM highschooler GROUP BY grade ORDER BY COUNT(*) DESC LIMIT 1
SELECT grade FROM (SELECT grade, COUNT(id) as student_count FROM highschooler GROUP BY grade) WHERE student_count >= 4
SELECT grade FROM (SELECT grade, COUNT(*) as total_highschoolers FROM highschooler GROUP BY grade) WHERE total_highschoolers >= 4
SELECT h.id AS student_id, (SELECT COUNT(*) FROM (SELECT student_id FROM friend UNION ALL SELECT friend_id FROM friend) AS all_friends WHERE student_id = h.id OR all_friends = h.id) AS num_of_friends FROM highschooler h
SELECT student_id, COUNT(friend_id) AS num_friends FROM friend WHERE friend.student_id = highschooler.id GROUP BY student_id
SELECT h.name, (SELECT COUNT(*) FROM friend WHERE student_id = h.id) + (SELECT COUNT(*) FROM friend WHERE friend_id = h.id) AS num_of_friends FROM highschooler h
SELECT highschooler.name, COUNT(friend.friend_id) AS friend_count FROM highschooler LEFT JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.name
SELECT h.name FROM highschooler h, friend f WHERE h.id = f.student_id GROUP BY h.id ORDER BY COUNT(f.friend_id) DESC LIMIT 1
SELECT name FROM highschooler WHERE id = (SELECT friend_id FROM (SELECT friend_id, COUNT(student_id) as cnt FROM friend GROUP BY friend_id ORDER BY cnt DESC LIMIT 1))
SELECT h.name FROM highschooler h INNER JOIN (SELECT student_id, COUNT(friend_id) as num_friends FROM friend GROUP BY student_id HAVING num_friends >= 3) f ON h.id = f.student_id
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(friend_id) AS friend_count FROM friend GROUP BY student_id) f ON h.id = f.student_id WHERE f.friend_count >= 3 LIMIT 10
SELECT highschooler.name FROM highschooler JOIN friend ON friend.friend_id = highschooler.id WHERE friend.student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT h2.name FROM highschooler AS h1, friend, highschooler AS h2 WHERE h1.id = friend.student_id AND friend.friend_id = h2.id AND h1.name = 'Kyle'
SELECT COUNT(*) FROM friend WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle') AND friend_id <> (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT COUNT(*) FROM friend WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle') AND friend_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend) EXCEPT SELECT friend_id FROM friend
SELECT h.id FROM highschooler h LEFT JOIN friend f ON h.id = f.student_id WHERE f.student_id IS NULL
SELECT name FROM highschooler EXCEPT SELECT h.name FROM highschooler h INNER JOIN friend f ON h.id = f.student_id
SELECT name FROM highschooler EXCEPT SELECT h.name FROM highschooler h JOIN friend f ON h.id = f.student_id
SELECT id FROM highschooler WHERE id IN (SELECT student_id FROM friend) AND id IN (SELECT liked_id FROM likes) UNION SELECT id FROM highschooler WHERE id IN (SELECT student_id FROM friend) INTERSECT SELECT id FROM highschooler WHERE id IN (SELECT liked_id FROM likes)
SELECT DISTINCT f.student_id FROM friend f, likes l WHERE f.student_id = l.student_id
SELECT DISTINCT h1.name FROM highschooler h1, friend f, likes l WHERE h1.id = f.student_id AND h1.id = l.liked_id
SELECT h.name FROM highschooler h JOIN friend f ON h.id = f.student_id JOIN likes l ON h.id = l.student_id WHERE h.id IN (SELECT liked_id FROM likes)
SELECT h.id AS student_id, COUNT(l.liked_id) AS like_count FROM highschooler h LEFT JOIN likes l ON h.id = l.student_id GROUP BY h.id ORDER BY like_count DESC
SELECT id AS student_id, (SELECT COUNT(liked_id) FROM likes WHERE student_id = h.id) AS like_count FROM highschooler h
SELECT h.name, COALESCE(l.cnt, 0) AS num_likes FROM highschooler h LEFT JOIN (SELECT student_id, COUNT(liked_id) AS cnt FROM likes GROUP BY student_id) l ON h.id = l.student_id
SELECT h.name, COUNT(l.liked_id) FROM highschooler h INNER JOIN likes l ON h.id = l.student_id GROUP BY h.name
SELECT h.name FROM highschooler h WHERE h.id = (SELECT liked_id FROM likes GROUP BY liked_id HAVING COUNT(*) = (SELECT MAX(like_count) FROM (SELECT liked_id, COUNT(*) AS like_count FROM likes GROUP BY liked_id) AS l))
SELECT name FROM (SELECT h.name, COUNT(l.liked_id) as like_count FROM highschooler h JOIN likes l ON h.id = l.student_id GROUP BY h.id ORDER BY like_count DESC LIMIT 1)
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(liked_id) AS like_count FROM likes GROUP BY student_id) l ON h.id = l.student_id WHERE l.like_count >= 2
SELECT h.name FROM highschooler h JOIN (SELECT student_id, COUNT(*) as num_likes FROM likes GROUP BY student_id) l ON h.id = l.student_id WHERE l.num_likes >= 2
SELECT h.name FROM highschooler h, (SELECT student_id, COUNT(friend_id) as num_friends FROM friend) f WHERE h.id = f.student_id AND h.grade > 5 AND f.num_friends >= 2
SELECT name FROM highschooler WHERE grade > 5 AND id IN (SELECT student_id FROM (SELECT student_id, COUNT(friend_id) as num_friends FROM friend GROUP BY student_id) WHERE num_friends >= 2)
SELECT COUNT(*) FROM likes, highschooler WHERE likes.student_id = highschooler.id AND highschooler.name = 'Kyle' AND likes.liked_id = highschooler.id
SELECT COUNT(*) FROM likes, highschooler WHERE likes.student_id = highschooler.id AND highschooler.name = 'Kyle'
SELECT AVG(grade) FROM highschooler WHERE id IN (SELECT DISTINCT f1.student_id FROM friend f1 JOIN friend f2 ON f1.friend_id = f2.student_id)
SELECT AVG(grade) FROM highschooler WHERE id IN (SELECT student_id FROM friend) GROUP BY id
SELECT MIN(grade) FROM highschooler WHERE NOT EXISTS (SELECT * FROM friend WHERE friend.friend_id = highschooler.id)
SELECT MIN(grade) FROM highschooler WHERE NOT EXISTS (SELECT * FROM friend WHERE friend_id = highschooler.id OR student_id = highschooler.id)
SELECT state FROM owners INTERSECT SELECT state FROM professionals
SELECT state FROM owners WHERE state IN (SELECT state FROM professionals) GROUP BY state
SELECT AVG(d.age) FROM dogs d, treatments t WHERE d.dog_id = t.dog_id
SELECT AVG(dogs.age) FROM dogs, treatments WHERE dogs.dog_id = treatments.dog_id
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' AND professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'Indiana' LIMIT 10
SELECT d.name FROM dogs d LEFT JOIN treatments t ON d.dog_id = t.dog_id GROUP BY d.name HAVING MAX(t.cost_of_treatment) <= 1000
SELECT name FROM dogs WHERE owner_id = (SELECT owner_id FROM treatments WHERE treatments.dog_id = dogs.dog_id GROUP BY owner_id HAVING SUM(cost_of_treatment) <= 1000)
SELECT DISTINCT first_name FROM (SELECT first_name FROM professionals UNION SELECT first_name FROM owners) AS combined_names WHERE first_name NOT IN (SELECT name FROM dogs)
SELECT p.first_name FROM professionals p LEFT JOIN dogs d ON p.first_name = d.name WHERE d.name IS NULL
SELECT p.professional_id, p.role_code, p.email_address FROM professionals p LEFT JOIN treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL
SELECT p.professional_id, p.role_code, p.email_address FROM professionals p LEFT JOIN treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL
SELECT owner_id, first_name, last_name FROM owners WHERE owner_id = (SELECT owner_id FROM dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(num_dogs) FROM (SELECT owner_id, COUNT(dog_id) AS num_dogs FROM dogs GROUP BY owner_id)))
SELECT owner_id, first_name, last_name FROM owners WHERE owner_id IN (SELECT owner_id FROM dogs GROUP BY owner_id HAVING COUNT(dog_id) = (SELECT MAX(dog_count) FROM (SELECT COUNT(dog_id) as dog_count FROM dogs GROUP BY owner_id)))
SELECT p.professional_id, p.role_code, p.first_name FROM professionals p INNER JOIN treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id HAVING COUNT(t.treatment_id) >= 2
SELECT p.professional_id, p.role_code, p.first_name FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id GROUP BY p.professional_id, p.role_code, p.first_name HAVING COUNT(t.treatment_id) >= 2
SELECT b.breed_name FROM breeds b JOIN (SELECT breed_code, COUNT(*) as dog_count FROM dogs GROUP BY breed_code ORDER BY dog_count DESC LIMIT 1) as top_breed ON b.breed_code = top_breed.breed_code
SELECT breed_name FROM breeds JOIN dogs ON breeds.breed_code = dogs.breed_code GROUP BY breed_name HAVING COUNT(dogs.breed_code) = (SELECT MAX(breed_count) FROM (SELECT COUNT(*) AS breed_count FROM dogs GROUP BY breed_code) AS breed_counts)
SELECT owner_id, last_name FROM owners WHERE owner_id = (SELECT owner_id FROM (SELECT owner_id, COUNT(treatment_id) as num_treatments FROM treatments GROUP BY owner_id ORDER BY num_treatments DESC LIMIT 1))
SELECT owner_id, last_name FROM owners WHERE owner_id = ( SELECT owner_id FROM dogs WHERE dog_id = ( SELECT dog_id FROM treatments ORDER BY cost_of_treatment DESC LIMIT 1 ) )
SELECT t.treatment_type_description FROM treatments t WHERE t.cost_of_treatment = (SELECT MIN(cost_of_treatment) FROM treatments)
SELECT treatment_type_description FROM treatment_types WHERE treatment_type_code = (SELECT treatment_type_code FROM (SELECT treatment_type_code, SUM(cost_of_treatment) as total_cost FROM treatments GROUP BY treatment_type_code ORDER BY total_cost LIMIT 1))
SELECT owner_id, zip_code FROM owners ORDER BY ( SELECT SUM(cost_of_treatment) FROM treatments JOIN dogs ON treatments.dog_id = dogs.dog_id WHERE dogs.owner_id = owners.owner_id ) DESC LIMIT 1
SELECT o.owner_id, o.zip_code FROM owners o JOIN dogs d ON o.owner_id = d.owner_id JOIN treatments t ON d.dog_id = t.dog_id WHERE o.owner_id = (SELECT owner_id FROM (SELECT owner_id, SUM(cost_of_treatment) AS total_cost FROM treatments GROUP BY owner_id ORDER BY total_cost DESC LIMIT 1))
SELECT professional_id, cell_number FROM professionals p WHERE (SELECT COUNT(DISTINCT treatment_type_code) FROM treatments t1 WHERE p.professional_id = t1.professional_id) >= 2
SELECT p.professional_id, p.cell_number FROM professionals p JOIN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(DISTINCT treatment_type_code) > 1) t ON p.professional_id = t.professional_id
SELECT p.first_name, p.last_name FROM professionals p JOIN treatments t ON p.professional_id = t.professional_id WHERE t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments) GROUP BY p.first_name, p.last_name
SELECT first_name, last_name FROM professionals p WHERE EXISTS (SELECT * FROM treatments t WHERE p.professional_id = t.professional_id AND t.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments))
SELECT date_of_treatment, first_name FROM treatments NATURAL JOIN professionals
SELECT date_of_treatment, first_name FROM treatments NATURAL JOIN professionals
SELECT treatment_type_description, cost_of_treatment FROM treatments, treatment_types WHERE treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT t.cost_of_treatment, tt.treatment_type_description FROM (SELECT * FROM treatments) AS t JOIN (SELECT * FROM treatment_types) AS tt ON t.treatment_type_code = tt.treatment_type_code
SELECT o.first_name, o.last_name, s.size_description FROM owners o, dogs d, sizes s WHERE o.owner_id = d.owner_id AND d.size_code = s.size_code
SELECT first_name, last_name, size_description FROM owners o, dogs d, sizes s WHERE o.owner_id = d.owner_id AND d.size_code = s.size_code ORDER BY first_name
SELECT o.first_name, d.name FROM owners o, dogs d WHERE o.owner_id = d.owner_id
SELECT first_name, name FROM owners, dogs WHERE owners.owner_id = dogs.owner_id
SELECT name, date_of_treatment FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE dogs.breed_code = (SELECT breed_code FROM breeds ORDER BY breed_code LIMIT 1) GROUP BY name, date_of_treatment
SELECT name, date_of_treatment FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE dogs.breed_code = ( SELECT breed_code FROM ( SELECT breed_code, COUNT(*) as num_dogs FROM dogs GROUP BY breed_code HAVING num_dogs = 1 ) )
SELECT first_name, name FROM owners o, dogs d WHERE o.owner_id = d.owner_id AND o.state = 'Virginia'
SELECT owners.first_name, dogs.name FROM owners LEFT JOIN dogs ON owners.owner_id = dogs.owner_id WHERE owners.street LIKE '%Virginia%'
SELECT d.date_arrived, d.date_departed FROM dogs d, treatments t WHERE d.dog_id = t.dog_id
SELECT d.date_arrived, d.date_departed FROM dogs d INNER JOIN treatments t ON d.dog_id = t.dog_id
SELECT o.last_name FROM owners o JOIN dogs d ON o.owner_id = d.owner_id WHERE d.age = (SELECT MIN(age) FROM dogs ORDER BY age LIMIT 1)
SELECT last_name FROM owners WHERE dog_id = (SELECT dog_id FROM dogs ORDER BY date_of_birth LIMIT 1)
SELECT email_address FROM professionals WHERE state IN ('Hawaii', 'Wisconsin')
SELECT email_address FROM professionals WHERE state = 'Hawaii' OR state = 'Wisconsin' GROUP BY email_address
SELECT dogs.date_arrived, dogs.date_departed FROM dogs
SELECT date_arrived, date_departed FROM dogs ORDER BY date_arrived
SELECT COUNT(DISTINCT dog_id) FROM dogs WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT COUNT(*) FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT role_code, street, city, state FROM professionals WHERE city LIKE '%West%'
SELECT role_code, street, city, state FROM professionals WHERE city LIKE '%West%' ORDER BY role_code, street, city, state
SELECT o.first_name, o.last_name, o.email_address FROM owners o INNER JOIN dogs d ON o.owner_id = d.owner_id WHERE o.state LIKE '%North%'
SELECT first_name, last_name, email_address FROM owners WHERE state IN (SELECT state FROM owners WHERE state LIKE '%North%' EXCEPT SELECT state FROM owners)
SELECT COUNT(*) FROM dogs WHERE age < (SELECT AVG(age) FROM dogs)
SELECT COUNT(*) FROM (SELECT AVG(age) FROM dogs) AS avg_age
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT cost_of_treatment FROM treatments ORDER BY date_of_treatment DESC LIMIT 1
SELECT COUNT(*) FROM dogs LEFT JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE treatments.treatment_id IS NULL
SELECT COUNT(*) FROM dogs LEFT JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE treatments.dog_id IS NULL AND abandoned_yn = 'N'
SELECT COUNT(*) FROM owners LEFT JOIN dogs ON owners.owner_id = dogs.owner_id WHERE dogs.owner_id IS NULL
SELECT count(*) FROM owners WHERE (SELECT count(*) FROM dogs WHERE dogs.owner_id = owners.owner_id) = 0
SELECT COUNT(professional_id) FROM professionals WHERE NOT EXISTS (SELECT 1 FROM treatments WHERE treatments.professional_id = professionals.professional_id)
SELECT COUNT(DISTINCT professional_id) FROM professionals p LEFT JOIN treatments t ON p.professional_id = t.professional_id WHERE t.professional_id IS NULL
SELECT d.name, d.age, d.weight FROM dogs d WHERE d.abandoned_yn = 1
SELECT d.name, d.age, d.weight FROM dogs d WHERE d.abandoned_yn = 1 LIMIT 10
SELECT AVG(age) FROM dogs
SELECT AVG(age) AS avg_age FROM dogs
SELECT age FROM dogs ORDER BY age DESC LIMIT 1
SELECT STRFTIME('%Y', MAX(date_of_birth), 'localtime') - STRFTIME('%Y', MIN(date_of_birth), 'localtime') - (STRFTIME('%m-%d', MAX(date_of_birth), 'localtime') < STRFTIME('%m-%d', MIN(date_of_birth), 'localtime')) AS max_age FROM dogs
SELECT charge_type, charge_amount FROM charges ORDER BY charge_amount DESC
SELECT c.charge_type, c.charge_amount FROM charges c
SELECT charge_type, MAX(charge_amount) AS max_charge_cost FROM charges GROUP BY charge_type ORDER BY max_charge_cost DESC LIMIT 1
SELECT charge_amount FROM charges ORDER BY charge_amount DESC LIMIT 1
SELECT email_address, cell_number, home_phone FROM professionals LIMIT 100
SELECT email_address, cell_number, home_phone FROM professionals
SELECT breed_name, size_description FROM breeds, sizes WHERE 1 = 1
SELECT breed_name, size_description FROM breeds, sizes WHERE breeds.breed_code = dogs.breed_code AND sizes.size_code = dogs.size_code GROUP BY breeds.breed_name, sizes.size_description
SELECT first_name, treatment_type_description FROM professionals, treatments, treatment_types WHERE professionals.professional_id = treatments.professional_id AND treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT first_name, treatment_type_description FROM professionals, treatments, treatment_types WHERE professionals.professional_id = treatments.professional_id AND treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT COUNT(*) FROM singer WHERE singer_id IS NOT NULL
SELECT COUNT(singer_id) FROM singer
SELECT name FROM singer WHERE net_worth_millions IS NOT NULL ORDER BY net_worth_millions ASC
SELECT name FROM singer ORDER BY net_worth_millions ASC
SELECT s.birth_year, s.citizenship FROM singer AS s
SELECT singer.birth_year, singer.citizenship FROM singer
SELECT name FROM singer WHERE citizenship = 'USA' OR citizenship = 'Germany' OR citizenship = 'Italy' OR citizenship = 'Spain' OR citizenship = 'UK'
SELECT name FROM singer EXCEPT SELECT name FROM singer WHERE citizenship = 'French'
SELECT name FROM singer WHERE birth_year IN (1948, 1949)
SELECT name FROM singer WHERE birth_year IN (1948, 1949)
SELECT TOP 1 name FROM singer ORDER BY net_worth_millions DESC
SELECT TOP 1 name FROM singer ORDER BY net_worth_millions DESC
SELECT citizenship, COUNT(*) AS num_singers FROM singer GROUP BY citizenship
SELECT citizenship, COUNT(*) FROM singer GROUP BY citizenship
SELECT citizenship FROM singer GROUP BY citizenship HAVING COUNT(singer_id) = (SELECT MAX(num_singers) FROM (SELECT citizenship, COUNT(singer_id) AS num_singers FROM singer GROUP BY citizenship))
SELECT TOP 1 citizenship FROM singer GROUP BY citizenship ORDER BY COUNT(citizenship) DESC
SELECT citizenship, net_worth_millions AS max_net_worth FROM singer s1 WHERE net_worth_millions = (SELECT MAX(net_worth_millions) FROM singer s2 WHERE s2.citizenship = s1.citizenship)
SELECT citizenship, net_worth_millions FROM singer s1 WHERE net_worth_millions = (SELECT MAX(net_worth_millions) FROM singer s2 WHERE s1.citizenship = s2.citizenship)
SELECT s.title, r.name FROM song s, singer r WHERE s.singer_id = r.singer_id
SELECT title, name FROM song, singer WHERE song.singer_id = singer.singer_id
SELECT DISTINCT singer.name FROM singer, song WHERE singer.singer_id = song.singer_id AND sales > 300000
SELECT DISTINCT s.name FROM singer s JOIN song so ON s.singer_id = so.singer_id WHERE so.sales > 300000
SELECT DISTINCT s.name FROM singer s INNER JOIN (SELECT singer_id, COUNT(*) as song_count FROM song GROUP BY singer_id HAVING song_count > 1) sc ON s.singer_id = sc.singer_id
SELECT s.name FROM singer s INNER JOIN (SELECT singer_id, COUNT(*) AS song_count FROM song GROUP BY singer_id) sg ON s.singer_id = sg.singer_id WHERE sg.song_count > 1
SELECT singer.name, (SELECT SUM(sales) FROM song WHERE song.singer_id = singer.singer_id) AS total_sales FROM singer
SELECT name, (SELECT SUM(sales) FROM song WHERE singer_id = singer.singer_id) AS total_sales FROM singer
SELECT DISTINCT name FROM singer LEFT JOIN song ON song.singer_id = singer.singer_id WHERE song.singer_id IS NULL
SELECT DISTINCT name FROM singer EXCEPT SELECT s.name FROM singer s JOIN song so ON s.singer_id = so.singer_id
SELECT DISTINCT s1.citizenship FROM singer s1 JOIN singer s2 ON s1.citizenship = s2.citizenship WHERE s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT DISTINCT s1.citizenship FROM singer s1, singer s2 WHERE s1.citizenship = s2.citizenship AND s1.birth_year < 1945 AND s2.birth_year > 1955
SELECT COUNT(DISTINCT property_id) FROM other_property_features
SELECT feature_type_name FROM ref_feature_types, other_available_features WHERE (ref_feature_types.feature_type_code = other_available_features.feature_type_code) AND (other_available_features.feature_name = 'AirCon')
SELECT ref_property_types.property_type_description FROM ref_property_types INNER JOIN properties ON ref_property_types.property_type_code = properties.property_type_code
SELECT property_name FROM properties WHERE (property_type_code = 'House' OR property_type_code = 'Apartment') AND room_count > 1
