select count ( * ) from club
select count ( * ) from club
select name from club order by name asc
select name from club order by name asc
select manager , captain from club
select manager , captain from club
select name from club where manufacturer != 'Nike'
select name from club where manufacturer != 'Nike'
select name from player order by wins_count asc
select name from player order by wins_count asc
select name from player where earnings = ( select max ( earnings ) from player )
select name from player where earnings = ( select max ( earnings ) from player )
select distinct country from player where earnings > 1200000
select distinct country from player where earnings > 1200000
select country from player where wins_count > 2 group by country order by sum ( earnings ) desc limit 1
select country from player where wins_count > 2 group by country order by sum ( earnings ) desc limit 1
select player.name , club.name from player join club on player.club_id = club.club_id
select player.name , club.name from player join club on player.club_id = club.club_id
select name from club where club_id in ( select club_id from player where wins_count > 2 )
select club.name from club where club_id in ( select club_id from player where wins_count > 2 )
select player.name from player join club on player.club_id = club.club_id where club.manager = 'Sam Allardyce'
select player.name from player join club on player.club_id = club.club_id where club.manager = 'Sam Allardyce'
select name from club where club_id in ( select club_id from player group by club_id order by avg ( earnings ) desc )
select c.name from club c join player p on c.club_id = p.club_id group by c.name order by avg ( p.earnings ) desc
select manufacturer , count ( distinct club_id ) as number_of_clubs from club group by manufacturer
select manufacturer , count ( * ) from club group by manufacturer
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( cnt ) from ( select count ( manufacturer ) as cnt from club group by manufacturer ) )
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( cnt ) from ( select count ( manufacturer ) as cnt from club group by manufacturer ) )
select manufacturer from club group by manufacturer having count ( * ) > 1
select manufacturer from club group by manufacturer having count ( * ) > 1
select country from player group by country having count ( player_id ) > 1
select country from player group by country having count ( player_id ) > 1
select name from club where club_id not in ( select club_id from player )
select name from club where club_id not in ( select club_id from player )
select distinct country from player where earnings > 1400000 and earnings < 1100000
select distinct country from player where earnings > 1400000 intersect select distinct country from player where earnings < 1100000
select count ( distinct country ) from player
select count ( distinct country ) from player
select earnings from player where country in ( 'Australia' , 'Zimbabwe' )
select earnings from player where country in ( 'Australia' , 'Zimbabwe' )
sql placeholder
sql placeholder
select o.order_id , o.order_status_code , count ( distinct oi.product_id ) as product_count from orders o join order_items oi on o.order_id = oi.order_id group by o.order_id , o.order_status_code
select orders.order_id , ( select count ( * ) from order_items where order_items.order_id = orders.order_id ) as product_count from orders
select o.date_order_placed from orders o where o.date_order_placed = ( select min ( date_order_placed ) from orders ) or o.order_id in ( select order_id from order_items group by order_id having count ( order_id ) > 1 )
select min ( orders.date_order_placed ) as earliest_order , sum ( orders.date_order_placed ) as total_order_date from orders inner join order_items on orders.order_id = order_items.order_id group by orders.order_id having count ( order_items.order_id ) > 1
select customer_first_name , customer_middle_initial , customer_last_name from customers where customer_id not in ( select customer_id from orders )
select customer_first_name , customer_last_name , customer_middle_initial from customers where customer_id not in ( select customer_id from orders )
select product_id , product_name , product_price , product_color from products where product_id not in ( select product_id from order_items group by product_id having count ( order_id ) >= 2 )
select product_id , product_name , product_price , product_color from products where product_id in ( select product_id from order_items group by product_id having count ( order_id ) < 2 )
select o.order_id , o.date_order_placed from orders o join order_items oi on o.order_id = oi.order_id group by o.order_id having count ( distinct oi.product_id ) >= 2
select o.order_id , o.date_order_placed from orders o where o.order_id in ( select oi.order_id from order_items oi group by oi.order_id having count ( distinct oi.product_id ) >= 2 )
select product_id , product_name , product_price from products where product_id in ( select product_id from order_items group by product_id having count ( product_id ) = ( select max ( cnt ) from ( select count ( product_id ) as cnt from order_items group by product_id ) ) )
select products.product_id , products.product_name , products.product_price from products join order_items on products.product_id = order_items.product_id group by products.product_id order by count ( * ) desc limit 1
sql placeholder
sql placeholder
select payment_method_code from customer_payment_methods group by payment_method_code having count ( payment_method_code ) = ( select max ( cnt ) from ( select count ( payment_method_code ) as cnt from customer_payment_methods group by payment_method_code ) tmp )
with popularpayment as ( select payment_method_code , count ( customer_id ) as popularity from customer_payment_methods group by payment_method_code ) select payment_method_code from popularpayment where popularity = ( select max ( popularity ) from popularpayment )
select customers.gender_code , count ( distinct order_items.product_id ) as number_of_products from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.gender_code
select customers.gender_code , count ( distinct order_items.product_id ) as product_count from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by customers.gender_code
select customers.gender_code , count ( orders.order_id ) as order_count from customers join orders on customers.customer_id = orders.customer_id group by customers.gender_code
select gender_code , count ( order_id ) as number_of_orders from customers join orders on customers.customer_id = orders.customer_id group by gender_code
select customer_first_name , customer_middle_initial , customer_last_name , payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select customer_first_name , customer_middle_initial , customer_last_name , payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select invoices.invoice_status_code , invoices.invoice_date , shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select invoice_status_code , invoice_date , shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select product_name , product_color from products where product_id in ( select product_id from shipment_items )
select distinct products.product_name , products.product_price , products.product_description from products join order_items on products.product_id = order_items.product_id join orders on order_items.order_id = orders.order_id join customers on orders.customer_id = customers.customer_id where customers.gender_code = 'female'
select distinct products.product_name , products.product_price , products.product_description from products join order_items on products.product_id = order_items.product_id join orders on order_items.order_id = orders.order_id join customers on orders.customer_id = customers.customer_id where customers.gender_code = 'female'
select invoice_status_code from invoices where invoice_number not in ( select invoice_number from shipments )
select distinct invoice_number from shipments where order_id not in ( select order_id from orders )
sql placeholder
sql placeholder
select count ( distinct orders.customer_id ) from orders
select count ( distinct orders.customer_id ) from orders
select count ( distinct order_item_status_code ) from order_items
select count ( distinct order_item_status_code ) from order_items
select count ( distinct payment_method_code ) from customer_payment_methods
select count ( distinct payment_method_code ) from customer_payment_methods
select login_name , login_password from customers where phone_number like '%12%'
sql placeholder
select product_size from products where product_name like '%Dell%'
select product_size from products where product_name like '%Dell%'
select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select count ( distinct product_id ) from products where product_id not in ( select product_id from order_items )
select count ( * ) from order_items where product_id not in ( select product_id from orders )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select order_status_code , date_order_placed from orders
select order_status_code , date_order_placed from orders
select address_line_1 , town_city , county from customers where country = 'USA'
select address_line_1 , town_city , county from customers where country = 'United States'
sql placeholder
select customers.customer_first_name , products.product_name from customers inner join orders on customers.customer_id = orders.customer_id inner join order_items on orders.order_id = order_items.order_id inner join products on order_items.product_id = products.product_id
select count ( * ) from shipment_items
select count ( * ) from products where product_id in ( select product_id from shipment_items join shipments on shipment_items.shipment_id = shipments.shipment_id )
select avg ( product_price ) from products
select avg ( product_price ) from products
select avg ( product_price ) from products where product_id in ( select product_id from order_items )
select avg ( product_price ) from products where product_id in ( select product_id from order_items group by product_id )
sql placeholder
sql placeholder
select date_order_placed from orders where customer_id in ( select customer_id from customer_payment_methods group by customer_id having count ( distinct payment_method_code ) >= 2 )
select o.date_order_placed from orders o where o.customer_id in ( select cp.customer_id from customer_payment_methods cp group by cp.customer_id having count ( distinct cp.payment_method_code ) >= 2 )
select order_status_code from orders group by order_status_code order by count ( * ) desc limit 1
select order_status_code from orders group by order_status_code order by count ( * ) asc limit 1
select products.product_id , products.product_description from products join order_items on products.product_id = order_items.product_id group by products.product_id , products.product_description having count ( order_items.order_item_id ) > 3
select product_id , product_description from products where product_id in ( select product_id from order_items group by product_id having count ( * ) > 3 )
select invoices.invoice_date , invoices.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by invoices.invoice_number having count ( shipments.shipment_id ) >= 2
select invoices.invoice_date , invoices.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by invoices.invoice_number having count ( distinct shipments.shipment_id ) >= 2
select shipment_tracking_number , shipment_date from shipments
select shipment_tracking_number , shipment_date from shipments
select product_color , product_description , product_size from products where product_price < ( select max ( product_price ) from products )
select product_color , product_description , product_size from products where product_price < ( select max ( product_price ) from products )
select name from director where age > ( select avg ( age ) from director )
select d.name from director d where d.age = ( select max ( age ) from director )
select count ( * ) from channel where internet like '%bbc%'
select count ( distinct digital_terrestrial_channel ) from channel
select title from program order by start_year desc
select director.name from director join program on director.director_id = program.director_id group by director.director_id order by count ( program.program_id ) desc limit 1
select name , age from director where director_id in ( select director_id from program group by director_id having count ( program_id ) = ( select max ( cnt ) from ( select count ( program_id ) as cnt from program group by director_id ) ) )
select title from program order by start_year desc limit 1
select channel.name , channel.internet from channel join program on channel.channel_id = program.channel_id group by channel.channel_id having count ( program.program_id ) > 1
select name , count ( program.program_id ) as program_count from channel left join program on channel.channel_id = program.channel_id group by channel.channel_id
select count ( * ) from channel where channel_id not in ( select channel_id from program )
select name from director where director_id in ( select director_id from program where title = 'Dracula' )
select name , internet from channel where channel_id in ( select channel_id from director_admin group by channel_id having count ( director_id ) = ( select max ( cnt ) from ( select count ( director_id ) as cnt from director_admin group by channel_id ) ) )
select name from director where age between 30 and 60
select distinct name from channel where channel_id in ( select channel_id from director_admin join director on director_admin.director_id = director.director_id where age < 40 ) and channel_id in ( select channel_id from director_admin join director on director_admin.director_id = director.director_id where age > 60 )
select channel.channel_id , channel.name from channel where channel.channel_id not in ( select channel_id from director_admin join director on director_admin.director_id = director.director_id where director.name = 'Hank Baskett' )
select count ( distinct radio_id ) from radio
select transmitter from radio order by erp_kw asc
select tv_show_name , original_airdate from tv_show
select station_name from city_channel where affiliation != 'ABC'
select transmitter from radio where erp_kw > 150 or erp_kw < 30
select transmitter from radio where erp_kw = ( select max ( erp_kw ) from radio )
select avg ( erp_kw ) from radio
select affiliation , count ( * ) as num_channels from city_channel group by affiliation
select affiliation from city_channel group by affiliation having count ( affiliation ) = ( select max ( cnt ) from ( select count ( * ) as cnt from city_channel group by affiliation ) )
select affiliation from city_channel group by affiliation having count ( * ) > 3
select city , station_name from city_channel order by station_name asc
select radio.transmitter , city_channel.city from radio join city_channel_radio on radio.radio_id = city_channel_radio.radio_id join city_channel on city_channel_radio.city_channel_id = city_channel.id
sql placeholder
select radio.transmitter , count ( distinct city_channel_radio.city_channel_id ) as channel_count from radio left join city_channel_radio on radio.radio_id = city_channel_radio.radio_id group by radio.radio_id
select distinct transmitter from radio where radio_id not in ( select radio_id from city_channel_radio )
select model from vehicle where top_speed = ( select max ( top_speed ) from vehicle where power > 6000 )
select v.model from vehicle v where v.power > 6000 order by v.top_speed desc limit 1
select name from driver where citizenship = 'United States'
select name from driver where citizenship = 'United States'
select max ( vehicle_id ) as max_vehicles , driver_id from vehicle_driver group by driver_id having max ( vehicle_id ) = ( select max ( total ) from ( select count ( vehicle_id ) as total from vehicle_driver group by driver_id ) )
select driver.driver_id , count ( vehicle_driver.vehicle_id ) as total_vehicles from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id group by driver.driver_id order by total_vehicles desc limit 1
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select vehicle.vehicle_id from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_id group by vehicle.vehicle_id order by count ( * ) asc limit 1
select vehicle.vehicle_id from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_id group by vehicle.vehicle_id order by count ( * ) asc limit 1
select top_speed , power from vehicle where build_year = 1996
select top_speed , power from vehicle where build_year = 1996
select build_year , model , builder from vehicle
select build_year , model , builder from vehicle
select count ( distinct driver.driver_id ) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count ( distinct driver.driver_id ) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle.vehicle_id = vehicle_driver.vehicle_id where vehicle.build_year = 2012
select count ( distinct d.driver_id ) from driver d where d.racing_series = 'NASCAR'
select count ( distinct d.driver_id ) from driver d where d.racing_series = 'NASCAR'
select avg ( top_speed ) from vehicle
select avg ( top_speed ) from vehicle
select distinct driver.name from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.power > 5000
select distinct driver.name from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.power > 5000
select model from vehicle where total_production > 100 or top_speed > 150
select distinct model from vehicle where total_production > 100 or top_speed > 150
select model , build_year from vehicle where model like '%DJ%'
select model , build_year from vehicle where model like '%DJ%'
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select vehicle.vehicle_id , vehicle.model from vehicle where vehicle.vehicle_id in ( select vehicle_id from vehicle_driver group by vehicle_id having count ( distinct driver_id ) = 2 ) or vehicle.builder = 'Ziyang'
select vehicle.vehicle_id , vehicle.model from vehicle where vehicle.vehicle_id in ( select vehicle_id from vehicle_driver group by vehicle_id having count ( distinct driver_id ) = 2 ) or vehicle.builder = 'Ziyang'
select vehicle.vehicle_id , vehicle.model from vehicle where vehicle.vehicle_id in ( select vehicle_id from vehicle_driver group by vehicle_id having count ( distinct driver_id ) > 2 ) or vehicle.vehicle_id in ( select vehicle_id from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' )
select vehicle_id , model from vehicle where vehicle_id in ( select vehicle_id from vehicle_driver group by vehicle_id having count ( distinct driver_id ) > 2 ) or vehicle.vehicle_id in ( select vehicle_id from vehicle_driver where driver_id = ( select driver_id from driver where name = 'Jeffrey Gordon' ) )
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select name from driver order by name asc
select name from driver order by name asc
select racing_series , count ( distinct driver_id ) as drivers_count from driver group by racing_series
select racing_series , count ( distinct driver_id ) as num_drives from driver group by racing_series
select driver.name , driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select driver.name , driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select count ( * ) from driver where driver_id not in ( select driver_id from vehicle_driver )
select count ( * ) from driver where driver_id not in ( select driver_id from vehicle_driver )
select count ( * ) from exams
select count ( * ) from exams
select distinct subject_code from exams order by subject_code asc
select distinct subject_code from exams order by subject_code asc
select exam_name , exam_date from exams where subject_code != 'Database'
select exam_date , exam_name from exams where subject_code != 'Database'
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select type_of_question_code , count ( * ) as count from questions group by type_of_question_code
select type_of_question_code , count ( * ) from questions group by type_of_question_code
select distinct student_answer_text from student_answers where comments = 'Normal'
select distinct student_answer_text from student_answers where comments = 'Normal'
select count ( distinct comments ) from student_answers
select count ( distinct comments ) from student_answers
select student_answer_text from student_answers group by student_answer_text order by count ( * ) desc
select student_answer_text from student_answers group by student_answer_text order by count ( * ) desc
select s.first_name , sa.date_of_answer from students s join student_answers sa on s.student_id = sa.student_id
select students.first_name , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id
select students.email_adress , student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id order by student_answers.date_of_answer desc
select students.email_adress , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id order by student_answers.date_of_answer desc
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select students.first_name from students join student_answers on students.student_id = student_answers.student_id group by students.student_id having count ( student_answers.student_answer_id ) >= 2
select first_name from students where student_id in ( select student_id from student_answers group by student_id having count ( student_answer_id ) >= 2 )
select valid_answer_text from valid_answers group by valid_answer_text order by count ( valid_answer_id ) desc limit 1
select valid_answer_text from valid_answers group by valid_answer_text order by count ( * ) desc limit 1
select last_name from students where gender_mfu != 'M'
select last_name from students where gender_mfu != 'M'
select gender_mfu , count ( student_id ) from students group by gender_mfu
select gender_mfu , count ( student_id ) from students group by gender_mfu
select last_name from students where gender_mfu in ( 'F' , 'M' )
select last_name from students where gender_mfu in ( 'F' , 'M' )
select first_name from students where student_id not in ( select student_id from student_answers )
select first_name from students where student_id not in ( select student_id from student_answers )
select distinct sa.student_answer_text from student_answers sa where sa.comments in ( 'Normal' , 'Absent' ) group by sa.student_answer_text having count ( distinct sa.comments ) = 2
select distinct sa.student_answer_text from student_answers sa where sa.comments in ( 'Normal' , 'Absent' ) group by sa.student_answer_text having count ( distinct sa.comments ) = 2
select type_of_question_code from questions group by type_of_question_code having count ( question_id ) >= 3
select type_of_question_code from questions group by type_of_question_code having count ( question_id ) >= 3
select * from students
select * from students
select count ( distinct address_id ) from addresses
select count ( * ) from addresses
select address_id , address_details from addresses
select address_id , address_details from addresses
select count ( product_id ) from products
select count ( product_id ) from products
select product_id , product_type_code , product_name from products
select product_id , product_type_code , product_name from products
select product_price from products where product_name = 'Monitor'
select product_price from products where product_name = 'Monitor'
select min ( product_price ) , avg ( product_price ) , max ( product_price ) from products
select min ( product_price ) , avg ( product_price ) , max ( product_price ) from products
select avg ( product_price ) from products where product_type_code = 'Clothes'
select avg ( product_price ) from products where product_type_code = 'Clothes'
select count ( * ) from products where product_type_code = 'Hardware'
select count ( * ) from products where product_type_code = 'Hardware'
select product_name from products where product_price > ( select avg ( product_price ) from products )
select product_name from products where product_price > ( select avg ( product_price ) from products )
select product_name from products where product_price > ( select avg ( product_price ) from products where product_type_code = 'Hardware' )
select product_name from products where product_price > ( select avg ( product_price ) from products where product_type_code = 'Hardware' )
select product_name from products where product_type_code = 'Clothes' order by product_price desc limit 1
select p.product_name from products p where p.product_type_code = 'Clothes' and p.product_price = ( select max ( product_price ) from products where product_type_code = 'Clothes' )
select p.product_id , p.product_name from products p where p.product_type_code = 'Hardware' and p.product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' )
select p.product_id , p.product_name from products p where p.product_type_code = 'Hardware' and p.product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' )
select product_name from products order by product_price desc
select product_name from products order by product_price desc
select product_type_code from products where product_price = 'Hardware' order by product_price asc
select product_name from products where product_price = 'Hardware' order by product_price asc
select product_type_code , count ( product_id ) from products group by product_type_code
select product_type_code , count ( product_id ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code from products group by product_type_code having count ( * ) >= 2
select product_type_code from products group by product_type_code having count ( product_id ) >= 2
select product_type_code from products group by product_type_code having count ( product_id ) = ( select max ( cnt ) from ( select count ( product_id ) cnt from products group by product_type_code ) )
select product_type_code from products group by product_type_code order by count ( * ) desc limit 1
select count ( distinct customer_id ) from customers
select count ( customer_id ) from customers
select customer_id , customer_name from customers
select customer_id , customer_name from customers
select customer_address , customer_phone , customer_email from customers where customer_name = 'Jeromy'
select customer_address , customer_phone , customer_email from customers join addresses on customers.address_id = addresses.address_id where customer_name = 'Jeromy'
select payment_method_code , count ( distinct customer_id ) from customers group by payment_method_code
select payment_method_code , count ( distinct customer_id ) as customer_count from customers group by payment_method_code
with popularpayment as ( select payment_method_code , count ( * ) as popularity from customers group by payment_method_code ) select payment_method_code from popularpayment where popularity = ( select max ( popularity ) from popularpayment )
with paymentcount as ( select payment_method_code , count ( * ) as num from customers group by payment_method_code ) select payment_method_code from paymentcount where num = ( select max ( num ) from paymentcount )
select customer_name from customers group by customer_name order by count ( payment_method_code ) asc limit 1
select c.customer_name from customers c where c.payment_method_code = ( select payment_method_code from customers group by payment_method_code order by count ( * ) asc limit 1 )
select payment_method_code , customer_number from customers where customer_name = 'Jeromy'
select payment_method_code , customer_number from customers where customer_name = 'Jeromy'
select distinct payment_method_code from customers
select distinct payment_method_code from customers
select product_id , product_type_code from products order by product_name asc
select product_id , product_type_code from products order by product_name asc
select product_type_code from products group by product_type_code order by count ( product_id ) asc limit 1
select product_type_code from products group by product_type_code order by count ( * ) asc limit 1
select count ( * ) from customer_orders
select count ( order_id ) from customer_orders
select order_id , order_date , order_status_code from customer_orders where customer_id = 'Jeromy'
select order_id , order_date , order_status_code from customer_orders where customer_id = 'Jeromy'
select customers.customer_name , customers.customer_id , count ( customer_orders.order_id ) as number_of_orders from customers left join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id
select customers.customer_name , customers.customer_id , count ( customer_orders.order_id ) as number_of_orders from customers left join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id
select c.customer_id , c.customer_name , c.customer_phone , c.customer_email from customers c join customer_orders o on c.customer_id = o.customer_id group by c.customer_id having count ( o.order_id ) = ( select max ( total_orders ) from ( select count ( order_id ) as total_orders from customer_orders group by customer_id ) )
select c.customer_id , c.customer_name , c.customer_phone , c.customer_email from customers c join customer_orders o on c.customer_id = o.customer_id group by c.customer_id having count ( o.order_id ) = ( select max ( total_orders ) from ( select count ( order_id ) as total_orders from customer_orders group by customer_id ) )
select order_status_code , count ( * ) from customer_orders group by order_status_code
select order_status_code , count ( * ) from customer_orders group by order_status_code
select order_status_code from customer_orders group by order_status_code order by count ( * ) desc limit 1
select order_status_code from customer_orders group by order_status_code order by count ( * ) desc limit 1
select count ( * ) from customers where customer_id not in ( select customer_id from customer_orders )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_orders )
select product_name from products where product_id not in ( select product_id from order_items )
select product_name from products where product_id not in ( select product_id from order_items )
select count ( * ) from order_items join products on order_items.product_id = products.product_id where products.product_name = 'Monitor'
select count ( * ) from order_items join products on order_items.product_id = products.product_id where products.product_name = 'Monitor'
select count ( distinct customer_orders.customer_id ) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name = 'Monitor'
select count ( distinct customers.customer_id ) from customers join customer_orders on customers.customer_id = customer_orders.customer_id join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name = 'Monitor'
select count ( distinct customer_id ) from customer_orders
select count ( distinct customer_id ) from customer_orders
select customer_id from customers where customer_id not in ( select customer_id from customer_orders )
select customer_id from customers where customer_id not in ( select customer_id from customer_orders )
select order_date , order_id from customer_orders where order_id in ( select order_id from order_items where order_quantity > 6 ) or order_id in ( select order_id from order_items group by order_id having count ( product_id ) > 3 )
select co.order_id , co.order_date from customer_orders co join order_items oi on co.order_id = oi.order_id where oi.order_quantity > 6 or co.order_id in ( select product_id from order_items group by order_id having count ( product_id ) > 3 )
select count ( * ) from building
select count ( building_id ) from building
select name from building order by number_of_stories asc
select name from building order by number_of_stories asc
select address from building order by completed_year desc
select address from building order by completed_year desc
select max ( number_of_stories ) from building where completed_year != 1980
select max ( number_of_stories ) from building where completed_year != 1980
select avg ( population ) from region
select avg ( population ) from region
select name from region order by name asc
select name from region order by name asc
select capital from region where area > 10000
select capital from region where area > 10000
select capital from region where population = ( select max ( population ) from region )
select capital from region where population = ( select max ( population ) from region )
select name from region order by area desc limit 5
select name from region order by area desc limit 5
select building.name , region.name from building join region on building.region_id = region.region_id
select building.name , region.name from building join region on building.region_id = region.region_id
select name from region where region_id in ( select region_id from building group by region_id having count ( building_id ) > 1 )
select name from region where region_id in ( select region_id from building group by region_id having count ( building_id ) > 1 )
select capital from region where region_id in ( select region_id from building group by region_id having count ( building_id ) = ( select max ( cnt ) from ( select count ( building_id ) as cnt from building group by region_id ) ) )
select capital from region where region_id = ( select region_id from building group by region_id order by count ( * ) desc limit 1 )
select building.address , region.capital from building join region on building.region_id = region.region_id
select building.address , region.name from building join region on building.region_id = region.region_id
select building.number_of_stories from building join region on building.region_id = region.region_id where region.name = 'Abruzzo'
select building.number_of_stories from building join region on building.region_id = region.region_id where region.name = 'Abruzzo'
select completed_year , count ( * ) from building group by completed_year
select completed_year , count ( building_id ) from building group by completed_year
select completed_year from building group by completed_year order by count ( * ) desc limit 1
select completed_year from building group by completed_year order by count ( * ) desc limit 1
select name from region where region_id not in ( select region_id from building )
select name from region where region_id not in ( select region_id from building )
select distinct a.completed_year from building a where a.number_of_stories > 20 and a.completed_year in ( select completed_year from building where number_of_stories < 15 )
select distinct completed_year from building where number_of_stories > 20 intersect select distinct completed_year from building where number_of_stories < 15
select distinct address from building
select distinct address from building
select completed_year from building order by number_of_stories desc
select completed_year from building order by number_of_stories desc
select channel_details from channels order by channel_details asc
select channel_details from channels order by channel_details asc
select count ( * ) from services
select count ( * ) from services
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code order by count ( * ) desc limit 1
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from analytical_layer group by analytical_layer_type_code ) t )
select service_details from services where service_id in ( select service_id from customers_and_services where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customers_and_services where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions group by service_id having count ( customer_id ) > 3 )
select service_details from services where service_id in ( select service_id from customers_and_services group by service_id having count ( distinct customer_id ) > 3 )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions group by customer_id having count ( customer_interaction_id ) = ( select max ( cnt ) from ( select count ( customer_interaction_id ) as cnt from customer_interactions group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( service_id ) = ( select max ( counted ) from ( select count ( service_id ) as counted from customers_and_services group by customer_id ) ) )
select c.customer_details from customers c join customer_interactions ci on c.customer_id = ci.customer_id group by c.customer_id order by count ( distinct ci.service_id ) desc limit 1
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( distinct service_id ) = ( select max ( cnt ) from ( select count ( distinct service_id ) as cnt from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id not in ( select customer_id from customer_interactions )
select customer_details from customers where customer_id not in ( select customer_id from customer_interactions )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where service_id = ( select service_id from services group by service_id order by count ( * ) asc limit 1 ) )
select distinct customer_details from customers where customer_id in ( select customer_id from customer_interactions where service_id in ( select service_id from services group by service_id order by count ( * ) asc limit 1 ) )
select count ( distinct customers_and_services_details ) from customers_and_services
select count ( * ) from customers_and_services
select customer_details from customers where customer_details like '%Kutch%'
select customer_details from customers where customer_details like '%Kutch%'
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) ) or service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Good' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) ) or service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Good' ) )
select distinct s.service_details from services s join customers_and_services cs on s.service_id = cs.service_id join customers c on cs.customer_id = c.customer_id where c.customer_details like 'Hardy Kutch' and s.service_id in ( select service_id from customer_interactions where customer_details like 'Bady Kutch' )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) ) and service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Bady Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where channel_id in ( select channel_id from channels where channel_details = '' ) )
select s.service_details from services s join customer_interactions ci on s.service_id = ci.service_id join channels c on ci.channel_id = c.channel_id where c.channel_details = '15 ij'
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' ) and customer_id in ( select customer_id from customers_and_services where customer_id = customer_id )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' ) and customer_id in ( select customer_id from customer_interactions where services_and_channels_details = 'bad' )
select count ( * ) from integration_platform where integration_platform_details = 'successful'
select count ( * ) from integration_platform where integration_platform_details = 'Success'
select customer_details from customers where customer_id in ( select customer_id from customer_interactions join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = 'failed' )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform_details = 'Fail' )
select service_details from services where service_id not in ( select service_id from customer_interactions )
select service_details from services where service_id not in ( select service_id from customer_interactions )
select analytical_layer_type_code , count ( * ) as usage_count from analytical_layer group by analytical_layer_type_code
select analytical_layer_type_code , count ( * ) from analytical_layer group by analytical_layer_type_code
select service_details from services where service_id in ( select service_id from customer_interactions where status_code = 'unsatisfied' )
select s.service_details from services s join customers_and_services cs on s.service_id = cs.service_id where cs.customers_and_services_details = 'unsatisfied'
select count ( * ) from vehicles
select count ( * ) from vehicles
select name from vehicles order by model_year desc
select name from vehicles order by model_year desc
select distinct type_of_powertrain from vehicles
select distinct type_of_powertrain from vehicles
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year in ( 2013 , 2014 )
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year in ( 2013 , 2014 )
select distinct type_of_powertrain from vehicles where model_year = 2014 and type_of_powertrain in ( select type_of_powertrain from vehicles where model_year = 2013 )
select distinct type_of_powertrain from vehicles where model_year = 2013 intersect select type_of_powertrain from vehicles where model_year = 2014
select type_of_powertrain , count ( id ) from vehicles group by type_of_powertrain
select type_of_powertrain , count ( * ) from vehicles group by type_of_powertrain
select type_of_powertrain from vehicles group by type_of_powertrain having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from vehicles group by type_of_powertrain ) )
select type_of_powertrain from vehicles group by type_of_powertrain order by count ( * ) desc limit 1
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select name , model_year from vehicles where city_fuel_economy_rate < ( select min ( city_fuel_economy_rate ) from vehicles )
select name , model_year from vehicles where city_fuel_economy_rate < ( select min ( city_fuel_economy_rate ) from vehicles )
select type_of_powertrain , avg ( annual_fuel_cost ) as average_fuel_cost from vehicles group by type_of_powertrain having count ( * ) >= 2
select type_of_powertrain , avg ( annual_fuel_cost ) as average_fuel_cost from vehicles group by type_of_powertrain having count ( * ) >= 2
select name , age , membership_credit from customers
select name , age , membership_credit from customers
select c.name , c.age from customers c where c.membership_credit = ( select max ( membership_credit ) from customers )
select c.name , c.age from customers c where c.membership_credit = ( select max ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( age ) from customers )
select * from discount
select * from discount
select vehicles.name , sum ( renting_history.total_hours ) as total_hours from vehicles inner join renting_history on vehicles.id = renting_history.vehicles_id group by vehicles.id
select vehicles.name , renting_history.total_hours from vehicles inner join renting_history on vehicles.id = renting_history.vehicles_id group by vehicles.id
select name from vehicles where id not in ( select vehicles_id from renting_history )
select name from vehicles where id not in ( select vehicles_id from renting_history )
select name from customers where id in ( select customer_id from renting_history group by customer_id having count ( * ) >= 2 )
select c.name from customers c where exists ( select 1 from renting_history rh where rh.customer_id = c.id group by rh.customer_id having count ( distinct rh.id ) >= 2 )
select name , model_year from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from renting_history group by vehicles_id ) ) )
select name , model_year from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from renting_history group by vehicles_id ) ) )
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id order by renting_history.total_hours desc
select v.name from vehicles v join renting_history rh on v.id = rh.vehicles_id order by rh.total_hours desc
select name from discount where id in ( select discount_id from renting_history group by discount_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from renting_history group by discount_id ) ) )
select discount.name from discount join renting_history on discount.id = renting_history.discount_id group by discount.id order by count ( * ) desc limit 1
select name , type_of_powertrain from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having sum ( total_hours ) > 30 )
select name , type_of_powertrain from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having sum ( total_hours ) > 30 )
select type_of_powertrain , avg ( city_fuel_economy_rate ) as average_fuel_rate from vehicles group by type_of_powertrain
select type_of_powertrain , avg ( city_fuel_economy_rate ) as average_fuel_economy_rate from vehicles group by type_of_powertrain
select avg ( amount_of_loan ) from student_loans
select avg ( amount_of_loan ) from student_loans
select student_id , bio_data from students where student_id in ( select student_id from classes group by student_id having count ( class_id ) >= 2 ) and student_id in ( select student_id from detention group by student_id having count ( detention_id ) < 2 )
select student_id , bio_data from students where student_id in ( select student_id from classes group by student_id having count ( class_id ) >= 2 ) or student_id in ( select student_id from detention group by student_id having count ( detention_id ) < 2 )
select distinct teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.class_details like '%data%' and teachers.teacher_id not in ( select teacher_id from classes where class_details like '%net%' )
select distinct teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.class_details like '%data%' and classes.class_details not like '%net%'
select bio_data from students where student_id not in ( select student_id from student_loans )
select bio_data from students where student_id not in ( select student_id from student_loans )
select amount_of_loan , date_of_loan from student_loans where student_id in ( select student_id from achievements group by student_id having count ( achievement_id ) >= 2 )
select amount_of_loan , date_of_loan from student_loans where student_id in ( select student_id from achievements group by student_id having count ( achievement_id ) >= 2 )
select teachers.teacher_id , teachers.teacher_details from teachers join ( select teacher_id , count ( * ) as num_courses from classes group by teacher_id order by num_courses desc limit 1 ) as most_taught on teachers.teacher_id = most_taught.teacher_id
select teacher_id , teacher_details from teachers where teacher_id in ( select teacher_id from classes group by teacher_id having count ( class_id ) = ( select max ( cnt ) from ( select count ( class_id ) as cnt from classes group by teacher_id ) ) )
select distinct detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code
select distinct rdt.detention_type_description from detention d join ref_detention_type rdt on d.detention_type_code = rdt.detention_type_code
select s.student_details , ra.address_type_description from students s join students_addresses sa on s.student_id = sa.student_id join ref_address_types ra on sa.address_type_code = ra.address_type_code
select s.student_details , ra.address_type_description from students s join students_addresses sa on s.student_id = sa.student_id join ref_address_types ra on sa.address_type_code = ra.address_type_code
select a.address_details , s.bio_data from students s join students_addresses sa on s.student_id = sa.student_id join addresses a on sa.address_id = a.address_id
select s.student_details , s.bio_data from students s join students_addresses sa on s.student_id = sa.student_id join addresses a on sa.address_id = a.address_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select count ( distinct student_id ) , behaviour_monitoring_details from behaviour_monitoring where behaviour_monitoring_details = ( select behaviour_monitoring_details from behaviour_monitoring group by behaviour_monitoring_details order by count ( student_id ) desc limit 1 )
select behaviour_monitoring_details , count ( * ) as count , behaviour_monitoring_details from behaviour_monitoring group by behaviour_monitoring_details order by count desc limit 1
select s.bio_data , s.student_details from students s where s.student_id in ( select bm.student_id from behaviour_monitoring bm group by bm.student_id having count ( * ) = 3 ) and s.student_id in ( select bm.student_id from behaviour_monitoring bm group by bm.student_id having count ( * ) = 3 )
sql placeholder
select s.bio_data from students s where s.student_id in ( select bm.student_id from behaviour_monitoring bm group by bm.student_id having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from behaviour_monitoring group by student_id ) ) )
select bio_data from students where student_id in ( select student_id from behaviour_monitoring group by student_id order by count ( * ) desc limit 1 )
select students.bio_data , student_events.event_date from students join student_events on students.student_id = student_events.student_id
select students.bio_data , student_events.event_date from students join student_events on students.student_id = student_events.student_id where exists ( select 1 from student_events where student_events.student_id = students.student_id )
select count ( distinct s.student_id ) , re.event_type_description from students s join student_events se on s.student_id = se.student_id join ref_event_types re on se.event_type_code = re.event_type_code where re.event_type_code = ( select event_type_code from student_events group by event_type_code order by count ( * ) desc limit 1 )
sql placeholder
select achievement_details , achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select a.achievement_details , rt.achievement_type_description from achievements a join ref_achievement_type rt on a.achievement_type_code = rt.achievement_type_code
select count ( distinct teachers.teacher_id ) from teachers join classes on teachers.teacher_id = classes.teacher_id join students on classes.student_id = students.student_id where students.student_id not in ( select student_id from achievements )
select count ( distinct teachers.teacher_id ) from teachers join classes on teachers.teacher_id = classes.teacher_id join achievements on classes.student_id = achievements.student_id where achievements.student_id not in ( select student_id from achievements )
select date_of_transcript , transcript_details from transcripts
select date_of_transcript , transcript_details from transcripts
select achievement_type_code , achievement_details , date_achievement from achievements
select achievement_type_code , achievement_details , date_achievement from achievements
select datetime_detention_start , datetime_detention_end from detention
select datetime_detention_start , datetime_detention_end from detention
select bio_data from students where student_details like '%Suite%'
select bio_data from students where student_details like '%Suite%'
select t.teacher_details , s.student_details from teachers t join classes c on t.teacher_id = c.teacher_id join students s on c.student_id = s.student_id
select distinct t.teacher_details , s.student_details from teachers t join classes c on t.teacher_id = c.teacher_id join students s on c.student_id = s.student_id
select teachers.teacher_id , count ( classes.class_id ) as course_count from teachers join classes on teachers.teacher_id = classes.teacher_id group by teachers.teacher_id order by course_count desc limit 1
select t.teacher_id , count ( * ) as num_courses from teachers t join classes c on t.teacher_id = c.teacher_id group by t.teacher_id order by num_courses desc limit 1
select s.student_id , count ( * ) as course_count from students s group by s.student_id order by course_count desc limit 1
select students.student_id , count ( * ) as course_count from students group by students.student_id order by course_count desc limit 1
select student_id , student_details from students where student_id in ( select student_id from classes group by student_id having count ( class_id ) = 2 )
select distinct s.student_id , s.student_details from students s join classes c on s.student_id = c.student_id group by s.student_id having count ( distinct c.class_id ) = 2
select r.detention_type_code , r.detention_type_description from ref_detention_type r join ( select detention_type_code , count ( * ) as count from detention group by detention_type_code order by count asc limit 1 ) d on r.detention_type_code = d.detention_type_code
select r.detention_type_code , r.detention_type_description from ref_detention_type r join ( select detention_type_code , count ( * ) as cnt from detention group by detention_type_code order by cnt asc limit 1 ) d on r.detention_type_code = d.detention_type_code
select bio_data , student_details from students where student_id in ( select student_id from student_loans where amount_of_loan > ( select avg ( amount_of_loan ) from student_loans ) )
select bio_data , student_details from students where student_id in ( select student_id from student_loans where amount_of_loan > ( select avg ( amount_of_loan ) from student_loans ) )
select min ( date_of_loan ) from student_loans
select min ( date_of_loan ) from student_loans
select bio_data from students where student_id in ( select student_id from student_loans where amount_of_loan = ( select min ( amount_of_loan ) from student_loans ) )
select bio_data from students where student_id in ( select student_id from student_loans where amount_of_loan = ( select min ( amount_of_loan ) from student_loans ) )
select date_of_transcript from transcripts where student_id = ( select student_id from student_loans where amount_of_loan = ( select max ( amount_of_loan ) from student_loans ) )
select t.date_of_transcript from transcripts t join student_loans s on t.student_id = s.student_id where s.amount_of_loan = ( select max ( amount_of_loan ) from student_loans )
select t.teacher_details from teachers t join classes c on t.teacher_id = c.teacher_id join transcripts t on c.student_id = t.student_id where t.date_of_transcript = ( select min ( date_of_transcript ) from transcripts )
select teacher_details from teachers where teacher_id in ( select teacher_id from classes where student_id = ( select min ( date_of_transcript ) from transcripts ) )
select s.student_id , sum ( sl.amount_of_loan ) as total_loan from students s join student_loans sl on s.student_id = sl.student_id group by s.student_id
select students.student_id , sum ( student_loans.amount_of_loan ) as total_loan_amount from students join student_loans on students.student_id = student_loans.student_id group by students.student_id
select students.student_id , students.bio_data , ( select count ( * ) from classes where classes.student_id = students.student_id ) as course_count from students
select students.student_id , students.bio_data , count ( distinct classes.class_id ) as numberofcourses from students left join classes on students.student_id = classes.student_id group by students.student_id , students.bio_data
select count ( distinct students.student_id ) from students join student_events on students.student_id = student_events.student_id join detention on student_events.event_id = detention.student_id
select count ( distinct students.student_id ) from students join detention on students.student_id = detention.student_id
select ref_address_types.address_type_code , ref_address_types.address_type_description from ref_address_types join students_addresses on ref_address_types.address_type_code = students_addresses.address_type_code group by ref_address_types.address_type_code order by count ( * ) desc limit 1
select students_addresses.address_type_code , ref_address_types.address_type_description from students_addresses join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students_addresses.address_type_code order by count ( * ) desc limit 1
select bio_data from students where student_id in ( select student_id from student_events ) and student_id not in ( select student_id from student_loans )
select bio_data from students where student_id in ( select student_id from student_events where event_id = student_id ) and student_id not in ( select student_id from student_loans )
select sa.date_from , sa.date_to from students_addresses sa inner join transcripts t on sa.student_id = t.student_id group by sa.student_id having count ( t.transcript_id ) = 2
select sa.date_from , sa.date_to from students_addresses sa inner join transcripts t on sa.student_id = t.student_id group by sa.student_id having count ( t.transcript_id ) = 2
select datetime_detention_start from detention
select datetime_detention_start from detention
select name from author
select name from author
select name , address from client
select name , address from client
select title , isbn , saleprice from book
select title , isbn , saleprice from book
select count ( * ) from book
select count ( * ) from book
select count ( distinct idauthor ) from author
select count ( distinct idauthor ) from author
select count ( * ) from client
select count ( * ) from client
select name , address from client order by name asc
select name , address from client order by name asc
select book.title , author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select book.title , author_book.author from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select orders.idorder , client.name from orders join client on orders.idclient = client.idclient
select orders.idorder , client.name from orders join client on orders.idclient = client.idclient
select author.name , count ( author_book.isbn ) as total_books from author left join author_book on author.idauthor = author_book.author group by author.name
select a.name , count ( b.isbn ) as total_books from author a left join author_book b on a.idauthor = b.author group by a.idauthor
select book.isbn , count ( books_order.idorder ) from book join books_order on book.isbn = books_order.isbn group by book.isbn
select isbn , count ( * ) as total_orders from books_order group by isbn
select isbn , sum ( amount ) as total_ordered from books_order group by isbn
select isbn , sum ( amount ) from books_order group by isbn
select title from book where isbn = ( select isbn from books_order group by isbn order by count ( * ) desc limit 1 )
select book.title from book join books_order on book.isbn = books_order.isbn group by book.isbn order by count ( * ) desc limit 1
select title , purchaseprice from book where isbn = ( select isbn from books_order group by isbn order by sum ( amount ) desc limit 1 )
select b.title , b.purchaseprice from book b join books_order bo on b.isbn = bo.isbn group by b.isbn order by sum ( bo.amount ) desc limit 1
select title from book where isbn in ( select isbn from books_order )
select distinct book.title from book join books_order on book.isbn = books_order.isbn
select name from client where idclient in ( select idclient from orders )
select distinct client.name from client join orders on client.idclient = orders.idclient
select name , count ( * ) from client join orders on client.idclient = orders.idclient group by name
select client.name , count ( orders.idorder ) from client join orders on client.idclient = orders.idclient group by client.name
select name from client where idclient in ( select idclient from orders group by idclient having count ( * ) = ( select max ( counted ) from ( select count ( * ) as counted from orders group by idclient ) ) )
select name from client where idclient in ( select idclient from orders group by idclient having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from orders group by idclient ) ) )
select client.name , sum ( books_order.amount ) as total_books_ordered from client join orders on client.idclient = orders.idorder join books_order on orders.idorder = books_order.idorder group by client.name
select client.name , sum ( books_order.amount ) from client join orders on client.idclient = orders.idclient join books_order on orders.idorder = books_order.idorder group by client.name
select client.name from client join orders on client.idclient = orders.idclient join books_order on orders.idorder = books_order.idorder group by client.idclient order by sum ( books_order.amount ) desc limit 1
select name from client where idclient = ( select idclient from orders join books_order on orders.idorder = books_order.idorder group by orders.idclient order by sum ( amount ) desc limit 1 )
select title from book where isbn not in ( select isbn from books_order )
select title from book where isbn not in ( select isbn from books_order )
select name from client where idclient not in ( select idclient from orders )
select name from client where idclient not in ( select idclient from orders )
select max ( saleprice ) as max_saleprice , min ( saleprice ) as min_saleprice from book
select max ( saleprice ) as max_saleprice , min ( saleprice ) as min_saleprice from book
select avg ( purchaseprice ) as average_purchaseprice , avg ( saleprice ) as average_saleprice from book
select avg ( purchaseprice ) as average_purchaseprice , avg ( saleprice ) as average_saleprice from book
select max ( saleprice - purchaseprice ) from book
select max ( saleprice - purchaseprice ) from book
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice = ( select min ( saleprice ) from book )
select title from book where saleprice = ( select min ( saleprice ) from book )
select title from book where purchaseprice = ( select max ( purchaseprice ) from book )
select title from book where purchaseprice = ( select max ( purchaseprice ) from book )
select avg ( saleprice ) from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select avg ( saleprice ) from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select saleprice from book where author = 'Plato'
select book.saleprice from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'Plato'
select b.title from book b where b.saleprice = ( select min ( saleprice ) from book where author = 'George Orwell' ) and b.author = 'George Orwell'
select b.title from book b where b.saleprice = ( select min ( saleprice ) from book where author = 'George Orwell' )
select title from book where author = 'Plato' and saleprice < ( select avg ( saleprice ) from book where author = 'Plato' )
select title from book where author = 'Plato' and saleprice < ( select avg ( saleprice ) from book where author = 'Plato' )
select author.name from author join author_book on author.idauthor = author_book.author join book on author_book.isbn = book.isbn where book.title = 'Pride and Prejudice'
select author.name from author join author_book on author.idauthor = author_book.author join book on author_book.isbn = book.isbn where book.title = 'Pride and Prejudice'
select book.title from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select book.title from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select count ( distinct orders.idorder ) from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice'
select count ( distinct orders.idorder ) from orders inner join books_order on orders.idorder = books_order.idorder inner join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice'
select distinct o.idorder from orders o join books_order bo on o.idorder = bo.idorder join book b on bo.isbn = b.isbn where b.title in ( 'Pride and Prejudice' , 'The Little Prince' ) group by o.idorder having count ( distinct b.title ) = 2
sql placeholder
select distinct b.isbn from books_order b join orders o on b.idorder = o.idorder join client c on o.idclient = c.idclient where c.name = 'Peter Doe' and c.idclient in ( select idclient from orders where name = 'James Smith' )
select distinct b.isbn from books_order b join orders o on b.idorder = o.idorder join client c on o.idclient = c.idclient where c.name in ( 'Peter Doe' , 'James Smith' ) group by b.isbn having count ( distinct c.name ) = 2
select title from book where isbn in ( select isbn from books_order where idorder = ( select idorder from orders where idclient = 'Peter Doe' ) ) and isbn not in ( select isbn from books_order where idorder = ( select idorder from orders where idclient = 'James Smith' ) )
sql placeholder
select name from client where idclient in ( select idclient from orders where idorder in ( select idorder from book where title = 'Pride and Prejudice' ) )
select name from client where idclient in ( select idclient from orders where idorder in ( select idorder from books_order where isbn = ( select isbn from book where title = 'Pride and Prejudice' ) ) )
select count ( * ) from book
select title from book order by title asc
select title from book order by pages desc
select distinct type , release from book
select max ( chapters ) , min ( chapters ) from book
select title from book where type != 'Poet'
select avg ( rating ) from review
select book.title , review.rating from book join review on book.book_id = review.book_id
select review.rating from review join book on review.book_id = book.book_id where book.chapters = ( select max ( chapters ) from book )
select review.rank from review join book on review.book_id = book.book_id where book.pages = ( select min ( pages ) from book )
select title from book join review on book.book_id = review.book_id where rank = ( select max ( rank ) from review )
select avg ( r.readers_in_million ) from review r join book b on r.book_id = b.book_id where b.type = 'Novel'
select type , count ( * ) from book group by type
select type from book group by type having count ( type ) = ( select max ( cnt ) from ( select count ( * ) as cnt from book group by type ) )
select type from book group by type having count ( * ) >= 3
select book.title from book join review on book.book_id = review.book_id order by review.rating asc
select book.title , book.audio from book join review on book.book_id = review.book_id order by review.readers_in_million desc
select count ( * ) from book where book_id not in ( select book_id from review )
select distinct b1.type from book b1 where exists ( select 1 from book b2 where b2.type = b1.type and b2.chapters > 75 ) and exists ( select 1 from book b3 where b3.type = b1.type and b3.chapters < 50 )
select count ( distinct type ) from book
select type , title from book where book_id not in ( select book_id from review )
select count ( * ) from customer
select count ( customer_id ) from customer
select name from customer order by level_of_membership asc
select name from customer order by level_of_membership asc
select nationality , card_credit from customer
select nationality , card_credit from customer
select name from customer where nationality in ( 'England' , 'Australia' )
select name from customer where nationality in ( 'England' , 'Australia' )
select avg ( card_credit ) from customer where level_of_membership > 1
select avg ( card_credit ) from customer where level_of_membership > 1
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select nationality , count ( customer_id ) as number_of_customers from customer group by nationality
select nationality , count ( customer_id ) as number_of_customers from customer group by nationality
select nationality from customer group by nationality having count ( nationality ) = ( select max ( count_national ) from ( select nationality , count ( nationality ) as count_national from customer group by nationality ) as stats )
select nationality from customer group by nationality having count ( nationality ) = ( select max ( count ) from ( select count ( customer_id ) as count from customer group by nationality ) )
select distinct nationality from customer where card_credit < 50 intersect select distinct nationality from customer where card_credit > 75
select distinct c1.nationality from customer c1 where c1.card_credit > 50 and exists ( select 1 from customer c2 where c2.nationality = c1.nationality and c2.card_credit < 75 )
select customer.name , customer_order.dish_name from customer join customer_order on customer.customer_id = customer_order.customer_id
select customer.name , customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select c.name , co.dish_name from customer c join customer_order co on c.customer_id = co.customer_id order by co.quantity desc
select c.name , co.dish_name from customer_order co join customer c on co.customer_id = c.customer_id order by co.quantity desc
select customer.name , sum ( customer_order.quantity ) as total_quantity from customer left join customer_order on customer.customer_id = customer_order.customer_id group by customer.name
select customer.name , sum ( customer_order.quantity ) as total_quantity from customer join customer_order on customer.customer_id = customer_order.customer_id group by customer.name
select c.name from customer c join customer_order co on c.customer_id = co.customer_id group by c.customer_id having sum ( co.quantity ) > 1
select name from customer where customer_id in ( select customer_id from customer_order group by customer_id having sum ( quantity ) > 1 )
select distinct manager from branch
select distinct manager from branch
select name from customer where customer_id not in ( select customer_id from customer_order )
select name from customer where customer_id not in ( select customer_id from customer_order )
select count ( * ) from member
select name from member order by age asc
select name , nationality from member
select name from member where nationality != 'England'
select name from member where age in ( 19 , 20 )
select m.name from member m where m.age = ( select max ( age ) from member )
select nationality , count ( * ) as number_of_members from member group by nationality
select nationality from member group by nationality having count ( nationality ) = ( select max ( count_national ) from ( select count ( nationality ) as count_national from member group by nationality ) )
select nationality from member group by nationality having count ( * ) >= 2
select m.name , c.club_name from member m join club_leader cl on m.member_id = cl.member_id join club c on cl.club_id = c.club_id
select m.name from member m join club_leader cl on m.member_id = cl.member_id join club c on cl.club_id = c.club_id where c.overall_ranking > 100
select m.name from member m join club_leader cl on m.member_id = cl.member_id where cl.year_join < 2018
select m.name from member m join club_leader cl on m.member_id = cl.member_id join club c on cl.club_id = c.club_id where c.club_name = 'Houston'
select name from member where member_id not in ( select member_id from club_leader )
select distinct nationality from member where age > 22 intersect select distinct nationality from member where age < 19
select avg ( age ) from member join club_leader on member.member_id = club_leader.member_id
select club_name from club where club_name like '%state%'
select collection_subset_name from collection_subsets
select collection_subset_name from collection_subsets
select * from collection_subsets where collection_subset_name = 'Top collection'
select cs.collecrtion_subset_details from collection_subsets as cs where cs.collection_subset_name = 'Top collection'
select document_subset_name from document_subsets
select document_subset_name from document_subsets
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_object_id from document_objects
select document_object_id from document_objects
select parent_document_object_id from document_objects where parent_document_object_id in ( select document_object_id from document_objects where owner = 'Marlin' )
select document_object_id from document_objects where owner = 'Marlin'
select owner from document_objects where description = 'Braeden Collection'
select owner from document_objects where document_object_id in ( select document_object_id from documents_in_collections where collection_id = ( select collection_id from collections where collection_name = 'Braeden Collection' ) )
select owner from document_objects where parent_document_object_id in ( select document_object_id from document_objects where owner = 'Marlin' )
select d.owner from document_objects d where d.parent_document_object_id = ( select d2.document_object_id from document_objects d2 where d2.owner = 'Marlin' )
select distinct description from document_objects
select description from document_objects where parent_document_object_id is not null
select count ( document_object_id ) from document_objects where owner = 'Marlin'
select count ( document_object_id ) from document_objects where owner = 'Marlin'
select document_object_id from document_objects where document_object_id not in ( select parent_document_object_id from document_objects where parent_document_object_id is not null )
select document_object_id from document_objects where document_object_id not in ( select parent_document_object_id from document_objects where parent_document_object_id is not null )
select parent_document_object_id , count ( * ) as child_documents from document_objects group by parent_document_object_id
select d.parent_document_object_id , count ( d.document_object_id ) as child_count from document_objects d left join collections c on d.document_object_id = c.collection_id group by d.parent_document_object_id
select collection_name from collections
select collection_name from collections
select collection_description from collections where collection_name = 'Best'
select collection_description from collections where collection_name in ( select collection_name from collections where collection_description = 'Best' )
select collection_name from collections where parent_collection_id = ( select collection_id from collections where collection_name = 'Nice' )
select collection_name from collections where parent_collection_id = ( select collection_id from collections where collection_name = 'Nice' )
select collection_name from collections where collection_id not in ( select parent_collection_id from collections where parent_collection_id is not null )
select collection_name from collections where collection_id not in ( select parent_collection_id from collections where parent_collection_id is not null )
select do.document_object_id from document_objects do group by do.document_object_id having count ( do.document_object_id ) > 1
select d.document_object_id from document_objects d group by d.document_object_id having count ( d.document_object_id ) > 1
select count ( * ) from collections where collection_name = 'Best'
select count ( distinct c.collection_id ) from collections c where c.collection_name = 'Best'
select dsm.document_object_id from document_subset_members dsm inner join document_objects do on dsm.related_document_object_id = do.document_object_id where do.owner = 'Ransom'
select document_object_id from document_subset_members where document_object_id in ( select document_object_id from document_objects where owner = 'Ransom' )
sql placeholder
select cs.collection_subset_id , cs.collection_subset_name , count ( distinct csm.collection_id ) as collection_count from collection_subsets cs left join collection_subset_members csm on cs.collection_subset_id = csm.collection_subset_id group by cs.collection_subset_id , cs.collection_subset_name
select d.document_object_id , count ( * ) as count from document_objects d group by d.document_object_id order by count desc limit 1
select document_object_id , count ( * ) as children from document_objects group by document_object_id
sql placeholder
select document_object_id from documents_in_collections group by document_object_id order by count ( * ) asc limit 1
sql placeholder
select dsm.document_object_id , count ( dsm.related_document_object_id ) as related_count from document_subset_members dsm group by dsm.document_object_id having count ( dsm.related_document_object_id ) between 2 and 4
select distinct owner from document_objects where document_object_id in ( select related_document_object_id from document_subset_members where document_object_id = document_object_id and owner = 'Breeden' )
select distinct owner from document_objects where document_object_id in ( select related_document_object_id from document_subset_members where owner = 'Breeden' )
select distinct document_subset_name from document_subsets join document_subset_members on document_subset_members.document_subset_id = document_subsets.document_subset_id join document_objects on document_objects.document_object_id = document_subset_members.document_object_id where document_objects.owner = 'Braeden'
select distinct document_subset_name from document_subsets join document_objects on document_subsets.document_subset_id = document_objects.document_object_id where document_objects.owner = 'Breeden'
select document_subsets.document_subset_id , document_subsets.document_subset_name , count ( distinct document_subset_members.document_object_id ) from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id group by document_subsets.document_subset_id , document_subset_name
select document_subset_id , document_subset_name , ( select count ( distinct document_object_id ) from document_subset_members where document_subset_id = document_subsets.document_subset_id ) as document_count from document_subsets
sql placeholder
sql placeholder
select dsm.document_object_id from document_subset_members dsm join document_subsets ds on dsm.document_subset_id = ds.document_subset_id where ds.document_subset_name = 'Best for 2000'
select dsm.document_object_id from document_subset_members dsm join document_subsets ds on dsm.document_subset_id = ds.document_subset_id where ds.document_subset_name = 'Best for 2000'
sql placeholder
sql placeholder
select collection_name from collections where collection_id in ( select collection_id from documents_in_collections join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where owner = 'Ransom' )
select collection_name from collections where collection_id in ( select collection_id from documents_in_collections join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where owner = 'Ransom' )
select dc.document_object_id , count ( distinct c.collection_id ) as collection_count from documents_in_collections dc left join collections c on dc.collection_id = c.collection_id group by dc.document_object_id
select document_object_id , count ( distinct collection_id ) as collection_count from documents_in_collections group by document_object_id
select count ( * ) from documents_in_collections where collection_id = ( select collection_id from collections where collection_name = 'Best' )
select count ( * ) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select dc.document_object_id from documents_in_collections dc inner join collections c on dc.collection_id = c.collection_id where c.collection_name = 'Best'
select count ( distinct document_object_id ) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select collections.collection_name , collections.collection_id , count ( documents_in_collections.document_object_id ) as document_count from collections left join documents_in_collections on collections.collection_id = documents_in_collections.collection_id group by collections.collection_id order by document_count desc limit 1
select c.collection_name , c.collection_id , count ( d.document_object_id ) as document_count from collections c join documents_in_collections d on c.collection_id = d.collection_id where c.collection_name = 'Best' group by c.collection_id order by document_count desc limit 1
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select distinct c.collection_name from collections c join collection_subset_members cs on c.collection_id = cs.related_collection_id where c.collection_name = 'Best'
select c.collection_name from collections c inner join collection_subset_members cs on c.collection_id = cs.related_collection_id where c.collection_name = 'Best'
select count ( distinct collection_id ) from collections where collection_id in ( select related_collection_id from collection_subset_members where collection_name = 'Best' )
select count ( distinct collections.collection_id ) from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id where collections.collection_name = 'Best'
select collection_subset_name from collection_subsets where collection_subset_id = ( select collection_subset_id from collections where collection_name = 'Best' )
select cs.collection_subset_name from collection_subsets as cs join collections as c on cs.collection_subset_id = c.collection_id where c.collection_name = 'Best'
select count ( * ) from songs where name like '%Love%'
select name from songs order by name asc
select name , language from songs
select max ( voice_sound_quality ) as max_score , min ( voice_sound_quality ) as min_score from performance_score
select ps.voice_sound_quality , ps.rhythm_tempo , ps.stage_presence from performance_score ps join participants p on ps.participant_id = p.id where p.name = 'Freeway'
select s.id , s.language , s.original_artist from songs s where s.name > 'Love'
select name , original_artist from songs where english_translation = 'All the streets of love'
select distinct ps.stage_presence from performance_score ps join songs s on ps.songs_id = s.id where s.language = 'English'
select id , name from participants where id in ( select participant_id from performance_score group by participant_id having count ( distinct songs_id ) >= 2 )
select p.id , p.name , p.popularity from participants p join performance_score ps on p.id = ps.participant_id group by p.id order by count ( ps.songs_id ) asc
sql placeholder
select p.voice_sound_quality from performance_score p join songs s on p.songs_id = s.id where s.name = 'The Balkan Girls' and s.language = 'english'
select songs.id , songs.name from songs join performance_score on songs.id = performance_score.songs_id group by songs.id order by count ( performance_score.participant_id ) desc limit 1
select count ( * ) from performance_score where stage_presence < 7 or stage_presence > 9
select count ( * ) from songs where id not in ( select songs_id from performance_score )
select language , avg ( rhythm_tempo ) as average_rhythm_tempo from songs join performance_score on songs.id = performance_score.songs_id group by language
select distinct p.name from participants p join performance_score ps on p.id = ps.participant_id join songs s on ps.songs_id = s.id where s.language = 'English'
select distinct name , popularity from participants where id in ( select participant_id from performance_score where songs_id in ( select id from songs where language = 'Croatian' ) ) and id in ( select participant_id from performance_score where songs_id in ( select id from songs where language = 'English' ) )
select name from songs where name like '%Is%'
select distinct s.original_artist from songs s join performance_score ps on s.id = ps.songs_id where ps.rhythm_tempo > 5 order by ps.voice_sound_quality desc
select count ( city_code ) from city
select count ( * ) from city
select distinct state from city
select distinct state from city
select count ( distinct country ) from city
select count ( * ) from city
select city_name , city_code , state , country from city
select city_name , city_code , state , country from city
select latitude , longitude from city where city_name = 'Baltimore'
select latitude , longitude from city where city_name = 'Baltimore'
select city_name from city where state = 'PA'
select city_name from city where state = 'PA'
select count ( * ) from city where country = 'Canada'
select count ( * ) from city where country = 'Canada'
select city_name from city where country = 'USA' order by latitude asc
select city_name from city where country = 'USA' order by latitude asc
select state , count ( city_code ) as number_of_cities from city group by state
select state , count ( city_code ) as city_count from city group by state
select country , count ( city_code ) as number_of_cities from city group by country
select country , count ( city_code ) as city_count from city group by country
select state from city group by state having count ( city_code ) >= 2
select state from city group by state having count ( city_code ) >= 2
select state from city group by state order by count ( * ) desc limit 1
select state from city group by state order by count ( city_code ) desc limit 1
with citycounts as ( select country , count ( city_code ) as num_cities from city group by country ) select country from citycounts where num_cities = ( select min ( num_cities ) from citycounts )
select country from city group by country order by count ( city_code ) asc limit 1
select student.fname , student.lname from student join city on student.city_code = city.city_code where city.state = 'MD'
sql placeholder
select count ( * ) from student where city_code = 'China'
select count ( * ) from student join city on student.city_code = city.city_code where city.country = 'China'
select fname , major from student where city_code in ( select city_code from city where city_name = 'Baltimore' )
select fname , major from student where city_code in ( select city_code from city where city_name = 'Baltimore' )
select country , count ( stuid ) as num_students from student join city on student.city_code = city.city_code group by country
select city.country , count ( student.stuid ) from city join student on city.city_code = student.city_code group by city.country
select city.city_name , count ( student.stuid ) as student_count from city join student on city.city_code = student.city_code group by city.city_name
select city_name , count ( stuid ) from student join city on student.city_code = city.city_code group by city.city_name
select c.state from city c join student s on c.city_code = s.city_code group by c.state order by count ( s.stuid ) desc limit 1
with studentcounts as ( select city_code , count ( stuid ) as total_students from student group by city_code ) select city.state from city join studentcounts on city.city_code = studentcounts.city_code where total_students = ( select max ( total_students ) from studentcounts )
with studentcounts as ( select city_code , count ( stuid ) as num_students from student group by city_code ) select city.country from city join studentcounts on city.city_code = studentcounts.city_code where num_students = ( select min ( num_students ) from studentcounts )
select country from city where city_code = ( select city_code from student group by city_code order by count ( stuid ) asc limit 1 )
select city_name from city where city_code in ( select city_code from student group by city_code having count ( stuid ) >= 3 )
select city_name from city where city_code in ( select city_code from student group by city_code having count ( stuid ) >= 3 )
select state from city where city_code in ( select city_code from student group by city_code having count ( stuid ) > 5 )
select city.state from city join student on city.city_code = student.city_code group by city.state having count ( student.stuid ) > 5
select stuid from student where city_code not in ( select city_code from city where country = 'USA' )
select stuid from student where city_code not in ( select city_code from city where country = 'USA' )
select student.stuid from student join city on student.city_code = city.city_code where student.sex = 'F' and city.state = 'PA'
select student.stuid from student join city on student.city_code = city.city_code where student.sex = 'female' and city.state = 'PA'
select student.stuid from student join city on student.city_code = city.city_code where student.sex = 'male' and city.country > 'USA'
select student.stuid from student join city on student.city_code = city.city_code where student.sex = 'male' and city.country != 'USA'
select distance from direct_distance where city1_code in ( select city_code from city where city_name = 'BAL' )
select distance from direct_distance where city1_code in ( 'BAL' , 'CHI' )
select distance from direct_distance where city1_code in ( select city_code from city where city_name = 'Boston' ) and city2_code in ( select city_code from city where city_name = 'Newark' )
select distance from direct_distance where city1_code in ( select city_code from city where city_name = 'Boston' ) and city2_code in ( select city_code from city where city_name = 'Newark' )
select avg ( distance ) as average_distance , min ( distance ) as minimum_distance , max ( distance ) as maximum_distance from direct_distance
select avg ( distance ) as average_distance , min ( distance ) as minimum_distance , max ( distance ) as maximum_distance from direct_distance
select city_code from city where city_code in ( select city2_code from direct_distance group by city2_code order by sum ( distance ) desc limit 2 )
select c.city_code from city c join direct_distance d on c.city_code = d.city1_code where d.distance = ( select max ( distance ) from direct_distance )
select distinct c.city_code from city c join direct_distance d on c.city_code = d.city2_code where d.distance > ( select avg ( distance ) from direct_distance )
select city_code from city where city_code in ( select city2_code from direct_distance where distance > ( select avg ( distance ) from direct_distance ) )
select distinct c.city_code from city c join direct_distance d on c.city_code = d.city2_code where d.distance < 1000
select city_code from city where city_code in ( select city1_code from direct_distance where distance < 1000 )
select sum ( distance ) from direct_distance where city1_code in ( select city_code from city where city_name = 'BAL' )
select sum ( distance ) from direct_distance where city1_code in ( select city_code from city where city_name = 'BAL' )
select avg ( distance ) from direct_distance where city1_code in ( select city_code from city where city_name = 'Boston' )
select avg ( distance ) as average_distance from direct_distance where city1_code in ( select city_code from city where city_name = 'Boston' )
select city_name from city where city_code = ( select city_code from direct_distance where distance = ( select distance from city where city_code = 'Chicago' ) )
select city_name from city where city_code = ( select city1_code from direct_distance where distance = 'Chicago' )
select city_name from city where city_code = ( select max ( distance ) from direct_distance where city1_code = city.city_code )
select city_name from city where city_code = ( select city1_code from direct_distance where distance = ( select max ( distance ) from direct_distance where city1_code = 'Boston' ) )
select city_code , sum ( distance ) as total_distance from city join direct_distance on city.city_code = direct_distance.city1_code group by city_code
select city.city_code , sum ( direct_distance.distance ) as sum_distance from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_code
select city_name , avg ( distance ) as average_distance from city join direct_distance on city.city_code = direct_distance.city2_code group by city.city_name
select city_name , avg ( distance ) as average_distance from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_name
select distance from direct_distance where city1_code in ( select city_code from student where fname = 'Linda' and lname = 'Smith' ) and city2_code in ( select city_code from student where fname = 'Tracy' and lname = 'Kim' )
select d.distance from direct_distance d join city c on d.city2_code = c.city_code join student s on s.city_code = c.city_code where s.fname = 'Linda' and s.lname = 'Smith'
select fname , lname from student where city_code in ( select city_code from direct_distance where distance = ( select distance from student where fname = 'Linda' and lname = 'Smith' ) )
sql placeholder
select city.state from city join student on city.city_code = student.city_code where student.fname = 'Linda'
select city.state from city join student on city.city_code = student.city_code where student.fname = 'Linda'
select * from sailors where age > 30
select * from sailors where age > 30
select name , age from sailors where age < 30
select name , age from sailors where age < 30
select name from boats where bid in ( select bid from reserves where sid = 1 )
select distinct b.bid from boats b join reserves r on b.bid = r.bid join sailors s on r.sid = s.sid where s.sid = 1
select name from boats where bid = 102
select name from sailors where sid in ( select sid from reserves where bid = 102 )
select distinct boats.bid from boats join reserves on boats.bid = reserves.bid
select sid from reserves where bid in ( select bid from boats )
select name from sailors where name like '%e%'
select name from sailors where name like '%e%'
select distinct s.sid from sailors s where s.age > ( select max ( age ) from sailors )
select distinct s.sid from sailors s where s.age not in ( select min ( age ) from sailors )
select distinct name from sailors where age > ( select max ( age ) from sailors where rating > 7 )
select distinct s1.name from sailors s1 where s1.age > ( select max ( s2.age ) from sailors s2 where s2.rating > 7 )
select sailors.name , sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.sid in ( select sid from boats join reserves on boats.bid = reserves.bid )
select sailors.name , sailors.sid from sailors inner join reserves on sailors.sid = reserves.sid group by sailors.sid
select sailors.sid , sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid , sailors.name having count ( reserves.bid ) > 1
select distinct s.name from sailors s join reserves r on s.sid = r.sid group by s.sid having count ( distinct r.bid ) >= 2
select sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'Red' or color = 'Blue' ) )
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ( 'Red' , 'Blue' )
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'Red' or color = 'Blue' ) )
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'Red' or color = 'Blue' ) )
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ( 'Red' , 'Blue' )
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ( 'Red' , 'Blue' )
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'red' or color = 'blue' ) )
select s.name , s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ( 'Red' , 'Blue' )
select sid from sailors where sid not in ( select sid from reserves )
select sid from sailors where sid not in ( select sid from reserves )
select name , sid from sailors where sid not in ( select sid from reserves )
select name , sid from sailors where sid not in ( select sid from reserves )
select sid from sailors where sid not in ( select sid from reserves )
select sid from sailors where sid not in ( select sid from reserves )
select name from sailors where sid in ( select sid from reserves where bid = 103 )
select name from sailors where sid in ( select sid from reserves where bid = 103 )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select sailors.name , sailors.sid from sailors join reserves on sailors.sid = reserves.sid where sailors.rating > 2
select name , sid from sailors where rating >= 3 and sid in ( select sid from reserves where bid = ( select bid from boats ) )
select name , age from sailors where age = ( select max ( age ) from sailors )
select name , age from sailors where age = ( select max ( age ) from sailors )
select count ( distinct sid ) from sailors
select count ( * ) from sailors
select avg ( age ) from sailors where rating = 7
select avg ( age ) from sailors where rating = 7
select count ( * ) from sailors where name like 'D%'
select count ( * ) from sailors where name like 'D%'
select avg ( rating ) as avg_rating , max ( age ) as max_age from sailors
select avg ( rating ) as averagerating , max ( age ) as maxage from sailors
select boats.name , count ( reserves.bid ) as reservation_count from boats join reserves on boats.bid = reserves.bid group by boats.name
select boats.name , count ( reserves.sid ) as reservation_count from boats join reserves on boats.bid = reserves.bid group by boats.name
select boats.name , count ( reserves.sid ) as reservation_count from boats join reserves on boats.bid = reserves.bid where reserves.sid > 50 group by boats.bid
select boats.name , count ( reserves.sid ) as reservation_count from boats join reserves on boats.bid = reserves.bid where reserves.sid > 50 group by boats.bid
select b.name , count ( r.sid ) as reservation_count from boats b join reserves r on b.bid = r.bid group by b.bid having reservation_count > 1
select b.name , count ( r.sid ) as reservation_count from boats b join reserves r on b.bid = r.bid group by b.bid having reservation_count > 1
select boats.name , count ( reserves.sid ) as reservation_count from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.sid > 1 group by boats.name
select boats.name , count ( reserves.bid ) as reservation_count from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.sid > 1 group by boats.name
select s.rating , avg ( s.age ) from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'Red' group by s.rating
select s.rating , avg ( s.age ) from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'Red' group by s.rating
select name , rating , age from sailors order by rating asc , age
select name , rating , age from sailors order by rating asc , age
select count ( * ) from boats
select count ( * ) from boats
select count ( * ) from boats where color = 'red'
select count ( * ) from boats where color = 'Red'
select name from boats where bid in ( select bid from reserves join sailors on reserves.sid = sailors.sid where age between 20 and 30 )
select name from boats where bid in ( select bid from reserves join sailors on reserves.sid = sailors.sid where age between 20 and 30 )
sql placeholder
select s.name from sailors s where s.rating > ( select max ( rating ) from sailors where name in ( select name from boats where color = 'Red' ) )
select max ( rating ) from sailors
select max ( rating ) from sailors
select name from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where name = 'Melon' ) )
select name from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where name = 'Melon' ) )
select name , age from sailors order by rating desc
select name , age from sailors order by rating desc
select model from headphone where price = ( select max ( price ) from headphone )
select model from headphone where price = ( select max ( price ) from headphone )
select distinct model from headphone order by model asc
select distinct model from headphone order by model asc
select class from headphone group by class order by count ( * ) desc limit 1
select class from headphone group by class having count ( headphone_id ) = ( select max ( count ) from ( select count ( headphone_id ) as count from headphone group by class ) )
select class from headphone group by class having count ( headphone_id ) > 2
select class from headphone group by class having count ( headphone_id ) <= 2
select class , count ( headphone_id ) from headphone where price > 200 group by class
select class , count ( * ) from headphone where price > 200 group by class
select count ( distinct earpads ) from headphone
select count ( distinct earpads ) from headphone
select earpads from headphone group by earpads order by count ( * ) desc limit 2
select earpads , count ( * ) as num_headphones from headphone group by earpads order by num_headphones desc limit 2
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select construction , avg ( price ) as avg_price from headphone group by construction
select construction , avg ( price ) as average_price from headphone group by construction
select distinct h1.class from headphone h1 join headphone h2 on h1.class = h2.class where h1.earpads = 'Bowls' and h2.earpads = 'Comfort Pads'
select distinct class from headphone where earpads = 'Bowls' intersect select distinct class from headphone where earpads = 'Comfort Pads'
select earpads from headphone where construction not in ( select construction from headphone where construction = 'plastic' )
select earpads from headphone where construction != 'Plastic'
select model from headphone where price < ( select avg ( price ) from headphone )
select model from headphone where price < ( select avg ( price ) from headphone )
select name from store order by date_opened asc
select name from store order by date_opened asc
select name , parking from store where neighborhood = 'Tarzana'
select name , parking from store where neighborhood = 'Tarzana'
select count ( distinct neighborhood ) from store
select count ( distinct neighborhood ) from store
select neighborhood , count ( store_id ) as num_stores from store group by neighborhood
select neighborhood , count ( store_id ) as store_count from store group by neighborhood
select name , count ( * ) from store where store_id in ( select store_id from stock group by store_id having count ( headphone_id ) = ( select max ( cnt ) from ( select count ( headphone_id ) as cnt from stock group by store_id ) ) )
select store.name , sum ( stock.quantity ) from store join stock on store.store_id = stock.store_id where stock.headphone_id in ( select headphone_id from headphone where headphone_id = stock.headphone_id ) group by store.store_id
select name from store where store_id not in ( select store_id from stock where headphone_id = ( select headphone_id from headphone ) )
select name from store where store_id not in ( select store_id from stock where headphone_id = headphone_id )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select headphone.model from headphone join stock on headphone.headphone_id = stock.headphone_id group by headphone.model order by sum ( stock.quantity ) desc limit 1
select h.model from headphone h join stock s on h.headphone_id = s.headphone_id group by h.model order by sum ( s.quantity ) desc limit 1
select count ( distinct headphone.headphone_id ) from headphone join stock on headphone.headphone_id = stock.headphone_id join store on stock.store_id = store.store_id where store.name = 'Woodman'
select sum ( stock.quantity ) from stock join store on stock.store_id = store.store_id where store.name = 'Woodman'
select neighborhood from store where store_id not in ( select store_id from stock where quantity > 0 )
select neighborhood from store where store_id not in ( select store_id from stock where headphone_id = headphone_id )
select count ( distinct author_id ) from author
select count ( distinct author_id ) from author
select count ( * ) from paper
select count ( paper_id ) from paper
select count ( distinct affiliation_id ) from affiliation
select count ( distinct affiliation_id ) from affiliation
select count ( * ) from paper where year = 2000 and title = 'NAACL'
select count ( * ) from paper where year = 2000 and title = 'NAACL'
select count ( * ) from paper join author_list on paper.paper_id = author_list.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' and paper.year = 2009
select count ( * ) from paper join author_list on paper.paper_id = author_list.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' and paper.year = 2009
select name , address from affiliation
select name , address from affiliation
select venue , year from paper order by year asc
select distinct venue from paper order by year asc
select title , paper_id from paper where paper_id in ( select paper_id from author_list where affiliation_id in ( select affiliation_id from affiliation where name = 'Harvard University' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where affiliation_id in ( select affiliation_id from affiliation where name = 'Harvard University' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' ) )
select distinct title , paper_id from paper where paper_id in ( select paper_id from author_list where affiliation_id in ( select affiliation_id from affiliation where name = 'Stanford University' ) )
select distinct title , paper_id from paper where paper_id in ( select paper_id from author_list where affiliation_id in ( select affiliation_id from affiliation where name = 'Cornell University' ) ) and paper_id in ( select paper_id from author_list where affiliation_id in ( select affiliation_id from affiliation where name = 'Stanford University' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Kathleen' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Kathleen' ) )
sql placeholder
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id = ( select author_id from author where name = 'Mckeown' ) ) and paper_id not in ( select paper_id from author_list where author_id = ( select author_id from author where name = 'Rambow' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' or name = 'Rambow' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown , Kathleen' ) )
select a.name , count ( al.paper_id ) as number_of_papers from author a join author_list al on a.author_id = al.author_id group by a.name order by number_of_papers desc
select author.name , count ( author_list.paper_id ) as publication_count from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id group by author.author_id order by publication_count desc
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id group by affiliation.affiliation_id order by count ( distinct paper.paper_id ) asc
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id group by affiliation.affiliation_id order by count ( * ) desc
select author.name from author join author_list on author.author_id = author_list.author_id group by author.author_id having count ( author_list.paper_id ) > 50
select name from author where author_id in ( select author_id from author_list group by author_id having count ( paper_id ) > 50 )
select author.name from author join author_list on author.author_id = author_list.author_id group by author.author_id having count ( author_list.paper_id ) = 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id group by author.author_id having count ( paper.paper_id ) = 1
select venue , year from paper group by venue , year order by count ( * ) desc limit 1
select venue , year from paper group by venue , year order by count ( paper_id ) desc limit 1
select venue from ( select venue , count ( paper_id ) as cnt from paper group by venue order by cnt asc limit 1 )
select venue from paper group by venue order by count ( paper_id ) asc limit 1
select count ( distinct citation.cited_paper_id ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'A00-1002'
select count ( distinct citation.cited_paper_id ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'A00-1002'
select count ( distinct cited_paper_id ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'D12-1027'
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'D12-1027'
select paper.paper_id , count ( citation.cited_paper_id ) as num_citations from paper join citation on paper.paper_id = citation.cited_paper_id group by paper.paper_id order by num_citations desc limit 1
select paper.paper_id , count ( citation.cited_paper_id ) as num_citations from paper join citation on paper.paper_id = citation.paper_id group by paper.paper_id order by num_citations desc limit 1
select p.title from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id order by count ( c.cited_paper_id ) desc limit 1
select p.title from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id order by count ( c.cited_paper_id ) desc limit 1
select paper.title , count ( citation.cited_paper_id ) as num_citations from paper join citation on paper.paper_id = citation.cited_paper_id group by paper.paper_id order by num_citations desc limit 10
select paper.title , count ( citation.cited_paper_id ) as num_citations from paper join citation on paper.paper_id = citation.cited_paper_id group by paper.paper_id order by num_citations desc limit 10
select count ( * ) from citation where paper_id in ( select paper_id from author where name = 'Mckeown' and email = 'Kathleen' )
select count ( * ) from citation where paper_id in ( select paper_id from author where name = 'Mckeown' and email = 'Kathleen' )
select count ( * ) from paper where paper_id in ( select cited_paper_id from citation where cited_paper_id = paper.paper_id )
sql placeholder
sql placeholder
sql placeholder
select venue , year from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' or name = 'Kathleen' ) )
select venue , year from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' or name = 'Kathleen' ) )
select venue , year from paper where paper_id in ( select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' )
select venue , year from paper where paper_id in ( select paper_id from affiliation where affiliation_id = 'Columbia University' )
select author.name from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by author.name order by count ( * ) desc limit 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by author.name order by count ( * ) desc limit 1
select affiliation.name from affiliation where affiliation_id in ( select affiliation_id from author_list join paper on author_list.paper_id = paper.paper_id where year = 2009 group by affiliation_id order by count ( * ) desc limit 3 )
select affiliation.name from affiliation where affiliation.affiliation_id in ( select affiliation_id from author_list join paper on author_list.paper_id = paper.paper_id where year = 2009 group by affiliation_id order by count ( * ) desc limit 3 )
select count ( * ) from paper where year <= 2009
select count ( * ) from paper where year <= 2009 or year >= 2009
select count ( * ) from paper where year between 2000 and 2009
select count ( * ) from paper join affiliation on paper.paper_id = affiliation.affiliation_id where affiliation.name = 'Stanford University' and paper.year between 2000 and 2009
select title from paper where paper_id = ( select paper_id from author_list group by paper_id order by count ( author_id ) desc limit 1 )
select paper.title from paper inner join ( select paper_id , count ( author_id ) as num_authors from author_list group by paper_id ) as temp on paper.paper_id = temp.paper_id where num_authors = ( select max ( num_authors ) from ( select count ( author_id ) as num_authors from author_list group by paper_id ) )
sql placeholder
sql placeholder
select a.name from author a join author_list al on a.author_id = al.author_id where a.name = 'Mckeown , Kathleen' group by a.name order by count ( distinct al.paper_id ) desc limit 1
select name from author where author_id in ( select author_id from author_list where paper_id = ( select paper_id from author_list where author_id = ( select author_id from author_list where name = 'Mckeown , Kathleen' group by author_id ) ) )
select paper_id from paper where title like '%translation%'
select paper_id from paper where title like '%translation%'
select paper_id , title from paper where paper_id not in ( select cited_paper_id from citation )
select paper_id , title from paper where paper_id not in ( select paper_id from citation )
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id where affiliation.address like '%China%' group by affiliation.affiliation_id order by count ( author_list.paper_id ) desc limit 1
sql placeholder
select venue , count ( distinct paper_id ) as num_papers from paper group by venue
select venue , count ( paper_id ) from paper group by venue , year
select affiliation.name , count ( paper.paper_id ) as total_papers from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id group by affiliation.name
select affiliation.name , count ( paper.paper_id ) as published_papers from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id group by affiliation.affiliation_id
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select p.title from paper p where p.paper_id in ( select c.paper_id from citation c group by c.paper_id having count ( c.cited_paper_id ) > 50 )
select count ( distinct author_id ) from author where author_id not in ( select distinct author_id from author_list join citation on author_list.paper_id = citation.paper_id group by author_id having count ( cited_paper_id ) > 50 )
select count ( distinct author_id ) from author where author_id not in ( select author_id from author_list join citation on author_list.paper_id = citation.paper_id group by author_id having count ( citation.cited_paper_id ) > 50 )
select distinct name from author where author_id in ( select author_id from author_list where paper_id in ( select paper_id from paper where title = 'NAACL' or title = 'ACL' ) )
select distinct author.name from author where author_id in ( select author_id from author_list join paper on author_list.paper_id = paper.paper_id where year = 2009 intersect select author_id from author_list join paper on author_list.paper_id = paper.paper_id where year = 2009 )
select distinct author.name from author where author.author_id not in ( select author_id from author_list join paper on author_list.paper_id = paper.paper_id where paper.title = 'ACL' )
select name from author where author_id not in ( select author_id from author_list where paper_id in ( select paper_id from paper where title = 'ACL' ) )
select count ( * ) from conference
select count ( * ) from conference
select distinct conference_name from conference
select distinct conference_name from conference
select conference_name , year , location from conference
select conference_name , year , location from conference
select conference_name , count ( * ) as count from conference group by conference_name
select conference_name , count ( * ) from conference group by conference_name
select year , count ( conference_id ) as number_of_conferences from conference group by year
select year , count ( * ) from conference group by year
select year from conference group by year order by count ( conference_id ) asc limit 1
select year from conference group by year order by count ( conference_id ) asc limit 1
select location from conference group by location having count ( conference_id ) >= 2
select location from conference group by location having count ( conference_id ) >= 2
select institution_name , location , founded from institution
select institution_name , location , founded from institution
select count ( * ) from institution where founded between 1850 and 1900
select count ( * ) from institution where founded between 1850 and 1900
select institution_name , location from institution where founded = ( select max ( founded ) from institution )
select institution_name , location from institution where founded = ( select max ( founded ) from institution )
select institution_name , count ( distinct staff.staff_id ) from institution join staff on institution.institution_id = staff.institution_id where institution.founded > 1800 group by institution.institution_id
select institution.institution_id , count ( distinct staff.staff_id ) as staff_count from institution join staff on institution.institution_id = staff.institution_id where institution.founded > 1800 group by institution.institution_id
select institution_name from institution where institution_id not in ( select institution_id from staff )
select institution_name from institution where institution_id not in ( select institution_id from staff )
select name from staff where age > ( select avg ( age ) from staff )
select name from staff where age > ( select avg ( age ) from staff )
select max ( age ) as maxage , min ( age ) as minage from staff where nationality = 'United States'
select max ( age ) as maxage , min ( age ) as minage from staff
select conference_name from conference where conference_id in ( select conference_id from conference_participation where staff_id in ( select staff_id from staff where nationality = 'Canada' ) )
select conference_name from conference where conference_id in ( select conference_id from conference_participation where staff_id in ( select staff_id from staff where nationality = 'Canada' ) )
select distinct name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( select conference_id from conference where conference_name = 'Speaker' ) )
select distinct name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( select conference_id from conference where role = 'sponsor' ) )
select distinct s.name from staff s join conference_participation cp on s.staff_id = cp.staff_id join conference c on cp.conference_id = c.conference_id where c.conference_name in ( 'ACL' , 'Naccl' ) group by s.staff_id having count ( distinct c.conference_name ) = 2
select distinct s.name from staff s join conference_participation cp on s.staff_id = cp.staff_id join conference c on cp.conference_id = c.conference_id where c.conference_name in ( 'ACL' , 'NACCL' ) group by s.staff_id having count ( distinct c.conference_name ) = 2
select name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( 2003 , 2004 ) )
select name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( 2003 , 2004 ) )
select conference_name , year , ( select count ( * ) from conference_participation where conference_id = conference.conference_id ) as participant_count from conference
select conference.conference_id , conference.conference_name , conference.year , count ( distinct conference_participation.staff_id ) as participant_count from conference join conference_participation on conference.conference_id = conference_participation.conference_id group by conference.conference_id , conference.conference_name , conference.year
select conference.conference_name from conference join conference_participation on conference.conference_id = conference_participation.conference_id group by conference.conference_id order by count ( * ) desc limit 2
select c.conference_name from conference c join conference_participation cp on c.conference_id = cp.conference_id group by c.conference_id order by count ( cp.staff_id ) desc limit 2
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select institution_name , location from institution where institution_id not in ( select institution_id from conference_participation where conference_id = 2004 )
select institution_name , location from institution where institution_id not in ( select institution_id from conference_participation where conference_id = 2004 )
select ps.pilot_name from pilotskills as ps where ps.age = ( select max ( age ) from pilotskills )
select p.pilot_name from pilotskills p where p.age = ( select max ( age ) from pilotskills )
select p.pilot_name from pilotskills p where p.age < ( select avg ( age ) from pilotskills ) order by p.age asc
select pilot_name from pilotskills where age < ( select avg ( age ) from pilotskills ) order by age asc
select * from pilotskills where age < 30
select * from pilotskills where age < 30
select p.pilot_name from pilotskills p where p.plane_name = 'Piper Cub' and p.age < 35
select pilot_name from pilotskills where age < 35 and plane_name = 'Piper Cub'
select location from hangar where plane_name = 'F-14 Fighter'
select location from hangar where plane_name = 'F-14 Fighter'
select count ( distinct location ) from hangar
select count ( distinct location ) from hangar
select ps.plane_name from pilotskills ps where ps.pilot_name = 'Jones' and ps.age = 32
select h.plane_name from hangar h join pilotskills ps on h.plane_name = ps.plane_name where ps.pilot_name = 'Jones' and ps.age = 32
select count ( * ) from pilotskills where age > 40
select count ( * ) from pilotskills where age > 40
select count ( distinct h.plane_name ) from hangar h join pilotskills ps on h.plane_name = ps.plane_name where ps.age < 35 and ps.plane_name = 'B-52 Bomber'
select count ( distinct p.plane_name ) from pilotskills p where p.age < 35 and p.plane_name = 'B-52 Bomber'
select p.pilot_name from pilotskills p where p.age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' ) and p.plane_name = 'Piper'
select ps.pilot_name from pilotskills ps where ps.plane_name = 'Piper Cub' and ps.age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select hangar.plane_name from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.plane_name order by count ( * ) desc limit 1
select hangar.plane_name from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.plane_name order by count ( * ) desc limit 1
select plane_name from pilotskills where plane_name = ( select plane_name from pilotskills group by plane_name order by count ( * ) asc limit 1 )
select hangar.plane_name from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.plane_name order by count ( * ) asc limit 1
select count ( distinct p.pilot_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Chicago'
select count ( distinct p.pilot_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Chicago'
select h.plane_name from hangar h join pilotskills ps on h.plane_name = ps.plane_name where ps.pilot_name = 'Smith' and ps.age = 41
select h.plane_name from hangar h join pilotskills p on h.plane_name = p.plane_name where p.pilot_name = 'Smith' and p.age = 41
select count ( distinct plane_name ) from pilotskills
select count ( distinct plane_name ) from pilotskills
select count ( distinct ps.plane_name ) from pilotskills ps where ps.pilot_name = 'Smith'
select count ( distinct ps.plane_name ) from pilotskills ps where ps.pilot_name = 'Smith'
select count ( distinct p.plane_name ) from pilotskills p where p.age > 40
select count ( distinct p.plane_name ) from pilotskills p where p.age > 40
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills order by age desc
select pilot_name from pilotskills order by age desc
select location from hangar order by plane_name asc
select distinct location from hangar order by plane_name asc
select distinct plane_name from pilotskills order by plane_name asc
select distinct plane_name from hangar order by plane_name asc
select count ( distinct pilot_name ) from pilotskills where age > 40 or age < 30
select count ( * ) from pilotskills where age > 40 or age < 30
select p.pilot_name , p.age from pilotskills p where p.plane_name = 'Piper Cub' and p.age > 35 or p.plane_name = 'F-14 Fighter' and p.age < 30
select pilot_name , age from pilotskills where plane_name in ( select plane_name from pilotskills where plane_name = 'Piper Cub' ) or plane_name in ( select plane_name from pilotskills where plane_name = 'F-14 Fighter' ) and age < 30
select distinct p1.pilot_name from pilotskills p1 where p1.plane_name = 'Piper Cub' and not exists ( select 1 from pilotskills p2 where p2.plane_name = 'B-52 Bomber' and p2.pilot_name = p1.pilot_name )
select distinct p1.pilot_name from pilotskills p1 where p1.plane_name = 'Piper Cub' and not exists ( select 1 from pilotskills p2 where p2.plane_name = 'B-52 Bomber' and p2.pilot_name = p1.pilot_name )
select distinct ps1.pilot_name from pilotskills ps1 join hangar h on ps1.plane_name = h.plane_name where h.plane_name in ( 'Piper Cub' , 'B-52 Bomber' )
select distinct p1.pilot_name from pilotskills p1 join hangar h1 on p1.plane_name = h1.plane_name where h1.plane_name = 'Piper Cub' and p1.pilot_name in ( select p2.pilot_name from pilotskills p2 join hangar h2 on p2.plane_name = h2.plane_name where h2.plane_name = 'B-52 Bomber' )
select avg ( age ) as average_age , min ( age ) as smallest_age from pilotskills
select avg ( age ) , min ( age ) from pilotskills
select distinct ps1.pilot_name from pilotskills ps1 join hangar h1 on ps1.plane_name = h1.plane_name join hangar h2 on ps1.plane_name = h2.plane_name where h1.location = 'Austin' and h2.location = 'Boston'
select distinct ps1.pilot_name from pilotskills ps1 join hangar h1 on ps1.plane_name = h1.plane_name where h1.location = 'Austin' and ps1.pilot_name in ( select ps2.pilot_name from pilotskills ps2 join hangar h2 on ps2.plane_name = h2.plane_name where h2.location = 'Boston' )
select distinct ps1.pilot_name from pilotskills ps1 where exists ( select 1 from pilotskills ps2 where ps2.plane_name = 'Piper Cub' and ps2.pilot_name = ps1.pilot_name ) or exists ( select 1 from pilotskills ps3 where ps3.plane_name = 'F-14 Fighter' and ps3.pilot_name = ps1.pilot_name )
select distinct p.pilot_name from pilotskills p where exists ( select 1 from hangar h where h.plane_name = p.plane_name and h.plane_name = 'Piper Cub' ) or exists ( select 1 from pilotskills h where h.plane_name = p.plane_name and h.pilot_name = p.pilot_name and h.plane_name = 'F-14 Fighter' )
select plane_name , avg ( age ) from pilotskills group by plane_name
select plane_name , avg ( age ) as average_age from pilotskills group by plane_name
sql placeholder
select plane_name , count ( * ) as num_entries from pilotskills group by plane_name
select plane_name , max ( age ) as oldest_pilot from pilotskills group by plane_name order by plane_name asc
select plane_name , max ( age ) from pilotskills group by plane_name order by plane_name asc
select ps.pilot_name from pilotskills ps join hangar h on ps.plane_name = h.plane_name group by ps.plane_name
select h.plane_name , ps.pilot_name from hangar h join pilotskills ps on h.plane_name = ps.plane_name join ( select max ( age ) from pilotskills group by plane_name ) as ps on ps.pilot_name = ps.pilot_name
select pilotskills.pilot_name , max ( pilotskills.age ) from pilotskills where pilotskills.pilot_name = pilotskills.pilot_name group by pilotskills.pilot_name
select pilot_name , max ( age ) from pilotskills group by pilot_name
select hangar.location , count ( pilotskills.age ) , avg ( pilotskills.age ) from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.location
select h.location , count ( ps.pilot_name ) as pilot_count from hangar h left join pilotskills ps on h.plane_name = ps.plane_name group by h.location
select p.plane_name , count ( p.pilot_name ) from pilotskills p where p.age < 35 group by p.plane_name
select h.plane_name , count ( distinct ps.pilot_name ) as pilot_count from hangar h join pilotskills ps on h.plane_name = ps.plane_name group by h.plane_name having avg ( ps.age ) < 35
select h.location from hangar h join pilotskills ps on h.plane_name = ps.plane_name where ps.age = ( select min ( age ) from pilotskills )
select location from hangar where plane_name in ( select plane_name from pilotskills where age = ( select min ( age ) from pilotskills ) )
select p.pilot_name , p.age from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Austin'
select p.pilot_name , p.age from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Austin'
select distinct p1.pilot_name from pilotskills p1 where p1.age > ( select min ( p2.age ) from pilotskills p2 where p2.plane_name = 'Piper Cub' ) order by p1.pilot_name asc
select distinct p1.pilot_name from pilotskills p1 where p1.age > ( select max ( p2.age ) from pilotskills p2 where p2.plane_name = 'Piper Cub' ) order by p1.pilot_name asc
select count ( distinct p.pilot_name ) from pilotskills p where p.age < ( select min ( p2.age ) from pilotskills p2 where p2.plane_name = 'F-14 Fighter' )
select count ( distinct ps.pilot_name ) from pilotskills ps where ps.age < ( select min ( ps2.age ) from pilotskills ps2 where ps2.plane_name = 'F-14 Fighter' )
select distinct plane_name from hangar where plane_name like '%Bomber%'
select distinct plane_name from pilotskills where plane_name like '%Bomber%'
select count ( distinct ps1.pilot_name ) from pilotskills ps1 where ps1.age > ( select max ( ps2.age ) from pilotskills ps2 where ps2.plane_name = 'Piper Cub' )
select count ( distinct ps1.pilot_name ) from pilotskills ps1 where ps1.age > ( select min ( ps2.age ) from pilotskills ps2 where ps2.plane_name = 'Piper Cub' )
select name from district where area_km = ( select max ( area_km ) from district )
select area_km , government_website from district where population = ( select min ( population ) from district )
select name , population from district where area_km > ( select avg ( area_km ) from district )
select max ( area_km ) , avg ( area_km ) from district
select sum ( population ) from district where area_km in ( select area_km from district order by area_km desc limit 3 )
select district_id , name , government_website from district order by population asc
select name from district where government_website like '%gov%'
select district_id , name from district where population > 4000 or area_km > 3000
sql placeholder
select avg ( points ) as avg_points , avg ( age ) as avg_age from spokesman where rank_position = 1
select name , points from spokesman where age < 40
select s.name from spokesman s where s.age = ( select max ( age ) from spokesman )
select s.name from spokesman s where s.points < ( select avg ( points ) from spokesman )
select name from district where district_id in ( select district_id from spokesman_district group by district_id having count ( spokesman_id ) = ( select max ( cnt ) from ( select count ( spokesman_id ) as cnt from spokesman_district group by district_id ) ) )
select distinct spokesman.name from spokesman join spokesman_district on spokesman.spokesman_id = spokesman_district.spokesman_id where spokesman_district.start_year < 2004
select district.name , count ( distinct spokesman_district.spokesman_id ) as num_spokesmen from district join spokesman_district on district.district_id = spokesman_district.district_id group by district.district_id
select name from district where district_id in ( select district_id from spokesman_district where spokesman_id in ( select spokesman_id from spokesman where rank_position = 1 ) group by district_id having count ( distinct spokesman_id ) = 2 )
select name from district where district_id in ( select district_id from spokesman_district group by district_id having count ( spokesman_id ) > 1 )
select count ( * ) from district where district_id not in ( select district_id from spokesman_district )
select name from spokesman where spokesman_id not in ( select spokesman_id from spokesman_district )
select sum ( population ) as total_population , avg ( population ) as average_population from district where district_id in ( select district_id from spokesman_district )
select title from sculptures where year = ( select max ( year ) from sculptures )
select title from sculptures where year = ( select max ( year ) from sculptures )
select p.title , p.location from paintings p where p.year = ( select min ( year ) from paintings )
select title , location from paintings where year = ( select min ( year ) from paintings )
select title from sculptures where location = '226'
select title from sculptures where location = '226'
select title , location from paintings
select title , location from paintings
select title , location from sculptures
select title , location from sculptures
select distinct medium from paintings where paintingid = 80
select medium from paintings where paintingid = 80
select fname , lname from artists where birthyear > 1850
sql placeholder
select title , year from sculptures where location != 'Gallery 226'
select title , year from sculptures where location != 'gallery 226'
select distinct artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select fname , lname from artists where deathyear = ( select max ( deathyear ) from artists )
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select a.fname , a.deathyear from artists a where a.deathyear = ( select max ( deathyear ) from artists )
select count ( paintingid ) from paintings where location = 240
select count ( paintingid ) from paintings where location = 240
select count ( * ) from paintings where painterid = ( select max ( deathyear ) from artists )
select count ( * ) from paintings where painterid = ( select max ( deathyear ) from artists )
select paintings.title , paintings.year from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Mary'
select paintings.title , paintings.year from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Mary'
select paintings.width_mm from paintings join artists on paintings.painterid = artists.artistid where artists.birthyear < 1850
select width_mm from paintings join artists on paintings.painterid = artists.artistid where artists.birthyear < 1850
select location , medium from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Pablo'
select location , medium from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Pablo'
select fname , lname from artists where artistid in ( select painterid from paintings ) and artistid in ( select sculptureid from sculptures )
sql placeholder
select distinct artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' and artists.artistid in ( select painterid from paintings where medium = 'Lithographic' )
select distinct fname , lname from artists where artistid in ( select painterid from paintings where medium = 'oil' ) and artistid in ( select painterid from paintings where medium = 'lithographic' )
select artists.birthyear from artists join paintings on artists.artistid = paintings.painterid where paintings.year = 1884 and paintings.medium = 'canvas'
select birthyear from artists where artistid in ( select painterid from paintings where year = 1884 )
select distinct artists.fname from artists join paintings on artists.artistid = paintings.painterid where paintings.location = '241' and paintings.medium = 'oil'
select artists.fname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' and paintings.location = '241'
select medium , count ( * ) as numberofworks from paintings group by medium
select medium , count ( * ) as numberofworks from paintings group by medium
select medium , avg ( height_mm ) as averageheight from paintings group by medium
select medium , avg ( height_mm ) as averageheight from paintings group by medium
select location , count ( * ) from paintings where year < 1900 group by location
select count ( * ) from paintings where year < 1900 and location = 'New York'
select title from paintings where year > 1910 and medium = 'oil'
select title from paintings where medium = 'Oil' and year > 1910
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct p1.title from paintings p1 where p1.height_mm > ( select min ( p2.height_mm ) from paintings p2 where p2.medium = 'canvas' )
select distinct p1.title from paintings p1 where p1.height_mm > ( select min ( p2.height_mm ) from paintings p2 where p2.medium = 'canvas' )
select distinct paintingid from paintings where year < ( select min ( year ) from paintings where location = 240 )
sql placeholder
select paintingid from paintings where year = ( select min ( year ) from paintings )
select paintingid from paintings where year = ( select min ( year ) from paintings )
select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
sql placeholder
select distinct title from paintings order by title asc
select distinct title from paintings order by title asc
select distinct title from paintings order by height_mm asc
select distinct title from paintings order by height_mm asc
select paintings.title , sculptures.title from paintings join sculptures on paintings.painterid = sculptures.sculptorid where sculptures.year between 1900 and 1950
select paintings.title , sculptures.title from paintings join sculptures on paintings.painterid = sculptures.sculptorid where paintings.year between 1900 and 1950
select title from paintings where painterid in ( select painterid from sculptures where sculptureid = 222 )
select paintings.title , sculptures.title from paintings join sculptures on paintings.painterid = sculptures.sculptorid where sculptures.sculptorid = 222
select artists.artistid from artists join paintings on artists.artistid = paintings.painterid where paintings.year < 1900 group by artists.artistid order by count ( * ) desc limit 1
select a.artistid from artists a join paintings p on a.artistid = p.painterid where p.year < 1900 group by a.artistid order by count ( * ) desc limit 1
select fname from artists where artistid in ( select sculptureid from sculptures group by sculptureid having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from sculptures group by sculptureid ) ) )
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by sculptures.sculptorid order by count ( * ) desc limit 1
select title from paintings where width_mm < 600 or height_mm > 800
select title from paintings where width_mm < 600 or height_mm > 800
select distinct location from paintings where year < 1885 or year > 1930
select distinct location from paintings where year < 1885 or year > 1930
select paintingid from paintings where height_mm > 500 and height_mm < 2000
select paintingid from paintings where height_mm > 500 and width_mm < 2000
select distinct location from paintings where medium in ( 'on panel' , 'on canvas' )
select distinct location from paintings where medium in ( 'on panels' , 'on canvas' )
select distinct location from paintings where year < 1885 and year > 1930
select distinct location from paintings where year < 1885 and year > 1930
select avg ( p.height_mm ) , avg ( p.width_mm ) from paintings p join sculptures s on p.medium = s.medium where s.location = 'Gallery 241' and s.medium = 'Oil'
select avg ( height_mm ) as averageheight , avg ( width_mm ) as averagewidth from paintings where medium = 'oil' and location = '241'
select max ( height_mm ) , max ( paintingid ) from paintings where year < 1900
select height_mm , paintingid from paintings where year < 1900 order by height_mm desc limit 1
select year , max ( height_mm ) as maxheight , max ( width_mm ) as maxwidth from paintings group by year
select year , max ( height_mm ) as maxheight , max ( width_mm ) as maxwidth from paintings group by year
select paintings.painterid , avg ( paintings.height_mm ) as avg_height , avg ( paintings.width_mm ) as avg_width from paintings join artists on paintings.painterid = artists.artistid group by paintings.painterid order by artists.fname asc
select painterid , avg ( height_mm ) as avg_height , avg ( width_mm ) as avg_width from paintings group by painterid order by title asc
select artists.fname , count ( paintings.painterid ) as number_of_works from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( paintings.painterid ) >= 2
select artists.fname , count ( paintings.painterid ) as numberofworks from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( paintings.painterid ) >= 2
select deathyear from artists where artistid not in ( select painterid from paintings group by painterid having count ( * ) > 3 )
select deathyear from artists where artistid in ( select painterid from paintings group by painterid having count ( paintingid ) < 4 )
select deathyear from artists where artistid in ( select sculptureid from sculptures group by sculptureid order by count ( * ) asc limit 1 )
select deathyear from artists where artistid = ( select sculptureid from sculptures group by sculptureid order by count ( * ) asc limit 1 )
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select p.paintingid from paintings p where p.height_mm > ( select max ( height_mm ) from paintings where year > 1900 )
select distinct p1.paintingid from paintings p1 where p1.height_mm > ( select max ( p2.height_mm ) from paintings p2 where p2.year > 1900 )
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' group by artists.artistid order by count ( * ) desc limit 3
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' group by artists.artistid having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from paintings where medium = 'Oil' group by painterid ) )
select p.paintingid , p.location , p.title from paintings p where p.medium = 'oil' order by p.year asc
select paintingid , location , title from paintings where medium = 'oil' order by year asc
select year , location , title from paintings where height_mm > 1000 order by title asc
select year , location , title from paintings where height_mm > 1000 order by title asc
select fname , lname from artists where artistid in ( select painterid from paintings ) and artistid not in ( select sculptureid from sculptures )
select fname , lname from artists where artistid not in ( select sculptorid from sculptures )
select distinct p.location from paintings p where p.year < 1885 and not exists ( select 1 from sculptures s where s.location = p.location and s.medium = 'canvas' )
select p.location from paintings p where p.year < 1885 and p.medium != 'Canvas'
select count ( * ) from race
select count ( * ) from race
select winning_driver , winning_team from race order by winning_team asc
select winning_driver , winning_team from race order by winning_team asc
select winning_driver from race where pole_position != 'Junior Strous'
sql placeholder
select constructor from driver order by age asc
select distinct constructor from driver order by age asc
select distinct entrant from driver where age >= 20
select distinct entrant from driver where age >= 20
select max ( age ) as maximumage , min ( age ) as minimumage from driver
select max ( age ) , min ( age ) from driver
select count ( distinct engine ) from driver where age > 30 or age < 20
select count ( distinct engine ) from driver where age > 30 or age < 20
select driver_name from driver order by driver_name desc
select driver_name from driver order by driver_name desc
select driver.driver_name , race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name , race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name , ( select count ( * ) from race where race.driver_id = driver.driver_id ) as races_participated from driver
select driver.driver_name , count ( race.driver_id ) as races_participated from driver join race on driver.driver_id = race.driver_id group by driver.driver_name
select age from driver group by driver_id having count ( driver_id ) = ( select max ( total_races ) from ( select count ( driver_id ) as total_races from race group by driver_id ) )
select age from driver group by driver_id having count ( driver_id ) = ( select max ( total_races ) from ( select count ( driver_id ) as total_races from race group by driver_id ) )
select driver.driver_name , driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( race.race_name ) >= 2
select driver.driver_name , driver.age from driver join race on driver.driver_id = race.driver_id group by driver.driver_id having count ( distinct race.race_name ) >= 2
select race_name from race where driver_id in ( select driver_id from driver where age >= 26 )
select race.race_name from race join driver on race.driver_id = driver.driver_id where driver.age >= 26
select driver_name from driver where constructor != 'Bugatti'
select driver_name from driver where constructor != 'Bugatti'
select constructor , count ( distinct driver_id ) as num_drives from driver group by constructor
select constructor , count ( distinct driver_id ) as num_drives from driver group by constructor
select engine from driver group by engine order by count ( * ) desc limit 1
select engine from driver group by engine having count ( engine ) = ( select max ( count ) from ( select count ( engine ) as count from driver group by engine ) )
select engine from driver group by engine having count ( * ) >= 2
select engine from driver group by engine having count ( distinct driver_id ) >= 2
select driver_name from driver where driver_id not in ( select driver_id from race )
select driver_name from driver where driver_id not in ( select driver_id from race )
select distinct constructor from driver where age < 20 intersect select distinct constructor from driver where age > 30
select distinct constructor from driver where age < 20 intersect select distinct constructor from driver where age > 30
select winning_team from race group by winning_team having count ( winning_team ) > 1
select winning_team from race group by winning_team having count ( * ) > 1
select distinct driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position in ( select 'James Hinchcliffe' from race where race.pole_position = 'Carl Skerlong' ) and driver.driver_id in ( select driver_id from race where race.pole_position = 'James Hinchcliffe' )
select distinct driver_name from driver where driver_id in ( select driver_id from race where pole_position = 'James Hinchcliffe' ) and driver_id in ( select driver_id from race where pole_position = 'Carl Skerlong' )
select distinct driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = 'James Hinchcliffe' and driver.driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select driver_name from driver where driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select count ( * ) from languages
select count ( * ) from languages
select name from languages order by name asc
select name from languages order by name asc
select name from languages where name like '%ish%'
select name from languages where name like '%ish%'
select name from countries order by overall_score desc
select name from countries order by overall_score desc
select avg ( justice_score ) as average_justice_score from countries
select avg ( justice_score ) from countries
sql placeholder
sql placeholder
select count ( distinct language_id ) from official_languages
select count ( distinct language_id ) from official_languages
select name from countries order by education_score desc
select name from countries order by education_score desc
select name from countries where politics_score = ( select max ( politics_score ) from countries )
select name from countries where politics_score = ( select max ( politics_score ) from countries )
select c.name , ol.language_id from countries c join official_languages ol on c.id = ol.country_id join languages l on ol.language_id = l.id
select c.name , l.name from countries c join official_languages ol on c.id = ol.country_id join languages l on ol.language_id = l.id
select official_languages.language_id , count ( distinct official_languages.country_id ) as number_of_countries from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id
select l.name , count ( distinct ol.country_id ) as number_of_countries from languages l join official_languages ol on l.id = ol.language_id group by l.name
select official_languages.language_id from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count ( * ) desc limit 1
sql placeholder
select official_languages.language_id from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id having count ( distinct official_languages.country_id ) >= 2
select languages.name from languages join official_languages on languages.id = official_languages.language_id group by languages.name having count ( distinct official_languages.country_id ) >= 2
select avg ( countries.overall_score ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id where languages.name = 'English'
select avg ( overall_score ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id where languages.name = 'english'
select official_languages.language_id from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count ( * ) desc limit 3
select l.name from languages l join official_languages ol on l.id = ol.language_id group by l.id order by count ( * ) desc limit 3
select l.name from languages l join official_languages ol on l.id = ol.language_id join countries c on ol.country_id = c.id group by l.name order by avg ( c.overall_score ) desc
select l.name from languages l join official_languages ol on l.id = ol.language_id join countries c on ol.country_id = c.id group by l.id order by avg ( c.overall_score ) desc
select countries.name from countries join official_languages on countries.id = official_languages.country_id group by countries.id order by count ( official_languages.language_id ) desc limit 1
select name from countries where id in ( select country_id from official_languages group by country_id having count ( language_id ) = ( select max ( cnt ) from ( select count ( language_id ) as cnt from official_languages group by country_id ) ) )
select name from languages where id not in ( select language_id from official_languages )
select name from languages where id not in ( select language_id from official_languages )
select name from countries where id not in ( select country_id from official_languages )
select name from countries where id not in ( select country_id from official_languages )
select distinct l.name from languages l join official_languages ol on l.id = ol.language_id join countries c on ol.country_id = c.id where c.overall_score > 95 and c.overall_score < 90
select l.name from languages l join official_languages ol on l.id = ol.language_id join countries c on ol.country_id = c.id where c.overall_score > 95 and l.id in ( select language_id from official_languages where country_id = c.id )
select distinct country , town_city from addresses
select country , town_city from addresses
select distinct addresses.county_state_province from addresses join properties on addresses.address_id = properties.property_address_id
select property_name , county_state_province from properties inner join addresses on properties.property_address_id = addresses.address_id
select features.feature_description from features join property_features on features.feature_id = property_features.feature_id where features.feature_name = 'rooftop'
select feature_description from features where feature_name = 'rooftop'
select features.feature_name , features.feature_description from features where features.feature_id = ( select feature_id from property_features group by feature_id order by count ( * ) desc limit 1 )
sql placeholder
select min ( room_count ) from properties
select min ( room_count ) from properties
select count ( * ) from properties where parking_lots = 1 union select count ( * ) from properties where garage_yn = 1
select count ( * ) from properties where parking_lots in ( 1 )
sql placeholder
select distinct r.age_category_description from ref_age_categories r join users u on r.age_category_code = u.user_category_code where r.age_category_description like '%Mother%'
select first_name from users where user_id in ( select owner_user_id from properties group by owner_user_id having count ( property_id ) = ( select max ( cnt ) from ( select count ( property_id ) as cnt from properties group by owner_user_id ) ) )
select users.first_name from users join ( select owner_user_id , count ( property_id ) as total_properties from properties group by owner_user_id order by total_properties desc limit 1 ) as most_properties on users.user_id = most_properties.owner_user_id
select avg ( room_count ) from properties where property_id in ( select property_id from property_features where feature_id in ( select feature_id from features where feature_name = 'garden' ) )
select avg ( room_count ) from properties where property_id in ( select property_id from property_features where feature_id in ( select feature_id from features where feature_name = 'garden' ) )
select distinct a.town_city from addresses a join properties p on a.address_id = p.property_address_id join property_features pf on p.property_id = pf.property_id join features f on pf.feature_id = f.feature_id where f.feature_name = 'swimming pool'
select distinct town_city from addresses where address_id in ( select property_address_id from properties where property_id in ( select property_id from property_features where feature_id = 1 ) )
select p.property_id , p.price_min from properties as p where p.vendor_requested_price = ( select min ( vendor_requested_price ) from properties )
select p.property_id , min ( p.vendor_requested_price ) as min_price from properties p
select avg ( room_count ) from properties
select avg ( room_count ) from properties
select count ( distinct room_size ) from rooms
select count ( distinct room_size ) from rooms
select user_id , search_string from user_searches group by user_id having count ( * ) >= 2
select user_id , search_seq from user_searches group by user_id having count ( * ) >= 2
select max ( search_datetime ) from user_searches
select max ( search_datetime ) from user_searches
select * from user_searches order by search_datetime desc
select search_string , search_datetime from user_searches order by search_string desc
select distinct addresses.zip_postcode from addresses where addresses.address_id not in ( select properties.property_address_id from properties join users on properties.owner_user_id = users.user_id group by users.user_id having count ( properties.property_id ) <= 2 )
select distinct a.zip_postcode from addresses a join properties p on a.address_id = p.property_address_id where p.owner_user_id not in ( select owner_user_id from properties group by owner_user_id having count ( property_id ) <= 2 )
select distinct users.user_id , users.user_category_code from users join user_searches on users.user_id = user_searches.user_id group by users.user_id , users.user_category_code having count ( user_searches.search_string ) = 1
select user_id , user_category_code from users where user_id in ( select user_id from user_searches group by user_id having count ( * ) = 1 )
select age_category_description from ref_age_categories where age_category_code in ( select user_category_code from users where user_id = ( select user_id from user_searches order by search_datetime asc limit 1 ) )
select age_category_description from ref_age_categories where age_category_code in ( select user_category_code from users where user_id = ( select min ( search_datetime ) from user_searches ) )
select login_name from users where age_category_code = 'senior citizen' order by first_name asc
select login_name from users where age_category_code = 'senior citizens' order by first_name asc
select count ( * ) from user_searches where user_id in ( select user_id from users )
select count ( * ) from user_searches where user_id in ( select user_id from users where is_buyer = 1 )
select date_registered from users where login_name = 'ratione'
select date_registered from users where login_name = 'ratione'
select u.first_name , u.middle_name , u.last_name , u.login_name from users u where u.is_seller = 1
select first_name , middle_name , last_name , login_name from users where is_seller = 'yes'
select line_1_number_building , line_2_number_street , town_city from addresses where address_id in ( select address_id from users where age_category_code in ( select age_category_code from ref_age_categories where age_category_description = 'Senior Citizens' ) )
select line_1_number_building , line_2_number_street , town_city from addresses where address_id in ( select user_address_id from users where age_category_code = 'senior' )
select count ( distinct property_id ) from properties where property_id in ( select property_id from property_features group by property_id having count ( distinct feature_id ) >= 2 )
select count ( distinct properties.property_id ) from properties join property_features on properties.property_id = property_features.property_id where property_features.feature_id in ( select feature_id from property_features group by property_id having count ( distinct feature_id ) >= 2 )
select properties.property_name , count ( property_photos.photo_seq ) as photo_count from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select properties.property_id , count ( property_photos.photo_seq ) as number_of_photos from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select properties.owner_user_id , count ( property_photos.photo_seq ) as photo_count from properties left join property_photos on properties.property_id = property_photos.property_id group by properties.owner_user_id
select distinct owner_user_id , count ( * ) as photo_count from properties left join property_photos on properties.property_id = property_photos.property_id group by owner_user_id
select sum ( price_max ) from properties where owner_user_id in ( select user_id from users where user_category_code in ('single_mother' ,'student' ) )
select sum ( price_max ) from properties where owner_user_id in ( select user_id from users where user_category_code in ('single_mother' ,'student' ) )
select datestamp , property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by datestamp asc
select datestamp , property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by datestamp asc
select property_type_description , property_type_code from ref_property_types where property_type_code = ( select property_type_code from properties group by property_type_code order by count ( * ) desc limit 1 )
select ref_property_types.property_type_description , count ( properties.property_type_code ) as count from properties join ref_property_types on properties.property_type_code = ref_property_types.property_type_code group by ref_property_types.property_type_code order by count ( * ) desc limit 1
select age_category_description from ref_age_categories where age_category_code = 'Over 60'
select r.age_category_description from ref_age_categories r where r.age_category_code = 'Over 60'
select room_size , count ( * ) from rooms group by room_size
select room_size , count ( * ) as total_rooms from rooms group by room_size
select addresses.country from addresses join users on addresses.address_id = users.user_address_id where users.first_name = 'Robbie'
select addresses.country from addresses join users on addresses.address_id = users.user_address_id where users.first_name = 'Robbie'
select first_name , middle_name , last_name from users where user_id in ( select owner_user_id from properties )
sql placeholder
select search_string from user_searches where user_id not in ( select owner_user_id from properties )
select search_string from user_searches where user_id not in ( select user_id from users )
select last_name , user_id from users where user_id in ( select user_id from user_searches group by user_id having count ( distinct search_seq ) >= 2 ) and user_id not in ( select user_id from user_searches group by user_id having count ( distinct search_seq ) >= 2 )
select last_name , user_id from users where user_id in ( select user_id from user_searches group by user_id having count ( user_id ) <= 2 ) and user_id in ( select owner_user_id from properties group by owner_user_id having count ( property_id ) >= 2 )
select count ( * ) from bike where weight > 780
select product_name , weight from bike order by price asc
select heat , name , nation from cyclist
select max ( weight ) , min ( weight ) from bike
select avg ( price ) from bike where material = 'Carbon CC'
select name , result from cyclist where nation != 'Russia'
select distinct bike.id , bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id where cyclists_own_bikes.purchase_year > 2015
select id , product_name from bike where id in ( select bike_id from cyclists_own_bikes group by bike_id having count ( distinct cyclist_id ) >= 4 )
select c.id , c.name from cyclist c join cyclists_own_bikes cob on c.id = cob.cyclist_id group by c.id order by count ( cob.bike_id ) desc limit 1
select distinct b.product_name from bike b join cyclists_own_bikes cob on b.id = cob.bike_id join cyclist c on cob.cyclist_id = c.id where c.nation in ( 'Russia' , 'Great Britain' )
select count ( distinct heat ) from cyclist
select count ( * ) from cyclists_own_bikes where cyclist_id not in ( select cyclist_id from cyclists_own_bikes where purchase_year > 2015 )
select distinct product_name from bike where id in ( select bike_id from cyclists_own_bikes join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where result > '4:21.558' )
select distinct b.product_name , b.price from bike b join cyclists_own_bikes cob on b.id = cob.bike_id join cyclist c on cob.cyclist_id = c.id where c.name in ( 'Bradley Wiggins' , 'Antonio Tauler' ) group by b.id having count ( distinct c.name ) = 2
select name , nation , result from cyclist where id not in ( select cyclist_id from cyclists_own_bikes )
select product_name from bike where material like '%fiber%'
select cyclist_id , count ( bike_id ) as bikes_owned from cyclists_own_bikes group by cyclist_id order by cyclist_id asc
select g.price , g.flavor from goods g where g.price = ( select max ( price ) from goods )
select g.id , g.flavor from goods g where g.price = ( select max ( price ) from goods )
select g.price , g.flavor from goods g where g.price = ( select min ( price ) from goods where flavor = 'cookie' )
select g.id , g.flavor from goods g where g.price = ( select min ( price ) from goods )
select id from goods where flavor = 'Apple'
select id from goods where flavor = 'Apple'
select id from goods where price < 3
select id from goods where price < 3
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select customers.id from customers where customers.id in ( select receipts.customerid from receipts where receipts.receiptnumber = receipts.receiptnumber group by receipts.customerid having count ( * ) >= 15 )
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count ( receipts.receiptnumber ) >= 15
select lastname from customers where id in ( select customerid from receipts where receiptnumber = 10 group by customerid having count ( * ) > 10 )
select lastname from customers where id in ( select customerid from receipts where receiptnumber = 10 group by customerid having count ( * ) > 10 )
select count ( distinct g.id ) from goods g where g.flavor = 'Cake'
select count ( distinct g.flavor ) from goods g
select distinct flavor from goods where food = 'Croissant'
select distinct flavor from goods where food = 'croissant'
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on receipts.customerid = customers.id where customers.id = 15
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on receipts.customerid = customers.id where customers.firstname = '15' and customers.lastname = '15'
select food , avg ( price ) as averageprice , max ( price ) as maximumprice , min ( price ) as minimumprice from goods group by food
select food , avg ( price ) as avg_price , min ( price ) as min_price , max ( price ) as max_price from goods group by food
select distinct r.receiptnumber from receipts r join items i on r.receiptnumber = i.receipt where i.item in ( 'Cake' , 'Cookie' ) group by r.receiptnumber having count ( distinct i.item ) = 2
select distinct receiptnumber from receipts where receiptnumber in ( select receipt from items where item = 'Cake' ) and receiptnumber in ( select receipt from items where item = 'Cookie' )
sql placeholder
sql placeholder
select receipts.receiptnumber , receipts.date from receipts inner join items on receipts.receiptnumber = items.receipt where items.item = ( select max ( price ) from goods )
select receipts.receiptnumber , receipts.date from receipts where receipts.receiptnumber = ( select max ( price ) from goods )
select i.item from items i group by i.item having count ( i.receipt ) = ( select min ( count ) from ( select count ( * ) as count from items group by item ) )
select items.item from items join receipts on items.receipt = receipts.receiptnumber group by items.item order by count ( * ) asc limit 1
select food , count ( * ) from goods group by food
select food , count ( * ) from goods group by food
select food , avg ( price ) from goods group by food
select food , avg ( price ) as average_price from goods group by food
select id from goods where flavor = 'Apricot' and price < 5
select id from goods where flavor = 'Apricot' and price < 5
select flavor from goods where price > 10
select flavor from goods where price > 10
select distinct id , price from goods where price < ( select avg ( price ) from goods )
select distinct g.id , g.price from goods g where g.price < ( select avg ( price ) from goods )
select distinct g1.id from goods g1 where g1.price < ( select min ( g2.price ) from goods g2 where g2.food = 'Tart' )
select distinct g.id from goods g where g.price < ( select min ( price ) from goods where flavor = 'Tart' )
select distinct receipts.receiptnumber from receipts inner join goods on receipts.receiptnumber = goods.id where goods.price > 13
sql placeholder
sql placeholder
sql placeholder
select id from goods where id like '%APP%'
select id from goods where id like '%APP%'
select id , price from goods where id like '%70%'
select id , price from goods where id like '%70%'
select lastname from customers order by lastname asc
select lastname from customers order by lastname asc
select id from goods order by id asc
select distinct id from goods order by id asc
sql placeholder
select receiptnumber from receipts where receiptnumber in ( select receiptnumber from items where item = ( select id from goods where flavor = 'Apple' ) ) or receiptnumber in ( select receiptnumber from receipts where customerid = 12 )
select date , receiptnumber from receipts where date = ( select max ( date ) from receipts )
select receiptnumber , date from receipts where date = ( select max ( date ) from receipts )
sql placeholder
select receiptnumber from receipts where receiptnumber in ( select receiptnumber from receipts where date = ( select min ( date ) from receipts ) ) or receiptnumber = ( select min ( date ) from receipts )
select g.id from goods g where g.flavor like 'Cookie' and g.price between 3 and 7
select g.id from goods g where g.food in ( 'Cookies' , 'Cakes' ) and g.price between 3 and 7
select firstname , lastname from customers where id in ( select customerid from receipts where date = ( select min ( date ) from receipts ) )
sql placeholder
select avg ( price ) from goods where flavor in ( 'Blackberry' , 'Blueberry' )
select avg ( price ) from goods where flavor in ( 'Blackberry' , 'Blueberry' )
select min ( price ) from goods where flavor = 'Cheese'
select price from goods where flavor = 'Cheese' order by price asc limit 1
select flavor , max ( price ) as highestprice , min ( price ) as lowestprice , avg ( price ) as averageprice from goods group by flavor order by flavor asc
select flavor , max ( price ) as maxprice , min ( price ) as minprice , avg ( price ) as avgprice from goods group by flavor order by flavor asc
select food , min ( price ) , max ( price ) from goods group by food order by food asc
select min ( price ) as minprice , max ( price ) as maxprice from goods order by food asc
select date from receipts group by date order by count ( * ) desc limit 3
select date from receipts group by date order by count ( * ) desc limit 3
select customers.id , count ( receipts.receiptnumber ) as frequency from customers join receipts on customers.id = receipts.customerid group by customers.id order by frequency desc limit 1
select customers.id , count ( receipts.receiptnumber ) as purchase_count from customers join receipts on customers.id = receipts.customerid group by customers.id order by purchase_count desc limit 1
select date , count ( distinct customerid ) from receipts group by date
select receipts.date , count ( distinct receipts.customerid ) from receipts join customers on receipts.customerid = customers.id group by receipts.date
sql placeholder
sql placeholder
select g.id from goods g where g.price < ( select min ( price ) from goods where food = 'Croissant' )
select g.id from goods g where g.price < ( select min ( price ) from goods where food = 'croissant' )
select g.id from goods g where g.price > ( select avg ( price ) from goods where food = 'Cake' )
select g.id from goods g where g.price >= ( select avg ( price ) from goods where food = 'Cake' )
select id from goods where price > ( select avg ( price ) from goods )
select id from goods where price > ( select avg ( price ) from goods )
select id , flavor , food from goods order by price asc
select id , flavor , food from goods order by price asc
select id , flavor from goods where food = 'Cake' order by flavor asc
select id , flavor from goods where food = 'cake' order by flavor asc
sql placeholder
select items.item from items join goods on items.item = goods.id where goods.flavor = 'chocolate' group by items.item having count ( * ) <= 10
select flavor from goods where food = 'Cake' except select flavor from goods where food = 'Tart'
select distinct flavor from goods where food = 'Cake' and flavor not in ( select flavor from goods where food = 'Tart' )
select g.flavor from goods g join items i on g.id = i.item group by g.id order by count ( * ) desc limit 3
select g.flavor , g.id , g.price from goods g join items i on g.id = i.item group by g.id order by sum ( g.price ) desc limit 3
select id from customers where id in ( select customerid from receipts group by customerid having sum ( receiptnumber ) > 150 )
select id from customers where id in ( select customerid from receipts group by customerid having sum ( receiptnumber ) > 150 )
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select count ( * ) from driver
select count ( * ) from driver
select make , count ( driver_id ) from driver where points > 150 group by make
select make , count ( driver_id ) from driver where points > 150 group by make
select make , avg ( age ) as average_age from driver group by make
select make , avg ( age ) as average_age from driver group by make
select avg ( laps ) from driver where age < 20
select avg ( laps ) from driver where age < 20
select manager , sponsor from team order by car_owner asc
select manager , sponsor from team order by car_owner asc
select make from team group by make having count ( team ) > 1
select make from team group by make having count ( team ) > 1
select make from team where car_owner = 'Buddy Arrington'
select make from team where car_owner = 'Buddy Arrington'
select max ( points ) as max_points , min ( points ) as min_points from driver
select max ( points ) as highest_point , min ( points ) as lowest_point from driver
select count ( * ) from driver where points < 150
select count ( * ) from driver where points < 150
select driver from driver order by age asc
select driver from driver order by age asc
select driver from driver order by points desc
select driver from driver order by points desc
select driver , country from driver
select driver , country from driver
select max ( driver.points ) from driver join country on driver.driver_id = country.country where country.capital = 'Dublin'
select max ( driver.points ) from driver join country on driver.country = country.country where country.capital = 'Dublin'
select avg ( age ) from driver join country on driver.country = country.country where country.official_native_language = 'English'
select avg ( driver.age ) from driver join country on driver.country = country.country where country.official_native_language = 'English'
select distinct c.country from country c join driver d on c.country_id = d.country where d.points > 150
select distinct c.country from country c join driver d on d.driver_id = c.country_id where d.points > 150
select capital from country where country = ( select max ( points ) from driver )
select capital from country where country in ( select country from driver where points = ( select max ( points ) from driver ) )
select make , count ( driver_id ) from driver group by make
select make , count ( driver_id ) from driver group by make
sql placeholder
select make from driver group by make having count ( driver_id ) = ( select max ( driver_count ) from ( select count ( driver_id ) as driver_count from driver group by make ) )
select make from driver group by make having count ( driver_id ) >= 3
select make from driver group by make having count ( driver_id ) >= 3
select team from team where team_id not in ( select team_id from team_driver )
select team from team where team_id not in ( select team_id from team_driver )
select distinct c.country from country c join driver d on d.driver_id = c.country where d.make in ( 'Dodge' , 'Chevrolet' ) group by c.country having count ( distinct d.make ) = 2
select distinct country from country where country_id in ( select country from driver where make = 'Dodge' ) and country_id in ( select country from driver where make = 'Chevrolet' )
select sum ( points ) as total_points , avg ( points ) as average_points from driver
select sum ( points ) as total_points , avg ( points ) as average_points from driver
select country from country where country_id not in ( select driver_id from driver )
select country from country where country_id not in ( select driver_id from driver )
select manager , sponsor from team where team_id in ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( cnt ) from ( select count ( driver_id ) as cnt from team_driver group by team_id ) ) )
select manager , sponsor from team where team_id in ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( cnt ) from ( select count ( driver_id ) as cnt from team_driver group by team_id ) ) )
select manager , car_owner from team where team_id in ( select team_id from team_driver group by team_id having count ( distinct driver_id ) >= 2 )
select manager , car_owner from team where team_id in ( select team_id from team_driver group by team_id having count ( distinct driver_id ) >= 2 )
select count ( * ) from institution
select count ( * ) from institution
select name from institution order by name asc
select name from institution order by name asc
select name from institution order by founded asc
select name from institution order by founded asc
select city , province from institution
select city , province from institution
select max ( enrollment ) as maxenrollment , min ( enrollment ) as minenrollment from institution
select max ( enrollment ) , min ( enrollment ) from institution
select affiliation from institution where city != 'Vancouver'
select affiliation from institution where city != 'Vancouver'
select stadium from institution order by capacity desc
select stadium from institution order by capacity desc
select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
select name , nickname from institution join championship on institution.institution_id = championship.institution_id
select institution.name , championship.nickname from institution join championship on institution.institution_id = championship.institution_id
select c.nickname from championship c join institution i on c.institution_id = i.institution_id where i.enrollment = ( select min ( enrollment ) from institution )
select c.nickname from championship c join institution i on c.institution_id = i.institution_id where i.enrollment = ( select min ( enrollment ) from institution )
select institution.name from institution join championship on institution.institution_id = championship.institution_id order by championship.number_of_championships desc
select institution.name from institution join championship on institution.institution_id = championship.institution_id order by championship.number_of_championships desc
select distinct name from institution where institution_id in ( select institution_id from championship )
select name from institution where institution_id in ( select institution_id from championship group by institution_id having count ( number_of_championships ) >= 1 )
select sum ( championship.number_of_championships ) from championship join institution on championship.institution_id = institution.institution_id where institution.affiliation = 'Public'
select sum ( championship.number_of_championships ) from championship join institution on championship.institution_id = institution.institution_id where institution.affiliation = 'Public'
select affiliation , count ( * ) as num_institutions from institution group by affiliation
select affiliation , count ( * ) as number_of_institutions from institution group by affiliation
select affiliation from institution group by affiliation having count ( affiliation ) = ( select max ( cnt ) from ( select count ( affiliation ) as cnt from institution group by affiliation ) )
select affiliation from institution group by affiliation having count ( affiliation ) = ( select max ( cnt ) from ( select count ( affiliation ) as cnt from institution group by affiliation ) )
select strftime ( '%Y' , founded ) as year from institution group by year having count ( * ) > 1
select strftime ( '%Y' , founded ) as year , count ( * ) as num_institutions from institution group by year having num_institutions > 1
sql placeholder
sql placeholder
select sum ( enrollment ) from institution where city in ( 'Vancouver' , 'Calgary' )
select enrollment from institution where city in ( 'Vancouver' , 'Calgary' )
select distinct province from institution where founded < 1920 intersect select distinct province from institution where founded > 1950
select distinct province from institution where founded < 1920 intersect select distinct province from institution where founded > 1950
select count ( distinct province ) from institution
select count ( distinct province ) from institution
select * from warehouses
select * from warehouses
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select contents from boxes where value > 150
select contents from boxes where value > 150
select warehouses.code , avg ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.code
select warehouses.code , avg ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select avg ( value ) as average_value , sum ( value ) as total_value from boxes
select avg ( value ) as average_value , sum ( value ) as total_value from boxes
select avg ( capacity ) as average_capacity , sum ( capacity ) as total_capacity from warehouses
select avg ( capacity ) as average_capacity , sum ( capacity ) as total_capacity from warehouses
select contents , avg ( value ) as avg_value , max ( value ) as max_value from boxes group by contents
select contents , avg ( contents ) as average_value , max ( contents ) as max_value from boxes group by contents
select contents from boxes group by contents order by sum ( value ) desc limit 1
select contents from boxes where value = ( select max ( value ) from boxes )
select avg ( value ) from boxes
select avg ( value ) from boxes
select distinct contents from boxes
select distinct contents from boxes
select count ( distinct contents ) from boxes
select count ( distinct contents ) from boxes
select distinct location from warehouses
select distinct location from warehouses
select code from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select code from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select sum ( value ) from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select sum ( value ) from boxes join warehouses on boxes.warehouse = warehouses.code where location in ( 'Chicago' , 'New York' )
select distinct b.contents from boxes b join warehouses w on b.warehouse = w.code where w.location = 'Chicago' and b.code in ( select code from warehouses where location = 'New York' )
select contents from boxes where warehouse in ( select warehouse from warehouses where location = 'Chicago' ) and warehouse in ( select warehouse from warehouses where location = 'New York' )
select contents from boxes where warehouse not in ( select code from warehouses where location = 'New York' )
select contents from boxes where warehouse not in ( select code from warehouses where location = 'New York' )
select location from warehouses where code in ( select warehouse from boxes where contents = 'Rocks' ) and code not in ( select warehouse from boxes where contents = 'Scissors' )
select distinct w.location from warehouses w join boxes b on w.code = b.warehouse where b.contents = 'Rocks' and not exists ( select 1 from boxes b2 where b2.contents = 'Scissors' and b2.warehouse = w.code )
select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents in ( 'Rocks' , 'Scissors' )
select distinct warehouses.code from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents in ( 'Rocks' , 'Scissors' )
select w.location from warehouses w join boxes b on w.code = b.warehouse where b.contents = 'Rocks and Scissors'
select location from warehouses where code in ( select warehouse from boxes where contents = 'Rocks and Scissors' )
select code , contents from boxes order by value asc
select code , contents from boxes order by value asc
select code , contents from boxes where value = ( select min ( value ) from boxes )
select b.code , b.contents from boxes b where b.value = ( select min ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes order by contents asc
select distinct contents from boxes order by contents asc
select code from boxes where value > ( select max ( value ) from boxes where contents = 'Rocks' )
select distinct b.code from boxes b where b.value > ( select max ( value ) from boxes where contents = 'Rocks' )
select b.code , b.contents from boxes b where b.value > ( select max ( value ) from boxes where contents = 'Scissors' )
select b.code , b.contents from boxes b where b.value > ( select max ( value ) from boxes where contents = 'Scissors' )
select sum ( value ) from boxes where warehouse = ( select max ( capacity ) from warehouses )
select sum ( value ) from boxes where warehouse = ( select max ( capacity ) from warehouses )
select warehouses.code , avg ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code having avg ( boxes.value ) > 150
select warehouse , avg ( value ) from boxes group by warehouse having avg ( value ) > 150
select contents , count ( * ) as total_boxes from boxes group by contents
select contents , sum ( value ) as total_value , count ( * ) as total_boxes from boxes group by contents
select location , sum ( capacity ) as total_capacity , avg ( capacity ) as average_capacity , max ( capacity ) as max_capacity from warehouses group by location
select location , sum ( capacity ) as total_capacity , avg ( capacity ) as average_capacity , max ( capacity ) as max_capacity from warehouses group by location
select sum ( capacity ) from warehouses
select sum ( capacity ) from warehouses
select warehouses.location , max ( boxes.value ) as max_value from boxes inner join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select warehouses.location , max ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.location
select warehouses.code , count ( boxes.code ) from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.code
select warehouse , count ( * ) as box_count from boxes group by warehouse
sql placeholder
select count ( distinct warehouse ) from boxes where contents = 'Rocks'
select boxes.code , warehouses.location from boxes inner join warehouses on boxes.warehouse = warehouses.code
select boxes.code , warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code
select boxes.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago'
select boxes.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago'
select warehouses.code , count ( boxes.code ) as num_boxes from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouses.code , count ( boxes.code ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouses.code , count ( distinct contents ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouses.code , count ( distinct contents ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouses.code from warehouses where warehouses.capacity > capacity
select warehouses.code from warehouses where warehouses.code in ( select warehouse from boxes group by warehouse having count ( * ) > ( select max ( capacity ) from warehouses ) )
select sum ( value ) from boxes where warehouse not in ( select code from warehouses where location = 'Chicago' )
select sum ( value ) from boxes where warehouse in ( select code from warehouses where location not in ( select location from warehouses where capacity = 0 ) )
select university_name , city , state from university order by university_name asc
select university_name , city , state from university order by university_name asc
select count ( * ) from university where state in ( 'Illinois' , 'Ohio' )
select count ( * ) from university where state in ( 'Illinois' , 'Ohio' )
select max ( enrollment ) as maximum_enrollment , avg ( enrollment ) as average_enrollment , min ( enrollment ) as minimum_atenrollment from university
select max ( enrollment ) as maxenrollment , avg ( enrollment ) as avgenrollment , min ( enrollment ) as minenrollment from university
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select home_conference from university
select distinct home_conference from university
select home_conference , count ( university_id ) from university group by home_conference
select home_conference , count ( distinct university_id ) from university group by home_conference
select state from university group by state order by count ( * ) desc limit 1
select state from university group by state having count ( university_id ) = ( select max ( cnt ) from ( select count ( university_id ) as cnt from university group by state ) )
select home_conference from university where enrollment > 2000 group by home_conference having avg ( enrollment ) > 2000
select home_conference from university where enrollment > 2000 group by home_conference having avg ( enrollment ) > 2000
select u.home_conference from university u group by u.home_conference order by sum ( u.enrollment ) asc limit 1
select home_conference from university group by home_conference order by sum ( enrollment ) asc limit 1
select major_name , major_code from major order by major_code asc
select major_name , major_code from major order by major_code asc
select major.major_name , major_ranking.rank from major join major_ranking on major.major_id = major_ranking.major_id join university on major_ranking.university_id = university.university_id where university.university_name = 'Augustana College'
select major_ranking.rank , major.major_name from major join major_ranking on major.major_id = major_ranking.major_id join university on major_ranking.university_id = university.university_id where university.university_name = 'Augustana College'
select university_name , city , state from university where university_id in ( select university_id from major_ranking where rank = 1 and major_id = ( select major_id from major where major_name = 'Accounting' ) )
select u.university_name , u.city , u.state from university u where u.university_id in ( select university_id from major_ranking where major_id = ( select major_id from major_ranking where rank = 1 ) )
select university_name from university where university_id in ( select university_id from major_ranking where rank = 1 group by university_id order by count ( * ) desc limit 1 )
select university_name from university where university_id in ( select university_id from major_ranking group by university_id having count ( major_id ) = ( select max ( cnt ) from ( select count ( major_id ) as cnt from major_ranking group by university_id ) ) )
select university_name from university where university_id not in ( select university_id from major_ranking where rank = 1 )
select university_name from university where university_id not in ( select university_id from major_ranking where rank = 1 )
select university_name from university where university_id in ( select university_id from major where major_name = 'Accounting' ) and university_id in ( select university_id from major where major_name = 'Urban Education' )
select university_name from university where university_id in ( select university_id from major where major_id = 'Accounting' ) and university_id in ( select university_id from major where major_id = 'Urban Education' )
select university_name , overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where university.state = 'Wisconsin'
select university_name , rank from university join major_ranking on university.university_id = major_ranking.university_id where state = 'Wisconsin'
select university_name from university where university_id = ( select university_id from overall_ranking group by university_id order by research_point desc limit 1 )
select university_name from university where university_id in ( select university_id from overall_ranking group by university_id having sum ( research_point ) = ( select max ( total_research ) from ( select sum ( research_point ) as total_research from overall_ranking group by university_id ) ) )
select university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point asc
select university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point asc
select university_name from university where university_id in ( select university_id from major_ranking where major_id in ( select major_id from major where major_name = 'Accounting' ) )
select university_name from university where university_id in ( select university_id from major_ranking where major_id in ( select major_id from major where major_name = 'Accounting' ) and rank >= 3 )
select sum ( enrollment ) from university where university_id in ( select university_id from overall_ranking where rank <= 5 )
select sum ( enrollment ) from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.rank <= 5
select university_name , citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.reputation_point in ( select reputation_point from overall_ranking order by reputation_point desc limit 3 )
select university_name , citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point desc limit 3
select state from university where enrollment < 3000 group by state having count ( * ) > 2
select state from university where enrollment < 3000 group by state having count ( * ) > 2
select title from movies where rating not in ( select rating from movies )
select title from movies where rating not in ( select rating from movies )
select title from movies where rating = 'G'
select title from movies where rating = 'G'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon'
select m.title from movies m join movietheaters mt on m.code = mt.movie where mt.name = 'Odeon'
select movies.title , movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.code in ( select movie from movietheaters )
select movies.title , movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie
select count ( * ) from movies where rating = 'G'
select count ( * ) from movies where rating = 'G'
select count ( movie ) from movietheaters
select count ( * ) from movietheaters
select count ( distinct movie ) from movietheaters
select count ( distinct movie ) from movietheaters
select count ( distinct code ) from movietheaters
select count ( distinct code ) from movietheaters
select rating from movies where title like '%Citizen%'
select rating from movies where title like '%Citizen%'
select name from movietheaters where movie in ( select code from movies where rating = 'G' or rating = 'PG' )
select name from movietheaters where code in ( select movie from movies where rating in ( 'G' , 'PG' ) )
select title from movies where code in ( select movie from movietheaters where name in ( 'Odeon' , 'Imperial' ) )
select m.title from movies m join movietheaters mt on m.code = mt.movie where mt.name in ( 'Odeon' , 'Imperial' )
select m.title from movies m where m.code in ( select mt.movie from movietheaters mt where mt.name = 'Odeon' ) and m.code in ( select mt.movie from movietheaters mt where mt.name = 'Imperial' )
select m.title from movies m join movietheaters mt on m.code = mt.movie where mt.name = 'Odeon' and mt.code in ( select code from movietheaters where name = 'Imperial' )
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies order by title asc
select title from movies order by title asc
select title from movies order by rating asc
select title from movies order by rating asc
select name from movietheaters group by name order by count ( movie ) desc limit 1
select name from movietheaters where movie = ( select movie from movietheaters group by movie order by count ( movie ) desc limit 1 )
select title from movies where code in ( select movie from movietheaters group by movie having count ( code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from movietheaters group by movie ) ) )
select title from movies where code in ( select movie from movietheaters group by movie having count ( code ) = ( select max ( cnt ) from ( select count ( code ) as cnt from movietheaters group by movie ) ) )
select rating , count ( * ) as num_movies from movies group by rating
select rating , count ( * ) as total_movies from movies group by rating
select count ( * ) from movies where rating != 'null'
select count ( * ) from movies where rating > 0
select name from movietheaters where movie = 1
select name from movietheaters where movie in ( select movie from movietheaters )
select name from movietheaters where code not in ( select movie from movietheaters )
select name from movietheaters where code not in ( select movie from movietheaters )
select mt.name from movietheaters mt join movies m on mt.movie = m.code where m.rating = 'G'
select movietheaters.name from movietheaters join movies on movietheaters.movie = movies.code where movies.rating = 'G'
select title from movies
select title from movies
select distinct rating from movies
select distinct rating from movies
select * from movies where rating != 'Unrated'
select * from movies where rating != 'Unrated'
select title from movies where code not in ( select movie from movietheaters )
select title from movies where code not in ( select movie from movietheaters )
select recipient from package where weight = ( select max ( weight ) from package )
select c.name from client c join package p on c.accountnumber = p.recipient order by p.weight desc limit 1
select sum ( package.weight ) from package join client on package.sender = client.accountnumber where client.name = 'Leo Wong'
select sum ( weight ) from package join employee on package.sender = employee.employeeid where employee.name = 'Leo Wong'
select position from employee where name = 'Amy Wong'
select position from employee where name = 'Amy Wong'
select salary , position from employee where name = 'Turanga Leela'
select salary , position from employee where name = 'Turanga Leela'
select avg ( salary ) from employee where position = 'intern'
select avg ( salary ) from employee where position = 'intern'
select level from has_clearance where level = 'Physician'
select level from has_clearance join employee on has_clearance.employee = employee.employeeid where employee.name = 'Physician'
select packagenumber from package where sender = 'Leo Wong'
select count ( * ) from package join employee on package.sender = employee.employeeid where employee.name = 'Leo Wong'
select package.packagenumber from package join employee on package.recipient = employee.employeeid where employee.name = 'Leo Wong'
select package.packagenumber from package join employee on package.recipient = employee.employeeid where employee.name = 'Leo Wong'
sql placeholder
select distinct packagenumber from package join employee on package.sender = employee.employeeid where employee.name = 'Leo Wong'
select count ( * ) from package where sender = 'Ogden Wernstrom' and recipient = 'Leo Wong'
select count ( * ) from package where sender = 'Ogden Wernstrom' and recipient = 'Leo Wong'
select contents from package where sender = 'John Zoidfarb'
select contents from package where sender = 'John Zoidfarb'
select p.packagenumber , p.weight from package p join client c on p.sender = c.accountnumber where c.name like '%John%' order by p.weight desc limit 1
select p.packagenumber , p.weight from package p join client c on p.sender = c.accountnumber where c.name = 'John' order by p.weight desc limit 1
select packagenumber , weight from package order by weight desc limit 3
select packagenumber , weight from package order by weight asc limit 3
select client.name , count ( package.packagenumber ) as numberofpackages from client join package on client.accountnumber = package.sender group by client.accountnumber order by numberofpackages desc limit 1
select c.name , count ( p.packagenumber ) as totalpackages from client c join package p on c.accountnumber = p.sender group by c.accountnumber order by totalpackages desc limit 1
select client.name , count ( package.packagenumber ) as package_count from client join package on client.accountnumber = package.recipient group by client.accountnumber order by package_count asc limit 1
select min ( count ) , recipient from ( select recipient , count ( packagenumber ) as count from package group by recipient ) group by recipient
select client.name from client join package on client.accountnumber = package.sender group by client.accountnumber having count ( package.packagenumber ) > 1
select c.name from client c where c.accountnumber in ( select p.sender from package p group by p.sender having count ( p.packagenumber ) > 1 )
select coordinates from planet where name = 'Mars'
select coordinates from planet where name = 'Mars'
select name , coordinates from planet order by name asc
select name , coordinates from planet order by name asc
select shipment.shipmentid from shipment join employee on shipment.manager = employee.employeeid where employee.name = 'Phillip J. Fry'
select s.shipmentid from shipment as s join employee as e on s.manager = e.employeeid where e.name = 'Phillip J Fry'
select date from shipment
select date from shipment
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipmentid from shipment where planet in ( select planetid from planet where name = 'Mars' )
select shipmentid from shipment join planet on shipment.planet = planet.planetid join employee on shipment.manager = employee.employeeid where planet.name = 'Mars' and employee.name = 'Turanga Leela'
select s.shipmentid from shipment s join planet p on s.planet = p.planetid join employee e on s.manager = e.employeeid where p.name = 'Mars' and e.name = 'Turanga Leela'
select shipmentid from shipment where planet = 'Mars' or manager = 'Turanga Leela'
select s.shipmentid from shipment s join planet p on s.planet = p.planetid where p.name = 'Mars' and s.manager = 'Turanga Leela'
select p.name , sum ( s.shipmentid ) as total_shipments from planet p join shipment s on p.planetid = s.planet group by p.name
select planet.name , count ( shipment.shipmentid ) as num_shipments from planet join shipment on planet.planetid = shipment.planet group by planet.planetid
select name from planet where planetid in ( select planet from shipment group by planet having count ( shipmentid ) = ( select max ( cnt ) from ( select count ( shipmentid ) as cnt from shipment group by planet ) ) )
select name from planet where planetid in ( select planet from shipment group by planet having count ( shipmentid ) = ( select max ( cnt ) from ( select count ( shipmentid ) as cnt from shipment group by planet ) ) )
select e.name , count ( s.shipmentid ) from employee e join shipment s on e.employeeid = s.manager group by e.employeeid
select employee.name , count ( shipment.manager ) as num_shipments from employee join shipment on employee.employeeid = shipment.manager group by employee.employeeid
select sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select planet.name , sum ( package.weight ) as total_weight from package inner join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by planet.name
sql placeholder
select name from planet where planetid in ( select planet from shipment group by planet having sum ( shipmentid ) > 30 )
sql placeholder
select packagenumber from package where packagenumber in ( select packagenumber from package where sender in ( select accountnumber from client where name = 'Zapp' ) )
sql placeholder
select count ( * ) from package where shipment in ( select shipmentid from shipment where planet in ( select planetid from planet where name = 'Omicron Persei 8' ) )
select count ( * ) from package where shipment in ( select shipmentid from shipment where planet in ( select planetid from planet where name = 'Omicron Persei 8' ) )
select packagenumber , weight from package where weight between 10 and 30
select packagenumber , weight from package where weight between 10 and 30
select name from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select name from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.level = 'Omega III'
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee join planet on has_clearance.planet = planet.planetid where planet.name = 'Omega III'
select name from planet where planetid in ( select planet from has_clearance group by planet having count ( employee ) = 1 )
select name from planet where planetid in ( select planet from has_clearance group by planet having count ( employee ) = 1 )
select name from employee where salary between 5000 and 10000
select name from employee where salary between 5000 and 10000
select name from employee where salary > ( select avg ( salary ) from employee ) or salary > 5000
select name from employee where salary > ( select avg ( salary ) from employee ) or salary > 5000
select count ( distinct employee.employeeid ) from employee where employee.employeeid not in ( select has_clearance.employee from has_clearance join planet on has_clearance.planet = planet.planetid where planet.name = 'Mars' )
sql placeholder
select count ( * ) from game
select count ( game_id ) from game
select title , developers from game order by units_sold_millions desc
select title , developers from game order by units_sold_millions desc
select avg ( units_sold_millions ) from game where developers != 'Nintendo'
select avg ( units_sold_millions ) from game where developers != 'Nintendo'
select platform_name , market_district from platform
select platform_name , market_district from platform
select platform_name , platform_id from platform where download_rank = 1
select platform_name , platform_id from platform where download_rank = 1
select max ( rank_of_the_year ) as maxrank , min ( rank_of_the_year ) as minrank from player
select max ( rank_of_the_year ) , min ( rank_of_the_year ) from player
select count ( * ) from player where rank_of_the_year < 3
select count ( * ) from player where rank_of_the_year <= 3
select player_name from player order by player_name asc
select player_name from player order by player_name asc
select player_name , college from player order by rank_of_the_year desc
select player_name , college from player order by rank_of_the_year desc
select player_name , rank_of_the_year from player where player_id in ( select player_id from game_player where game_id = ( select game_id from game where title = 'Super Mario World' ) )
select player_name , rank_of_the_year from player where player_id in ( select player_id from game_player where game_id = ( select game_id from game where title = 'Super Mario World' ) )
select distinct g.developers from game g join game_player gp on g.game_id = gp.game_id join player p on p.player_id = gp.player_id where p.college = 'Auburn'
select distinct developers from game where game_id in ( select game_id from game_player where player_id in ( select player_id from player where college = 'Auburn' ) )
select avg ( g.units_sold_millions ) from game g join game_player gp on g.game_id = gp.game_id join player p on gp.player_id = p.player_id where p.position = 'Guard'
select avg ( g.units_sold_millions ) from game g join game_player gp on g.game_id = gp.game_id join player p on gp.player_id = p.player_id where p.position = 'Guard'
select game.title , platform.platform_name from game join platform on game.platform_id = platform.platform_id
select title , platform_name from game join platform on game.platform_id = platform.platform_id
select title from game where platform_id in ( select platform_id from platform where market_district in ( 'Asia' , 'USA' ) )
select title from game where platform_id in ( select platform_id from platform where market_district in ( 'Asia' , 'USA' ) )
select franchise , count ( game_id ) from game group by franchise
select franchise , count ( game_id ) as number_of_games from game group by franchise
select franchise from game group by franchise order by count ( * ) desc limit 1
select franchise from game group by franchise order by count ( game_id ) desc limit 1
select franchise from game group by franchise having count ( game_id ) >= 2
select franchise from game group by franchise having count ( game_id ) >= 2
select player_name from player where player_id not in ( select player_id from game_player )
select player_name from player where player_id not in ( select player_id from game_player )
select distinct title from game where game_id in ( select game_id from game_player where player_id in ( select player_id from player where college = 'Auburn' ) ) and game_id in ( select game_id from game_player where player_id in ( select player_id from player where college = 'Oklahoma' ) )
select title from game where game_id in ( select game_id from game_player where player_id in ( select player_id from player where college = 'Oklahoma' or college = 'Auburn' ) )
select distinct franchise from game
select distinct franchise from game
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select name from press order by year_profits_billion desc
select name from press order by year_profits_billion desc
select name from press where year_profits_billion > 15 or month_profits_billion = 1
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select avg ( year_profits_billion ) as average_profits , max ( year_profits_billion ) as max_profits from press
select avg ( year_profits_billion ) as average_profits , max ( year_profits_billion ) as max_profits from press
select name from press where month_profits_billion = ( select max ( month_profits_billion ) from press )
select name from press where month_profits_billion = ( select max ( month_profits_billion ) from press )
select name from press order by month_profits_billion desc limit 1
select name from press where month_profits_billion = ( select max ( month_profits_billion ) from press ) or month_profits_billion = ( select min ( month_profits_billion ) from press )
select count ( * ) from author where age < 30
select count ( * ) from author where age < 30
select gender , avg ( age ) as average_age from author group by gender
select gender , avg ( age ) from author group by gender
select gender , count ( * ) from author where age > 30 group by gender
select gender , count ( * ) from author where age > 30 group by gender
select title from book order by release_date desc
select title from book order by release_date desc
select book_series , count ( * ) as number_of_books from book group by book_series
select book_series , count ( book_id ) as total_books from book group by book_series
select title , release_date from book order by sale_amount desc limit 5
select title , release_date from book order by sale_amount desc limit 5
select distinct book_series from book where sale_amount > 1000 and book_series in ( select book_series from book where sale_amount < 500 )
select distinct book_series from book where sale_amount > 1000 intersect select distinct book_series from book where sale_amount < 500
select distinct author.name from author join book on author.author_id = book.author_id where book.book_series = 'MM' and author.author_id in ( select author_id from book where book_series = 'LT' ) and author.author_id in ( select author_id from book where book_series = 'LT' )
select distinct name from author where author_id in ( select author_id from book where book_series = 'MM' ) and author_id in ( select author_id from book where book_series = 'LT' )
select name , age from author where author_id not in ( select author_id from book )
select name from author where author_id not in ( select author_id from book )
select distinct name from author where author_id in ( select author_id from book group by author_id having count ( book_id ) > 1 )
select distinct name from author where author_id in ( select author_id from book group by author_id having count ( book_id ) > 1 )
sql placeholder
select b.title , a.name , p.name from book b join author a on b.author_id = a.author_id join press p on b.press_id = p.press_id order by b.sale_amount desc limit 3
select press.name , sum ( book.sale_amount ) as total_sale_amount from press join book on press.press_id = book.press_id group by press.press_id
select press.name , sum ( book.sale_amount ) as total_sale_amount from press join book on press.press_id = book.press_id group by press.press_id
select press.name , count ( book.sale_amount ) from book join press on book.press_id = press.press_id where book.sale_amount > 1000 group by press.name
select press.name , count ( book.book_id ) from press join book on press.press_id = book.press_id where book.sale_amount > 1000 group by press.name
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select author.name , author.gender from author join ( select author_id , count ( book_id ) as numofbooks from book group by author_id order by numofbooks desc limit 1 ) as most_published on author.author_id = most_published.author_id
select name , gender from author where author_id = ( select author_id from book group by author_id order by count ( * ) desc limit 1 )
select name from author where author_id not in ( select author_id from book where press_id in ( select press_id from press where name = 'Accor' ) )
select name from author where author_id not in ( select book.author_id from book join press on book.press_id = press.press_id where press.name = 'Accor' )
select name , year_profits_billion from press where press_id in ( select press_id from book group by press_id having count ( * ) > 2 )
select press.name , press.year_profits_billion from press join book on press.press_id = book.press_id group by press.press_id having count ( book.book_id ) > 2
select count ( distinct author_name ) from authors
select author_name from authors
select author_name , other_details from authors
select other_details from authors where author_name = 'Addison Denesik'
select count ( * ) from documents
select author_name from documents where document_id = 4
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to Brazil'
select count ( * ) from documents join authors on documents.author_name = authors.author_name where authors.author_name = 'Era Kerluke'
select document_name , document_description from documents
select document_id , document_name from documents join authors on documents.author_name = authors.author_name where authors.author_name = 'Bianka Cummings'
select authors.author_name , authors.other_details from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to China'
select authors.author_name , count ( documents.document_id ) from authors left join documents on authors.author_name = documents.author_name group by authors.author_name
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name order by count ( * ) desc limit 1
select distinct a.author_name from authors a join documents d on a.author_name = d.author_name group by a.author_name having count ( d.document_id ) >= 2
select count ( * ) from business_processes
select next_process_id , process_name , process_description from business_processes where process_id = 9
select process_name from business_processes where next_process_id = ( select next_process_id from business_processes where process_id = 9 )
select count ( * ) from process_outcomes
select process_outcome_code , process_outcome_description from process_outcomes
select process_outcome_description from process_outcomes where process_outcome_code = 'working'
select count ( distinct process_status_code ) from process_status
select process_status_code , process_status_description from process_status
select process_status_description from process_status where process_status_code = 'ct'
select count ( staff_id ) from staff
select s.staff_id , s.staff_details from staff s
select staff_details from staff where staff_id = 100
select count ( * ) from ref_staff_roles
select staff_role_code , staff_role_description from ref_staff_roles
select staff_role_description from ref_staff_roles where staff_role_code = 'HR'
select count ( distinct d.document_id ) from documents d join documents_processes dp on d.document_id = dp.document_id
select distinct process_id from documents_processes
select document_id from documents where document_id not in ( select document_id from documents_processes )
select process_id from documents_processes where document_id not in ( select document_id from documents_processes )
select po.process_outcome_description , ps.process_status_description from documents_processes dp join process_outcomes po on dp.process_outcome_code = po.process_outcome_code join process_status ps on dp.process_status_code = ps.process_status_code where dp.document_id = 0
select process_name from business_processes where process_id = ( select process_id from documents where document_name = 'Travel to Brazil' )
select process_id , count ( document_id ) from documents_processes group by process_id
select count ( distinct staff_id ) from staff_in_processes where document_id = 0 and process_id = 9
select staff.staff_id , count ( distinct staff_in_processes.process_id ) as num_processes from staff left join staff_in_processes on staff.staff_id = staff_in_processes.staff_id group by staff.staff_id
select r.staff_role_code , count ( distinct dp.process_id ) as num_processes from ref_staff_roles r left join staff_in_processes sip on r.staff_role_code = sip.staff_role_code left join documents_processes dp on sip.process_id = dp.process_id group by r.staff_role_code
select count ( distinct rsr.staff_role_code ) from staff s join ref_staff_roles rsr on s.staff_id = rsr.staff_role_code where s.staff_id = 3
select count ( agency_id ) from agencies
select count ( agency_id ) from agencies
select agency_id , agency_details from agencies
select a.agency_id , a.agency_details from agencies as a
select count ( client_id ) from clients
select count ( client_id ) from clients
select client_id , client_details from clients
select client_id , client_details from clients
select agencies.agency_id , count ( clients.client_id ) as client_count from agencies left join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agencies.agency_id , count ( clients.client_id ) as client_count from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count ( clients.client_id ) desc limit 1
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count ( clients.client_id ) desc limit 1
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id , agencies.agency_details having count ( clients.client_id ) >= 2
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id having count ( clients.client_id ) >= 2
select agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id where clients.client_details = 'Mac'
select a.agency_details from agencies a join clients c on a.agency_id = c.agency_id where c.client_details = 'Mac'
select c.client_details , a.agency_details from clients c join agencies a on c.agency_id = a.agency_id
select clients.client_details , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select sic_code , count ( client_id ) as client_count from clients group by sic_code
select sic_code , count ( client_id ) as client_count from clients group by sic_code
select client_id , client_details from clients where sic_code = 'Bad'
select c.client_id , c.client_details from clients c where c.sic_code = 'Bad'
select agency_id , agency_details from agencies where agency_id in ( select agency_id from clients )
select agency_id , agency_details from agencies where agency_id in ( select agency_id from clients )
select agency_id from agencies where agency_id not in ( select agency_id from clients )
select agency_id from agencies where agency_id not in ( select agency_id from clients )
select count ( * ) from invoices
select count ( * ) from invoices
select invoice_id , invoice_status , invoice_details from invoices inner join clients on invoices.client_id = clients.client_id
select invoice_id , invoice_status , invoice_details from invoices
select clients.client_id , count ( invoices.invoice_id ) as invoice_count from clients left join invoices on clients.client_id = invoices.client_id group by clients.client_id
select clients.client_id , count ( invoices.invoice_id ) as invoice_count from clients join invoices on clients.client_id = invoices.client_id group by clients.client_id
select clients.client_id , clients.client_details from clients join invoices on clients.client_id = invoices.client_id group by clients.client_id order by count ( invoices.invoice_id ) desc limit 1
select c.client_id , c.client_details from clients c where c.client_id in ( select client_id from invoices group by client_id having count ( invoice_id ) = ( select max ( cnt ) from ( select count ( invoice_id ) as cnt from invoices group by client_id ) ) )
select clients.client_id from clients join invoices on clients.client_id = invoices.client_id group by clients.client_id having count ( invoices.invoice_id ) >= 2
select clients.client_id from clients join invoices on clients.client_id = invoices.client_id group by clients.client_id having count ( invoices.invoice_id ) >= 2
select invoice_status , count ( * ) as num_invoices from invoices group by invoice_status
select invoice_status , count ( * ) as invoice_count from invoices group by invoice_status
select invoice_status from invoices group by invoice_status order by count ( * ) desc limit 1
select invoice_status from invoices group by invoice_status order by count ( * ) desc limit 1
select i.invoice_status , i.invoice_details , c.client_id , c.agency_id , c.client_details from invoices i join clients c on i.client_id = c.client_id join agencies a on c.agency_id = a.agency_id
select i.invoice_status , i.invoice_details , i.client_id , c.client_details , a.agency_id , a.agency_details from invoices i join clients c on i.client_id = c.client_id join agencies a on a.agency_id = c.agency_id
select meeting_type , other_details from meetings
select distinct meeting_type , other_details from meetings
select meeting_outcome , purpose_of_meeting from meetings
select meeting_outcome , purpose_of_meeting from meetings
select p.payment_id , p.payment_details from payments p join invoices i on p.invoice_id = i.invoice_id where i.invoice_status = 'Working'
select p.payment_id , p.payment_details from payments p join invoices i on p.invoice_id = i.invoice_id where i.invoice_status = 'Working'
select invoice_id , invoice_status from invoices where invoice_id not in ( select invoice_id from payments )
select invoice_id , invoice_status from invoices where invoice_id not in ( select invoice_id from payments )
select count ( * ) from payments
select count ( payment_id ) from payments
select payments.payment_id , invoices.invoice_id , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id
select p.payment_id , p.invoice_id , p.payment_details from payments p
select distinct invoice_id , invoice_status from invoices
select distinct invoice_id , invoice_status from invoices
select invoices.invoice_id , count ( payments.payment_id ) as number_of_payments from invoices left join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id , count ( payments.payment_id ) as payment_count from invoices join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from invoices join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id order by count ( payments.payment_id ) desc limit 1
select invoice_id , invoice_status , invoice_details from invoices where invoice_id = ( select invoice_id from payments group by invoice_id order by count ( * ) desc limit 1 )
select count ( staff_id ) from staff
select count ( staff_id ) from staff
select a.agency_id , count ( distinct s.staff_id ) from agencies a left join staff s on a.agency_id = s.agency_id group by a.agency_id
select agencies.agency_id , count ( distinct staff.staff_id ) from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id
select a.agency_id , a.agency_details from agencies a join staff s on a.agency_id = s.agency_id group by a.agency_id order by count ( s.staff_id ) desc limit 1
select a.agency_id , a.agency_details from agencies a join staff s on a.agency_id = s.agency_id group by a.agency_id order by count ( s.staff_id ) desc limit 1
select meeting_outcome , count ( meeting_id ) from meetings group by meeting_outcome
select meeting_outcome , count ( * ) as num_meetings from meetings group by meeting_outcome
select clients.client_id , count ( meetings.meeting_id ) as number_of_meetings from clients left join meetings on clients.client_id = meetings.client_id group by clients.client_id
select clients.client_id , count ( meetings.meeting_id ) as number_of_meetings from clients join meetings on clients.client_id = meetings.client_id group by clients.client_id
select m.meeting_type , count ( m.meeting_id ) as number_of_meetings from meetings m left join clients c on m.client_id = c.client_id group by m.meeting_type
select meeting_type , count ( * ) as number_of_meetings from meetings group by meeting_type
select meeting_id , meeting_outcome , meeting_type , client_details from meetings join clients on meetings.client_id = clients.client_id
select meeting_id , meeting_outcome , meeting_type , client_id from meetings
select m.meeting_id , count ( distinct si.staff_id ) from meetings m join staff_in_meetings si on m.meeting_id = si.meeting_id group by m.meeting_id
select meetings.meeting_id , count ( distinct staff.staff_id ) as num_staff from meetings join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id join staff on staff.staff_id = staff_in_meetings.staff_id group by meetings.meeting_id
select staff_id , count ( meeting_id ) from staff_in_meetings group by staff_id having count ( meeting_id ) = ( select min ( count ) from ( select count ( meeting_id ) as count from staff_in_meetings group by staff_id ) )
select staff_id from staff where staff_id = ( select staff_id from staff_in_meetings group by staff_id order by count ( meeting_id ) asc limit 1 )
select count ( distinct staff_id ) from staff_in_meetings
select count ( distinct staff_id ) from staff_in_meetings
select count ( * ) from staff where staff_id not in ( select staff_id from staff_in_meetings )
select count ( * ) from staff where staff_id not in ( select staff_id from staff_in_meetings )
select distinct client_id , client_details from clients where client_id in ( select client_id from invoices )
select distinct client_id , client_details from clients where client_id in ( select client_id from meetings )
select distinct staff.staff_id , staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id join meetings on staff_in_meetings.meeting_id = meetings.meeting_id where staff.staff_details like '%s%'
select distinct staff.staff_id , staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id where staff.staff_details like '%s%'
select client_id , sic_code , agency_id from clients where client_id in ( select client_id from invoices where invoice_id = 1 )
select c.client_id , c.sic_code , c.agency_id from clients c join meetings m on c.client_id = m.client_id join invoices i on c.client_id = i.client_id group by c.client_id , c.sic_code having count ( distinct i.invoice_id ) = 1
sql placeholder
select m.start_date_time , m.end_date_time , c.client_details from meetings m join clients c on m.client_id = c.client_id join staff_in_meetings st on m.meeting_id = st.meeting_id join staff st on m.meeting_id = st.meeting_id
