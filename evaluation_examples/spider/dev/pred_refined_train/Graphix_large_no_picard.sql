 select count(*) from singer
 select count(*) from singer
 select name, country, age from singer order by age desc, singer_id desc
 select name, country, age from singer order by age desc, singer_id asc
 select avg(age), min(age), max(age) from singer where country = 'France'
 select avg(age), min(age), max(age) from singer where country = 'France'
 select song_name, song_release_year from singer where age = (select min(age) from singer)
 select song_name, song_release_year from singer where age = (select min(age) from singer)
 select distinct country from singer where age > 20
 select distinct country from singer where age > 20
 select country, count(*) from singer group by country
 select country, count(*) from singer group by country
 select distinct song_name from singer where age > (select avg(age) from singer)
 select distinct song_name from singer where age > (select avg(age) from singer)
 select location, name from stadium where capacity between 5000 and 10000
 select location, name from stadium where capacity between 5000 and 10000
 select max(capacity), avg(capacity) from stadium
 select max(capacity), avg(capacity) from stadium
 select s.name, s.capacity from stadium s where s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(st.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg(s.avg)))) from stadium_id))
 select s.name, s.capacity from stadium s where s.avg(s.attendance) = (select max(avg(attendance)) from (select avg(attendance) from stadium group by stadium_id))
 select count(*) from concert where year = 2014 or year = 2015
 select count(*) from concert where year in (2014, 2015)
 select s.name, (select count(*) from concert c where c.stadium_id = s.stadium_id) from stadium s
 select s.stadium_id, count(c.concert_id) from stadium s left join concert c on s.stadium_id = c.stadium_id group by s.stadium_id
 select s.name, s.capacity from stadium s where exists (select 1 from concert c where c.stadium_id = s.stadium_id and c.year >= 2014 group by c.stadium_id)
 select s.name, s.capacity from stadium s where exists (select null from concert c where c.stadium_id = s.stadium_id and c.year > 2013 group by c.stadium_id having count(*)(c.concert_id) = (select max(count(*)) from (select count(*)(*) from concert c where year > 2013 group by stadium_id))
 select year from concert group by year having count(concert_id) = (select max(count(concert_id)) from (select count(concert_id) from concert group by year))
 select year from concert group by year order by count(*) desc limit 1
 select name from stadium where stadium_id not in (select stadium_id from concert)
 select name from stadium where stadium_id not in (select stadium_id from concert)
 select country from singer where age > 40 intersect select country from singer where age < 30
 select name from stadium where stadium_id not in (select stadium_id from concert where year = 2014)
 select name from stadium where stadium_id not in (select stadium_id from concert where year = 2014)
 select concert.concert_name, concert.theme, count(singer_in_concert.singer_id) from concert left join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_id, concert.theme
 select concert.concert_name, concert.theme, count(singer_in_concert.singer_id) from concert left join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_id, concert.theme
 select name, (select count(*) from singer_in_concert where singer_id = singer.singer_id) from singer
 select singer.name, count(*) from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id group by singer.singer_id
 select distinct singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on singer_in_concert.concert_id = concert.concert_id where concert.year = 2014
 select distinct singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on singer_in_concert.concert_id = concert.concert_id where concert.year = 2014
 select distinct s.name, s.country from singer s where exists (select 1 from singer_in_concert si join song s on si.singer_id = s.singer_id where s.song_name like '%hey%' and s.singer_id = s.singer_id)
 select name, country from singer where song_name like '%hey%'
 select stadium.name, stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014 intersect select stadium.name, stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2015
 select stadium.name, stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2014 intersect select stadium.name, stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2015
 select count(*) from concert join stadium on concert.stadium_id = stadium.stadium_id where capacity = (select max(capacity) from stadium)
 select count(distinct concert.concert_id) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = (select max(capacity) from stadium)
 select count(*) from pets where weight > 10
 select count(*) from pets where weight > 10
 select weight from pets where pettype = 'dog' and pet_age = (select min(age) from pets)
 select p.weight from pets p where p.pet_age = (select min(age) from pets)
 select max(weight), pettype from pets group by pettype
 select max(weight), pettype from pets group by pettype
 select count(distinct p.petid) from pets p join has_pet hp on p.petid = hp.petid join student s on hp.stuid = s.stuid where s.age > 20
 select count(distinct p.petid) from pets p join has_pet hp on p.petid = hp.petid join student s on hp.stuid = s.stuid where s.age > 20
 select count(distinct p.petid) from pets p join has_pet hp on p.petid = hp.petid join student s on hp.stuid = s.stuid where s.sex = 'F' and hp.petid in (select s.stuid from student s join pets p on s.stuid = p.petid where sex = 'F')
 select count(*) from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.sex = 'F' and pets.pettype = 'dog'
 select count(distinct pettype) from pets
 select count(distinct pettype) from pets
 select student.fname from student join has_pet on student.stuid = has_pet.stuid where has_pet.petid in (select petid from pets where pettype = 'cat' or pettype = 'dog')
 select s.fname from student s join has_pet hp on s.stuid = hp.stuid where hp.petid in (select petid from pets where pettype in ('cat', 'dog'))
 select s.fname from student s join has_pet hp on s.stuid = hp.stuid where hp.petid in (select petid from pets where pettype = 'cat' intersect select petid from pets where pettype = 'dog')
 select s.fname from student s where exists (select 1 from has_pet ha join pets p on ha.petid = p.petid where ha.stuid = s.stuid and p.pettype = 'cat') and exists (select 1 from has_pet ha join pets p on ha.petid = p.petid where ha.stuid = s.stuid and p.pettype = 'dog')
 select major, age from student where stuid not in (select stuid from has_pet where pettype = 'cat')
 select student.major, student.age from student join has_pet on student.stuid = has_pet.stuid where has_pet.petid not in (select petid from pets where pettype = 'cat')
 select distinct student.stuid from student left join has_pet on student.stuid = has_pet.stuid where has_pet.petid not in (select petid from pets where pettype = 'cat')
 select student.stuid from student except select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'cat'
 select s.fname, s.age from student s where exists (select 1 from has_pet hp join pets pt on hp.petid = pt.petid where hp.stuid = s.stuid and pt.pettype!= 'dog') and exists (select 1 from has_pet hp join pets pt on hp.petid = pt.petid where pt.pettype = 'cat')
 select s.fname from student s where exists (select 1 from has_pet hp join pets pt on hp.petid = pt.petid where hp.stuid = s.stuid and pt.pettype = 'dog') and not exists (select 1 from has_pet hp join pets pt on hp.petid = pt.petid where pt.pettype = 'cat')
 select pettype, weight from pets where pet_age = (select min(age) from pets)
 select pettype, weight from pets where pet_age = (select min(pet_age) from pets)
 select pets.petid, pets.weight from pets join has_pet on pets.petid = has_pet.petid where pets.pet_age > 1
 select pets.petid, pets.weight from pets join has_pet on pets.petid = has_pet.petid where has_pet.stuid = has_pet.stuid and pets.pet_age > 1
 select pettype, avg(pet_age), max(pet_age) from pets group by pettype
 select pettype, avg(pet_age), max(pet_age) from pets group by pettype
 select pettype, avg(weight) from pets group by pettype
 select pettype, avg(weight) from pets group by pettype
 select distinct student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid
 select distinct student.fname, student.age from student join has_pet on student.stuid = has_pet.stuid
 select pets.petid from has_pet join pets on has_pet.petid = pets.petid join student on student.stuid = has_pet.stuid where student.lname = 'Smith'
 select petid from has_pet where stuid in (select stuid from student where lname = 'Smith')
 select count(*), student.stuid from student join has_pet on student.stuid = has_pet.stuid group by student.stuid
 select student.stuid, count(*) from student join has_pet on student.stuid = has_pet.stuid group by student.stuid
 select student.fname, student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count(*) > 1
 select student.fname, student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count(*) > 1
 select lname from student where stuid in (select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pet_age = 3 and has_pet.stuid in (select petid from pets where pet_age = 3))
 select lname from student where stuid in (select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pet_age = 3)
 select avg(age) from student where stuid not in (select stuid from has_pet)
 select avg(age) from student where stuid not in (select stuid from has_pet)
 select count(*) from continents
 select count(*) from continents
 select continents.contid, continents.countryname, count(*) from continents join countries on continents.contid = countries.countryid group by continents.contid
 select continents.contid, continents.countryname, count(*) from continents join countries on continents.contid = countries.countryid group by continents.contid
 select count(*) from countries
 select count(*) from countries
 select car_makers.fullname, car_makers.id, count(*) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
 select car_makers.fullname, car_makers.id, count(model_list.model) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
 select model from model_list where modelid in (select model from cars_data where horsepower = (select min(horsepower) from cars_data))
 select model from model_list where modelid in (select id from cars_data where horsepower = (select min(horsepower) from cars_data))
 select model_list.model from model_list join cars_data on model_list.model = cars_data.id where cars_data.weight < (select avg(weight) from cars_data)
 select model_list.modelid from model_list join cars_data on model_list.modelid = cars_data.id where cars_data.weight < (select avg(weight) from cars_data)
 select car_makers.fullname from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = 1970
 select distinct maker from car_makers where id in (select id from cars_data where year = 1970)
 select car_names.make, cars_data.year from car_names join cars_data on car_names.makeid = cars_data.id where cars_data.year = (select min(year) from cars_data)
 select car_makers.fullname, cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id order by cars_data.year limit 1
 select distinct model from car_names where modelid in (select model from model_list where year > 1980)
 select distinct model_list.model, car_names.model from model_list join car_names on model_list.model = car_names.modelid where cars_data.year > 1980
 select continents.continent, count(*) from continents join car_makers on continents.contid = car_makers.id group by continents.continent
 select continents.continent, count(car_makers.maker) from continents join car_makers on continents.contid = car_makers.id group by continents.continent
 select countryname from countries where countryid in (select country from car_makers group by country having count(id) = (select max(count(id)) from (select count(id) from car_makers group by country)))
 select countryname from countries group by countryid having count(id)(id) = (select max(count(id)) from (select count(id)(id) from car_makers group by country))
 select car_makers.maker, count(distinct model_list.model) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.maker
 select car_makers.id, car_makers.fullname, count(distinct model_list.model) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
 select accelerate from cars_data where exists (select 1 from car_names where car_names.make = 'amc hornet' and car_names.model = 'amc' and car_names.sw ='sw')
 select accelerate from cars_data where id in (select makeid from car_names where make = 'amc hornet' and make ='sw')
 select count(car_makers.maker) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = 'france'
 select count(distinct car_makers.maker) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = 'france'
 select count(*) from countries join model_list on countries.countryid = model_list.countryid where countries.countryname = 'usa'
 select count(distinct model_list.model) from model_list join car_makers on model_list.makeid = car_makers.id join countries on car_makers.countryid = countries.countryid where countries.countryname = 'usa'
 select avg(mpg) from cars_data where cylinders = 4
 select avg(mpg) from cars_data where cylinders = 4
 select min(weight) from cars_data where cylinders = 8 and year = 1974
 select min(weight) from cars_data where cylinders = 8 and year = 1974
 select car_makers.fullname, model_list.model from car_makers join model_list on car_makers.id = model_list.maker
 select car_makers.fullname, model_list.model from car_makers join model_list on car_makers.id = model_list.maker
 select distinct country.countryname, countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid
 select countries.countryname, car_makers.countryid from countries join car_makers on countries.countryid = car_makers.countryid
 select count(*) from cars_data where horsepower > 150
 select count(*) from cars_data where horsepower > 150
 select avg(weight), year from cars_data group by year
 select avg(weight), year from cars_data group by year
 select distinct cntry.country from countries cntry, car_makers cm where cntry.countryid = cm.countryid and cntry.continent = 'europe' group by cntry.countryid, cntry.country having count(cm.maker) >= 3
 select countries.countryname from countries join car_makers on countries.countryid = car_makers.countryid group by countries.countryid having count(*) >= 3
 select max(horsepower), car_names.make from cars_data join car_names on cars_data.model = car_names.model where cars_data.cylinders = 3
 select max(horsepower), car_names.make from cars_data join car_names on cars_data.model = car_names.model where cars_data.cylinders = 3
 select model from car_data where mpg = (select max(mpg) from cars_data)
 select model from cars_data where mpg = (select max(mpg) from cars_data)
 select avg(horsepower) from cars_data where year < 1980
 select avg(horsepower) from cars_data where year < 1980
 select avg(cars_data.edispl) from cars_data join car_names on cars_data.id = car_names.modelid where car_names.model = 'volvo'
 select avg(cars_data.edispl) from cars_data join car_makers on cars_data.id = car_makers.id where car_makers.maker = 'Volvo'
 select max(accelerate), cylinders from cars_data group by cylinders
 select max(accelerate), cylinders from cars_data group by cylinders
 select modelid from model_list join car_names on model_list.model = car_names.model group by modelid having count(car_names.make) = (select max(count(car_names.make)) from (select count(car_names.make) from car_names join model_list on car_names.model = model_list.modelid group by modelid))
 select modelid from model_list join car_names on model_list.model = car_names.model group by modelid order by count(distinct make) desc limit 1
 select count(*) from cars_data where cylinders > 4
 select count(*) from cars_data where cylinders > 4
 select count(*) from cars_data where year = 1980
 select count(*) from cars_data where year = 1980
 select count(distinct model_list.model) from model_list join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'American motor Company'
 select count(distinct model_list.model) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fulname = 'American motor Company'
 select car_makers.maker, car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.maker having count(model_list.model) > 3
 select car_makers.maker, car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by model_list.maker having count(*) > 3
 select distinct model_list.model from car_makers join model_list on car_makers.id = model_list.maker join cars_data on cars_data.model = model_list.model where car_makers.fullname = 'General Motors' or cars_data.weight > 3500
 select distinct model_list.model from car_makers join model_list on car_makers.id = model_list.model where car_makers.fullname = 'General Motors' union select distinct model_list.model from car_makers join model_list on car_makers.id = model_list.model where car_makers.fulname = 'General Motors' or cars_data.weight > 3500
 select year from cars_data where weight <= 3000 intersect select year from cars_data where weight > 4000
 select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000
 select horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)
 select horsepower from cars_data where accelerate = (select max(accelerate) from cars_data)
 select c.cylinders from cars_data c where c.model = 'volvo' and c.accelerate = (select min(accelerate) from cars_data where model = c.id)
 select c.cylinders from cars_data c where c.model = 'volvo' and c.accelerate = (select min(accelerate) from cars_data)
 select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data)
 select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data)
 select count(*) from (select country from car_makers group by country having count(id) > 2)
 select count(*) from countries where countryid in (select country from car_makers group by country having count(id) > 2)
 select count(*) from cars_data where cylinders > 6
 select count(*) from cars_data where cylinders > 6
 select model from cars_data where cylinders = 4 order by horsepower desc limit 1
 select model from cars_data where cylinders = 4 order by horsepower desc limit 1
 select distinct car_names.makeid, car_names.make from car_names join cars_data on car_names.id = cars_data.id where cars_data.horsepower > (select min(horsepower) from cars_data) and car_names.cylinders <= 3
 select distinct car_names.make, car_data.cylinders from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.horsepowerweichen from cars_data where cylinders < 4
 select max(mpg) from cars_data where cylinders = 8 or year < 1980
 select max(mpg) from cars_data where cylinders = 8 or year < 1980
 select model_list.modelid from model_list join car_makers on model_list.maker = car_makers.id where cars_data.weight < 3500 except select model_list.modelid from model_list join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'Ford Motor Company'
 select distinct model_list.model from model_list join car_makers on model_list.maker = car_makers.id join cars_data on cars_data.model = model_list.modelid where cars_data.weight < 3500 and car_makers.fullname!= 'Ford Motor Company'
 select countryname from countries where countryid not in (select country from car_makers)
 select countryname from countries where countryid not in (select country from car_makers)
 select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) >= 2 intersect select car_makers.maker, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) >= 3
 select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) >= 2 intersect select car_makers.id, car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count(*) >= 3
 select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.countryid where car_makers.maker = 'Fiat' group by countries.countryid having count(*) > 3 union select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.countryid group by countries.countryid having count(*) > 3
 select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.countryid group by countries.countryid having count(*) > 3 union select countries.countryid, countries.countryname from countries join car_makers on countries.countryid = car_makers.countryid where car_makers.maker = 'Fiat'
 select country from airlines where airline = 'JetBlue Airways'
 select country from airlines where abbreviation = 'JetBlue Airways'
 select abbreviation from airlines where airline = 'JetBlue Airways'
 select abbreviation from airlines where airline = 'JetBlue Airways'
 select distinct airline, abbreviation from airlines where country = 'USA'
 select airline, abbreviation from airlines where country = 'USA'
 select airportcode, airportname from airports where city = 'Anthony'
 select airportcode, airportname from airports where city = 'Anthony'
 select count(*) from airlines
 select count(*) from airlines
 select count(*) from airports
 select count(*) from airports
 select count(*) from flights
 select count(*) from flights
 select airline from airlines where abbreviation = 'UAL'
 select airline from airlines where abbreviation = 'UAL'
 select count(*) from airlines where country = 'USA'
 select count(*) from airlines where country = 'USA'
 select city, country from airports where airportname = 'Alton'
 select city, country from airports where airportname = 'Alton'
 select airportname from airports where airportcode = 'AKO'
 select airportname from airports where airportcode = 'AKO'
 select distinct airportname from airports where city = 'Aberdeen'
 select airportname from airports where city = 'Aberdeen'
 select count(*) from flights where destairport = 'APG'
 select count(*) from airports join flights on airports.airport = flights.sourceairport where airports.airportcode = 'APG'
 select count(*) from airports join flights on airports.airportcode = flights.destairport where airports.airportcode = 'ATO'
 select count(*) from flights join airports on flights.sourceairport = airports.airportcode where airports.airportcode = 'ATO'
 select count(*) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
 select count(*) from airports join flights on airports.airport = flights.destairport where airports.city = 'Aberdeen'
 select count(*) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
 select count(*) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
 select count(*) from flights where sourceairport in (select airports.airportcode from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' and destination city = 'Ashley')
 select count(*) from flights where destairport in (select airports.airportcode from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' and airports.airportname = 'Ashley')
 select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'JetBlue Airways'
 select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'JetBlue Airways'
 select count(*) from airlines join flights on airlines.uid = flights.uid join airports on airports.airportcode = airports.airportcode where airlines.airline = 'United Airlines' and airports.airportname = 'ASY'
 select count(*) from airlines join flights on airlines.uid = flights.uid join airports on flights.sourceairport = airports.airport where airports.airportcode = 'ASY' and airlines.airline = 'United Airlines'
 select count(*) from airlines join flights on airlines.uid = flights.uid where airlines.airline = 'United Airlines' and flights.destairport = 'AHD'
 select count(*) from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines' and flights.sourceairport = 'AHD'
 select count(*) from airlines join flights on airlines.uid = flights.uid join airports on flights.destairport = airports.airportcode where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
 select count(*) from airlines join flights on airlines.uid = flights.uid join airports on flights.destairport = airports.airport where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
 select airports.city from airports join flights on airports.airport = flights.sourceairport group by airports.city order by count(*) desc limit 1
 select city from airports group by city having count(*)(*) = (select max(count(*)) from (select count(*)(*) from airports group by city))
 select city from (select city, count(destairport) from flights group by city) where count(destairport) = (select max(count(destairport)) from (select count(destairport) from flights group by destairport))
 select city from airports group by city having count(sourceairport) = (select max(count(sourceairport)) from (select count(sourceairport) from flights group by city))
 select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by sum(flights.flightno) desc limit 1
 select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count(*) desc limit 1
 select airportcode from (select airportcode, count(*) from flights group by airportcode) where count(*) = (select min(count(*)) from (select airportcode, count(*) from flights group by airportcode))
 select airportcode from (select airportcode, count(*) from flights group by airportcode) where count(*) = (select min(count(*)) from (select airportcode, count(*) from flights group by airportcode))
 select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline order by count(*) desc limit 1
 select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline order by count(*) desc limit 1
 select abbreviation, country from airlines where uid in (select airline from flights group by airline having sum(flightno) = (select min(sum(flightno)) from (select sum(flightno) from flights group by airline)))
 select abbreviation, country from airlines where uid in (select a.uid from flights f group by a.uid having count(f.flightno) = (select min(count(flightno)) from (select count(flightno) from flights group by airline)))
 select airline from airlines where uid in (select airline from flights where destairport = 'AHD')
 select airline from airlines where uid in (select airline from flights where sourceairport = 'AHD')
 select airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'AHD'
 select airline from airlines where uid in (select airline from flights where sourceairport = 'AHD') and destairport = 'AHD'
 select airline.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'APG' intersect select airline.airline from airlines join flights on airlines.uid = flights.airline where flights.destairport = 'CVO'
 select airline.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'APG' intersect select airline.airline from airlines join flights on airlines.uid = flights.airline where flights.destairport = 'CVO'
 select airline.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'CVO' except select airline.airline from airlines join flights on airlines.uid = flights.uid where flights.sourceairport = 'APG'
 select airline from flights where sourceairport = 'CVO' except select airline from flights where destairport = 'APG'
 select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count(*) >= 10
 select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count(*) >= 10
 select airline from airlines where uid in (select airline from flights where flightno < 200)
 select airline from airlines where uid in (select airline from flights group by airline having count(*) < 200)
 select distinct flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines'
 select flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines'
 select flightno from flights where destairport = 'APG'
 select flightno from flights where destairport = 'APG'
 select flightno from flights where sourceairport = 'APG'
 select flightno from flights where sourceairport = 'APG'
 select distinct flights.flightno from airports join flights on airports.airport = flights.destairport where airports.city = 'Aberdeen'
 select flights.flightno from airports join flights on airports.airport = flights.sourceairport where airports.city = 'Aberdeen'
 select flights.flightno from airports join flights on airports.airport = flights.sourceairport where airports.city = 'Aberdeen'
 select flights.flightno from airports join flights on airports.airport = flights.sourceairport where airports.city = 'Aberdeen'
 select count(*) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
 select count(*) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
 select airportname from airports where airportcode not in (select destairport from flights)
 select airportname from airports except select airports.airportname from airports join flights on airports.airportcode = flights.destairport or flights.airport = flights.sourceairport
 select count(*) from employee
 select count(*) from employee
 select name from employee order by age asc, name by employee_id in case of a tie
 select name from employee order by age asc, name in case of a tie, name asc
 select city, count(*) from employee group by city
 select count(*), city from employee group by city
 select city from employee where age < 30 group by city having count(*) > 1
 select city from employee where age < 30 group by city having count(*) > 1
 select location, count(*) from shop group by location
 select location, count(*) from shop group by location
 select manager_name, district from shop where number_products = (select max(number_products) from shop)
 select manager_name, district from shop where number_products = (select max(number_products) from shop)
 select min(number_products), max(number_products) from shop
 select min(number_products), max(number_products) from shop
 select name, location, district from shop order by number_products desc, shop_id asc
 select name, location, district from shop order by shop_id asc
 select name from shop where number_products > (select avg(number_products) from shop)
 select name from shop where number_products > (select avg(number_products) from shop)
 select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by evaluation.employee_id order by count(*) desc limit 1
 select name from employee where employee_id in (select employee_id from evaluation group by employee_id order by sum(year_awarded) desc limit 1)
 select name from employee where employee_id in (select employee_id from evaluation where bonus = (select max(bonus) from evaluation))
 select e.name from employee e where exists (select 1 from evaluation e where e.employee_id = e.employee_id and e.bonus = (select max(bonus) from evaluation))
 select name from employee where employee_id not in (select employee_id from evaluation)
 select name, employee_id from employee where employee_id not in (select employee_id from evaluation)
 select shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by hiring.shop_id order by count(*) desc limit 1
 select s.name from shop s where s.shop_id in (select h.shop_id from hiring h group by h.shop_id having count(h.employee_id) = (select max(count(employee_id)) from (select count(employee_id) from hiring group by shop_id))
 select name from shop where shop_id not in (select shop_id from hiring)
 select name from shop where shop_id not in (select shop_id from hiring)
 select shop.name, count(hiring.employee_id) from hiring join shop on hiring.shop_id = shop.shop_id group by shop.shop_id
 select shop.name, count(employee_id) from hiring join shop on hiring.shop_id = shop.shop_id group by shop.shop_id
 select sum(bonus) from evaluation
 select sum(bonus) from evaluation
 select * from hiring
 select * from hiring
 select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
 select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
 select count(distinct location) from shop
 select count(distinct location) from shop
 select count(*) from documents
 select count(*) from documents
 select document_id, document_name, document_description from documents
 select document_id, document_name, document_description from documents
 select document_name, template_id from documents where document_description like '%w%'
 select document_name, template_id from documents where document_description like '%w%'
 select document_id, template_id, document_description from documents where document_name = 'Robbin CV'
 select document_id, template_id, document_description from documents where document_name = 'Robbin CV'
 select count(distinct template_id) from documents
 select count(distinct template_id) from documents
 select count(distinct documents.document_id) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'PPT'
 select count(*) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'PPT'
 select t.template_id, count(d.document_id) from templates t left join documents d on t.template_id = d.template_id group by t.template_id
 select template_id, count(*) from documents group by template_id
 select templates.template_id, templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_id order by count(*) desc limit 1
 select t.template_id, t.template_type_code from templates t left join documents d on t.template_id = d.template_id group by t.template_id, t.template_type_code order by count(d.document_id) desc limit 1
 select template_id from documents group by template_id having count(*) > 1
 select template_id from documents group by template_id having count(distinct document_id) > 1
 select template_id from templates except select template_id from documents
 select template_id from templates except select template_id from documents
 select count(*) from templates
 select count(*) from templates
 select template_id, version_number, template_type_code from templates
 select template_id, version_number, template_type_code from templates
 select distinct template_type_code from templates
 select distinct template_type_code from templates
 select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
 select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
 select count(*) from templates where template_type_code = 'CV'
 select count(*) from templates where template_type_code = 'CV'
 select version_number, template_type_code from templates where version_number > 5
 select version_number, template_type_code from templates where version_number > 5
 select template_type_code, count(*) from templates group by template_type_code
 select template_type_code, count(*) from templates group by template_type_code
 select template_type_code from templates group by template_type_code having count(template_id) = (select max(count(template_id)) from (select count(template_id) from templates group by template_type_code))
 select template_type_code from templates group by template_type_code order by count(*) desc limit 1
 select template_type_code from templates group by template_type_code having count(*) < 3
 select template_type_code from templates group by template_type_code having count(*) < 3
 select min(version_number), template_type_code from templates group by template_type_code
 select version_number, template_type_code from templates order by version_number asc limit 1
 select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
 select template_type_code from templates where template_id in (select template_id from documents where document_name = 'Data base')
 select document_name from documents where template_id in (select template_id from templates where template_type_code = 'BK')
 select documents.document_name from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'BK'
 select t.template_type_code, count(d.document_id) from templates t left join documents d on t.template_id = d.template_id group by t.template_type_code
 select templates.template_type_code, count(documents.document_id) from templates left join documents on templates.template_id = documents.template_id group by templates.template_type_code
 select template_type_code from templates group by template_type_code order by count(*) desc limit 1
 select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count(*) desc limit 1
 select template_type_code from templates except select template_type_code from documents
 select template_type_code from ref_template_types except select template_type_code from templates
 select templates.template_type_code, ref_template_types.template_type_description from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code
 select templates.template_type_code, ref_template_types.template_type_description from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code
 select template_type_description from ref_template_types where template_type_code = 'AD'
 select template_type_description from ref_template_types where template_type_code = 'AD'
 select template_type_code from ref_template_types where template_type_description = 'Book'
 select template_type_code from ref_template_types where template_type_description = 'Book'
 select distinct ref_template_types.template_type_description from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code
 select distinct ref_template_types.template_type_description from templates join documents on templates.template_id = documents.template_id
 select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'
 select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'
 select count(*) from paragraphs
 select count(*) from paragraphs
 select count(*) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
 select count(distinct p.paragraph_id) from paragraphs p join documents d on p.document_id = d.document_id where d.document_name = 'Summer Show'
 select * from paragraphs where paragraph_text = 'Korea'
 select * from paragraphs where paragraph_text like '%korea%'
 select paragraphs.paragraph_id, paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Welcome to NY'
 select paragraphs.paragraph_id, paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Welcome to NY'
 select paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Customer reviews'
 select paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'
 select d.document_id, count(p.paragraph_id) from documents d left join paragraphs p on d.document_id = p.document_id group by d.document_id order by d.document_id
 select document_id, count(paragraph_id) from paragraphs group by document_id order by id
 select d.document_id, d.document_name, (select count(*) from paragraphs p where p.document_id = d.document_id) from documents d
 select d.document_id, d.document_name, count(p.paragraph_id) from documents d left join paragraphs p on d.document_id = p.document_id group by d.document_id, d.document_name
 select document_id from paragraphs group by document_id having count(*) >= 2
 select document_id from paragraphs group by document_id having count(*) >= 2
 select d.document_id, d.document_name from documents d, paragraphs p where d.document_id = p.document_id group by d.document_id having count(p.paragraph_id) = (select max(count(paragraph_id)) from (select count(paragraph_id) from paragraphs group by document_id))
 select d.document_id, d.document_name from documents d, paragraphs p where d.document_id = p.document_id group by d.document_id having count(p.paragraph_id) = (select max(count(paragraph_id)) from (select count(paragraph_id) from paragraphs group by document_id))
 select document_id from paragraphs group by document_id order by count(*) asc limit 1
 select document_id from (select document_id, count(paragraph_id) from paragraphs group by document_id) where count(paragraph_id) = (select min(count(paragraph_id)) from (select count(paragraph_id) from paragraphs group by document_id))
 select document_id from paragraphs group by document_id having count(*) between 1 and 2
 select document_id from paragraphs group by document_id having count(*) between 1 and 2
 select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
 select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
 select count(*) from teacher
 select count(*) from teacher
 select name from teacher order by age asc, name asc
 select name, id from teacher order by age asc, id asc
 select age, hometown from teacher
 select age, hometown from teacher
 select name from teacher where hometown!= 'Little lever urban District'
 select distinct name from teacher where hometown!= 'Little lever urban District'
 select name from teacher where age = 32 or age = 33
 select name from teacher where age = 32 or age = 33
 select hometown from teacher where age = (select min(age) from teacher)
 select hometown from teacher order by age asc limit 1
 select hometown, count(*) from teacher group by hometown
 select hometown, count(*) from teacher group by hometown
 select hometown from teacher group by hometown having count(hometown) = (select max(count(hometown)) from (select count(hometown) from teacher group by hometown))
 select hometown from teacher group by hometown having count(hometown) = (select max(count(hometown)) from (select count(hometown) from teacher group by hometown))
 select hometown from teacher group by hometown having count(*) >= 2
 select hometown from teacher group by hometown having count(*) >= 2
 select teacher.name, course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
 select name, course from teacher join course_arrange on teacher.teacher_id = course_arrange.teacher_id
 select teacher.name, course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc
 select teacher.name, course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name, course.course
 select teacher.name from course join course_arrange on course.course_id = course_arrange.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id where course.course = 'Math'
 select name from teacher where teacher_id in (select teacher_id from course_arrange where course_id in (select course_id from course where course = 'Math'))
 select name, (select count(*) from course_arrange where course_arrange.teacher_id = teacher.teacher_id) from teacher
 select teacher.name, count(*) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id
 select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count(*) >= 2
 select teacher.name from course_arrange join course on course_arrange.course_id = course.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count(*) >= 2
 select name from teacher where teacher_id not in (select teacher_id from course_arrange)
 select name from teacher where teacher_id not in (select teacher_id from course_arrange)
 select count(*) from visitor where age < 30
 select name from visitor where level_of_membership > 4 order by level_of_membership desc
 select avg(age) from visitor where level_of_membership <= 4
 select name, level_of_membership from visitor where level_of_membership > 4 order by age
 select m.museum_id, m.name from museum m where m.num_of_staff = (select max(num_of_staff) from museum)
 select avg(num_of_staff) from museum where open_year < 2009
 select open_year, num_of_staff from museum where name = 'Plaza Museum'
 select name from museum where num_of_staff > (select min(num_of_staff) from museum where open_year > 2010)
 select visitor.id, visitor.name, visitor.age from visitor join visit on visitor.id = visit.visit_id group by visitor.id having count(*) > 1
 select v.id, v.name, v.level_of_membership from visitor v join visit v on v.visitor_id = v.visitor_id group by v.id having sum(v.total_spent) = (select max(sum(total_spent)) from (select sum(total_spent) from visit group by visitor_id))
 select m.museum_id, m.name from museum m where exists (select 1 from visit v where v.museum_id = m.museum_id group by v.museum_id having count(v.museum_id) = (select max(count(museum_id)) from (select count(museum_id) from visit group by museum_id)))
 select name from museum where museum_id not in (select museum_id from visit)
 select visitor.name, visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visit.visitor_id order by sum(num_of_ticket) desc limit 1
 select avg(num_of_ticket), max(num_of_ticket) from visit
 select sum(visit.total_spent) from visit join visitor on visit.visitor_id = visitor.id where visitor.level_of_membership = 1
 select distinct v.name from visitor v where exists (select 1 from visit v join museum m on v.museum_id = m.museum_id where v.visitor_id = v.visitor_id and m.open_year < 2009) and exists (select 1 from visit v join museum m on v.museum_id = m.museum_id where v.visit.open_year > 2011)
 select count(*) from visitor where id not in ( select visitor_id from visit where museum_id in (select museum_id from museum where open_year > 2010 ) )
 select count(*) from museum where open_year > 2013 or open_year < 2008
 select count(*) from players
 select count(*) from players
 select count(*) from matches
 select count(*) from matches
 select first_name, birth_date from players where country_code = 'USA'
 select first_name, birth_date from players where country_code = 'USA'
 select avg(loser_age), avg(winner_age) from matches
 select avg(loser_age), avg(winner_age) from matches
 select avg(winner_rank) from matches
 select avg(winner_rank) from matches
 select max(loser_rank) from matches
 select max(loser_rank) from matches
 select count(distinct country_code) from players
 select count(distinct country_code) from players
 select count(distinct loser_name) from matches
 select count(distinct loser_name) from matches
 select tourney_name from matches group by tourney_id having count(*) > 10
 select tourney_name from matches group by tourney_name having count(*) > 10
 select winner_name from matches where year = 2013 intersect select winner_name from matches where year = 2016
 select players.first_name, players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2013 intersect select players.first_name, players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2016
 select count(*) from matches where year = 2013 or year = 2016
 select count(*) from matches where year in (2013, 2016)
 select p.country_code, p.first_name from players p where p.player_id in (select m.player_id from matches m where m.tourney_name = 'WTA Championships' intersect select m.player_id from matches m join winners w on m.winner_id = w.winner_id where m.tourney_name = 'Australian Open')
 select p.first_name, p.country_code from players p where exists (select 1 from matches m where m.winner_id = p.player_id and m.tournament_name = 'WTA Championships') and exists (select 1 from matches m where m.winner_id = p.player_id and m.tournament_name = 'Australian Open')
 select first_name, country_code from players order by birth_date desc limit 1
 select first_name, country_code from players where birth_date = (select min(birth_date) from players)
 select first_name, last_name from players order by birth_date, then (select count(*) from players where birth_date = '1999-01-01') order by player_id asc
 select first_name
 select first_name, last_name from players where hand = 'left' or hand = 'l' order by birth_date
 select first_name
 select p.first_name, p.country_code from players p where exists (select 1 from rankings r where r.player_id = p.player_id group by r.player_id having count(r.tours) = (select max(count(tours)) from (select count(tours) from rankings group by player_id)))
 select p.first_name, p.country_code from players p where exists (select 1 from rankings r where r.player_id = p.player_id group by r.player_id having count(r.tours) = (select max(count(tours)) from (select count(tours) from rankings group by player_id)))
 select year from matches group by year having count(match_num) = (select max(count(match_num)) from (select count(match_num) from matches group by year))
 select min(year) from matches group by year having count(*) = (select max(count(*)) from (select count(*) from matches group by year))
 select players.first_name, players.last_name, sum(matches.winner_rank_points) from matches join players on matches.winner_id = players.player_id group by matches.winner_id order by count(*) desc limit 1
 select p.first_name, p.last_name, sum(m.winner_rank_points) from players p join matches m on p.player_id = m.winner_id group by p.player_id having count(m.match_num) = (select max(count(match_num)) from (select count(match_num) from matches group by winner_id))
 select p.first_name, p.last_name from players p where exists (select 1 from matches m where m.winner_rank = (select max(winner_rank_points) from matches where tourney_name = 'Australian Open') and m.winner_id = p.winner_id)
 select p.first_name, p.last_name from players p where exists (select 1 from matches m where m.winner_rank = p.winner_id and m.tournament_name = 'Australian Open')
 select loser_name, winner_name from matches where minutes = (select max(minutes) from matches)
 select p.winner_name, p.loser_name from players p join matches m on p.player_id = m.loser_id where m.year = (select max(year) from matches)
 select players.first_name, players.player_id, avg(rankings.ranking) from players join rankings on players.player_id = rankings.player_id group by players.player_id
 select players.first_name, players.player_id, avg(rankings.ranking_points) from players join rankings on players.player_id = rankings.player_id group by players.player_id
 select p.first_name, p.player_id, sum(r.ranking_points) from players p join rankings r on p.player_id = r.player_id group by p.player_id
 select players.first_name, sum(rankings.ranking_points) from players join rankings on players.player_id = rankings.player_id group by rankings.player_id except select player_id, sum(rankings.ranking_points) from rankings where ranking_points = 0
 select country_code, count(*) from players group by country_code
 select country_code, count(*) from players group by country_code
 select country_code from players group by country_code having count(player_id) = (select max(count(player_id)) from (select count(player_id) from players group by country_code))
 select country_code from players group by country_code having count(player_id)(player_id) = (select max(count(player_id)) from (select count(player_id)(player_id) from players group by country_code))
 select country_code from players group by country_code having count(*) > 50
 select country_code from players group by country_code having count(*) > 50
 select ranking_date, count(*) from rankings group by ranking_date
 select ranking_date, sum(tours) from rankings group by ranking_date
 select count(*), year from matches group by year
 select year, count(*) from matches group by year
 select winner_name, winner_rank from matches order by winner_age desc limit 3
 select winner_name, winner_rank from matches order by winner_age asc limit 3
 select count(distinct p.winner_id) from matches m join winners p on m.winner_id = p.winner_id where m.tournament_name = 'WTA Championships' and p.hand = 'left'
 select count(*) from matches where tourney_name = 'WTA Championships' and winner_hand = 'left'
 select p.first_name, p.country_code, p.birth_date from players p join matches m on p.player_id = m.winner_id where m.winner_rank = (select max(winner_rank_points) from matches)
 select p.first_name, p.country_code, p.birth_date from players p inner join matches m on p.player_id = m.player_id where m.winner_rank_points = (select max(winner_rank_points) from matches)
 select hand, count(*) from players group by hand
 select hand, count(*) from players group by hand
 select count(*) from ship where disposition_of_ship = 'Captured'
 select name, tonnage from ship order by name desc, tonnage asc
 select name, date, result from battle
 select max(death), min(death) from death group by caused_by_ship_id
 select avg(injured), caused_by_ship_id from death group by caused_by_ship_id
 select death.killed, death.injured from death join caused_by_ship_id on death.caused_by_ship_id = caused_by_ship_id where ship.tannage = 'T'
 select name, result from battle where bulgarian_commander!= 'Boril'
 select distinct battle.id, battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = 'Brig'
 select battle.id, battle.name from battle join death on battle.id = death.caused_by_ship_id group by death.caused_by_ship_id having count(*) > 10
 select s.id, s.name from ship s join death d on s.id = d.caused_by_ship_id group by s.id order by sum(d.injured) desc limit 1
 select distinct battle.name from battle join bulgarian_commander on battle.battle_id = bulgarian_commander.id join latin_commander on battle.latin_commander = latin_commander.baldwin_i
 select count(distinct result) from battle
 select count(*) from battle where id not in ( select id from ship where tonnage = '225' )
 select battle.name, battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'Lettice' intersect select battle.name, battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'HMS Atalanta'
 select b.name, b.result, b.bulgararian_commander from battle b where not exists (select 1 from ship s where s.id = b.id and s.location = 'English Channel')
 select note from death where note like '%east%'
 select * from addresses where line_1 includes line_2
 select line_1, line_2 from addresses
 select count(*) from courses
 select count(*) from courses
 select course_description from courses where course_name ='math'
 select course_description from courses where course_name ='math'
 select zip_postcode from addresses where city = 'Port Chelsea'
 select zip_postcode from addresses where city = 'Port Chelsea'
 select department_name, department_id from departments where department_id in (select department_id from degree_programs group by department_id having count(degree_program_id) = (select max(count(degree_program_id)) from (select count(degree_program_id) from degree_programs group by department_id)))
 select d.department_name, d.department_id from departments d, degree_programs dp where d.department_id = dp.department_id group by d.department_id having count(dp.degree_program_id) = (select max(count(degree_program_id)) from (select count(degree_program_id) from degree_programs group by department_id))
 select count(distinct department_id) from degree_programs
 select count(distinct department_id) from degree_programs
 select count(distinct degree_summary_name) from degree_programs
 select count(distinct degree_program_id) from degree_programs
 select count(*) from departments join degree_programs on departments.department_id = degree_programs.department_id where departments.department_name = 'Engineering'
 select count(*) from departments join degree_programs on departments.department_id = degree_programs.department_id where departments.department_name = 'Engineering'
 select section_name, section_description from sections
 select section_name, section_description from sections
 select courses.course_name, sections.course_id from courses join sections on courses.course_id = sections.course_id group by sections.course_id having count(*) <= 2
 select courses.course_name, sections.course_id from courses join sections on courses.course_id = sections.course_id group by sections.course_id having count(*) < 2
 select section_name from sections order by section_name desc
 select section_name from sections order by section_name desc
 select semesters.semester_name, semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count(*) desc limit 1
 select semesters.semester_name, student_enrolment.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by student_enrolment.semester_id order by count(*) desc limit 1
 select department_description from departments where department_name like '%computer%'
 select department_description from departments where department_name like '%computer%'
 select students.first_name, students.middle_name, students.last_name, student_enrolment.degree_program_id from student_enrolment join degrees on student_enrolment.degree_program_id = degrees.degree_program_id join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count(degree_program_id) = 2
 select students.first_name, students.middle_name, students.last_name, student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count(*) = 2
 select first_name, middle_name, last_name from students where student_id in (select student_id from student_enrolment where degree_program_id in (select degree_program_id from degree_programs where degree_summary_name = 'Bachelor'))
 select students.first_name, students.middle_name, students.last_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id join students on student_enrolment.student_id = students.student_id where degree_programs.degree_summary_name = 'Bachelors'
 select degree_programs.degree_program_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by degree_programs.degree_program_id order by count(*) desc limit 1
 select degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by degree_programs.degree_summary_name order by count(*) desc limit 1
 select degree_program_id, sum(degree_program_name) from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_program_id order by count(*) desc limit 1
 select degree_programs.degree_program_id, degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_program_id order by count(*) desc limit 1
 select s.student_id, s.first_name, s.middle_name, s.last_name, count(s.student_id) from students s join student_enrolment se on s.student_id = se.student_id group by s.student_id having count(se.student_id) = (select max(count(student_id)) from (select count(student_id) from student_enrolment group by student_id))
 select s.first_name, s.middle_name, s.last_name, s.student_id, count(s.student_id) from students s join student_enrolment se on s.student_id = se.student_id group by s.student_id order by count(s.student_id) desc limit 1
 select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)
 select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)
 select distinct course_name from courses where course_id in (select course_id from student_enrolment_courses)
 select course_name from courses where course_id in (select course_id from student_enrolment_courses where student_enrolment_id = 1 group by course_id having count(student_id) >= 1)
 select course_name from courses where course_id in (select course_id from student_enrolment_courses group by course_id having count(student_enrolment_id) = (select max(count(student_enrolment_id)) from (select count(student_enrolment_id) from student_enrolment_courses group by course_id)))
 select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by student_enrolment_courses.course_id order by count(*) desc limit 1
 select last_name from students where current_address_id in (select permanent_address_id from addresses where state_province_county = 'North Carolina') and student_id not in (select student_id from student_enrolment)
 select last_name from students where current_address_id = 'NC' and student_id not in (select student_id from student_enrolment)
 select transcripts.transcript_date, transcript_contents.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count(*) >= 2
 select transcripts.transcript_date, transcript_contents.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count(*) >= 2
 select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
 select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
 select first_name, middle_name, last_name from students order by date_first_registered asc limit 1
 select first_name, middle_name, last_name from students order by date_first_registered asc limit 1
 select first_name, middle_name, last_name from students order by date_left asc limit 1
 select first_name, middle_name, last_name from students order by date_first_registered limit 1
 select first_name from students where permanent_address_id!= current_address_id
 select first_name from students where permanent_address_id!= current_address_id
 select addresses.address_id, addresses.line_1 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count(*) desc limit 1
 select addresses.address_id, addresses.line_1, addresses.line_2 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count(*) desc limit 1
 select avg(transcript_date) from transcripts
 select avg(transcript_date) from transcripts
 select transcript_date, other_details from transcripts order by transcript_date asc limit 1
 select transcript_date, other_details from transcripts where transcript_date = (select min(transcript_date) from transcripts)
 select count(*) from transcripts
 select count(*) from transcripts
 select transcript_date from transcripts order by transcript_date desc limit 1
 select transcript_date from transcripts order by transcript_date desc limit 1
 select count(distinct student_enrolment_id) from student_enrolment_courses where count(student_enrolment_id) <= (select max(count(student_enrolment_id)) from (select count(student_enrolment_id) from student_enrolment_courses join transcripts on student_enrolment_courses.transcript_id = transcripts.transcript_id group by student_enrolment_id))
 select c.course_name, s.student_enrolment_course_id from courses c left join student_enrolment_courses s on c.course_id = s.course_id left join transcript_contents tc on s.transcript_id = tc.transcript_id group by c.course_id order by count(tc.transcript_id) desc limit 1
 select t.transcript_date, t.transcript_id from transcripts t left join transcript_contents tc on t.transcript_id = tc.transcript_id group by t.transcript_id order by count(tc.student_id) asc limit 1
 select t.transcript_date, t.transcript_id from transcripts t left join transcript_contents tc on t.transcript_id = tc.transcript_id group by t.transcript_id order by count(tc.result_id) asc limit 1
 select semester_name from semesters where semester_id in (select semester_id from student_enrolment where student_id in (select student_id from degree_programs where degree_summary_name = 'Master') intersect select semester_id from student_enrolment where student_id in (select student_id from degree_programs where degree_summary_name = 'Bachelor'))
 select semester_id from student_enrolment where student_id in (select semester_id from student_enrolment where degree_program_id = MA intersect select semester_id from student_enrolment where degree_program_id = BA)
 select count(distinct current_address_id) from students
 select distinct addresses.address_details from addresses join students on addresses.address_id = students.current_address_id intersect select distinct addresses.address_details from addresses join students on addresses.address_id = students.permanent_address_id
 select * from students order by other_student_details desc
 select other_student_details from students order by other_student_details desc
 select section_description from sections where section_name = 'H'
 select section_description from sections where section_name = 'H'
 select first_name from students where permanent_address_id in (select address_id from addresses where country = 'Haiti') or cell_mobile_number = 09700166582
 select first_name from students where permanent_address_id in (select address_id from addresses where country = 'Haiti') or cell_mobile_number = 09700166582
 select title from cartoon order by title
 select title from cartoon order by title
 select title from cartoon where directed_by = 'Ben Jones'
 select title from cartoon where directed_by = 'Ben Jones'
 select count(*) from cartoon where written_by = 'Joseph Kuhr'
 select count(*) from cartoon where written_by = 'Joseph Kuhr'
 select title, directed_by from cartoon order by original_air_date, id
 select title, directed_by from cartoon order by original_air_date asc, id asc
 select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
 select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
 select country, count(*) from tv_channel group by country having count(*) = (select max(count(*)) from (select count(*) from tv_channel group by country))
 select country, count(*) from tv_channel group by country having count(*) = (select max(count(*)) from (select count(*) from tv_channel group by country))
 select count(distinct series_name), count(distinct content) from tv_channel
 select count(distinct series_name), count(distinct content) from tv_channel
 select content from tv_channel where series_name = 'Sky Radio'
 select content from tv_channel where series_name = 'Sky Radio'
 select package_option from tv_channel where series_name = 'Sky Radio'
 select package_option from tv_channel where series_name = 'Sky Radio'
 select count(*) from tv_channel where language = 'English'
 select count(*) from tv_channel where language = 'English'
 select language, count(*) from tv_channel group by language order by count(*) asc limit 1
 select language, count(*) from tv_channel group by language order by count(*) asc limit 1
 select language, count(*) from tv_channel group by language
 select language, count(*) from tv_channel group by language
 select tv_channel.series_name from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.title = 'The rise of the blue beetle!'
 select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = 'The rise of the blue beetle!'
 select cartoon.title from tv_channel join cartoon on tv_channel.id = cartoon.id where tv_channel.series_name = 'Sky Radio'
 select cartoon.title from cartoon join tv_channel on cartoon.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
 select episode from tv_series order by rating, id asc
 select episode, id from tv_series order by rating
 select episode, rating from tv_series order by rating desc limit 3
 select episode, rating from tv_series order by rating desc limit 3
 select min(share), max(share) from tv_series
 select max(share), min(share) from tv_series
 select air_date from tv_series where episode = 'A love of a Lifetime'
 select air_date from tv_series where episode = 'A love of a Lifetime'
 select weekly_rank from tv_series where episode = 'A love of a Lifetime'
 select weekly_rank from tv_series where episode = 'A love of a Lifetime'
 select tv_channel.series_name from tv_channel join tv_series on tv_channel.id = tv_series.id where tv_series.episode = 'A love of a Lifetime'
 select tv_series.series_name from tv_series join tv_channel on tv_series.id = tv_channel.id where tv_series.episode = 'A love of a Lifetime'
 select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = 'Sky Radio'
 select tv_series.episode from tv_series join tv_channel on tv_series.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
 select directed_by, count(*) from cartoon group by directed_by
 select directed_by, count(*) from cartoon group by directed_by
 select production_code, channel from cartoon where original_air_date = (select max(original_air_date) from cartoon)
 select production_code, channel from cartoon order by original_air_date desc limit 1
 select tv_channel.package_option, tv_channel.series_name from tv_channel where tv_channel.hight_definition_tv is not null
 select tv_channel.package_option, tv_channel.series_name from tv_channel join tv_series on tv_channel.id = tv_series.channel where tv_channel.hight_definition_tv is supported
 select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.id where cartoon.written_by = 'Todd Casey'
 select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.id where cartoon.written_by = 'Todd Casey'
 select country from tv_channel except select channel from cartoon where written_by = 'Todd Casey'
 select tv_channel.country from tv_channel left join cartoon on tv_channel.id = cartoon.id where cartoon.written_by!= 'Todd Casey'
 select tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones' intersect select tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Michael Chang'
 select distinct tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones' intersect select tv_channel.series_name, tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Michael Chang'
 select pixel_aspect_ratio_par, country from tv_channel where language!= 'English'
 select pixel_aspect_ratio_par, country from tv_channel where language!= 'English'
 select id from tv_channel where country in (select country from tv_channel group by country having count(*) > 2)
 select id from tv_channel where country in (select country from tv_channel group by country having count(*) > 2)
 select tv_channel.id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
 select tv_channel.id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
 select tv_channel.package_option from tv_channel where tv_channel.id not in (select channel from cartoon where directed_by = 'Ben Jones')
 select tv_channel.package_option from tv_channel where id not in (select channel from cartoon where directed_by = 'Ben Jones')
 select count(*) from poker_player
 select count(*) from poker_player
 select earnings from poker_player order by earnings desc
 select earnings from poker_player order by earnings desc, people_id asc
 select final_table_made, best_finish from poker_player
 select final_table_made, best_finish from poker_player
 select avg(earnings) from poker_player
 select avg(earnings) from poker_player
 select money_rank from poker_player order by earnings desc limit 1
 select money_rank from poker_player order by earnings desc limit 1
 select max(final_table_made) from poker_player where earnings < 200000
 select max(final_table_made) from poker_player where earnings < 200000
 select people.name from poker_player join people on poker_player.people_id = people.people_id
 select people.name from poker_player join people on poker_player.people_id = people.people_id
 select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
 select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
 select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made desc, people.earnings asc
 select people.name, poker_player.people_id from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc, people.name asc
 select p.birth_date from people p inner join poker_player p on p.people_id = p.people_id where p.earnings = (select min(earnings) from poker_player)
 select p.birth_date from people p inner join poker_player p on p.people_id = p.people_id where p.earnings = (select min(earnings) from poker_player)
 select poker_player.money_rank from people join poker_player on people.people_id = poker_player.people_id order by people.height desc limit 1
 select poker_player.money_rank from people join poker_player on people.people_id = poker_player.people_id order by people.height desc limit 1
 select avg(poker_player.earnings) from people join poker_player on people.people_id = poker_player.people_id where people.height > 200
 select avg(poker_player.earnings) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
 select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc, people.name if there is a tie, order by people.name
 select people.name, poker_player.people_id from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc, people.name asc
 select nationality, count(*) from people group by nationality
 select nationality, count(*) from people group by nationality
 select nationality from people group by nationality having count(nationality) = (select max(count(nationality)) from (select count(nationality) from people group by nationality)
 select p.nationality from people p group by p.nationality having count(p.nationality)(p.nationality) = (select max(count(p.nationality)) from (select count(p.nationality)(p.nationality) from people p group by p.nationality) temp)
 select nationality from people group by nationality having count(*) >= 2
 select nationality from people group by nationality having count(*) >= 2
 select name, birth_date from people order by name asc, people_id asc
 select name, birth_date from people order by name asc
 select name from people where nationality!= 'Russia'
 select name from people where nationality!= 'Russia'
 select name from people where people_id not in (select people_id from poker_player)
 select name from people where people_id not in (select people_id from poker_player)
 select count(distinct nationality) from people
 select count(distinct nationality) from people
 select count(distinct state) from area_code_state
 select contestant_number, contestant_name from contestants order by contestant_name desc
 select vote_id, phone_number, state from votes
 select max(area_code), min(area_code) from area_code_state
 select max(created) from votes where state = 'CA'
 select contestant_name from contestants where contestant_name!= 'Jessie Alloway'
 select distinct state, created from votes
 select contestants.contestant_number, contestants.contestant_name from votes join contestants on votes.contestant_number = contestants.contestant_number group by votes.contestant_number having count(*) >= 2
 select c.contestant_number, c.contestant_name from contestants c where exists (select 1 from votes v where v.contestant_number = c.contestant_number and v.vote_id = 0)
 select count(*) from votes where state in ('NY', 'CA')
 select count(*) from contestants where contestant_number not in (select contestant_number from votes)
 select distinct acs.area_code from area_code_state acs join votes v on acs.state = v.state group by acs.state order by count(v.vote_id) desc limit 1
 select votes.created, votes.state, votes.phone_number from votes join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling'
 select area_code from area_code_state where area_code_state in (select area_code from votes where contestant_number in (select contestant_number from contestants where contestant_name = 'Tabatha Gehling') intersect select area_code from votes where contestant_number in (select contestant_number from contestants where contestant_name = 'Kelly Clauss'))
 select contestant_name from contestants where contestant_name like '%al%'
 select name from country where indepyear > 1950
 select name from country where indepyear > 1950
 select count(*) from country where governmentform = 'Republic'
 select count(*) from country where governmentform = 'Republic'
 select sum(surfacearea) from country where region = 'Caribbean'
 select sum(surfacearea) from country where continent = 'Carribean'
 select continent from country where name = 'Anguilla'
 select continent from country where name = 'Anguilla'
 select district from city where name = 'Kabul'
 select country.region from city join country on city.id = country.code where city.name = 'Kabul'
 select language from countrylanguage where countrycode = (select code from country where name = 'Aruba') group by language having count(*) = (select max(count(*)) from (select count(*) from countrylanguage where name = 'Aruba' group by language))
 select language from countrylanguage where countrycode = (select code from country where name = 'Aruba') group by language having count(language) = (select max(count(language)) from (select count(language) from country where name = 'Aruba' group by language))
 select population, lifeexpectancy from country where name = 'Brazil'
 select population, lifeexpectancy from country where name = 'Brazil'
 select region, population from country where name = 'Angola'
 select region, population from country where name = 'Angola'
 select avg(lifeexpectancy) from country where region = 'Central Africa'
 select avg(lifeexpectancy) from country where region = 'Central Africa'
 select name from country where lifeexpectancy = (select min(lifeexpectancy) from country where continent = 'Asia')
 select name from country where continent = 'Asia' and lifeexpectancy = (select min(lifeexpectancy) from country where continent = 'Asia')
 select sum(population), max(gnp) from country where continent = 'Asia'
 select sum(population), max(gnp) from country where continent = 'Asia' group by countrycode
 select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'
 select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'
 select sum(surfacearea) from country where continent = 'Asia' intersect select sum(surfacearea) from country where continent = 'Europe'
 select sum(surfacearea) from country where continent = 'Asia' or continent = 'Europe'
 select population from city where district = 'Gelderland'
 select sum(population) from city where district = 'Gelderland'
 select avg(gnp), sum(population) from country where governmentform = 'US Territory'
 select avg(gnp), sum(population) from country where governmentform = 'US Territory'
 select count(distinct language) from countrylanguage
 select count(distinct language) from countrylanguage
 select count(distinct governmentform) from country where continent = 'Africa'
 select count(distinct governmentform) from country where continent = 'Africa'
 select count(distinct language) from country where name = 'Aruba'
 select count(distinct language) from country where name = 'Aruba'
 select count(distinct language) from countrylanguage where countrycode = (select code from country where name = 'Afghanistan')
 select count(distinct language) from countrylanguage where countrycode in (select code from country where name = 'Afghanistan')
 select name from country where code in (select countrycode from countrylanguage group by countrycode having count(language) = (select max(count(language)) from (select count(language) from countrylanguage group by countrycode)))
 select name from country where code in (select countrycode from countrylanguage group by countrycode having count(language) = (select max(count(language)) from (select count(language) from countrylanguage group by countrycode)))
 select distinct continent from countrylanguage group by continent having count(language) = (select max(count(language)) from (select count(language) from countrylanguage group by continent))
 select continent from countrygroup by continent having count(language) = (select max(count(language)) from (select count(language) from countrygroup by continent))
 select count(*) from countrylanguage where language = 'English' intersect select count(*) from countrylanguage where language = 'Dutch'
 select count(*) from countrylanguage where language = 'English' intersect select count(*) from countrylanguage where language = 'Dutch'
 select name from country where code in (select countrycode from countrylanguage where language = 'English' intersect select countrycode from countrylanguage where language = 'French')
 select name from country where code in (select countrycode from countrylanguage where language = 'English' intersect select countrycode from countrylanguage where language = 'French')
 select name from country where code in (select countrycode from countrylanguage where language = 'English' intersect select countrycode from countrylanguage where language = 'French')
 select name from country where code in (select countrycode from countrylanguage where language = 'English' intersect select countrycode from countrylanguage where language = 'French')
 select count(distinct country.continent) from country join countrylanguage on country.countrycode = countrylanguage.countrycode where countrylanguage.language = 'Chinese'
 select count(distinct continent) from country where code in (select countrycode from countrylanguage where language = 'Chinese')
 select region from country where countrycode in (select countrycode from countrylanguage where language in ('English', 'Dutch'))
 select region from country where countrycode in (select countrycode from countrylanguage where language in ('Dutch', 'English'))
 select distinct country.name from country join countrylanguage on country.countrycode = countrylanguage.countrycode where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
 select name from country where language = 'English' or language = 'Dutch'
 select language from countrylanguage where countrycode in (select code from country where continent = 'Asia' group by language) order by count(*) desc limit 1
 select language from countrylanguage where countrycode in (select code from country where continent = 'Asia' group by code order by count(*) desc limit 1)
 select language from countrylanguage where countrycode in (select code from country where governmentform = 'Republic' group by language having count(distinct language) = 1)
 select language from countrylanguage where countrycode in (select code from country where governmentform = 'Republic' group by countrycode)
 select name, population from city where id in (select id from countrylanguage where language = 'English') order by population desc limit 1
 select c.name, c.population from city c where exists (select 1 from countrylanguage cl where cl.countrycode = c.countrycode and cl.language = 'English') group by c.id having count(cl.language) = (select max(count(language)) from (select count(language) from countrylanguage where language = 'English') group by countrylanguage)
 select name, population, lifeexpectancy from country where continent = 'Asia' and surfacearea = (select max(surfacearea) from country where continent = 'Asia')
 select name, population, lifeexpectancy from country where continent = 'Asia' and surfacearea = (select max(surfacearea) from country where continent = 'Asia')
 select avg(lifeexpectancy) from country where code in (select countrycode from countrylanguage where language!= 'English')
 select avg(lifeexpectancy) from country where code in (select countrycode from countrylanguage where language!= 'English')
 select total(country.population) from country where countrycode not in (select countrycode from countrylanguage where language = 'English')
 select count(*) from country where code not in (select countrycode from countrylanguage where language = 'English')
 select language from countrylanguage where countrycode in (select code from country where headofstate = 'Beatrix')
 select language from countrylanguage where countrycode in (select code from country where headofstate = 'Beatrix')
 select count(distinct language) from countrylanguage where countrycode in (select code from country where indepyear < 1930)
 select count(distinct language) from countrylanguage where countrycode in (select code from country where indepyear < 1930)
 select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')
 select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')
 select name from country where population < (select max(population) from country where continent = 'Asia')
 select name from country where population < (select max(population) from country where continent = 'Asia')
 select name from country where population > (select max(population) from country where continent = 'Africa')
 select name from country where continent = 'Asia' and population > (select min(population) from country where continent = 'Africa')
 select countrycode from country where language!= 'English'
 select countrycode from country where language!= 'English'
 select countrycode from countrylanguage where language!= 'English'
 select countrycode from countrylanguage where language!= 'English'
 select countrycode from country where language!= 'English' and governmentform!= 'Republic'
 select countrycode from country where language!= 'English' and governmentform!= 'Republic'
 select name from city where countrycode in (select countrycode from countrylanguage where language!= 'English') and countrycode in (select countrycode from country where continent = 'Europe')
 select name from city where countrycode in (select countrycode from countrylanguage where language!= 'English') and countrycode in (select countrycode from country where continent = 'Europe')
 select distinct city.name, city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'Chinese'
 select distinct city.name from city join countrylanguage on city.countrycode = countrylanguage.countrycode where country.continent = 'Asia' and countrylanguage.language = 'Chinese'
 select name, indepyear, surfacearea from country where population = (select min(population) from country)
 select name, indepyear, surfacearea from country where population = (select min(population) from country)
 select population, name, headofstate from country where surfacearea = (select max(surfacearea) from country)
 select name, population, headofstate from country where surfacearea = (select max(surfacearea) from country)
 select country.name, count(*) from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.countrycode having count(*) >= 3
 select c.name, (select count(*) from countrylanguage where countrycode = c.countrycode) from country c where c.code in (select countrycode from countrylanguage group by countrycode having count(*) > 2)
 select count(*), district from city where population > (select avg(population) from city) group by district
 select count(*), district from city where population > (select avg(population) from city) group by district
 select governmentform, sum(population) from country group by governmentform having avg(lifeexpectancy) > 72
 select governmentform, sum(population) from country group by governmentform having avg(lifeexpectancy) > 72
 select avg(lifeexpectancy), sum(population), continent from country group by continent having avg(lifeexpectancy) < 72
 select sum(population), avg(lifeexpectancy) from country where continent in (select continent from country group by continent having avg(lifeexpectancy) < 72)
 select name, surfacearea from country order by surfacearea desc limit 5 (select max(surfacearea) from country) order by name asc
 select name, surfacearea from country order by surfacearea desc, population asc
 select name from country order by population desc limit 3 then order by countrycode asc
 select name from country order by population desc limit 3 then (select code from country where population = (select max(population) from country)) order by code2 asc
 select name from country order by population asc limit 3 then (select count(*) from country where population = (select min(population) from country)) order by countrycode asc
 select name from country order by population asc limit 3
 select count(*) from country where continent = 'Asia'
 select count(*) from country where continent = 'Asia'
 select name from country where continent = 'Europe' and population = 80000
 select name from country where continent = 'Europe' and population = 80000
 select sum(population), avg(surfacearea) from country where continent = 'North America' and surfacearea > 3000
 select sum(population), avg(surfacearea) from country where region = 'North America' and surfacearea > 3000
 select name from city where population between 160000 and 900000
 select name from city where population between 160000 and 900000
 select language from countrylanguage group by language having count(countrycode) = (select max(count(countrycode)) from (select count(countrycode) from countrylanguage group by language))
 select language from countrylanguage group by language having count(countrycode) = (select max(count(countrycode)) from (select count(countrycode) from countrylanguage group by language))
 select language, countrycode, name from countrylanguage where percentage = (select max(proportion) from countrylanguage)
 select countrycode, language from countrylanguage group by countrycode order by percentage desc limit 1
 select count(*) from countrylanguage where language = 'Spanish' group by countrylanguage order by percentage desc limit 1
 select count(*) from countrylanguage where language = 'Spanish' group by countrycode
 select countrycode from countrylanguage where language = 'Spanish' group by countrycode having percentage = (select max(proportion) from countrylanguage where language = 'Spanish')
 select countrycode from countrylanguage where language = 'Spanish' group by countrycode having count(*) = (select max(count(*)) from (select count(*) from countrylanguage where language = 'Spanish' group by countrycode))
 select count(*) from conductor
 select count(*) from conductor
 select name from conductor order by age asc, conductor_id
 select name from conductor order by age, name then conductor_id
 select name from conductor where nationality!= 'USA'
 select name from conductor where nationality!= 'USA'
 select record_company from orchestra order by year_of_founded desc, then by orchestra_id
 select record_company from orchestra order by year_of_founded desc, then by orchestra_id
 select avg(attendance) from show
 select avg(attendance) from show
 select max(share), min(share) from performance where type!= 'Live final'
 select max(share), min(share) from performance where type!= 'Live final'
 select count(distinct nationality) from conductor
 select count(distinct nationality) from conductor
 select name from conductor order by year_of_work desc, name asc
 select name from conductor order by year_of_work desc, name asc
 select name from conductor order by year_of_work desc limit 1
 select name from conductor order by year_of_work desc limit 1
 select conductor.name, orchestra.orchestra from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id
 select conductor.name, orchestra.orchestra from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id
 select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id having count(*) > 1
 select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id having count(*) > 1
 select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count(*) desc limit 1
 select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count(*) desc limit 1
 select distinct conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
 select distinct conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
 select record_company, count(*) from orchestra group by record_company
 select record_company, count(*) from orchestra group by record_company
 select major_record_format from orchestra group by major_record_format having count(*) = 1 order by count(*) asc, major_record_format from orchestra where count(*) = 1 order by major_record_format
 select major_record_format from orchestra order by count(*), major_record_format, orchestra_id
 select record_company from orchestra group by record_company having count(*) = (select max(count(*)) from (select count(*) from orchestra group by record_company))
 select record_company from orchestra group by record_company having count(*)(*) = (select max(count(*)) from (select count(*)(*) from orchestra group by record_company))
 select name from orchestra where orchestra_id not in (select orchestra_id from performance)
 select orchestra from orchestra except select orchestra.orchestra from orchestra join performance on orchestra.orchestra_id = performance.orchestra_id
 select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
 select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
 select count(*) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
 select count(*) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
 select orchestra.year_of_founded from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id group by performance.orchestra_id having count(*) > 1
 select orchestra.year_of_founded from orchestra join performance on orchestra.orchestra_id = performance.orchestra_id group by performance.orchestra_id having count(*) > 1
 select count(*) from highschooler
 select count(*) from highschooler
 select name, grade from highschooler
 select name, grade from highschooler
 select distinct grade from highschooler
 select grade from highschooler
 select distinct grade from highschooler where name = 'Kyle'
 select grade from highschooler where name = 'Kyle'
 select name from highschooler where grade = 10
 select name from highschooler where grade = 10
 select id from highschooler where name = 'Kyle'
 select id from highschooler where name = 'Kyle'
 select count(*) from highschooler where grade = 9 or grade = 10
 select count(*) from highschooler where grade = 9 or grade = 10
 select grade, count(*) from highschooler group by grade
 select count(*), grade from highschooler group by grade
 select distinct grade from highschooler group by grade having count(id)(id) = (select max(count(id)) from (select count(id)(id) from highschooler group by grade))
 select grade from highschooler group by grade having count(id)(id) = (select max(count(id)) from (select count(id)(id) from highschooler group by grade))
 select grade from highschooler group by grade having count(*) >= 4
 select grade from highschooler group by grade having count(*) >= 4
 select student_id, count(*) from friend group by student_id
 select count(*), student.id from highschooler join friend on highschooler.id = friend.student_id group by student.id, friend.friend_id
 select highschooler.name, count(friend.friend_id) from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id
 select highschooler.name, count(friend.friend_id) from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id
 select hs.name from highschooler hs where hs.id in (select f.student_id from friend f group by f.student_id having count(f.friend_id) = (select max(count(friend_id)) from (select count(friend_id) from friend group by student_id)))
 select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id order by count(friend.friend_id) desc limit 1
 select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count(*) >= 3
 select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count(*) >= 3
 select highschooler.id, friends.name from highschooler join friend on highschooler.id = friend.student_id join friends on friend.friend_id = highschooler.friend_id where highschooler.name = 'Kyle'
 select highschooler.id, friend.friend_id from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
 select hs.id, count(f.friend_id) from highschooler hs join friend f on hs.id = f.student_id where hs.name = 'Kyle'
 select highschooler.id, count(friend.friend_id) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by highschooler.id
 select student_id from student except select student_id from friend
 select id from highschooler except select student_id from friend
 select name from highschooler where id not in (select student_id from friend)
 select name from highschooler where id not in (select student_id from friend)
 select hs.id from highschooler hs join friend f on hs.id = f.friend_id join likes l on hs.id = l.liked_id
 select student_id from friend union select student_id from likes
 select hs.name from highschooler hs where hs.id in (select f.student_id from friend f join likes l on f.student_id = l.student_id group by f.student_id having count(distinct l.liked_id) = 2)
 select h.name from highschooler h where exists (select 1 from friend f join likes l on f.friend_id = l.student_id where h.id = l.student_id) and exists (select 1 from likes l where l.student_id = h.id)
 select count(*), student_id from likes group by student_id including likes given and likes received
 select student_id, count(*) from likes group by student_id
 select h.name, count(l.like_id) from highschooler h join likes l on h.id = l.student_id group by h.id, h.name
 select h.name, count(l.like_id) from highschooler h join likes l on h.id = l.student_id group by h.id, h.name
 select h.name from highschooler h where h.id in (select l.student_id from likes l group by l.student_id having count(l.liked_id) = (select max(count(liked_id)) from (select count(liked_id) from likes group by student_id)))
 select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count(*) desc limit 1
 select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count(*) >= 2
 select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count(*) >= 2
 select hs.name from highschooler hs where hs.grade > 5 and hs.id in (select f.student_id from friend f join initiated f on f.friend_id = hs.id where f.friend_id = hs.id group by f.student_id having count(distinct f.friend_id) >= 2)
 select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having max(2 friendships.friend_id) > 5
 select highschooler.id, count(likes.liked_id) from highschooler left join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
 select highschooler.id, sum(likes.liked_id) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
 select avg(grade) from highschooler where id in (select student_id from friend group by student_id having count(friend_id) = 1 or count(friend_id) = 1)
 select avg(highschooler.grade) from highschooler join friend on highschooler.id = friend.student_id union select distinct avg(highschooler.grade) from highschooler join friend on highschooler.id = friend.student_id
 select min(grade) from highschooler where id not in (select student_id from friend)
 select min(grade) from highschooler where id not in (select student_id from friend or student_id from friend)
 select state from owners intersect select state from professionals
 select state from owners intersect select state from professionals
 select avg(age) from dogs where dog_id in (select dog_id from treatments)
 select avg(age) from dogs where dog_id in (select dog_id from treatments)
 select professionals.professional_id, professionals.last_name, professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count(treatments.treatment_id) > 2 or professionals.state = 'Indiana'
 select professionals.professional_id, professionals.last_name, professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count(treatments.treatment_id) > 2
 select name from dogs where dog_id not in (select dog_id from treatments where cost_of_treatment > 1000)
 select name from dogs where dog_id in (select dog_id from treatments where cost_of_treatment <= 1000) and owner_id in (select owner_id from owners where first_name, last_name) = 1
 select first_name from professionals or owners except select first_name from dogs where owner_id in (select professional_id from treatments)
 select first_name from professionals or owners except select first_name from dogs where owner_id in (select professional_id from treatments)
 select p.professional_id, p.role_code, p.email_address from professionals p left join treatments t on p.professional_id = t.professional_id except select p.professional_id, p.role_code, p.email_address from professionals p left join treatments t on p.professional_id = t.professional_id where t.dog_id =.dog_id
 select professional_id, role_code, email_address from professionals except select professional_id from treatments where dog_id = 1
 select owners.owner_id, owners.first_name, owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(*) desc limit 1
 select owners.owner_id, owners.first_name, owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count(*) desc limit 1
 select professionals.professional_id, professionals.role_code, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count(*) >= 2
 select professionals.professional_id, professionals.role_code, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count(*) >= 2
 select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_code order by count(*) desc limit 1
 select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_code order by count(*) desc limit 1
 select owners.owner_id, owners.last_name from owners join treatments on owners.owner_id = treatments.dog_id group by owners.owner_id order by count(*) desc limit 1
 select owners.owner_id, owners.last_name from owners join treatments on owners.owner_id = treatments.dog_id group by owners.owner_id order by sum(cost_of_treatment) desc limit 1
 select treatment_types.treatment_type_description from treatment_types join treatments on treatment_types.treatment_type_code = treatments.treatment_type_code group by treatment_types.treatment_type_code order by sum(cost_of_treatment) asc limit 1
 select treatment_types.treatment_type_description from treatment_types join treatments on treatment_types.treatment_type_code = treatments.treatment_type_code group by treatment_types.treatment_type_code order by sum(cost_of_treatment) asc limit 1
 select owners.owner_id, owners.zip_code from owners join dogs on owners.dog_id = dogs.owner_id group by owners.owner_id order by sum(charges.charge_amount) desc limit 1
 select owners.owner_id, owners.zip_code from owners join dogs on owners.dog_id = dogs.owner_id group by owners.owner_id order by sum(cost_of_treatment) desc limit 1
 select professionals.professional_id, professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count(*) >= 2
 select professionals.professional_id, professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count(*) >= 2
 select p.first_name, p.last_name from professionals p where exists (select 1 from treatments t where t.professional_id = p.professional_id and t.cost_of_treatment < (select avg(cost_of_treatment) from treatments))
 select p.first_name, p.last_name from professionals p where exists (select 1 from treatments t where t.professional_id = p.professional_id and t.cost_of_treatment < (select avg(cost_of_treatment) from treatments))
 select treatments.date_of_treatment, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
 select treatments.date_of_treatment, professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
 select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
 select treatments.cost_of_treatment, treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
 select owners.first_name, owners.last_name, dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id group by dogs.size_code having count(*) >= 1
 select owners.first_name, owners.last_name, dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id group by dogs.size_code having count(*) > 1
 select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
 select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
 select d.name, t.date_of_treatment from dogs d inner join treatments t on d.dog_id = t.dog_id where d.breed_code = (select breed_code from breeds where breed_name = (select breed_code from breeds where breed_name = (select breed_name from breeds where breed_code = (select breed_code from breeds where breed_name))
 select d.name, t.date_of_treatment from dogs d inner join treatments t on d.dog_id = t.dog_id where d.breed_code = (select breed_code from breeds where breed_name = (select breed_name from breeds where breed_name = (select breed_name from breeds where breed_code = (select breed_code from breeds order by count(*)))
 select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
 select owners.first_name, dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
 select date_arrived, date_departed from dogs where dog_id in (select dog_id from treatments)
 select date_arrived, date_departed from dogs where dog_id in (select dog_id from treatments)
 select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age limit 1
 select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age limit 1
 select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
 select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
 select date_arrived, date_departed from dogs
 select date_arrived, date_departed from dogs
 select count(distinct dog_id) from treatments
 select count(distinct dog_id) from treatments
 select count(distinct professional_id) from treatments where dog_id in ( select dog_id from dogs )
 select count(distinct p.professional_id) from professionals p join treatments t on p.professional_id = t.professional_id where t.dog_id = a.dog_id
 select professional_id, role_code, street, city, state from professionals where city like '%west%'
 select role_code, street, city, state from professionals where city like '%west%'
 select first_name, last_name, email_address from owners where state in (select state from owners where first_name like '%north%' )
 select first_name, last_name, email_address from owners where state like '%north%'
 select count(*) from dogs where age < (select avg(age) from dogs)
 select count(*) from dogs where age < (select avg(age) from dogs)
 select max(cost_of_treatment) from treatments order by cost_of_treatment desc limit 1
 select cost_of_treatment from treatments where date_of_treatment = (select max(date_of_treatment) from treatments)
 select count(*) from dogs where dog_id not in (select dog_id from treatments)
 select count(*) from dogs where dog_id not in (select dog_id from treatments)
 select count(*) from owners where owner_id not in (select owner_id from dogs)
 select count(*) from owners where owner_id not in ( select owner_id from dogs )
 select count(*) from professionals where professional_id not in ( select professional_id from treatments where dog_id in ( select dog_id from dogs ) )
 select count(*) from professionals where professional_id not in ( select professional_id from treatments )
 select name, age, weight from dogs where abandoned_yn = 1
 select name, age, weight from dogs where abandoned_yn = 1
 select avg(age) from dogs
 select avg(age) from dogs
 select age from dogs order by age desc limit 1
 select age from dogs order by age desc limit 1
 select charge_type, charge_amount from charges group by charge_type
 select charge_type, charge_amount from charges group by charge_type
 select charge_type, max(charge_amount) from charges group by charge_type
 select charge_amount from charges where charge_type = (select charge_type from charges order by charge_amount desc limit 1)
 select email_address, cell_number, home_phone from professionals
 select email_address, cell_number, home_phone from professionals
 select distinct breed_code, size_code from dogs
 select distinct breed_code, size_code from dogs
 select professionals.first_name, treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id
 select professionals.first_name, treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id
 select count(*) from singer
 select count(*) from singer
 select name from singer order by net_worth_millions asc, name in case of a tie, name asc
 select name, singer_id from singer order by net_worth_millions asc, singer_id asc
 select birth_year, citizenship from singer
 select birth_year, citizenship from singer
 select name from singer where citizenship!= 'France'
 select name from singer where citizenship!= 'French'
 select name from singer where birth_year = 1948 or birth_year = 1949
 select name from singer where birth_year = 1948 or birth_year = 1949
 select name from singer where net_worth_millions = (select max(net_worth_millions) from singer)
 select name from singer where net_worth_millions = (select max(net_worth_millions) from singer)
 select citizenship, count(*) from singer group by citizenship
 select citizenship, count(*) from singer group by citizenship
 select distinct s.citizenship from singer s join song s on s.singer_id = s.singer_id group by s.citizenship having count(s.song_id) = (select max(count(song_id)) from (select count(song_id) from song group by singer_id))
 select citizenship, count(*) from singer group by citizenship
 select citizenship, max(net_worth_millions) from singer group by citizenship
 select citizenship, max(net_worth_millions) from singer group by citizenship
 select song.title, singer.name from singer join song on singer.singer_id = song.singer_id
 select song.title, singer.name from song join singer on song.singer_id = singer.singer_id
 select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
 select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
 select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count(*) > 1
 select singer.name from song join singer on song.singer_id = singer.singer_id group by song.singer_id having count(*) > 1
 select singer.name, sum(song.sales) from singer join song on singer.singer_id = song.singer_id group by song.singer_id
 select singer.name, sum(song.sales), sum(song.sales) from singer join song on singer.singer_id = song.singer_id group by song.singer_id
 select name from singer where singer_id not in (select singer_id from song)
 select name from singer where singer_id not in (select singer_id from song)
 select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
 select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
 select count(*) from other_available_features
 select ref_feature_types.feature_type_name from other_available_features join ref_feature_types on other_available_features.feature_type_code = ref_feature_types.feature_type_code where other_available_features.feature_name = 'AirCon'
 select ref_property_types.property_type_description from properties join ref_property_types on properties.property_type_code = ref_property_types.property_type_code
 select property_name from properties where property_type_code = 'House' or property_type_code = 'Apartment' and room_count > 1
