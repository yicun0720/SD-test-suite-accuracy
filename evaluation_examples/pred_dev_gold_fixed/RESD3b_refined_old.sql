select count ( * ) from singer
select count ( * ) from singer
select name , country , age from singer order by age asc , singer_id
select name , country , age from singer order by age desc , singer_id asc
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select avg ( age ) , min ( age ) , max ( age ) from singer where country = 'France'
select song_name , song_release_year from singer order by age asc limit 1
select song_name , song_release_year from singer where age = ( select min ( age ) from singer )
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
select s.name , s.capacity from stadium s where s.average = ( select max ( average ) from stadium ) order by s.lowest asc limit 1
select s.name , s.capacity from stadium s where s.average = ( select max ( average ) from stadium )
select count ( * ) from concert where year = 2014 or year = 2015
select count ( * ) from concert where year in ( 2014 , 2015 )
select stadium.name , count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id group by concert.stadium_id
select stadium.stadium_id , count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id group by stadium.stadium_id
select stadium.name , stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year >= 2014 group by concert.stadium_id order by count ( * ) desc limit 1
select stadium.name , stadium.capacity from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year > 2013 group by concert.stadium_id order by count ( * ) desc limit 1
select year from concert group by year order by count ( * ) desc limit 1
select year from concert group by year order by count ( * ) desc limit 1
select name from stadium where stadium_id not in ( select stadium_id from concert )
select name from stadium where stadium_id not in ( select stadium_id from concert )
select country from singer where age > 40 intersect select country from singer where age < 30
select name from stadium where stadium_id not in ( select stadium_id from concert where year = 2014 )
select name from stadium where stadium_id not in ( select stadium_id from concert where year = 2014 )
select concert.concert_name , concert.theme , count ( * ) from concert join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_id
select concert.concert_name , concert.theme , count ( singer_in_concert.singer_id ) as num_singers from concert left join singer_in_concert on concert.concert_id = singer_in_concert.concert_id group by concert.concert_id
select singer.name , count ( * ) from singer_in_concert join singer on singer_in_concert.singer_id = singer.singer_id group by singer.singer_id
select singer.name , count ( * ) from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id group by singer.singer_id
select distinct singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on singer_in_concert.concert_id = concert.concert_id where concert.year = 2014
select distinct singer.name from singer join singer_in_concert on singer.singer_id = singer_in_concert.singer_id join concert on singer_in_concert.concert_id = concert.concert_id where concert.year = 2014
select name , country from singer where song_name like '%Hey%'
select name , country from singer where song_name like '%Hey%'
select stadium.name , stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014 intersect select stadium.name , stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2015
select stadium.name , stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2014 intersect select stadium.name , stadium.location from concert join stadium on concert.stadium_id = stadium.stadium_id where concert.year = 2015
select count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from concert join stadium on concert.stadium_id = stadium.stadium_id where stadium.capacity = ( select max ( capacity ) from stadium )
select count ( * ) from pets where weight > 10
select count ( * ) from pets where weight > 10
select weight from pets where pet_age = ( select min ( pet_age ) from pets )
select weight from pets where pet_age = ( select min ( pet_age ) from pets )
select max ( weight ) , pettype from pets group by pettype
select max ( weight ) , max ( pettype ) , pettype from pets group by pettype
select count ( distinct pets.petid ) from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.age > 20
select count ( distinct pets.petid ) from pets join has_pet on pets.petid = has_pet.petid join student on student.stuid = has_pet.stuid where student.age > 20
select count ( * ) from pets join has_pet on pets.petid = has_pet.petid join student on has_pet.stuid = student.stuid where student.sex = 'F' and pets.pettype = 'Dog'
select count ( * ) from pets join has_pet on pets.petid = has_pet.petid join student on has_pet.stuid = student.stuid where student.sex = 'F' and pets.pettype = 'Dog'
select count ( distinct pettype ) from pets
select count ( distinct pettype ) from pets
select fname from student where stuid in ( select stuid from has_pet where petid in ( 'petid' ) )
select fname from student where stuid in ( select stuid from has_pet where petid in ( 'petid' ) )
select fname from student where stuid in ( select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' intersect select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Dog' )
select fname from student where stuid in ( select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Cat' intersect select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pettype = 'Dog' )
select major , age from student where stuid not in ( select stuid from has_pet where petid = 'Cat' )
select major , age from student where stuid not in ( select stuid from has_pet where petid = 'Cat' )
select stuid from student except select stuid from has_pet where petid = 'Cat'
select stuid from student except select stuid from has_pet where petid = 'Cat'
select fname , age from student where stuid in ( select stuid from has_pet where petid = 'dog' except select stuid from has_pet where petid = 'cat' )
select fname from student where stuid in ( select stuid from has_pet where petid = 'dog' except select stuid from has_pet where petid = 'cat' )
select pettype , weight from pets where pet_age = ( select min ( pet_age ) from pets )
select pettype , weight from pets where pet_age = ( select min ( pet_age ) from pets )
select petid , weight from pets where pet_age > 1
select petid , weight from pets where pet_age > 1
select pettype , avg ( pet_age ) , max ( pet_age ) from pets group by pettype
select avg ( pet_age ) , max ( pet_age ) , pettype from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select pettype , avg ( weight ) from pets group by pettype
select fname , age from student where stuid in ( select stuid from has_pet )
select distinct student.fname , student.age from student join has_pet on student.stuid = has_pet.stuid
select pets.petid from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where student.lname = 'Smith'
select pets.petid from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where student.lname = 'Smith'
select count ( * ) , stuid from has_pet group by stuid
select stuid , count ( * ) from has_pet group by stuid
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select student.fname , student.sex from student join has_pet on student.stuid = has_pet.stuid group by has_pet.stuid having count ( * ) > 1
select lname from student where stuid in ( select stuid from has_pet join pets on has_pet.petid = pets.petid where pets.pet_age = 3 )
select student.lname from student join has_pet on student.stuid = has_pet.stuid join pets on has_pet.petid = pets.petid where pets.pet_age = 3 and has_pet.stuid = student.stuid
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select avg ( age ) from student where stuid not in ( select stuid from has_pet )
select count ( * ) from continents
select count ( * ) from continents
select continents.contid , continents.continent , count ( * ) from continents join countries on continents.contid = countries.continent group by continents.contid
select continents.contid , countries.continent , count ( * ) from continents join countries on continents.contid = countries.continent group by continents.contid
select count ( * ) from countries
select count ( * ) from countries
select car_makers.fullname , car_makers.id , count ( * ) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select car_makers.fullname , car_makers.id , count ( * ) from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
sql placeholder
select model from model_list where model = ( select min ( horsepower ) from cars_data )
select model_list.model from cars_data join model_list on cars_data.weight < ( select avg ( weight ) from cars_data )
select id from cars_data where weight < ( select avg ( weight ) from cars_data )
select car_makers.fullname from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = 1970
select distinct car_makers.maker from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = 1970
sql placeholder
select car_makers.fullname , cars_data.year from car_makers join cars_data on car_makers.id = cars_data.id where cars_data.year = ( select min ( year ) from cars_data )
select distinct model_list.model from cars_data join model_list on cars_data.id = model_list.maker where cars_data.year > 1980
select distinct car_names.model , cars_data.id from cars_data join car_names on cars_data.id = car_names.makeid where cars_data.year > 1980
select continents.continent , count ( * ) from continents join car_makers on continents.contid = car_makers.country group by continents.continent
select continents.continent , count ( * ) from countries join continents on countries.continent = continents.contid join car_makers on countries.countryid = car_makers.country group by continents.continent
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname order by count ( * ) desc limit 1
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryname order by count ( * ) desc limit 1
select count ( * ) , car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select count ( * ) , car_makers.id , car_makers.fullname from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id
select cars_data.accelerate from car_names join cars_data on car_names.makeid = cars_data.id where car_names.make = 'amc hornet sportabout (sw)'
select accelerate from cars_data join car_names on cars_data.id = car_names.makeid where car_names.make = 'amc hornet sportabout (sw)'
select count ( * ) from car_makers where country = 'France'
select count ( * ) from car_makers where country = 'France'
select count ( * ) from countries join model_list on countries.countryid = model_list.maker where countries.countryname = 'United States'
select count ( * ) from countries join car_makers on countries.countryid = car_makers.country where countries.countryname = 'usa'
select avg ( mpg ) from cars_data where cylinders = 4
select avg ( mpg ) from cars_data where cylinders = 4
select min ( weight ) from cars_data where year = 1974 and cylinders = 8
select min ( weight ) from cars_data where year = 1974 and cylinders = 8
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select car_makers.fullname , model_list.model from car_makers join model_list on car_makers.id = model_list.maker
select countries.countryname , countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 1
select countries.countryname , countries.countryid from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) >= 1
select count ( * ) from cars_data where horsepower > 150
select count ( * ) from cars_data where horsepower > 150
select avg ( weight ) , year from cars_data group by year
select avg ( weight ) , year from cars_data group by year
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where countries.continent = 'Europe' group by countries.countryname having count ( * ) >= 3
select countries.countryname from countries join car_makers on countries.countryid = car_makers.country where car_makers.maker = 'Europe' group by countries.countryid having count ( * ) >= 3
sql placeholder
sql placeholder
select model from model_list where model = ( select max ( mpg ) from cars_data )
select model_list.model from cars_data join model_list on cars_data.id = model_list.model order by cars_data.mpg desc limit 1
select avg ( horsepower ) from cars_data where year < 1980
select avg ( horsepower ) from cars_data where year < 1980
select avg ( cars_data.edispl ) from cars_data join car_names on cars_data.id = car_names.makeid where car_names.model = 'volvo'
sql placeholder
select max ( accelerate ) , cylinders from cars_data group by cylinders
select max ( accelerate ) , cylinders from cars_data group by cylinders
select model_list.model from car_names join model_list on car_names.model = model_list.model group by model_list.model order by count ( distinct car_names.make ) desc limit 1
select model_list.model from car_names join model_list on car_names.model = model_list.model group by model_list.model order by count ( * ) desc limit 1
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where cylinders > 4
select count ( * ) from cars_data where year = 1980
select count ( * ) from cars_data where year = 1980
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = 'American Motor Company'
select count ( * ) from car_makers join model_list on car_makers.id = model_list.maker where car_makers.fullname = 'American Motor Company'
select car_makers.fullname , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select car_makers.fullname , car_makers.id from car_makers join model_list on car_makers.id = model_list.maker group by model_list.maker having count ( * ) > 3
select distinct model_list.model from car_names join model_list on car_names.make = model_list.maker join cars_data on model_list.model = cars_data.id join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'General Motors' or cars_data.weight > 3500
sql placeholder
select year from cars_data where weight between 3000 and 4000
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000
select horsepower from cars_data order by accelerate desc limit 1
select horsepower from cars_data where accelerate = ( select max ( accelerate ) from cars_data ) or horsepower = ( select max ( horsepower ) from cars_data )
sql placeholder
sql placeholder
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data )
select count ( * ) from cars_data where accelerate > ( select max ( accelerate ) from cars_data )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from ( select country from car_makers group by country having count ( * ) > 2 )
select count ( * ) from cars_data where cylinders > 6
select count ( * ) from cars_data where cylinders > 6
select model from model_list where model = ( select max ( horsepower ) from cars_data where cylinders = 4 )
sql placeholder
select car_names.make , cars_data.id from car_names join cars_data on car_names.makeid = cars_data.id where cars_data.horsepower > ( select min ( horsepower ) from cars_data ) and cars_data.cylinders <= 3
sql placeholder
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select max ( mpg ) from cars_data where cylinders = 8 or year < 1980
select model_list.model from cars_data join model_list on cars_data.id = model_list.model join car_makers on model_list.maker = car_makers.id where cars_data.weight < 3500 except select model_list.model from model_list join car_makers on model_list.maker = car_makers.id where car_makers.fullname = 'Ford Motor Company'
sql placeholder
select countryname from countries where countryid not in ( select country from car_makers )
select countryname from countries where countryid not in ( select country from car_makers )
select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) >= 2 intersect select car_makers.id , car_makers.maker from car_makers join model_list on car_makers.id = model_list.maker group by car_makers.id having count ( * ) > 3
select countries.countryid , countries.countryname from countries join car_makers on countries.countryid = car_makers.country group by countries.countryid having count ( * ) > 3 union select countries.countryid , countries.countryname from countries join car_makers on countries.countryid = car_makers.country where car_makers.maker = 'fiat'
sql placeholder
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
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select count ( * ) from flights where destairport = 'ATO'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'ATO'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airports.city = 'Ashley'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen' and airports.airportname = 'Ashley'
select count ( * ) from airlines join flights on airlines.uid = flights.airline where airlines.abbreviation = 'JetBlue Airways'
select count ( * ) from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'Jetblue Airways'
select count ( * ) from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airlines.airline = 'United Airlines' and airports.airportname = 'ASY'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'ASY' and airlines.country = 'United States'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.airportname = 'AHD' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'AHD' and airlines.country = 'United States'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
select count ( * ) from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.city = 'Aberdeen' and airlines.airline = 'United Airlines'
select airports.city from airports join flights on airports.airportcode = flights.sourceairport group by airports.city order by count ( * ) desc limit 1
select airports.city from airports join flights on airports.airportcode = flights.destairport group by airports.city order by count ( * ) desc limit 1
select airports.city from airports join flights on airports.airportcode = flights.destairport group by airports.city order by count ( * ) desc limit 1
select city from airports group by city order by count ( * ) desc limit 1
select airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from flights group by sourceairport ) )
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count ( * ) desc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count ( * ) asc limit 1
select airports.airportcode from airports join flights on airports.airportcode = flights.sourceairport group by airports.airportcode order by count ( * ) asc limit 1
select airlines.airline , airlines.abbreviation from airlines join flights on airlines.uid = flights.airline group by airlines.airline order by count ( * ) desc limit 1
select airlines.airline , airlines.abbreviation from airlines join flights on airlines.uid = flights.airline group by airlines.airline order by count ( * ) desc limit 1
select airlines.abbreviation , airlines.country from airlines join flights on airlines.uid = flights.airline group by airlines.airline order by sum ( flights.flightno ) asc limit 1
select airlines.abbreviation , airlines.country from airlines join flights on airlines.uid = flights.airline group by airlines.uid order by count ( * ) asc limit 1
select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'AHD'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'AHD'
select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'APG' intersect select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'CVO'
select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'APG' intersect select airlines.airline from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.airportname = 'CVO'
select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.sourceairport = airports.airportcode where airports.airportname = 'CVO' except select airlines.airline from airlines join flights on airlines.uid = flights.airline join airports on flights.destairport = airports.airportcode where airports.airportname = 'APG'
select airlines.airline from airports join flights on airports.airportcode = flights.sourceairport join airlines on flights.airline = airlines.uid where airports.airportname = 'CVO' except select airlines.airline from airports join flights on airports.airportcode = flights.destairport join airlines on flights.airline = airlines.uid where airports.airportname = 'APG'
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count ( * ) >= 10
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count ( * ) < 200
select airlines.airline from airlines join flights on airlines.uid = flights.airline group by airlines.airline having count ( * ) < 200
select distinct flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines'
select flights.flightno from airlines join flights on airlines.uid = flights.airline where airlines.airline = 'United Airlines'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select flightno from flights where sourceairport = 'APG'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'APG'
select distinct flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen'
select flights.flightno from airports join flights on airports.airportcode = flights.destairport where airports.city = 'Aberdeen'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.city = 'Aberdeen' or airports.city = 'Abilene'
select count ( * ) from airports join flights on airports.airportcode = flights.sourceairport where airports.airportname = 'Aberdeen' or airports.airportname = 'Abilene'
sql placeholder
select airportname from airports where airportcode not in ( select destairport from flights ) or airportcode not in ( select sourceairport from flights )
select count ( * ) from employee
select count ( * ) from employee
select name from employee order by age asc , employee_id in ( select employee_id from employee group by employee_id having count ( * ) = 1 )
select name from employee order by age asc , name asc
select count ( * ) , city from employee group by city
select count ( * ) , city from employee group by city
select city from employee where age < 30 group by city having count ( * ) > 1
select city from employee where age < 30 group by city having count ( * ) > 1
select count ( * ) , location from shop group by location
select count ( * ) , location from shop group by location
select manager_name , district from shop where number_products = ( select max ( number_products ) from shop )
select manager_name , district from shop where number_products = ( select max ( number_products ) from shop )
select min ( number_products ) , max ( number_products ) from shop
select min ( number_products ) , max ( number_products ) from shop
select name , location , district from shop order by number_products desc , shop_id asc
select name , location , district from shop order by shop_id asc , number_products desc
select name from shop where number_products > ( select avg ( number_products ) from shop )
select name from shop where number_products > ( select avg ( number_products ) from shop )
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count ( * ) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id group by employee.employee_id order by count ( * ) desc limit 1
select employee.name from employee join evaluation on employee.employee_id = evaluation.employee_id order by evaluation.bonus desc limit 1
select name from employee where employee_id in ( select employee_id from evaluation where bonus = ( select max ( bonus ) from evaluation ) )
select name from employee where employee_id not in ( select employee_id from evaluation )
select name , employee_id from employee where employee_id not in ( select employee_id from evaluation )
select name from shop where shop_id in ( select shop_id from hiring group by shop_id having count ( employee_id ) = ( select max ( cnt ) from ( select count ( employee_id ) as cnt from hiring group by shop_id ) ) )
select name from shop where shop_id in ( select shop_id from hiring group by shop_id having count ( employee_id ) = ( select max ( cnt ) from ( select count ( employee_id ) as cnt from hiring group by shop_id ) ) )
select name from shop where shop_id not in ( select shop_id from hiring )
select name from shop where shop_id not in ( select shop_id from hiring )
select count ( * ) , shop.name from hiring join shop on hiring.shop_id = shop.shop_id group by hiring.shop_id
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
select count ( * ) from templates join documents on templates.template_id = documents.template_id where templates.template_type_code = 'PPT'
select template_id , count ( * ) from documents group by template_id
select template_id , count ( * ) from documents group by template_id
select documents.template_id , templates.template_type_code from documents join templates on documents.template_id = templates.template_id group by documents.template_id order by count ( * ) desc limit 1
select documents.template_id , templates.template_type_code from documents join templates on documents.template_id = templates.template_id group by documents.template_id order by count ( * ) desc limit 1
select template_id from documents group by template_id having count ( * ) > 1
select template_id from documents group by template_id having count ( * ) > 1
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
select template_type_code , count ( * ) from templates group by template_type_code
select ref_template_types.template_type_code , count ( * ) from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code group by ref_template_types.template_type_code
select template_type_code from templates group by template_type_code having count ( template_id ) = ( select max ( cnt ) from ( select count ( template_id ) as cnt from templates group by template_type_code ) t )
select template_type_code from templates group by template_type_code order by count ( * ) desc limit 1
select template_type_code from templates group by template_type_code having count ( * ) < 3
select template_type_code from templates group by template_type_code having count ( * ) < 3
select min ( version_number ) , min ( template_type_code ) from templates
select min ( version_number ) , template_type_code from templates group by template_type_code
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id where documents.document_name = 'Data base'
select documents.document_name from templates join documents on templates.template_id = documents.template_id where templates.template_type_code = 'BK'
select document_name from documents join templates on documents.template_id = templates.template_id where templates.template_type_code = 'BK'
select templates.template_type_code , count ( * ) from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code
select templates.template_type_code , count ( * ) from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count ( * ) desc limit 1
select templates.template_type_code from templates join documents on templates.template_id = documents.template_id group by templates.template_type_code order by count ( * ) desc limit 1
select template_type_code from ref_template_types except select template_type_code from templates
select template_type_code from templates except select template_type_code from templates
select templates.template_type_code , ref_template_types.template_type_description from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code
select templates.template_type_code , ref_template_types.template_type_description from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code
select template_type_description from ref_template_types where template_type_code = 'AD'
select template_type_description from ref_template_types where template_type_code = 'AD'
select templates.template_type_code from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Book'
select template_type_code from ref_template_types where template_type_description = 'Book'
select distinct ref_template_types.template_type_description from ref_template_types join templates on ref_template_types.template_type_code = templates.template_type_code join documents on templates.template_id = documents.template_id
select distinct document_description from documents join templates on documents.template_id = templates.template_id
select templates.template_id from templates join ref_template_types on templates.template_type_code = ref_template_types.template_type_code where ref_template_types.template_type_description = 'Presentation'
select template_id from templates where template_details = 'Presentation'
select count ( * ) from paragraphs
select count ( * ) from paragraphs
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Summer Show'
select * from paragraphs where paragraph_text = 'Korea'
select * from paragraphs where paragraph_text like '%Korea%'
select paragraphs.paragraph_id , paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Welcome to NY'
select paragraphs.paragraph_id , paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Welcome to NY'
select paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'
select paragraphs.paragraph_text from paragraphs join documents on paragraphs.document_id = documents.document_id where documents.document_name = 'Customer reviews'
select documents.document_id , count ( paragraphs.paragraph_id ) from paragraphs join documents on paragraphs.document_id = documents.document_id group by documents.document_id order by documents.document_id asc
select document_id , count ( * ) from paragraphs group by document_id order by document_id asc
select documents.document_id , documents.document_name , count ( paragraphs.paragraph_id ) as number_of_paragraphs from documents left join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id , documents.document_name
select documents.document_id , documents.document_name , count ( * ) from paragraphs join documents on paragraphs.document_id = documents.document_id group by paragraphs.document_id
select document_id from paragraphs group by document_id having count ( * ) >= 2
select document_id from paragraphs group by document_id having count ( * ) >= 2
select documents.document_id , documents.document_name from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by count ( * ) desc limit 1
select documents.document_name , documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by count ( * ) desc limit 1
select document_id from paragraphs group by document_id order by count ( * ) asc limit 1
select documents.document_id from documents join paragraphs on documents.document_id = paragraphs.document_id group by documents.document_id order by count ( * ) asc limit 1
select document_id from paragraphs group by document_id having count ( * ) between 1 and 2
select document_id from paragraphs group by document_id having count ( * ) between 1 and 2
select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Brazil' intersect select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Ireland'
select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Brazil' intersect select documents.document_id from paragraphs join documents on paragraphs.document_id = documents.document_id where paragraphs.paragraph_text = 'Ireland'
select count ( * ) from teacher
select count ( * ) from teacher
select name from teacher order by age asc , teacher_id asc
select name from teacher order by age asc , teacher_id asc
select age , hometown from teacher
select age , hometown from teacher
select name from teacher where hometown != 'Little Lever Urban District'
select distinct name from teacher where hometown != 'Little Lever Urban District'
select name from teacher where age = 32 or age = 33
select name from teacher where age = 32 or age = 33
select hometown from teacher order by age asc limit 1
select hometown from teacher where age = ( select min ( age ) from teacher )
select hometown , count ( * ) from teacher group by hometown
select hometown , count ( * ) from teacher group by hometown
select hometown from teacher group by hometown order by count ( * ) desc limit 1
select hometown from teacher group by hometown order by count ( * ) desc limit 1
select hometown from teacher group by hometown having count ( * ) >= 2
select hometown from teacher group by hometown having count ( * ) >= 2
select teacher.name , course.course from course_arrange join course on course_arrange.course_id = course.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc , course.course asc
select teacher.name , course.course from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id order by teacher.name asc , course.course
select teacher.name from course_arrange join course on course_arrange.course_id = course.course_id join teacher on course_arrange.teacher_id = teacher.teacher_id where course.course = 'Math'
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id join course on course_arrange.course_id = course.course_id where course.course = 'Math'
select teacher.name , count ( * ) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id
select teacher.name , count ( * ) from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count ( * ) >= 2
select teacher.name from course_arrange join teacher on course_arrange.teacher_id = teacher.teacher_id group by course_arrange.teacher_id having count ( * ) >= 2
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select name from teacher where teacher_id not in ( select teacher_id from course_arrange )
select count ( * ) from visitor where age < 30
select name from visitor where level_of_membership > 4 order by level_of_membership desc
select avg ( age ) from visitor where level_of_membership <= 4
select name , level_of_membership from visitor where level_of_membership > 4 order by age desc
select m.museum_id , m.name from museum m where m.num_of_staff = ( select max ( num_of_staff ) from museum )
select avg ( num_of_staff ) from museum where open_year < 2009
select open_year , num_of_staff from museum where name = 'Plaza Museum'
select name from museum where num_of_staff > ( select min ( num_of_staff ) from museum where open_year > 2010 )
select visitor.id , visitor.name , visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visit.visitor_id having count ( * ) > 1
select visitor.id , visitor.name , visitor.level_of_membership from visitor join visit on visitor.id = visit.visitor_id where total_spent = ( select max ( total_spent ) from visit )
select museum.museum_id , museum.name from museum join visit on museum.museum_id = visit.museum_id group by visit.museum_id order by count ( * ) desc limit 1
select name from museum where museum_id not in ( select museum_id from visit )
select visitor.name , visitor.age from visitor join visit on visitor.id = visit.visitor_id group by visit.visitor_id order by sum ( visit.num_of_ticket ) desc limit 1
select avg ( num_of_ticket ) , max ( num_of_ticket ) from visit
select sum ( total_spent ) from visit join visitor on visit.visitor_id = visitor.id where visitor.level_of_membership = 1
select visitor.name from visitor join visit on visitor.id = visit.visitor_id join museum on visit.museum_id = museum.museum_id where museum.open_year < 2009 intersect select visitor.name from visitor join visit on visitor.id = visit.visitor_id join museum on visit.museum_id = museum.museum_id where museum.open_year > 2011
select count ( * ) from visitor where id not in ( select visitor_id from visit join museum on visit.museum_id = museum.museum_id where open_year > 2010 )
select count ( * ) from museum where open_year > 2013 or open_year < 2008
select count ( * ) from players
select count ( * ) from players
select count ( * ) from matches
select count ( * ) from matches
select first_name , birth_date from players where country_code = 'USA'
select first_name , birth_date from players where country_code = 'USA'
select avg ( loser_age ) , avg ( winner_age ) from matches
select avg ( loser_age ) , avg ( winner_age ) from matches
select avg ( winner_rank ) from matches
select avg ( winner_rank ) from matches
select max ( loser_rank ) from matches
select loser_rank from matches group by loser_rank order by loser_rank desc limit 1
select count ( distinct country_code ) from players
select count ( distinct country_code ) from players
select count ( distinct loser_name ) from matches
select count ( distinct loser_name ) from matches
select tourney_name from matches group by tourney_name having count ( * ) > 10
select tourney_name from matches group by tourney_name having count ( * ) > 10
select matches.winner_name from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id where qualifying_matches.year = 2013 intersect select matches.winner_name from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id where qualifying_matches.year = 2016
select players.first_name , players.last_name from matches join players on matches.winner_id = players.player_id where matches.year = 2013 intersect select players.first_name , players.last_name from matches join players on matches.winner_id = players.player_id where matches.year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select count ( * ) from matches where year = 2013 or year = 2016
select players.country_code , players.first_name from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'WTA Championships' intersect select players.country_code , players.first_name from matches join players on matches.winner_id = players.player_id where matches.tourney_name = 'Australian Open'
select first_name , country_code from players where player_id in ( select player_id from rankings where ranking = 'WTA Championships' intersect select player_id from rankings where ranking = 'Australian Open' )
select first_name , country_code from players where birth_date = ( select max ( birth_date ) from players )
select first_name , country_code from players where birth_date = ( select max ( birth_date ) from players )
select first_name , last_name , player_id from players order by birth_date asc , first_name asc
select first_name , last_name , player_id from players order by birth_date asc , player_id asc
select first_name , last_name from players where hand = 'left' order by birth_date asc
select first_name , last_name , birth_date from players where hand = 'left' order by birth_date asc
select players.first_name , players.country_code from players join rankings on players.player_id = rankings.player_id group by rankings.player_id order by count ( * ) desc limit 1
select players.first_name , players.country_code from players join rankings on players.player_id = rankings.player_id group by rankings.player_id order by count ( * ) desc limit 1
select year from matches group by year order by count ( * ) desc limit 1
select year from matches group by year order by count ( * ) desc limit 1
select players.first_name , players.last_name , sum ( matches.winner_rank_points ) from matches join players on matches.winner_id = players.player_id group by matches.winner_id order by count ( * ) desc limit 1
select matches.winner_name , sum ( qualifying_matches.winner_rank_points ) from qualifying_matches join matches on qualifying_matches.winner_id = matches.winner_id group by qualifying_matches.winner_id order by count ( * ) desc limit 1
sql placeholder
sql placeholder
select loser_name , winner_name from qualifying_matches where minutes = ( select max ( minutes ) from matches )
select winner_name , loser_name from matches where loser_id in ( select loser_id from qualifying_matches where loser_ht = ( select max ( loser_ht ) from qualifying_matches ) )
select players.first_name , avg ( rankings.ranking ) from rankings join players on rankings.player_id = players.player_id group by rankings.player_id
select players.first_name , rankings.player_id , avg ( rankings.ranking_points ) from rankings join players on rankings.player_id = players.player_id group by rankings.player_id
select sum ( ranking_points ) , players.first_name , rankings.player_id from rankings join players on rankings.player_id = players.player_id group by rankings.player_id
select p.first_name , sum ( r.ranking_points ) as total_ranking_points from players p left join rankings r on p.player_id = r.player_id where r.ranking is null
select count ( * ) , country_code from players group by country_code
select country_code , count ( * ) from players group by country_code
select country_code from players group by country_code having count ( player_id ) = ( select max ( count ) from ( select count ( player_id ) as count from players group by country_code ) )
select country_code from players group by country_code having count ( player_id ) = ( select max ( count ) from ( select count ( player_id ) as count from players group by country_code ) )
select country_code from players group by country_code having count ( * ) > 50
select country_code from players group by country_code having count ( * ) > 50
select ranking_date , count ( * ) from rankings group by ranking_date
select sum ( tours ) , ranking_date from rankings group by ranking_date
select count ( * ) , year from matches group by year
select count ( * ) , year from matches group by year
select matches.winner_name , qualifying_matches.winner_rank from qualifying_matches join matches on qualifying_matches.winner_id = matches.winner_id order by qualifying_matches.winner_age asc limit 3
select matches.winner_name , matches.winner_rank from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id order by matches.winner_age asc limit 3
select count ( distinct matches.winner_id ) from matches join qualifying_matches on matches.winner_id = qualifying_matches.winner_id join players on qualifying_matches.winner_hand = players.player_id where qualifying_matches.tourney_name = 'WTA Championships' and players.hand = 'left'
select count ( * ) from players join matches on players.player_id = matches.winner_id where matches.tourney_name = 'WTA Championships' and players.hand = 'left'
select players.first_name , players.country_code , players.birth_date from matches join players on matches.winner_id = players.player_id where matches.winner_rank_points = ( select max ( winner_rank_points ) from matches )
select first_name , country_code , birth_date from players where player_id in ( select winner_id from matches group by winner_id having sum ( winner_rank_points ) = ( select max ( total_wins ) from ( select sum ( winner_rank_points ) as total_wins from matches group by winner_id ) ) )
select hand , count ( * ) from players group by hand
select hand , count ( * ) from players group by hand
select count ( * ) from ship where disposition_of_ship = 'Captured'
select name , tonnage from ship order by name desc , tonnage asc
select name , date , result from battle
select max ( killed ) , min ( killed ) from death
select avg ( injured ) , caused_by_ship_id from death group by caused_by_ship_id
select death.killed , death.injured from death join ship on death.caused_by_ship_id = ship.id where ship.tonnage = 't'
select name , result from battle where bulgarian_commander != 'Boril'
select distinct battle.id , battle.name from battle join ship on battle.id = ship.lost_in_battle where ship.ship_type = 'Brig'
select battle.id , battle.name from battle join death on battle.id = death.caused_by_ship_id group by battle.id having sum ( death.killed ) > 10
select ship.id , ship.name from death join ship on death.caused_by_ship_id = ship.id group by death.caused_by_ship_id order by sum ( death.injured ) desc limit 1
select distinct battle.name from battle where bulgarian_commander = 'Kaloyan' and latin_commander = 'Baldwin I'
select count ( distinct result ) from battle
select count ( * ) from battle where id not in ( select lost_in_battle from ship where tonnage = '225' )
select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'Lettice' intersect select battle.name , battle.date from battle join ship on battle.id = ship.lost_in_battle where ship.name = 'HMS Atalanta'
select battle.name , battle.result , battle.bulgarian_commander from battle where battle.id not in ( select lost_in_battle from ship where location = 'English Channel' )
select note from death where note like '%East%'
sql placeholder
select line_1 , line_2 from addresses
select count ( * ) from courses
select count ( * ) from courses
select course_description from courses where course_name = 'math'
select course_description from courses where course_name = 'Math'
select zip_postcode from addresses where city = 'Port Chelsea'
select zip_postcode from addresses where city = 'Port Chelsea'
select departments.department_name , degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count ( * ) desc limit 1
select departments.department_name , degree_programs.department_id from degree_programs join departments on degree_programs.department_id = departments.department_id group by degree_programs.department_id order by count ( * ) desc limit 1
select count ( distinct department_id ) from degree_programs
select count ( distinct department_id ) from degree_programs
select count ( distinct degree_summary_name ) from degree_programs
select count ( distinct degree_program_id ) from degree_programs
select count ( * ) from departments join degree_programs on departments.department_id = degree_programs.department_id where departments.department_name = 'Engineering'
select count ( * ) from departments join degree_programs on departments.department_id = degree_programs.department_id where departments.department_name = 'Engineering'
select section_name , section_description from sections
select section_name , section_description from sections
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) <= 2
select courses.course_name , courses.course_id from courses join sections on courses.course_id = sections.course_id group by courses.course_id having count ( * ) < 2
select section_name from sections order by section_name desc
select section_name from sections order by section_name desc
select semesters.semester_name , semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count ( * ) desc limit 1
select semesters.semester_name , semesters.semester_id from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id group by semesters.semester_id order by count ( * ) desc limit 1
select department_description from departments where department_name like '%computer%'
select department_description from departments where department_name like '%computer%'
select students.first_name , students.middle_name , students.last_name , student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count ( * ) = 2
select students.first_name , students.middle_name , students.last_name , student_enrolment.student_id from student_enrolment join students on student_enrolment.student_id = students.student_id group by student_enrolment.student_id having count ( * ) = 2
select students.first_name , students.middle_name , students.last_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id join students on student_enrolment.student_enrolment_id = students.student_id where degree_programs.degree_summary_name = 'Bachelor'
select students.first_name , students.middle_name , students.last_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id join students on student_enrolment.student_id = students.student_id where degree_programs.degree_summary_name = 'Bachelors'
select degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_program_id order by count ( * ) desc limit 1
select degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_summary_name order by count ( * ) desc limit 1
select student_enrolment.degree_program_id , degree_programs.degree_summary_name from student_enrolment join degree_programs on student_enrolment.degree_program_id = degree_programs.degree_program_id group by student_enrolment.degree_program_id order by count ( * ) desc limit 1
select degree_programs.degree_program_id , degree_programs.degree_summary_name from degree_programs join student_enrolment on degree_programs.degree_program_id = student_enrolment.degree_program_id group by degree_programs.degree_program_id order by count ( * ) desc limit 1
select student_enrolment.student_id , students.first_name , students.middle_name , students.last_name , count ( * ) from student_enrolment join students on student_enrolment.student_enrolment_id = students.student_id group by student_enrolment.student_id order by count ( * ) desc limit 1
sql placeholder
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select semester_name from semesters where semester_id not in ( select semester_id from student_enrolment )
select distinct courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id
select course_name from courses where course_id in ( select course_id from student_enrolment )
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_id order by count ( * ) desc limit 1
select courses.course_name from courses join student_enrolment_courses on courses.course_id = student_enrolment_courses.course_id group by courses.course_id order by count ( * ) desc limit 1
select last_name from students where current_address_id in ( select student_id from student_enrolment where degree_program_id = student_enrolment.degree_program_id ) and current_address_id not in ( select student_id from student_enrolment where degree_program_id = student_enrolment.degree_program_id )
select last_name from students where current_address_id in ( select student_id from student_enrolment where degree_program_id = student_enrolment.degree_program_id ) and current_address_id not in ( select student_id from student_enrolment )
select transcripts.transcript_date , transcripts.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count ( * ) >= 2
select transcripts.transcript_date , transcripts.transcript_id from transcripts join transcript_contents on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id having count ( * ) >= 2
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
select cell_mobile_number from students where first_name = 'Timmothy' and last_name = 'Ward'
select first_name , middle_name , last_name from students order by student_id asc limit 1
select students.first_name , students.middle_name , students.last_name from student_enrolment join students on student_enrolment.student_id = students.student_id order by student_enrolment.student_id asc limit 1
select s.first_name , s.middle_name , s.last_name from students s where s.date_left = ( select min ( date_left ) from students ) and s.student_id in ( select student_id from student_enrolment )
select s.first_name , s.middle_name , s.last_name from students s where s.student_id in ( select student_id from student_enrolment se where s.student_id = ( select min ( student_id ) from student_enrolment ) )
select first_name from students where permanent_address_id = students.current_address_id
select first_name from students where permanent_address_id != current_address_id
select addresses.address_id , addresses.line_1 , addresses.line_2 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count ( * ) desc limit 1
select addresses.address_id , addresses.line_1 , addresses.line_2 from addresses join students on addresses.address_id = students.current_address_id group by addresses.address_id order by count ( * ) desc limit 1
select avg ( transcript_date ) from transcripts
select avg ( transcript_date ) from transcripts
select transcript_date , other_details from transcripts order by transcript_date asc limit 1
select transcript_date , other_details from transcripts where transcript_date = ( select min ( transcript_date ) from transcripts )
select count ( * ) from transcripts where transcript_date = 'New'
select count ( * ) from transcripts
select transcript_date from transcripts order by transcript_date desc limit 1
select transcript_date from transcripts order by transcript_date desc limit 1
select count ( distinct transcript_id ) , student_enrolment_courses.student_enrolment_id from student_enrolment_courses join transcript_contents on student_enrolment_courses.student_course_id = transcript_contents.student_course_id group by student_enrolment_courses.student_enrolment_id having count ( distinct transcript_id ) <= 1
sql placeholder
select t.transcript_date , t.transcript_id from transcripts t , transcript_contents tc where t.transcript_id = tc.transcript_id group by t.transcript_id having count ( tc.student_course_id ) = ( select min ( c ) from ( select count ( student_course_id ) as c from transcript_contents group by transcript_id ) )
select transcripts.transcript_date , transcripts.transcript_id from transcript_contents join transcripts on transcripts.transcript_id = transcript_contents.transcript_id group by transcript_contents.transcript_id order by count ( * ) asc limit 1
select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = student_enrolment.student_id intersect select semesters.semester_name from semesters join student_enrolment on semesters.semester_id = student_enrolment.semester_id where student_enrolment.student_id = student_enrolment.student_id and student_enrolment.degree_program_id = degree_program_id
select semester_id from student_enrolment where degree_program_id = student_enrolment.degree_program_id intersect select semester_id from student_enrolment where degree_program_id = student_enrolment.degree_program_id and student_enrolment.student_enrolment_id = student_enrolment.student_enrolment_id = student_enrolment.student_enrolment_id
select count ( distinct current_address_id ) from students
select distinct addresses.address_id , students.current_address_id from students join addresses on students.permanent_address_id = addresses.address_id
select * from students order by other_student_details desc
select other_student_details from students order by other_student_details desc
select section_description from sections where section_name = 'H'
select section_description from sections where section_name = 'h'
sql placeholder
select students.first_name from addresses join students on addresses.address_id = students.permanent_address_id where addresses.country = 'Haiti' or students.cell_mobile_number = 09700166582
select title from cartoon order by title asc
select title from cartoon order by title asc
select * from cartoon where directed_by = 'Ben Jones'
select title from cartoon where directed_by = 'Ben Jones'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select count ( * ) from cartoon where written_by = 'Joseph Kuhr'
select title , directed_by from cartoon order by original_air_date asc , id
select title , directed_by from cartoon order by original_air_date asc , id asc
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
select count ( * ) from tv_channel where language = 'english'
select count ( * ) from tv_channel where language = 'english'
select language , count ( * ) from tv_channel group by language order by count ( * ) asc limit 1
select language , count ( * ) from tv_channel group by language order by count ( * ) asc limit 1
select language , count ( * ) from tv_channel group by language
select language , count ( * ) from tv_channel group by language
select series_name from tv_channel where id in ( select channel from cartoon where title = 'The Rise of the Blue Beetle!' )
select tv_channel.series_name from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.title = 'The Rise of the Blue Beetle'
select cartoon.title from tv_series join cartoon on tv_series.channel = cartoon.channel join tv_channel on tv_series.id = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select cartoon.title from tv_series join tv_channel on tv_series.channel = tv_channel.id join cartoon on tv_series.id = cartoon.id where tv_channel.series_name = 'Sky Radio'
select episode from tv_series order by rating asc , id asc
select episode from tv_series order by rating asc , id asc
select episode , rating from tv_series order by episode asc limit 3
select episode , rating from tv_series order by rating desc limit 3
select min ( share ) , max ( share ) from tv_series
select max ( share ) , min ( share ) from tv_series
select air_date from tv_series where episode = 'A Love of a Lifetime'
select air_date from tv_series where episode = 'A Love of a Lifetime'
select weekly_rank from tv_series where episode = 'A Love of a Lifetime'
select weekly_rank from tv_series where episode = 'A Love of a Lifetime'
select tv_channel.series_name from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_series.episode = 'A Love of a Lifetime'
select tv_channel.series_name from tv_channel join tv_series on tv_series.channel = tv_channel.id where tv_series.episode = 'A Love of a Lifetime'
select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select tv_series.episode from tv_series join tv_channel on tv_series.channel = tv_channel.id where tv_channel.series_name = 'Sky Radio'
select directed_by , count ( * ) from cartoon group by directed_by
select directed_by , count ( * ) from cartoon group by directed_by
select production_code , channel from cartoon where original_air_date = ( select max ( original_air_date ) from cartoon )
select production_code , channel from cartoon order by original_air_date desc limit 1
select package_option , series_name from tv_channel where hight_definition_tv = 'High'
select package_option , series_name from tv_channel where hight_definition_tv = 'High'
select tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select distinct tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.written_by = 'Todd Casey'
select country from tv_channel where id = ( select id from cartoon where written_by = 'Todd Casey' ) except select country from tv_channel where id = ( select id from cartoon where written_by = 'Todd Casey' )
select country from tv_channel where id not in ( select channel from cartoon where written_by = 'Todd Casey' )
select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones' intersect select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Michael Chang'
select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones' intersect select tv_channel.series_name , tv_channel.country from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Michael Chang'
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select pixel_aspect_ratio_par , country from tv_channel where language != 'english'
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel group by country having count ( * ) > 2
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select id from tv_channel except select channel from cartoon where directed_by = 'Ben Jones'
select package_option from tv_channel except select tv_channel.package_option from tv_channel join cartoon on tv_channel.id = cartoon.channel where cartoon.directed_by = 'Ben Jones'
select package_option from tv_channel where id not in ( select channel from cartoon where directed_by = 'Ben Jones' )
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
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , people.name asc
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.final_table_made asc , people.name asc
select birth_date from people where people_id in ( select people_id from poker_player where earnings = ( select min ( earnings ) from poker_player ) )
select birth_date from people where people_id in ( select people_id from poker_player where earnings = ( select min ( earnings ) from poker_player ) )
select poker_player.money_rank from poker_player join people on poker_player.people_id = people.people_id order by people.height desc limit 1
select money_rank from poker_player where people_id = ( select max ( height ) from people )
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select avg ( poker_player.earnings ) from poker_player join people on poker_player.people_id = people.people_id where people.height > 200
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc , people.name asc
select people.name from poker_player join people on poker_player.people_id = people.people_id order by poker_player.earnings desc , people.name asc
select nationality , count ( * ) from people group by nationality
select count ( * ) , nationality from people group by nationality
with nationalitycount as ( select nationality , count ( people_id ) as count from people group by nationality ) select nationality from nationalitycount where count = ( select max ( count ) from nationalitycount )
select nationality from people group by nationality order by count ( * ) desc limit 1
select nationality from people group by nationality having count ( * ) >= 2
select nationality from people group by nationality having count ( * ) >= 2
select name , birth_date from people order by name asc , people_id asc
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
select contestants.contestant_number , contestants.contestant_name from contestants join votes on contestants.contestant_number = votes.contestant_number group by votes.contestant_number having count ( * ) >= 2
select contestant_number , contestant_name from contestants where contestant_number in ( select contestant_number from votes group by contestant_number having count ( * ) = ( select min ( cnt ) from ( select count ( * ) as cnt from votes group by contestant_number ) ) )
select count ( * ) from area_code_state join votes on area_code_state.state = votes.state where area_code_state.area_code = 'NY' or area_code_state.area_code = 'CA'
select count ( * ) from contestants where contestant_number not in ( select contestant_number from votes )
select area_code_state.area_code from area_code_state join votes on area_code_state.state = votes.state group by area_code_state.state having count ( * ) = ( select max ( total_votes ) from ( select count ( * ) as total_votes from votes group by state ) )
select votes.created , votes.state , votes.phone_number from votes join contestants on votes.contestant_number = contestants.contestant_number where contestants.contestant_name = 'Tabatha Gehling'
sql placeholder
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
select countrylanguage.language from countrylanguage join city on countrylanguage.countrycode = city.countrycode join country on countrylanguage.countrycode = country.code where country.name = 'Aruba' group by countrylanguage.language order by count ( * ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.name = 'Aruba'
select population , lifeexpectancy from country where name = 'Brazil'
select population , lifeexpectancy from country where name = 'Brazil'
select region , population from country where name = 'Angola'
select region , population from country where name = 'Angola'
select avg ( lifeexpectancy ) from country where region = 'Central Africa'
select avg ( lifeexpectancy ) from country where continent = 'Central Africa'
select name from country where continent = 'Asia' order by lifeexpectancy asc limit 1
select name from country where continent = 'Asia' order by lifeexpectancy asc limit 1
select sum ( population ) , max ( gnp ) from country where continent = 'Asia'
select population , gnp from country where continent = 'Asia'
select avg ( lifeexpectancy ) from country where continent = 'Africa' and governmentform = 'Republic'
select avg ( lifeexpectancy ) from country where continent = 'Africa' and governmentform = 'Republic'
select sum ( surfacearea ) from country where continent = 'Asia' and continent = 'Europe'
select sum ( surfacearea ) from country where continent = 'Asia' or region = 'Europe'
select sum ( population ) from city where district = 'Gelderland'
select sum ( population ) from city where district = 'Gelderland'
select avg ( gnp ) , sum ( population ) from country where governmentform = 'United States'
select avg ( gnp ) , sum ( population ) from country where continent = 'North America'
select count ( distinct language ) from countrylanguage
select count ( distinct language ) from countrylanguage
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct governmentform ) from country where continent = 'Africa'
select count ( distinct language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Aruba'
select count ( distinct language ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Aruba'
select count ( * ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select count ( * ) from countrylanguage join country on countrylanguage.countrycode = country.code where country.name = 'Afghanistan'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name order by count ( * ) desc limit 1
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode group by country.name order by count ( * ) desc limit 1
select continent from country group by continent order by count ( * ) desc limit 1
select continent from country join countrylanguage on country.code = countrylanguage.countrycode group by continent order by count ( * ) desc limit 1
select count ( * ) from country where code in ( select countrycode from countrylanguage where language = 'english' intersect select countrycode from countrylanguage where language = 'dutch' )
select count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Dutch'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'French'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'French'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' intersect select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'French'
select name from country where code in ( select countrycode from countrylanguage where language = 'english' intersect select countrycode from countrylanguage where language = 'french' )
select count ( distinct country.continent ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Chinese'
select count ( distinct country.continent ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Chinese'
select distinct country.region from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
select country.region from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Dutch' or countrylanguage.language = 'English'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'English' or countrylanguage.language = 'Dutch'
select country.name from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'english' or countrylanguage.language = 'dutch'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Asia' group by countrylanguage.language order by count ( * ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.continent = 'Asia' group by countrylanguage.language order by count ( * ) desc limit 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'Republic' group by countrylanguage.language having count ( * ) = 1
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.governmentform = 'Republic'
select city.name , city.population from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'english' and city.population = ( select max ( population ) from city join countrylanguage on city.countrycode = countrylanguage.countrycode where countrylanguage.language = 'english' )
select city.name , city.population from city join country on city.countrycode = country.code join countrylanguage on countrylanguage.countrycode = city.countrycode where countrylanguage.language = 'english' order by city.population desc limit 1
select name , population , lifeexpectancy from country where surfacearea = ( select max ( surfacearea ) from country where region = 'Asia' )
select name , population , lifeexpectancy from country where surfacearea = ( select max ( surfacearea ) from country where continent = 'Asia' )
sql placeholder
sql placeholder
select sum ( city.population ) from country join city on country.code = city.countrycode join countrylanguage on countrylanguage.countrycode = city.countrycode where countrylanguage.language != 'english'
select sum ( city.population ) from country join city on country.code = city.countrycode join countrylanguage on countrylanguage.countrycode = city.countrycode where countrylanguage.language != 'english'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.headofstate = 'Beatrix'
select countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode where country.name = 'Beatrix'
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select count ( distinct countrylanguage.language ) from country join countrylanguage on country.code = countrylanguage.countrycode where country.indepyear < 1930
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select name from country where surfacearea > ( select max ( surfacearea ) from country where continent = 'Europe' )
select name from country where continent = 'Africa' and population < ( select min ( population ) from country where continent = 'Asia' )
select name from country where continent = 'Africa' and population < ( select min ( population ) from country where continent = 'Asia' )
select country.name from city join country on city.countrycode = country.code where country.continent = 'Asia' and country.population > ( select max ( population ) from country where continent = 'Africa' )
select name from country where continent = 'Asia' and population > ( select max ( population ) from country where continent = 'Africa' )
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language != 'english'
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language != 'english'
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language != 'english'
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language != 'english'
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select distinct city.name from city join countrylanguage on city.countrycode = countrylanguage.countrycode join country on countrylanguage.countrycode = country.code where country.continent = 'Asia' and countrylanguage.language = 'Chinese'
select name , indepyear , surfacearea from country where population = ( select min ( population ) from country )
select name , indepyear , surfacearea from country where population = ( select min ( population ) from country )
select population , name , headofstate from country where surfacearea = ( select max ( surfacearea ) from country )
select name , population , headofstate from country where surfacearea = ( select max ( surfacearea ) from country )
select country.name , count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.code having count ( * ) >= 3
select country.name , count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode group by country.code having count ( * ) > 2
select count ( * ) , district from city where population > ( select avg ( population ) from city )
select count ( * ) , district from city where population > ( select avg ( population ) from city )
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) > 72
select governmentform , sum ( population ) from country group by governmentform having avg ( lifeexpectancy ) > 72
select avg ( lifeexpectancy ) , sum ( population ) , continent from country group by continent having avg ( lifeexpectancy ) < 72
select continent , sum ( population ) , avg ( lifeexpectancy ) from country group by continent having avg ( lifeexpectancy ) < 72
select name , surfacearea from country order by surfacearea asc , name asc
select name , surfacearea from country order by surfacearea desc , population asc
select name from country order by population asc , name asc
select name from country order by population asc , name asc
select name from country order by population asc , code asc
select name from country order by population asc , name asc
select count ( * ) from country where continent = 'Asia'
select count ( * ) from country where continent = 'Asia'
select name from country where continent = 'Europe' and population = 80000
select name from country where continent = 'Europe' and population = 80000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select sum ( population ) , avg ( surfacearea ) from country where continent = 'North America' and surfacearea > 3000
select name from city where population between 160000 and 900000
select name from city where population between 160000 and 900000
select language from countrylanguage group by language order by count ( * ) desc limit 1
select language from countrylanguage group by language order by count ( * ) desc limit 1
select countrylanguage.language , country.code , country.name from countrylanguage join country on countrylanguage.countrycode = country.code group by countrylanguage.language order by sum ( countrylanguage.percentage ) desc limit 1
select country.code , countrylanguage.language from country join countrylanguage on country.code = countrylanguage.countrycode group by country.code order by sum ( countrylanguage.percentage ) desc limit 1
select count ( * ) from countrylanguage where percentage = ( select max ( percentage ) from countrylanguage where language = 'Spanish' )
select count ( * ) from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Spanish' or countrylanguage.language = 'Spanish'
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Spanish' and countrylanguage.percentage = ( select max ( percentage ) from countrylanguage where language = 'Spanish' )
select country.code from country join countrylanguage on country.code = countrylanguage.countrycode where countrylanguage.language = 'Spanish'
select count ( * ) from conductor
select count ( * ) from conductor
select name from conductor order by age asc , conductor_id
select name from conductor order by age asc , conductor_id
select name from conductor where nationality != 'USA'
select name from conductor where nationality != 'USA'
select record_company from orchestra order by year_of_founded desc , orchestra_id
select record_company from orchestra order by year_of_founded desc , orchestra_id
select avg ( attendance ) from show
select avg ( attendance ) from show
select max ( share ) , min ( share ) from performance where type != 'Live final'
select max ( share ) , min ( share ) from performance where type != 'Live final'
select count ( distinct nationality ) from conductor
select count ( distinct nationality ) from conductor
select name from conductor order by year_of_work desc , conductor_id asc
select name from conductor order by year_of_work desc , conductor_id in ( select conductor_id from conductor group by conductor_id having count ( conductor_id ) = ( select max ( c ) from ( select count ( conductor_id ) as c from conductor group by conductor_id ) ) )
select name from conductor order by year_of_work desc limit 1
select name from conductor order by year_of_work desc limit 1
select conductor.name , orchestra.orchestra from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id
select conductor.name , orchestra.orchestra from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id group by conductor.conductor_id having count ( * ) > 1
select conductor.name from orchestra join conductor on orchestra.conductor_id = conductor.conductor_id group by conductor.conductor_id having count ( * ) > 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id group by conductor.conductor_id order by count ( * ) desc limit 1
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
select conductor.name from conductor join orchestra on conductor.conductor_id = orchestra.conductor_id where orchestra.year_of_founded > 2008
select record_company , count ( * ) from orchestra group by record_company
select record_company , count ( * ) from orchestra group by record_company
select major_record_format from orchestra group by major_record_format order by count ( * ) asc , major_record_format
select major_record_format from orchestra group by major_record_format order by count ( * ) asc , major_record_format , orchestra_id
select record_company from orchestra group by record_company having count ( orchestra_id ) = ( select max ( cnt ) from ( select count ( orchestra_id ) as cnt from orchestra group by record_company ) )
select record_company from orchestra group by record_company order by count ( * ) desc limit 1
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select orchestra from orchestra where orchestra_id not in ( select orchestra_id from performance )
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select count ( * ) from orchestra where major_record_format = 'CD' or major_record_format = 'DVD'
select year_of_founded from orchestra group by year_of_founded having count ( * ) > 1
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
select grade from highschooler group by grade having count ( id ) = ( select max ( count ) from ( select count ( id ) as count from highschooler group by grade ) )
select grade from highschooler group by grade having count ( grade ) = ( select max ( count ) from ( select count ( grade ) as count from highschooler group by grade ) )
select grade from highschooler group by grade having count ( * ) >= 4
select grade from highschooler group by grade having count ( * ) >= 4
select student_id , count ( * ) from friend group by student_id
select count ( * ) , student_id from friend group by student_id
select highschooler.name , count ( * ) from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id
select highschooler.name , count ( * ) from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id order by count ( * ) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id order by count ( * ) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id order by count ( * ) desc limit 1
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count ( * ) >= 3
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count ( * ) >= 3
select friend.friend_id , highschooler.name from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select highschooler.id , friend.friend_id from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle'
select highschooler.id , count ( * ) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by highschooler.id
select highschooler.id , count ( * ) from highschooler join friend on highschooler.id = friend.student_id where highschooler.name = 'Kyle' group by highschooler.id
select id from highschooler except select student_id from friend
select id from highschooler except select student_id from friend
select name from highschooler where id not in ( select student_id from friend )
select name from highschooler where id not in ( select student_id from friend ) or id not in ( select student_id from friend )
select id from highschooler where id in ( select student_id from friend ) and id in ( select student_id from likes )
select student_id from friend intersect select student_id from likes
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select highschooler.name from highschooler join likes on highschooler.id = likes.student_id
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id intersect select highschooler.name from highschooler join likes on highschooler.id = likes.liked_id
select count ( * ) , student_id from likes group by student_id
select count ( * ) , count ( * ) , student_id from likes group by student_id
select highschooler.name , count ( likes.liked_id ) as likes_total from highschooler left join likes on highschooler.id = likes.student_id group by highschooler.id
select highschooler.name , count ( likes.liked_id ) as likes_total from highschooler left join likes on highschooler.id = likes.student_id group by highschooler.id
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by highschooler.id order by count ( * ) desc limit 1
select name from highschooler where id in ( select student_id from likes group by student_id having count ( liked_id ) = ( select max ( cnt ) from ( select count ( liked_id ) as cnt from likes group by student_id ) ) )
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by highschooler.id having count ( * ) >= 2
select highschooler.name from highschooler join likes on highschooler.id = likes.student_id group by likes.student_id having count ( * ) >= 2
select highschooler.name from highschooler join friend on highschooler.id = friend.student_id group by highschooler.id having count ( * ) >= 2
select name from highschooler where grade > 5 and id in ( select friend_id from friend where friend_id in ( select friend_id from highschooler where grade > 5 ) ) group by id having count ( * ) >= 2
select highschooler.id , count ( * ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
select highschooler.id , sum ( likes.liked_id ) from highschooler join likes on highschooler.id = likes.student_id where highschooler.name = 'Kyle' group by highschooler.id
select avg ( grade ) from highschooler where id in ( select student_id from friend ) or id in ( select student_id from friend )
select avg ( highschooler.grade ) from highschooler join friend on highschooler.id = friend.student_id
select min ( grade ) from highschooler where id not in ( select student_id from friend )
sql placeholder
select state from owners intersect select state from professionals
select state from owners intersect select state from professionals
select avg ( age ) from dogs where dog_id in ( select dog_id from treatments )
select avg ( age ) from dogs where dog_id in ( select dog_id from treatments )
select p.professional_id , p.last_name , p.cell_number from professionals p where p.state = 'Indiana' or p.professional_id in ( select t.professional_id from treatments t group by t.professional_id having count ( t.treatment_id ) > 2 )
select professionals.professional_id , professionals.last_name , professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id where professionals.state = 'Indiana' union select professionals.professional_id , professionals.last_name , professionals.cell_number from professionals join treatments on professionals.professional_id = treatments.professional_id group by professionals.professional_id having count ( * ) > 2
select name from dogs where dog_id not in ( select dog_id from treatments where cost_of_treatment > 1000 )
select name from dogs where dog_id not in ( select dog_id from treatments where cost_of_treatment > 1000 )
select first_name from owners except select dogs.name from owners join dogs on owners.owner_id = dogs.owner_id join breeds on breeds.breed_code = dogs.breed_code
select first_name from owners where owner_id in ( select owner_id from dogs except select name from dogs )
select professionals.professional_id , professionals.role_code , professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id except select professionals.professional_id , professionals.role_code , professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select professional_id , role_code , email_address from professionals except select professionals.professional_id , professionals.role_code , professionals.email_address from professionals join treatments on professionals.professional_id = treatments.professional_id
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count ( * ) desc limit 1
select owners.owner_id , owners.first_name , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id group by owners.owner_id order by count ( * ) desc limit 1
select treatments.professional_id , professionals.first_name , professionals.role_code from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select treatments.professional_id , professionals.role_code , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_name order by count ( * ) desc limit 1
select breeds.breed_name from breeds join dogs on breeds.breed_code = dogs.breed_code group by breeds.breed_name order by count ( * ) desc limit 1
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by count ( * ) desc limit 1
select owners.owner_id , owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum ( treatments.cost_of_treatment ) desc limit 1
select tt.treatment_type_description from treatment_types tt where exists ( select 1 from treatments t where tt.treatment_type_code = t.treatment_type_code group by t.treatment_type_code order by sum ( t.cost_of_treatment ) asc limit 1 )
select treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code group by treatments.treatment_type_code order by sum ( cost_of_treatment ) asc limit 1
sql placeholder
select owners.owner_id , owners.zip_code from owners join dogs on owners.owner_id = dogs.owner_id join treatments on dogs.dog_id = treatments.dog_id group by owners.owner_id order by sum ( treatments.cost_of_treatment ) desc limit 1
select treatments.professional_id , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select treatments.professional_id , professionals.cell_number from treatments join professionals on treatments.professional_id = professionals.professional_id group by treatments.professional_id having count ( * ) >= 2
select professionals.first_name , professionals.last_name from treatments join professionals on treatments.professional_id = professionals.professional_id where treatments.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments )
select p.first_name , p.last_name from professionals p where exists ( select 1 from treatments t where t.professional_id = p.professional_id and t.cost_of_treatment < ( select avg ( cost_of_treatment ) from treatments ) )
select treatments.date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.date_of_treatment , professionals.first_name from treatments join professionals on treatments.professional_id = professionals.professional_id
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select treatments.cost_of_treatment , treatment_types.treatment_type_description from treatments join treatment_types on treatments.treatment_type_code = treatment_types.treatment_type_code
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id group by dogs.size_code having count ( * )
select owners.first_name , owners.last_name , dogs.size_code from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id
select dogs.name , treatments.date_of_treatment from treatments join dogs on treatments.dog_id = dogs.dog_id join breeds on breeds.breed_code = dogs.breed_code order by breeds.breed_name asc limit 1
select dogs.name , treatments.date_of_treatment from treatments join dogs on treatments.dog_id = dogs.dog_id join breeds on breeds.breed_code = dogs.breed_code where breeds.breed_name = 'Rare' group by breeds.breed_name
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
select owners.first_name , dogs.name from owners join dogs on owners.owner_id = dogs.owner_id where owners.state = 'Virginia'
select date_arrived , date_departed from dogs join treatments on dogs.dog_id = treatments.dog_id
select dogs.date_arrived , dogs.date_departed from treatments join dogs on treatments.dog_id = dogs.dog_id
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id order by dogs.age asc limit 1
select owners.last_name from owners join dogs on owners.owner_id = dogs.owner_id where dogs.age = ( select min ( age ) from dogs ) or owners.last_name = ( select min ( age ) from dogs )
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select email_address from professionals where state = 'Hawaii' or state = 'Wisconsin'
select date_arrived , date_departed from dogs
select date_arrived , date_departed from dogs
select count ( distinct dog_id ) from treatments
select count ( distinct dog_id ) from treatments
select count ( distinct professional_id ) from treatments
select count ( distinct professionals.professional_id ) from treatments join professionals on treatments.professional_id = professionals.professional_id
select role_code , street , city , state from professionals where city like '%West%'
select role_code , street , city , state from professionals where city like '%West%'
select first_name , last_name , email_address from owners where state like '%North%'
select first_name , last_name , email_address from owners where state like '%North%'
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select count ( * ) from dogs where age < ( select avg ( age ) from dogs )
select cost_of_treatment from treatments order by date_of_treatment desc limit 1
select cost_of_treatment from treatments where date_of_treatment = ( select max ( date_of_treatment ) from treatments )
select count ( * ) from dogs where breed_code not in ( select dog_id from treatments )
select count ( * ) from dogs where dog_id not in ( select dog_id from treatments )
select count ( * ) from owners where owner_id not in ( select owner_id from dogs )
select count ( * ) from owners where owner_id not in ( select owner_id from dogs )
select count ( * ) from professionals where professional_id not in ( select professional_id from treatments )
select count ( * ) from professionals where professional_id not in ( select professional_id from treatments )
select name , age , weight from dogs where abandoned_yn = 1 and abandoned_yn = 0
select name , age , weight from dogs where abandoned_yn = 1
select avg ( age ) from dogs
select avg ( age ) from dogs
select age from dogs where age = ( select max ( age ) from dogs )
select age from dogs where age = ( select max ( age ) from dogs )
select charge_type , sum ( charge_amount ) from charges group by charge_type
select charge_type , charge_amount from charges
select charge_type from charges order by charge_amount desc limit 1
select charge_type , charge_amount from charges order by charge_type desc limit 1
select email_address , cell_number , home_phone from professionals
select email_address , cell_number , home_phone from professionals
select distinct breeds.breed_name , sizes.size_description from breeds join dogs on breeds.breed_code = dogs.breed_code join sizes on dogs.size_code = sizes.size_code
select distinct breeds.breed_name , dogs.size_code from breeds join dogs on breeds.breed_code = dogs.breed_code join sizes on dogs.size_code = sizes.size_code
sql placeholder
sql placeholder
select count ( * ) from singer
select count ( * ) from singer
select name from singer order by net_worth_millions asc , name asc
select name from singer order by net_worth_millions asc , singer_id asc
select birth_year , citizenship from singer
select birth_year , citizenship from singer
select name from singer where citizenship != 'France'
select name from singer where citizenship != 'French'
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer order by net_worth_millions desc limit 1
select s.name from singer s where s.net_worth_millions = ( select max ( net_worth_millions ) from singer ) or s.net_worth_millions = ( select max ( net_worth_millions ) from singer )
select citizenship , count ( * ) from singer group by citizenship
select citizenship , count ( * ) from singer group by citizenship
select citizenship from singer group by citizenship order by count ( * ) desc limit 1
select citizenship , count ( * ) from singer group by citizenship
select citizenship , max ( net_worth_millions ) from singer group by citizenship
select max ( net_worth_millions ) , citizenship from singer group by citizenship
select song.title , singer.name from song join singer on song.singer_id = singer.singer_id
select song.title , singer.name from song join singer on song.singer_id = singer.singer_id
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select distinct singer.name from singer join song on singer.singer_id = song.singer_id where song.sales > 300000
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name from singer join song on singer.singer_id = song.singer_id group by song.singer_id having count ( * ) > 1
select singer.name , sum ( song.sales ) from singer join song on singer.singer_id = song.singer_id group by song.singer_id
select sum ( song.sales ) , singer.name from singer join song on singer.singer_id = song.singer_id group by singer.name
select name from singer where singer_id not in ( select singer_id from song )
select name from singer where singer_id not in ( select singer_id from song )
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select count ( * ) from other_available_features
select ref_feature_types.feature_type_name from other_available_features join ref_feature_types on other_available_features.feature_type_code = ref_feature_types.feature_type_code where other_available_features.feature_name = 'AirCon'
select ref_property_types.property_type_description from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code
select property_name from properties where property_type_code = 'house' or room_count > 1
