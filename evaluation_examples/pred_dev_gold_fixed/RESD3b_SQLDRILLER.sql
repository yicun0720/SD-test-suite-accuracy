select count ( * ) from singer
select count ( * ) from singer
select name , country , age from singer order by age desc , singer_id asc
select name , country , age from singer order by age desc , singer_id asc
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select song_name , song_release_year from singer order by age asc limit 1
select name , song_release_year from singer where age = ( select min ( age ) from singer )
select distinct country from singer where age > 20
select distinct country from singer where age > 20
select country , count ( * ) from singer group by country
select country , count ( * ) from singer group by country
select distinct song_name from singer where age > ( select avg ( age ) from singer )
select distinct song_name from singer where age > ( select avg ( age ) from singer )
select location , name from stadium where capacity between 5000 and 10000
select location , name from stadium where capacity between 5000 and 10000
select max ( capacity ) , avg ( capacity ) from stadium
select max ( capacity ) , avg ( average ) from stadium
select s.name , s.capacity from stadium s where s.average = ( select max ( average ) from stadium ) order by s.lowest asc limit 1
select s.name , s.capacity from stadium s where s.average = ( select max ( avg_cnt ) from ( select avg ( average ) as avg_cnt from stadium group by average ) )
select count ( * ) from concert where year = 2014 or year = 2015
select count ( * ) from concert where year = 2014 or year = 2015
select name , ( select count ( * ) from concert where stadium_id = stadium.stadium_id ) as concert_count from stadium
select stadium.name , count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id group by stadium.stadium_id
select stadium.name , stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year >= 2014 group by stadium.stadium_id having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from concert where year >= 2014 group by stadium_id ) )
select s.name , s.capacity from stadium s where exists ( select 1 from concert c where c.stadium_id = s.stadium_id and c.year > 2013 group by c.stadium_id having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from concert where year > 2013 group by stadium_id ) as counts ) )
select year from concert group by year having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from concert group by year ) )
select year from concert group by year having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from concert group by year ) )
select name from stadium where stadium_id not in ( select stadium_id from concert )
select name from stadium where stadium_id not in ( select stadium_id from concert )
select country from singer where age > 40 intersect select country from singer where age < 30
select name from stadium where stadium_id not in ( select stadium_id from concert where year = 2014 )
select name from stadium where stadium_id not in ( select stadium_id from concert where year = 2014 )
select concert_name , theme , ( select count ( distinct singer_id ) from singer_in_concert where concert_id = singer_in_concert.concert_id ) as singer_count from concert
select concert_name , theme , ( select count ( * ) from singer_in_concert where singer_in_concert.concert_id = concert.concert_id ) as singer_count from concert
select name , ( select count ( concert_id ) from singer_in_concert where singer_id = singer.singer_id ) as concert_count from singer
select name , ( select count ( * ) from singer_in_concert where singer_id = singer.singer_id ) as concert_count from singer
select distinct singer.name from singer_in_concert join concert on singer_in_concert.concert_id = concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select distinct singer.name from concert join singer_in_concert on concert.concert_id = singer_in_concert.concert_id join singer on singer_in_concert.singer_id = singer.singer_id where concert.year = 2014
select name , country from singer where song_name like '%Hey%'
select name , country from singer where song_name like '%Hey%'
select name , location from stadium where stadium_id in ( select stadium_id from concert where year = 2014 intersect select stadium_id from concert where year = 2015 )
select name , location from stadium where stadium_id in ( select stadium_id from concert where year = 2014 intersect select stadium_id from concert where year = 2015 )
select count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from pets where weight > 10
select count ( * ) from pets where weight > 10
select weight from pets where pet_age = ( select min ( pet_age ) from pets )
select weight from pets where pet_age = ( select min ( pet_age ) from pets )
select max ( weight ) , pettype from pets group by pettype
select max ( weight ) , pettype from pets group by pettype
select count ( * ) from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.age > 20
select count ( * ) from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where student.age > 20
select count ( distinct pets.petid ) from pets join has_pet on pets.petid = has_pet.petid join student on has_pet.stuid = student.stuid where student.sex = 'F' and pets.pettype = 'Dog'
select count ( * ) from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where student.sex = 'F' and pets.pettype = 'Dog'
select count ( distinct pettype ) from pets
select count ( distinct pettype ) from pets
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype in ( 'Cat' , 'Dog' ) )
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype in ( 'Cat' , 'Dog' ) )
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' intersect select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Dog' )
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' intersect select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Dog' )
select major , age from student where stuid not in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' )
select student.major , student.age from student where stuid not in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' )
select stuid from student except select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat'
select stuid from student except select stuid from has_pet join pets on has_pet.petid = pets.petid where pettype = 'Cat'
select student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'Dog' except select student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat'
select fname from student where stuid in ( select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'dog' except select has_pet.stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'cat' )
select pettype , weight from pets where pet_age = ( select min ( pet_age ) from pets )
select pettype , weight from pets where pet_age = ( select min ( pet_age ) from pets )
select petid , weight from pets where pet_age > 1
select petid , weight from pets where pet_age > 1
select pettype , avg ( pet_age ) , max ( pet_age ) from pets group by pettype
select pettype , avg ( pet_age ) , max ( pet_age ) from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select fname , age from student where stuid in ( select has_pet.stuid from has_pet )
select distinct student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid
select pets.petid from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.lname = 'Smith'
select pets.petid from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.lname = 'Smith'
select count ( * ) , stuid from has_pet group by stuid
select count ( * ) , student.stuid from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid group by student.stuid
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pet_age = 3 and student.lname = 'Kitty'
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pet_age = 3 and student.age = 16
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select count ( * ) from continents
select count ( * ) from continents
select continents.contid , continents.continent , count ( countries.countryid ) as country_count from continents left join countries on continents.contid = countries.continent group by continents.contid , continents.continent
select continents.contid , continents.continent , count ( * ) from continents join countries on continents.contid = countries.continent group by continents.contid
select count ( * ) from countries
select count ( * ) from countries
select car_makers.fullname , car_makers.id , count ( model_list.model ) as models_produced from car_makers left join model_list on car_makers.id = model_list.maker group by car_makers.id
select car_makers.fullname , car_makers.id , count ( * ) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select model_list.model from cars_data join model_list on cars_data.id = model_list.model where cars_data.horsepower = ( select min ( horsepower ) from cars_data )
select m.model from model_list as m inner join cars_data as c on m.modelid = c.id where c.horsepower = ( select min ( horsepower ) from cars_data )
select model_list.model from cars_data join model_list on cars_data.id = model_list.maker where cars_data.weight < ( select avg ( weight ) from cars_data )
select cd.id from cars_data cd where cd.weight < ( select avg ( weight ) from cars_data )
select car_makers.fullname from cars_data join car_makers on cars_data.id = car_makers.id where cars_data.year = 1970
select distinct car_makers.maker from cars_data join car_makers on cars_data.id = car_makers.id where cars_data.year = 1970
select car_names.make , cars_data.year from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.year = ( select min ( year ) from cars_data )
select car_makers.fullname , cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = ( select min ( year ) from cars_data )
select car_makers.fullname , cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = ( select min ( year ) from cars_data )
select distinct car_names.model , car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.year > 1980
select continents.continent , count ( * ) from continents join countries on continents.contid = countries.continent join car_makers on countries.countryid = car_makers.country group by continents.continent
select continents.continent , count ( * ) from continents join countries on continents.contid = countries.continent join car_makers on countries.countryid = car_makers.country group by continents.contid
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from car_makers group by country ) )
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid order by count ( * ) desc limit 1
select count ( * ) , car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select car_makers.id , car_makers.fullname , count ( model_list.model ) as models_count from car_makers left join model_list on car_makers.id = model_list.maker group by car_makers.id
select cars_data.accelerate from cars_data join car_names on cars_data.id = car_names.makeid where car_names.make = 'amc hornet sportabout (sw)'
select cars_data.accelerate from cars_data join car_names on cars_data.id = car_names.makeid where car_names.make = 'amc hornet sportabout (sw)'
select count ( * ) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = 'France'
select count ( * ) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = 'France'
select count ( * ) from car_makers join countries on car_makers.country = countries.countryid where countries.countryname = 'France'
select count ( distinct model_list.model ) from car_makers join model_list on car_makers.id = model_list.maker join countries on car_makers.country = countries.countryid where countries.countryname = 'usa'
select avg ( mpg ) from cars_data where cylinders = 4
select avg ( mpg ) from cars_data where cylinders = 4
select min ( weight ) from cars_data where cylinders = 8 and year = 1974
select min ( weight ) from cars_data where cylinders = 8 and year = 1974
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select countries.countryname , countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 1
select countries.countryname , countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 1
select count ( * ) from cars_data where horsepower > 150
select count ( * ) from cars_data where horsepower > 150
select avg ( weight ) , year from cars_data group by year
select avg ( weight ) , year from cars_data group by year
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where countries.continent = 'Europe' group by countries.countryname having count ( * ) >= 3
select countryname from countries where countryid in ( select country from car_makers group by country having count ( * ) >= 3 )
select max ( cars_data.horsepower ) , car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 3
select max ( cars_data.horsepower ) , car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.cylinders = 3
select model from model_list where model = ( select max ( mpg ) from cars_data )
select m.model from model_list m where m.model in ( select model from cars_data where mpg = ( select max ( mpg ) from cars_data ) )
select avg ( horsepower ) from cars_data where year < 1980
select avg ( horsepower ) from cars_data where year < 1980
select avg ( cars_data.edispl ) from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = 'volvo'
select avg ( edispl ) from cars_data join car_names on cars_data.id = car_names.makeid where car_names.make = 'Volvo'
select max ( accelerate ) , cylinders from cars_data group by cylinders
select max ( accelerate ) from cars_data group by cylinders
select model_list.modelid from model_list join car_names on model_list.model = car_names.model group by model_list.modelid order by count ( distinct car_names.makeid ) desc limit 1
select model_list.modelid from model_list join car_names on model_list.model = car_names.model group by model_list.modelid order by count ( * ) desc limit 1
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where year = 1980
select count ( * ) from cars_data where year = 1980
select count ( distinct model_list.model ) from model_list join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'American Motor Company'
select count ( distinct model_list.model ) from model_list join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'American Motor Company'
select car_makers.fullname , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select car_makers.maker , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select distinct model_list.model from model_list join cars_data on model_list.maker = cars_data.id join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'General Motors' or cars_data.weight > 3500
select distinct model_list.model from model_list join cars_data on model_list.maker = cars_data.id join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'General Motors' or cars_data.weight > 3500
select distinct year from cars_data where weight between 3000 and 4000
select distinct year from cars_data where weight < 4000 and weight > 3000
select horsepower from ( select horsepower , max ( accelerate ) as max_accelerate from cars_data group by horsepower ) where max_accelerate = ( select max ( accelerate ) from cars_data )
select horsepower from cars_data where accelerate = ( select max ( accelerate ) from cars_data )
select cylinders from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = 'Volvo' order by cars_data.accelerate asc limit 1
select cylinders from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = 'Volvo' order by cars_data.accelerate asc limit 1
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data )
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data where horsepower = ( select max ( horsepower ) from cars_data ) )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from cars_data where cylinders > 6
select count ( * ) from cars_data where cylinders > 6
select count ( * ) from cars_data where cylinders > 6
select count ( * ) from cars_data where cylinders > 6
select car_names.makeid , car_names.make from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.horsepower > ( select min ( horsepower ) from cars_data ) and cylinders <= 3
select makeid , make from car_names where makeid not in ( select min ( horsepower ) from cars_data )
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select id from cars_data where weight < 3500 except select id from car_makers where maker = 'Ford Motor Company'
select id from cars_data where weight < 3500 except select id from car_makers where maker = 'Ford Motor Company'
select countryname from countries where countryid not in ( select country from car_makers )
select countryname from countries where countryid not in ( select country from car_makers )
select car_makers.id , car_makers.maker from model_list join car_names on model_list.model = car_names.model join car_makers on car_names.makeid = car_makers.id group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 3
select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select countries.countryid , countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) > 3 union select countryid , countryname from countries join car_makers on countries.countryid = car_makers.country where car_makers.maker in ( select maker from model_list where model = 'fiat' )
select countryid , countryname from countries group by countryid having count ( * ) > 3 union select countryid , countryname from countries where countryid in ( select country from car_makers where maker = 'Fiat' )
select country from airlines where airline = 'JetBlue Airways'
select country from airlines where airline = 'Jetblue Airways'
select abbreviation from airlines where airline = 'JetBlue Airways'
select abbreviation from airlines where airline = 'JetBlue Airways'
select distinct airline , abbreviation from airlines where country = 'USA'
select airline , abbreviation from airlines where country = 'United States'
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
select count ( * ) from airlines where country = 'United States'
select city , country from airports where airportname = 'Alton'
select city , country from airports where airportname = 'Alton'
select airportname from airports where airportcode = 'AKO'
select airportname from airports where airportcode = 'AKO'
select distinct airportname from airports where city = 'Aberdeen'
select airportname from airports where city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select count ( * ) from flights where destairport = 'ATO'
select count ( * ) from flights join airports on flights.destairport = airports.airportcode where airports.airportname = 'ATO'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'City Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen' and airports.city = 'Ashley'
select count ( * ) from flights join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'Aberdeen' and airports.airportname = 'Ashley'
select count ( * ) from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'JetBlue Airways'
select count ( * ) from flights join airlines on flights.airline = airlines.uid where airlines.airline = 'Jetblue Airways'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.airportname = 'ASY' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.airportname = 'ASY' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'AHD' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'AHD' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
select airports.city from airports join flights on airports.airportcode = flights.sourceairport group by airports.city order by count ( * ) desc limit 1
select a.city from airports a where ( select count ( * ) from flights f where f.destairport = a.airportcode ) = ( select max ( count ) from ( select count ( * ) as count from flights group by destairport ) )
select airports.city from airports join flights on airports.airportcode = flights.destairport group by airports.city order by count ( * ) desc limit 1
select a.city from airports a , flights f where a.airportcode = f.sourceairport group by a.city having count ( f.sourceairport ) = ( select max ( count ) from ( select count ( * ) as count from flights group by sourceairport ) )
select a.city from airports a , flights f where a.airportcode = f.sourceairport group by a.city having count ( f.sourceairport ) = ( select max ( count ) from ( select count ( * ) as count from flights group by sourceairport ) )
select a.airportcode from airports a join flights f on a.airportcode = f.sourceairport group by a.airportcode having count ( f.flightno ) = ( select max ( count ) from ( select count ( * ) as count from flights group by sourceairport ) )
select a.airportcode from airports a join flights f on a.airportcode = f.sourceairport group by a.airportcode order by sum ( f.flightno ) asc limit 1
select a.airportcode from airports a join flights f on a.airportcode = f.sourceairport group by a.airportcode order by sum ( f.flightno ) asc limit 1
select a.airline from airlines a join flights f on a.uid = f.airline group by a.uid having count ( f.flightno ) = ( select max ( countflights ) from ( select count ( flightno ) as countflights from flights group by airline ) )
select a.airline from airlines a join flights f on a.uid = f.airline group by a.uid having count ( f.flightno ) = ( select max ( countflights ) from ( select count ( flightno ) as countflights from flights group by airline ) )
select a.abbreviation , a.country from airlines a inner join flights f on a.uid = f.airline group by a.uid having sum ( f.flightno ) = ( select min ( total ) from ( select sum ( flightno ) as total from flights group by airline ) )
select a.abbreviation , a.country from airlines a inner join flights f on a.uid = f.airline group by a.uid having count ( f.flightno ) = ( select min ( countflights ) from ( select count ( flightno ) as countflights from flights group by airline ) )
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportcode = 'AHD'
select distinct a.airline from airlines a join flights f on a.uid = f.airline where f.sourceairport = 'AHD'
select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportcode = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportcode = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG' intersect select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'CVO'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG' intersect select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'CVO'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO' except select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'APG'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO' except select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'APG'
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.uid having count ( * ) < 200
select a.airline from airlines a left join flights f on a.uid = f.airline group by a.uid having count ( f.flightno ) < 200
select distinct flightno from flights join airlines on flights.airline = airlines.uid where airlines.airline = 'United Airlines'
select flights.flightno from flights join airlines on flights.airline = airlines.uid where airlines.airline = 'United Airlines'
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'APG'
select flightno from flights where sourceairport = 'APG'
select flights.flightno from airports join flights on airports.airportcode = flights.destairport where airports.airportname = 'APG'
select flights.flightno from airports join flights on airports.airportcode = flights.destairport where airports.airportname = 'APG'
select distinct flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = 'Aberdeen'
select flights.flightno from flights join airports on flights.sourceairport = airports.airportcode where airports.city = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.destairport where airports.airportname = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.airportname = 'Aberdeen' or airports.airportname = 'Abilene'
select airportname from airports where airportcode not in ( select sourceairport from flights )
select airports.airportname from airports left join flights on airports.airportcode = flights.destairport except select airports.airportname from airports left join flights on airports.airportcode = flights.sourceairport
select count ( * ) from employee
select count ( * ) from employee
select name from employee order by age asc , employee_id
select name from employee order by age asc , employee_id
select city , count ( * ) from employee group by city
select count ( * ) , city from employee group by city
select city from employee where age < 30 group by city having count ( * ) > 1
select city from employee where age < 30 group by city having count ( * ) > 1
select location , count ( * ) from shop group by location
select location , count ( * ) from shop group by location
select manager_name , district from shop where number_products = ( select max ( number_products ) from shop )
select manager_name , district from shop where number_products = ( select max ( number_products ) from shop )
select min ( number_products ) , max ( number_products ) from shop
select min ( number_products ) , max ( number_products ) from shop
select min ( number_products ) , max ( number_products ) from shop
select min ( number_products ) , max ( number_products ) from shop
select name from shop where number_products > ( select avg ( number_products ) from shop )
select name from shop where number_products > ( select avg ( number_products ) from shop )
select name from employee where employee_id in ( select employee_id from evaluation group by employee_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from evaluation group by employee_id ) ) )
select e.name from employee e where e.employee_id in ( select e.employee_id from evaluation e group by e.employee_id having count ( e.bonus ) = ( select max ( award_count ) from ( select count ( bonus ) as award_count from evaluation group by employee_id ) ) )
select name from employee where employee_id in ( select employee_id from evaluation where bonus = ( select max ( bonus ) from evaluation ) )
select e.name from employee e where e.employee_id in ( select e.employee_id from evaluation e where e.bonus = ( select max ( bonus ) from evaluation ) )
select name from employee where employee_id not in ( select employee_id from evaluation )
select name , employee_id from employee where employee_id not in ( select employee_id from evaluation )
select name from shop where shop_id in ( select shop_id from hiring group by shop_id having count ( employee_id ) = ( select max ( cnt ) from ( select count ( employee_id ) as cnt from hiring group by shop_id ) ) )
select name from shop where shop_id in ( select shop_id from hiring group by shop_id having count ( employee_id ) = ( select max ( cnt ) from ( select count ( employee_id ) as cnt from hiring group by shop_id ) ) )
select name from shop where shop_id not in ( select shop_id from hiring )
select name from shop where shop_id not in ( select shop_id from hiring )
select shop.name , ( select count ( employee_id ) from hiring where shop_id = shop.shop_id ) as employee_count from shop
select shop.name , ( select count ( employee_id ) from hiring where shop_id = shop.shop_id ) as employee_count from shop
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
select document_name , template_id from documents where instr ( document_description , 'w' ) > 0
select document_name , template_id from documents where document_description like '%w%'
select document_id , template_id , document_description from documents where document_name = 'Robbin CV'
select document_id , template_id , document_description from documents where document_name = 'Robbin CV'
select count ( distinct template_id ) from documents
select count ( distinct template_id ) from documents
select count ( * ) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'PPT'
select count ( * ) from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'PPT'
select t.template_id , count ( d.document_id ) from templates t left join documents d on t.template_id = d.template_id group by t.template_id
select template_id , count ( * ) from documents group by template_id
select first.template_id , first.template_type_code from templates first where ( select count ( * ) from documents where template_id = first.template_id ) = ( select max ( second.count ) from ( select count ( * ) as count from documents group by template_id ) second )
select templates.template_id , templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_id order by count ( * ) desc limit 1
select templates.template_id from documents join templates on documents.template_id = templates.template_id group by templates.template_id having count ( * ) > 1
select templates.template_id from documents join templates on documents.template_id = templates.template_id group by templates.template_id having count ( * ) > 1
select template_id from templates except select template_id from documents
select template_id from templates except select template_id from documents
select count ( * ) from templates
select count ( * ) from templates
select template_id , version_number , template_type_code from templates
select template_id , version_number , template_type_code from templates
select distinct template_type_code from templates
select distinct template_type_code from ref_template_types
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'
select count ( * ) from templates where template_type_code = 'CV'
select count ( * ) from templates where template_type_code = 'CV'
select version_number , template_type_code from templates where version_number > 5
select version_number , template_type_code from templates where version_number > 5
select rt.template_type_code , count ( t.template_id ) from ref_template_types rt left join templates t on rt.template_type_code = t.template_type_code group by rt.template_type_code
select template_type_code , count ( * ) from templates group by template_type_code
select template_type_code from templates group by template_type_code having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from templates group by template_type_code ) )
select template_type_code from templates group by template_type_code having count ( template_id ) = ( select max ( count ) from ( select count ( template_id ) as count from templates group by template_type_code ) )
select template_type_code from templates group by template_type_code having count ( * ) < 3
select template_type_code from templates group by template_type_code having count ( * ) < 3
select min ( version_number ) , template_type_code from templates group by template_type_code
select min ( version_number ) , template_type_code from templates
select template_type_code from templates where exists ( select 1 from documents where templates.template_id = documents.template_id and document_name = 'Data base' )
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
select document_name from documents where template_id in ( select template_id from templates where template_type_code = 'BK' )
select documents.document_name from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'BK'
select templates.template_type_code , count ( distinct documents.document_id ) from templates left join documents on templates.template_id = documents.template_id group by templates.template_type_code
select templates.template_type_code , count ( distinct documents.document_id ) as num_docs from templates left join documents on templates.template_id = documents.template_id group by templates.template_type_code
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count ( * ) desc limit 1
select first.template_type_code from templates first where ( select count ( * ) from documents where template_id = first.template_id ) = ( select max ( second.cnt ) from ( select count ( * ) as cnt from documents group by template_id ) second )
select first.template_type_code from templates first where ( select count ( * ) from documents where template_id = first.template_id ) = ( select max ( second.cnt ) from ( select count ( * ) as cnt from documents group by template_id ) second )
select template_type_code from templates except select templates.template_type_code from templates join documents on templates.template_id = documents.template_id
select template_type_code , template_type_description from ref_template_types
select template_type_code , template_type_description from ref_template_types
select ref_template_types.template_type_description from ref_template_types where ref_template_types.template_type_code = 'AD'
select template_type_description from ref_template_types where template_type_code = 'AD'
select template_type_code from ref_template_types where template_type_description = 'Book'
select template_type_code from ref_template_types where template_type_description = 'Book'
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on templates.template_id = documents.template_id
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on templates.template_id = documents.template_id
select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'
select templates.template_id from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code where ref_template_types.template_type_description = 'Presentation'
select count ( * ) from paragraphs
select count ( * ) from paragraphs
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select * from paragraphs where paragraph_text = '%Korea%'
select * from paragraphs where paragraph_text = 'Korea'
select paragraphs.paragraph_id , paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Welcome to NY'
select paragraphs.paragraph_id , paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Welcome to NY'
select paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Customer reviews'
select paragraphs.paragraph_text from documents join paragraphs on documents.document_id = paragraphs.document_id where documents.document_name = 'Customer reviews'
select d.document_id , count ( p.paragraph_id ) as num_paragraphs from documents d left join paragraphs p on d.document_id = p.document_id group by d.document_id order by d.document_id asc
select documents.document_id , count ( * ) from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by documents.document_id asc
select document_id , document_name , ( select count ( * ) from paragraphs where documents.document_id = paragraphs.document_id ) as paragraph_count from documents
select documents.document_id , documents.document_name , ( select count ( * ) from paragraphs where paragraphs.document_id = documents.document_id ) as paragraph_count from documents
select document_id from paragraphs group by document_id having count ( * ) >= 2
select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id having count ( * ) >= 2
select documents.document_id , documents.document_name from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id having count ( paragraphs.paragraph_id ) = ( select max ( cnt ) from ( select count ( paragraph_id ) as cnt from paragraphs group by document_id ) )
select p.document_id , d.document_name from paragraphs p join documents d on p.document_id = d.document_id group by p.document_id having count ( p.paragraph_id ) = ( select max ( total ) from ( select count ( paragraph_id ) as total from paragraphs group by document_id ) )
select document_id from ( select document_id , count ( paragraph_id ) as num_paragraphs from paragraphs group by document_id ) where num_paragraphs = ( select min ( num_paragraphs ) from ( select count ( paragraph_id ) as num_paragraphs from paragraphs group by document_id ) )
select document_id from ( select document_id , count ( paragraph_id ) as num_paragraphs from paragraphs group by document_id ) where num_paragraphs = ( select min ( num_paragraphs ) from ( select count ( paragraph_id ) as num_paragraphs from paragraphs group by document_id ) )
select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id having count ( * ) between 1 and 2
select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id group by documents.document_id having count ( * ) between 1 and 2
select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id where paragraphs.paragraph_text = 'Brazil' intersect select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id where paragraphs.paragraph_text = 'Ireland'
select count ( * ) from teacher
select count ( * ) from teacher
select count ( * ) from teacher
select count ( * ) from teacher
select age , hometown from teacher
select age , hometown from teacher
select name from teacher where hometown != ''
select distinct name from teacher where hometown != 'Little Lever Urban District'
select name from teacher where age = 32 or age = 33
select name from teacher where age = 32 or age = 33
select distinct hometown from teacher where age = ( select min ( age ) from teacher )
select hometown from teacher where age = ( select min ( age ) from teacher )
select hometown , count ( * ) from teacher group by hometown
select hometown , count ( * ) from teacher group by hometown
select hometown from teacher group by hometown having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from teacher group by hometown ) )
select hometown from teacher group by hometown having count ( hometown ) = ( select max ( count ) from ( select count ( hometown ) as count from teacher group by hometown ) )
select hometown from teacher group by hometown having count ( * ) >= 2
select hometown from teacher group by hometown having count ( * ) >= 2
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc , course.course asc
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc , course.course asc
select name from teacher where teacher_id in ( select teacher_id from course_arrange where course_id in ( select course_id from course where course = 'Math' ) )
select name from teacher where teacher_id in ( select teacher_id from course_arrange join course on course_arrange.course_id = course.course_id where course.course = 'Math' )
select teacher.name as name , count ( course_arrange.course_id ) as courses_taught from teacher left join course_arrange on teacher.teacher_id = course_arrange.teacher_id group by teacher.name
select teacher.name , count ( * ) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.teacher_id
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.teacher_id having count ( * ) >= 2
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by teacher.teacher_id having count ( * ) >= 2
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select count ( * ) from visitor where age < 30
select count ( * ) from visitor where age < 30
select avg ( age ) from visitor where level_of_membership <= 4
select name , level_of_membership from visitor where level_of_membership > 4 order by age desc
select m.museum_id , m.name from museum m where m.num_of_staff = ( select max ( num_of_staff ) from museum )
select avg ( num_of_staff ) from museum where open_year < 2009
select open_year , num_of_staff from museum where name = 'Plaza Museum'
select name from museum where num_of_staff > ( select min ( num_of_staff ) from museum where open_year > 2010 )
select visitor.id , visitor.name , visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visitor.id having count ( * ) > 1
select v.id , v.name , v.level_of_membership from visitor v join visit v on v.visitor_id = v.visitor_id where v.total_spent = ( select max ( total_spent ) from visit )
select museum.museum_id , museum.name from museum join visit on museum.museum_id = visit.museum_id group by museum.museum_id order by count ( * ) desc limit 1
select name from museum where museum_id not in ( select museum_id from visit )
select v.name , v.age from visitor v join visit v on v.id = v.visitor_id group by v.id having sum ( v.num_of_ticket ) = ( select max ( total_ticket ) from ( select sum ( num_of_ticket ) as total_ticket from visit group by visitor_id ) )
select avg ( num_of_ticket ) , max ( num_of_ticket ) from visit
select sum ( total_spent ) from visitor join visit on visitor.id = visit.visitor_id where visitor.level_of_membership = 1
select visitor.name from museum join visit on museum.museum_id = visit.museum_id join visitor on visit.visitor_id = visitor.id where museum.open_year < 2009 intersect select visitor.name from museum join visit on museum.museum_id = visit.museum_id join visitor on visit.visitor_id = visitor.id where museum.open_year > 2011
select count ( * ) from visitor where id not in ( select visit.visitor_id from visit join museum on visit.museum_id = museum.museum_id where museum.open_year > 2010 )
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
select max ( loser_rank ) from matches
select max ( loser_rank ) from matches
select count ( distinct country_code ) from players
select count ( distinct country_code ) from players
select count ( distinct loser_name ) from matches
select count ( distinct loser_name ) from matches
select tourney_name from matches group by tourney_name having count ( * ) > 10
select tourney_name from matches group by tourney_name having count ( * ) > 10
select matches.winner_name from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id where qualifying_matches.year = 2013 intersect select matches.winner_name from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id where qualifying_matches.year = 2016
select first_name , last_name from players where player_id in ( select winner_id from matches where year = 2013 intersect select winner_id from matches where year = 2016 )
select count ( * ) from matches where year = 2013 or year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select first_name , country_code from players where birth_date = ( select min ( birth_date ) from players )
select first_name , country_code from players where birth_date = ( select min ( birth_date ) from players )
select first_name , last_name from players order by birth_date asc , last_name , player_id
select first_name , last_name from players order by birth_date asc , last_name , player_id
select first_name , last_name from players where hand = 'left' order by birth_date asc
select first_name , last_name from players where hand = 'left' order by birth_date asc
select p.first_name , p.country_code from players p join rankings r on p.player_id = r.player_id group by p.player_id having count ( r.tours ) = ( select max ( cnt ) from ( select count ( tours ) as cnt from rankings group by player_id ) )
select players.first_name , players.country_code from players join rankings on players.player_id = rankings.player_id group by rankings.player_id order by count ( * ) desc limit 1
select year from matches group by year having count ( year ) = ( select max ( cnt ) from ( select count ( * ) as cnt from matches group by year ) )
select year from matches group by year having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from matches group by year ) )
select players.first_name , players.last_name , sum ( matches.winner_rank_points ) from matches join players on matches.winner_id = players.player_id group by matches.winner_id having count ( * ) = ( select max ( win_count ) from ( select count ( * ) as win_count from matches group by winner_id ) )
select players.first_name , players.last_name , sum ( matches.winner_rank_points ) from matches join players on matches.winner_id = players.player_id group by matches.winner_id order by count ( * ) desc limit 1
select players.first_name , players.last_name from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'Australian Open' and matches.winner_rank_points = ( select max ( winner_rank_points ) from qualifying_matches join players on qualifying_matches.winner_id = players.player_id where qualifying_matches.tourney_name = 'Australian Open' )
select first_name , last_name from players where player_id in ( select matches.winner_id from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id where qualifying_matches.tourney_name = 'Australian Open' )
select winner_name , loser_name from matches where minutes = ( select max ( minutes ) from matches )
select players.first_name , players.last_name from matches join players on matches.winner_id = players.player_id join qualifying_matches on matches.loser_id = qualifying_matches.loser_id order by matches.loser_ht desc limit 1
select players.first_name , players.player_id , avg ( rankings.ranking ) from players join rankings on players.player_id = rankings.player_id group by players.player_id
select players.first_name , players.player_id , avg ( rankings.ranking_points ) from players join rankings on players.player_id = rankings.player_id group by players.player_id
select sum ( ranking_points ) , players.first_name , players.player_id from rankings join players on rankings.player_id = players.player_id group by players.player_id
select players.first_name , sum ( rankings.ranking_points ) from players join rankings on players.player_id = rankings.player_id where rankings.ranking_points = 'null'
select country_code , count ( * ) from players group by country_code
select country_code , count ( * ) from players group by country_code
select country_code from players group by country_code having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from players group by country_code ) )
select country_code from players group by country_code having count ( player_id ) = ( select max ( count ) from ( select count ( player_id ) as count from players group by country_code ) )
select country_code from players group by country_code having count ( * ) > 50
select country_code from players group by country_code having count ( * ) > 50
select ranking_date , sum ( tours ) from rankings group by ranking_date
select ranking_date , sum ( tours ) from rankings group by ranking_date
select year , count ( * ) from matches group by year
select year , count ( * ) from matches group by year
select matches.winner_name , matches.winner_rank from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id order by qualifying_matches.winner_age desc limit 3
select matches.winner_name , matches.winner_rank from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id order by qualifying_matches.winner_age desc limit 3
select count ( distinct matches.winner_id ) from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'WTA Championships' and players.hand = 'left'
select count ( distinct matches.winner_id ) from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'WTA Championships' and players.hand = 'left'
select players.first_name , players.country_code , players.birth_date from matches join players on matches.winner_id = players.player_id order by matches.winner_rank_points desc limit 1
select players.first_name , players.country_code , players.birth_date from players join matches on players.player_id = matches.winner_id group by matches.winner_id order by sum ( matches.winner_rank_points ) desc limit 1
select hand , count ( * ) from players group by hand
select hand , count ( * ) from players group by hand
select count ( * ) from ship where ship_type = 'Captured'
select count ( * ) from ship where ship_type = 'Captured'
select name , date , result from battle
select max ( killed ) , min ( killed ) from death
select avg ( injured ) from death
select death.injured , death.killed from death join ship on death.caused_by_ship_id = ship.id where ship.tonnage = 't'
select name , result from battle where bulgarian_commander != 'Boril'
select distinct battle.id , battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = 'Brig'
select battle.id , battle.name from death join battle on death.caused_by_ship_id = battle.id group by battle.id having sum ( death.killed ) > 10
select s.id , s.name from ship s , death d where s.id = d.caused_by_ship_id group by s.id having sum ( d.injured ) = ( select max ( total ) from ( select sum ( injured ) as total from death group by caused_by_ship_id ) )
select distinct name from battle where bulgarian_commander = 'Kaloyan' and latin_commander = 'Baldwin I'
select count ( distinct result ) from battle
select count ( * ) from battle where id not in ( select lost_in_battle from ship where tonnage = '225' )
select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'Lettice' intersect select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'HMS Atalanta'
select name , result , bulgarian_commander from battle where id not in ( select lost_in_battle from ship where location = 'English Channel' )
select note from death where note like '%East%'
select * from addresses where line_1 = 1 and line_2 = 2
select line_1 , line_2 from addresses
select count ( * ) from courses
select count ( * ) from courses
select course_description from courses where course_name = 'Math'
select course_description from courses where course_name like '%Math%'
select zip_postcode from addresses where city = 'Port Chelsea'
select zip_postcode from addresses where city = 'Port Chelsea'
select d.department_name , d.department_id from departments d , degree_programs dp where d.department_id = dp.department_id group by d.department_id having count ( dp.degree_program_id ) = ( select max ( counts ) from ( select count ( degree_program_id ) as counts from degree_programs group by department_id ) )
select d.department_name , d.department_id from departments d where exists ( select 1 from degree_programs dp where dp.department_id = d.department_id group by dp.department_id having count ( dp.degree_program_id ) = ( select max ( total ) from ( select count ( * ) as total from degree_programs group by department_id ) t ) )
select count ( distinct department_id ) from degree_programs
select count ( distinct department_id ) from degree_programs
select count ( distinct degree_summary_name ) from degree_programs
select count ( distinct degree_program_id ) from degree_programs
select count ( * ) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = 'Engineering'
select count ( * ) from degree_programs join departments on degree_programs.department_id = departments.department_id where departments.department_name = 'Engineering'
select section_name , section_description from sections
select section_name , section_description from sections
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) <= 2
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) < 2
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) < 2
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) < 2
select semesters.semester_name , semesters.semester_id from semesters join ( select semester_id from student_enrolment group by semester_id having count ( student_id ) = ( select max ( cnt ) from ( select count ( student_id ) as cnt from student_enrolment group by semester_id ) ) ) as max_registration on semesters.semester_id = max_registration.semester_id
select semesters.semester_name , semesters.semester_id from semesters join ( select semester_id from student_enrolment group by semester_id having count ( student_id ) = ( select max ( cnt ) from ( select count ( student_id ) as cnt from student_enrolment group by semester_id ) ) ) as max_registration on semesters.semester_id = max_registration.semester_id
select department_description from departments where department_name like '%thecomputer%'
select department_description from departments where department_name like '%computer%'
select students.first_name , students.middle_name , students.last_name , student_enrolment.semester_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.semester_id having count ( distinct degree_program_id ) = 2
select s.first_name , s.middle_name , s.last_name , s.student_id from students s join student_enrolment se on s.student_id = se.student_id group by s.student_id having count ( distinct se.degree_program_id ) = 2
select first_name , middle_name , last_name from students where student_id in ( select student_id from student_enrolment where degree_program_id = 'Bachelor' )
select students.first_name , students.middle_name , students.last_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id join students on student_enrolment.student_id = students.student_id where degree_programs.degree_summary_name = 'Bachelors'
select degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_program_id order by count ( * ) desc limit 1
select degree_summary_name from degree_programs where degree_program_id in ( select degree_program_id from student_enrolment group by degree_program_id having count ( student_enrolment_id ) = ( select max ( cnt ) from ( select count ( student_enrolment_id ) as cnt from student_enrolment group by degree_program_id ) ) )
select degree_program_id , degree_summary_name from degree_programs where degree_program_id in ( select degree_program_id from student_enrolment group by degree_program_id having count ( student_enrolment_id ) = ( select max ( cnt ) from ( select count ( student_enrolment_id ) as cnt from student_enrolment group by degree_program_id ) ) )
select degree_program_id , degree_summary_name from degree_programs where degree_program_id in ( select degree_program_id from student_enrolment group by degree_program_id having count ( student_id ) = ( select max ( cnt ) from ( select count ( student_id ) as cnt from student_enrolment group by degree_program_id ) ) )
select s.student_id , s.first_name , s.middle_name , s.last_name , count ( se.student_enrolment_id ) as total from students s join student_enrolment se on s.student_id = se.student_id group by s.student_id , s.first_name , s.last_name
select s.student_id , s.first_name , s.middle_name , s.last_name , count ( se.student_enrolment_id ) as total from students s join student_enrolment se on s.student_id = se.student_id group by s.student_id , s.first_name , s.last_name
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select distinct courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select course_name from courses where course_id in ( select course_id from student_enrolment_courses )
select course_name from courses where course_id in ( select course_id from student_enrolment_courses group by course_id having count ( student_enrolment_id ) = ( select max ( cnt ) from ( select count ( student_enrolment_id ) as cnt from student_enrolment_courses group by course_id ) ) )
select course_name from courses where course_id in ( select course_id from student_enrolment_courses group by course_id having count ( student_enrolment_id ) = ( select max ( cnt ) from ( select count ( student_enrolment_id ) as cnt from student_enrolment_courses group by course_id ) ) )
select last_name from students where student_id in ( select student_id from student_enrolment where degree_program_id in ( select degree_program_id from addresses where state_province_county = 'North Carolina' ) ) and student_id not in ( select student_id from student_enrolment where degree_program_id in ( select degree_program_id from student_enrolment ) )
select last_name from students where student_id in ( select student_id from student_enrolment where degree_program_id in ( select degree_program_id from addresses where state_province_county = 'North Carolina' ) ) and student_id not in ( select student_id from student_enrolment where degree_program_id in ( select degree_program_id from student_enrolment ) )
select transcripts.transcript_date , transcript_contents.transcript_id from transcript_contents join transcripts on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count ( * ) >= 2
select transcripts.transcript_date , transcript_contents.transcript_id from transcript_contents join transcripts on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count ( * ) >= 2
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
select first_name , middle_name , last_name from students order by date_first_registered asc limit 1
select first_name , middle_name , last_name from students order by date_first_registered asc limit 1
select first_name , middle_name , last_name from students order by date_left asc limit 1
select s.first_name , s.middle_name , s.last_name from students s where s.student_id in ( select student_id from student_enrolment group by student_id having min ( student_id ) = ( select min ( student_id ) from students where student_id = s.student_id ) ) order by s.student_id asc limit 1
select first_name from students where permanent_address_id != current_address_id
select first_name from students where permanent_address_id != current_address_id
select addresses.address_id , addresses.line_2 , addresses.line_3 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count ( * ) desc limit 1
select addresses.address_id , addresses.line_1 , addresses.line_2 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count ( * ) asc limit 1
select avg ( transcript_date ) from transcripts
select avg ( transcript_date - transcript_date ) from transcripts
select transcript_date , other_details from transcripts order by transcript_date asc limit 1
select transcript_date , other_details from transcripts where transcript_date = ( select min ( transcript_date ) from transcripts )
select count ( * ) from transcripts
select count ( * ) from transcripts
select max ( transcript_date ) from transcripts
select max ( transcript_date ) from transcripts
select count ( distinct student_enrolment_id ) , student_enrolment_courses.course_id from student_enrolment_courses join transcript_contents on student_enrolment_courses.student_enrolment_id = transcript_contents.transcript_id group by student_enrolment_courses.student_enrolment_id having count ( distinct transcript_id ) <= 1
select courses.course_name , student_enrolment_courses.student_enrolment_id from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.student_course_id join transcript_contents on transcript_contents.transcript_id = transcript_contents.transcript_id group by courses.course_id order by count ( * ) desc limit 1
select transcripts.transcript_date , transcript_contents.transcript_id from transcript_contents join transcripts on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id order by count ( * ) asc limit 1
select t.transcript_date , t.transcript_id from transcripts t inner join ( select transcript_id from transcript_contents group by transcript_id having count ( transcript_id ) = ( select min ( cnt ) from ( select count ( transcript_id ) as cnt from transcript_contents group by transcript_id ) ) ) tc on t.transcript_id = tc.transcript_id
select t.transcript_date , t.transcript_id from transcripts t inner join ( select transcript_id from transcript_contents group by transcript_id having count ( transcript_id ) = ( select min ( cnt ) from ( select count ( transcript_id ) as cnt from transcript_contents group by transcript_id ) ) ) tc on t.transcript_id = tc.transcript_id
select t.transcript_date , t.transcript_id from transcripts t inner join ( select transcript_id from transcript_contents group by transcript_id having count ( transcript_id ) = ( select min ( cnt ) from ( select count ( transcript_id ) as cnt from transcript_contents group by transcript_id ) ) ) tc on t.transcript_id = tc.transcript_id
select count ( distinct addresses.address_id ) from addresses join students on addresses.address_id = students.current_address_id
select distinct addresses.address_id from addresses join students on addresses.address_id = students.current_address_id
select distinct addresses.address_id from addresses join students on addresses.address_id = students.current_address_id
select distinct addresses.address_id from addresses join students on addresses.address_id = students.current_address_id
select section_description from sections where section_name = 'H'
select section_description from sections where section_name = 'h'
select first_name from students where permanent_address_id in ( select address_id from addresses where country = 'Haiti' ) or cell_mobile_number = 09700166582
select first_name from students where permanent_address_id in ( select address_id from addresses where country = 'Haiti' ) or cell_mobile_number = 09700166582
select first_name from students where permanent_address_id in ( select address_id from addresses where country = 'Haiti' ) or cell_mobile_number = 09700166582
select first_name from students where permanent_address_id in ( select address_id from addresses where country = 'Haiti' ) or cell_mobile_number = 09700166582
select * from cartoon where directed_by = 'Ben Jones'
select title from cartoon where directed_by = 'Ben Jones'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select title , directed_by from cartoon order by original_air_date asc , id
select title , directed_by from cartoon order by original_air_date asc , id
select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
select title from cartoon where directed_by = 'Ben Jones' or directed_by = 'Brandon Vietti'
select country , count ( * ) from tv_channel group by country having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from tv_channel group by country ) )
select country , count ( * ) from tv_channel group by country having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from tv_channel group by country ) )
select count ( distinct series_name ) , count ( distinct content ) from tv_channel
select count ( distinct series_name ) , count ( distinct content ) from tv_channel
select content from tv_channel where series_name = 'Sky Radio'
select content from tv_channel where series_name = 'Sky Radio'
select package_option from tv_channel where series_name = 'Sky Radio'
select package_option from tv_channel where series_name = 'Sky Radio'
select count ( * ) from tv_channel where language = 'english'
select count ( * ) from tv_channel where language = 'english'
select language , count ( * ) from tv_channel group by language having count ( * ) = ( select min ( count ) from ( select count ( * ) as count from tv_channel group by language ) )
with countedlanguages as ( select language , count ( * ) as cnt from tv_channel group by language ) select language , cnt from countedlanguages where cnt = ( select min ( cnt ) from countedlanguages )
select language , count ( * ) from tv_channel group by language
select language , count ( * ) from tv_channel group by language
select series_name from tv_channel where id in ( select channel from cartoon where title = 'The Rise of the Blue Beetle!' )
select series_name from tv_channel where id in ( select channel from cartoon where title = 'The Rise of the Blue Beetle' )
select cartoon.title from tv_series join cartoon on tv_series.channel = cartoon.channel join tv_channel on tv_series.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select cartoon.title from tv_series join cartoon on tv_series.channel = cartoon.channel join tv_channel on tv_series.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select cartoon.title from tv_series join cartoon on tv_series.channel = cartoon.channel join tv_channel on tv_series.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select episode from tv_series order by rating asc , id
select episode , rating from tv_series order by rating desc limit 3
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
select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select directed_by , count ( * ) from cartoon group by directed_by
select directed_by , count ( * ) from cartoon group by directed_by
select production_code , channel from cartoon where original_air_date = ( select max ( original_air_date ) from cartoon )
select c.production_code , c.channel from cartoon as c where c.original_air_date = ( select max ( original_air_date ) from cartoon )
select package_option , series_name from tv_channel where hight_definition_tv = 'Yes'
select package_option , series_name from tv_channel where hight_definition_tv = 'Yes'
select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select country from tv_channel where id not in ( select channel from cartoon where written_by = 'Todd Casey' )
select distinct tv_channel.country from tv_channel where tv_channel.id not in ( select tv_series.channel from tv_series join cartoon on tv_series.id = cartoon.channel where cartoon.written_by = 'Todd Casey' )
select series_name , country from tv_channel where id in ( select channel from cartoon where directed_by = 'Ben Jones' intersect select channel from cartoon where directed_by = 'Michael Chang' )
select series_name , country from tv_channel where id in ( select channel from cartoon where directed_by = 'Ben Jones' intersect select channel from cartoon where directed_by = 'Michael Chang' )
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select package_option from tv_channel where id not in ( select channel from cartoon where directed_by = 'Ben Jones' )
select package_option from tv_channel where id not in ( select channel from cartoon where directed_by = 'Ben Jones' )
select count ( * ) from poker_player
select count ( * ) from poker_player
select count ( * ) from poker_player
select count ( * ) from poker_player
select final_table_made , best_finish from poker_player
select final_table_made , best_finish from poker_player
select avg ( earnings ) from poker_player
select avg ( earnings ) from poker_player
select p.money_rank from poker_player p where p.earnings = ( select max ( earnings ) from poker_player )
select money_rank from ( select money_rank , max ( earnings ) as max_earnings from poker_player group by money_rank ) where max_earnings = ( select max ( earnings ) from poker_player )
select max ( final_table_made ) from poker_player where earnings < 200000
select max ( final_table_made ) from poker_player where earnings < 200000
select people.name from poker_player join people on poker_player.people_id = people.people_id
select people.name from poker_player join people on poker_player.people_id = people.people_id
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
select people.name from poker_player join people on poker_player.people_id = people.people_id where poker_player.earnings > 300000
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , poker_player.earnings
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , poker_player.earnings
select birth_date from people where people_id in ( select people_id from poker_player where earnings = ( select min ( earnings ) from poker_player ) )
select p.birth_date from people p inner join poker_player pp on p.people_id = pp.people_id where pp.earnings = ( select min ( earnings ) from poker_player )
select poker_player.money_rank from poker_player join people on poker_player.people_id = people.people_id where people.height = ( select max ( height ) from people )
select poker_player.money_rank from poker_player join people on poker_player.people_id = people.people_id where people.height = ( select max ( height ) from people )
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc , people.name
select nationality , count ( * ) from people group by nationality
select nationality , count ( * ) from people group by nationality
select nationality from people group by nationality having count ( nationality ) = ( select max ( count ) from ( select count ( nationality ) as count from people group by nationality ) )
select nationality from people group by nationality having count ( nationality ) = ( select max ( count ) from ( select count ( nationality ) as count from people group by nationality ) )
select nationality from people group by nationality having count ( * ) >= 2
select nationality from people group by nationality having count ( * ) >= 2
select nationality from people group by nationality having count ( * ) >= 2
select nationality from people group by nationality having count ( * ) >= 2
select name from people where nationality != 'Russia'
select name from people where nationality != 'Russia'
select name from people where people_id not in ( select people_id from poker_player )
select name from people where people_id not in ( select people_id from poker_player )
select count ( distinct nationality ) from people
select count ( distinct nationality ) from people
select count ( distinct state ) from area_code_state
select count ( distinct state ) from area_code_state
select vote_id , phone_number , state from votes
select max ( area_code ) , min ( area_code ) from area_code_state
select created from votes where state = 'CA' order by created desc limit 1
select contestant_name from contestants where contestant_name != 'Jessie Alloway'
select distinct state , created from votes
select contestants.contestant_number , contestants.contestant_name from votes join contestants on votes.contestant_number = contestants.contestant_number group by votes.contestant_number having count ( * ) >= 2
select c.contestant_number , c.contestant_name from contestants c where c.contestant_number in ( select contestant_number from votes group by contestant_number having count ( vote_id ) = ( select min ( c2.vote_count ) from ( select count ( vote_id ) as vote_count from votes group by contestant_number ) c2 ) )
select count ( * ) from votes where state = 'NY' or state = 'CA'
select count ( * ) from contestants where contestant_number not in ( select contestant_number from votes )
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state group by votes.state having count ( votes.vote_id ) = 1
select votes.created , votes.state , votes.phone_number from votes join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling'
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling' intersect select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Kelly Clauss'
select contestant_name from contestants where contestant_name like '%Al%'
select name from country where indepyear > 1950
select name from country where indepyear > 1950
select count ( * ) from country where governmentform = 'Republic'
select count ( * ) from country where governmentform = 'Republic'
select sum ( surfacearea ) from country where region = 'Caribbean'
select sum ( surfacearea ) from country where region = 'Carribean'
select continent from country where name = 'Anguilla'
select continent from country where name = 'Anguilla'
select country.region from city join country on city.countrycode = country.code where city.name = 'Kabul'
select region from country where capital = 'Kabul'
select language from countrylanguage where countrycode = ( select code from country where name = 'Aruba' group by code order by count ( * ) desc limit 1 )
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.name = 'Aruba'
select population , lifeexpectancy from country where name = 'Brazil'
select population , lifeexpectancy from country where name = 'Brazil'
select region , population from country where name = 'Angola'
select region , population from country where name = 'Angola'
select avg ( lifeexpectancy ) from country where region = 'Central Africa'
select avg ( lifeexpectancy ) from country where continent = 'Central Africa'
select c.name from country c where c.lifeexpectancy = ( select min ( lifeexpectancy ) from country where region = 'Asia' )
select name from country where continent = 'Asia' and lifeexpectancy = ( select min ( lifeexpectancy ) from country where continent = 'Asia' )
select total ( population ) , max ( gnp ) from country where continent = 'Asia'
select sum ( population ) , max ( gnp ) from country where continent = 'Asia'
select avg ( lifeexpectancy ) from country where continent = 'Africa' and governmentform = 'Republic'
select avg ( lifeexpectancy ) from country where continent = 'Africa' and governmentform = 'Republic'
select sum ( surfacearea ) from country where continent = 'Asia' or continent = 'Europe'
select sum ( surfacearea ) from country where continent = 'Asia' or continent = 'Europe'
select ( population ) from city where district = 'Gelderland'
select sum ( city.population ) from city join country on city.countrycode = country.code where city.district = 'Gelderland'
select avg ( gnp ) , sum ( population ) from country where governmentform = 'United States'
select avg ( gnp ) , sum ( population ) from country where continent = 'North America'
select count ( distinct language ) from countrylanguage
select count ( distinct language ) from countrylanguage
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Aruba'
select count ( * ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Aruba'
select count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select name from country where code in ( select countrycode from countrylanguage group by countrycode having count ( language ) = ( select max ( cnt ) from ( select count ( language ) as cnt from countrylanguage group by countrycode ) ) )
select name from country where code in ( select countrycode from countrylanguage group by countrycode having count ( percentage ) = ( select max ( cnt ) from ( select count ( * ) as cnt from countrylanguage group by countrycode ) ) )
select country.continent from country join countrylanguage on country.code = countrylanguage.countrycode group by country.continent order by count ( * ) desc limit 1
select country.continent from country join countrylanguage on country.code = countrylanguage.countrycode group by country.continent order by count ( * ) desc limit 1
select count ( * ) from ( select countrycode from countrylanguage where language = 'english' intersect select countrycode from countrylanguage where language = 'dutch' )
select count ( distinct countrycode ) from countrylanguage where language = 'English' or language = 'Dutch'
select name from country where code in ( select countrycode from countrylanguage where language = 'english' intersect select countrycode from countrylanguage where language = 'french' )
select c.name from country c where exists ( select 1 from countrylanguage cl where cl.countrycode = c.code and cl.language = 'English' ) and exists ( select 1 from countrylanguage cl where cl.countrycode = c.code and cl.language = 'French' )
select name from country where code in ( select countrycode from countrylanguage where language = 'english' intersect select countrycode from countrylanguage where language = 'french' )
select name from country where code in ( select countrycode from countrylanguage where isofficial = 'English' intersect select countrycode from countrylanguage where isofficial = 'French' )
select count ( distinct country.continent ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Chinese'
select count ( distinct country.continent ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Chinese'
select distinct country.region from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'english' or countrylanguage.language = 'dutch'
select distinct country.region from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Dutch' or countrylanguage.language = 'English'
select distinct country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.isofficial = 'English' or countrylanguage.isofficial = 'Dutch'
select distinct country.name from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'english' or countrylanguage.language = 'dutch'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Asia' group by countrylanguage.language order by sum ( percentage ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Asia' group by countrylanguage.language order by count ( * ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'Republic' group by countrylanguage.language having count ( * ) = 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'Republic' group by countrylanguage.language having count ( * ) = 1
select city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'english' group by city.countrycode order by city.population desc limit 1
select city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'english' and city.population = ( select max ( population ) from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'english' )
select name , population , lifeexpectancy from country where continent = 'Asia' and surfacearea = ( select max ( surfacearea ) from country where continent = 'Asia' )
select name , population , lifeexpectancy from country where continent = 'Asia' and surfacearea = ( select max ( surfacearea ) from country where continent = 'Asia' )
select avg ( country.lifeexpectancy ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language != 'english'
select avg ( lifeexpectancy ) from country where code in ( select countrycode from countrylanguage where language = 'english' )
select sum ( country.population ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language != 'english'
select sum ( country.population ) from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language != 'english'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.headofstate = 'Beatrix'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.headofstate = 'Beatrix'
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select country.name from country where country.continent = 'Africa' and country.population < ( select min ( population ) from country where continent = 'Asia' )
select country.name from country where country.continent = 'Africa' and country.population < ( select min ( population ) from country where continent = 'Asia' )
select name from country where continent = 'Asia' and population > ( select max ( population ) from country where continent = 'Africa' )
select name from country where continent = 'Asia' and population > ( select max ( population ) from country where continent = 'Africa' )
select countrycode from countrylanguage where language != 'english'
select countrycode from countrylanguage where language != 'english'
select countrycode from countrylanguage where language != 'english'
select distinct countrycode from countrylanguage where language != 'english'
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language != 'english' and country.governmentform != 'Republic'
select countrylanguage.countrycode from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language != 'english' and country.governmentform != 'Republic'
select name from city where countrycode in ( select countrycode from countrylanguage where language = 'english' )
select name from city where countrycode in ( select countrycode from countrylanguage where language = 'english' )
select name from city where countrycode in ( select countrycode from countrylanguage where language = 'english' )
select name from city where countrycode in ( select countrycode from countrylanguage where language = 'english' )
select name , indepyear , surfacearea from country where population = ( select min ( population ) from country )
select name , indepyear , surfacearea from country where population = ( select min ( population ) from country )
select population , name , headofstate from country where surfacearea = ( select max ( surfacearea ) from country )
select name , population , headofstate from country where surfacearea = ( select max ( surfacearea ) from country )
select country.name , count ( distinct countrylanguage.language ) from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.countrycode having count ( distinct countrylanguage.language ) >= 3
select country.name , count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode group by countrylanguage.countrycode having count ( * ) > 2
select count ( * ) , district from city where population > ( select avg ( population ) from city ) group by district
select count ( * ) , district from city where population > ( select avg ( population ) from city ) group by district
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) > 72
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) > 72
select avg ( lifeexpectancy ) , sum ( population ) , continent from country group by continent having avg ( lifeexpectancy ) < 72
select continent , sum ( population ) , avg ( lifeexpectancy ) from country group by continent having avg ( lifeexpectancy ) < 72
select name , surfacearea from country order by surfacearea asc , code
select name , surfacearea from country order by surfacearea desc , population asc
select name from country order by population desc , name asc
select name from country order by population desc , name asc
select name from country order by population desc , name asc
select name from country order by population desc , name asc
select count ( * ) from country where continent = 'Asia'
select count ( * ) from country where continent = 'Asia'
select name from country where continent = 'Europe' and population = 80000
select name from country where continent = 'Europe' and population = 80000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select name from city where population between 160000 and 900000
select name from city where population between 160000 and 900000
select language from ( select language , count ( countrycode ) as num_countrycodes from countrylanguage group by language ) where num_countrycodes = ( select max ( num_countrycodes ) from ( select count ( countrycode ) as num_countrycodes from countrylanguage group by language ) )
select language from ( select language , count ( countrycode ) as num_countrycodes from countrylanguage group by language ) where num_countrycodes = ( select max ( num_countrycodes ) from ( select count ( countrycode ) as num_countrycodes from countrylanguage group by language ) )
select countrylanguage.language , country.code , country.name from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.countrycode having sum ( percentage ) = ( select max ( percentage ) from ( select sum ( percentage ) as percentage from countrylanguage group by countrycode ) )
select countrylanguage.countrycode , countrylanguage.language from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.countrycode
select count ( distinct cl.countrycode ) from countrylanguage cl where cl.language = 'Spanish' and cl.percentage = ( select max ( percentage ) from countrylanguage where language = 'Spanish' )
select count ( distinct countrycode ) from countrylanguage where language = 'Spanish'
select country.code from countrylanguage join country on countrylanguage.countrycode = country.code where countrylanguage.language = 'Spanish' and countrylanguage.percentage = ( select max ( percentage ) from countrylanguage )
select countrycode from countrylanguage where language = 'Spanish'
select count ( * ) from conductor
select count ( * ) from conductor
select name from conductor order by age asc , conductor_id
select name from conductor order by age asc , conductor_id
select name from conductor where nationality != 'USA'
select name from conductor where nationality != 'USA'
select name from conductor where nationality != 'USA'
select name from conductor where nationality != 'USA'
select avg ( attendance ) from show
select avg ( attendance ) from show
select max ( share ) , min ( share ) from performance where type != 'Live final'
select max ( share ) , min ( share ) from performance where type != 'Live final'
select count ( distinct nationality ) from conductor
select count ( distinct nationality ) from conductor
select count ( distinct nationality ) from conductor
select count ( distinct nationality ) from conductor
select name from conductor where year_of_work = ( select max ( year_of_work ) from conductor )
select name from conductor where year_of_work = ( select max ( year_of_work ) from conductor )
select conductor.name , orchestra.orchestra from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id
select conductor.name , orchestra.orchestra from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id having count ( * ) > 1
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id group by conductor.conductor_id having count ( * ) > 1
select conductor.name from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id join conductor on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from performance join orchestra on performance.orchestra_id = orchestra.orchestra_id join conductor on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008 group by conductor.conductor_id
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
select record_company , count ( * ) from orchestra group by record_company
select record_company , count ( * ) from orchestra group by record_company
select record_company , count ( * ) from orchestra group by record_company
select major_record_format from orchestra group by major_record_format order by count ( * ) asc , major_record_format
select record_company from orchestra group by record_company having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from orchestra group by record_company ) )
select record_company from orchestra group by record_company having count ( orchestra_id ) = ( select max ( cnt ) from ( select count ( orchestra_id ) as cnt from orchestra group by record_company ) )
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select record_company from orchestra where year_of_founded <= 2003 intersect select record_company from orchestra where year_of_founded > 2003
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select distinct o.year_of_founded from orchestra o join performance p on o.orchestra_id = p.orchestra_id group by o.orchestra_id having count ( distinct p.performance_id ) > 1
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
select grade from highschooler group by grade having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from highschooler group by grade ) )
select grade from highschooler group by grade having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from highschooler group by grade ) )
select grade from highschooler group by grade having count ( * ) >= 4
select grade from highschooler group by grade having count ( * ) >= 4
select hs.id , count ( f.friend_id ) as total_friends from highschooler hs left join friend f on hs.id = f.student_id group by hs.id
select count ( * ) , highschooler.id from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id
select highschooler.name , count ( friend.friend_id ) from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id
select highschooler.name , count ( friend.friend_id ) from highschooler left join friend on highschooler.id = friend.student_id group by highschooler.id having count ( friend.friend_id ) = ( select max ( friend_count ) from ( select count ( friend_id ) as friend_count from friend group by student_id ) )
select name from ( select highschooler.name , count ( friend_id ) as num_friends from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id ) where num_friends = ( select max ( num_friends ) from ( select count ( friend_id ) as num_friends from friend group by student_id ) )
select name from highschooler inner join ( select student_id , count ( friend_id ) as num_friends from friend group by student_id ) as temp on highschooler.id = temp.student_id where num_friends = ( select max ( num_friends ) from ( select count ( friend_id ) as num_friends from friend group by student_id ) )
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count ( * ) >= 3
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count ( * ) >= 3
select friend.friend_id , highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select friend.friend_id , highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select highschooler.id , count ( friend.friend_id ) as num_friends from highschooler left join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by highschooler.id
select highschooler.id , count ( friend.friend_id ) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by highschooler.id
select id from highschooler except select student_id from friend
select id from highschooler except select student_id from friend
select name from highschooler where id not in ( select student_id from friend )
select name from highschooler where id not in ( select student_id from friend )
select id from highschooler where id in ( select student_id from friend where friend_id = highschooler.id ) and id in ( select student_id from likes where liked_id = highschooler.id )
select student_id from friend where friend_id in ( select student_id from likes ) and student_id in ( select student_id from likes )
select name from highschooler where id in ( select student_id from friend ) and id in ( select liked_id from likes )
select name from highschooler where id in ( select student_id from friend ) and id in ( select student_id from likes )
select count ( * ) , student_id from likes group by student_id
select count ( * ) , count ( * ) , student_id from likes group by student_id
select highschooler.name , sum ( likes.liked_id ) from likes join highschooler on likes.student_id = highschooler.id group by highschooler.id
select highschooler.name , sum ( likes.liked_id ) from likes join highschooler on likes.student_id = highschooler.id group by highschooler.id
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by highschooler.id order by count ( * ) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by highschooler.id order by count ( * ) desc limit 1
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count ( * ) >= 2
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count ( * ) >= 2
select name from highschooler where grade > 5 and id in ( select student_id from friend group by student_id having count ( friend_id ) >= 2 or count ( friend_id ) >= 2 )
select name from highschooler where grade > 5 and id in ( select friend_id from friend group by friend_id having count ( friend_id ) >= 2 ) and id in ( select friend_id from friend group by friend_id having count ( friend_id ) >= 2 )
select highschooler.id , count ( likes.liked_id ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
select highschooler.id , sum ( likes.liked_id ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
select avg ( grade ) from highschooler where id in ( select student_id from friend ) or id in ( select friend_id from friend )
select avg ( grade ) from highschooler where id in ( select student_id from friend ) or id in ( select friend_id from friend )
select min ( grade ) from highschooler where id not in ( select student_id from friend )
select min ( grade ) from highschooler where id not in ( select student_id from friend where friend_id = highschooler.id )
select state from owners intersect select state from professionals
select state from owners intersect select state from professionals
select avg ( age ) from dogs where dog_id in ( select dog_id from treatments )
select avg ( age ) from dogs where dog_id in ( select dog_id from treatments )
select p.professional_id , p.last_name , p.cell_number from professionals p where p.state = 'Indiana' or p.professional_id in ( select t.professional_id from treatments t group by t.professional_id having count ( t.treatment_id ) > 2 )
select professionals.professional_id , professionals.last_name , professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id where professionals.state = 'Indiana' union select professionals.professional_id , professionals.last_name , professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count ( * ) > 2
select name from dogs where dog_id not in ( select dog_id from treatments group by dog_id having sum ( cost_of_treatment ) > 1000 )
select name from dogs where dog_id not in ( select dog_id from treatments group by dog_id having sum ( cost_of_treatment ) > 1000 )
select first_name from professionals where professional_id in ( select professional_id from owners ) or first_name in ( select name from dogs )
select first_name from professionals where professional_id in ( select professional_id from owners ) or first_name in ( select name from dogs )
select professional_id , role_code , email_address from professionals where professional_id not in ( select professional_id from treatments )
select professional_id , role_code , email_address from professionals where professional_id not in ( select professional_id from treatments )
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id having count ( dogs.dog_id ) = ( select max ( count ) from ( select count ( dog_id ) as count from dogs group by owner_id ) )
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id having count ( dogs.dog_id ) = ( select max ( count ) from ( select count ( dog_id ) as count from dogs group by owner_id ) )
select professionals.professional_id , professionals.role_code , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count ( * ) >= 2
select treatments.professional_id , professionals.role_code , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_code having count ( dogs.dog_id ) = ( select max ( cnt ) from ( select count ( dog_id ) as cnt from dogs group by breed_code ) )
select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_name having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from dogs group by breed_code ) )
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by count ( * ) desc limit 1
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id order by treatments.cost_of_treatment desc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum ( cost_of_treatment ) asc limit 1
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum ( cost_of_treatment ) asc limit 1
select owners.owner_id , owners.zip_code from charges join owners on charges.charge_amount = owners.owner_id group by owners.owner_id order by sum ( charges.charge_amount ) desc limit 1
select owners.owner_id , owners.zip_code from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum ( treatments.cost_of_treatment ) desc limit 1
select professionals.professional_id , professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count ( * ) >= 2
select professionals.professional_id , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by professionals.professional_id having count ( distinct treatments.treatment_type_code ) >= 2
select professionals.first_name , professionals.last_name from treatments join professionals on treatments.professional_id = professionals.professional_id where treatments.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments )
select professionals.first_name , professionals.last_name from professionals where exists ( select 1 from treatments where treatments.professional_id = professionals.professional_id and treatments.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments ) )
select treatments.date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id join sizes on dogs.size_code = sizes.size_code
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id join sizes on dogs.size_code = sizes.size_code
select owners.first_name , dogs.name from dogs join owners on dogs.owner_id = owners.owner_id
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select name , date_of_treatment from dogs join treatments on dogs.dog_id = treatments.dog_id where dogs.breed_code = ( select min ( breed_code ) from dogs )
select name , date_of_treatment from dogs join treatments on dogs.dog_id = treatments.dog_id where dogs.breed_code = ( select min ( breed_code ) from dogs )
select dogs.name , owners.first_name from dogs join owners on dogs.owner_id = owners.owner_id where owners.state = 'Virginia'
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'VA'
select date_arrived , date_departed from dogs where dog_id in ( select dog_id from treatments )
select date_arrived , date_departed from dogs where dog_id in ( select dog_id from treatments )
select distinct owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id where dogs.age = ( select min ( age ) from dogs )
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age asc limit 1
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select date_arrived , date_departed from dogs
select date_arrived , date_departed from dogs
select count ( distinct dog_id ) from treatments
select count ( distinct dog_id ) from treatments
select count ( distinct professional_id ) from treatments
select count ( distinct professional_id ) from treatments
select role_code , street , city , state from professionals where city like '%West%'
select role_code , street , city , state from professionals where city like '%West%'
select first_name , last_name , email_address from owners where state like '%North%'
select first_name , last_name , email_address from owners where state like '%North%'
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select max ( cost_of_treatment ) from treatments where date_of_treatment = ( select max ( date_of_treatment ) from treatments order by date_of_treatment desc limit 1 )
select sum ( cost_of_treatment ) from treatments where date_of_treatment = ( select max ( date_of_treatment ) from treatments )
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
select max ( age ) from dogs
select max ( age ) from dogs
select charge_type , sum ( charge_amount ) from charges group by charge_type
select charge_type , charge_amount from charges
select max ( charge_amount ) from charges
select charge_amount from charges group by charge_type order by sum ( charge_amount ) desc limit 1
select email_address , cell_number , home_phone from professionals
select email_address , cell_number , home_phone from professionals
select email_address , cell_number , home_phone from professionals
select distinct breeds.breed_name , sizes.size_description from breeds join dogs on breeds.breed_code = dogs.breed_code join sizes on dogs.size_code = sizes.size_code
select professionals.first_name , treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select professionals.first_name , treatment_types.treatment_type_description from treatments join professionals on treatments.professional_id = professionals.professional_id join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select count ( * ) from singer
select count ( * ) from singer
select count ( * ) from singer
select count ( * ) from singer
select birth_year , citizenship from singer
select birth_year , citizenship from singer
select name from singer where citizenship != 'France'
select name from singer where citizenship != 'French'
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer where birth_year = 1948 or birth_year = 1949
select s.name from singer s where s.net_worth_millions = ( select max ( net_worth_millions ) from singer )
select s.name from singer s where s.net_worth_millions = ( select max ( net_worth_millions ) from singer ) or s.net_worth_millions = ( select max ( net_worth_millions ) from singer )
select citizenship , count ( * ) from singer group by citizenship
select citizenship , count ( * ) from singer group by citizenship
select citizenship from singer group by citizenship having count ( singer_id ) = ( select max ( count ) from ( select count ( singer_id ) as count from singer group by citizenship ) )
select citizenship , count ( * ) from singer group by citizenship
select citizenship , max ( net_worth_millions ) from singer group by citizenship
select max ( net_worth_millions ) , citizenship from singer group by citizenship
select song.title , singer.name from song join singer on song.singer_id = singer.singer_id
select song.title , singer.name from song join singer on song.singer_id = singer.singer_id
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name , sum ( song.sales ) from singer join song on singer.singer_id = song.singer_id group by singer.singer_id
select singer.name , sum ( song.sales ) from singer join song on singer.singer_id = song.singer_id group by singer.singer_id
select name from singer where singer_id not in ( select singer_id from song )
select name from singer where singer_id not in ( select singer_id from song )
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select count ( * ) from other_available_features
select ref_feature_types.feature_type_name from other_available_features join ref_feature_types on other_available_features.feature_type_code = ref_feature_types.feature_type_code where other_available_features.feature_name = 'AirCon'
select ref_property_types.property_type_description from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code
select property_name from properties where room_count > 1 and property_type_code = 'house' or property_type_code = 'apartment'
