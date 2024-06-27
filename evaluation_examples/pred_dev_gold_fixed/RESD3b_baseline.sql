select count ( * ) from singer
select count ( * ) from singer
select name , country , age from singer order by age desc , singer_id asc
select name , country , age from singer order by age desc , singer_id asc
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select song_name , song_release_year from singer order by age asc limit 1
select name , song_release_year from singer order by age asc limit 1
select distinct country from singer where age > 20
select distinct country from singer where age > 20
select country , count ( * ) from singer group by country
select country , count ( * ) from singer group by country
select distinct song_name from singer where age > ( select avg ( age ) from singer )
select song_name from singer where age > ( select avg ( age ) from singer )
select location , name from stadium where capacity between 5000 and 10000
select location , name from stadium where capacity between 5000 and 10000
select max ( capacity ) , avg ( capacity ) from stadium
select max ( capacity ) , avg ( capacity ) from stadium
select name , capacity from stadium order by average asc limit 1
select name , capacity from stadium order by average desc limit 1
select count ( * ) from concert where year = 2014 or year = 2015
select count ( * ) from concert where year = 2014 or year = 2015
select stadium.name , count ( * ) from stadium join concert on stadium.stadium_id = concert.stadium_id group by concert.stadium_id
select stadium.name , count ( * ) from stadium join concert on stadium.stadium_id = concert.stadium_id group by stadium.stadium_id
select stadium.name , stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year >= 2014 group by concert.stadium_id order by count ( * ) desc limit 1
select stadium.name , stadium.capacity from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year > 2013 group by concert.stadium_id order by count ( * ) desc limit 1
select year from concert group by year order by count ( * ) desc limit 1
select year from concert group by year order by count ( * ) desc limit 1
select name from stadium where stadium_id not in ( select stadium_id from concert )
select name from stadium where stadium_id not in ( select stadium_id from concert )
select country from singer where age > 40 intersect select country from singer where age < 30
select name from stadium except select stadium.name from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014
select name from stadium except select stadium.name from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014
select concert.concert_name , concert.theme , count ( * ) from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id group by singer_in_concert.concert_id
select concert.concert_name , concert.theme , count ( * ) from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id group by singer_in_concert.concert_id
select singer.name , count ( * ) from singer_in_concert join singer on singer_in_concert.singer_id = singer.singer_id group by singer.name
select singer.name , count ( * ) from singer_in_concert join singer on singer_in_concert.singer_id = singer.singer_id group by singer.name
select distinct singer.name from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select distinct singer.name from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select name , country from singer where song_name like '%Hey%'
select name , country from singer where song_name like '%Hey%'
select stadium.name , stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2014 intersect select stadium.name , stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2015
select stadium.name , stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2014 intersect select stadium.name , stadium.location from stadium join concert on stadium.stadium_id = concert.stadium_id where concert.year = 2015
select count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from stadium join concert on stadium.stadium_id = concert.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from pets where weight > 10
select count ( * ) from pets where weight > 10
select weight from pets order by pet_age asc limit 1
select weight from pets order by pet_age asc limit 1
select max ( weight ) , pettype from pets group by pettype
select pettype , max ( weight ) from pets group by pettype
select count ( * ) from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where student.age > 20
select count ( * ) from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where student.age > 20
select count ( * ) from has_pet join pets on has_pet.petid = pets.petid join student on student.stuid = has_pet.stuid where student.sex = 'F' and pets.pettype = 'Dog'
select count ( * ) from has_pet join pets on has_pet.petid = pets.petid join student on has_pet.stuid = student.stuid where student.sex = 'F'
select count ( distinct pettype ) from pets
select count ( distinct pettype ) from pets
select distinct student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' or pets.pettype = 'dog'
select distinct student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' or pets.pettype = 'dog'
select student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' intersect select student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'dog'
select student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' intersect select student.fname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'dog'
select major , age from student except select student.major , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat'
select major , age from student except select student.major , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'cat'
select stuid from student except select stuid from has_pet
select stuid from student except select stuid from has_pet where petid = 'CAT'
select fname , age from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'dog' except select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' )
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'dog' except select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' )
select pettype , weight from pets order by pet_age asc limit 1
select pettype , weight from pets order by pet_age asc limit 1
select petid , weight from pets where pet_age > 1
select petid , weight from pets where pet_age > 1
select pettype , avg ( pet_age ) , max ( pet_age ) from pets group by pettype
select pettype , avg ( pet_age ) , max ( pet_age ) from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid
select distinct student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid
select has_pet.petid from has_pet join student on has_pet.stuid = student.stuid where student.lname = 'Smith'
select has_pet.petid from has_pet join pets on has_pet.petid = pets.petid join student on student.stuid = has_pet.stuid where student.lname = 'Smith'
select count ( * ) , stuid from has_pet group by stuid
select count ( * ) , stuid from has_pet group by stuid
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pet_age = 3
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pet_age = 3
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select count ( * ) from continents
select count ( * ) from continents
select continents.contid , continents.continent , count ( * ) from countries join continents on countries.continent = continents.contid group by continents.contid
select continents.contid , countries.countryname , count ( * ) from continents join countries on continents.contid = countries.continent group by continents.contid
select count ( * ) from countries
select count ( * ) from countries
select car_makers.fullname , car_makers.id , count ( * ) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select car_makers.fullname , car_makers.id , count ( * ) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select model_list.model from cars_data join model_list on cars_data.id = model_list.model order by horsepower asc limit 1
select model_list.model from cars_data join model_list on cars_data.id = model_list.model order by horsepower asc limit 1
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.weight < ( select avg ( weight ) from cars_data )
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.weight < ( select avg ( weight ) from cars_data )
select car_makers.fullname from cars_data join car_makers on cars_data.id = car_makers.id where cars_data.year = 1970
select distinct car_makers.maker from cars_data join car_makers on cars_data.id = car_makers.id where cars_data.year = 1970
select car_names.make , cars_data.year from cars_data join car_names on cars_data.id = car_names.makeid order by cars_data.year asc limit 1
select car_makers.fullname , cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id order by cars_data.year asc limit 1
select distinct car_names.model from cars_data join model_list on cars_data.id = model_list.maker join car_names on model_list.model = car_names.model where cars_data.year > 1980
sql placeholder
select continents.continent , count ( * ) from countries join continents on countries.continent = continents.contid join car_makers on countries.countryid = car_makers.country group by continents.continent
select continents.continent , count ( * ) from countries join continents on countries.continent = continents.contid join car_makers on countries.countryid = car_makers.country group by continents.continent
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid order by count ( * ) desc limit 1
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid order by count ( * ) desc limit 1
select count ( * ) , car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select count ( * ) , car_makers.id , car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select accelerate from cars_data join car_names on cars_data.id = car_names.makeid where car_names.make = 'amc hornet sportabout (sw)'
select cars_data.accelerate from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = 'amc hornet sportabout (sw)'
select count ( * ) from car_makers where country = 'France'
select count ( * ) from car_makers where country = 'France'
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.country = 'USA'
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker join countries on countries.countryid = car_makers.country where countries.countryname = 'usa'
select avg ( mpg ) from cars_data where cylinders = 4
select avg ( mpg ) from cars_data where cylinders = 4
select min ( weight ) from cars_data where year = 1974 and cylinders = 8
select min ( weight ) from cars_data where cylinders = 8 and year = 1974
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select countries.countryname , car_makers.country from countries join car_makers on countries.countryid = car_makers.country
select countries.countryname , countries.countryid from countries join car_makers on countries.countryid = car_makers.country
select count ( * ) from cars_data where horsepower > 150
select count ( * ) from cars_data where horsepower > 150
select avg ( weight ) , year from cars_data group by year
select avg ( weight ) , year from cars_data group by year
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 3
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 3
select max ( cars_data.horsepower ) , car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 3
select car_names.make , cars_data.horsepower from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 3 order by cars_data.horsepower desc limit 1
select model_list.model from cars_data join model_list on cars_data.id = model_list.model order by cars_data.mpg desc limit 1
select model_list.model from cars_data join model_list on cars_data.id = model_list.model order by cars_data.mpg desc limit 1
select avg ( horsepower ) from cars_data where year < 1980
select avg ( horsepower ) from cars_data where year < 1980
sql placeholder
select avg ( edispl ) from cars_data where id = 'VOLVO'
select max ( accelerate ) , cylinders from cars_data group by cylinders
select max ( accelerate ) , cylinders from cars_data group by cylinders
select model from car_names group by model order by count ( * ) desc limit 1
select model_list.model from car_names join model_list on car_names.makeid = model_list.model group by model_list.model order by count ( * ) desc limit 1
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where year = 1980
select count ( * ) from cars_data where year = 1980
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = 'American Motor Company'
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = 'American Motor Company'
select car_makers.fullname , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select car_makers.maker , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select distinct model_list.model from car_makers join model_list on car_makers.id = model_list.maker join cars_data on model_list.modelid = cars_data.id where car_makers.fullname = 'General Motors' or cars_data.weight > 3500
select distinct model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.weight > 3500 or model_list.maker = 'General Motors'
select year from cars_data where weight between 3000 and 4000
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000
select horsepower from cars_data order by accelerate desc limit 1
select horsepower from cars_data order by accelerate desc limit 1
select cylinders from cars_data where id = 'Volvo' order by accelerate asc limit 1
select cylinders from cars_data where accelerate like '%volvo%'
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data )
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from cars_data where cylinders > 6
select count ( * ) from cars_data where cylinders > 6
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.cylinders = 4 order by horsepower desc limit 1
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.cylinders = 4 order by horsepower desc limit 1
select car_names.makeid , car_names.make from car_names join cars_data on car_names.makeid = cars_data.id where cars_data.horsepower > ( select min ( horsepower ) from cars_data ) except select car_names.makeid , car_names.make from car_names join cars_data on car_names.makeid = cars_data.id where cars_data.cylinders > (3 )
sql placeholder
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.weight < 3500 except select model_list.model from cars_data join model_list on cars_data.id = model_list.model join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'Ford Motor Company'
sql placeholder
select countryname from countries except select countries.countryname from countries join car_makers on countries.countryid = car_makers.country
select countryname from countries except select countries.countryname from countries join car_makers on countries.countryid = car_makers.country
select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 3
select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2
select countries.countryid , countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) > 3 union select countries.countryid , countries.countryname from countries join model_list on countries.countryid = model_list.maker where model_list.model = 'fiat'
select countries.countryid , countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) > 3 union select countries.countryid , countries.countryname from countries join model_list on countries.countryid = model_list.maker group by countries.countryid having count ( * ) > 3
select country from airlines where airline = 'JetBlue Airways'
select country from airlines where airline = 'Jetblue Airways'
select abbreviation from airlines where airline = 'JetBlue Airways'
select abbreviation from airlines where airline = 'Jetblue Airways'
select distinct airline , abbreviation from airlines where country = 'USA'
select airline , abbreviation from airlines where country = 'USA'
select airportcode , airportname from airports where city = 'Anthony'
select airportcode , airportname from airports where city = 'Anthony'
select count ( * ) from airlines
select count ( * ) from airlines
select count ( * ) from airports
select count ( * ) from airports
select count ( * ) from flights
select count ( * ) from flights
select airline from airlines where abbreviation = 'UAL'
select airline from airlines where abbreviation = 'UAL'
select count ( * ) from airlines where country = 'USA'
select count ( * ) from airlines where country = 'USA'
select city , country from airports where airportname = 'Alton'
select city , country from airports where airportname = 'Alton'
select airportname from airports where airportcode = 'AKO'
select airportname from airports where airportcode = 'AKO'
select distinct airportname from airports where city = 'Aberdeen'
select airportname from airports where city = 'Aberdeen'
select count ( * ) from flights where sourceairport = 'APG'
select count ( * ) from flights where sourceairport = 'APG'
select count ( * ) from flights where destairport = 'ATO'
select count ( * ) from flights where sourceairport = 'ATO'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select count ( * ) from flights join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' and airports.city = 'Ashley'
select count ( * ) from flights where destairport = 'Aberdeen' and sourceairport = 'Ashley'
select count ( * ) from airlines join flights on airlines.uid = flights.airline where airlines.abbreviation = 'JetBlue Airways'
select count ( * ) from airlines join flights on airlines.uid = flights.airline where airlines.abbreviation = 'Jetblue Airways'
select count ( * ) from flights join airports on flights.sourceairport = airports.airportcode join airlines on flights.airline = airlines.uid where airports.airportname = 'ASY' and airlines.airline = 'United Airlines'
select count ( * ) from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'ASY' and airlines.airline = 'United Airlines'
select count ( * ) from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'AHD' and airlines.airline = 'United Airlines'
select count ( * ) from airlines join flights on airlines.uid = flights.airline join airports on airports.airportcode = flights.sourceairport where airports.airportname = 'AHD' and airlines.airline = 'United'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airlines.airline = 'United'
select count ( * ) from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.city = 'Aberdeen' and airlines.airline = 'United'
select airports.city from airports join flights on airports.airportcode = flights.sourceairport group by airports.city order by count ( * ) desc limit 1
select city from airports group by city order by count ( * ) desc limit 1
select airports.city from airports join flights on airports.airportcode = flights.sourceairport group by airports.city order by count ( * ) desc limit 1
select airports.city from airports join flights on airports.airportcode = flights.sourceairport group by airports.city order by count ( * ) desc limit 1
select airportcode from airports group by airportcode order by count ( * ) desc limit 1
select airportcode from airports group by airportcode order by count ( * ) desc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count ( * ) asc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count ( * ) asc limit 1
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid order by count ( * ) desc limit 1
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid order by count ( * ) desc limit 1
select airlines.abbreviation , airlines.country from airlines join flights on airlines.uid = flights.airline group by flights.airline order by count ( * ) + flights.flightno asc limit 1
select airlines.abbreviation , airlines.country from airlines join flights on airlines.uid = flights.airline group by flights.airline order by count ( * ) asc limit 1
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on airports.airportcode = flights.sourceairport where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline where flights.sourceairport = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG' intersect select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG' intersect select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO' except select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO' except select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG'
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) < 200
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) < 200
select distinct flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines'
select flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.abbreviation = 'United'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select flightno from flights where sourceairport = 'APG'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select flightno from flights where sourceairport = 'APG'
select distinct flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select flightno from flights where sourceairport = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select flightno from flights where destairport = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
select airportname from airports where airportcode not in ( select sourceairport from flights ) and airportcode not in ( select destairport from flights )
sql placeholder
select count ( * ) from employee
select count ( * ) from employee
select name from employee order by age asc , employee_id
select name from employee order by age asc , name asc
select count ( * ) , city from employee group by city
select count ( * ) , city from employee group by city
select city from employee where age < 30 group by city having count ( * ) > 1
select city from employee where age < 30 group by city having count ( * ) > 1
select count ( * ) , location from shop group by location
select location , count ( * ) from shop group by location
select manager_name , district from shop order by number_products desc limit 1
select manager_name , district from shop order by number_products desc limit 1
select min ( number_products ) , max ( number_products ) from shop
select min ( number_products ) , max ( number_products ) from shop
select name , location , district from shop order by number_products desc , shop_id asc
select name , location , district from shop order by shop_id asc
select name from shop where number_products > ( select avg ( number_products ) from shop )
select name from shop where number_products > ( select avg ( number_products ) from shop )
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count ( * ) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count ( * ) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id order by evaluation.bonus desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id order by evaluation.bonus desc limit 1
select name from employee where employee_id not in ( select employee_id from evaluation )
select name , employee_id from employee where employee_id not in ( select employee_id from evaluation )
select shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by hiring.shop_id order by count ( * ) desc limit 1
select shop.name from hiring join shop on hiring.shop_id = shop.shop_id group by hiring.shop_id order by count ( * ) desc limit 1
select name from shop where shop_id not in ( select shop_id from hiring )
select name from shop where shop_id not in ( select shop_id from hiring )
select count ( * ) , shop.name from shop join hiring on shop.shop_id = hiring.shop_id group by hiring.shop_id
select shop.name , count ( * ) from hiring join shop on hiring.shop_id = shop.shop_id group by hiring.shop_id
select sum ( bonus ) from evaluation
select sum ( bonus ) from evaluation
select * from hiring
select * from hiring
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
select count ( distinct location ) from shop
select count ( distinct location ) from shop
select count ( * ) from documents
select count ( * ) from documents
select document_id , document_name , document_description from documents
select document_id , document_name , document_description from documents
select document_name , template_id from documents where document_description like '%w%'
select document_name , template_id from documents where document_description like '%w%'
select document_id , template_id , document_description from documents where document_name = 'Robbin CV'
select document_id , template_id , document_description from documents where document_name = 'Robbin CV'
select count ( distinct template_id ) from documents
select count ( distinct template_id ) from documents
select count ( * ) from templates join documents on templates.template_id = documents.template_id where templates.template_type_code = 'PPT'
select count ( * ) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'PPT'
select template_id , count ( * ) from documents group by template_id
select template_id , count ( * ) from documents group by template_id
select templates.template_id , templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_id order by count ( * ) desc limit 1
select templates.template_id , templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_id order by count ( * ) desc limit 1
select template_id from documents group by template_id having count ( * ) > 1
select template_id from documents group by template_id having count ( * ) > 1
select template_id from templates except select template_id from documents
select template_id from templates except select template_id from documents
select count ( * ) from templates
select count ( * ) from templates
select template_id , version_number , template_type_code from templates
select template_id , version_number , template_type_code from templates
select distinct template_type_code from templates
select distinct template_type_code from templates
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
select count ( * ) from templates where template_type_code = 'CV'
select count ( * ) from templates where template_type_code = 'CV'
select version_number , template_type_code from templates where version_number > 5
select version_number , template_type_code from templates where version_number > 5
select template_type_code , count ( * ) from templates group by template_type_code
select template_type_code , count ( * ) from templates group by template_type_code
select template_type_code , template_type_code from templates group by template_type_code order by count ( * ) desc limit 1
select template_type_code , template_type_code from templates group by template_type_code order by count ( * ) desc limit 1
select template_type_code from templates group by template_type_code having count ( * ) < 3
select template_type_code from templates group by template_type_code having count ( * ) < 3
select min ( version_number ) , template_type_code from templates
select version_number , template_type_code from templates order by version_number asc limit 1
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
select templates.template_type_code , templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
select documents.document_name from templates join documents on templates.template_id = documents.template_id where templates.template_type_code = 'BK'
select document_name from documents where template_id = 'BK'
select template_type_code , count ( * ) from documents join templates on documents.template_id = templates.template_id group by template_type_code
select template_type_code , count ( * ) from documents join templates on documents.template_id = templates.template_id group by template_type_code
select templates.template_type_code , templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count ( * ) desc limit 1
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count ( * ) desc limit 1
select template_type_code from templates except select template_type_code from templates join documents on templates.template_id = documents.template_id
select template_type_code from templates except select template_type_code from documents join templates on documents.template_id = templates.template_id
select template_type_code , template_type_description from ref_template_types
select template_type_code , template_type_description from ref_template_types
select template_type_description from ref_template_types where template_type_code = 'AD'
select template_type_description from ref_template_types where template_type_code = 'AD'
select template_type_code from ref_template_types where template_type_description = 'Book'
select template_type_code from ref_template_types where template_type_description = 'Book'
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on templates.template_id = documents.template_id
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on documents.template_id = templates.template_id
select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'
select templates.template_id from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on documents.template_id = templates.template_id where documents.document_description = 'Presentation'
select count ( * ) from paragraphs
select count ( * ) from paragraphs
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select other_details from paragraphs where paragraph_text = 'Korea'
select other_details from paragraphs where paragraph_text like '%Korea%'
select paragraphs.paragraph_id , paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Welcome to NY'
select paragraphs.paragraph_id , paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Welcome to NY'
select paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'
select paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'
select document_id , count ( * ) from paragraphs group by document_id order by count ( * ) asc
select document_id , count ( * ) from paragraphs group by document_id order by count ( * ) asc
select documents.document_id , documents.document_name , count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id group by documents.document_id
select documents.document_id , documents.document_name , count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id group by documents.document_id
select document_id from paragraphs group by document_id having count ( * ) >= 2
select document_id from paragraphs group by document_id having count ( * ) >= 2
select documents.document_id , documents.document_name from paragraphs join documents on paragraphs.document_id = documents.document_id group by paragraphs.document_id order by count ( * ) desc limit 1
select documents.document_id , documents.document_name from documents join paragraphs on documents.document_id = paragraphs.document_id group by paragraphs.document_id order by count ( * ) desc limit 1
select document_id from paragraphs group by document_id order by count ( * ) asc limit 1
select document_id from paragraphs group by document_id order by count ( * ) asc limit 1
select document_id from paragraphs group by document_id having count ( * ) between 1 and 2
select document_id from paragraphs group by document_id having count ( * ) between 1 and 2
select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Brazil' intersect select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Ireland'
select count ( * ) from teacher
select count ( * ) from teacher
select name from teacher order by age asc , teacher_id
select name from teacher order by age asc , teacher_id asc
select age , hometown from teacher
select age , hometown from teacher
select name from teacher where hometown != 'Little Lever Urban District'
select distinct name from teacher where hometown != 'Little Lever Urban District'
select name from teacher where age = 32 or age = 33
select name from teacher where age = 32 or age = 33
select hometown from teacher order by age asc limit 1
select hometown from teacher order by age asc limit 1
select hometown , count ( * ) from teacher group by hometown
select hometown , count ( * ) from teacher group by hometown
select hometown from teacher group by hometown order by count ( * ) desc limit 1
select hometown from teacher group by hometown order by count ( * ) desc limit 1
select hometown from teacher group by hometown having count ( * ) >= 2
select hometown from teacher group by hometown having count ( * ) >= 2
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc , course.course
select teacher.name from course_arrange join course on course_arrange.course_id = course.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id where course.course = 'Math'
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id where course.course = 'Math'
select teacher.name , count ( * ) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.name
select teacher.name , count ( * ) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count ( * ) >= 2
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count ( * ) >= 2
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select count ( * ) from visitor where age < 30
select name from visitor where level_of_membership > 4 order by level_of_membership desc
select avg ( age ) from visitor where level_of_membership <= 4
select name , level_of_membership from visitor where level_of_membership > 4 order by age desc
select museum_id , name from museum order by num_of_staff desc limit 1
select avg ( num_of_staff ) from museum where open_year < 2009
select open_year , num_of_staff from museum where name = 'Plaza Museum'
select name from museum where num_of_staff > ( select min ( num_of_staff ) from museum where open_year > 2010 )
select visitor.id , visitor.name , visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visitor.id having count ( * ) > 1
select visitor.id , visitor.name , visitor.level_of_membership from visitor join visit on visitor.id = visit.visitor_id order by total_spent desc limit 1
select museum.museum_id , museum.name from museum join visit on museum.museum_id = visit.museum_id group by visit.museum_id order by count ( * ) desc limit 1
select name from museum where museum_id not in ( select museum_id from visit )
select visitor.name , visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visit.visitor_id order by sum ( visit.num_of_ticket ) desc limit 1
select avg ( num_of_ticket ) , max ( num_of_ticket ) from visit
select visit.total_spent from visitor join visit on visitor.id = visit.visitor_id where visitor.level_of_membership = 1
select visitor.name from museum join visit on museum.museum_id = visit.museum_id join visitor on visit.visitor_id = visitor.id where museum.open_year < 2009 intersect select visitor.name from museum join visit on museum.museum_id = visit.museum_id join visitor on visit.visitor_id = visitor.id where museum.open_year > 2011
select count ( * ) from visitor where id not in ( select visitor_id from visit join museum on visit.museum_id = museum.museum_id where museum.open_year > 2010 )
select count ( * ) from museum where open_year > 2013 or open_year < 2008
select count ( * ) from players
select count ( * ) from players
select count ( * ) from matches
select count ( * ) from matches
select first_name , birth_date from players where country_code = 'USA'
select first_name , birth_date from players where country_code = 'USA'
select avg ( loser_age ) , avg ( winner_age ) from matches
select avg ( winner_age ) , avg ( loser_age ) from matches
select avg ( winner_rank ) from matches
select avg ( winner_rank ) from matches
select min ( loser_rank ) from matches
select loser_rank from matches group by loser_rank order by sum ( loser_rank_points ) asc limit 1
select count ( distinct country_code ) from players
select count ( distinct country_code ) from players
select count ( distinct loser_name ) from matches
select count ( distinct loser_name ) from matches
select tourney_name from matches group by tourney_name having count ( * ) > 10
select tourney_name from matches group by tourney_name having count ( * ) > 10
select winner_name from matches where year = 2013 intersect select winner_name from matches where year = 2016
select players.first_name , players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2013 intersect select players.first_name , players.last_name from players join matches on players.player_id = matches.winner_id where matches.year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select players.country_code , players.first_name from players join matches on players.player_id = matches.winner_id where matches.tourney_name = 'WTA Championships' intersect select players.country_code , players.first_name from players join matches on players.player_id = matches.winner_id where matches.tourney_name = 'Australian Open'
sql placeholder
select first_name , country_code from players order by birth_date desc limit 1
select first_name , country_code from players order by birth_date desc limit 1
select first_name , last_name from players order by birth_date asc , last_name
select first_name , last_name from players order by birth_date asc , player_id
select first_name , last_name from players where hand = 'left' order by birth_date asc
select first_name , last_name from players where hand = 'left' order by birth_date asc
select players.first_name , players.country_code from rankings join players on rankings.player_id = players.player_id group by rankings.player_id order by count ( * ) desc limit 1
select players.first_name , players.country_code from players join rankings on players.player_id = rankings.player_id group by rankings.player_id order by count ( * ) desc limit 1
select year from matches group by year order by count ( * ) desc limit 1
select year from matches group by year order by count ( * ) desc limit 1
select players.first_name , players.last_name , sum ( qualifying_matches.winner_rank_points ) from players join qualifying_matches on players.player_id = qualifying_matches.winner_id group by qualifying_matches.winner_id order by count ( * ) desc limit 1
select players.first_name , players.last_name , sum ( matches.winner_rank_points ) from players join matches on players.player_id = matches.winner_id group by players.player_id order by count ( * ) desc limit 1
select players.first_name , players.last_name from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'Australian Open' and matches.winner_rank_points = ( select max ( winner_rank_points ) from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'Australian Open' )
select players.first_name , players.last_name from players join matches on players.player_id = matches.winner_id where matches.tourney_name = 'Australian Open' order by matches.winner_rank_points desc limit 1
select loser_name , winner_name from matches order by minutes desc limit 1
select winner_name , loser_name from matches order by minutes desc limit 1
select avg ( rankings.ranking ) , players.first_name , players.player_id from rankings join players on rankings.player_id = players.player_id group by players.player_id
select players.first_name , rankings.player_id , avg ( ranking_points ) from rankings join players on rankings.player_id = players.player_id where ranking_points not in ( select ranking_points from rankings )
select sum ( ranking_points ) , players.first_name , players.player_id from rankings join players on rankings.player_id = players.player_id group by players.player_id
select players.first_name , sum ( rankings.ranking_points ) from rankings join players on rankings.player_id = players.player_id where rankings.ranking_points not in ( select ranking_points from rankings )
select country_code , count ( * ) from players group by country_code
select country_code , count ( * ) from players group by country_code
select country_code from players group by country_code order by count ( * ) desc limit 1
select country_code from players group by country_code order by count ( * ) desc limit 1
select country_code from players group by country_code having count ( * ) > 50
select country_code from players group by country_code having count ( * ) > 50
select ranking_date , sum ( tours ) from rankings group by ranking_date
select ranking_date , sum ( tours ) from rankings group by ranking_date
select count ( * ) , year from matches group by year
select count ( * ) , year from matches group by year
select winner_name , winner_rank from matches order by winner_age asc limit 3
select winner_name , winner_rank from matches order by winner_age asc limit 3
select count ( * ) from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'WTA Championships' and players.hand = 'left'
select count ( * ) from players join matches on players.player_id = matches.winner_id where players.hand = 'left' and matches.tourney_name = 'WTA Championships'
select players.first_name , players.country_code , players.birth_date from players join matches on players.player_id = matches.winner_id order by matches.winner_rank_points desc limit 1
select players.first_name , players.country_code , players.birth_date from players join matches on players.player_id = matches.winner_id group by matches.winner_id order by sum ( matches.winner_rank_points ) desc limit 1
select hand , count ( * ) from players group by hand
select hand , count ( * ) from players group by hand
select count ( * ) from ship where disposition_of_ship = 'Captured'
select name , tonnage from ship order by name desc , tonnage asc
select name , date , result from battle
select max ( killed ) , min ( killed ) , caused_by_ship_id from death group by caused_by_ship_id
select caused_by_ship_id , avg ( injured ) from death group by caused_by_ship_id
select death.caused_by_ship_id , death.injured from ship join death on ship.id = death.caused_by_ship_id where ship.tonnage = 't'
select name , result from battle where bulgarian_commander != 'Boril'
select distinct battle.id , battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = 'Brig'
select battle.id , battle.name from battle join death on battle.id = death.caused_by_ship_id group by battle.id having sum ( death.killed ) > 10
select ship.id , ship.name from ship join death on ship.id = death.caused_by_ship_id group by death.caused_by_ship_id order by sum ( death.injured ) desc limit 1
select distinct name from battle where bulgarian_commander = 'Kaloyan' and latin_commander = 'Baldwin I'
select count ( distinct result ) from battle
select count ( * ) from battle where id not in ( select lost_in_battle from ship where tonnage = '225' )
select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'Lettice' intersect select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'HMS Atalanta'
select name , result , bulgarian_commander from battle where id not in ( select id from ship where lost_in_battle = 'English Channel' )
select note from death where note like '%East%'
select address_id from addresses where line_1 = 1 and line_2 = 2
select line_1 , line_2 from addresses
select count ( * ) from courses
select count ( * ) from courses
select course_description from courses where course_name = 'Math'
select course_description from courses where course_name = 'Math'
select zip_postcode from addresses where city = 'Port Chelsea'
select zip_postcode from addresses where city = 'Port Chelsea'
select departments.department_name , degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count ( * ) desc limit 1
select departments.department_name , degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count ( * ) desc limit 1
select count ( distinct department_id ) from degree_programs
select count ( distinct department_id ) from degree_programs
select count ( distinct degree_summary_name ) from degree_programs
select count ( distinct degree_program_id ) from degree_programs
select count ( * ) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = 'Engineering'
select count ( * ) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = 'Engineering'
select section_name , section_description from sections
select section_name , section_description from sections
select courses.course_name , sections.course_id from courses join sections on courses.course_id = sections.course_id group by sections.course_id having count ( * ) <= 2
select courses.course_name , sections.course_id from courses join sections on courses.course_id = sections.course_id group by sections.course_id having count ( * ) < 2
select section_name from sections order by section_name desc
select section_name from sections order by section_name desc
select semesters.semester_name , semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count ( * ) desc limit 1
select semesters.semester_name , semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count ( * ) desc limit 1
select department_description from departments where department_name like '% the computer%'
select department_description from departments where department_name like '%computer%'
select students.first_name , students.middle_name , students.last_name , student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count ( * ) = 2
select students.first_name , students.middle_name , students.last_name , student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count ( * ) = 2
select students.first_name , students.middle_name , students.last_name from student_enrolment join students on student_enrolment.student_id = students.student_id where student_enrolment.degree_program_id = 'Bachelor'
select students.first_name , students.middle_name , students.last_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id join students on student_enrolment.student_id = students.student_id where degree_programs.degree_summary_name = 'Bachelors'
select degree_program_id from student_enrolment group by degree_program_id order by count ( * ) desc limit 1
select degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_summary_name order by count ( * ) desc limit 1
select student_enrolment.degree_program_id , degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.degree_program_id order by count ( * ) desc limit 1
select degree_programs.degree_program_id , degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.degree_program_id order by count ( * ) desc limit 1
select student_enrolment.student_id , students.first_name , students.middle_name , students.last_name , count ( * ) from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id order by count ( * ) desc limit 1
select students.first_name , students.middle_name , students.last_name , count ( * ) from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id order by count ( * ) desc limit 1
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select distinct courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_name order by count ( * ) desc limit 1
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_name order by count ( * ) desc limit 1
sql placeholder
sql placeholder
select transcripts.transcript_date , transcripts.transcript_id from student_enrolment_courses join transcript_contents on student_enrolment_courses.student_course_id = transcript_contents.student_course_id join transcripts on transcript_contents.transcript_id = transcripts.transcript_id group by transcripts.transcript_id having count ( * ) >= 2
select transcripts.transcript_date , transcripts.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcripts.transcript_id having count ( * ) >= 2
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
select cell_mobile_number from students where first_name = 'Timmothy Ward'
select first_name , middle_name , last_name from students order by date_first_registered asc limit 1
select first_name , middle_name , last_name from students order by date_first_registered asc limit 1
select first_name , middle_name , last_name from students order by date_left asc limit 1
select first_name , middle_name , last_name from students order by date_first_registered asc limit 1
select first_name from students where permanent_address_id != current_address_id
select first_name from students where permanent_address_id != current_address_id
select addresses.address_id , addresses.line_1 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count ( * ) desc limit 1
select students.current_address_id , addresses.line_1 , addresses.line_2 from addresses join students on addresses.address_id = students.permanent_address_id group by students.current_address_id order by count ( * ) desc limit 1
select avg ( transcript_date ) from transcripts
select avg ( transcript_date ) from transcripts
select transcript_date , other_details from transcripts order by transcript_date asc limit 1
select transcript_date , other_details from transcripts where transcript_date = ( select min ( transcript_date ) from transcripts )
select count ( * ) from transcripts
select count ( * ) from transcripts
select transcript_date from transcripts order by transcript_date desc limit 1
select transcript_date from transcripts order by transcript_date desc limit 1
select count ( distinct student_enrolment_id ) , transcript_contents.student_course_id from student_enrolment_courses join transcript_contents on student_enrolment_courses.student_course_id = transcript_contents.student_course_id group by student_enrolment_courses.student_course_id order by count ( * ) desc limit 1
select student_enrolment_courses.course_id , student_enrolment_courses.student_enrolment_id from student_enrolment_courses join transcript_contents on student_enrolment_courses.student_course_id = transcript_contents.student_course_id group by student_enrolment_courses.student_enrolment_id order by count ( * ) desc limit 1
select transcripts.transcript_date , transcripts.transcript_id from transcript_contents join transcripts on transcript_contents.transcript_id = transcripts.transcript_id group by transcript_contents.transcript_id order by count ( * ) asc limit 1
select transcripts.transcript_date , transcripts.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id order by count ( * ) asc limit 1
select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = 1 intersect select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = 1
select semester_id from student_enrolment where degree_program_id = 'MA' intersect select semester_id from student_enrolment where degree_program_id = 'Bachelor'
select count ( distinct current_address_id ) from students
select count ( distinct addresses.address_id ) from addresses join students on addresses.address_id = students.current_address_id and students.permanent_address_id = addresses.address_id
select other_student_details from students order by other_student_details desc
select other_student_details from students order by other_student_details desc
select section_description from sections where section_name = 'H'
select section_description from sections where section_name = 'h'
select students.first_name from addresses join students on addresses.address_id = students.permanent_address_id where addresses.country = 'Haiti' or students.cell_mobile_number = '09700166582'
sql placeholder
select title from cartoon order by title asc
select title from cartoon order by title asc
select * from cartoon where directed_by = 'Ben Jones'
select title from cartoon where directed_by = 'Ben Jones'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select title , directed_by from cartoon order by original_air_date asc , id
select title , directed_by from cartoon order by original_air_date asc , id
select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
select country , count ( * ) from tv_channel group by country order by count ( * ) desc limit 1
select country , count ( * ) from tv_channel group by country order by count ( * ) desc limit 1
select count ( distinct series_name ) , count ( distinct content ) from tv_channel
select count ( distinct series_name ) , count ( distinct content ) from tv_channel
select content from tv_channel where series_name = 'Sky Radio'
select content from tv_channel where series_name = 'Sky Radio'
select package_option from tv_channel where series_name = 'Sky Radio'
select package_option from tv_channel where series_name = 'Sky Radio'
select count ( * ) from tv_channel where language = 'English'
select count ( * ) from tv_channel where language = 'English'
select language , count ( * ) from tv_channel group by language order by count ( * ) asc limit 1
select language , count ( * ) from tv_channel group by language order by count ( * ) asc limit 1
select language , count ( * ) from tv_channel group by language
select language , count ( * ) from tv_channel group by language
select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = 'The Rise of the Blue Beetle!'
select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = 'The Rise of the Blue Beetle'
select cartoon.title from tv_series join cartoon on tv_series.channel = cartoon.channel join tv_channel on tv_channel.id = cartoon.channel where tv_channel.series_name = 'Sky Radio'
select cartoon.title from tv_channel join tv_series on tv_channel.id = tv_series.channel join cartoon on tv_series.id = cartoon.id where tv_channel.series_name = 'Sky Radio'
select episode from tv_series order by rating asc , id
select episode from tv_series order by rating asc , id
select episode , rating from tv_series order by episode desc limit 3
select episode , rating from tv_series order by rating desc limit 3
select min ( share ) , max ( share ) from tv_series
select max ( share ) , min ( share ) from tv_series
select air_date from tv_series where episode = 'A Love of a Lifetime'
select air_date from tv_series where episode = 'A Love of a Lifetime'
select weekly_rank from tv_series where episode = 'A Love of a Lifetime'
select weekly_rank from tv_series where episode = 'A Love of a Lifetime'
select tv_channel.series_name from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_series.episode = 'A Love of a Lifetime'
select tv_channel.series_name from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_series.episode = 'A Love of a Lifetime'
select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select episode from tv_series where channel = 'Sky Radio'
select directed_by , count ( * ) from cartoon group by directed_by
select directed_by , count ( * ) from cartoon group by directed_by
select production_code , channel from cartoon order by original_air_date desc limit 1
select production_code , channel from cartoon order by original_air_date desc limit 1
select package_option , series_name from tv_channel where hight_definition_tv = 'yes'
select package_option , series_name from tv_channel where hight_definition_tv = 'Yes'
select tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select country from tv_channel except select tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select country from tv_channel except select tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
sql placeholder
select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones' intersect select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Michael Chang'
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select package_option from tv_channel except select tv_channel.package_option from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones'
select package_option from tv_channel except select package_option from cartoon join tv_channel on cartoon.channel = tv_channel.id where cartoon.directed_by = 'Ben Jones'
select count ( * ) from poker_player
select count ( * ) from poker_player
select earnings from poker_player order by earnings desc
select earnings from poker_player order by earnings desc , poker_player_id asc
select final_table_made , best_finish from poker_player
select final_table_made , best_finish from poker_player
select avg ( earnings ) from poker_player
select avg ( earnings ) from poker_player
select money_rank from poker_player order by earnings desc limit 1
select money_rank from poker_player order by earnings desc limit 1
select max ( final_table_made ) from poker_player where earnings < 200000
select max ( final_table_made ) from poker_player where earnings < 200000
select people.name from poker_player join people on poker_player.people_id = people.people_id
select people.name from poker_player join people on poker_player.people_id = people.people_id
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , poker_player.earnings , poker_player.poker_player_id
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , people.name
select people.birth_date from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings asc limit 1
select people.birth_date from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings asc limit 1
select poker_player.money_rank from poker_player join people on poker_player.people_id = people.people_id order by people.height desc limit 1
select poker_player.money_rank from poker_player join people on poker_player.people_id = people.people_id order by people.height desc limit 1
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc , people.name asc
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc , people.name asc
select nationality , count ( * ) from people group by nationality
select nationality , count ( * ) from people group by nationality
select nationality from people group by nationality order by count ( * ) desc limit 1
select nationality from people group by nationality order by count ( * ) desc limit 1
select nationality from people group by nationality having count ( * ) >= 2
select nationality from people group by nationality having count ( * ) >= 2
select name , birth_date from people order by name asc , people_id
select name , birth_date from people order by name asc , people_id
select name from people where nationality != 'Russia'
select name from people where nationality != 'Russia'
select name from people where people_id not in ( select people_id from poker_player )
select name from people where people_id not in ( select people_id from poker_player )
select count ( distinct nationality ) from people
select count ( distinct nationality ) from people
select count ( * ) from area_code_state
select contestant_number , contestant_name from contestants order by contestant_name desc
select vote_id , phone_number , state from votes
select max ( area_code ) , min ( area_code ) from area_code_state
select created from votes where state = 'CA'
select contestant_name from contestants where contestant_name != 'Jessie Alloway'
select distinct state , created from votes
select votes.contestant_number , contestants.contestant_name from votes join contestants on votes.contestant_number = contestants.contestant_number group by votes.contestant_number having count ( * ) >= 2
select contestants.contestant_number , contestants.contestant_name from contestants join votes on contestants.contestant_number = votes.contestant_number group by votes.contestant_number order by count ( * ) asc limit 1
select count ( * ) from votes where state = 'NY' or state = 'CA'
select count ( * ) from contestants where contestant_number not in ( select contestant_number from votes )
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state group by votes.state having count ( * ) = 2
select votes.created , votes.state , votes.phone_number from contestants join votes on contestants.contestant_number = votes.contestant_number where contestants.contestant_name = 'Tabatha Gehling'
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling' intersect select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Kelly Clauss'
select contestant_name from contestants where contestant_name like '%Al%'
select name from country where indepyear > 1950
select name from country where indepyear > 1950
select count ( * ) from country where governmentform = 'republic'
select count ( * ) from country where governmentform = 'republic'
select sum ( surfacearea ) from country where region = 'Caribbean'
select sum ( surfacearea ) from country where region = 'Carribean'
select continent from country where name = 'Anguilla'
select continent from country where name = 'Anguilla'
select country.region from city join country on city.countrycode = country.code where city.name = 'Kabul'
select region from country join city on country.code = city.countrycode where city.name = 'Kabul'
select countrylanguage.language , countrylanguage.percentage from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Aruba' order by countrylanguage.percentage desc limit 1
select countrylanguage.language from countrylanguage join city on countrylanguage.countrycode = city.countrycode join country on countrylanguage.isofficial = country.code where country.name = 'Aruba'
select population , lifeexpectancy from country where name = 'Brazil'
select population , lifeexpectancy from country where name = 'Brazil'
select region , population from country where name = 'Angola'
select region , population from country where name = 'Angola'
select avg ( lifeexpectancy ) from country where region = 'Central Africa'
select avg ( lifeexpectancy ) from country where continent = 'Central Africa'
select name from country where region = 'Asia' order by lifeexpectancy asc limit 1
select name from country where region = 'Asia' order by lifeexpectancy asc limit 1
select sum ( population ) , max ( gnp ) from country where continent = 'Asia'
select population , gnp from country where region = 'Asia' order by gnp desc limit 1
select avg ( lifeexpectancy ) from country where continent = 'Africa' and region = 'Republic'
select avg ( lifeexpectancy ) from country where continent = 'Africa' and region = 'Republic'
select sum ( surfacearea ) from country where continent = 'Asia' and continent = 'Europe'
select sum ( surfacearea ) from country where continent = 'Asia' or continent = 'Europe'
select sum ( population ) from city where district = 'Gelderland'
select sum ( population ) from city where district = 'Gelderland'
select avg ( gnp ) , sum ( population ) from country where governmentform = 'United States'
select avg ( gnp ) , sum ( population ) from country where governmentform = 'United States'
select count ( distinct language ) from countrylanguage
select count ( distinct language ) from countrylanguage
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct countrylanguage.language ) from city join countrylanguage on city.countrycode = countrylanguage.countrycode where city.name = 'Aruba'
select count ( distinct countrylanguage.language ) from countrylanguage join city on countrylanguage.countrycode = city.countrycode join country on city.countrycode = country.code where country.name = 'Aruba'
select count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name order by count ( * ) desc limit 1
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name order by count ( * ) desc limit 1
select continent from country language group by continent order by count ( * ) desc limit 1
select country.continent from country join countrylanguage on country.code = countrylanguage.countrycode group by country.continent order by count ( * ) desc limit 1
select count ( * ) from countrylanguage where language = 'English' and language = 'Dutch'
select count ( * ) from countrylanguage where language = 'English' intersect select count ( * ) from countrylanguage where language = 'Dutch'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'French'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'French'
select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.isofficial = 'English' intersect select country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.isofficial = 'French'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.isofficial = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.isofficial = 'French'
select count ( distinct continent ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Chinese'
select count ( distinct continent ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Chinese'
select distinct region from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
select region from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Dutch' or countrylanguage.language = 'English'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Asia' order by countrylanguage.percentage desc limit 1
select language from countrylanguage where countrycode = 'Asia' group by language order by count ( * ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'Republic' group by countrylanguage.language having count ( * ) = 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'republic'
select city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.isofficial = 'English' order by city.population desc limit 1
select city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'English' order by city.population desc limit 1
select name , population , lifeexpectancy from country where surfacearea = ( select surfacearea from country order by surfacearea desc limit 1 ) and region = ( select region from country order by surfacearea desc limit 1 )
select name , population , lifeexpectancy from country where surfacearea = ( select surfacearea from country order by surfacearea desc limit 1 ) and continent = 'Asia' order by surfacearea desc limit 1
select avg ( country.lifeexpectancy ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.isofficial != 'English'
select avg ( country.lifeexpectancy ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.isofficial != 'English'
sql placeholder
sql placeholder
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.headofstate = 'Beatrix'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.name = 'Beatrix'
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select name from country where continent = 'Africa' and population < ( select min ( population ) from country where continent = 'Asia' )
select name from country where population < ( select min ( population ) from country where continent = 'Africa' )
select name from country where population > ( select max ( population ) from country where continent = 'Asia' )
select name from country where population > ( select max ( population ) from country where continent = 'Africa' )
sql placeholder
sql placeholder
select countrycode from countrylanguage where language != 'English'
select countrycode from countrylanguage where language != 'English'
sql placeholder
sql placeholder
select name from city where countrycode in ( select countrycode from countrylanguage where isofficial = 'English' )
select name from city where countrycode in ( select countrycode from countrylanguage where isofficial = 'English' )
select distinct city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.isofficial = 'Chinese'
sql placeholder
select name , indepyear , surfacearea from country order by population asc limit 1
select name , indepyear , surfacearea from country order by population asc limit 1
select population , name , headofstate from country order by surfacearea desc limit 1
select name , population , headofstate from country order by surfacearea desc limit 1
select country.name , count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name having count ( * ) >= 3
select country.name , count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name having count ( * ) > 2
select count ( * ) , district from city where population > ( select avg ( population ) from city ) group by district
select count ( * ) , district from city where population > ( select avg ( population ) from city ) group by district
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) >= 72
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) >= 72
select avg ( lifeexpectancy ) , sum ( population ) , continent from country group by continent having avg ( lifeexpectancy ) < 72
select continent , sum ( population ) , avg ( lifeexpectancy ) from country group by continent having avg ( lifeexpectancy ) < 72
select name , surfacearea from country order by name desc , code asc
select name , surfacearea from country order by surfacearea desc , population asc
select name from country order by population desc , code asc
select name from country order by population asc , code
select name from country order by name asc , code
select name from country order by name asc , code
select count ( * ) from country where region = 'Asia'
select count ( * ) from country where region = 'Asia'
select name from country where continent = 'Europe' and population = 80000
select name from country where continent = 'Europe' and population = 80000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select name from city where population between 160000 and 900000
select name from city where population between 160000 and 900000
select language from countrylanguage group by language order by count ( * ) desc limit 1
select language from countrylanguage group by language order by count ( * ) desc limit 1
select language , countrycode , country.name from country join countrylanguage on country.code = countrylanguage.countrycode order by percentage desc limit 1
select countrycode , language , max ( percentage ) from countrylanguage group by countrycode
select count ( * ) from countrylanguage where percentage = 'Spanish' order by percentage desc limit 1
select count ( * ) from countrylanguage where language = 'Spanish' and percentage >= 100
select countrycode from countrylanguage where language = 'Spanish' order by percentage desc limit 1
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Spanish'
select count ( * ) from conductor
select count ( * ) from conductor
select name from conductor order by age asc , conductor_id
select name from conductor order by age asc , conductor_id
select name from conductor where nationality != 'USA'
select name from conductor where nationality != 'USA'
select record_company from orchestra order by year_of_founded desc , orchestra_id asc
select record_company from orchestra order by year_of_founded desc , orchestra_id asc
select avg ( attendance ) from show
select avg ( attendance ) from show
select max ( share ) , min ( share ) from performance where type != 'Live final'
select max ( share ) , min ( share ) from performance where type != 'Live final'
select count ( distinct nationality ) from conductor
select count ( distinct nationality ) from conductor
select name from conductor order by year_of_work desc , conductor_id asc
select name from conductor order by year_of_work desc , conductor_id
select name from conductor order by year_of_work desc limit 1
select name from conductor order by year_of_work desc limit 1
select conductor.name , orchestra.orchestra from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id join conductor on orchestra.conductor_id = conductor.conductor_id
select conductor.name , orchestra.orchestra from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id group by conductor.name having count ( * ) > 1
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id group by conductor.conductor_id having count ( * ) > 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id where orchestra.year_of_founded > 2008
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id where orchestra.year_of_founded > 2008
select record_company , count ( * ) from orchestra group by record_company
select record_company , count ( * ) from orchestra group by record_company
select major_record_format from orchestra group by major_record_format order by count ( * ) asc , major_record_format
select major_record_format from orchestra group by major_record_format order by count ( * ) desc , major_record_format asc , orchestra.orchestra_id
select record_company from orchestra group by record_company order by count ( * ) desc limit 1
select record_company from orchestra group by record_company order by count ( * ) desc limit 1
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select orchestra.year_of_founded from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id group by performance.orchestra_id having count ( * ) > 1
select orchestra.year_of_founded from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id group by performance.orchestra_id having count ( * ) > 1
select count ( * ) from highschooler
select count ( * ) from highschooler
select name , grade from highschooler
select name , grade from highschooler
select distinct grade from highschooler
select grade from highschooler
select grade from highschooler where name = 'Kyle'
select grade from highschooler where name = 'Kyle'
select name from highschooler where grade = 10
select name from highschooler where grade = 10
select id from highschooler where name = 'Kyle'
select id from highschooler where name = 'Kyle'
select count ( * ) from highschooler where grade = 9 or grade = 10
select count ( * ) from highschooler where grade = 9 or grade = 10
select grade , count ( * ) from highschooler group by grade
select count ( * ) , grade from highschooler group by grade
select grade from highschooler group by grade order by count ( * ) desc limit 1
select grade from highschooler group by grade order by count ( * ) desc limit 1
select grade from highschooler group by grade having count ( * ) >= 4
select grade from highschooler group by grade having count ( * ) >= 4
select student_id , count ( * ) from friend group by student_id
select count ( * ) from friend
select highschooler.name , count ( * ) from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id
select highschooler.name , count ( * ) from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id having count ( * ) >= 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id order by count ( * ) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id order by count ( * ) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id having count ( * ) >= 3
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by friend.student_id having count ( * ) >= 3
select friend.friend_id , highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select friend.friend_id , highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select friend.student_id , count ( * ) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by friend.student_id
select count ( * ) , friend.student_id from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by friend.student_id
select id from highschooler except select student_id from friend
select id from highschooler except select student_id from friend
select name from highschooler where id not in ( select student_id from friend )
select name from highschooler except select highschooler.name from highschooler join friend on highschooler.id = friend.student_id
select highschooler.id from highschooler join friend on highschooler.id = friend.student_id intersect select likes.liked_id from highschooler join likes on highschooler.id = likes.student_id
select student_id from friend intersect select student_id from likes
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select highschooler.name from highschooler join likes on highschooler.id = likes.student_id
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select highschooler.name from highschooler join likes on highschooler.id = likes.student_id
select count ( * ) , student_id from likes group by student_id
select count ( * ) , liked_id from likes group by student_id
select highschooler.name , count ( * ) from highschooler join likes on highschooler.id = likes.student_id where likes.liked_id = '1' group by highschooler.id
select highschooler.name , count ( * ) from highschooler join likes on highschooler.id = likes.student_id where likes.liked_id = '1' group by highschooler.id
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count ( * ) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id order by count ( * ) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count ( * ) >= 2
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count ( * ) >= 2
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.grade > 5 group by highschooler.name having count ( * ) >= 2
select highschooler.name from highschooler join friend on highschooler.id = friend.friend_id where highschooler.grade > 5 group by highschooler.id having count ( * ) >= 2
select likes.student_id , count ( * ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by likes.student_id
select highschooler.id , count ( * ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
select avg ( highschooler.grade ) from highschooler join friend on highschooler.id = friend.student_id where friend.friend_id = 'you' or friend.friend_id = 'you'
select avg ( highschooler.grade ) from highschooler join friend on highschooler.id = friend.student_id
select min ( grade ) from highschooler where id not in ( select student_id from friend )
select min ( grade ) from highschooler where id not in ( select student_id from friend )
select state from owners intersect select state from professionals
select state from owners intersect select state from professionals
select avg ( dogs.age ) from dogs join treatments on dogs.dog_id = treatments.dog_id
select avg ( dogs.age ) from dogs join treatments on dogs.dog_id = treatments.dog_id
select professionals.professional_id , professionals.last_name , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id where professionals.state = 'Indiana' group by professionals.professional_id having count ( * ) > 2
select treatments.professional_id , professionals.last_name , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id where professionals.state = 'Indiana' union select treatments.professional_id , professionals.last_name , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id where professionals.state = 'USA' group by professionals.state having count ( * ) > 2
select name from dogs where dog_id not in ( select dog_id from treatments where cost_of_treatment > 1000 )
select name from dogs where dog_id not in ( select dog_id from treatments where cost_of_treatment > 1000 )
select first_name from professionals except select dogs.name from professionals join dogs on professionals.professional_id = dogs.owner_id
select first_name from professionals except select dogs.name from professionals join dogs on professionals.professional_id = dogs.owner_id
select professional_id , role_code , email_address from professionals except select professionals.professional_id , professionals.role_code , professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select professional_id , role_code , email_address from professionals except select professionals.professional_id , professionals.role_code , professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count ( * ) desc limit 1
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count ( * ) desc limit 1
select professionals.professional_id , professionals.role_code , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count ( * ) >= 2
select treatments.professional_id , professionals.role_code , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select breeds.breed_name from dogs join breeds on dogs.breed_code = breeds.breed_code group by breeds.breed_name order by count ( * ) desc limit 1
select breeds.breed_name from dogs join breeds on dogs.breed_code = breeds.breed_code group by breeds.breed_name order by count ( * ) desc limit 1
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count ( * ) desc limit 1
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum ( treatments.cost_of_treatment ) desc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum ( treatments.cost_of_treatment ) asc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum ( treatments.cost_of_treatment ) asc limit 1
sql placeholder
sql placeholder
select professionals.professional_id , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count ( * ) >= 2
select treatments.professional_id , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select professionals.first_name , professionals.last_name from treatments join professionals on treatments.professional_id = professionals.professional_id where treatments.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments )
select professionals.first_name , professionals.last_name from treatments join professionals on treatments.professional_id = professionals.professional_id where treatments.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments )
select treatments.date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id where dogs.size_code >= 1
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select dogs.name , treatments.date_of_treatment from dogs join treatments on dogs.dog_id = treatments.dog_id join breeds on dogs.breed_code = breeds.breed_code order by breeds.breed_name asc limit 1
select dogs.name , treatments.date_of_treatment from dogs join treatments on dogs.dog_id = treatments.dog_id join breeds on dogs.breed_code = breeds.breed_code order by breeds.breed_name asc limit 1
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
select dogs.date_arrived , dogs.date_departed from dogs join treatments on dogs.dog_id = treatments.dog_id
select dogs.date_arrived , dogs.date_departed from dogs join treatments on dogs.dog_id = treatments.dog_id
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age asc limit 1
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age asc limit 1
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select date_arrived , date_departed from dogs
select date_arrived , date_departed from dogs
select count ( distinct dog_id ) from treatments
select count ( * ) from treatments
select count ( distinct professional_id ) from treatments
select count ( distinct professional_id ) from treatments
select role_code , street , city , state from professionals where city like '%West%'
select role_code , street , city , state from professionals where city like '%West%'
select first_name , last_name , email_address from owners where state like '%North%'
select first_name , last_name , email_address from owners where state like '%North%'
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select cost_of_treatment from treatments order by date_of_treatment desc limit 1
select cost_of_treatment from treatments order by date_of_treatment desc limit 1
select count ( * ) from dogs where dog_id not in ( select dog_id from treatments )
select count ( * ) from dogs where dog_id not in ( select dog_id from treatments )
select count ( * ) from owners where owner_id not in ( select owner_id from dogs )
select count ( * ) from owners where owner_id not in ( select owner_id from dogs )
select count ( * ) from professionals where professional_id not in ( select professional_id from treatments )
select count ( * ) from professionals where professional_id not in ( select professional_id from treatments )
select name , age , weight from dogs where abandoned_yn = 1 and not abandoned_yn = 0
select name , age , weight from dogs where abandoned_yn = 1
select avg ( age ) from dogs
select avg ( age ) from dogs
select age from dogs order by age desc limit 1
select age from dogs order by age desc limit 1
select charge_type , sum ( charge_amount ) from charges group by charge_type
select charge_type , charge_amount from charges
select charge_type from charges order by charge_amount desc limit 1
select charge_amount from charges order by charge_type desc limit 1
select email_address , cell_number , home_phone from professionals
select email_address , cell_number , home_phone from professionals
select distinct breed_code , size_code from dogs
select distinct breed_code , size_code from dogs
select professionals.first_name , treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select professionals.first_name , treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select count ( * ) from singer
select count ( * ) from singer
select name from singer order by net_worth_millions asc , name
select name from singer order by net_worth_millions asc , singer_id
select birth_year , citizenship from singer
select birth_year , citizenship from singer
select name from singer where citizenship != 'France'
select name from singer where citizenship != 'French'
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer order by net_worth_millions desc limit 1
select name from singer order by net_worth_millions desc limit 1
select citizenship , count ( * ) from singer group by citizenship
select citizenship , count ( * ) from singer group by citizenship
select citizenship from singer group by citizenship order by count ( * ) desc limit 1
select citizenship , count ( * ) from singer group by citizenship
select citizenship , max ( net_worth_millions ) from singer group by citizenship
select max ( net_worth_millions ) , citizenship from singer group by citizenship
select song.title , singer.name from singer join song on singer.singer_id = song.singer_id
select song.title , singer.name from singer join song on singer.singer_id = song.singer_id
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name , sum ( song.sales ) from singer join song on singer.singer_id = song.singer_id group by song.singer_id
select singer.name , sum ( song.sales ) from singer join song on singer.singer_id = song.singer_id group by singer.name
select name from singer where singer_id not in ( select singer_id from song )
select name from singer where singer_id not in ( select singer_id from song )
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select count ( * ) from other_available_features
select ref_feature_types.feature_type_name from other_available_features join ref_feature_types on other_available_features.feature_type_code = ref_feature_types.feature_type_code where other_available_features.feature_name = 'AirCon'
select ref_property_types.property_type_description from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code
select property_name from properties where room_count > 1 or property_type_code = 'house'
