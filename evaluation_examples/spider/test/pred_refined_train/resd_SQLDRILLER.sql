select count ( * ) from club
select count ( * ) from club
select name from club order by name asc
select name from club order by name asc
select manager , captain from club
select manager , captain from club
select name from club where manufacturer != 'Nike' or manufacturer = 'United Sports'
select name from club where manufacturer not in ( select manufacturer from club where manufacturer = 'Nike' )
select name from player order by wins_count asc , name asc
select name from player order by wins_count asc
select name from player where earnings = ( select max ( earnings ) from player )
select name from player where earnings = ( select max ( earnings ) from player )
select distinct country from player where earnings > 1200000
select distinct country from player where earnings > 1200000
select country from player where wins_count > 2 and earnings = ( select max ( earnings ) from player where wins_count > 2 )
select country from player where wins_count > 2 group by country having count ( * ) = ( select max ( earnings ) from ( select count ( * ) as earnings from player where wins_count > 2 group by country ) )
select player.name , club.name from club join player on club.club_id = player.club_id
select player.name , club.Name from club join player on club.club_id = player.club_id
select club.name from club where club.club_id in ( select club_id from player where wins_count > 2 )
select club.name from club where club_id in ( select club_id from player group by club_id having max ( wins_count ) > 2 )
select name from player where exists ( select 1 from club where club_id = player.club_id and manager = 'Sam Allardyce' )
select player.name from club join player on club.club_id = player.club_id where club.manager = 'Sam Allardyce' or club.name = 'Southampton Wanderers'
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg ( player.earnings ) desc
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg ( player.earnings ) desc
select manufacturer , count ( * ) from club group by manufacturer
select manufacturer as manufacturer_name , count ( * ) from club group by manufacturer
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( cnt ) from ( select count ( manufacturer ) as cnt from club group by manufacturer ) )
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( cnt ) from ( select count ( manufacturer ) as cnt from club group by manufacturer ) )
select manufacturer from ( select manufacturer , count ( distinct club_id ) as num_clubs from club group by manufacturer having num_clubs > 1 )
select manufacturer from club group by manufacturer having count ( distinct club_id ) > 1
select country from player group by country having count ( * ) > 1
select country from player group by country having count ( * ) > 1
select name from club where club_id not in ( select distinct club_id from player )
Select name from club where club_id not in ( select club_id from player )
select country from player where earnings > 1400000 union select country from player where earnings < 1100000
select country from player group by country having max ( earnings ) > 1400000 and min ( earnings ) < 1100000
select count ( distinct country ) from player
select count ( distinct country ) from player
select earnings from player where country = 'Australia' OR country = 'Zimbabwe'
select earnings from player where country = 'Australia' or country = 'Zimbabwe'
select orders.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id group by orders.customer_id having count ( * ) > 2 intersect select customers.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id join order_items on orders.order_id = order_items.order_id group by orders.customer_id having count ( * ) > 2
select orders.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id group by customers.customer_id having count ( * ) > 2 intersect select customers.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id join order_items on orders.order_id = order_items.order_id group by customers.customer_id having count ( * ) > 2
select orders.order_id , orders.order_status_code , count ( * ) from orders join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by orders.order_id
select orders.order_status_code , count ( order_items.product_id ) as number_of_items , orders.order_id from orders left join order_items on orders.order_id = order_items.order_id group by orders.order_id
select date_order_placed from orders where date_order_placed = ( select min ( date_order_placed ) from orders ) or order_id in ( select order_id from order_items group by order_id having count ( * ) > 1 )
select orders.date_order_placed , orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id order by orders.date_order_placed asc limit 1
select customer_first_name , customer_middle_initial , customer_last_name from customers where customer_id not in ( select o.customer_id from orders as o )
select customer_first_name , customer_last_name , customer_middle_initial from customers where customer_id not in ( select o.customer_id from orders as o )
select product_id , product_name , product_price , product_color from products where product_id not in ( select product_id from order_items group by product_id having count ( * ) >= 2 )
select p.product_id , p.product_name , p.product_price , p.product_color from products p where ( select count ( distinct oi.order_id ) from order_items oi where oi.product_id = p.product_id ) < 2
select orders.order_id , orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count ( * ) >= 2
select orders.order_id , orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count ( * ) >= 2
select product_id , product_name , product_price from products where product_id in ( select product_id from order_items group by product_id having count ( order_id ) = ( select max ( cnt ) from ( select count ( * ) as cnt from order_items group by product_id ) tmp ) )
select p.product_id , p.product_name , p.product_price from products p where p.product_id in ( select oi.product_id from order_items oi group by oi.product_id having count ( oi.order_id ) = ( select max ( cnt ) from ( select count ( * ) as cnt from order_items group by product_id ) ) )
select orders.order_id , sum ( products.product_price ) from orders join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by orders.order_id order by sum ( products.product_price ) asc limit 1
sql placeholder
select cpm.payment_method_code from customer_payment_methods cpm group by cpm.payment_method_code having count ( cpm.payment_method_code ) = ( select max ( count ) from ( select count ( payment_method_code ) as count from customer_payment_methods group by payment_method_code ) )
with paymentcount as ( select payment_method_code , count ( customer_id ) as num from customer_payment_methods group by payment_method_code ) select payment_method_code from paymentcount where num = ( select max ( num ) from paymentcount )
select customers.gender_code , count ( * ) from customers join orders join order_items on customers.customer_id = orders.customer_id join products on orders.order_id = order_items.order_id and order_items.product_id = products.product_id group by customers.gender_code
select customers.gender_code , count ( * ) from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id group by customers.gender_code
select customers.gender_code , count ( * ) from orders join customers on orders.customer_id = customers.customer_id group by customers.gender_code
select customers.gender_code , count ( * ) from orders join customers on orders.customer_id = customers.customer_id group by customers.gender_code
select customer_first_name , customer_middle_initial , customer_last_name , customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select customer_first_name , customer_middle_initial , customer_last_name , customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select invoices.invoice_status_code , invoices.invoice_date , shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select invoices.invoice_status_code , invoices.invoice_date , shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
sql placeholder
sql placeholder
select order_items.order_item_status_code , shipments.shipment_tracking_number from order_items join shipments on order_items.order_item_id = shipments.order_id
select order_item_status_code from order_items where order_id in ( select order_id from shipments ) and order_item_id in ( select order_id from shipment_items )
select product_name , product_color from products where product_id in ( select product_id from order_items )
select product_name , product_color from products where product_id in ( select product_id from shipment_items )
select distinct products.product_name , products.product_price , products.product_description from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id where customers.gender_code = 'Female'
select distinct products.product_name , products.product_price , products.product_description from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where customers.gender_code = 'Female'
select order_status_code from orders where order_id not in ( select order_id from shipments )
select invoice_status_code from invoices where invoice_number not in ( select invoice_number from shipments )
sql placeholder
sql placeholder
select count ( distinct customer_id ) from orders
select count ( distinct customer_id ) from ( select customer_id from orders )
select count ( distinct order_item_status_code ) from ( select order_items.order_item_status_code from order_items join orders on order_items.order_id = orders.order_id )
select count ( distinct order_item_status_code ) from orders join order_items on orders.order_id = order_items.order_id
select count ( distinct payment_method_code ) from customer_payment_methods
select count ( distinct payment_method_code ) from customer_payment_methods
select login_name , login_password from customers where phone_number like '+12%'
select customer_first_name , login_password from customers where phone_number like '+12%'
select product_size from products where instr ( product_name , 'Dell' ) > 0
select product_size from products where product_name like '%Dell%' or product_name like '%Dell%'
Select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select count ( * ) from ( select product_id from products where product_id not in ( select product_id from order_items ) )
select count ( distinct product_id ) from products where product_id not in ( select product_id from order_items )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select order_status_code , date_order_placed from ( select order_status_code , date_order_placed from orders ) as _
select ( order_status_code ) , ( date_order_placed ) from orders
select address_line_1 , town_city , county from customers where country = 'USA'
select address_line_1 , town_city , county from customers where country = 'United State'
select customers.customer_first_name , products.product_name from customers join orders on customers.customer_id = orders.customer_id join products on orders.order_id = products.product_id
select customers.customer_first_name , products.product_name from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id
select count ( * ) from ( select shipment_items.shipment_id from shipment_items join shipments on shipment_items.shipment_id = shipments.shipment_id )
select count ( * ) from shipments
select avg ( product_price ) from products
select avg ( product_price  ) from products
select avg ( product_price ) from products where product_id in ( select product_id from order_items )
select avg ( product_price ) from orders join order_items join products on orders.order_id = order_items.order_id and order_items.product_id = products.product_id
select email_address , town_city , county from customers group by gender_code order by count ( * ) asc limit 1
select email_address , town_city , county from customers where gender_code in ( select customer_id from orders group by customer_id having count ( customer_id ) = ( select min ( counted ) from ( select count ( customer_id ) as counted from orders group by customer_id ) ) )
select date_order_placed from orders where customer_id in ( select customer_id from customer_payment_methods group by customer_id having count ( distinct payment_method_code ) >= 2 )
select orders.date_order_placed from orders join customer_payment_methods on orders.customer_id = customer_payment_methods.customer_id group by customer_payment_methods.customer_id having count ( distinct customer_payment_methods.payment_method_code ) >= 2
select order_status_code from orders group by order_status_code having count ( order_status_code ) = ( select max ( count ) from ( select count ( order_status_code ) as count from orders group by order_status_code ) as cnt )
select order_status_code from orders group by order_status_code having count ( order_status_code ) = ( select min ( count_order ) from ( select count ( order_status_code ) as count_order from orders group by order_status_code ) )
select products.product_id , products.product_description from products join order_items on products.product_id = order_items.product_id group by products.product_id having count ( * ) > 3
select products.product_id , products.product_description from orders join order_items join products on orders.order_id = order_items.order_id and order_items.product_id = products.product_id group by products.product_id having count ( * ) > 3
select invoices.invoice_date , shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count ( distinct shipments.shipment_id ) >= 2
select invoices.invoice_date , shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count ( * ) >= 2
select shipment_tracking_number , shipment_date from shipments
select shipment_tracking_number , shipment_date from shipments
select product_color , product_description , product_size from products where product_price < ( select max ( product_price ) from products )
select product_color , product_description , product_size from products where product_price != ( select max ( product_price ) from products )
select name from director where age > ( select Avg ( age ) from director )
select name from director where ( age ) = ( select max ( age ) from director )
select count ( * ) from channel where Internet like '%bbc%'
select count ( distinct digital_terrestrial_channel ) from channel
select title from program order by start_year desc
select director.name from program join director on program.director_id = director.director_id group by director.director_id order by count ( * ) desc limit 1
select first.name , first.age from ( select director.name , director.age , count ( program.director_id ) as num_programs from director join program on director.director_id = program.director_id group by director.director_id ) first where first.num_programs = ( select max ( num_programs ) from ( select count ( director_id ) as num_programs from program group by director_id ) second )
select p.title from program p where p.start_year = ( select max ( start_year ) from program )
select channel.name , channel.internet from channel join program on channel.channel_id = program.channel_id group by channel. channel_id having count ( * ) > 1
select name , ( select count ( * ) from program where program.channel_id = channel.channel_id ) as program_count from channel
select count ( * ) from channel where channel_id not in ( select channel_id from program )
select name from director where director_id in ( select director_id from program where title = 'Dracula' )
select channel.name , channel.internet from channel join director_admin on channel.channel_id = director_admin.channel_id group by channel.channel_id order by count ( * ) desc limit 1
select name from director where age between 30 and 60
sql placeholder
select channel_id , name from channel where channel_id not in ( select channel_id from director_admin join director on director_admin.director_id = director.director_id where director.name = 'Hank Baskett' )
select count ( * ) from radio
select transmitter from radio order by erp_kw asc , transmitter asc
select tv_show_name , original_airdate from tv_show
select station_name from city_channel where affiliation != 'ABC'
select transmitter from radio where erp_kw > 150 or erp_kw <= 30
select transmitter from radio where erp_kW = ( select max ( erp_kw ) from radio )
select avg ( erp_kw ) from radio
select ( affiliation ) , count ( * ) from city_channel group by affiliation
select affiliation from city_channel group by affiliation having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from city_channel group by affiliation ) tmp )
select affiliation from city_channel group by affiliation having count ( * ) > 3
select city , station_name from city_channel order by station_name asc
select radio.transmitter , city_channel.city from city_channel join city_channel_radio on city_channel.id = city_channel_radio.city_channel_id join radio on city_channel_radio.radio_id = radio.radio_id
select radio.transmitter , city_channel.station_name from city_channel join city_channel_radio on city_channel.id = city_channel_radio.city_channel_id join radio on city_channel_radio.radio_id = radio.radio_id order by radio.erp_kw desc
select radio.transmitter , count ( * ) from radio join city_channel_radio on radio.radio_id = city_channel_radio.radio_id group by radio.transmitter
select distinct transmitter from radio where radio_id not in ( select distinct radio_id from city_channel_radio )
select model from vehicle where power > 6000 and top_speed = ( select max ( top_speed ) from vehicle where power > 6000 )
select model from vehicle where power > 6000 and top_speed = ( select max ( top_speed ) from vehicle where power > 6000 )
Select name from driver where citizenship = 'United States'
select name from driver where citizenship = 'United States'
select driver.driver_id , count ( * ) from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id group by driver.driver_id having count ( * ) <= 10
select driver.driver_id , count ( * ) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id group by driver.driver_id order by count ( * ) desc limit 1
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select vehicle_driver.vehicle_id from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle.vehicle_id order by count ( * ) asc limit 1
select vehicle_id from ( select vehicle_id , count ( driver_id ) as cnt from vehicle_driver group by vehicle_id ) where cnt = ( select min ( cnt ) from ( select count ( driver_id ) as cnt from vehicle_driver group by vehicle_id ) )
select top_speed , power from vehicle where build_year = 1996
select top_speed , power from vehicle where build_year = '1996'
select build_year , model , builder from vehicle
select build_year , builder , model from vehicle
select count ( distinct vehicle_driver.driver_id ) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count ( distinct vehicle_driver.driver_id ) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count ( distinct d.driver_id ) from driver d where exists ( select 1 from driver d2 where d2.racing_series = 'NASCAR' and d2.driver_id = d.driver_id )
select count ( * ) from driver where racing_series = 'NASCAR'
select avg ( top_speed ) from vehicle
select avg ( top_speed ) from vehicle
select distinct driver.name from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.power > 5000
select name from driver where driver_id in ( select driver_id from vehicle_driver where vehicle_id in ( select vehicle_id from vehicle where power > 5000 ) )
select model from vehicle where total_production > 100 or top_speed > 150
select model from vehicle where total_production > 100 or top_speed > 150
Select model , build_year from vehicle where model like '%DJ%'
Select model , build_year from vehicle where model like '%DJ%'
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle.vehicle_id having count ( * ) = 2 union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.builder = 'Ziyang'
select vehicle_id , model from vehicle where builder = 'Ziyang' or vehicle_id in ( select vehicle_id from vehicle_driver where driver_id = vehicle_driver.driver_id group by vehicle_id having count ( distinct driver_id ) = 2 )
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon'
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jefffy Gordon'
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select name from ( select name as name , citizenship from driver order by name asc ) as x
select name from driver order by name asc
select racing_Series , count ( * ) from driver group by racing_series
select count ( * ) , racing_series from driver group by racing_series
select driver.name , driver.citizenship from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select driver.name , driver.citizenship from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select count ( * ) from driver where driver_id not in ( select distinct driver_id from vehicle_driver )
select count ( * ) from driver where driver_id not in ( select driver_id from vehicle_driver )
select count ( * ) from exams
select count ( * ) from exams
select distinct subject_code from exams order by subject_code asc
select distinct subject_code from exams order by subject_code asc
select exam_name , exam_date from exams where subject_code != 'Database'
select exam_date , exam_name from exams where subject_code != 'Database'
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select type_of_question_code , count ( * ) from questions group by type_of_question_code
select type_of_question_code , count ( * ) from questions group by type_of_question_code
select distinct student_answer_text from student_answers where comments = 'Normal'
select distinct student_answer_text from student_answers where comments = 'Normal'
select count ( distinct comments ) from student_answers
select count ( distinct comments ) from student_answers
select student_answer_text from student_answers group by student_answer_text order by count ( * ) desc
select student_answer_text from ( select student_answer_text , count ( * ) as cnt from student_answers group by student_answer_text ) order by cnt desc
select s.first_name , sa.date_of_answer from student_answers sa join students s on sa.student_id = s.student_id
select students.first_name , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_Id
select students.email_adress , student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id order by date_of_answer desc
select students.email_adress , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id order by student_answers.date_of_answer desc
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select students.first_name from student_answers join students on student_answers.student_id = students.student_id group by student_answers.student_id having count ( * ) >= 2
select s.first_name from students s join student_answers sa on s.student_id = sa.student_id group by s.student_id having count ( * ) >= 2
select valid_answer_text from valid_answers group by valid_answer_text having count ( valid_answer_text ) = ( select max ( cnt ) from ( select count ( valid_answer_text ) as cnt from valid_answers group by valid_answer_text ) tmp )
select valid_answer_text from valid_answers group by valid_answer_text having count ( valid_answer_text ) = ( select max ( cnt ) from ( select count ( valid_answer_text ) as cnt from valid_answers group by valid_answer_text ) tmp )
select last_name from students where gender_mfu != 'M' or gender_mfu = 'N'
select last_name from students where gender_mfu != 'M' or gender_mfu = 'N'
select gender_mfu , count ( * ) from students group by gender_mfu
select gender_mfu , count ( * ) from students group by gender_mfu
select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
Select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
select first_name from students where student_id not in ( select student_id from student_answers )
select first_name from students where student_id not in ( select an.student_id from student_answers an )
select student_answer_text from student_answers where comments = 'Normal' intersect select student_answer_text from student_answers where comments = 'Absent'
select student_answer_text from student_answers group by student_answer_text having count ( distinct comments ) = 2
select type_of_question_code from questions group by type_of_question_code having count ( * ) >= 3
select type_of_question_code from questions group by type_of_question_code having count ( * ) >= 3
select * from students
select * from students
select count ( * ) from addresses
select count ( * ) from addresses
select address_id , address_details from addresses
select address_id , address_details from addresses
select count ( * ) from products
select count ( * ) from products
select product_id , product_type_code , product_name from products
select product_id , product_type_code , product_name as product_name from products
select product_price from products where product_name = 'Monitor'
select product_price from products where product_name = 'Monitor'
select min ( product_price )  , avg ( product_price ) , max ( product_price ) from products
select min ( product_price )  , avg ( product_price ) , max ( product_price ) from products
select avg ( product_price ) from products where product_type_code = 'Clothes'
select avg ( product_price ) from Products where product_type_code = 'Clothes'
select count ( * ) from products where product_type_Code = 'Hardware'
select count ( * ) from products where product_type_Code = 'Hardware'
select product_Name from products where product_price > ( select avg ( product_price ) from products )
select product_name from products where product_price > ( select avg ( product_price ) from products  )
select product_name from products where product_price > ( select avg ( product_price ) from products where product_type_code = 'Hardware' ) and product_type_code = 'Hardware'
select product_name from products where product_price > ( select avg ( product_price ) from products where product_type_code = 'Hardware' ) and product_type_code = 'Hardware'
select p.product_name from products p where p.product_type_code = 'Clothes' and p.product_price = ( select max ( product_price ) from products where product_type_code = 'Clothes' )
select p.product_name from products p where p.product_type_code = 'Clothes' and p.product_price = ( select max ( product_price ) from products where product_type_code = 'Clothes' )
select p.product_id , p.product_name from products p where p.product_type_code = 'Hardware' and p.product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' )
select p.product_id , p.product_name from products p where p.product_type_code = 'Hardware' and p.product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' )
select product_name from products order by product_price desc
Select product_name from products order by product_price desc
select product_type_code from products where product_type_code = 'Hardware' order by product_price asc
select product_name from products where product_type_code = 'Hardware' order by product_price asc
select product_type_code , count ( * ) from products group by product_type_code
select product_type_code  , count ( * ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code from products group by product_type_code having count ( * ) >=2
select product_type_code from products group by product_type_code having count ( * ) >= 2
select product_type_code from products group by product_type_code having count ( product_id ) = ( select max ( cnt ) from ( select count ( product_id ) cnt from products group by product_type_code ) )
select product_type_code from products group by product_type_code having count ( product_type_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from products group by product_type_code ) )
select count ( * ) from customers
select count ( * ) from customers
select customer_id , customer_name from customers
select customer_id , customer_name from customers
select customer_address , customer_phone , customer_email from customers where customer_name = 'Jeromy'
select customer_address , customer_phone , customer_email from customers where customer_name = 'Jeromy'
select payment_method_code , count ( * ) from customers group by payment_method_code
select payment_method_code , count ( * ) from customers group by payment_method_code
select payment_method_code from customers group by payment_method_code having count ( customer_id ) = ( select max ( cnt ) from ( select count ( customer_id ) as cnt from customers group by payment_method_code ) )
select payment_method_code from customers group by payment_method_code having count ( payment_method_code ) = ( select max ( cnt ) from ( select count ( payment_method_code ) as cnt from customers group by payment_method_code ) as max_count )
sql placeholder
select customer_name from customers where payment_method_code = ( select payment_method_code from customers group by payment_method_code order by count ( * ) asc limit 1 )
select payment_method_Code , customer_number from customers where customer_name = 'Jeromy'
select payment_method_code , customer_number from customers where customer_name = 'Jeromy'
select distinct payment_method_code from customers
select distinct payment_method_code from customers
select products.product_id , products.product_type_code from products order by products.product_name asc
select product_id , product_type_code from products group by product_id order by product_name asc
select p.product_type_code from products p group by p.product_type_code having count ( p.product_id ) = ( select min ( count ) from ( select count ( product_id ) as count from products group by product_type_code ) )
select product_type_code from products group by product_type_code having count ( * ) = ( select min ( prodcnt ) from ( select count ( * ) as prodcnt from products group by product_type_code ) )
select count ( * ) from customer_orders
select count ( * ) from customer_orders
select order_id , order_date , order_status_code from customer_orders join customers on customer_orders.customer_id = customers.customer_id where customers.customer_name = 'Jeromy'
select o.order_id , o.order_date , o.order_status_code from customer_orders o where o.customer_id = 'Jeromy'
select customer_name , customer_id , ( select count ( order_id ) from customer_orders where customers.customer_id = customer_orders.customer_id ) as orders_count from customers
select customer_name , customer_id , ( select count ( order_id ) from customer_orders where customers.customer_id = customer_orders.customer_id ) as orders_count from customers
select names.customer_id , names.customer_name , names.customer_phone , names.customer_email from customers names join customer_orders orders on names.customer_id = orders.customer_id group by names.customer_id having count ( orders.order_id ) = ( select max ( order_count ) from ( select customer_id , count ( order_id ) as order_count from customer_orders group by customer_id ) temp )
select customers.customer_id , customers.customer_name , customers.customer_phone , customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id order by count ( * ) desc limit 1
select sub.order_status_code , count ( sub.order_id ) from customer_orders sub group by sub.order_status_code
select order_status_code as order_status_code , count ( * ) from customer_orders group by order_status_code
select order_status_code from customer_orders group by order_status_code having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from customer_orders group by order_status_code ) )
with ordercounts as ( select order_status_code , count ( * ) as num from customer_orders group by order_status_code ) select order_status_code from ordercounts where num = ( select max ( num ) from ordercounts )
select count ( * ) from customers where customer_id not in ( select customer_Id from customer_orders )
select count ( * ) from customers where customer_id not in ( select customer_Id from customer_orders )
select product_name from products where product_id not in ( select product_id from order_items )
select product_Name from products where product_id not in ( select product_id from order_items )
select count ( * ) from products join order_items on products.product_id = order_items.product_id where products.product_name = 'Monitor'
select count ( * ) from products join order_items on products.product_id = order_items.product_id where products.product_name = 'Monitor'
select count ( distinct customer_orders.customer_id ) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name = 'Monitor'
select count ( distinct customer_id ) from ( select customer_id from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where product_name = 'Monitor' )
select count ( distinct customer_id ) from customer_orders
select count ( distinct customer_id ) from customer_orders
select customer_id from customers except select customer_id from customer_orders
select customer_id from customers except select customer_id from customer_orders
select distinct co.order_date , co.order_id from customer_orders co join order_items oi on co.order_id = oi.order_id where oi.order_quantity > 6 or co.order_id in ( select order_id from order_items group by order_id having count ( distinct product_id ) > 3 )
select customer_orders.order_id , customer_orders.order_date from customer_orders join order_items on customer_orders.order_id = order_items.order_id where order_items.order_quantity > 6 or order_items.product_id > 3
select count ( * ) from building
select count ( * ) from building
select name from building order by number_of_stories asc , name asc
select name from building order by number_of_stories asc
select address from building order by completed_year desc
select address from building order by completed_year desc
select max ( number_of_stories ) from building where completed_year != 1980
select max ( number_of_stories ) from building where completed_year != 1980
select avg ( population ) from region
select avg ( population ) from region
Select name from region order by name asc
select name from region order by name asc
select capital from region where area > 10000
select capital from region where area > 10000
select capital from region where population = ( select max ( population ) from region )
select capital from region where population = ( select max ( population ) from region )
select name from region order by area desc limit 5
select name from region order by area desc limit 5
select building.name , region.name from building join region on building.region_id = region.region_id
select building.name , region.name from building join region on building.region_id = region.region_id
select region.name from building join region on building.region_id = region.region_id group by building.region_id having count ( * ) > 1
select region.name from building join region on building.region_id = region.region_id group by region.region_id having count ( * ) > 1
select region.capital from region join ( select region_id from building group by region_id having count ( building_id ) = ( select max ( count ) from ( select count ( building_id ) as count from building group by region_id ) ) ) as max_region on region.region_id = max_region.region_id
select capital from region where region_id in ( select region_id from building group by region_id having count ( region_id ) = ( select max ( counted ) from ( select count ( building_id ) as counted from building group by region_id ) ) )
select building.address , region.capital from region join building on region.region_id = building.region_id
select building.address , region.Name from building join region on building.region_id = region.region_id
select building.number_of_stories from region join building on region.region_id = building.region_id where region.name = 'Abruzzo'
select building.number_of_stories from region join building on region.region_id = building.region_id where region.name = 'Abruzzo'
select completed_year , count ( * ) from building group by completed_year
select completed_year , count ( * ) from building group by completed_year
select completed_year from building group by completed_year having count ( * ) = ( select max ( counts ) from ( select count ( * ) as counts from building group by completed_year ) )
select completed_year as year from building group by year having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from building group by completed_year ) )
select name from region where region_id not in ( select region_id from building )
select name from region where region_id not in ( select region_id from building )
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select distinct address from building
select distinct address from building
select completed_year from building order by number_of_stories desc
select completed_year from building order by number_of_stories desc , completed_year asc
select channel_details from channels order by channel_details asc
select channel_details from channels order by channel_details asc
select count ( * ) from services
select count ( * ) from services
with codingcounts as ( select analytical_layer_type_code , count ( * ) as count from analytical_layer group by analytical_layer_type_code ) select analytical_layer_type_code from codingcounts where count = ( select max ( count ) from codingcounts )
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code having count ( analytical_layer_type_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from analytical_layer group by analytical_layer_type_code ) )
select distinct services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customers on customers_and_services.customer_id = customers.customer_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customer_interactions on customers_and_services.customer_id = customer_interactions.customer_id group by services.service_id having count ( * ) > 3
select distinct s.service_details from services s where s.service_id in ( select cs.service_id from customers_and_services cs join customers c on cs.customer_id = c.customer_id group by cs.service_id having count ( distinct cs.customer_id ) > 3 )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( customer_id ) = ( select max ( customer_count ) from ( select count ( customer_id ) as customer_count from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( customer_id ) = ( select max ( counted ) from ( select count ( service_id ) as counted from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( customers_and_services_id ) = ( select max ( cnt ) from ( select count ( customer_id ) as cnt from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( distinct customers_and_services_id ) = ( select max ( total ) from ( select count ( distinct customers_and_services_id ) as total from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id not in ( select customer_id from customers_and_services )
select customer_details from customers where customer_id not in ( select customers_and_services.customer_id from customers_and_services join customers on customers_and_services.customer_id = customers.customer_id )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where service_id in ( select service_id from services group by service_id order by count ( * ) asc limit 1 ) )
select distinct customer_details from customers where customer_id in ( select customer_id from customers_and_services where service_id in ( select service_id from services group by service_id order by count ( * ) asc limit 1 ) )
select count ( distinct customers_and_services_details) from customers_and_services
select count ( * ) from customers_and_services where customers_and_services_details is not null
select customer_details from customers where customer_details like '%Kütch%'
Select customer_details from customers where customer_details like '%Kutch%'
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) ) or service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) or service_id in ( select service_id from customer_interactions where customer_id = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) and service_id in ( select service_id from customer_interactions where customer_interactions.status_code = 'Bad' ) )
sql placeholder
select distinct services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where channels.channel_details = '' and customer_interactions.customer_id = 1
select s.service_details from services s where exists ( select 1 from customer_interactions ci join channels c on ci.channel_id = c.channel_id where ci.service_id = s.service_id and c.channel_details = '15 ij' )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' intersect select customer_id from customer_interactions where services_and_channels_details = 'Bad' )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' intersect select customer_id from customer_interactions where services_and_channels_details = 'bad' )
select count ( * ) from integration_platform where integration_platform_details = 'Success'
select count ( * ) from integration_platform where integration_platform_details = 'Success'
select customer_details from customers where customer_id in ( select customer_id from customer_interactions join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = 'Failed' )
select c.customer_details from customers c where exists ( select 1 from customer_interactions ci join integration_platform ip on ci.customer_interaction_id = ip.customer_interaction_id where ci.customer_id = c.customer_id and ip.integration_platform_details = 'Fail' )
select services.service_details from services where services.service_id not in ( select service_id from customers_and_services )
select service_details from services where service_id not in ( select service_id from customers_and_services )
select sub.analytical_layer_type_code , sub.usage_count from ( select analytical_layer_type_code , count ( * ) as usage_count from analytical_layer group by analytical_layer_type_code ) sub
select analytical_layer_type_code , count ( * ) from analytical_layer group by analytical_layer_type_Code
select s.service_details from services s where exists ( select 1 from customers_and_services cs where cs.service_id = s.service_id and cs.customers_and_services_details = 'Unsatisfied' )
select service_details from services where service_id in ( select service_id from customers_and_services where customers_and_services_details in ( select customers_and_services_details from customers_and_services where customers_and_services_details = 'unsatisfied' ) )
select count ( * ) from vehicles
select count ( * ) from vehicles
select name from vehicles order by model_year desc
Select name from vehicles order by model_year desc
select distinct type_of_powertrain from vehicles
select distinct type_of_powertrain from vehicles
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year = 2013 OR model_year = 2014
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year in ( 2013 , 2014 )
select type_of_powertrain from vehicles where model_year = 2014 intersect select type_of_powertrain from vehicles where model_year = 2013.
select type_of_powertrain from vehicles where model_year = 2014 intersect select type_of_powertrain from vehicles where model_year = 2013
select type_of_powertrain , count ( * ) from vehicles group by type_of_powertrain
select type_of_powertrain  , count ( * ) from vehicles group by type_of_powertrain
select type_of_powertrain from vehicles group by type_of_powertrain having count (* ) = ( select max ( cnt ) from ( select count ( * ) as cnt from vehicles group by type_of_powertrain ) )
select type_of_powertrain from vehicles group by type_of_powertrain having count ( type_of_powertrain ) = ( select max ( count ) from ( select count ( type_of_powertrain ) as count from vehicles group by type_of_powertrain ) )
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select name , model_year from vehicles where city_fuel_economy_rate <= ( select min ( city_fuel_economy_rate ) from vehicles )
select name , model_year from vehicles where city_fuel_economy_rate <= ( select min ( city_fuel_economy_rate ) from vehicles )
select type_of_powertrain , avg ( annual_fuel_cost ) from vehicles group by type_of_powertrain having count ( * ) >= 2
select type_of_powertrain , avg ( annual_fuel_cost ) from vehicles group by type_of_powertrain having count ( * ) >= 2
select name , age , membership_credit from ( select name , age , membership_credit from customers ) as 'name'
select name , membership_credit , age from customers
select c.name , c.age from customers c where c.membership_credit = ( select max ( membership_credit ) from customers )
select c.name , c.age from customers c where c.membership_credit = ( select max ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( age ) from customers )
select * from discount
select * from discount
select vehicles.name , sum ( renting_history.total_hours ) from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by vehicles.id
select vehicles.name , sum ( renting_history.total_hours ) from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by renting_history.vehicles_id
Select name from vehicles where id not in ( select vehicles_id from renting_history )
select name from vehicles where Id not in ( select vehicles_id from renting_history )
select name from customers where id in ( select customer_id from renting_history group by customer_id having count ( * ) >= 2 )
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by renting_history.customer_id having count ( distinct renting_history.id ) >= 2
select name , model_year from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from renting_history group by vehicles_id ) ) )
select vehicles.name , vehicles.model_year from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by vehicles.id order by count ( * ) desc limit 1
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by vehicles.id order by sum ( renting_history.total_hours ) desc
select name from vehicles where id in ( select vehicles_id from renting_history order by total_hours desc )
select discount.name from renting_history join discount on renting_history.discount_id = discount.id group by discount.name order by count ( * ) desc limit 1
select discount.name from discount join renting_history on discount.id = renting_history.discount_id group by renting_history.discount_id order by count ( * ) desc limit 1
select vehicles.name , vehicles.type_of_powertrain from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by renting_history.vehicles_id having sum ( renting_history.total_hours ) > 30
select vehicles.name , vehicles.type_of_powertrain from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id having sum ( renting_history.total_hours ) > 30
select avg ( city_fuel_economy_rate ) , avg ( highway_fuel_economy_rate ) , type_of_powertrain from vehicles group by type_of_powertrain
select avg ( city_fuel_economy_rate )  , avg ( highway_fuel_economy_rate ) , type_of_powertrain from vehicles group by type_of_powertrain
select avg ( amount_of_loan ) from student_loans
select avg ( amount_of_loan ) from student_loans
select students.bio_data , students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) >= 2 intersect select students.bio_data , students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) < 2
select students.bio_data , students.student_id from classes join students on classes.student_id = students.student_id join detention on students.student_id = detention.student_id group by students.student_id having count ( * ) >= 2 union select students.bio_data , students.student_id from students join classes on students.student_id = classes.student_id group by students.student_id having count ( * ) < 2
select t.teacher_details from teachers t where exists ( select 1 from classes c where c.teacher_id = t.teacher_id and c.class_details like 'data%' ) and not exists ( select 1 from classes c2 where c2.teacher_id = t.teacher_id and c2.class_details like '%net%' )
select t.teacher_details from teachers t where exists ( select 1 from classes c where c.teacher_id = t.teacher_id and c.class_details like '%data%' except select 1 from classes c where c.teacher_id = t.teacher_id and c.class_details like '%net%' )
select bio_data from students where student_id not in ( select student_id from detention union select student_id from student_loans )
select bio_data from students where student_id not in ( select student_id from detention union select student_id from student_loans )
select student_loans.amount_of_loan , student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by achievements.student_id having count ( * ) >= 2
select student_loans.amount_of_loan , student_loans.date_of_loan from achievements join student_loans on achievements.student_id = student_loans.student_id group by achievements.student_id having count ( * ) >= 2
select t.teacher_details , t.teacher_id from teachers t where exists ( select null from classes c where c.teacher_id = t.teacher_id group by c.teacher_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from classes group by teacher_id ) ) )
select t.teacher_details , t.teacher_id from teachers t where exists ( select null from classes c where c.teacher_id = t.teacher_id group by c.teacher_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from classes group by teacher_id ) ) )
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select students.student_details , ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join addresses on students_addresses.address_id = addresses.address_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students.student_id
select students.student_details , ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join addresses on students_addresses.address_id = addresses.address_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students.student_id
select addresses.address_details , students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id
select addresses.address_details , students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id group by addresses.address_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select count ( * ) , behaviour_monitoring.behaviour_monitoring_details from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.behaviour_monitoring_details order by count ( * ) desc limit 1
select behaviour_monitoring_details , count ( * ) from behaviour_monitoring group by behaviour_monitoring_details having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from behaviour_monitoring group by behaviour_monitoring_details ) )
select s.bio_data , s.student_details from students s where s.student_id in ( select a.student_id from behaviour_monitoring a group by a.student_id having count ( a.behaviour_monitoring_id ) = ( select max ( cnt ) from ( select count ( student_id ) as cnt from behaviour_monitoring group by student_id ) ) )
select s.bio_data , s.student_details from students s where exists ( select 1 from behaviour_monitoring bm where bm.student_id = s.student_id group by bm.student_id having count ( * ) = ( select max ( c ) from ( select count ( * ) as c from behaviour_monitoring group by student_id ) ) )
select students.bio_data from students join behaviour_monitoring on students.student_id = behaviour_monitoring.student_id order by behaviour_monitoring.behaviour_monitoring_details desc limit 1
select bio_data from students where student_id in ( select student_id from behaviour_monitoring group by student_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from behaviour_monitoring group by student_id ) ) )
select students.bio_data , student_events.event_date from student_events join students on student_events.student_id = students.student_id
select students.bio_data , student_events.event_date from students join student_events on student_events.student_id = students.student_id
select count ( distinct student_id ) , ref_event_types.event_type_description , student_events.event_type_code from student_events join ref_event_types on student_events.event_type_code = ref_event_types.event_type_code group by student_events.event_type_code order by count ( * ) desc limit 1
select event_type_code , count ( distinct student_id ) as student_count from student_events group by event_type_code having student_count = ( select max ( num_students ) from ( select count ( distinct student_id ) as num_students from student_events group by event_type_code ) )
select achievement_details , achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select achievements.achievement_details , ref_achievement_type.achievement_type_description from ref_achievement_type join achievements on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select count ( distinct teacher_id ) from classes where student_id not in ( select student_id from achievements )
select count ( distinct teacher_id ) from classes where student_id not in ( select student_id from achievements )
select date_of_transcript , transcript_details from transcripts
select date_of_transcript , transcript_details from transcripts
select achievement_type_code , achievement_details , date_achievement from achievements
select achievement_type_code , achievement_details , date_achievement from achievements
select datetime_detention_start , datetime_detention_end from detention
select datetime_detention_start , datetime_detention_end from detention
select bio_data from students where student_details like '%Suite%' or student_details is null
select bio_data from students where instr ( student_details , 'Suite' ) > 0
select teachers.teacher_details , students.student_details from classes join teachers on classes.teacher_id = teachers.teacher_id join students on classes.student_id = students.student_id group by teachers.teacher_id
select teachers.teacher_details , students.student_details from classes join teachers on classes.teacher_id = teachers.teacher_id join students on classes.student_id = students.student_id group by teachers.teacher_details having count ( * ) = 1
select classes.teacher_id , count ( * ) from classes join teachers on classes.teacher_id = teachers.teacher_id group by classes.teacher_id order by count ( * ) desc limit 1
select teachers.teacher_id , count ( * ) from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count ( * ) desc limit 1
select s.student_id , count ( c.class_id ) as total_courses from students s join classes c on s.student_id = c.student_id group by s.student_id having total_courses = ( select max ( total_courses ) from ( select count ( class_id ) as total_courses from classes group by student_id ) )
select students.student_id , count ( * ) from classes join students on classes.student_id = students.student_id group by students.student_id order by count ( * ) desc limit 1
select students.student_id , students.student_details from classes join students on classes.student_id = students.student_id group by classes.student_id having count ( * ) = 2
select students.student_id , students.student_details from classes join students on classes.student_id = students.student_id group by classes.student_id having count ( * ) = 2
select detention.detention_type_code , ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count ( * ) asc limit 1
select detention.detention_type_code , ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count ( * ) asc limit 1
select s.bio_data , s.student_details from students s where exists ( select 1 from student_loans sl where sl.student_id = s.student_id and sl.amount_of_loan > ( select avg ( amount_of_loan ) from student_loans ) )
select students.bio_data , students.student_details from students join student_loans on students.student_id = student_loans.student_id where student_loans.amount_of_loan > ( select avg ( amount_of_loan ) from student_loans )
select date_of_loan from ( select date_of_loan , min ( date_of_loan ) as date_of_loan from student_loans ) where date_of_loan = ( select min ( date_of_loan ) from student_loans )
select date_of_loan from ( select date_of_loan , date_of_loan from student_loans order by date_of_loan asc limit 1 )
select s.bio_data from students s where exists ( select 1 from student_loans sl where sl.student_id = s.student_id and sl.amount_of_loan = ( select min ( amount_of_loan ) from student_loans ) )
select s.bio_data from students s where exists ( select 1 from student_loans sl where sl.student_id = s.student_id and sl.amount_of_loan = ( select min ( amount_of_loan ) from student_loans ) )
select transcripts.date_of_transcript from transcripts join student_loans on transcripts.student_id = student_loans.student_id where student_loans.amount_of_loan = ( select max ( amount_of_loan ) from student_loans )
select t.date_of_transcript from transcripts t join student_loans sl on t.student_id = sl.student_id where sl.amount_of_loan = ( select max ( amount_of_loan ) from student_loans )
select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id join transcripts on transcripts.student_id = classes.student_id order by transcripts.date_of_transcript asc limit 1
select distinct t.teacher_details from teachers t inner join classes c on t.teacher_id = c.teacher_id inner join transcripts t on c.student_id = t.student_id where t.date_of_transcript = ( select min ( date_of_transcript ) from transcripts )
select s.student_id , sum ( sl.amount_of_loan ) as total_loan from students s join student_loans sl on s.student_id = sl.student_id group by s.student_id
select s.student_id , sum ( l.amount_of_loan ) as total_loan_amount from students s join student_loans l on s.student_id = l.student_id group by s.student_id
select student_id , bio_data , ( select count ( * ) from classes where classes.student_id = students.student_id ) as total_courses from students
select students.student_id , students.bio_data , count ( classes.class_id ) as numberofcourses from students left join classes on students.student_id = classes.student_id group by students.student_id
select count ( distinct student_id ) from detention
select count ( distinct student_id ) from detention
select students_addresses.address_type_code , ref_address_types.address_type_description from ref_address_types join students_addresses on ref_address_types.address_type_code = students_addresses.address_type_code group by students_addresses.address_type_code order by count ( *) desc limit 1
select students_addresses.address_type_code , ref_address_types.address_type_description from students_addresses join addresses on students_addresses.address_id = addresses.address_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students_addresses.address_type_code order by count ( * ) desc limit 1
select bio_data from students where student_id in ( select student_id from student_events except select student_id from student_loans )
select bio_data from students where student_id in ( select student_id from student_events except select student_id from student_loans )
select students_addresses.date_from , students_addresses.date_to from students join students_addresses on students.student_id = students_addresses.student_id join transcripts on students.student_id = transcripts.student_id group by students.student_id having count ( * ) = 2
select students_addresses.date_from , students_addresses.date_to from students join students_addresses on students.student_id = students_addresses.student_id join transcripts on students_addresses.address_id = transcripts.transcript_id group by students_addresses.student_id having count ( * ) = 2
select datetime_detention_start from detention where datetime_detention_start is not null
select datetime_detention_start from detention
select name from ( select name as name , idauthor from author ) as c
select name from author
select name , address from client where address is not null
Select name , address from client
Select title , isbn , saleprice from book
Select title , isbn , saleprice from book
select count ( * ) from book
select count ( * ) from book
select count ( * ) from author
select count ( * ) from author
select count ( * ) from client
select count ( * ) from client
select name , address from client order by name Asc
Select name , address from client order by name asc
select book.title , author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select book.title , author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select idorder , client.name from orders join client on orders.idclient = client.idclient
select orders.idorder , client.name from orders join client on orders.idclient = client.idclient
select name , ( select count ( * ) from author_book where author = author.idauthor ) as total_books from author
select name , count ( * ) from author join author_book on author.idauthor = author_book.author group by author.idauthor
select book.isbn , count ( * ) from book join books_order on book.isbn = books_order.isbn group by book.isbn
select isbn , ( select count ( * ) from books_order where books_order.isbn = book.isbn ) as ordercount from book
select isbn , sum ( amount ) from books_order group by isbn
select isbn , sum ( amount ) from books_order group by isbn
select book.title from book join ( select isbn from books_order group by isbn having count ( idorder ) = ( select max ( cnt ) from ( select count ( idorder ) as cnt from books_order group by isbn ) ) ) as maxorders on book.isbn = maxorders.isbn
select title from book join ( select isbn from books_order group by isbn having count ( isbn ) = ( select max ( cnt ) from ( select count ( idorder ) as cnt from books_order group by isbn ) ) ) as maxorders on book.isbn = maxorders.isbn
select b.title , b.purchaseprice from book b where exists ( select 1 from books_order bo where bo.isbn = b.isbn group by bo.isbn having sum ( amount ) = ( select max ( total ) from ( select sum ( amount ) as total from books_order group by isbn ) ) )
select book.title , book.purchaseprice from book join books_order on book.isbn = books_order.isbn group by books_order.isbn order by sum ( books_order.amount ) desc limit 1
select book.title from books_order join book on books_order.isbn = book.isbn join orders on books_order.idorder = orders.idorder
select distinct book.title from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn
select name from client where idclient in ( select idclient from orders group by idclient having count ( * ) >= 1 )
select distinct client.name from orders join client on orders.idclient = client.idclient
select name , ( select count ( * ) from orders where orders.idclient = client.idclient ) as ordercount from client
select name , ( select count ( * ) from orders where orders.idclient = client.idclient ) as ordercount from client
select name from client where idclient in ( select idclient from orders group by idclient having count ( * ) = ( select max ( counted ) from ( select count ( * ) as counted from orders group by idclient ) ) )
select c.name from client c where c.idclient in ( select o.idclient from orders o group by o.idclient having count ( o.idorder ) = ( select max ( counts ) from ( select count ( idorder ) as counts from orders group by idclient ) ) )
select client.name , sum ( books_order.amount ) from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name , sum ( books_order.amount ) from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient order by sum ( amount ) desc limit 1
select client.name from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient order by sum ( amount ) desc limit 1
select title from book where isbn not in ( select isbn from books_order )
select title from book where isbn not in ( select isbn from books_order )
select name from client where idclient not in ( select o.idclient from orders o )
select name from client where idclient not in ( select o.idclient from orders o group by o.idorder having count ( o.idorder ) > 0 )
select max ( saleprice ) as max_saleprice , min ( saleprice ) as min_saleprice from book
select max ( saleprice ) , min ( saleprice ) from book
select avg (purchaseprice ) , avg ( saleprice ) from book
select avg (purchaseprice ) , avg ( saleprice ) from book
select max ( saleprice - purchaseprice ) from ( select saleprice , purchaseprice from book )
select saleprice from book where purchaseprice = ( select max ( saleprice ) from book )
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice = ( select min ( saleprice ) from book )
select title from book where saleprice = ( select min ( saleprice ) from book )
select title from book where purchaseprice = ( select max ( purchaseprice ) from book )
select b.title from book as b where b.purchaseprice = ( select max ( purchaseprice ) from book )
select avg ( book.saleprice ) from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select avg ( book.saleprice ) from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select book.saleprice from book join author_book on book.isbn = author_book.isbn where author_book.author = 'Plastico'
select book.saleprice from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'Plato'
sql placeholder
select title from book where author = 'George Orwell' and saleprice = ( select min ( saleprice ) from book where author = 'George Orwell' ) and title
select title from book where author = 'Plato' and saleprice < ( select avg ( saleprice ) from book )
select book.title from book join author_book on book.isbn = author_book.isbn where author_book.author = 'Plato' and book.saleprice < ( select avg ( saleprice ) from book where author_book.author = 'Plato' )
select name from author where idauthor in ( select author_book.author from author_book join book on author_book.isbn = book.isbn where book.title = 'Pride and Prejudice' )
select name from author where idauthor in ( select author_book.author from author_book join book on author_book.isbn = book.isbn where book.title = 'Pride and Prejudice' )
select book.title from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select book.title from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select count ( * ) from books_order join orders on books_order.idorder = orders.idorder join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice'
select count ( * ) from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice'
select idorder from books_order join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice' intersect select idorder from books_order join book on books_order.isbn = book.isbn where book.title = 'The Little Prince'
sql placeholder
select books_order.isbn from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient where client.name = 'Peter Doe' intersect select books_order.isbn from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient where client.name = 'James Smith'
select books_order.isbn from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient where client.name = 'Peter Doe' intersect select books_order.isbn from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient where client.name = 'James Smith'
select title from book where isbn in ( select isbn from books_order join orders on books_order.idorder = orders.idorder where orders.idclient = 'Peter Doe' except select book.title from books_order join orders on books_order.idorder = orders.idorder where orders.idclient = 'James Smith' )
sql placeholder
select name from client where idclient in ( select idclient from orders where idorder = 'Pride and Prejudice' )
select name from client where idclient in ( select idclient from orders where idorder = 'Pride and Prejudice' )
select count ( * ) from book
select title from book order by title asc , title asc
select title from book order by pages desc
select type , release from book
select max ( chapters ) , min ( chapters ) from book
select title from book where type != 'Poet'
select avg ( rating ) from review
select book.title , review.rating from book join review on book.Book_id = review.book_id
select review.rating from book join review on book.book_id = review.book_id where book.chapters = ( select max ( chapters ) from book )
select r.rank from review r inner join book b on r.book_id = b.book_id where b.pages = ( select min ( pages ) from book )
select title from book where book_id in ( select book_id from review where rank = ( select max ( rank ) from review ) )
select avg ( review.readers_in_million ) from book join review on book.book_id = review.book_id where book.type = 'Novel'
select ( type ) , count ( * ) from book group by type
select type from book group by type having count ( type ) = ( select max ( count ) from ( select count ( type ) as count from book group by type ) )
select type from book group by type having count ( * ) >= 3
select book.title from book join review on book.book_id = review.book_id order by review.rating asc
select book.title , book.audio from review join book on review.book_id = book.book_id order by review.readers_in_million desc
select count ( * ) from book where book_id not in ( select book_id from review )
select type from book where chapters > 75 intersect select type from book where chapters < 50
select count ( distinct type ) from book
select type , title from book where book_id not in ( select book_id from review )
select count ( * ) from customer
select count ( * ) from customer
select name from customer order by level_of_membership asc , name
select name from customer order by level_of_membership asc
select nationality , card_credit from customer
select nationality , card_credit from customer
select name from customer where nationality = 'England' or nationality = 'Australia'
select name from customer where nationality = 'England' or nationality = 'Australia'
select avg ( card_credit ) from customer where level_of_membership >1
select avg ( card_credit ) from customer where level_of_membership > 1
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select nationality as nationality , count ( * ) from customer group by nationality
select nationality , count ( * ) from customer group by nationality
select nationality from customer group by nationality having count ( nationality ) = ( select max ( count_national ) from ( select nationality , count ( nationality ) as count_national from customer group by nationality ) as stats )
with nationalitycounts as ( select nationality , count ( customer_id ) as count from customer group by nationality ) select nationality from nationalitycounts where count = ( select max ( count ) from nationalitycounts )
select nationality from customer where card_credit <= 50 intersect select nationality from customer where card_credit > 75
select nationality from customer group by nationality having max ( card_credit ) > 50 and min ( card_credit ) < 75
select customer.name , dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name , dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name , customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name , dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by quantity desc
select customer.name , sum ( customer_order.quantity ) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id
select customer.name , sum ( customer_order.quantity ) from customer join customer_order on customer.customer_id = customer_order.customer_id group by customer.customer_id
select customer.name from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id having sum ( customer_order.quantity ) > 1
select name from customer where customer_id in ( select customer_id from customer_order group by customer_id having sum ( quantity ) > 1 )
select distinct manager from branch
select distinct manager from branch
select name from customer where customer_id not in ( select customer_id from customer_order )
select name from customer where customer_id not in ( select customer_id from customer_order )
select count ( * ) from member
select name from member order by age asc
Select name , nationality from member
select name from member where nationality != 'England'
select name from member where age = 19 or age = 20
select name from member where age = ( select max ( age ) from member )
select nationality as nationality , count ( * ) from member group by nationality
select nationality from member group by nationality having count ( nationality ) = ( select max ( count ) from ( select count ( nationality ) as count from member group by nationality ) as cnt )
select nationality from member group by nationality having count ( * ) >=2
sql placeholder
select m.name from member m where exists ( select 1 from club c join club_leader cl on c.club_id = cl.club_id where cl.member_id = m.member_id and c.overall_ranking > 100 )
select m.name from member m where exists ( select 1 from club_leader cl where cl.member_id = m.member_id and cl.year_join < 2018 )
select m.name from member m where exists ( select 1 from club_leader cl join club c on cl.club_id = c.club_id where m.member_id = cl.member_id and c.club_name = 'Houston' )
select name from member where member_id not in ( select member_id from club_leader )
select nationality from member where ( age > 22 ) intersect select nationality from member where ( age < 19 )
select avg ( age ) from club_leader join member on club_leader.member_id = member.member_id
Select club_name from club where club_name like '%state%'
select collection_subset_name from collection_subsets
select collection_subset_name from collection_subsets
select collecrtion_subset_details from collection_subsets where collection_subset_name = 'Top collection'
sql placeholder
select document_subset_name from document_subsets
select document_subset_name from document_subsets
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000' or document_subset_name = 'Best for 2000'
sql placeholder
select document_object_id from document_objects
select parent_document_object_id from document_objects where owner = 'Marlin'
select document_object_id from document_objects where owner = 'Marlin'
select owner from document_objects where description = 'Braeden Collection'
select document_objects.owner from document_objects join documents_in_collections on document_objects.document_object_id = documents_in_collections.document_object_id join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Braeden Collection'
select owner from document_objects where parent_document_object_id = ( select document_object_id from document_objects where owner = 'Marlin' )
select owner from document_objects where owner = 'Marlin'
select distinct description from document_objects where parent_document_object_id = document_objects.document_object_id
select description from document_objects group by parent_document_object_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from document_objects group by parent_document_object_id ) )
select count ( * ) from document_objects where owner = 'Marlin'
select count ( distinct document_object_id ) from document_objects where owner = 'Marlin'
select document_object_id from document_objects except select parent_document_object_id from document_objects
select document_object_id from document_objects except select parent_document_object_id from document_objects
select parent_document_object_id , count ( * ) from document_objects group by parent_document_object_id
sql placeholder
select collection_name from collections
select collection_name from collections
select collection_description from collections where collection_name = 'Best'
select collection_description from collections where collection_name = 'Best'
select c.collection_name from collections c where exists ( select 1 from collections c2 where c2.collection_name = 'Nice' and c2.parent_collection_id = c.parent_collection_id )
select c.collection_name from collections c where exists ( select 1 from collections c2 where c2.collection_name = 'Nice' and c.parent_collection_id = c2.collection_id and c.collection_name = 'Nice' )
select collection_name from collections where collection_id not in ( select parent_collection_id from collections )
select collection_name from collections where collection_id != ( select parent_collection_id from collections )
sql placeholder
select document_object_id from document_subset_members group by document_object_id having count ( * ) > 1
select count ( c.collection_id ) from collections c where c.collection_name = 'Best'
select count ( sub.collection_id ) from collections sub join collections c on c.collection_id = sub.collection_id where c.collection_name = 'Best'
select document_object_id from document_objects where owner = 'Ransom'
select document_object_id from document_objects where owner = 'Ransom'
select collection_subset_id , collection_subset_name , count ( * ) from collection_subsets group by collection_subset_id
sql placeholder
sql placeholder
select document_object_id , count ( * ) from document_objects group by document_object_id
sql placeholder
select document_object_id from ( select document_object_id , count ( * ) as cnt from documents_in_collections group by document_object_id ) where cnt = ( select min ( cnt ) from ( select count ( * ) as cnt from documents_in_collections group by document_object_id ) )
sql placeholder
select document_object_id , count ( * ) from document_subset_members group by document_object_id having count ( * ) between 2 and 4
select owner from document_objects where document_object_id in ( select related_document_object_id from document_subset_members where owner = 'Braeden' )
select distinct document_objects.owner from document_objects join document_subset_members on document_objects.document_object_id = document_subset_members.related_document_object_id where document_objects.owner = 'Braeden'
select distinct document_subset_name from document_subsets join document_objects on document_subsets.document_subset_id = document_subsets.document_subset_id where document_objects.owner = 'Braeden'
select distinct document_subset_name from document_objects join document_subsets on document_objects.document_object_id = document_subsets.document_subset_id where document_objects.owner = 'Breaeden'
sql placeholder
sql placeholder
select document_subset_id , document_subset_name , count ( * ) from document_subsets group by document_subsets.document_subset_id order by count ( * ) desc limit 1
sql placeholder
select document_subset_id from document_subsets where document_subset_name = 'Best For 2000'
select document_subset_id from document_subsets where document_subset_name = 'Best For 2000'
sql placeholder
sql placeholder
select collection_name from collections where collection_id in ( select documents_in_collections.collection_id from documents_in_collections join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = 'Ransom' )
select collections.collection_name from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = 'Ransom'
select count ( * ) , document_object_id from documents_in_collections group by document_object_id
select document_object_id , count ( distinct collection_id ) from documents_in_collections group by document_object_id
select count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id where collections.collection_name = 'Best' or documents_in_collections.collection_id is null
select count ( * ) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select count ( distinct d.document_object_id ) from documents_in_collections d inner join collections c on d.collection_id = c.collection_id where c.collection_name = 'Best'
select collections.collection_name , collections.collection_id , count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id group by collections.collection_id order by count ( * ) desc limit 1
select collections.collection_name , collections.collection_id , count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id where collections.collection_name = 'Best' group by collections.collection_id order by count ( * ) desc limit 1
sql placeholder
sql placeholder
sql placeholder
select distinct document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best' except select distinct document_object_id from document_subset_members where document_subset_members.document_subset_id = 'Best for 2000'
sql placeholder
sql placeholder
select collections.collection_name from collections join collection_subset_members on collections.collection_id = collection_subset_members.related_collection_id where collections.collection_name like 'Best%'
select c.collection_name from collections c where exists ( select 1 from collection_subset_members csm where csm.collection_id = c.collection_id and c.collection_name = 'Best' )
select count ( distinct csm.related_collection_id ) from collection_subset_members csm join collections c on csm.collection_id = c.collection_id where c.collection_name = 'Best'
select count ( distinct collection_subset_members.related_collection_id ) from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id where collections.collection_name = 'Best'
select collection_subset_name from collections join collection_subsets on collections.collection_id = collection_subsets.collection_subset_id where collections.collection_name = 'Best'
sql placeholder
select count ( * ) from songs where instr ( name , 'Love' ) > 0
select name from songs order by name asc , language asc
select name , language from songs
select max ( voice_sound_quality ) as max_score , min ( voice_sound_quality ) as min_score from performance_score
select performance_score.voice_sound_quality , performance_score.rhythm_tempo , performance_score.stage_presence from performance_score join participants on performance_score.participant_id = participants.id where participants.name = 'Freeway'
select id , original_artist , language from songs where name != 'Love'
select name , original_artist from Songs where english_translation = 'All the streets of love'
select distinct performance_score.stage_presence from performance_score join songs on performance_score.Songs_id = songs.id where songs.language = 'English'
select participants.id , participants.name from performance_score join participants on performance_score.participant_id = participants.id group by participant_id having count ( * ) >= 2
select p.id , p.name , p.popularity from participants p where p.id in ( select participant_id from performance_score group by participant_id order by count ( * ) desc )
select id , name from participants where id in ( select participant_id from performance_score where voice_sound_quality = '5' or rhythm_tempo = '5' )
select performance_score.voice_sound_quality from performance_score join songs on performance_score.songs_id = songs.id where songs.name = 'The Balkan Girls' and songs.language = 'english_translation'
select performance_score.songs_id , songs.name from performance_score join songs on performance_score.songs_id = songs.id group by songs.id order by count ( * ) desc limit 1
select count ( * ) from performance_score where stage_presence < 7 or stage_presence > 9
select count ( * ) from songs where id not in ( select distinct songs_id from performance_score )
select avg ( rhythm_tempo ) , language from performance_score join songs on performance_score.songs_id = songs.id group by language
select distinct participants.name from performance_score join participants on performance_score.participant_id = participants.id join songs on songs.id = performance_score.songs_id where songs.language = 'English'
select name , popularity from participants where id in ( select participant_id from performance_score join songs on performance_score.songs_id = songs.id where language = 'Croatian' ) and id in ( select participant_id from performance_score join songs on performance_score.songs_id = songs.id where language = 'English' )
select name from songs where instr ( name , 'Is' ) > 0
sql placeholder
select count ( * ) from city
select count ( * ) from city
select distinct state from city
select distinct state from city
select count ( distinct country ) from city
select count ( * ) from city
select city_name , city_code , state , country from city
select city.city_name , city.city_code , city.state , city.country from city
select latitude , longitude from city where city_name = 'Baltimore'
select latitude , longitude from city where city_name = 'Baltimore'
select city_name from city where state = 'PA' and city_name is not null
Select city_name from city where state = 'PA'
select count ( * ) from city where country = 'Canada'
select count ( * ) from city where country = 'Canada'
select city_name from city where country = 'USA' order by latitude asc
select city_name from city where country = 'USA' order by latitude asc
select state , count ( * ) from city group by state
select state , count ( * ) from city group by state
select country , count ( * ) from city group by country
select count ( * ) , country from City group by country
select state from city group by state having count ( * ) >= 2
select distinct state from city group by state having count ( * ) >= 2
select c.state from city c group by c.state having count ( c.city_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from city group by state ) )
select c.state from city c group by c.state having count ( c.city_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from city group by state ) )
with citycounts as ( select country , count ( * ) as cnt from city group by country ) select country from citycounts where cnt = ( select min ( cnt ) from citycounts )
select country from city group by country having count ( city_code ) = ( select min ( cnt ) from ( select count ( * ) as cnt from city group by country ) )
select fname , lname from student where exists ( select 1 from city where city.city_code = student.city_code and city.state = 'MD' )
sql placeholder
select count ( * ) from student join city on student.city_code = city.city_code where city.country = 'China'
select count ( * ) from student where city_code in ( select city_code from city where country = 'China' )
select student.fname , student.major from student join city on student.city_code = city.city_code where city.city_name = 'Baltimore'
select student.fname , student.major from student join city on student.city_code = city.city_code where city.city_name = 'Baltimore'
select city.country , count ( * ) from city join student on city.city_code = student.city_code group by country
select country , count ( * ) from city join student on city.city_code = student.city_code group by country
select count ( * ) , city_name from city join student on city.city_code = student.city_code group by city.city_name
select city.city_name , count ( * ) from city join student on city.city_code = student.city_code group by city.city_code
select c.state from city c join student s on c.city_code = s.city_code group by c.state having count ( s.sex ) = ( select max ( student_count ) from ( select count ( * ) as student_count from student group by city_code ) )
select c.state from city c join student s on c.city_code = s.city_code group by c.state having count ( s.city_code ) = ( select max ( count ) from ( select count ( city_code ) as count from student group by city_code ) )
with studentcounts as ( select country , count ( * ) as num_students from city group by country ) select country from studentcounts where num_students = ( select min ( num_students ) from studentcounts )
select c.country from city c join student s on c.city_code = s.city_code group by c.country order by count ( s.sex ) asc limit 1
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count ( * ) >= 3
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count ( * ) >= 3
select city.state from city join student on city.city_code = student.city_code group by city.state having count ( * ) > 5
select city.state from city join student on city.city_code = student.city_code group by city.state having count ( * ) > 5
select stuid from student where city_code not in ( select city_code from city where country = 'USA' )
select stuid from student where city_code not in ( select c.city_code from city c join student s on c.city_code = s.city_code where c.country = 'USA' )
select stuid from student where sex = 'F' and city_code in ( select city_code from city where state = 'PA' ) and sex = 'F'
select student.stuid from city join student on city.city_code = student.city_code where city.state = 'PA' and student.sex = 'F'
select student.stuid from city join student on city.city_code = student.city_code where city.country != 'USA' and student.sex = 'M'
select stuid from student where sex = 'M' except select stuid from student join city on student.city_code = city.city_code where city.country = 'USA'
select distance from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL' and city.city_name = 'CHI'
select distance from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL' and city.city_name = 'CHI'
select distance from direct_distance join city on direct_distance.city2_code = city.city_code where city.city_name = 'Boston' and city.city_name = 'Newark'
select distance from direct_distance where city2_code in ( select city_code from city where city_name = 'Boston' or city_name = 'Newark' )
select avg ( distance ) , min ( distance ) , max ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code
select avg ( distance ) , min ( distance ) , max ( distance ) from direct_distance
select city_code from city where city_code in ( select city2_code from direct_distance group by city2_code having max ( distance ) )
select c.city_code from city c inner join direct_distance dd on c.city_code = dd.city1_code where dd.distance = ( select max ( distance ) from direct_distance )
select city.city_code from city join direct_distance on city.city_code = direct_distance.city2_code where direct_distance.distance > ( select avg ( distance ) from direct_distance ) group by city.city_code having count ( city_code ) > 0
select c.city_code from city c join direct_distance dd on c.city_code = dd.city1_code where dd.distance > ( select avg ( distance ) from direct_distance )
select city_code from city where city_code in ( select city2_code from direct_distance where distance < 1000 )
select c.city_code from city c join direct_distance d on c.city_code = d.city1_code where d.distance < 1000
select sum ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL'
select sum ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL'
select avg ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'Boston' or city.city_name = 'Boston'
select avg ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'Boston' or city.city_name = 'Boston'
sql placeholder
select city_name from city where city_code = ( select min ( direct_distance.city2_code ) from direct_distance join city on direct_distance.city1_code = city.city_code where city.city_name = 'Chicago' )
sql placeholder
sql placeholder
select c.city_code , sum ( d.distance ) as total_distance from city c join direct_distance d on c.city_code = d.city1_code group by c.city_code
select city.city_code , sum ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_code
select city.city_name , avg ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city2_code group by city.city_code
select city.city_name , avg ( direct_distance.distance ) as avg_distance from city left join direct_distance on city.city_code = direct_distance.city2_code group by city.city_code
select distance from student join direct_distance on student.city_code = direct_distance.city1_code join city on direct_distance.city2_code = city.city_code where student.fname = 'Linda' and student.lname = 'Smith'
select distance from direct_distance join city on direct_distance.city1_code = city.city_code join student on city.city_code = student.city_code where student.fname = 'Linda' and student.lname = 'Smith' intersect select distance from direct_distance join city on direct_distance.city2_code = city.city_code join student on direct_distance.city1_code = city.city_code where student.fname = 'Tracy' and student.lname = 'Kim'
select s.fname , s.lname from student s where exists ( select 1 from direct_distance d where d.city1_code = s.city_code and s.fname = 'Linda' ) and exists ( select 1 from direct_distance d where d.city1_code = s.city_code and s.fname = 'Smith' )
sql placeholder
select city.state from city join student on city.city_code = student.city_code where student.fname = 'Linda'
select city.state from city join student on city.city_code = student.city_code where student.fname = 'Linda'
select * from sailors where age > 30
select * from sailors where age > 30
select name , age from sailors where age < 30
select name , age from sailors where age < 30
select b.name from boats b inner join reserves r on b.bid = r.bid inner join sailors s on r.sid = s.sid where s.name = '1'
select distinct r.bid from reserves r join sailors sa on r.sid = sa.sid where sa.sid = 1
select name from boats where name = '102'
select name from sailors where sid in ( select sid from reserves where bid = 102 )
select bid from reserves group by bid having count ( distinct bid ) = ( select max ( cnt ) from ( select count ( distinct bid ) as cnt from reserves group by bid ) )
select r.bid from reserves r left join boats b on r.bid = b.bid group by r.bid
select name from sailors where name like '%e%'
select s.name from sailors s where s.name like '%e%'
select distinct sa.sid from sailors sa where sa.age > ( select max ( age ) from sailors )
select distinct s.sid from sailors s where s.age != ( select min ( age ) from sailors )
select distinct name from sailors where age > ( select max ( age ) from sailors where rating > 7 )
select distinct name from sailors where age > ( select min ( age ) from sailors where rating > 7 )
select sailors.name , reserves.sid from sailors join reserves on sailors.sid = reserves.sid group by reserves.sid having count ( * ) >= 1
select sailors.name , sailors.sid from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count ( * ) >= 1
select sailors.sid , sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count ( * ) > 1
select distinct sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count ( distinct reserves.bid ) >= 2
select s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'red' or b.color = 'blue'
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'red' or b.color = 'blue'
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'red' or color = 'blue' ) )
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'red' or color = 'blue' ) )
select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' intersect select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'blue'
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ('red' , 'blue' ) group by s.sid having count ( distinct b.color ) = 2
select sailors.name , sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = 'red' intersect select sailors.name , sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = 'blue'
select name , sid from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' or boats.color = 'blue' )
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select name , sid from sailors where sid not in ( select distinct sid from reserves )
select name , sid from sailors where sid not in ( select distinct sid from reserves )
select sid from sailors except select sid from reserves
select sid from sailors except select s.sid from sailors s join reserves r on s.sid = r.sid where r.bid in ( select b.bid from boats b group by b.bid )
select sailors.name from reserves join sailors on reserves.sid = sailors.sid where reserves.bid = 103
select name from sailors where sid in ( select sid from reserves where bid = 103 )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select s1.name from sailors s1 where s1.rating > ( select max ( s2.rating ) from sailors s2 where s2.name = 'Luis' )
select s1.name from sailors s1 where s1.rating > ( select max ( s2.rating ) from sailors s2 where s2.name = 'Luis' )
sql placeholder
select name , sid from sailors where rating >= 3 and sid in ( select sid from reserves where rating >= 3 )
select name , age from sailors where age = ( select max ( age ) from sailors )
select sa.name , sa.age from sailors sa where sa.age = ( select max ( age ) from sailors )
select count ( * ) from sailors
select count ( * ) from sailors
select avg ( age ) from sailors where rating = 7
select avg ( age ) from sailors where rating = 7.
select count ( * ) from sailors where name like 'D0%'
select count ( * ) from sailors where name like 'D0%'
select max ( rating ) , avg ( age ) from sailors
select avg ( rating ) , max ( age ) from sailors
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.name
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.name
select bid , count ( * ) from reserves where bid > 50 group by bid
select boats.name , count ( * ) from boats join reserves on boats.bid = reserves.bid where reserves.bid > 50 group by boats.bid
select boats.name , count ( * ) from boats join reserves on boats.bid = reserves.bid group by boats.bid having count ( * ) > 1
select boats.name , count ( * ) from boats join reserves on boats.bid = reserves.bid group by boats.bid having count ( * ) > 1
select count ( * ) , boats.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.sid > 1 group by boats.name
select boats.name , count ( * ) from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.sid > 1 group by sailors.sid
select avg ( age ) , rating from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' ) group by rating
select rating , avg ( age ) from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' ) group by rating
select name , rating , age from sailors order by rating asc , age
select name , rating , age from ( select name , rating , age from sailors order by rating asc , age ) as z
select count ( * ) from boats
select count ( * ) from boats
select count ( * ) from boats where color like'red'
select count ( * ) from boats where color = 'red'
select boats.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.age between 20 and 30
select boats.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.age between 20 and 30
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.rating > ( select max ( rating ) from sailors where boats.color = 'Red' )
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.rating > ( select max ( rating ) from sailors where boats.color = 'Red' )
select max ( rating ) from sailors group by rating order by max ( rating ) desc limit 1
select max ( rating ) from sailors
select name from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where name = 'Melon' ) )
select name from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where name = 'Melon' ) )
select name , age from sailors order by rating desc
select name , age from sailors order by rating desc
select model from headphone where price = ( select max ( price ) from headphone )
select model from ( select model , max ( price ) as max_price from headphone group by model ) where max_price = ( select max ( price ) from headphone )
select distinct model from headphone order by model asc
select distinct model from headphone order by model asc
select h.class from headphone h group by h.class having count ( h.class ) = ( select max ( cnt ) from ( select count ( * ) as cnt from headphone group by class ) )
select class from headphone group by class having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from headphone group by class ) )
select class from headphone group by class having count ( * ) > 2
select class from headphone group by class having count ( * ) <= 2
select count ( * ) , class from headphone where price > 200 group by class
select count ( * ) , class from headphone where price > 200 group by class
select count ( distinct earpads ) from headphone
select count ( distinct earpads ) from headphone
select earpads from ( select earpads , rank ( ) over ( order by count ( * ) desc ) as rank from headphone group by earpads ) where rank <= 2
with earcount as ( select earpads , count ( * ) as count from headphone group by earpads ) select earpads from earcount where count <= 2 order by count desc limit 2
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select avg ( price ) , construction from headphone group by construction
select avg ( price ) , construction from headphone group by construction
select headphone.class from headphone where earpads = 'Bowls' intersect select headphone.class from headphone where earpads = 'Comfort Pads'
select headphone.class from headphone where earpads = 'Bowls' intersect select headphone.class from headphone where earpads = 'Comfort Pads'
select distinct earpads from headphone except select distinct earpads from headphone where construction = 'Plastic'
select earpads from headphone where construction != 'Plastic'
select model from headphone where price < ( select avg ( price ) from headphone )
select model from headphone where price < ( select avg ( price ) from headphone )
select name from store order by date_opened asc
select name from store order by date_opened asc
select name , parking from store where neighborhood = 'Tarzana'
Select name , parking from store where neighborhood = 'Tarzana'
select count ( distinct neighborhood ) from store
select count ( distinct neighborhood ) from store
select count ( * ) , neighborhood from store group by neighborhood
select count ( * ) , neighborhood from store group by neighborhood
select store.name , count ( * ) from stock join store on stock.store_id = store.store_id group by stock.store_id order by count ( * ) desc limit 1
select store.name , sum ( stock.quantity ) from store join stock on store.store_id = stock.store_id group by store.store_id
select name from store where store_id not in ( select distinct store_id from stock where headphone_id = stock.headphone_id )
select name from store where store_id not in ( select distinct store_id from stock where quantity > 0 )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by headphone.model order by sum ( stock.quantity ) desc limit 1
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by headphone.model order by sum ( stock.quantity ) desc limit 1
select count ( * ) from stock join store on stock.store_id = store.store_id where store.name = 'Woodman'
select sum ( stock.quantity ) from stock join store on stock.store_id = store.store_id where store.name = 'Woodman'
select neighborhood from store except select store.neighborhood from stock join store on stock.store_id = store.store_id join headphone on headphone.headphone_id = stock.headphone_id
select neighborhood from store where store_id not in ( select store_id from stock where headphone_id = stock.headphone_id )
select count ( * ) from author
select count ( * ) from author
select count ( * ) from paper
select count ( * ) from paper
select count ( * ) from affiliation
select count ( * ) from affiliation
select count ( * ) from paper where year = 2000 and title = 'NAACL 2000'
select count ( * ) from paper where year = 2000 and year = 'NAACL 2000'
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and year = 2009
select count ( * ) from paper join author_list on paper.paper_id = author_list.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' and paper.year = 2009
select name , address from affiliation where affiliation.affiliation_id not null != 'Affiliation'
select name , address from affiliation
select venue , year from paper order by year asc
select distinct ( venue ) from paper order by year asc
select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Harvard University'
select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Harvard University'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown'
select paper.title , paper.paper_id from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Stanford University' intersect select paper.title , paper.paper_id from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University'
select title , paper_id from paper where paper_id in ( select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Stanford' intersect select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' )
sql placeholder
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' intersect select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' except select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' except select paper.title , paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' or name = 'Rambow' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' and name = 'Kathleen' ) )
select name , ( select count ( * ) from author_list where author_id = author.author_id ) as paper_count from author order by paper_count desc
select author.name , count ( * ) from author join author_list on author.author_id = author_list.author_id group by author.author_id order by count ( * ) asc
select affiliation.name from affiliation join ( select affiliation_id from author_list group by affiliation_id order by count ( paper_id ) asc ) as temp on affiliation.affiliation_id = temp.affiliation_id
select name from affiliation order by ( select count ( * ) from author_list where affiliation_id = affiliation.affiliation_id ) asc
select a.name from author a join author_list al on a.author_id = al.author_id group by a.author_id having count ( distinct al.paper_id ) > 50
select a.name from author a join author_list al on a.author_id = al.author_id group by a.author_id having count ( al.paper_id ) > 50
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count ( * ) = 1
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count ( * ) = 1
select venue , year from paper group by venue , year having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from paper group by venue ) )
select venue , year from paper group by venue , year having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from paper group by venue ) )
select venue from paper group by venue having count ( * ) = ( select min ( cnt ) from ( select count ( * ) as cnt from paper group by venue ) )
select venue from paper group by venue having count ( * ) = ( select min ( cnt ) from ( select count ( * ) as cnt from paper group by venue ) )
select count ( * ) from ( select distinct citation.paper_id from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'A00-1002' )
select count ( distinct paper.paper_id ) from paper join citation on paper.paper_id = citation.paper_id where citation.cited_paper_id = 'A00-1002'
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = ( select paper_id from paper where paper_id = 'D12-1027' )
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = ( select paper_id from paper where paper_id = 'D12-1027' )
select p.paper_id , count ( * ) as num_citations from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id having num_citations = ( select max ( num_citations ) from ( select count ( * ) as num_citations from citation group by paper_id ) )
select p.paper_id , count ( * ) as num_citations from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id having num_citations = ( select max ( num_citations ) from ( select count ( * ) as num_citations from citation group by paper_id ) )
select paper.title from paper inner join ( select paper_id from citation group by paper_id having count ( cited_paper_id ) = ( select max ( cnt ) from ( select count ( cited_paper_id ) as cnt from citation group by paper_id ) ) ) as mostcites on paper.paper_id = mostcites.paper_id
select paper.title from paper inner join ( select paper_id from citation group by paper_id having count ( cited_paper_id ) = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from citation group by paper_id ) tmp ) ) as mostcites on paper.paper_id = mostcites.paper_id
with citationcounts as ( select paper_id , count ( cited_paper_id ) as num_citations from citation group by paper_id ) select paper.title , num_citations from paper join citationcounts on paper.paper_id = citationcounts.paper_id where num_citations = ( select max ( num_citations ) from citationcounts )
sql placeholder
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count ( distinct c.paper_id ) from citation c join author_list al on c.cited_paper_id = al.paper_id join author au on al.author_id = au.author_id where au.name = 'Mckeown , Kathleen'
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select distinct paper.venue , paper.year from affiliation join paper on affiliation.affiliation_id = paper.paper_id where affiliation.name = 'Columbia University'
select venue , year from affiliation join paper on affiliation.affiliation_id = paper.paper_id where affiliation.name = 'Columbia University'
select author.name from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where paper.year = 2009 group by author.name order by count ( * ) desc limit 1
select name from author where author_id in ( select author_id from author_list where paper_id = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from author_list where paper_id = 2009 group by author_id ) ) )
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by affiliation.affiliation_id order by count ( * ) desc limit 3
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by affiliation.affiliation_id order by count ( * ) desc limit 3
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and paper.year <= 2009
select count ( * ) from paper where exists ( select * from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' and paper.year <= 2009 )
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Stanford University' and year between 2000 and 2009
select count ( * ) from paper where year between 2000 and 2009 and venue = 'Stanford University'
select paper.title from paper inner join ( select paper_id , count ( author_id ) as num_authors from author_list group by paper_id order by num_authors desc limit 1 ) as temp on paper.paper_id = temp.paper_id where num_authors = ( select max ( num_authors ) from ( select count ( author_id ) as num_authors from author_list group by paper_id ) )
select paper.title from paper inner join ( select paper_id , count ( author_id ) as num_authors from author_list group by paper_id having num_authors = ( select max ( num_authors ) from ( select count ( author_id ) as num_authors from author_list group by paper_id ) ) ) as temp on paper.paper_id = temp.paper_id
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen'
select author.name from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen' group by author.name order by count ( * ) desc limit 1
select author.name from author_list join author on author_list.author_id = author.author_id join paper on author_list.paper_id = paper.paper_id where author.name = 'Mckeown , Kathleen' group by author.author_id order by count ( * ) desc limit 1
select p.paper_id from paper as p where p.title like '%translation%'
select paper_id from paper where title like '%translation%'
select paper.paper_id , paper.title from paper left join citation on paper.paper_id = citation.paper_id except select paper.paper_id , paper.title from paper left join citation on paper.paper_id = citation.paper_id
select title , paper_id from paper where paper_id not in ( select paper_id from citation )
select name from affiliation where address like '%China%' and affiliation_id in ( select affiliation_id from author_list group by affiliation_id having count ( paper_id ) = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from author_list group by affiliation_id ) ) )
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id where affiliation.address like '%China%' group by affiliation.address order by count ( * ) desc limit 1
select count ( distinct venue ) , year from paper group by year
select venue , count ( * ) , year from paper group by venue , year
select affiliation.name , count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id
select ( select count ( * ) from author_list where affiliation_id = affiliation.affiliation_id ) as published_papers from affiliation
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select count ( * ) from author where author_id not in ( select author_id from author_list join citation on author_list.paper_id = citation.paper_id group by author_id having count ( cited_paper_id ) > 50 )
select count ( * ) from author where author_id not in ( select author_id from author_list group by author_id having count ( paper_id ) > 50 )
select distinct author.name from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where paper.year = 2009 and paper.title = 'NAACL , ACL'
select distinct a.name from author a join author_list al on a.author_id = al.author_id join paper p on al.paper_id = p.paper_id where p.year = 2009 and al.author_id in ( select author_id from author_list where paper_id = p.paper_id )
select name from author where author_id not in ( select author_id from author_list where paper_id in ( select paper_id from paper where title = 'ACL' ) )
select name from author where author_id not in ( select author_id from author_list join paper on author_list.paper_id = paper.paper_id where paper.title = 'ACL' )
select count ( * ) from conference
select count ( * ) from conference
select distinct conference_name from conference
select distinct conference_name from conference
select conference_name , year , location from conference
Select conference_name , year , location from conference
select conference_name , count ( * ) from conference group by conference_name
select conference_name , count ( * ) from conference group by conference_name
select tblp.year , count ( * ) from conference tblp left join conference c on tblp.conference_id = c.conference_id group by tblp.year
select count ( * ) , year from conference group by year having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from conference group by year ) t )
with conferencecounts as ( select year , count ( conference_id ) as num_conferences from conference group by year ) select year from conferencecounts where num_conferences = ( select min ( num_conferences ) from conferencecounts )
select year from conference group by year having count ( * ) = ( select min ( counts ) from ( select count ( * ) as counts from conference group by year ) )
select location from conference group by location having count ( * ) >= 2
select location from conference group by location having count ( * ) >= 2
Select institution_name , location , founded from institution
Select institution_name , location , founded from institution
select count ( * ) from institution where founded >= 1850 and founded <= 1900
select count ( * ) from institution where founded >= 1850 and founded <= 1900
select institution_name , location from institution where founded = ( select max (founded ) from institution )
select institution_name , location from institution where founded = ( select max (founded ) from institution )
select institution_name , ( select count ( * ) from staff where staff.institution_id = institution.institution_id ) as staff_count from institution where founded > 1800
select institution.institution_id , count ( * ) from staff join institution on staff.institution_id = institution.institution_id where institution.founded > 1800 group by institution.institution_id
select institution_name from institution where institution_id not in ( select institution_id from staff )
select institution_name from institution where institution_id not in ( select institution_id from staff )
Select name from staff where age > ( select avg ( age ) from staff )
Select name from staff where age > ( select avg ( age ) from staff )
select max ( age ) as maxage , min ( age ) as minage from staff where nationality = 'United States'
select max ( age ) as maxaage , min ( age ) as minage from staff
select conference_name from conference where conference_id in ( select conference_id from conference_participation where staff_id in ( select staff_id from staff where nationality = 'Canada' ) )
select conference_name from conference where conference_id in ( select CP.conference_id from conference_participation CP join staff s on CP.staff_id = s.staff_id where s.nationality = 'Canada' )
select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Speaker' intersect select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Sponsor'
select name from staff where staff_id in ( select staff_id from conference_participation where role = 'Speaker' intersect select staff_id from conference_participation where role = 'Sponsor' )
sql placeholder
select name from staff where staff_id in ( select staff_id from conference_participation join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = 'ACL' intersect select staff_id from conference_participation join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = 'NACCL' )
select distinct staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2003 or conference.year = 2004
select name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( 2003 , 2004 ) )
select conference.conference_name , conference.year , ( select count ( * ) from conference_participation where conference_participation.conference_id = conference.conference_id ) as number_of_participants from conference
select conference.conference_name , conference.year , count ( * ) from conference join conference_participation on conference.conference_id = conference_participation.conference_id group by conference_participation.conference_id
select conference_name from conference where conference_id in ( select conference_id from conference_participation group by conference_id order by count ( * ) desc limit 2 )
select conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference_participation.conference_id order by count ( * ) desc limit 2
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select institution_name , location from institution where institution_id not in ( select staff.institution_id from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2004 )
select institution.institution_name , institution.location from institution where institution_id not in ( select staff.institution_id from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2004 )
select pilot_name from pilotskills where age = ( select max ( age ) from pilotskills )
select pilot_name from pilotskills order by age desc limit 1
select pilot_name from pilotskills where age < ( select avg ( age ) from pilotskills ) order by age asc
select pilot_name from pilotskills where age < ( select avg ( age ) from pilotskills ) order by age asc
select * from pilotskills where age < 30
select * from pilotskills where age < 30
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age < 35
select pilot_name from pilotskills ps where ps.age < 35 and ps.plane_name = 'Piper Cub'
select location from hangar where plane_name = 'F-14 Fighter'
select location from hangar where plane_name = 'F-14 Fighter'
select count ( distinct location ) from hangar
select count ( distinct location ) from hangar
select plane_name from pilotskills where pilotskills.pilot_name = 'Jones' and age = 32
select plane_name from pilotskills where pilot_name = 'Jones' and age = 32
select count ( * ) from pilotskills where age >40
select count ( * ) from ( select age from pilotskills where age > 40 )
select count ( * ) from pilotskills where plane_name = 'B-52 Bomber' and age < 35
select count ( * ) from pilotskills where plane_name = 'B-52 Bomber' and age < 35
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select p.plane_name from pilotskills p group by p.plane_name having count ( p.plane_name ) = ( select max ( cnt ) from ( select count ( plane_name ) as cnt from pilotskills group by plane_name ) )
select plane_name from ( select plane_name , count ( * ) as num_flights from pilotskills group by plane_name ) where num_flights = ( select max ( num_flights ) from ( select count ( * ) as num_flights from pilotskills group by plane_name ) )
select p.plane_name from pilotskills p where p.plane_name in ( select plane_name from pilotskills group by plane_name having count ( * ) = ( select min ( count ) from ( select count ( * ) as count from pilotskills group by plane_name ) ) )
with planecounts as ( select plane_name , count ( * ) as cnt from pilotskills group by plane_name ) select plane_name from planecounts where cnt = ( select min ( cnt ) from planecounts )
select count ( distinct pilotskills.pilot_name ) from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Chicago'
select count ( distinct pilotskills.pilot_name ) from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Chicago'
select distinct plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select distinct plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select count ( distinct plane_name ) from pilotskills
select count ( distinct plane_name ) from pilotskills
select count ( distinct plane_name ) from pilotskills where pilot_name = 'Smith'
select count ( * ) from pilotskills where pilotskills.pilot_name = 'Smith'
select count ( distinct p.plane_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where p.age > 40
select count ( distinct p.plane_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where p.age > 40
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills order by age desc
Select pilot_name from pilotskills order by age desc
select location from ( select location from hangar order by plane_name asc ) as sorted
select location from hangar order by plane_name asc
select distinct plane_name from pilotskills order by pilot_name asc
select distinct plane_name from hangar order by plane_name asc
select count ( * ) from ( select age from pilotskills where age > 40 union select age from pilotskills where age < 30 )
select count ( * ) from ( select age from pilotskills where age > 40 or age < 30 ) where age > 40 or age < 30
select pilot_name , age from pilotskills where plane_name = 'Piper Cub' and age > 35 or ( plane_name = 'F-14 Fighter' and age < 30 )
select pilot_name , age from pilotskills where plane_name = 'Piper Cub' and age > 35 union select pilot_name , age from pilotskills where plane_name = 'F-14 Fighter' and age < 30
select distinct p.pilot_name from pilotskills p where p.plane_name = 'Piper Cub' and not exists ( select 1 from pilotskills ps where ps.plane_name = 'B-52 Bomber' and ps.pilot_name = p.pilot_name )
select distinct pilot_name from pilotskills where plane_name = 'Piper Cub' except select distinct pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select pilot_name from pilotskills where plane_name = 'Piper Cub' intersect select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select distinct pilot_name from pilotskills where plane_name in ( 'Piper Cub' , 'B-52 Bomber' ) group by pilot_name having count ( distinct plane_name ) = 2
select avg ( age ) as average_age , min ( age ) as minimal_age from pilotskills
select avg ( age ) , min ( age ) from pilotSkills
select pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin' intersect select pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Boston'
select pilotskills.pilot_name from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name where hangar.location = 'Austin' intersect select pilotskills.pilot_name from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name where hangar.location = 'Boston'
select distinct p.pilot_name from pilotskills p join hangar h on p.plane_name = h.plane_name where h.plane_name in ( 'Piper Cub' , 'F-14 Fighter' )
select pilot_name from pilotskills where plane_name in ( 'Piper Cub' , 'F-14 Fighter' )
select avg ( age ) , plane_name from pilotskills group by plane_name
select avg ( age ) , plane_name from pilotskills group by plane_name
sql placeholder
select count ( * ) , plane_name from pilotskills group by plane_name
select pilot_name from pilotskills where ( plane_name , age ) in ( select plane_name , max ( age ) from pilotskills group by plane_name ) order by plane_name asc
select plane_name , pilot_name from ( select plane_name , pilot_name from pilotskills order by plane_name desc ) as max_age
select pilot_name from pilotskills where ( plane_name , age ) in ( select plane_name , max ( age ) from pilotskills group by plane_name )
select plane_name , pilot_name from pilotskills where ( plane_name , age ) in ( select plane_name , max ( age ) from pilotskills group by plane_name )
select max ( age ) , pilot_name from pilotskills group by pilot_name having pilot_name = pilotskills.pilot_name
select distinct pilot_name , max ( age ) from pilotskills group by pilot_name
select count ( * ) , avg ( age ) , location from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.location
select count ( * ) , avg ( age ) , hangar.location from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.location
select count ( * ) , plane_name from pilotskills where age < 35 group by plane_name having avg ( age ) < 35
select plane_name , count ( * ) from pilotskills group by plane_name having avg ( age ) < 35
select hangar.location from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name order by pilotskills.age asc limit 1
select hangar.location from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name order by pilotskills.age asc limit 1
select pilotskills.pilot_name , pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin'
select pilot_name , age from pilotskills where exists ( select 1 from hangar where hangar.location = 'Austin' and pilotskills.plane_name = hangar.plane_name )
select pilot_name from pilotskills where age > ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' ) order by pilot_name asc
select p.pilot_name from pilotskills p where p.age > ( select max ( p.age ) from pilotskills p where p.plane_name = 'Piper Cub' ) order by p.pilot_name asc
select count ( * ) from pilotskills where age < ( select min ( age ) from pilotskills where plane_name = 'F-14 Fighter' )
select count ( * ) from pilotskills where age < ( select min ( age ) from pilotskills where plane_name = 'F-14 Fighter' )
select distinct plane_name from pilotskills where plane_name like '%Bomber%'
select distinct plane_name from pilotskills where plane_name like '%Bomber%'
select count ( * ) from ( select pilot_name from pilotskills where age > ( select max ( age ) from pilotskills where plane_name = 'Piper Cub' ) )
select count ( * ) from pilotskills where age > ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select d.name from district d where d.area_km = ( select max ( area_KM ) from district )
select area_km , government_website from district where population = ( select min ( population ) from district )
select district.name , district.population from district where area_km > ( select avg ( area_km ) from district )
select max ( area_km ) , avg ( district.area_km ) from district
select sum ( population ) from district where area_km in ( select area_km from district order by area_km desc limit 3 )
select district_id , district.name , government_website from district order by population asc
select name from district where government_website like '%gov%'
select district_id , name from district where population >4000 or area_km >3000
sql placeholder
select avg ( points ) , avg ( age ) from spokesman where rank_position = 1
select name , points from spokesman where age < 40
select z.name from spokesman z where z.age = ( select max ( age ) from spokesman )
select name from spokesman where points < ( select avg ( points ) from spokesman )
select district.name from district join spokesman_district on district.district_id = spokesman_district.district_id group by district.district_id order by count ( * ) desc limit 1
select spokesman.name from spokesman join spokesman_district on spokesman.spokesman_id = spokesman_district.spokesman_id where spokesman_district.start_year < 2004
select district.name , ( select count ( distinct spokesman_id ) from spokesman_district where district_id = district.district_id ) as num_spokesmen from district
select district.name from district where district_id in ( select spokesman_district.district_id from spokesman_district join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 1 intersect select district_id from spokesman_district join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 2 )
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by district.district_id having count ( * ) > 1
select count ( * ) from district where district_id not in ( select district_id from spokesman_district )
select name from spokesman where spokesman_id not in ( select spokesman_id from spokesman_district )
select sum ( district.population ) , avg ( district.population ) from district where exists ( select 1 from spokesman_district where spokesman_district.district_id = district.district_id )
select s.title from sculptures s where s.year = ( select max ( year ) from sculptures )
select s.title from sculptures as s where s.year = ( select max ( year ) from sculptures )
select title , location from paintings where year = ( select min ( year ) from paintings )
select title , location from paintings where year = ( select min ( year ) from paintings )
select title from sculptures where location = 'Gallery 226'
select title from sculptures where sculptureid = 226
Select title , location from paintings
select title , location from paintings
select title , location from sculptures
select title , location from sculptures
select medium from paintings where paintingid = 80
select medium from paintings where paintingid = 80
select fname , lname from artists where birthyear > 1850
sql placeholder
select title , year from sculptures where location != "Gallery 226"
select title , year from sculptures where location != 'Gallery 226'
select distinct artists.fname , artists.lname from sculptures join artists on sculptures.sculptorid = artists.artistid where sculptures.year < 1900
select distinct artists.fname , artists.lname from sculptures join artists on sculptures.sculptorid = artists.artistid where sculptures.year < 1900
select distinct artists.birthyear from sculptures join artists on sculptures.sculptorid = artists.artistid where sculptures.year > 1920
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1930
select fname , lname from artists where deathyear = ( select max ( deathyear ) from artists )
select fname , lname from artists order by deathyear desc limit 1
select birthyear from artists order by deathyear asc limit 1
select a.fname from artists a where a.birthyear = ( select min ( birthyear ) from artists )
sql placeholder
select fname , deathyear from artists order by deathyear desc limit 1
select count ( * ) from paintings where location = 240
select count ( * ) from paintings where location = 'Gallery 240'
select count ( * ) from paintings inner join artists on paintings.painterid = artists.artistid where artists.deathyear = ( select max ( deathyear ) from artists )
select count ( * ) from paintings join artists on paintings.painterid = artists.artistid where artists.deathyear = ( select max ( deathyear ) from artists )
select paintings.title , paintings.year from artists join paintings on artists.artistid = paintings.painterid where artists.fname = 'Mary'
select p.title , p.year from paintings p join artists a on p.painterid = a.artistid where a.fname = 'Mary'
select paintings.width_mm from artists join paintings on artists.artistid = paintings.paINTERID where artists.birthyear < 1850
select paintings.width_mm from artists join paintings on artists.artistid = paintings.painterid where artists.birthyear < 1850
select location , medium from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Pablo'
select location , medium from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Pablo'
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid intersect select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid
sql placeholder
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' intersect select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'lithograph'
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' intersect select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Lithograph'
select artists.birthyear from artists join paintings on artists.artistid = paintings.painterid where paintings.year = 1884 and paintings.mediumon = 'canvas'
select artists.birthyear from paintings join artists on paintings.painterid = artists.artistid where paintings.year = 1884
sql placeholder
select artists.fname from paintings join artists on paintings.painterid = artists.artistid where paintings.medium = 'Oil' and paintings.location = 241
select medium , count ( * ) from paintings group by medium
select medium , count ( * ) from paintings group by medium
select medium , avg ( height_mm ) from paintings group by medium
select medium , avg ( height_mm ) from paintings group by medium
select count ( * ) , location from paintings where year < 1900 group by location
select count ( * ) from paintings where year < 1900 and location > 100
select title from paintings where year > 1910 and medium = 'oil'
select title from paintings where year > 1910 and medium = 'oil'
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct title from paintings where height_mm > ( select avg ( height_mm ) from paintings where medium = 'canvas' )
select distinct title from paintings where height_mm > ( select avg ( height_mm ) from paintings where medium = 'canvas' )
select distinct p.paintingid from paintings p where p.year > ( select min ( year ) from paintings where location = 240 )
select distinct p.paintingid from paintings p where p.year > ( select min ( year ) from paintings p2 where p2.year = 240 )
select paintingid from paintings where year = ( select min ( year ) from paintings )
select p.paintingid from paintings as p where p.year = ( select min ( year ) from paintings )
select u.fname , u.lname from artists u where exists ( select 1 from sculptures s where s.sculptorid = u.artistid and s.title like '%female%' )
select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
select distinct title from paintings order by title asc
select distinct title from paintings order by title asc
select distinct title from paintings order by width_mm asc
select distinct title from paintings order by height_mm asc
select paintings.title , sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid where sculptures.year between 1900 and 1950
select paintings.title , sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid where sculptures.year between 1900 and 1950
select paintings.title , sculptures.title from artists join paintings on artists.artistid = paintings.painterid join sculptures on artists.artistid = sculptures.sculptorid where artists.fname = 'Fred' and artists.lname = 'Mary'
select paintings.title , sculptures.title from artists join paintings on artists.artistid = paintings.painterid join sculptures on artists.artistid = sculptures.sculptorid where artists.fname = 'Fred' and artists.lname = 'Mary'
select artists.artistid from artists join paintings on artists.artistid = paintings.painterid where paintings.year < 1900 group by artists.artistid order by count ( * ) desc limit 1
select artists.artistid from artists join paintings on artists.artistid = paintings.painterid where paintings.year < 1900 group by artists.artistid order by count ( * ) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) desc limit 1
select title from paintings where width_mm < 600 or ( height_mm  > 800 )
select title from paintings where width_mm < 600 or ( height_mm  > 800 )
select location from paintings where year < 1885 union select location from paintings where year > 1930
select location from paintings where year < 1885 union select location from paintings where year > 1930
select paintingid from paintings where height_mm > 500 and height_mm < 2000
select paintingid from paintings where height_mm > 500 intersect select paintingid from paintings where height_mm < 2000
select location from paintings where medium = 'on canvas' intersect select location from paintings where medium = 'on panel'
select distinct location from paintings where medium = 'on panels' intersect select distinct location from paintings where medium = 'on canvas'
select location from paintings where year <= 1885 intersect select location from paintings where year > 1930
select location from paintings where year <= 1885 intersect select location from paintings where year > 1930
select avg ( height_mm ) , avg ( width_mm ) from paintings where medium = 'oil' and location = 'Gallery 241'
select avg ( height_mm ) , avg ( width_mm ) from paintings where medium = 'Oil' and location = '241'
select max ( height_mm ) as maxheight , max ( paintingid ) as maxpaintingid from paintings where year < 1900
select height_mm , paintingid from paintings where year < 1900 and height_mm = ( select max ( height_mm ) from paintings where year < 1900 )
select max ( height_mm ) , max ( width_mm ) , year from paintings group by year
select max ( height_mm ) , max ( width_mm ) , year from paintings group by year
select avg ( height_mm ) , avg ( width_mm ) , artists.lname from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid order by artists.fname asc
select avg ( height_mm ) , avg ( width_mm ) , artists.fname , artists.lname from paintings join artists on paintings.painterid = artists.artistid group by artists.artistid order by artists.fname asc
select artists.fname , count ( * ) from paintings join artists on paintings.painterid = artists.artistid group by artists.artistid having count ( * ) >= 2
select artists.fname , count ( * ) from paintings join artists on paintings.painterid = artists.artistid group by artists.artistid having count ( * ) >= 2
select deathyear from artists where artistid not in ( select painterid from paintings group by painterid having count ( * ) > 3 )
select artists.deathyear from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( * ) <= 4
select a.deathyear from artists a left join sculptures s on a.artistid = s.sculptorid group by a.artistid order by count ( s.sculptorid ) asc limit 1
select artists.deathyear from artists join sculptures on artists.Artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) asc limit 1
sql placeholder
sql placeholder
sql placeholder
select paintingid from paintings where year < ( select min ( year ) from paintings where year < 240 )
select paintingid from paintings where height_MM > ( select max ( height_mm ) from paintings where year > 1900 )
select paintingid from paintings where height_mm > ( select max ( height_mm ) from paintings where year> 1900 )
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' group by artists.fname , artists.lname order by count ( * ) desc limit 3
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' group by artists.fname , artists.lname order by count ( * ) desc limit 1
select paintingid , location , title from paintings where medium = 'oil' group by paintingid order by year asc
select paintingid , location , title from paintings where medium = 'oil' order by year asc , paintingid , title
select title , year , location from paintings where height_mm > 1000 order by title asc
select year , location , title from paintings where height_MM > 1000 order by title asc
select fname , lname from artists except select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid join sculptures on sculptures.sculptorid = artists.artistid
select fname , lname from artists where artistid not in ( select artistid from sculptures ) except select artists.fname , artists.lname from artists where artistid not in ( select artistid from paintings ) except select artists.fname , artists.lname from artists where artistid not in ( select artistid from sculptures )
select location from paintings where year < 1885 except select location from paintings where medium = 'mediumon'
select location from paintings where year < 1885 and mediumon != 'canvas'
select count ( * ) from race
select count ( * ) from race
select winning_driver , winning_team from ( select winning_driver , winning_team from race order by winning_team asc ) as winning_team
select winning_driver , winning_team from ( select winning_driver , winning_team from race order by winning_team asc ) as winning_driver
select winning_driver from race where pole_position != 'Junior Strous'
select winning_driver from race where pole_position != 'Junior Strous'
select constructor from driver order by age asc
select distinct ( constructor ) from driver order by age asc
Select distinct entrant from driver where age >= 20
Select distinct entrant from driver where age >= 20
select max ( age ) as max_age , min ( age ) as min_age from driver
select max ( age ) as max_age , min ( age ) as min_age from driver
select count ( distinct engine ) from ( select engine from driver where age > 30 union select engine from driver where age < 20 )
select count ( distinct engine ) from ( select engine from driver where age > 30 union select engine from driver where age < 20 )
select driver_name from driver order by driver_name desc
select driver_name from driver order by driver_name desc
select driver.driver_name , race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name , race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name as driver_name , ( select count ( * ) from race where race.driver_id = driver.driver_id ) as race_count from driver
select driver.driver_name , count ( * ) from driver join race on driver.driver_id = race.driver_id group by driver.driver_name
select driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( race.driver_id ) = ( select max ( total_races ) from ( select count ( * ) as total_races from race group by driver_id ) )
select driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( race.driver_id ) = ( select max ( total_races ) from ( select count ( * ) as total_races from race group by driver_id ) )
select driver.driver_name , driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( * ) >= 2
select driver.driver_name , driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( * ) >= 2
select race.race_name from race join driver on race.driver_id = driver.driver_id where ( driver.age >= 26 )
select race.race_name from race join driver on race.driver_id = driver.driver_id where ( driver.age >= 26 )
select driver_name from driver where constructor != 'Bugatti'
select driver_name from driver where constructor != 'Bugatti'
select distinct constructor , count ( * ) from driver group by constructor
select constructor , count ( * ) from driver group by constructor
select engine from driver group by engine having count ( engine ) = ( select max ( counts ) from ( select count ( engine ) as counts from driver group by engine ) )
select engine from driver group by engine having count ( engine ) = ( select max ( count_engine ) from ( select count ( engine ) as count_engine from driver group by engine ) )
select engine type from driver group by engine having count ( * ) >= 2
select engine from ( select engine from driver group by engine having count ( * ) >= 2 )
select driver_name from driver where driver_id not in ( select driver_id from race )
Select driver_name from driver where driver_id not in ( select driver_id from race )
select constructor from driver where age < 20 intersect select constructor from driver where age >30
select constructor from driver where age < 20 intersect select constructor from driver where age >30
select winning_team from race group by winning_team having count ( * ) > 1
select winning_team from ( select winning_team , count ( * ) as num_races from race group by winning_team ) where num_races > 1
select distinct d.driver_name from driver d inner join race r on d.driver_id = r.driver_id where r.pole_position in ( 'James Hinchcliffe' , 'Carl Skerlong' ) group by d.driver_id having count ( distinct r.pole_position ) = 2
select d.driver_name from driver d where exists ( select 1 from race r where r.driver_id = d.driver_id and r.pole_position = 'James Hinchcliffe' ) and exists ( select 1 from race r where r.driver_id = d.driver_id and r.pole_position = 'Carl Skerlong' )
select driver_name from driver where driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select driver_name from driver where driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select count ( * ) from languages
select count ( * ) from languages
select name from languages order by name asc
select name from languages order by name asc
select name from languages where instr ( name , 'ish' ) > 0
select name from languages where instr ( name , 'ish' ) > 0
select name from countries order by overall_score desc
select name from countries order by overall_score desc
select avg ( justice_score ) from countries
select avg ( justice_score ) from countries
select max ( health_score ) , min ( health_score ) from countries where name != 'Norway'
select max ( health_score ) , min ( health_score ) from countries where name != 'Norway'
select count ( distinct language_id ) from official_languages
select count ( distinct language_id ) from official_languages
select name from countries order by education_score desc
select name from countries order by education_score desc
select c.name from countries c where c.politics_score = ( select max ( politics_score ) from countries )
select c.name from countries c where c.politics_score = ( select max ( politics_score ) from countries )
select countries.name , languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id
select countries.name , languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id
select languages.name , count ( distinct countries.id ) from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id group by languages.name
select languages.name , count ( distinct countries.id ) from official_languages join languages on official_languages.language_id = languages.id join countries on official_languages.country_id = countries.id group by official_languages.language_id
select l.name from languages l where l.id in ( select ol.language_id from official_languages ol group by ol.language_id having count ( ol.country_id ) = ( select max ( cnt ) from ( select count ( country_id ) as cnt from official_languages group by language_id ) ) )
select languages.name from languages join official_languages on languages.id = official_languages.language_id group by official_languages.language_id having count ( official_languages.language_id ) = ( select max ( cnt ) from ( select count ( language_id ) as cnt from official_languages group by language_id ) tmp )
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by official_languages.language_id having count ( distinct official_languages.country_id ) >= 2
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id group by languages.id having count ( distinct official_languages.country_id ) >= 2
select avg ( overall_score ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id where languages.name = 'English'
select avg ( overall_score ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id where countries.name = 'English'
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id group by languages.id order by count ( * ) desc limit 3
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id group by official_languages.language_id order by count ( * ) desc limit 3
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by official_languages.language_id order by avg ( overall_score ) desc
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by official_languages.language_id order by avg ( countries.overall_score ) desc
select countries.name from countries join official_languages on countries.id = official_languages.country_id group by countries.id order by count ( * ) desc limit 1
select c.name from countries c where exists ( select null from official_languages ol where ol.country_id = c.id group by ol.country_id having count ( ol.language_id ) = ( select max ( cnt ) from ( select count ( language_id ) as cnt from official_languages group by country_id ) t ) )
select name from languages where id not in ( select language_id from official_languages )
select name from languages where id not in ( select language_id from official_languages )
select name from countries where Id not in ( select country_id from official_languages )
select name from countries where Id not in ( select country_id from official_languages )
select name from languages where id in ( select language_id from official_languages where country_id in ( select id from countries where overall_score > 95 ) and country_id in ( select id from countries where overall_score < 90 ) )
select name from languages where id in ( select language_id from official_languages where country_id in ( select id from countries where overall_score > 95 ) ) and name in ( select id from official_languages where country_id in ( select id from countries where overall_score < 90 ) )
select distinct country , town_city from addresses
select country , town_city from addresses
select addresses.county_state_province from addresses join properties on addresses.address_id = properties.property_address_id group by properties.property_address_id
select distinct addresses.county_state_province from properties join addresses on properties.property_address_id = addresses.address_id
select feature_description from features where feature_name = 'rooftop'
select feature_description from features where feature_name = 'rooftop'
select feature_name , feature_description from features where feature_id in ( select feature_id from property_features group by feature_id order by count ( * ) desc limit 1 )
select f.feature_name , f.feature_description from features f , property_features pf where f.feature_id = pf.feature_id group by f.feature_id having count ( pf.property_id ) = ( select max ( cnt ) from ( select count ( property_id ) as cnt from property_features group by feature_id ) )
select min ( room_count ) from properties
select min ( room_count ) from properties
select count ( * ) from properties group by parking_lots having count ( * ) = 1 union select count ( * ) from properties group by garage_yn having count ( * ) = 1
select count ( * ) from properties where parking_lots = 1 union select count ( * ) from properties where garage_yn = 1
select distinct u.age_category_code from users u join ref_user_categories rc on u.user_category_code = rc.user_category_code where rc.user_category_description like '%Mother%'
sql placeholder
select users.first_name from users join properties on users.user_id = properties.owner_user_id group by properties.owner_user_id order by count ( * ) desc limit 1
select users.first_name from properties join users on properties.owner_user_id = users.user_id group by properties.owner_user_id order by count ( * ) desc limit 1
sql placeholder
select avg ( room_count ) from properties where property_id in ( select property_id from property_features where feature_id = 'garden' )
select distinct addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id join property_features on properties.property_id = property_features.property_id join features on property_features.feature_id = features.feature_id where features.feature_name = 'swimming pool'
select distinct addresses.town_city from addresses inner join properties on addresses.address_id = properties.property_address_id where properties.property_name = 'swimming_pool'
select properties.property_id , properties.vendor_requested_price from properties where properties.vendor_requested_price = ( select min ( vendor_requested_price ) from properties )
select properties.property_id , properties.vendor_requested_price from properties where properties.vendor_requested_price = ( select min ( vendor_requested_price ) from properties )
select avg ( room_count ) from properties Join rooms on properties.property_id = rooms.property_id
select avg ( room_count ) from properties
select count ( distinct room_size ) from rooms
select count ( distinct room_size ) from rooms
select user_id , search_string from user_searches group by user_id having count ( * ) >= 2
select user_id , search_seq from user_searches group by user_id having count ( * ) >= 2
select max ( search_datetime ) from user_searches
select max ( search_datetime ) from user_searches
select search_datetime , search_string from user_searches order by search_string desc
select search_string , search_datetime from user_searches order by search_string desc
select distinct zip_postcode from addresses where address_id not in ( select properties.property_address_id from properties join users on properties.owner_user_id = users.user_id group by properties.property_id having count ( * ) <= 2 )
select distinct zip_postcode from addresses where address_id not in ( select property_address_id from properties group by property_address_id having count ( property_id ) <= 2 )
select users.user_category_code , users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) = 1
select users.user_id , users.user_category_code from user_searches join users on user_searches.user_id = users.user_id group by users.user_id having count ( * ) = 1
select age_category_code from users where user_id in ( select user_id from user_searches order by search_datetime asc limit 1 )
select users.age_category_code from users join user_searches on users.user_id = user_searches.user_id order by user_searches.search_datetime asc limit 1
select login_name from users where age_category_code = 'senior citizen' order by first_name asc
select login_name from users where age_category_code = 'senior citizen' order by first_name asc
select count ( * ) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 1
select count ( * ) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 1
select date_registered from users where login_name = 'ratione'
select date_registered from users where login_name = 'ratione'
select first_name , middle_name , last_name , login_name from users where is_seller = '1'
select first_name , middle_name , last_name , login_name from users where is_seller = 1
sql placeholder
select addresses.line_1_number_building , addresses.line_2_number_street , addresses.town_city from addresses join users on addresses.address_id = users.user_address_id where users.age_category_code = 'Senior'
select count ( distinct properties.property_id ) from properties join property_features on properties.property_id = property_features.property_id group by properties.property_id having count ( distinct property_features.feature_id ) >= 2
select count ( distinct property_id ) from property_features where property_id in ( select property_id from property_features group by property_id having count ( distinct feature_id ) >= 2 )
select properties.property_id , count ( property_photos.photo_seq ) as number_of_photos from properties left join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select count ( * ) , properties.property_id from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select properties.owner_user_id , count ( property_photos.photo_seq ) as photos_count from properties left join property_photos on properties.property_id = property_photos.property_id group by properties.owner_user_id
select count ( * ) , properties.owner_user_id from properties join property_photos on properties.property_id = property_photos.property_id group by properties.owner_user_id
select sum ( properties.price_max ) from properties join users on properties.owner_user_id = users.user_id where users.age_category_code = 'Single Mom' or users.age_category_code = 'Student'
select sum ( price_max ) from properties join users on properties.owner_user_id = users.user_id where users.user_category_code = 'Single Mother' or users.user_category_code = 'Student'
select user_property_history.datestamp , properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp asc
select user_property_history.datestamp , properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp asc
select ref_property_types.property_type_description , properties.property_type_code from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code group by properties.property_type_code order by count ( *) desc limit 1
select property_type_description , property_type_code from ref_property_types where exists ( select 1 from properties where properties.property_type_code = ref_property_types.property_type_code group by property_type_code order by count ( * ) desc limit 1 )
select age_category_description from ref_age_categories where age_category_code = 'Over 60'
select age_category_description from ref_age_categories where age_category_code = 'Over 60'
select room_size , count ( * ) from rooms group by room_size
select room_size , count ( * ) from rooms group by room_size
select addresses. country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = 'Robbie'
select addresses. country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = 'Robbie'
select first_name , middle_name , last_name from users inner join properties on users.user_id = properties.owner_user_id where properties.property_id in ( select property_id from user_property_history )
sql placeholder
select search_string from user_searches where user_id not in ( select owner_user_id from properties )
select search_string from user_searches where user_id not in ( select owner_user_id from properties )
select users.last_name , users.user_id from users join user_property_history on users.user_id = user_property_history.user_id group by users.user_id having count ( * ) >= 2 and count ( * ) <= 2
select users.last_name , users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) < 2 intersect select users.last_name , users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) >= 2
select count ( * ) from bike where weight > 780
select product_Name , weight from bike order by price asc
select heat , name , nation from ( select name , heat , nation from cyclist ) as _
select max ( weight ) as max_weight , min ( weight ) as min_weight from bike
select avg ( price ) from bike where material = 'Carbon CC'
select name , result from cyclist where nation != 'Russia'
select distinct bike.id , bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id where cyclists_own_bikes.purchase_year > 2015
select bike.id , bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id group by bike.id having count ( * ) >= 4
select c.id , c.name from cyclist c where exists ( select null from cyclists_own_bikes co where co.cyclist_id = c.id group by co.cyclist_id having count ( co.bike_id ) = ( select max ( count ) from ( select count ( bike_id ) as count from cyclists_own_bikes group by cyclist_id ) ) )
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.nation = 'Russia' or cyclist.nation = 'Great Britain'
select count ( distinct heat ) from cyclist
select count ( * ) from cyclist where ID not in ( select cyclist_id from cyclists_own_bikes where purchase_year > 2015 )
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.result > '4:21.5588'
select product_name , price from bike where id in ( select bike_id from cyclists_own_bikes where cyclist_id in ( select id from cyclist where name = 'Bradley Wiggins' ) intersect select bike_id from cyclists_own_bikes where cyclist_id in ( select id from cyclist where name = 'Antonio Tauler' ) )
select name , nation , result from cyclist where ID not in ( select cyclist_id from cyclists_own_bikes )
Select product_name from bike where material like '%fiber%'
select cyclist.id , count ( * ) from cyclists_own_bikes join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id group by cyclist.id order by cyclists_own_bikes.cyclist_id asc
select g.flavor , g.price from goods g where g.price = ( select max ( price ) from goods where flavor = 'Cake' )
select id , flavor from goods where price = ( select max ( price ) from goods )
select g.flavor , g.price from goods g where g.price = ( select min ( price ) from goods where flavor = 'Cookie' )
select id , flavor from goods where price = ( select min ( price ) from goods where food = 'cookie' )
select id from goods where flavor like '%Apple%'
select id from goods where flavor like '%Apple%'
select id from goods where price < 3
select id from goods where price < 3
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count ( * ) >= 15
select customers.id from receipts join customers on receipts.customerid = customers.id group by customers.id having count ( * ) >= 15
sql placeholder
sql placeholder
select count ( distinct g.flavor ) from goods g where g.flavor = 'Cake'
select count ( distinct g.flavor ) from goods g where g.id in ( select item from items g where g.id = g.id )
select distinct flavor from goods where food = 'Croissants'
select distinct flavor from goods where food = 'Croissant'
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on receipts.customerid = customers.id where customers.firstname = 'John' and customers.lastname = 'Jane'
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on customers.id = receipts.customerid where customers.firstname = '15' and customers.lastname = 'Bob'
select avg ( price ) , max ( price ) , min ( price ) , food from goods group by food
select avg ( price ) , min ( price ) , max ( price ) , food from goods Group by food
select receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt where items.item = 'Cake' intersect select receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt where items.item = 'Cookie'
sql placeholder
sql placeholder
select receipts.receiptnumber from customers join receipts on customers.id = receipts.customerid join items on receipts.receiptnumber = items.receipt where customers.lastname = 'Logan' and items.item = 'croissant'
select receipts.receiptnumber , receipts.date from items join receipts on items.receipt = receipts.receiptnumber where items.item = ( select max ( price ) from goods )
select receipts.receiptnumber , receipts.date from receipts join items on receipts.receiptnumber = items.receipt where items.item = ( select max ( price ) from goods )
select item from ( select item , count ( receipt ) as cnt from items group by item ) where cnt = ( select min ( cnt ) from ( select count ( receipt ) as cnt from items group by item ) )
select item from ( select item , count ( receipt ) as total from items group by item ) where total = ( select min ( total ) from ( select count ( receipt ) as total from items group by item ) )
select food , count ( * ) as total_goods from goods group by food
select count ( * ) , food from goods group by food
select food , avg ( price ) from goods group by food
select food , ( select avg ( price ) from goods group by food ) as average_price from goods group by food
select id from goods where flavor = 'Apricot' intersect select id from goods where price < 5
select id from goods where flavor = 'Apricot' and price < 5
select flavor from goods where price like '10%'
select flavor from goods where price > 10 and food = 'Cake'
select distinct id , price from goods where price < ( select avg ( price ) from goods )
select distinct id , price from goods where price < ( select avg ( price ) from goods )
select distinct id from goods where price < ( select max ( price ) from goods where flavor = 'Tart' )
select distinct id from goods where price < ( select min ( price ) from goods where id = 'Tart' )
select distinct receipts.receiptnumber from receipts join goods on receipts.receiptnumber = goods.id where goods.price > 13
select distinct receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt join goods on items.item = goods.id where goods.price > 13
sql placeholder
select receipts.date from receipts join items on receipts.receiptnumber = items.receipt join customers on customers.id = receipts.customerid join goods on items.item = goods.id where goods.price > 15
select id from goods where instr ( id , 'APP' ) > 0
select id from goods where instr ( id , 'APP' ) > 0
select id , price from goods where id like '%70%'
select id , price from goods where id like '%70%'
select lastname from customers order by lastname asc , firstname asc
select lastname from customers order by lastname asc , firstname asc
select id from ( select id from goods order by id asc ) as sorted
select distinct id from goods Order by id asc
sql placeholder
sql placeholder
select receiptnumber , date from receipts where date = ( select max ( date ) from receipts )
select receiptnumber , date from receipts where date = ( select max ( date ) from receipts )
sql placeholder
sql placeholder
select id from goods where food = 'Cookie' and price between 3 and 7
select id from goods where price between 3 and 7
select customers.firstname , customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
sql placeholder
select avg ( price ) from goods where flavor = 'blackberry' or flavor = 'blueberry'
select avg ( price ) from goods where flavor = 'blackberry' or flavor = 'blueberry'
select min ( price ) from goods where flavor = 'Cheese'
select price from goods where flavor = 'cheese' and price = ( select min ( price ) from goods where flavor = 'cheese' )
select max ( price ) , avg ( price ) , min ( price ) , flavor from goods group by flavor order by flavor asc
select max ( price ) , avg ( price ) , min ( price ) , flavor from goods group by flavor order by flavor asc
select min ( price ) , max ( price ) , food from goods group by food order by food asc
select min ( price ) , max ( price ) , food from goods where food = food group by food order by food asc
select date from ( select date , count ( receiptnumber ) as num_receipts from receipts group by date ) order by num_receipts desc limit 3
select date from ( select date , count ( receiptnumber ) as cnt from receipts group by date ) where cnt = ( select max ( cnt ) from ( select count ( receiptnumber ) as cnt from receipts group by date ) )
select customers.firstname , customers.lastname , count ( * ) from customers join receipts on customers.id = receipts.customerid group by customers.firstname , customers.lastname order by count ( * ) desc limit 1
select customers.id , count ( * ) from receipts join customers on receipts.customerid = customers.id group by customers.id having count ( * ) = ( select max ( total_purchases ) from ( select count ( * ) as total_purchases from receipts group by receipts.customerid ) )
select date , count ( distinct customers.id ) from receipts join customers on receipts.customerid = customers.id group by receipts.date
select receipts.date , count ( * ) from receipts join customers on receipts.customerid = customers.id group by receipts.date
sql placeholder
sql placeholder
select id from goods where price < ( select min ( price ) from goods where food = 'Crisp' )
select id from goods where price < ( select min ( price ) from goods where food = 'croissant' )
sql placeholder
select id from goods where price >= ( select avg ( price ) from goods where goods.price = 'Tart' )
select id from goods group by id having max ( price ) > ( select avg ( price ) from goods )
select id from goods where price > ( select Avg ( price ) from goods )
select id , flavor , food from ( select id , flavor , food from goods order by price asc ) as sorted
select id , flavor , food from ( select id , flavor , food from goods order by price asc )
select id , flavor from goods where food = 'Cake' order by flavor asc
select id , flavor from goods where flavor = 'Cake' order by flavor asc
select items.item from items join goods on items.item = goods.id where goods.flavor like 'chocolate' except select items.item from items join goods on items.item = goods.id group by items.item having count ( * ) > 10
select items.item from items join goods on items.item = goods.id where goods.flavor = 'Chocolate' group by items.item having count ( items.receipt ) <= 10
select distinct flavor from goods where food = 'Cake' except select distinct flavor from goods where food = 'Tart'
select distinct flavor from goods where food = 'Cake' except select distinct flavor from goods where food = 'Tart'
select g.food from goods g where g.id in ( select i.item from items i group by i.item order by count ( i.item ) desc limit 3 )
select items.item from items join goods on items.item = goods.id group by items.item order by count ( * ) desc limit 3
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum ( receipts.receiptnumber ) > 150
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum ( receipts.receiptnumber ) > 150
sql placeholder
sql placeholder
sql placeholder
select receipts.date from goods join receipts on goods.id = receipts.receiptnumber group by receipts.date having sum ( goods.price ) > 100
select count ( * ) from driver
select count ( * ) from driver
select count ( * ) , make from driver where points > 150 group by make
select make , count ( * ) from driver where points >150 group by make
select avg ( age ) , make from driver group by make
select avg ( age ) , make from driver group by make
select avg ( laps ) from driver where age < 20
select avg (laps ) from driver where age < 20
select manager , sponsor from team order by car_owner Asc
select manager , sponsor from team order by car_owner asc
select make from ( select make , count ( * ) as num_teams from team group by make having num_teams > 1 )
select make from team group by make having count ( * ) > 1
select make from team where car_owner = 'Buddy Arrington' or car_owner = 'Bobby'
select make from team where car_owner = 'Buddy Arrington'
select max ( points ) , min ( points ) from driver
select max ( points ) as maxpoints , min ( points ) as minpoints from driver
select count ( * ) from driver where points < 150
select count ( * ) from driver where points < 150
select driver from driver order by age asc
select driver from ( select driver , age , rank ( ) over ( order by age asc ) as rank from driver ) order by age asc
select driver from driver order by points desc
select driver from driver order by points desc
select driver , country from driver
select driver , country from driver
select max ( points ) from driver join country on driver.country = country.country_id where country.capital = 'Dublin'
select max ( driver.points ) from country join driver on country.country_id = driver.country where country.capital = 'Dublin'
select avg ( driver.age ) from country join driver on country.country_id = driver.country where country.official_native_language = 'English'
select avg ( driver.age ) from country join driver on country.country_id = driver.country where country.official_native_language = 'English'
select distinct country.country from driver join country on driver.country = country.country_id where driver.points > 150
select distinct country.country from country join driver on country.country_id = driver.country where driver.points > 150
select country.capital from driver join country on driver.country = country.country_id order by driver.points desc limit 1
select c.capital from country c where exists ( select 1 from driver d where d.country = c.country_id and d.points = ( select max ( points ) from driver where country in ( select country from driver ) ) )
select make , count ( * ) from driver group by make
select make , count ( * ) from driver group by make
select make from driver group by make having count ( make ) = ( select max ( cnt ) from ( select count ( * ) as cnt from driver group by make ) )
select make from driver group by make having count ( make ) = ( select max ( count ) from ( select count ( * ) as count from driver group by make ) )
select make from driver group by make having count ( distinct driver_id ) >= 3
select make from driver group by make having count ( * ) >= 3
select team from team where team_id not in ( select team_id from team_driver )
select team from team left join team_driver on team.team_id = team_driver.team_id where team_driver.team_id is null group by team.team_id
select country from driver where make = 'Dodge' intersect select country from driver where make = 'Chevrolet'
select country.country from driver join country on driver.make = country.country_id where driver.make = 'Dodge' intersect select country.country from driver join country on driver.make = country.country_id where driver.make = 'Chevrolet'
select sum ( points ) , avg ( points ) from driver
select sum ( points ) , avg ( points ) from driver
select country from country where country_id not in ( select country from driver )
select country from country where country_id not in ( select country from driver )
select team.manager , team.sponsor from team join ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( driver_count ) from ( select count ( driver_id ) as driver_count from team_driver group by team_id ) ) ) as most_drivers on team.team_id = most_drivers.team_id
select team.manager , team.sponsor from team join ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( driver_count ) from ( select count ( driver_id ) as driver_count from team_driver group by team_id ) ) ) as most_drivers on team.team_id = most_drivers.team_id
select team.manager , team.car_owner from team_driver join team on team_driver.team_id = team.team_id group by team_driver.team_id having count ( * ) >= 2
select team.manager , team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team_driver.team_id having count ( * ) >= 2
select count ( * ) from institution
select count ( * ) from institution
select name from institution order by name asc , name asc
select name from institution order by name asc
select name from institution order by founded asc
select name from institution order by founded asc , name
select city , province from institution
select city , province from ( select city , province from institution ) as unique_locations
select max ( enrollment ) as max_enrollment , min ( enrollment ) as min_enrollment from institution
select max ( enrollment ) , min ( enrollment ) from institution
select affiliation from institution where city != 'Vancouver' or affiliation = 'Affiliation'
select affiliation from institution where city != 'Vancouver' or affiliation = 'Affiliation'
select stadium from institution order by capacity desc
select stadium from ( select stadium from institution order by capacity desc ) desc
Select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
sql placeholder
select institution.name , championship.nickname from championship join institution on championship.institution_id = institution.institution_id
select nickname from championship join institution on championship.institution_id = institution.institution_id where institution.enrollment = ( select min ( enrollment ) from institution )
select nickname from championship join institution on championship.institution_id = institution.institution_id where institution.enrollment = ( select min ( enrollment ) from institution )
select institution.name from championship join institution on championship.institution_id = institution.institution_id order by number_of_championships desc
select institution.name from championship join institution on championship.institution_id = institution.institution_id order by number_of_championships desc
select institution.name from championship join institution on championship.institution_id = institution.institution_id group by championship.institution_id having count ( * ) >= 1
select institution.name from institution inner join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count ( * ) >= 1
select sum ( championship.number_of_championships ) from institution join championship on institution.institution_id = championship.institution_id where institution.affiliation = 'Public'
select sum ( championship.number_of_championships ) from institution join championship on institution.institution_id = championship.institution_id where institution.affiliation = 'Public'
select affiliation , count ( * ) from institution group by affiliation
select affiliation , count ( * ) from institution group by affiliation
select affiliation from institution group by affiliation having count ( affiliation ) = ( select max ( cnt ) from ( select count ( affiliation ) as cnt from institution group by affiliation ) tmp )
select affiliation from ( select affiliation , count ( * ) as cnt from institution group by affiliation ) where cnt = ( select max ( c ) from ( select count ( * ) as c from institution group by affiliation ) )
select founded from institution group by founded having count ( * ) > 1
select founded , count ( * ) from institution group by founded having count (* ) > 1
select c.nickname from championship c join institution e on c.institution_id = e.institution_id order by e.capacity desc
select c.nickname from championship c join institution i on c.institution_id = i.institution_id order by i.capacity desc
select sum ( enrollment ) from institution where city = 'Vancouver' or city = 'Calgary'
select enrollment from institution where city = 'Vancouver' or city = 'Calgary'
select province from institution where founded < 1920 intersect select province from institution where founded > 1950.
select province from institution where founded < 1920 intersect select province from institution where founded > 1950.
select count ( distinct province ) from institution
select count ( distinct province ) from institution
select * from warehouses
select * from warehouses
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select contents from boxes where value > 150
select contents from boxes where value > 150
select warehouse , avg ( value ) from boxes group by warehouse
select avg ( value ) , warehouse from boxes group by warehouse
select avg (value ) , sum ( value ) from boxes
select avg ( value ) , sum ( value ) from boxes
select avg ( capacity ) , sum ( capacity ) from warehouses
select avg ( capacity ) , sum ( capacity ) from warehouses
select avg ( value ) , max ( value ) , contents from boxes group by contents
select avg ( value ) , max ( value ) , contents from boxes group by contents
select contents from ( select contents , sum ( value ) as total_value from boxes group by contents ) where total_value = ( select max ( total_value ) from ( select sum ( value ) as total_value from boxes group by contents ) )
select contents from boxes group by contents having sum ( value ) = ( select max ( total_value ) from ( select sum ( value ) as total_value from boxes group by contents ) )
select avg ( value ) from boxes
select avg ( value ) from boxes
select distinct ( contents ) from boxes
select distinct contents from boxes
select count ( distinct contents ) from boxes
select count ( distinct contents ) from boxes
select distinct location from ( select distinct location from warehouses )
select distinct location from ( select location from warehouses )
select code from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select boxes.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' or warehouses.location = 'New York'
select sum ( value ) from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select sum ( value ) from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' union select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select boxes.contents from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago' intersect select boxes.contents from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'New York'
select distinct boxes.contents from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location != 'New York'
select distinct contents from boxes where warehouse not in ( select distinct code from warehouses where location = 'New York' )
select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks' except select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Scissors'
select distinct w.location from warehouses w join boxes b on w.code = b.warehouse where b.contents = 'Rocks' and w.code not in ( select b.warehouse from boxes b where b.contents = 'Scissors' )
select distinct warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = 'Rocks' or boxes.contents = 'Scissors'
select distinct warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = 'Rocks' or boxes.contents = 'Scissors'
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = 'Rocks and Scissors'
select warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks and Scissors'
select code , contents from boxes order by value asc
select code ,contents from boxes order by value asc
select code , contents from boxes where value = ( select min ( value ) from boxes )
select code , contents from boxes where value = ( select min ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes order by contents asc
select distinct ( contents ) from boxes order by contents asc
select code from boxes where value > ( select max ( value ) from boxes where contents = 'Rocks' )
select b.code from boxes b where b.value > ( select max ( b2.value ) from boxes b2 where b2.contents = 'Rocks' )
select code , contents from boxes b where b.value > ( select max ( value ) from boxes where contents = 'Scissors' )
select b.code , b.contents from boxes b where b.value > ( select max ( value ) from boxes b where b.contents = 'Scissors' )
select sum ( value ) from boxes where warehouse in ( select code from warehouses where capacity = ( select max ( capacity ) from warehouses ) )
select sum ( value ) from boxes where warehouse in ( select warehouse from warehouses where capacity = ( select max ( capacity ) from warehouses ) )
select warehouse , avg ( value ) from boxes group by warehouse having avg ( value ) > 150
select warehouse , avg ( value ) from boxes group by warehouse having avg ( value ) > 150
select contents , sum ( value ) as total_value , count ( * ) as total_boxes from boxes group by contents
select contents , sum ( value ) , count ( * ) from boxes group by contents
select sum ( capacity ) , avg ( capacity ) , max ( capacity ) , location from warehouses group by location
select location , sum ( capacity ) , avg ( capacity ) , max ( capacity ) from warehouses group by location
select sum ( capacity ) from warehouses
select sum ( capacity ) from warehouses
select warehouses.location , max ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select ( boxes.value ) , warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select w.code , count ( * ) from warehouses w left join boxes b on w.code = b.warehouse group by w.code
select warehouse , count ( * ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select count ( distinct warehouses.location ) from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks'
select count ( distinct warehouse ) from boxes where contents = 'Rocks'
select b.code , w.location from boxes b join warehouses w on b.warehouse = w.code
select boxes.code , warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code
select distinct boxes.code from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago'
select boxes.code from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago'
select warehouse , count ( * ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select count ( * ) , warehouses.code from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.code
select count ( distinct boxes.contents ) , warehouse from boxes group by warehouse
select count ( distinct boxes.contents ) , warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select code from warehouses where capacity > 'capacity'
sql placeholder
select total ( value ) from boxes where warehouse not in ( select code from warehouses where location = 'Chicago' )
select sum ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location != 'Chicago'
select university_Name , city , state from university order by university_name asc
select university_name , city , state from university order by university.university_name asc
select count ( * ) from ( select state from university where state in ( 'IL' , 'OH' ) )
select count ( * ) from university where state in ( 'IL' , 'OH' )
select max ( enrollment ) , avg ( enrollment )  , min ( enrollment ) from university
select max ( enrollment ) , avg ( enrollment )  , min ( enrollment ) from university
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select home_conference from university
select distinct home_conference from university
select sub.home_conference , count ( * ) from university sub group by sub.home_conference
select home_conference , count ( * ) from university group by home_conference
select state from university group by state having count ( * ) = ( select max ( total ) from ( select count ( * ) as total from university group by state ) )
select state from university group by state having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from university group by state ) )
select home_conference from ( select home_conference , avg ( enrollment ) as average_enrollment from university group by home_conference ) where average_enrollment > 2000
select home_conference from ( select home_conference , avg ( enrollment ) as average_enrollment from university group by home_conference ) where average_enrollment > 2000
select home_conference from ( select home_conference , sum ( enrollment ) as total from university group by home_conference ) where total = ( select min ( total ) from ( select sum ( enrollment ) as total from university group by home_conference ) )
select home_conference from ( select home_conference , min ( enrollment ) as min_enrollment from university group by home_conference ) where min_enrollment = ( select min ( enrollment ) from university )
select major_name , major_code from major order by major_code asc
select major_name , major_code from major order by major_Code asc
select major.major_name , major_ranking.rank from major join major_ranking on major.major_id = major_ranking.major_id join university on university.university_id = major_ranking.university_id where university.university_name = 'Augustana College'
select major_ranking.rank , major.major_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major.major_id = major_ranking.major_id where university.university_name = 'Augustana College'
sql placeholder
select u.university_name , u.city , u.state from university u join major_ranking mr on u.university_id = mr.university_id where mr.rank = 1 and mr.major_id = 'Accounting'
select university_name from university where university_id in ( select university_id from major_ranking where rank = 1 group by university_id having count ( major_id ) = ( select max ( count ) from ( select count ( major_id ) as count from major_ranking where rank = 1 group by university_id ) ) )
select university_name from university where university_id in ( select university_id from major_ranking where rank = 1 group by university_id having count ( major_id ) = ( select max ( cnt ) from ( select count ( major_id ) as cnt from major_ranking where rank = 1 group by university_id ) ) )
select university_name from university where not exists ( select 1 from major_ranking where major_ranking.university_id = university.university_id and rank = 1 )
select university_name from university where university_id not in ( select university_id from major_ranking where rank = 1 )
select university_name from university where university_id in ( select university_id from major_ranking join major on major_ranking.major_id = major.major_id where major_name = 'Accounting' intersect select university_id from major_ranking join major on major_ranking.major_id = major.major_id where major_name = 'Urban Education' )
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major.major_id = major_ranking.major_id where major.major_name = 'Accounting' intersect select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major.major_id = major_ranking.major_id where major.major_name = 'Urban Education'
select university_name , overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where state = 'Wisconsin'
select overall_ranking.rank , university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id where state = 'Wisconsin'
select university_name from university where university_id in ( select university_id from overall_ranking where research_point = ( select max ( research_point ) from overall_ranking ) )
select university_name from university join ( select university_id from overall_ranking group by university_id having sum ( research_point ) = ( select max ( total ) from ( select sum ( research_point ) as total from overall_ranking group by university_id ) ) ) as maxranking on university.university_id = maxranking.university_id
select university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by reputation_point asc
select university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by reputation_point asc
select university_name from university where university_id in ( select university_id from major_ranking where major_id in ( select major_id from major where rank >= 3 ) )
select university_name from university where university_id in ( select university_id from major_ranking where major_id = 'Accounting' and rank >= 3 )
select sum ( enrollment ) from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.rank <= 5
select total ( enrollment ) from university inner join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.rank <= 5
select university.university_name , overall_ranking.citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.reputation_point >= 3
select university.university_name , overall_ranking.citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point desc limit 3
select state from university where enrollment < 3000 group by state having count ( * ) >2
select state from ( select state from university where enrollment < 3000 group by state having count ( * ) > 2 )
select title from movies where rating not in ( select rating from movies )
select title from movies where rating not in ( select rating from movies )
select title from movies where rating = 'G'
select title from movies where rating = 'G'
select movies.title from movietheaters join movies on movietheaters.movie = movies.code where movietheaters.name = 'Odeon'
select movies.title from movietheaters join movies on movietheaters.movie = movies.code where movietheaters.name = 'Odeon'
select movies.title , movietheaters.name from movietheaters join movies on movietheaters.movie = movies.code
select movies.title , movietheaters.name from movietheaters join movies on movietheaters.movie = movies.code
select count ( * ) from movies where rating = 'G'
select count ( * ) from movies where rating = 'G'
select count ( * ) from ( select distinct movie from movietheaters )
select count ( * ) from ( select distinct movie from movietheaters )
select count ( distinct movie ) from movietheaters
select count ( distinct movie ) from ( select movietheaters.movie , movies.title , movies.rating from movietheaters join movies on movietheaters.movie = movies.code )
select count ( distinct code ) from movietheaters
select count ( distinct code ) from movietheaters
select rating from movies where title like '%Citizen%'
select rating from movies where title like '%Citizen%'
select name from movietheaters where movie in ( select code from movies where rating = 'G' or rating = 'PG' )
select name from movietheaters where movie in ( select code from movies where rating = 'G' or rating = 'PG' )
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' or movietheaters.name = 'Imperial'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where ( movietheaters.name = 'Odeon' or movietheaters.name = 'Imperial' )
select movies.title from movietheaters join movies on movietheaters.movie = movies.code where movietheaters.name = 'Odeon' intersect select movies.title from movietheaters join movies on movietheaters.movie = movies.code where movietheaters.name = 'Imperial'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' intersect select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Imperial'
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies order by title asc
select title from movies order by title asc
select title from movies order by rating asc
select title from movies order by rating asc
select movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie group by movietheaters.name order by count ( * ) desc limit 1
select movietheaters.name from movietheaters join movies on movietheaters.movie = movies.code group by movietheaters.name order by count ( * ) desc limit 1
select title from movies where code in ( select movie from movietheaters group by movie having count ( code ) = ( select max ( cnt ) from ( select count ( code ) as cnt from movietheaters group by movietheaters.movie ) ) )
select movies.title from movies join movietheaters on movies.code = movietheaters.movie group by movies.code order by count ( * ) desc limit 1
select sub.rating , count ( * ) from movies sub group by sub.rating
select rating , count ( * ) from movies group by rating
select count ( * ) from movies where rating != 'null'
select count ( * ) from movies where rating != 'null'
select name from movietheaters where movie = ( select code from movies )
select name from movietheaters group by name having count ( * ) >= 1
select name from movietheaters where code not in ( select code from movietheaters )
select name from movietheaters where code not in ( select code from movietheaters )
select name from movietheaters where movie in ( select code from movies where rating = 'G' )
select movietheaters.name from movietheaters join movies on movietheaters.movie = movies.code where movies.rating = 'G'
select title from movies
select title from movies where title is not null
Select distinct rating from movies
select distinct rating from movies
select * from movies where rating = 'Unrated'
select * from movies where rating = 'Unrated'
select title from movies where code not in ( select movie from movietheaters )
select title from movies where code not in ( select movie from movietheaters )
select recipient from package order by weight desc limit 1
select c.name from client c where exists ( select 1 from package p where p.recipient = c.accountnumber and p.weight = ( select max ( weight ) from package ) )
select sum ( package.weight ) from client join package on client.accountnumber = package.sender where client.name = 'Leo Wong'
select sum ( weight ) from employee join package on employee.employeeid = package.sender where employee.name = 'Leo' and employee.name = 'Wong'
select position from employee where name = 'Amy Wong'
select position from employee where name = 'Amy Wong'
select salary , position from employee where name = 'Turanga Leela'
select salary , position from employee where name = 'Turanga Leela'
select avg ( salary ) from employee where position = 'Intern'
select avg ( salary ) from employee where position = 'Intern'
select level from has_clearance where level = 'Physician'
select level from has_clearance join employee on has_clearance.employee = employee.employeeid where employee.position = 'Physician'
select packagenumber from package join client on package.sender = client.accountnumber where client.name = 'Leo Wong'
select count ( * ) from employee join package on employee.employeeid = package.sender where employee.name = 'Leo Wong'
select packagenumber from package join client on package.recipient = client.accountnumber where client.name = 'Leo Wong'
select packagenumber from package join client on package.recipient = client.accountnumber where client.name = 'Leo Wong'
select package.contents from client join package on client.accountnumber = package.sender where client.name = 'Leo Wong'
select distinct packagenumber from employee join package on employee.employeeid = package.sender where employee.name = 'Leo Wong'
select count ( * ) from package join client on package.sender = client.accountnumber where client.name = 'Ogden Wernstrom' and package.recipient = 'Leo Wong'
select count ( * ) from package join client on package.sender = client.accountnumber where client.name = 'Ogden Wernstrom' and package.recipient = 'Leo Wong'
select contents from package where sender = 'John Zoidfarb'
select contents from package where sender = 'John Zoniadfarb'
select p.packagenumber , p.weight from package p join client c on p.sender = c.accountnumber where c.name like '%John%'
select packagenumber , weight from package join client on package.sender = client.accountnumber where client.name = 'John' or client.name = 'Johnny'
select packagenumber , weight from package order by weight asc limit 3
select packagenumber , weight from package order by weight asc limit 3
select client.name , count ( * ) from package join client on package.sender = client.accountnumber group by client.name order by count ( * ) desc limit 1
select client.name , count ( * ) from package join client on package.sender = client.accountnumber group by client.name order by count ( * ) desc limit 1
select client.name , count ( package.shipment ) as total_packages from client left join package on client.accountnumber = package.recipient group by client.accountnumber order by total_packages asc limit 1
select count ( * ) , recipient from package group by recipient order by count ( * ) asc limit 1
select name from ( select client.name , count ( package.recipient ) as num_packets from client join package on client.accountnumber = package.sender group by client.accountnumber having num_packets > 1 )
select client.name from package join client on package.sender = client.accountnumber group by client.accountnumber having count ( * ) > 1
select coordinates from planet where name = 'Mars'
select coordinates from planet where name = 'Mars'
select name , coordinates from planet order by name asc
select name , coordinates from planet order by name asc
select shipmentid from employee join shipment on employee.employeeid = shipment.manager where employee.name = 'Phillip J. Fry'
select s.shipmentid from shipment s join employee e on s.manager = e.employeeid where e.name = 'Phillip J. Fry'
select date from shipment
select date from shipment
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipmentid from shipment join planet on shipment.planet = planet.planetid join employee on shipment.manager = employee.employeeid where planet.name = 'Mars' and employee.name = 'Turanga Leela'
select s.shipmentid from shipment s join planet p on s.planet = p.planetid join employee e on s.manager = e.employeeid where p.name = 'Mars' and e.name = 'Turanga Leela'
select shipmentid from shipment where planet = 'Mars' union select shipment.shipmentid from shipment join employee on shipment.manager = employee.employeeid where employee.name = 'Turanga Leela'
select shipmentid from employee join shipment on employee.employeeid = shipment.manager where planet = 'Mars' and employee.name = 'Turanga Leela'
select planet.name , sum ( shipment.shipmentid ) from shipment join planet on shipment.planet = planet.planetid group by planet.name
select planet , count ( * ) from shipment group by planet
select name from planet where planetid in ( select planet from shipment group by planet having count ( shipmentid ) = ( select max ( cnt ) from ( select count ( shipmentid ) as cnt from shipment group by planet ) ) )
select planet.name from planet join ( select planet from shipment group by planet having count ( shipmentid ) = ( select max ( count ) from ( select count ( shipmentid ) as count from shipment group by planet ) ) ) as maxships on planet.planetid = maxships.planet
select employee.name , count ( * ) from employee join shipment on employee.employeeid = shipment.manager group by shipment.manager
select count ( * ) , employee.name from shipment join employee on shipment.manager = employee.employeeid group by shipment.manager
select sum ( weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select planet.name , sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by planet.planetid
select sum ( package.weight ) , planet.name from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by shipment.planet
select planet.name from package join planet on package.shipment = planet.planetid group by planet.planetid having sum ( package.weight ) > 30
sql placeholder
select packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' and package.sender = 'Zapp Brannigan'
select count ( * ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where package.sender = 'Zapp' and package.recipient = 'Brannonigan' and shipment.planet = 'Omicron Persei 8'
select packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' or package.sender = 'Zapp Brannigan'
select count ( * ) from package join shipment on package.shipment = shipment.shipmentid join planet on planet.planetid = shipment.planet where planet.name = 'Omicron Persei 8' or package.sender = 'Zapp Brannigan'
select packagenumber , weight from package where weight between 10 and 30
select packagenumber , weight from package where weight between 10 and 30
select name from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select employee.name from employee where employee.employeeid not in ( select has_clearance.employee from has_clearance join planet on has_clearance.planet = planet.planetid where planet.name = 'Mars' )
select name from employee where employeeid in ( select employee from has_clearance where planet = 'Omega 3' )
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee join planet on has_clearance.planet = planet.planetid where planet.name = 'Omega III'
select planet.name from planet join has_clearance on planet.planetid = has_clearance.planet group by has_clearance.planet having count ( * ) = 1
select name from planet where planetid in ( select planet from has_clearance group by planet having count ( employee ) = 1 )
select name from employee where salary between 5000 and 10000
select name from employee where salary between 5000 and 10000
select name from employee where salary > ( select avg ( salary ) from employee ) or salary > 5000
select name from employee where salary > ( select avg ( salary ) from employee )or salary > 5000
select count ( * ) from employee where employeeid not in ( select employee from has_clearance join planet on has_clearance.planet = planet.planetid where planet.name = 'Mars' )
select count ( * ) from employee where employeeid not in ( select employee from has_clearance join planet on has_clearance.planet = planet.planetid where planet.name = 'Mars' )
select count ( * ) from game
select count ( * ) from game
select title , developers from game order by units_sold_millions desc
select title , developers from game order by units_sold_millions desc
select avg ( units_sold_millions ) from game where developers Not in ( select developers from game where developers = 'Nintendo' )
select avg ( units_sold_millions ) from game where developers Not in ( select developers from game where developers = 'Nintendo' )
select platform_name , market_district from platform
select platform_name , market_district from platform
select platform_name , platform_id from platform where download_rank = '1'
select platform_name , platform_id from platform where download_rank = '1'
select max ( rank_of_the_year ) , min ( rank_of_the_year ) from player
select max ( rank_of_the_year ) , min ( rank_of_the_year ) from player
select count ( distinct player_id ) from player where rank_of_the_year < 3
select count ( distinct p.player_id ) from player p where p.rank_of_the_year <= 3
select player_name from player order by player_name asc
select player_name from player order by player_name asc
select player_name , college from player order by rank_of_the_year desc
select player_name , college from player order by rank_of_the_year desc
select player.player_name , player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = 'Super Mario World'
select player.player_name , player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = 'Super Mario World'
select distinct game.developers from game_player join game on game.game_id = game_player.game_id join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select distinct game.developers from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select avg ( game.units_sold_millions ) from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.position = 'Guard'
select avg ( game.units_sold_millions ) from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.position = 'Guard'
select game.title , platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title , platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title from platform join game on platform.platform_id = game.platform_id where platform.market_district = 'Asia' or platform.market_district = 'USA'
select title from game where platform_id in ( select platform_id from platform where market_district = 'Asia' or market_district = 'USA' )
select franchise , count ( * ) from game group by Franchise
select franchise , count ( * ) from game group by Franchise
select franchise from game group by franchise having count ( * ) = ( select max ( total_games ) from ( select count ( * ) as total_games from game group by franchise ) )
select g.franchise from game g group by g.franchise having count ( g.game_id ) = ( select max ( total ) from ( select count ( game_id ) as total from game group by franchise ) )
select franchise from game group by franchise having count ( * ) >=2
select franchise from game group by franchise having count ( * ) >= 2
select player_name from player where player_id not in ( select player_id from game_player )
select player_name from player where player_id not in ( select player_id from game_player )
select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Oklahoma' intersect select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select title from game where game_id in ( select gp.game_id from game_player gp join player p on gp.player_id = p.player_id where p.college = 'Oklahoma' or p.college = 'Auburn' )
select distinct franchise from game
select distinct franchise from game
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select name from press order by year_profits_billion desc
select name from press order by year_profits_billion desc
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select p.name from press p where p.year_profits_billion > 15 or p.month_profits_billion > 1
select avg ( year_profits_billion ) , max ( year_profits_billion ) from press
select avg ( year_profits_billion ) , max ( year_profits_billion ) , name from press group by name
select s.name from press s where s.month_profits_billion = ( select max ( month_profits_billion ) from press )
select j.name from press j where j.month_profits_billion = ( select max ( month_profits_billion ) from press )
select x.name from press x where x.month_profits_billion = ( select max ( month_profits_billion ) from press ) or x.month_profits_billion = ( select min ( month_profits_billion ) from press )
select x.name from press x where x.month_profits_billion = ( select max ( month_profits_billion ) from press ) or x.month_profits_billion = ( select min ( month_profits_billion ) from press )
select count ( * ) from author where age < 30
select count ( * ) from ( select age from author where age < 30 )
select avg ( age ) , gender from author group by gender
select gender , avg ( age ) from author group by gender
select count ( * ) , gender from author where age >30 group by gender
select gender , count ( * ) from author where age > 30 group by gender
select title from book order by release_date desc
select title from book order by release_date desc
select book_series , count ( * ) from book group by book_Series
select book_series , count ( * ) from book group by book_series
select title , release_date from book order by sale_amount desc limit 5
select title , release_date from book order by sale_amount desc limit 5
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select name from author where author_id in ( select author_id from book where book_series = 'MM' intersect select author_id from book where book_series = 'LT' )
select name from author where author_id in ( select author_id from book where book_series = 'MM' intersect select author_id from book where book_series = 'LT' )
select name , age from author where author_id not in ( select author_id from book )
select name from author where author_id not in ( select author_id from book )
select author.name from book join author on book.author_id = author.author_id group by author.author_id having count ( * ) > 1
select author.name from book join author on book.author_id = author.author_id group by author.author_id having count ( * ) > 1
select title , author.name , press.name from book join author on book.author_id = author.author_id join press on book.press_id = press.press_id order by book.sale_amount desc limit 3
select book.title , author.name , press.name from press join book on press.press_id = book.press_id join author on book.author_id = author.author_id order by book.sale_amount desc limit 3
select press.name , sum ( book.sale_amount ) from book join press on book.press_id = press.press_id group by press.Press_id
select press.name , sum ( book.sale_amount ) from book join press on book.press_id = press.press_id group by press.Press_id
select press.name , count ( * ) from press join book on press.press_id = book.press_id where book.sale_amount > 1000 group by press.press_id
select press.name , count ( * ) from press join book on book.press_id = press.press_id where book.sale_amount > 1000 group by press.press_id
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select author.name , author.gender from author join ( select author_id from book group by author_id having count ( book_id ) = ( select max ( cnt ) from ( select count ( book_id ) as cnt from book group by author_id ) ) ) top_author on author.author_id = top_author.author_id
select a.name , a.gender from author a where exists ( select null from book b where b.author_id = a.author_id group by b.author_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from book group by author_id ) ) )
select name from author where author_id not in ( select author_id from book join press on book.press_id = press.press_id where press.name = 'Accor' )
select name from author where author_id not in ( select author_id from book join press on book.press_id = press.press_id where press.name = 'Accor' )
select press.name , press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count ( * ) > 2
select press.name , press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count ( * ) > 2
select count ( * ) from authors
select author_name from authors
select author_name , other_details from ( select author_name , other_details from authors ) as author_report
select other_details from authors where author_name = 'Addison Denesik'
select count ( * ) from documents
select authors.author_name from authors join documents on authors.author_name = documents. author_name where documents.document_id = 4
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to Brazil'
select count ( * ) from authors join documents on authors.author_name = documents.author_name where authors.author_name = 'Era Kerluke'
select document_name , document_description from documents
select documents.document_id , document_name from documents join authors on documents.author_name = authors.author_name where authors.author_name = 'Bianka Cummings'
select authors.author_name , documents.other_details from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to China'
select a.author_name , count ( d.document_id ) from authors a left join documents d on a.author_name = d.author_name group by a.author_name
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count ( documents.document_id ) = ( select max ( counts ) from ( select count ( document_id ) as counts from documents group by author_name ) as counts )
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count ( * ) >= 2
select count ( * ) from business_processes
select next_process_id , process_name , process_description from business_processes where process_id = 9.
select process_name from business_processes where next_process_id in ( select next_process_id from business_processes where process_id = 9 )
select count ( * ) from process_outcomes
select process_outcome_code , process_outcome_description from process_outcomes
select process_outcome_description from process_outcomes where process_outcome_code = 'working'
select count ( distinct process_status_code ) from process_status
select process_status_code , process_status_description from process_status
select process_status_description from process_status where process_status_code = 'ct'
select count ( * ) from staff
select staff_id , staff_details from staff
select staff_details from staff where staff_id = 100
select count ( * ) from ( select staff_role_code , count ( staff_role_description ) as num_roles from ref_staff_roles group by staff_role_code )
select staff_role_code , staff_role_description from ref_staff_roles
select staff_role_description from ref_staff_roles where staff_role_code = 'HR'
select count ( distinct document_id ) from documents_processes
select distinct process_id from documents_processes
select document_id from documents except select document_id from documents_processes
select process_id from business_processes except select process_id from documents_processes
select process_outcomes.process_outcome_description , process_status.process_status_description from process_outcomes join documents_processes on process_outcomes.process_outcome_code = documents_processes.process_outcome_code join process_status on documents_processes.process_status_code = process_status.process_status_code where document_id = 0
select business_processes.process_name from documents join documents_processes on documents.document_id = documents_processes.document_id join business_processes on documents_processes.process_id = business_processes.process_id where documents.document_name = 'Travel to Brazil'
select a.process_id , count ( b.document_id ) as num_docs from documents_processes a left join staff_in_processes b on a.process_id = b.process_id left join documents d on a.document_id = d.document_id group by a.process_id
select count ( distinct s.staff_id ) from staff s join staff_in_processes sip on s.staff_id = sip.staff_id join documents_processes dp on sip.process_id = dp.process_id where dp.document_id = 0 and dp.process_id = 9
select s.staff_id , count ( distinct si.document_id ) as num_processes from staff s left join staff_in_processes si on s.staff_id = si.staff_id group by s.staff_id
select staff_role_code , count ( document_id ) as num_processes from staff_in_processes left join staff on staff_in_processes.staff_id = staff.staff_id group by staff_role_code
select count ( distinct ref_staff_roles.staff_role_code ) from staff join staff_in_processes on staff.staff_id = staff_in_processes.staff_id join ref_staff_roles on staff_in_processes.staff_role_code = ref_staff_roles.staff_role_code where staff.staff_id = 3
select count ( * ) from agencies
select count ( * ) from agencies
select agency_id , agency_details from agencies
select agency_id , agency_details from agencies
select count ( * ) from clients
select count ( * ) from clients
select client_id , client_details from clients
select client_id , client_details from clients
select ag.agency_id , count ( distinct c.client_id ) as client_count from agencies ag left join clients c on ag.agency_id = c.agency_id group by ag.agency_id
select agencies.agency_id , count ( * ) from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agency_id , client_details from clients group by agency_id having count ( clients.client_id ) = ( select max ( count ) from ( select count ( clients.client_id ) as count from clients group by agency_id ) )
select agencies.agency_id , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id group by agencies.agency_id order by count ( * ) desc limit 1
select agency_id , client_details from clients group by agency_id having count ( * ) >= 2
select clients.agency_id , clients.client_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id having count ( * ) >= 2
select agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id where clients.client_details = 'Mac'
select agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id where clients.client_details = 'Mac'
select client_details , staff_details from clients join staff on clients.agency_id = staff.agency_id
select clients.client_details as client_details , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select sic_code , count ( * ) from clients group by sic_code
select sic_code , count ( * ) from clients group by sic_Code
select client_id , client_details from clients where sic_code = 'Bad'
select client_id , client_details from clients where sic_code = 'Bad'
select agencies.agency_id , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select agency_id , agency_details from agencies where agency_id in ( select agency_id from clients )
select agency_id from agencies except select agency_id from clients
select agency_id from agencies except select agency_id from clients
select count ( * ) from invoices
select count ( * ) from invoices
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from invoices join clients on invoices.client_id = clients.client_id
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from invoices
select clients.client_id , count ( invoices.invoice_id ) as invoice_count from clients left join invoices on clients.client_id = invoices.client_id group by clients.client_id
select clients.client_id , count ( * ) from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id
select clients.client_id , clients.client_details from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id order by count ( * ) desc limit 1
select c.client_id , c.client_details from clients c where exists ( select null from invoices i where i.client_id = c.client_id group by i.client_id having count ( i.invoice_id ) = ( select max ( cnt ) from ( select count ( invoice_id ) as cnt from invoices group by client_id ) as counts ) )
select invoices.client_id from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id having count ( * ) >= 2
select invoices.client_id from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id having count ( * ) >= 2
select invoice_status as invoice_status , count ( * ) from invoices group by invoice_status
select invoice_status , count ( * ) as invoice_count from invoices group by invoice_status
select invoice_status from invoices group by invoice_status having count ( invoice_status ) = ( select max ( count ) from ( select count ( invoice_status ) as count from invoices group by invoice_status ) )
select i.invoice_status from invoices i group by i.invoice_status having count ( i.invoice_id ) = ( select max ( count ) from ( select count ( invoice_id ) as count from invoices group by invoice_status ) )
select invoices.invoice_status , invoices.invoice_details , clients.client_id , agencies.agency_id , clients.client_details from invoices join clients on invoices.client_id = clients.client_id join agencies on clients.agency_id = agencies.agency_id
sql placeholder
select meeting_type , other_details from ( select meeting_type , other_details from meetings ) as _
select meeting_type , other_details from ( select meeting_type , other_details from meetings ) as unique_meetings
select meeting_outcome , purpose_of_meeting from meetings
select meeting_outcome , purpose_of_meeting from meetings
select payments.invoice_id , invoices.invoice_details from invoices join payments on invoices.invoice_id = payments.invoice_id where invoices.invoice_status = 'Working'
select payments.payment_id , payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = 'Working'
select invoice_id , invoice_status from invoices except select invoices.invoice_id , invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select invoice_id , invoice_status from invoices except select invoices.invoice_id , invoices.invoice_status from invoices join payments on invoices.invoice_id = payments.invoice_id
select count ( * ) from payments
select count ( * ) from payments
select payments.payment_id , payments.invoice_id , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id
select payment_id , invoice_id , payment_details from payments
select distinct invoices.invoice_id , invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select distinct invoices.invoice_id , invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select invoices.invoice_id , count ( payments.payment_id ) as number_of_payments from invoices left join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id , count ( payments.payment_id ) as num_payments from invoices left join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count ( * ) desc limit 1
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count ( * ) desc limit 1
select count ( * ) from staff
select count ( * ) from staff
select ag.agency_id , count ( distinct s.staff_id ) as staff_count from agencies ag left join staff s on ag.agency_id = s.agency_id group by ag.agency_id
select a.agency_id , count ( distinct s.staff_id ) from agencies a left join staff s on a.agency_id = s.agency_id group by a.agency_id
select a.agency_id , a.agency_details from agencies a , staff s where a.agency_id = s.agency_id group by a.agency_id having count ( s.staff_id ) = ( select max ( total ) from ( select count ( staff_id ) as total from staff group by agency_id ) )
select agencies.agency_id , agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count ( * ) desc limit 1
select meeting_outcome as meeting_outcome , count ( * ) from meetings group by meeting_outcome
Select meeting_outcome , count ( * ) from meetings group by meeting_outcome
select clients.client_id , ( select count ( * ) from meetings where client_id = clients.client_id ) as meeting_count from clients
select clients.client_id , count ( * ) from meetings join clients on meetings.client_id = clients.client_id group by meetings.client_id
select meeting_type , count ( * ) from meetings group by client_id
select meeting_type , count ( * ) from meetings group by meeting_type
select meeting_id , meeting_outcome , meeting_type , clients.client_details from meetings join clients on meetings.client_id = clients.client_id
select meeting_id , meeting_outcome , meeting_type , clients.client_details from meetings join clients on meetings.client_id = clients.client_id
select m.meeting_id , count ( distinct s.staff_id ) from meetings m left join staff_in_meetings s on m.meeting_id = s.meeting_id group by m.meeting_id
select meetings.meeting_id , count ( staff_in_meetings.staff_id ) from meetings join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id group by meetings.meeting_id
select staff.staff_id , count ( * ) from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff.staff_id having count ( * ) = ( select min ( meeting_count ) from ( select count ( meeting_id ) as meeting_count from staff_in_meetings group by staff_id ) )
select staff_id from staff_in_meetings group by staff_id having count ( meeting_id ) = ( select min ( cnt ) from ( select count ( meeting_id ) as cnt from staff_in_meetings group by staff_id ) )
select count ( distinct staff_id ) from staff_in_meetings
select count ( distinct staff_id ) from ( select distinct staff_id from staff_in_meetings )
select count ( * ) from staff where staff_id not in ( select distinct staff_id from staff_in_meetings )
select count ( * ) from staff where staff_id not in ( select staff_Id from staff_in_meetings )
select clients.client_id , clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id
select clients.client_id , clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id
select distinct s.staff_id , s.staff_details from staff s join staff_in_meetings sim on s.staff_id = sim.staff_id where s.staff_details like '%s%'
select distinct s.staff_id , s.staff_details from staff s join staff_in_meetings si on s.staff_id = si.staff_id where s.staff_details like '%s%'
select clients.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id group by meetings.client_id having count ( * ) = 1 intersect select clients.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id group by meetings.client_id having count ( * ) = 1
select meetings.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id group by meetings.client_id having count ( * ) = 1
sql placeholder
select meetings.start_date_time , meetings.end_date_time , clients.client_details , staff.staff_details from meetings join clients on meetings.client_id = clients.client_id join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id join staff on staff_in_meetings.staff_id = staff.staff_id
