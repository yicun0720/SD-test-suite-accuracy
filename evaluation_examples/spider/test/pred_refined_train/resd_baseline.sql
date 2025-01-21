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
select name from player order by earnings desc limit 1
select name from player order by earnings desc limit 1
select distinct country from player where earnings > 1200000
select country from player where earnings > 1200000
select country from player where wins_count > 2 and earnings = ( select max ( earnings ) from player where wins_count > 2 )
select country from player where wins_count > 2 group by country order by sum ( earnings ) desc limit 1
select player.name , club.name from club join player on club.club_id = player.club_id
select player.name , club.name from club join player on club.club_id = player.club_id
select club.name from club where club_id in ( select club_id from player where wins_count > 2 )
select club.name from club where club_id in ( select club_id from player group by club_id having count ( wins_count ) > 2 )
select player.name from club join player on club.club_id = player.club_id where club.manager = 'Sam Allardyce'
select player.name from club join player on club.club_id = player.club_id where club.manager = 'Sam Allardyce'
select club.name from club join player on club.club_id = player.club_id group by club.club_id order by avg ( player.earnings ) desc
select club.name from club join player on club.club_id = player.club_id group by club.club_id order by avg ( player.earnings ) desc
select manufacturer , count ( * ) from club group by manufacturer
select manufacturer , count ( * ) from club group by manufacturer
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( count ) from ( select count ( manufacturer ) as count from club group by manufacturer ) )
select manufacturer from club group by manufacturer having count ( manufacturer ) = ( select max ( cnt ) from ( select count ( manufacturer ) as cnt from club group by manufacturer ) )
select manufacturer from club group by manufacturer having count ( * ) > 1
select manufacturer from club group by manufacturer having count ( * ) > 1
select country from player group by country having count ( * ) > 1
select country from player group by country having count ( * ) > 1
select name from club where club_id not in ( select club_id from player )
select name from club where club_id not in ( select club_id from player )
select country from player where earnings > 1400000 and earnings < 1100000
select country from player where earnings > 1400000 intersect select country from player where earnings < 1100000
select count ( distinct country ) from player
select count ( distinct country ) from player
select earnings from player where country = 'Australia' or country = 'Zimbabwe'
select earnings from player where country = 'Australia' or country = 'Zimbabwe'
select orders.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id group by orders.customer_id having count ( * ) > 2 intersect select customers.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id join order_items on orders.order_id = order_items.order_id group by orders.customer_id having count ( * ) > 2
select orders.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id group by orders.customer_id having count ( * ) > 2 intersect select customers.customer_id , customers.customer_first_name , customers.customer_last_name from orders join customers on orders.customer_id = customers.customer_id join order_items on orders.order_id = order_items.order_id group by orders.customer_id having count ( * ) > 2
select orders.order_id , orders.order_status_code , count ( * ) from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id
select count ( * ) , orders.order_status_code , orders.order_id from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id
select date_order_placed from orders where date_order_placed = ( select min ( date_order_placed ) from orders ) or order_id in ( select order_id from order_items group by order_id having count ( * ) > 1 )
select min ( date_order_placed ) , max ( date_order_placed ) from orders group by date_order_placed having count ( * ) > 1
select customer_first_name , customer_middle_initial , customer_last_name from customers where customer_id not in ( select customer_id from orders )
select customer_first_name , customer_last_name , customer_middle_initial from customers where customer_id not in ( select customer_id from orders )
select p.product_id , p.product_name , p.product_price , p.product_color from products p where p.product_id not in ( select oi.product_id from order_items oi group by oi.product_id having count ( oi.order_id ) >= 2 )
select p.product_id , p.product_name , p.product_price , p.product_color from products p where p.product_id in ( select oi.product_id from order_items oi group by oi.product_id having count ( oi.order_id ) < 2 )
select orders.order_id , orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count ( * ) >= 2
select distinct o.order_id , o.date_order_placed from orders o where o.order_id in ( select oi.order_id from order_items oi group by oi.order_id having count ( distinct oi.product_id ) >= 2 )
select products.product_id , products.product_name , products.product_price from order_items join products on order_items.product_id = products.product_id group by order_items.product_id order by count ( * ) desc limit 1
select products.product_id , products.product_name , products.product_price from order_items join products on order_items.product_id = products.product_id group by order_items.product_id order by count ( * ) desc limit 1
select orders.order_id , sum ( products.product_price ) from orders join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by orders.order_id order by sum ( products.product_price ) asc limit 1
sql placeholder
select cpm.payment_method_code from customer_payment_methods cpm group by cpm.payment_method_code having count ( cpm.payment_method_code ) = ( select max ( count ) from ( select count ( * ) as count from customer_payment_methods group by payment_method_code ) )
with popularpayment as ( select payment_method_code , count ( customer_id ) as popularity from customer_payment_methods group by payment_method_code ) select payment_method_code from popularpayment where popularity = ( select max ( popularity ) from popularpayment )
select customers.gender_code , count ( * ) from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by customers.gender_code
select customers.gender_code , count ( * ) from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id group by customers.gender_code
select gender_code , count ( * ) from orders join customers on orders.customer_id = customers.customer_id group by gender_code
select gender_code , count ( * ) from orders join customers on orders.customer_id = customers.customer_id group by gender_code
select customers.customer_first_name , customers.customer_last_name , customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select customer_first_name , customer_middle_initial , customer_last_name , customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select invoices.invoice_status_code , invoices.invoice_date , shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select invoices.invoice_status_code , invoices.invoice_date , shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
sql placeholder
sql placeholder
select order_items.order_item_status_code , shipments.shipment_tracking_number from order_items join shipments on order_items.order_item_id = shipments.order_id
select order_item_status_code from order_items where order_id in ( select order_id from shipments ) and order_item_id in ( select order_item_id from shipment_items )
select product_name , product_color from products where product_id in ( select product_id from order_items )
select product_name , product_color from products where product_id in ( select product_id from shipment_items )
select distinct products.product_name , products.product_price , products.product_description from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id where customers.gender_code = 'Female'
select distinct products.product_name , products.product_price , products.product_description from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id where customers.gender_code = 'Female'
select invoice_status_code from invoices where invoice_number not in ( select invoice_number from shipments )
select invoice_status_code from invoices where invoice_number not in ( select invoice_number from shipments )
sql placeholder
sql placeholder
select count ( distinct customer_id ) from orders
select count ( distinct customer_id ) from orders
select count ( distinct order_item_status_code ) from order_items
select count ( distinct order_item_status_code ) from order_items
select count ( distinct payment_method_code ) from customer_payment_methods
select count ( distinct payment_method_code ) from customer_payment_methods
select login_name , login_password from customers where phone_number like '%+12%'
select customer_first_name , login_password from customers where phone_number like '%12%'
select product_size from products where product_name like '%Dell%'
select product_size from products where product_name like '%Dell%'
select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select product_price , product_size from products where product_price > ( select avg ( product_price ) from products )
select count ( * ) from products where product_id not in ( select product_id from order_items )
select count ( * ) from products where product_id not in ( select product_id from order_items )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select count ( * ) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select order_status_code , date_order_placed from orders
select order_status_code , date_order_placed from orders
select address_line_1 , town_city , county from customers where country = 'USA'
select address_line_1 , town_city , county from customers where country = 'United States'
select customers.customer_first_name , products.product_name from customers join orders on customers.customer_id = orders.customer_id join products on orders.order_id = products.product_id
select customers.customer_first_name , products.product_name from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id
select count ( * ) from shipments
select count ( * ) from shipments
select avg ( product_price ) from products
select avg ( product_price ) from products
select avg ( products.product_price ) from orders join order_items join products on orders.order_id = order_items.order_id and order_items.product_id = products.product_id
select avg ( products.product_price ) from order_items join products on order_items.product_id = products.product_id group by products.product_id
select email_address , town_city , county from customers group by gender_code order by count ( * ) asc limit 1
select email_address , town_city , county from customers where gender_code in ( select customer_id from orders group by customer_id having count ( customer_id ) = ( select min ( count ) from ( select count ( customer_id ) as count from orders group by customer_id ) ) )
select date_order_placed from orders where customer_id in ( select customer_id from customer_payment_methods group by customer_id having count ( distinct payment_method_code ) >= 2 )
select orders.date_order_placed from orders join customer_payment_methods on orders.customer_id = customer_payment_methods.customer_id group by customer_payment_methods.customer_id having count ( * ) >= 2
select order_status_code from orders group by order_status_code having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from orders group by order_status_code ) )
select order_status_code from orders group by order_status_code order by count ( * ) asc limit 1
select products.product_id , products.product_description from order_items join products on order_items.product_id = products.product_id group by products.product_id having count ( * ) > 3
select p.product_id , p.product_description from products p where p.product_id in ( select oi.product_id from order_items oi group by oi.product_id having count ( oi.order_id ) > 3 )
select invoices.invoice_date , shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count ( * ) >= 2
select invoices.invoice_date , shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count ( * ) >= 2
select shipment_tracking_number , shipment_date from shipments
select shipment_tracking_number , shipment_date from shipments
select product_color , product_description , product_size from products where product_price < ( select max ( product_price ) from products )
select product_color , product_description , product_size from products where product_price != ( select max ( product_price ) from products )
select name from director where age > ( select avg ( age ) from director )
select name from director where age = ( select max ( age ) from director )
select count ( * ) from channel where internet like '%bbc%'
select count ( distinct digital_terrestrial_channel ) from channel
select title from program order by start_year desc
select director.name from program join director on program.director_id = director.director_id group by director.director_id order by count ( * ) desc limit 1
select director.name , director.age from director join program on director.director_id = program.director_id group by director.director_id order by count ( * ) desc limit 1
select p.title from program p where p.start_year = ( select max ( start_year ) from program )
select channel.name , channel.internet from channel join program on channel.channel_id = program.channel_id group by channel.channel_id having count ( * ) > 1
select name , ( select count ( * ) from program where channel_id = channel.channel_id ) as program_count from channel
select count ( * ) from channel where channel_id not in ( select channel_id from program )
select name from director where director_id in ( select director_id from program where title = 'Dracula' )
select channel.name , channel.internet from channel join director_admin on channel.channel_id = director_admin.channel_id group by channel.channel_id order by count ( * ) desc limit 1
select name from director where age between 30 and 60
sql placeholder
select channel_id , name from channel where channel_id not in ( select channel_id from director_admin where director_id = 'Hank Baskett' )
select count ( * ) from radio
select transmitter from radio order by erp_kw asc
select tv_show_name , original_airdate from tv_show
select station_name from city_channel where affiliation != 'ABC'
select transmitter from radio where erp_kw > 150 or erp_kw < 30
select transmitter from radio order by erp_kw desc limit 1
select avg ( erp_kw ) from radio
select affiliation , count ( * ) from city_channel group by affiliation
select affiliation from city_channel group by affiliation order by count ( * ) desc limit 1
select affiliation from city_channel group by affiliation having count ( * ) > 3
select city , station_name from city_channel order by station_name asc
select radio.transmitter , city_channel.city from city_channel_radio join radio on city_channel_radio.radio_id = radio.radio_id join city_channel on city_channel.id = city_channel_radio.city_channel_id
select radio.transmitter , city_channel.station_name from city_channel join city_channel_radio on city_channel.id = city_channel_radio.city_channel_id join radio on city_channel_radio.radio_id = radio.radio_id order by radio.erp_kw desc
select radio.transmitter , count ( * ) from city_channel_radio join radio on city_channel_radio.radio_id = radio.radio_id group by radio.radio_id
select distinct transmitter from radio where radio_id not in ( select radio_id from city_channel_radio )
select model from vehicle where top_speed = ( select max ( top_speed ) from vehicle where power > 6000 )
select model from vehicle where power > 6000 and top_speed = ( select max ( top_speed ) from vehicle where power > 6000 )
select name from driver where citizenship = 'United States'
select name from driver where citizenship = 'United States'
select driver.driver_id , count ( * ) from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id group by driver.driver_id having count ( * ) <= 1
select driver.driver_id , count ( * ) from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id group by driver.driver_id order by count ( * ) desc limit 1
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select max ( power ) , avg ( power ) from vehicle where builder = 'Zhuzhou'
select vehicle_driver.vehicle_id from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle_driver.vehicle_id order by count ( * ) asc limit 1
select vehicle.vehicle_id from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle.vehicle_id order by count ( * ) asc limit 1
select top_speed , power from vehicle where build_year = 1996
select top_speed , power from vehicle where build_year = 1996
select build_year , model , builder from vehicle
select build_year , model , builder from vehicle
select count ( distinct vehicle_driver.driver_id ) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count ( distinct vehicle_driver.driver_id ) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count ( * ) from driver where racing_series = 'NASCAR'
select count ( * ) from driver where racing_series = 'NASCAR'
select avg ( top_speed ) from vehicle
select avg ( top_speed ) from vehicle
select distinct driver.name from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.power > 5000
select driver.name from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.power > 5000
select model from vehicle where total_production > 100 or top_speed > 150
select model from vehicle where total_production > 100 or top_speed > 150
select model , build_year from vehicle where model like '%DJ%'
select model , build_year from vehicle where model like '%DJ%'
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select model from vehicle where vehicle_id not in ( select vehicle_id from vehicle_driver )
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle.vehicle_id having count ( * ) = 2 union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id group by vehicle.vehicle_id having count ( * ) = 2
select vehicle_id , model from vehicle where builder = 'Ziyang' or vehicle_id in ( select vehicle_id from vehicle_driver where driver_id = 2 union select vehicle_id from vehicle_driver where builder = 'Ziyang' )
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon'
select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' union select vehicle.vehicle_id , vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jefff Gordon'
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select count ( * ) from vehicle where top_speed = ( select max ( top_speed ) from vehicle )
select name from driver order by name asc
select name from driver order by name asc
select racing_series , count ( * ) from driver group by racing_series
select count ( * ) , racing_series from driver group by racing_series
select driver.name , driver.citizenship from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.model = 'DJ1'
select driver.name , driver.citizenship from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.model = 'DJ1'
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
select type_of_question_code , count ( * ) from questions group by type_of_question_code
select type_of_question_code , count ( * ) from questions group by type_of_question_code
select distinct student_answer_text from student_answers where comments = 'Normal'
select distinct student_answer_text from student_answers where comments = 'Normal'
select count ( distinct comments ) from student_answers
select count ( distinct comments ) from student_answers
select student_answer_text from student_answers group by student_answer_text order by count ( * ) desc
select student_answer_text from student_answers group by student_answer_text order by count ( * ) desc
select s.first_name , sa.date_of_answer from student_answers sa join students s on sa.student_id = s.student_id
select students.first_name , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id
select students.email_adress , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id order by date_of_answer desc
select students.email_adress , student_answers.date_of_answer from student_answers join students on student_answers.student_id = students.student_id order by date_of_answer desc
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select assessment from student_assessments group by assessment order by count ( * ) asc limit 1
select students.first_name from student_answers join students on student_answers.student_id = students.student_id group by student_answers.student_id having count ( * ) >= 2
select s.first_name from students s join student_answers sa on s.student_id = sa.student_id group by s.student_id having count ( distinct sa.student_answer_id ) >= 2
select valid_answer_text from valid_answers group by valid_answer_text having count ( valid_answer_text ) = ( select max ( count ) from ( select count ( valid_answer_text ) as count from valid_answers group by valid_answer_text ) )
select valid_answer_text from valid_answers group by valid_answer_text order by count ( * ) desc limit 1
select last_name from students where gender_mfu != 'M'
select last_name from students where gender_mfu != 'M'
select gender_mfu , count ( * ) from students group by gender_mfu
select gender_mfu , count ( * ) from students group by gender_mfu
select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
select first_name from students where student_id not in ( select student_id from student_answers )
select first_name from students where student_id not in ( select student_id from student_answers )
select student_answer_text from student_answers where comments = 'Normal' intersect select student_answer_text from student_answers where comments = 'Absent'
select student_answer_text from student_answers where comments = 'Normal' intersect select student_answer_text from student_answers where comments = 'Absent'
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
select p.product_name from products p where p.product_type_code = 'Clothes' and p.product_price = ( select max ( product_price ) from products where product_type_code = 'Clothes' )
select product_name from products where product_type_code = 'Clothes' and product_price = ( select max ( product_price ) from products where product_type_code = 'Clothes' )
select p.product_id , p.product_name from products p where p.product_type_code = 'Hardware' and p.product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' )
select product_id , product_name from products where product_type_code = 'Hardware' and product_price = ( select min ( product_price ) from products where product_type_code = 'Hardware' ) and product_name = 'Hardware'
select product_name from products order by product_price desc
select product_name from products order by product_price desc
select product_price from products where product_type_code = 'Hardware' order by product_price asc
select product_name from products where product_type_code = 'Hardware' order by product_price asc
select product_type_code , count ( * ) from products group by product_type_code
select product_type_code , count ( * ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code , avg ( product_price ) from products group by product_type_code
select product_type_code from products group by product_type_code having count ( * ) >= 2
select product_type_code from products group by product_type_code having count ( * ) >= 2
select product_type_code from products group by product_type_code having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from products group by product_type_code ) )
select product_type_code from products group by product_type_code order by count ( * ) desc limit 1
select count ( * ) from customers
select count ( * ) from customers
select customer_id , customer_name from customers
select customer_id , customer_name from customers
select customer_address , customer_phone , customer_email from customers where customer_name = 'Jeromy'
select customer_address , customer_phone , customer_email from customers where customer_name = 'Jeromy'
select payment_method_code , count ( * ) from customers group by payment_method_code
select payment_method_code , count ( * ) from customers group by payment_method_code
select payment_method_code from customers group by payment_method_code having count ( customer_id ) = ( select max ( count ) from ( select count ( customer_id ) as count from customers group by payment_method_code ) )
select payment_method_code from customers group by payment_method_code order by count ( * ) desc limit 1
sql placeholder
select customer_name from customers where payment_method_code = ( select payment_method_code from customers group by payment_method_code order by count ( * ) asc limit 1 )
select payment_method_code , customer_number from customers where customer_name = 'Jeromy'
select payment_method_code , customer_number from customers where customer_name = 'Jeromy'
select distinct payment_method_code from customers
select distinct payment_method_code from customers
select product_id , product_type_code from products order by product_name asc
select product_id , product_type_code from products order by product_name asc
select product_type_code from products group by product_type_code order by count ( * ) asc limit 1
select product_type_code from products group by product_type_code order by count ( * ) asc limit 1
select count ( * ) from customer_orders
select count ( * ) from customer_orders
select customer_orders.order_id , customer_orders.order_date , customer_orders.order_status_code from customers join customer_orders on customers.customer_id = customer_orders.customer_id where customers.customer_name = 'Jeromy'
select order_id , order_date , order_status_code from customer_orders where customer_id = 'Jeromy'
select customers.customer_name , customers.customer_id , count ( customer_orders.order_id ) as orders_count from customers left join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id
select customers.customer_name , customers.customer_id , count ( * ) as ordercount from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id
select customers.customer_id , customers.customer_name , customers.customer_phone , customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id order by count ( * ) desc limit 1
select customers.customer_id , customers.customer_name , customers.customer_phone , customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id order by count ( * ) desc limit 1
select order_status_code , count ( * ) from customer_orders group by order_status_code
select order_status_code , count ( * ) from customer_orders group by order_status_code
select order_status_code from customer_orders group by order_status_code order by count ( * ) desc limit 1
with ordercounts as ( select order_status_code , count ( * ) as cnt from customer_orders group by order_status_code ) select order_status_code from ordercounts where cnt = ( select max ( cnt ) from ordercounts )
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
select customer_id from customers except select customer_id from customer_orders
select customer_id from customers where customer_id not in ( select customer_id from customer_orders )
select distinct co.order_date , co.order_id from customer_orders co join order_items oi on co.order_id = oi.order_id where oi.order_quantity > 6 or co.order_id in ( select order_id from order_items group by order_id having count ( distinct product_id ) > 3 )
select customer_orders.order_id , customer_orders.order_date from customer_orders join order_items on customer_orders.order_id = order_items.order_id where order_items.order_quantity > 6 or order_items.product_id > 3
select count ( * ) from building
select count ( * ) from building
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
select region.name from region join building on region.region_id = building.region_id group by region.region_id having count ( * ) > 1
select region.name from region join building on region.region_id = building.region_id group by region.region_id having count ( * ) > 1
select region.capital from region join building on region.region_id = building.region_id group by region.region_id order by count ( * ) desc limit 1
select region.capital from building join region on building.region_id = region.region_id group by region.region_id order by count ( * ) desc limit 1
select building.address , region.capital from building join region on building.region_id = region.region_id
select building.address , region.name from building join region on building.region_id = region.region_id
select building.number_of_stories from building join region on building.region_id = region.region_id where region.name = 'Abruzzo'
select building.number_of_stories from building join region on building.region_id = region.region_id where region.name = 'Abruzzo'
select completed_year , count ( * ) from building group by completed_year
select completed_year , count ( * ) from building group by completed_year
select completed_year from building group by completed_year order by count ( * ) desc limit 1
select completed_year from building group by completed_year order by count ( * ) desc limit 1
select name from region where region_id not in ( select region_id from building )
select name from region where region_id not in ( select region_id from building )
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select distinct address from building
select distinct address from building
select completed_year from building order by number_of_stories desc
select completed_year from building order by number_of_stories desc , completed_year
select channel_details from channels order by channel_details asc
select channel_details from channels order by channel_details asc
select count ( * ) from services
select count ( * ) from services
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code order by count ( * ) desc limit 1
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code having count ( analytical_layer_type_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from analytical_layer group by analytical_layer_type_code ) tmp )
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from customer_interactions join services on customer_interactions.service_id = services.service_id group by customer_interactions.service_id having count ( * ) > 3
select service_details from services where service_id in ( select service_id from customers_and_services group by service_id having count ( customer_id ) > 3 )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( customer_id ) = ( select max ( count ) from ( select count ( customer_id ) as count from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( service_id ) = ( select max ( counted ) from ( select count ( service_id ) as counted from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( distinct customers_and_services_id ) = ( select max ( cnt ) from ( select count ( distinct customers_and_services_id ) as cnt from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id in ( select customer_id from customers_and_services group by customer_id having count ( distinct customers_and_services_id ) = ( select max ( cnt ) from ( select count ( distinct customers_and_services_id ) as cnt from customers_and_services group by customer_id ) ) )
select customer_details from customers where customer_id not in ( select customer_id from customer_interactions )
select customer_details from customers where customer_id not in ( select customer_id from customers_and_services )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions group by customer_id order by count ( * ) asc limit 1 )
select distinct customer_details from customers where customer_id in ( select customer_id from customers_and_services where service_id in ( select service_id from services group by service_id order by count ( * ) asc limit 1 ) )
select count ( distinct customers_and_services_details ) from customers_and_services
select count ( * ) from customers_and_services
select customer_details from customers where customer_details like '%Kutch%'
select customer_details from customers where customer_details like '%Kutch%'
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) or service_id in ( select service_id from customer_interactions where customer_id = 'Hardy Kutch' ) )
select service_details from services where service_id in ( select service_id from customer_interactions where customer_id in ( select customer_id from customers where customer_details = 'Hardy Kutch' ) and status_code = 'bad' )
sql placeholder
select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where channels.channel_details = '' and customer_interactions.customer_id = 1
select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where channels.channel_details = '15 ij'
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' intersect select customer_id from customer_interactions where services_and_channels_details = 'Bad' )
select customer_details from customers where customer_id in ( select customer_id from customer_interactions where status_code = 'Stuck' intersect select customer_id from customer_interactions where services_and_channels_details = 'bad' )
select count ( * ) from integration_platform where integration_platform_details = 'Success'
select count ( * ) from integration_platform where integration_platform_details = 'Success'
select customer_details from customers where customer_id in ( select customer_id from customer_interactions join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = 'Failed' )
select c.customer_details from customers c where exists ( select 1 from customer_interactions ci join integration_platform ip on ci.customer_interaction_id = ip.customer_interaction_id where ci.customer_id = c.customer_id and ip.integration_platform_details = 'Fail' )
select service_details from services where service_id not in ( select service_id from customers_and_services )
select service_details from services where service_id not in ( select service_id from customers_and_services )
select analytical_layer_type_code , count ( * ) from analytical_layer group by analytical_layer_type_code
select analytical_layer_type_code , count ( * ) from analytical_layer group by analytical_layer_type_code
select s.service_details from services s where exists ( select 1 from customers_and_services cs where cs.service_id = s.service_id and cs.customers_and_services_details = 'Unsatisfied' )
select service_details from services where service_id in ( select service_id from customers_and_services where customers_and_services_details = 'unsatisfied' )
select count ( * ) from vehicles
select count ( * ) from vehicles
select name from vehicles order by model_year desc
select name from vehicles order by model_year desc
select distinct type_of_powertrain from vehicles
select distinct type_of_powertrain from vehicles
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year = 2013 or model_year = 2014
select name , type_of_powertrain , annual_fuel_cost from vehicles where model_year = 2013 or model_year = 2014
select type_of_powertrain from vehicles where model_year = 2014 intersect select type_of_powertrain from vehicles where model_year = 2013
select type_of_powertrain from vehicles where model_year = 2013 intersect select type_of_powertrain from vehicles where model_year = 2014
select type_of_powertrain , count ( * ) from vehicles group by type_of_powertrain
select type_of_powertrain , count ( * ) from vehicles group by type_of_powertrain
select type_of_powertrain from vehicles group by type_of_powertrain having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from vehicles group by type_of_powertrain ) )
select type_of_powertrain from vehicles group by type_of_powertrain having count ( type_of_powertrain ) = ( select max ( cnt ) from ( select count ( type_of_powertrain ) as cnt from vehicles group by type_of_powertrain ) )
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select min ( annual_fuel_cost ) , max ( annual_fuel_cost ) , avg ( annual_fuel_cost ) from vehicles
select name , model_year from vehicles where city_fuel_economy_rate < ( select min ( city_fuel_economy_rate ) from vehicles )
select name , model_year from vehicles where city_fuel_economy_rate <= ( select min ( city_fuel_economy_rate ) from vehicles )
select type_of_powertrain , avg ( annual_fuel_cost ) from vehicles group by type_of_powertrain having count ( * ) >= 2
select type_of_powertrain , avg ( annual_fuel_cost ) from vehicles group by type_of_powertrain having count ( * ) >= 2
select name , age , membership_credit from customers
select name , age , membership_credit from customers
select name , age from customers where membership_credit = ( select max ( membership_credit ) from customers )
select name , age from customers where membership_credit = ( select max ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( membership_credit ) from customers )
select avg ( age ) from customers where membership_credit > ( select avg ( age ) from customers )
select * from discount
select * from discount
select vehicles.name , renting_history.total_hours from renting_history join vehicles on renting_history.vehicles_id = vehicles.id
select vehicles.name , renting_history.total_hours from vehicles join renting_history on vehicles.id = renting_history.vehicles_id
select name from vehicles where id not in ( select vehicles_id from renting_history )
select name from vehicles where id not in ( select vehicles_id from renting_history )
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by renting_history.customer_id having count ( * ) >= 2
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by renting_history.customer_id having count ( * ) >= 2
select name , model_year from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having count ( customer_id ) = ( select max ( cnt ) from ( select count ( customer_id ) as cnt from renting_history group by vehicles_id ) ) )
select vehicles.name , vehicles.model_year from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id order by count ( * ) desc limit 1
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id order by renting_history.total_hours desc
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id order by renting_history.total_hours desc
select discount.name from renting_history join discount on renting_history.discount_id = discount.id group by renting_history.discount_id order by count ( * ) desc limit 1
select discount.name from renting_history join discount on renting_history.discount_id = discount.id group by renting_history.discount_id order by count ( * ) desc limit 1
select name , type_of_powertrain from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having sum ( total_hours ) > 30 )
select name , type_of_powertrain from vehicles where id in ( select vehicles_id from renting_history group by vehicles_id having sum ( total_hours ) > 30 )
select avg ( city_fuel_economy_rate ) , avg ( highway_fuel_economy_rate ) , type_of_powertrain from vehicles group by type_of_powertrain
select avg ( city_fuel_economy_rate ) , avg ( highway_fuel_economy_rate ) , type_of_powertrain from vehicles group by type_of_powertrain
select avg ( amount_of_loan ) from student_loans
select avg ( amount_of_loan ) from student_loans
select students.bio_data , students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) >= 2 intersect select students.bio_data , students.student_id from students join classes on students.student_id = classes.student_id group by students.student_id having count ( * ) < 2
select students.bio_data , students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) >= 2 union select students.bio_data , students.student_id from students join classes on students.student_id = classes.student_id group by students.student_id having count ( * ) < 2
select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.class_details like '%data%' except select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.class_details like '%net%'
select t.teacher_details from teachers t where exists ( select 1 from classes c where c.teacher_id = t.teacher_id and c.class_details like '%data%' ) and not exists ( select 1 from classes c2 where c2.teacher_id = t.teacher_id and c2.class_details like '%net%' )
select bio_data from students where student_id not in ( select student_id from detention ) or student_id not in ( select student_id from student_loans )
select bio_data from students where student_id not in ( select student_id from detention ) or student_id not in ( select student_id from student_loans )
select student_loans.amount_of_loan , student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by achievements.student_id having count ( * ) >= 2
select student_loans.amount_of_loan , student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by achievements.student_id having count ( * ) >= 2
select teachers.teacher_details , teachers.teacher_id from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count ( * ) desc limit 1
select teachers.teacher_details , teachers.teacher_id from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count ( * ) desc limit 1
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select students.student_details , ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join addresses on students_addresses.address_id = addresses.address_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select students.student_details , ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join addresses on students_addresses.address_id = addresses.address_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select addresses.address_details , students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id
select addresses.address_details , students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select students.bio_data , transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select student_id , behaviour_monitoring_details from behaviour_monitoring group by student_id order by count ( * ) desc limit 1
select behaviour_monitoring_details , count ( * ) from behaviour_monitoring group by behaviour_monitoring_details having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from behaviour_monitoring group by behaviour_monitoring_details ) )
select s.bio_data , s.student_details from students s where s.student_id in ( select a.student_id from behaviour_monitoring a group by a.student_id having count ( a.behaviour_monitoring_id ) = ( select max ( cnt ) from ( select count ( * ) as cnt from behaviour_monitoring group by student_id ) ) )
select s.bio_data , s.student_details from students s where s.student_id in ( select bm.student_id from behaviour_monitoring bm group by bm.student_id having count ( bm.student_id ) = ( select max ( cnt ) from ( select count ( * ) as cnt from behaviour_monitoring group by student_id ) ) )
select bio_data from students where student_id = ( select student_id from behaviour_monitoring group by student_id order by count ( * ) desc limit 1 )
select students.bio_data from students join behaviour_monitoring on students.student_id = behaviour_monitoring.student_id group by behaviour_monitoring.student_id order by count ( * ) desc limit 1
select students.bio_data , student_events.event_date from student_events join students on student_events.student_id = students.student_id
select students.bio_data , student_events.event_date from students join student_events on students.student_id = student_events.student_id
select count ( distinct student_id ) , ref_event_types.event_type_description from student_events join ref_event_types on student_events.event_type_code = ref_event_types.event_type_code group by ref_event_types.event_type_code order by count ( * ) desc limit 1
select event_type_code , count ( * ) from student_events group by event_type_code order by count ( * ) desc limit 1
select achievements.achievement_details , ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select achievements.achievement_details , ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select count ( distinct teacher_id ) from classes where student_id not in ( select student_id from achievements )
select count ( distinct teacher_id ) from classes where student_id not in ( select student_id from achievements )
select date_of_transcript , transcript_details from transcripts
select date_of_transcript , transcript_details from transcripts
select achievement_type_code , achievement_details , date_achievement from achievements
select achievement_type_code , achievement_details , date_achievement from achievements
select datetime_detention_start , datetime_detention_end from detention
select datetime_detention_start , datetime_detention_end from detention
select bio_data from students where student_details like '%Suite%'
select bio_data from students where student_details like '%Suite%'
select teacher_details from teachers where teacher_id in ( select teacher_id from classes )
select teacher_details from teachers where teacher_id in ( select teacher_id from classes )
select classes.teacher_id , count ( * ) from classes join teachers on classes.teacher_id = teachers.teacher_id group by classes.teacher_id order by count ( * ) desc limit 1
select classes.teacher_id , count ( * ) from classes join teachers on classes.teacher_id = teachers.teacher_id group by classes.teacher_id order by count ( * ) desc limit 1
select s.student_id , count ( c.class_id ) as total_courses from students s join classes c on s.student_id = c.student_id group by s.student_id having total_courses = ( select max ( total_courses ) from ( select count ( class_id ) as total_courses from classes group by student_id ) )
select student_id , count ( * ) from classes group by student_id order by count ( * ) desc limit 1
select students.student_id , students.student_details from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) = 2
select students.student_id , students.student_details from classes join students on classes.student_id = students.student_id group by students.student_id having count ( * ) = 2
select detention.detention_type_code , ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count ( * ) asc limit 1
select detention.detention_type_code , ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count ( * ) asc limit 1
select s.bio_data , s.student_details from students s where exists ( select 1 from student_loans sl where sl.student_id = s.student_id and sl.amount_of_loan > ( select avg ( amount_of_loan ) from student_loans ) )
select students.bio_data , students.student_details from student_loans join students on student_loans.student_id = students.student_id where student_loans.amount_of_loan > ( select avg ( amount_of_loan ) from student_loans )
select date_of_loan from student_loans order by date_of_loan asc limit 1
select date_of_loan from student_loans order by date_of_loan asc limit 1
select bio_data from students where student_id in ( select student_id from student_loans where amount_of_loan = ( select min ( amount_of_loan ) from student_loans ) )
select students.bio_data from student_loans join students on student_loans.student_id = students.student_id order by amount_of_loan asc limit 1
select date_of_transcript from transcripts join student_loans on transcripts.student_id = student_loans.student_id where student_loans.amount_of_loan = ( select max ( amount_of_loan ) from student_loans )
select t.date_of_transcript from transcripts t join student_loans sl on t.student_id = sl.student_id where sl.amount_of_loan = ( select max ( amount_of_loan ) from student_loans )
select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id join transcripts on transcripts.student_id = classes.student_id order by transcripts.date_of_transcript asc limit 1
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id join transcripts on transcripts.student_id = classes.student_id order by transcripts.date_of_transcript asc limit 1
select s.student_id , sum ( sl.amount_of_loan ) as total_loan_amount from students s join student_loans sl on s.student_id = sl.student_id group by s.student_id
select s.student_id , sum ( sl.amount_of_loan ) as total_loan_amount from students s left join student_loans sl on s.student_id = sl.student_id group by s.student_id
select student_id , bio_data , ( select count ( * ) from classes where classes.student_id = students.student_id ) as total_courses from students
select students.student_id , students.bio_data , count ( * ) from classes join students on classes.student_id = students.student_id group by students.student_id
select count ( distinct student_id ) from detention
select count ( distinct student_id ) from detention
select students_addresses.address_type_code , ref_address_types.address_type_description from students_addresses join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students_addresses.address_type_code order by count ( * ) desc limit 1
select students_addresses.address_type_code , ref_address_types.address_type_description from students_addresses join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students_addresses.address_type_code order by count ( * ) desc limit 1
select bio_data from students where student_id in ( select student_id from student_events except select student_id from student_loans )
select bio_data from students where student_id in ( select student_id from student_events except select student_id from student_loans )
select students_addresses.date_from , students_addresses.date_to from students join students_addresses on students.student_id = students_addresses.student_id join transcripts on students.student_id = transcripts.student_id group by students.student_id having count ( * ) = 2
select students_addresses.date_from , students_addresses.date_to from students_addresses join transcripts on students_addresses.student_id = transcripts.student_id group by students_addresses.student_id having count ( * ) = 2
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
select count ( * ) from author
select count ( * ) from author
select count ( * ) from client
select count ( * ) from client
select name , address from client order by name asc
select name , address from client order by name asc
select title , author from book
select book.title , author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select idorder , idclient from orders
select idorder , idclient from orders
select author.name , count ( * ) from author_book join author on author_book.author = author.idauthor group by author.name
select author.name , count ( * ) from author join author_book on author.idauthor = author_book.author group by author.idauthor
select isbn , count ( * ) from books_order group by isbn
select isbn , count ( * ) from books_order group by isbn
select isbn , sum ( amount ) from books_order group by isbn
select isbn , sum ( amount ) from books_order group by isbn
select book.title from books_order join book on books_order.isbn = book.isbn group by books_order.idorder order by count ( * ) desc limit 1
select book.title from books_order join book on books_order.isbn = book.isbn group by books_order.isbn order by count ( * ) desc limit 1
select book.title , book.purchaseprice from book join books_order on book.isbn = books_order.isbn group by books_order.isbn order by sum ( amount ) desc limit 1
select book.title , book.purchaseprice from book join books_order on book.isbn = books_order.isbn group by books_order.isbn order by sum ( amount ) desc limit 1
select book.title from books_order join book on books_order.isbn = book.isbn
select distinct book.title from books_order join book on books_order.isbn = book.isbn
select name from client where idclient in ( select idclient from orders group by idclient having count ( * ) >= 1 )
select distinct client.name from orders join client on orders.idclient = client.idclient
select client.name , count ( * ) from orders join client on orders.idclient = client.idclient group by client.idclient
select client.name , count ( * ) from orders join client on orders.idclient = client.idclient group by client.idclient
select name from client where idclient in ( select idclient from orders group by idclient having count ( idorder ) = ( select max ( counted ) from ( select count ( idorder ) as counted from orders group by idclient ) ) )
select client.name from orders join client on orders.idclient = client.idclient group by orders.idclient order by count ( * ) desc limit 1
select client.name , sum ( books_order.amount ) from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name , sum ( books_order.amount ) from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by orders.idclient order by sum ( books_order.amount ) desc limit 1
select client.name from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by orders.idclient order by sum ( books_order.amount ) desc limit 1
select title from book where isbn not in ( select isbn from books_order )
select title from book where isbn not in ( select isbn from books_order )
select name from client where idclient not in ( select idclient from orders )
select name from client where idclient not in ( select idclient from orders )
select max ( saleprice ) , min ( saleprice ) from book
select max ( saleprice ) , min ( saleprice ) from book
select avg ( purchaseprice ) , avg ( saleprice ) from book
select avg ( purchaseprice ) , avg ( saleprice ) from book
select max ( saleprice ) from book
select max ( saleprice ) from book
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice > ( select avg ( saleprice ) from book )
select title from book where saleprice = ( select min ( saleprice ) from book )
select b.title from book b where b.saleprice = ( select min ( saleprice ) from book )
select title from book where purchaseprice = ( select max ( purchaseprice ) from book )
select b.title from book b where b.purchaseprice = ( select max ( purchaseprice ) from book )
select avg ( book.saleprice ) from author_book join book on author_book.isbn = book.isbn where author_book.author = 'George Orwell'
select avg ( book.saleprice ) from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select book.saleprice from book join author_book on book.isbn = author_book.isbn where author_book.author = 'Plato'
select book.saleprice from book join author_book on book.isbn = author_book.isbn where author_book.author = 'Plato'
sql placeholder
select title from book where author = 'George Orwell' and saleprice = ( select min ( saleprice ) from book where author = 'George Orwell' )
select title from book where author = 'Plato' and saleprice < ( select avg ( saleprice ) from book )
select book.title from book join author_book on book.isbn = author_book.isbn where author_book.author = 'Plato' and book.saleprice < ( select avg ( saleprice ) from book where author_book.author = 'Plato' )
select author.name from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where book.title = 'Pride and Prejudice'
select author.name from author_book join book on author_book.isbn = book.isbn join author on author.idauthor = author_book.author where book.title = 'Pride and Prejudice'
select book.title from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select book.title from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name like '%Plato%'
select count ( * ) from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn where book.title = 'Pride and Prejudice'
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
select title from book order by title asc
select title from book order by pages desc
select type , release from book
select max ( chapters ) , min ( chapters ) from book
select title from book where title not in ( 'Poet' )
select avg ( rating ) from review
select book.title , review.rating from book join review on book.book_id = review.book_id
select review.rating from review join book on review.book_id = book.book_id where book.chapters = ( select max ( chapters ) from book )
select review.rank from book join review on book.book_id = review.book_id order by book.pages asc limit 1
select book.title from book join review on book.book_id = review.book_id order by review.rank desc limit 1
select avg ( review.readers_in_million ) from review join book on review.book_id = book.book_id where book.type = 'Novel'
select type , count ( * ) from book group by type
select type from book group by type having count ( type ) = ( select max ( cnt ) from ( select count ( * ) as cnt from book group by type ) )
select type from book group by type having count ( * ) >= 3
select book.title from book join review on book.book_id = review.book_id order by review.rating asc
select book.title , book.audio from book join review on book.book_id = review.book_id order by review.readers_in_million desc
select count ( * ) from book where book_id not in ( select book_id from review )
select type from book where chapters > 75 intersect select type from book where chapters < 50
select count ( distinct type ) from book
select type , title from book where book_id not in ( select book_id from review )
select count ( * ) from customer
select count ( * ) from customer
select name from customer order by level_of_membership asc
select name from customer order by level_of_membership asc
select nationality , card_credit from customer
select nationality , card_credit from customer
select name from customer where nationality = 'England' or nationality = 'Australia'
select name from customer where nationality = 'England' or nationality = 'Australia'
select avg ( card_credit ) from customer where level_of_membership > 1
select avg ( card_credit ) from customer where level_of_membership > 1
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select card_credit from customer where level_of_membership = ( select max ( level_of_membership ) from customer )
select nationality , count ( * ) from customer group by nationality
select nationality , count ( * ) from customer group by nationality
with nationalitycount as ( select nationality , count ( * ) as count from customer group by nationality ) select nationality from nationalitycount where count = ( select max ( count ) from nationalitycount )
with nationalitycount as ( select nationality , count ( * ) as count from customer group by nationality ) select nationality from nationalitycount where count = ( select max ( count ) from nationalitycount )
select nationality from customer where card_credit < 50 intersect select nationality from customer where card_credit > 75
select nationality from customer where card_credit > 50 intersect select nationality from customer where card_credit < 75
select customer.name , customer_order.dish_name from customer join customer_order on customer.customer_id = customer_order.customer_id
select customer.name , dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name , customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name , customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name , sum ( customer_order.quantity ) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.name
select customer.name , sum ( customer_order.quantity ) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.name
select customer.name from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.name having sum ( customer_order.quantity ) > 1
select customer.name from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id having sum ( customer_order.quantity ) > 1
select distinct manager from branch
select distinct manager from branch
select name from customer where customer_id not in ( select customer_id from customer_order )
select name from customer where customer_id not in ( select customer_id from customer_order )
select count ( * ) from member
select name from member order by age asc
select name , nationality from member
select name from member where nationality != 'England'
select name from member where age = 19 or age = 20
select m.name from member m where m.age = ( select max ( age ) from member )
select nationality , count ( * ) from member group by nationality
with nationalitycount as ( select nationality , count ( * ) as count from member group by nationality ) select nationality from nationalitycount where count = ( select max ( count ) from nationalitycount )
select nationality from member group by nationality having count ( * ) >= 2
sql placeholder
select m.name from member m where exists ( select 1 from club_leader cl join club c on cl.club_id = c.club_id where cl.member_id = m.member_id and c.overall_ranking > 100 )
select m.name from member m where exists ( select 1 from club_leader cl where cl.year_join < 2018 and cl.member_id = m.member_id )
select m.name from member m where exists ( select 1 from club_leader cl join club c on cl.club_id = c.club_id where cl.member_id = m.member_id and c.club_name = 'Houston' )
select name from member where member_id not in ( select member_id from club_leader )
select nationality from member where age > 22 intersect select nationality from member where age < 19
select avg ( member.age ) from club_leader join member on club_leader.member_id = member.member_id
select club_name from club where club_name like '%state%'
select collection_subset_name from collection_subsets
select collection_subset_name from collection_subsets
select collecrtion_subset_details from collection_subsets where collection_subset_name = 'Top collection'
sql placeholder
select document_subset_name from document_subsets
select document_subset_name from document_subsets
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
sql placeholder
select document_object_id from document_objects
select parent_document_object_id from document_objects where owner = 'Marlin'
select document_object_id from document_objects where owner = 'Marlin'
select owner from document_objects where description = 'Braeden Collection'
select document_objects.owner from document_objects join documents_in_collections on document_objects.document_object_id = documents_in_collections.document_object_id join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Braeden Collection'
select owner from document_objects where owner = 'Marlin'
select owner from document_objects where owner = 'Marlin'
select distinct description from document_objects
select distinct description from document_objects
select count ( * ) from document_objects where owner = 'Marlin'
select count ( * ) from document_objects where owner = 'Marlin'
select document_object_id from document_objects except select parent_document_object_id from document_objects
select document_object_id from document_objects except select parent_document_object_id from document_objects
select parent_document_object_id , count ( * ) from document_objects group by parent_document_object_id
sql placeholder
select collection_name from collections
select collection_name from collections
select collection_description from collections where collection_name = 'Best'
select collection_description from collections where collection_name = 'Best'
select collection_name from collections where collection_name = 'Nice'
select collection_name from collections where collection_name = 'Nice'
select collection_name from collections where parent_collection_id not in ( select collection_id from collections )
select collection_name from collections where collection_id not in ( select parent_collection_id from collections )
sql placeholder
select document_object_id from document_objects group by document_object_id having count ( * ) > 1
select count ( * ) from collections where collection_name = 'Best'
select count ( * ) from collections where collection_name = 'Best'
select document_object_id from document_objects where owner = 'Ransom'
select document_object_id from document_objects where owner = 'Ransom'
select collection_subset_id , collection_subset_name , count ( * ) from collection_subsets group by collection_subset_id
sql placeholder
sql placeholder
select document_object_id , count ( * ) from document_objects group by document_object_id
sql placeholder
select document_object_id from documents_in_collections group by document_object_id order by count ( * ) asc limit 1
sql placeholder
select document_object_id , count ( * ) from document_subset_members group by document_object_id having count ( * ) between 2 and 4
select owner from document_objects where document_object_id in ( select related_document_object_id from document_subset_members where owner = 'Braeden' )
select distinct owner from document_objects where document_object_id in ( select related_document_object_id from document_subset_members where owner = 'Braeden' )
select distinct document_subset_name from document_subsets join document_objects on document_subsets.document_subset_id = document_subsets.document_subset_id where document_objects.owner = 'Braeden'
select distinct document_subset_name from document_objects join document_subsets on document_objects.document_object_id = document_subsets.document_subset_id where document_objects.owner = 'Breaeden'
sql placeholder
sql placeholder
select document_subset_id , document_subset_name , count ( * ) from document_subsets group by document_subset_id order by count ( * ) desc limit 1
sql placeholder
select document_subset_id from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_id from document_subsets where document_subset_name = 'Best for 2000'
sql placeholder
sql placeholder
select collections.collection_name from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = 'Ransom'
select collections.collection_name from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = 'Ransom'
select count ( * ) , documents_in_collections.document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id group by documents_in_collections.document_object_id
select document_object_id , count ( distinct collections.collection_id ) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id group by document_object_id
select count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id where collections.collection_name = 'Best'
select count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id where collections.collection_name = 'Best'
select document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select count ( distinct d.document_object_id ) from documents_in_collections d inner join collections c on d.collection_id = c.collection_id where c.collection_name = 'Best'
select collections.collection_name , collections.collection_id , count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id group by collections.collection_id order by count ( * ) desc limit 1
select collections.collection_name , collections.collection_id , count ( * ) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id where collections.collection_name = 'Best' group by collections.collection_id order by count ( * ) desc limit 1
sql placeholder
sql placeholder
sql placeholder
select distinct documents_in_collections.document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best' except select distinct documents_in_collections.document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
sql placeholder
sql placeholder
select collection_name from collections where collection_name in ( select collection_id from collections where collection_name = 'Best' )
select c.collection_name from collections c where exists ( select 1 from collection_subset_members csm join collections c on csm.collection_id = c.collection_id where csm.collection_id = c.collection_id and c.collection_name = 'Best' )
select count ( * ) from collections join collection_subset_members on collections.collection_id = collection_subset_members.related_collection_id where collections.collection_name = 'Best'
select count ( distinct collection_subset_members.related_collection_id ) from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id where collections.collection_name = 'Best'
select collection_subset_name from collections join collection_subsets on collections.collection_id = collection_subsets.collection_subset_id where collections.collection_name = 'Best'
sql placeholder
select count ( * ) from songs where name like '%Love%'
select name from songs order by name asc
select name , language from songs
select max ( voice_sound_quality ) , min ( voice_sound_quality ) from performance_score
select performance_score.voice_sound_quality , performance_score.rhythm_tempo , performance_score.stage_presence from performance_score join participants on performance_score.participant_id = participants.id where participants.name = 'Freeway'
select id , language , original_artist from songs where name != 'Love'
select name , original_artist from songs where english_translation = 'All the streets of love'
select distinct performance_score.stage_presence from performance_score join songs on performance_score.songs_id = songs.id where songs.language = 'English'
select participants.id , participants.name from performance_score join participants on performance_score.participant_id = participants.id group by participants.id having count ( * ) >= 2
select p.id , p.name , p.popularity from participants p join performance_score ps on p.id = ps.participant_id group by p.id order by count ( ps.songs_id ) asc
select participants.id , participants.name from performance_score join participants on performance_score.participant_id = participants.id where performance_score.voice_sound_quality = 5 or performance_score.rhythm_tempo = 5
select performance_score.voice_sound_quality from performance_score join songs on performance_score.songs_id = songs.id where songs.name = 'The Balkan Girls' and songs.language = 'english'
select songs.id , songs.name from performance_score join songs on performance_score.songs_id = songs.id group by songs.id order by count ( * ) desc limit 1
select count ( distinct performance_score.stage_presence ) from performance_score where stage_presence < 7 or stage_presence > 9
select count ( * ) from songs where id not in ( select songs_id from performance_score )
select avg ( performance_score.rhythm_tempo ) , songs.language from performance_score join songs on performance_score.songs_id = songs.id group by songs.language
select distinct participants.name from performance_score join participants on performance_score.participant_id = participants.id join songs on songs.id = performance_score.songs_id where songs.language = 'english'
select participants.name , participants.popularity from performance_score join participants on performance_score.participant_id = participants.id join songs on songs.id = performance_score.songs_id where songs.language = 'Croatian' intersect select participants.name , participants.popularity from performance_score join participants on performance_score.participant_id = participants.id join songs on performance_score.songs_id = songs.id where songs.language = 'English'
select name from songs where name like '%Is%'
sql placeholder
select count ( * ) from city
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
select state , count ( * ) from city group by state
select state , count ( * ) from city group by state
select country , count ( * ) from city group by country
select count ( * ) , country from city group by country
select state from city group by state having count ( * ) >= 2
select state from city group by state having count ( * ) >= 2
select c.state from city c group by c.state having count ( c.city_code ) = ( select max ( cnt ) from ( select count ( * ) as cnt from city group by state ) )
with citycounts as ( select state , count ( city_code ) as num_cities from city group by state ) select state from citycounts where num_cities = ( select max ( num_cities ) from citycounts )
with citycounts as ( select country , count ( city_code ) as num_cities from city group by country ) select country from citycounts where num_cities = ( select min ( num_cities ) from citycounts )
select country from city group by country having count ( city_code ) = ( select min ( cnt ) from ( select count ( city_code ) as cnt from city group by country ) )
select student.fname , student.lname from city join student on city.city_code = student.city_code where city.state = 'MD'
sql placeholder
select count ( * ) from city join student on city.city_code = student.city_code where city.country = 'China'
select count ( * ) from city join student on city.city_code = student.city_code where city.country = 'China'
select student.fname , student.major from city join student on city.city_code = student.city_code where city.city_name = 'Baltimore'
select student.fname , student.major from city join student on city.city_code = student.city_code where city.city_name = 'Baltimore'
select city.country , count ( * ) from city join student on city.city_code = student.city_code group by city.country
select country , count ( * ) from city join student on city.city_code = student.city_code group by country
select city.city_name , count ( * ) from city join student on city.city_code = student.city_code group by city.city_name
select city.city_name , count ( * ) from city join student on city.city_code = student.city_code group by city.city_name
select c.state from city c join student s on c.city_code = s.city_code group by c.state having count ( s.sex ) = ( select max ( student_count ) from ( select count ( * ) as student_count from student group by city_code ) )
select c.state from city c join student s on c.city_code = s.city_code group by c.state having count ( s.city_code ) = ( select max ( count ) from ( select count ( city_code ) as count from student group by city_code ) )
with studentcounts as ( select country , count ( city_code ) as num_students from city group by country ) select country from studentcounts where num_students = ( select min ( num_students ) from studentcounts )
select country from city group by country order by count ( * ) asc limit 1
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count ( * ) >= 3
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count ( * ) >= 3
select city.state from city join student on city.city_code = student.city_code group by city.state having count ( * ) > 5
select state from city group by state having count ( * ) > 5
select stuid from student where city_code not in ( select city_code from city where country = 'USA' )
select stuid from student where city_code not in ( select city.city_code from city join student on city.city_code = student.city_code where city.country = 'USA' )
select student.stuid from city join student on city.city_code = student.city_code where student.sex = 'F' and city.state = 'PA'
select student.stuid from city join student on city.city_code = student.city_code where city.state = 'PA' and student.sex = 'F'
select stuid from student where sex = 'M' and city_code != 'USA'
select stuid from student where sex = 'M' and city_code != 'USA'
select distance from city join direct_distance on city.city_code = direct_distance.city2_code where city.city_name = 'BAL' or city.city_name = 'CHI'
select distance from city join direct_distance on city.city_code = direct_distance.city2_code where city.city_name = 'BAL' or city.city_name = 'CHI'
select distance from city join direct_distance on city.city_code = direct_distance.city2_code where city.city_name = 'Boston' and city.city_name = 'Newark'
select distance from city join direct_distance on city.city_code = direct_distance.city2_code where city.city_name = 'Boston' and city.city_name = 'Newark'
select avg ( distance ) , min ( distance ) , max ( distance ) from direct_distance
select avg ( distance ) , min ( distance ) , max ( distance ) from direct_distance
select city_code from city where city_code in ( select city2_code from direct_distance group by city2_code having max ( distance ) )
select c.city_code from city c inner join direct_distance d on c.city_code = d.city1_code where d.distance = ( select max ( distance ) from direct_distance )
select city.city_code from city join direct_distance on city.city_code = direct_distance.city2_code where direct_distance.distance > ( select avg ( distance ) from direct_distance ) group by city.city_code having count ( * ) > 0
select c.city_code from city c join direct_distance d on c.city_code = d.city1_code where d.distance > ( select avg ( distance ) from direct_distance )
select city_code from city where city_code in ( select city2_code from direct_distance where distance < 1000 )
select city.city_code from city join direct_distance on city.city_code = direct_distance.city1_code where direct_distance.distance < 1000
select sum ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL'
select sum ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'BAL'
select avg ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'Boston'
select avg ( distance ) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = 'Boston'
sql placeholder
select city_name from city where city_code = ( select min ( direct_distance.city2_code ) from direct_distance join city on direct_distance.city1_code = city.city_code where city.city_name = 'Chicago' )
sql placeholder
sql placeholder
select c.city_code , sum ( d.distance ) from city c join direct_distance d on c.city_code = d.city1_code group by c.city_code
select city.city_code , sum ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_code
select city.city_name , avg ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city2_code group by city.city_name
select city.city_name , avg ( direct_distance.distance ) from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_code
select distance from student join direct_distance on student.city_code = direct_distance.city1_code join city on direct_distance.city2_code = city.city_code where student.fname = 'Linda' and student.lname = 'Smith'
select distance from direct_distance join city on direct_distance.city1_code = city.city_code join student on city.city_code = student.city_code where student.fname = 'Linda' and student.lname = 'Smith' intersect select distance from direct_distance join city on direct_distance.city2_code = city.city_code join student on direct_distance.city1_code = city.city_code where student.fname = 'Tracy' and student.lname = 'Kim'
select s.fname , s.lname from student s where exists ( select 1 from direct_distance d where d.city1_code = s.city_code and s.fname = 'Linda' ) and exists ( select 1 from direct_distance d where d.city1_code = s.city_code and s.fname = 'Smith' )
sql placeholder
select city.state from city join student on city.city_code = student.city_code where student.fname = 'LINDA'
select city.state from city join student on city.city_code = student.city_code where student.fname = 'LINDA'
select * from sailors where age > 30
select * from sailors where age > 30
select name , age from sailors where age < 30
select name , age from sailors where age < 30
select boats.name from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.name = '1'
select distinct bid from reserves join sailors on reserves.sid = sailors.sid where sailors.sid = 1
select name from boats join reserves on boats.bid = reserves.bid where boats.name = '102'
select name from sailors where sid in ( select sid from reserves where bid = 102 )
select distinct bid from reserves
select r.sid from reserves r left join boats b on r.bid = b.bid group by r.sid
select name from sailors where name like '%e%'
select name from sailors where name like '%e%'
select distinct s.sid from sailors s where s.age > ( select max ( age ) from sailors )
select distinct sid from sailors where age != ( select min ( age ) from sailors )
select distinct name from sailors where age > ( select max ( age ) from sailors where rating > 7 )
select distinct name from sailors where age > ( select max ( age ) from sailors where rating > 7 )
select sailors.name , reserves.sid from sailors join reserves on sailors.sid = reserves.sid group by reserves.sid having count ( * ) >= 1
select sailors.name , reserves.sid from sailors join reserves on sailors.sid = reserves.sid group by reserves.sid having count ( * ) >= 1
select sailors.sid , sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count ( * ) > 1
select distinct sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count ( * ) >= 2
select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'Red' or boats.color = 'Blue'
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'Red' or b.color = 'Blue'
select name , sid from sailors where sid in ( select sid from reserves where bid in ('red' , 'blue' ) )
select name , sid from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color = 'red' or color = 'blue' ) )
select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' intersect select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'blue'
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color = 'red' and b.color = 'blue'
select sailors.name , reserves.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = 'red' intersect select sailors.name , reserves.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = 'blue'
select name , sid from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' or boats.color = 'blue' )
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select name , sid from sailors where sid not in ( select sid from reserves )
select name , sid from sailors where sid not in ( select sid from reserves )
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select name from sailors where sid in ( select sid from reserves where bid = 103 )
select name from sailors where sid in ( select sid from reserves where bid = 103 )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
select name from sailors where rating > ( select max ( rating ) from sailors where name = 'Luis' )
sql placeholder
select name , sid from sailors where rating >= 3 and sid in ( select sid from reserves where rating >= 3 )
select name , age from sailors where age = ( select max ( age ) from sailors )
select s.name , s.age from sailors s where s.age = ( select max ( age ) from sailors )
select count ( * ) from sailors
select count ( * ) from sailors
select avg ( age ) from sailors where rating = 7
select avg ( age ) from sailors where rating = 7
select count ( * ) from sailors where name like 'D%'
select count ( * ) from sailors where name like 'D%'
select avg ( rating ) , max ( age ) from sailors
select avg ( rating ) , max ( age ) from sailors
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.name
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.name
select bid , count ( * ) from reserves where bid > 50 group by bid
select boats.name , count ( * ) from boats join reserves on boats.bid = reserves.bid where reserves.sid > 50 group by boats.bid
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.bid having count ( * ) > 1
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid group by boats.bid having count ( * ) > 1
select count ( * ) , boats.name from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where reserves.bid > 1 group by boats.name
select boats.name , count ( * ) from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.sid > 1 group by boats.name
select avg ( age ) , rating from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'Red' ) group by rating
select rating , avg ( age ) from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.color = 'red' ) group by rating
select name , rating , age from sailors order by rating asc , age
select name , rating , age from sailors order by rating asc , age
select count ( * ) from boats
select count ( * ) from boats
select count ( * ) from boats where color = 'red'
select count ( * ) from boats where color = 'Red'
select boats.name from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select boats.name from boats join reserves on boats.bid = reserves.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.rating > ( select max ( rating ) from sailors where sid = boats.bid and boats.color = 'Red' )
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where sailors.rating > ( select max ( rating ) from sailors where sid = boats.bid and boats.color = 'Red' )
select max ( rating ) from sailors
select max ( rating ) from sailors
select name from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where name = 'Melon' ) )
select name from sailors where sid in ( select reserves.sid from reserves join boats on reserves.bid = boats.bid where boats.name = 'Melon' )
select name , age from sailors order by rating desc
select name , age from sailors order by rating desc
select model from headphone where price = ( select max ( price ) from headphone )
select model from headphone where price = ( select max ( price ) from headphone )
select distinct model from headphone order by model asc
select distinct model from headphone order by model asc
select class from headphone group by class having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from headphone group by class ) )
select class from headphone group by class having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from headphone group by class ) )
select class from headphone group by class having count ( * ) > 2
select class from headphone group by class having count ( * ) <= 2
select class , count ( * ) from headphone where price > 200 group by class
select class , count ( * ) from headphone where price > 200 group by class
select count ( distinct earpads ) from headphone
select count ( distinct earpads ) from headphone
select earpads from headphone group by earpads order by count ( * ) desc limit 2
select earpads from headphone group by earpads order by count ( * ) desc limit 2
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select model , class , construction from headphone where price = ( select min ( price ) from headphone )
select construction , avg ( price ) from headphone group by construction
select avg ( price ) , construction from headphone group by construction
select class from headphone where earpads = 'Bowls' intersect select class from headphone where earpads = 'Comfort Pads'
select class from headphone where earpads = 'Bowls' intersect select class from headphone where earpads = 'Comfort Pads'
select earpads from headphone except select earpads from headphone where construction = 'plastic'
select distinct earpads from headphone where construction != 'plastic'
select model from headphone where price < ( select avg ( price ) from headphone )
select model from headphone where price < ( select avg ( price ) from headphone )
select name from store order by date_opened asc
select name from store order by date_opened asc
select name , parking from store where neighborhood = 'Tarzana'
select name , parking from store where neighborhood = 'Tarzana'
select count ( distinct neighborhood ) from store
select count ( distinct neighborhood ) from store
select neighborhood , count ( * ) from store group by neighborhood
select neighborhood , count ( * ) from store group by neighborhood
select store.name , count ( * ) from stock join store on stock.store_id = store.store_id group by stock.store_id order by count ( * ) desc limit 1
select store.name , sum ( stock.quantity ) from stock join store on stock.store_id = store.store_id group by store.store_id
select name from store where store_id not in ( select distinct store_id from stock where headphone_id = stock.headphone_id )
select name from store where store_id not in ( select distinct store_id from stock where quantity > 0 )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select model from headphone where headphone_id not in ( select headphone_id from stock )
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by headphone.model order by sum ( stock.quantity ) desc limit 1
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by headphone.model order by sum ( stock.quantity ) desc limit 1
select count ( * ) from stock join store on stock.store_id = store.store_id where store.name = 'Woodman'
select sum ( stock.quantity ) from stock join store on stock.store_id = store.store_id where store.name = 'Woodman'
select neighborhood from store left join stock on store.store_id = stock.store_id where stock.headphone_id is null
select neighborhood from store where store_id not in ( select distinct store_id from stock where headphone_id = stock.headphone_id )
select count ( * ) from author
select count ( * ) from author
select count ( * ) from paper
select count ( * ) from paper
select count ( * ) from affiliation
select count ( * ) from affiliation
select count ( * ) from paper where year = 2000 and year = 'NAACL'
select count ( * ) from paper where year = 2000 and year = 'NAACL'
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and paper.year = 2009
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and paper.year = 2009
select name , address from affiliation
select name , address from affiliation
select venue , year from paper order by year asc
select distinct venue from paper order by year asc
select paper.title , paper.paper_id from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Harvard University'
select paper.title , author_list.paper_id from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Harvard University'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown'
select title , paper_id from paper where paper_id in ( select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Stanford University' intersect select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' )
select title , paper_id from paper where paper_id in ( select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Stanford University' intersect select paper_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Columbia University' )
sql placeholder
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' intersect select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' except select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' except select paper.title , paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Rambow'
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' and name = 'Kathleen' ) )
select title , paper_id from paper where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' and name = 'Kathleen' ) )
select author.name , count ( * ) from author_list join author on author_list.author_id = author.author_id group by author.author_id order by count ( * ) desc
select author.name , count ( * ) from author join author_list on author.author_id = author_list.author_id group by author.author_id order by count ( * ) asc
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id order by count ( * ) asc
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id order by author_list.paper_id asc
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count ( * ) > 50
select author.name from author_list join author on author_list.author_id = author.author_id group by author_list.author_id having count ( * ) > 50
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count ( * ) = 1
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count ( * ) = 1
select venue , year from paper group by venue , year having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from paper group by venue ) )
select venue , year from paper group by venue , year order by count ( * ) desc limit 1
select venue from paper group by venue order by count ( * ) asc limit 1
select venue from paper group by venue order by count ( * ) asc limit 1
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'A00-1002'
select count ( distinct paper.paper_id ) from citation join paper on citation.cited_paper_id = paper.paper_id where paper.paper_id = 'A00-1002'
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'D12-1027'
select count ( * ) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'D12-1027'
select p.paper_id , count ( * ) as num_citations from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id having num_citations = ( select max ( num_citations ) from ( select count ( * ) as num_citations from citation group by paper_id ) )
select p.paper_id , count ( * ) as num_citations from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id having num_citations = ( select max ( num_citations ) from ( select count ( * ) as num_citations from citation group by paper_id ) )
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from citation group by paper_id ) ) )
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from citation group by paper_id ) ) )
select paper.title , count ( * ) from citation join paper on citation.paper_id = paper.paper_id group by citation.paper_id order by count ( * ) desc limit 10
select p.title , count ( * ) as num_citations from paper p join citation c on p.paper_id = c.paper_id group by p.paper_id order by num_citations desc limit 10
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count ( * ) from citation where paper_id in ( select paper_id from author_list where author_id in ( select author_id from author where name = 'Mckeown' and name = 'Kathleen' ) )
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select distinct paper.venue , paper.year from affiliation join paper on affiliation.affiliation_id = paper.paper_id where affiliation.name = 'Columbia University'
select venue , year from affiliation join paper on affiliation.affiliation_id = paper.paper_id where affiliation.name = 'Columbia University'
select author.name from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where paper.year = 2009 group by author.author_id order by count ( * ) desc limit 1
select name from author where author_id in ( select author_id from author_list where paper_id = ( select max ( cnt ) from ( select count ( paper_id ) as cnt from author_list where paper_id = 2009 group by author_id ) ) )
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by affiliation.affiliation_id order by count ( * ) desc limit 3
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by affiliation.name order by count ( * ) desc limit 3
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and paper.year <= 2009
select count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University' and paper.year <= 2009
select count ( * ) from paper where year between 2000 and 2009
select count ( * ) from paper where year between 2000 and 2009 and venue = 'Stanford University'
select paper.title from paper inner join ( select paper_id , count ( author_id ) as num_authors from author_list group by paper_id ) as temp on paper.paper_id = temp.paper_id where num_authors = ( select max ( num_authors ) from ( select count ( author_id ) as num_authors from author_list group by paper_id ) )
select paper.title from paper inner join ( select paper_id , count ( author_id ) as num_authors from author_list group by paper_id ) as temp on paper.paper_id = temp.paper_id where num_authors = ( select max ( num_authors ) from ( select count ( author_id ) as num_authors from author_list group by paper_id ) )
select count ( * ) from author where name = 'Mckeown , Kathleen'
select count ( * ) from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen'
select author.name from author join author_list on author.author_id = author_list.author_id where author.name = 'Mckeown , Kathleen' group by author.name order by count ( * ) desc limit 1
select author.name from author_list join author on author_list.author_id = author.author_id join paper on author_list.paper_id = paper.paper_id where author.name = 'Mckeown , Kathleen' group by author.author_id order by count ( * ) desc limit 1
select paper_id from paper where title like '%translation%'
select paper_id from paper where title like '%translation%'
select paper_id , title from paper where paper_id not in ( select paper_id from citation )
select paper_id , title from paper where paper_id not in ( select paper_id from citation )
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id where affiliation.address like '%China%' group by affiliation.affiliation_id order by count ( * ) desc limit 1
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id where affiliation.address like '%China%' group by affiliation.name order by count ( * ) desc limit 1
select count ( * ) , venue from paper group by year
select venue , count ( * ) from paper group by venue , year
select affiliation.name , count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id
select affiliation.name , count ( * ) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select title from paper where paper_id in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select count ( * ) from author where author_id not in ( select author_id from author_list group by author_id having count ( paper_id ) > 50 )
select count ( distinct author_id ) from author_list where paper_id not in ( select paper_id from citation group by paper_id having count ( cited_paper_id ) > 50 )
select name from author where author_id in ( select author_id from author_list join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 intersect select author_id from author_list join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 and paper.title = 'NAACL' )
select distinct a.name from author a join author_list al on a.author_id = al.author_id join paper p on al.paper_id = p.paper_id where p.year = 2009 and al.author_id in ( select author_id from author_list where paper_id = p.paper_id )
select name from author where author_id not in ( select author_id from author_list where paper_id = 'ACL' )
select name from author where author_id not in ( select author_id from author_list join paper on author_list.paper_id = paper.paper_id where title = 'ACL' )
select count ( * ) from conference
select count ( * ) from conference
select distinct conference_name from conference
select distinct conference_name from conference
select conference_name , year , location from conference
select conference_name , year , location from conference
select conference_name , count ( * ) from conference group by conference_name
select conference_name , count ( * ) from conference group by conference_name
select year , count ( * ) from conference group by year
select count ( * ) , year from conference group by year
select year from conference group by year order by count ( * ) asc limit 1
select year from conference group by year having count ( * ) = ( select min ( count ) from ( select count ( * ) as count from conference group by year ) )
select location from conference group by location having count ( * ) >= 2
select location from conference group by location having count ( * ) >= 2
select institution_name , location , founded from institution
select institution_name , location , founded from institution
select count ( * ) from institution where founded between 1850 and 1900
select count ( * ) from institution where founded between 1850 and 1900
select institution_name , location from institution where founded = ( select max ( founded ) from institution )
select institution_name , location from institution where founded = ( select max ( founded ) from institution )
select institution_name , ( select count ( * ) from staff where institution_id = institution.institution_id and founded > 1800 ) as staff_count from institution where founded > 1800
select institution.institution_id , count ( * ) from staff join institution on staff.institution_id = institution.institution_id where institution.founded > 1800 group by institution.institution_id
select institution_name from institution where institution_id not in ( select institution_id from staff )
select institution_name from institution where institution_id not in ( select institution_id from staff )
select name from staff where age > ( select avg ( age ) from staff )
select name from staff where age > ( select avg ( age ) from staff )
select max ( age ) , min ( age ) from staff where nationality = 'United States'
select max ( age ) , min ( age ) from staff
select conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id join staff on staff.staff_id = conference_participation.staff_id where staff.nationality = 'Canada'
select distinct conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id join staff on conference_participation.staff_id = staff.staff_id where staff.nationality = 'Canada'
select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Speaker' intersect select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Sponsor'
select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Speaker' intersect select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.role = 'Sponsor'
sql placeholder
select name from staff where staff_id in ( select conference_participation.staff_id from conference_participation join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = 'ACL' intersect select staff.name from conference_participation join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = 'NACCL' )
select name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( conference_id ) )
select name from staff where staff_id in ( select staff_id from conference_participation where conference_id in ( conference_id ) )
select conference_name , year , ( select count ( * ) from conference_participation where conference_id = conference.conference_id ) as participant_count from conference
select conference.conference_name , conference.year , count ( * ) from conference join conference_participation on conference.conference_id = conference_participation.conference_id group by conference.conference_id
select conference_name from conference where conference_id in ( select conference_id from conference_participation group by conference_id order by count ( * ) desc limit 2 )
select conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference_participation.conference_id order by count ( * ) desc limit 2
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select name , nationality from staff where staff_id not in ( select staff_id from conference_participation where conference_id = 'ACL' )
select institution_name , location from institution where institution_id not in ( select staff.institution_id from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2004 )
select institution.institution_name , institution.location from institution where institution_id not in ( select staff.institution_id from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2004 )
select pilot_name from pilotskills where age = ( select max ( age ) from pilotskills )
select pilot_name from pilotskills where age = ( select max ( age ) from pilotskills )
select pilot_name from pilotskills where age < ( select avg ( age ) from pilotskills ) order by age asc
select pilot_name from pilotskills where age < ( select avg ( age ) from pilotskills ) order by age asc
select * from pilotskills where age < 30
select * from pilotskills where age < 30
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age < 35
select pilot_name from pilotskills where age < 35 and plane_name = 'Piper Cub'
select location from hangar where plane_name = 'F-14 Fighter'
select location from hangar where plane_name = 'F-14 Fighter'
select count ( distinct location ) from hangar
select count ( distinct location ) from hangar
select plane_name from pilotskills where pilotskills.pilot_name = 'Jones' and pilotskills.age = 32
select plane_name from pilotskills where pilot_name = 'Jones' and age = 32
select count ( * ) from pilotskills where age > 40
select count ( * ) from pilotskills where age > 40
select count ( * ) from pilotskills where plane_name = 'B-52 Bomber' and age < 35
select count ( * ) from pilotskills where plane_name = 'B-52 Bomber' and age < 35
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select p.pilot_name from pilotskills p where p.plane_name = 'Piper Cub' and p.age = ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select plane_name from pilotskills group by plane_name order by count ( * ) desc limit 1
select plane_name from pilotskills group by plane_name order by count ( * ) desc limit 1
select plane_name from pilotskills group by plane_name order by count ( * ) asc limit 1
select plane_name from pilotskills group by plane_name order by count ( * ) asc limit 1
select count ( distinct p.pilot_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Chicago'
select count ( distinct p.pilot_name ) from pilotskills p join hangar h on p.plane_name = h.plane_name where h.location = 'Chicago'
select plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select count ( distinct plane_name ) from pilotskills
select count ( distinct plane_name ) from pilotskills
select count ( distinct plane_name ) from pilotskills where pilot_name = 'Smith'
select count ( distinct plane_name ) from pilotskills where pilotskills.pilot_name = 'Smith'
select count ( * ) from pilotskills where age > 40
select count ( * ) from pilotskills where age > 40
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills order by age desc
select pilot_name from pilotskills order by age desc
select location from hangar order by plane_name asc
select distinct location from hangar order by plane_name asc
select distinct plane_name from pilotskills order by plane_name asc
select distinct plane_name from hangar order by plane_name asc
select count ( * ) from pilotskills where age > 40 or age < 30
select count ( * ) from pilotskills where age > 40 or age < 30
select pilot_name , age from pilotskills where plane_name = 'Piper Cub' and age > 35 union select pilot_name , age from pilotskills where plane_name = 'F-14 Fighter' and age < 30
select pilot_name , age from pilotskills where plane_name = 'Piper Cub' and age > 35 union select pilot_name , age from pilotskills where plane_name = 'F-14 Fighter' and age < 30
select pilot_name from pilotskills where plane_name = 'Piper Cub' except select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select pilot_name from pilotskills where plane_name = 'Piper Cub' except select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select pilot_name from pilotskills where plane_name = 'Piper Cub' intersect select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select pilot_name from pilotskills where plane_name = 'Piper Cub' intersect select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select avg ( age ) , min ( age ) from pilotskills
select avg ( age ) , min ( age ) from pilotskills
select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin' intersect select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Boston'
select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin' intersect select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Boston'
select pilot_name from pilotskills where plane_name = 'Piper Cub' union select pilot_name from pilotskills where plane_name = 'F-14 Fighter'
select pilot_name from pilotskills where plane_name in ( select plane_name from pilotskills where plane_name = 'Piper Cub' or plane_name = 'F-14 Fighter' )
select avg ( age ) , plane_name from pilotskills group by plane_name
select plane_name , avg ( age ) from pilotskills group by plane_name
sql placeholder
select count ( * ) , plane_name from pilotskills group by plane_name
select max ( age ) , plane_name from pilotskills group by plane_name order by plane_name asc
select plane_name , pilot_name from pilotskills order by plane_name asc
select pilot_name from pilotskills where ( plane_name , age ) in ( select plane_name , max ( age ) from pilotskills group by plane_name )
select plane_name , pilot_name from pilotskills order by age desc limit 1
select max ( age ) , pilot_name from pilotskills group by pilot_name having pilot_name = pilotskills.pilot_name
select pilot_name , max ( age ) from pilotskills group by pilot_name
select count ( * ) , avg ( age ) , location from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by location
select hangar.location , count ( * ) , avg ( pilotskills.age ) from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.location
select count ( * ) , plane_name from pilotskills group by plane_name having avg ( age ) < 35
select plane_name , count ( * ) from pilotskills group by plane_name having avg ( age ) < 35
select hangar.location from hangar inner join pilotskills on hangar.plane_name = pilotskills.plane_name where pilotskills.age = ( select min ( age ) from pilotskills )
select hangar.location from hangar inner join pilotskills on hangar.plane_name = pilotskills.plane_name where pilotskills.age = ( select min ( age ) from pilotskills )
select pilotskills.pilot_name , pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin'
select pilotskills.pilot_name , pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin'
select pilot_name from pilotskills where age > ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' ) order by pilot_name asc
select p.pilot_name from pilotskills p where p.age > ( select max ( ps.age ) from pilotskills ps where ps.plane_name = 'Piper Cub' ) order by p.pilot_name asc
select count ( * ) from pilotskills where age < ( select min ( age ) from pilotskills where plane_name = 'F-14 Fighter' )
select count ( * ) from pilotskills where age < ( select min ( age ) from pilotskills where plane_name = 'F-14 Fighter' )
select distinct plane_name from pilotskills where plane_name like '%Bomber%'
select distinct plane_name from pilotskills where plane_name like '%Bomber%'
select count ( * ) from pilotskills where age > ( select max ( age ) from pilotskills where plane_name = 'Piper Cub' )
select count ( * ) from pilotskills where age > ( select min ( age ) from pilotskills where plane_name = 'Piper Cub' )
select d.name from district d where d.area_km = ( select max ( area_km ) from district )
select area_km , government_website from district where population = ( select min ( population ) from district )
select name , population from district where area_km > ( select avg ( area_km ) from district )
select max ( area_km ) , avg ( area_km ) from district
select sum ( population ) from district where area_km in ( select area_km from district order by area_km desc limit 3 )
select district_id , name , government_website from district order by population asc
select name from district where government_website = 'gov'
select district_id , name from district where population > 4000 or area_km > 3000
sql placeholder
select avg ( points ) , avg ( age ) from spokesman where rank_position = 1
select name , points from spokesman where age < 40
select s.name from spokesman s where s.age = ( select max ( age ) from spokesman )
select name from spokesman where points < ( select avg ( points ) from spokesman )
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by spokesman_district.district_id order by count ( * ) desc limit 1
select name from spokesman where spokesman_id in ( select spokesman_id from spokesman_district where start_year < 2004 )
select district.name , count ( spokesman_district.spokesman_id ) from spokesman_district join district on spokesman_district.district_id = district.district_id group by district.district_id
select district.name from district where district_id in ( select spokesman_district.district_id from spokesman_district join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 1 intersect select district.name from spokesman_district join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 2 )
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by spokesman_district.district_id having count ( * ) > 1
select count ( * ) from district where district_id not in ( select district_id from spokesman_district )
select name from spokesman where spokesman_id not in ( select spokesman_id from spokesman_district )
select sum ( district.population ) , avg ( district.population ) from district where district_id in ( select district_id from spokesman_district )
select title from sculptures where year = ( select max ( year ) from sculptures )
select title from sculptures where year = ( select max ( year ) from sculptures )
select title , location from paintings where year = ( select min ( year ) from paintings )
select title , location from paintings where year = ( select min ( year ) from paintings )
select title from sculptures where location = 226
select title from sculptures where location = 226
select title , location from paintings
select title , location from paintings
select title , location from sculptures
select title , location from sculptures
select distinct medium from paintings where paintingid = 80
select medium from paintings where paintingid = 80
select fname , lname from artists where birthyear > 1850
sql placeholder
select title , year from sculptures where location != 226
select title , year from sculptures where location != 'Gallery 226'
select distinct artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select fname , lname from artists order by deathyear desc limit 1
select fname , lname from artists order by deathyear desc limit 1
select birthyear from artists order by deathyear asc limit 1
select a.fname from artists a where a.birthyear = ( select min ( birthyear ) from artists )
sql placeholder
select fname , deathyear from artists order by deathyear desc limit 1
select count ( * ) from paintings where location = 240
select count ( * ) from paintings where location = 240
select count ( * ) from artists join paintings on artists.artistid = paintings.painterid order by artists.deathyear desc limit 1
select count ( * ) from paintings join artists on paintings.painterid = artists.artistid where artists.deathyear = ( select max ( deathyear ) from artists )
select paintings.title , paintings.year from artists join paintings on artists.artistid = paintings.painterid where artists.fname = 'Mary'
select paintings.title , paintings.year from artists join paintings on artists.artistid = paintings.painterid where artists.fname = 'Mary'
select width_mm from paintings join artists on paintings.painterid = artists.artistid where artists.birthyear < 1850
select width_mm from paintings join artists on paintings.painterid = artists.artistid where artists.birthyear < 1850
select paintings.location , paintings.medium from artists join paintings on artists.artistid = paintings.painterid where artists.fname = 'Pablo'
select location , medium from paintings join artists on paintings.painterid = artists.artistid where artists.fname = 'Pablo'
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid join sculptures on artists.artistid = sculptures.sculptorid where paintings.title = 'Artists.fname' intersect select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title = 'Artists.title'
sql placeholder
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' intersect select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Lithographic'
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Oil' intersect select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'Lithographic'
select a.birthyear from artists a where exists ( select 1 from paintings p where p.year = 1884 and p.medium = 'canvas' )
select artists.birthyear from artists join paintings on artists.artistid = paintings.painterid where paintings.year = 1884
sql placeholder
select artists.fname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' and paintings.location = 241
select medium , count ( * ) from paintings group by medium
select count ( * ) , medium from paintings group by medium
select avg ( height_mm ) , medium from paintings group by medium
select avg ( height_mm ) , medium from paintings group by medium
select count ( * ) , location from paintings where year < 1900 group by location
select count ( * ) from paintings where year < 1900 and location = 'USA'
select title from paintings where year > 1910 and medium = 'oil'
select title from paintings where medium = 'oil' and year > 1910
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct title from paintings where height_mm > ( select min ( height_mm ) from paintings where medium = 'canvas' )
select distinct title from paintings where height_mm > ( select min ( height_mm ) from paintings where medium = 'canvas' )
select distinct paintingid from paintings where year < ( select min ( year ) from paintings where location = 240 )
select distinct p.paintingid from paintings p where p.year > ( select min ( year ) from paintings p2 where p2.year = 240 )
select paintingid from paintings where year = ( select min ( year ) from paintings )
select paintingid from paintings where year = ( select min ( year ) from paintings )
select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
select artists.fname , artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
select distinct title from paintings order by title asc
select distinct title from paintings order by title asc
select distinct title from paintings order by width_mm asc
select distinct title from paintings order by height_mm asc
select paintings.title , sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptureid where sculptures.year between 1900 and 1950
select paintings.title , sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid where sculptures.year between 1900 and 1950
select paintings.title , sculptures.title from artists join paintings on artists.artistid = paintings.painterid join sculptures on artists.artistid = sculptures.sculptorid where artists.artistid = 222
select paintings.title , sculptures.title from artists join paintings on artists.artistid = paintings.painterid join sculptures on artists.artistid = sculptures.sculptorid where artists.artistid = 222
select artists.artistid from artists join paintings on artists.artistid = paintings.painterid where paintings.year < 1900 group by artists.artistid order by count ( * ) desc limit 1
select artists.artistid from artists join paintings on artists.artistid = paintings.painterid where paintings.year < 1900 group by artists.artistid order by count ( * ) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) desc limit 1
select title from paintings where width_mm < 600 or height_mm > 800
select title from paintings where width_mm < 600 or height_mm > 800
select location from paintings where year < 1885 or year > 1930
select distinct location from paintings where year < 1885 or year > 1930
select paintingid from paintings where height_mm between 500 and 2000
select paintingid from paintings where height_mm > 500 and width_mm < 2000
select location from paintings where medium = 'on panel' intersect select location from paintings where medium = 'on canvas'
select location from paintings where medium = 'on panels' intersect select location from paintings where medium = 'on canvas'
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select avg ( height_mm ) , avg ( width_mm ) from paintings where medium = 'oil' and location = '241'
select avg ( height_mm ) , avg ( width_mm ) from paintings where medium = 'oil' and location = 241
select max ( height_mm ) , max ( paintingid ) from paintings where year < 1900
select height_mm , paintingid from paintings where year < 1900
select max ( height_mm ) , max ( width_mm ) , year from paintings group by year
select max ( height_mm ) , max ( width_mm ) , year from paintings group by year
select avg ( height_mm ) , avg ( width_mm ) , artists.lname from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid order by artists.lname asc
select avg ( height_mm ) , avg ( width_mm ) , artists.fname , artists.lname from paintings join artists on paintings.painterid = artists.artistid group by artists.artistid order by artists.fname asc
select artists.fname , count ( * ) from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( * ) >= 2
select artists.fname , count ( * ) from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( * ) >= 2
select deathyear from artists group by deathyear having count ( * ) <= 3
select artists.deathyear from artists join paintings on artists.artistid = paintings.painterid group by artists.artistid having count ( * ) < 4
select artists.deathyear from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) asc limit 1
select artists.deathyear from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count ( * ) asc limit 1
sql placeholder
sql placeholder
sql placeholder
select paintingid from paintings where year < ( select min ( year ) from paintings where year = 240 )
select paintingid from paintings where height_mm > ( select max ( height_mm ) from paintings where year > 1900 )
select paintingid from paintings where height_mm > ( select max ( height_mm ) from paintings where year > 1900 )
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' group by artists.artistid order by count ( * ) desc limit 3
select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid where paintings.medium = 'oil' group by artists.artistid order by count ( * ) desc limit 1
select paintingid , location , title from paintings where medium = 'oil' order by year asc
select paintingid , location , title from paintings where medium = 'oil' order by year asc , paintingid , title
select year , location , title from paintings where height_mm > 1000 order by title asc
select year , location , title from paintings where height_mm > 1000 order by title asc
select fname , lname from artists except select artists.fname , artists.lname from artists join paintings on artists.artistid = paintings.painterid join sculptures on sculptures.sculptorid = artists.artistid
select fname , lname from artists where artistid not in ( select artistid from sculptures )
select location from paintings where year < 1885 except select location from paintings where medium = 'Canvas'
select location from paintings where year < 1885 and medium != 'canvas'
select count ( * ) from race
select count ( * ) from race
select winning_driver , winning_team from race order by winning_team asc
select winning_driver , winning_team from race order by winning_team asc
select winning_driver from race where pole_position != 'Junior Strous'
select winning_driver from race where pole_position != 'Junior Strous'
select constructor from driver order by age asc
select distinct constructor from driver order by age asc
select distinct entrant from driver where age >= 20
select distinct entrant from driver where age >= 20
select max ( age ) , min ( age ) from driver
select max ( age ) , min ( age ) from driver
select count ( distinct engine ) from driver where age > 30 or age < 20
select count ( distinct engine ) from driver where age > 30 or age < 20
select driver_name from driver order by driver_name desc
select driver_name from driver order by driver_name desc
select driver.driver_name , race.race_name from race join driver on race.driver_id = driver.driver_id
select driver.driver_name , race.race_name from race join driver on race.driver_id = driver.driver_id
select driver.driver_name , count ( * ) from race join driver on race.driver_id = driver.driver_id group by driver.driver_name
select driver.driver_name , count ( * ) from driver join race on driver.driver_id = race.driver_id group by driver.driver_id
select driver.age from race join driver on race.driver_id = driver.driver_id group by race.driver_id order by count ( * ) desc limit 1
select driver.age from race join driver on race.driver_id = driver.driver_id group by race.driver_id order by count ( * ) desc limit 1
select driver.driver_name , driver.age from race join driver on race.driver_id = driver.driver_id group by race.driver_id having count ( * ) >= 2
select driver.driver_name , driver.age from race join driver on race.driver_id = driver.driver_id group by race.driver_id having count ( * ) >= 2
select race.race_name from race join driver on race.driver_id = driver.driver_id where driver.age >= 26
select race.race_name from race join driver on race.driver_id = driver.driver_id where driver.age >= 26
select driver_name from driver where constructor != 'Bugatti'
select driver_name from driver where constructor != 'Bugatti'
select constructor , count ( * ) from driver group by constructor
select constructor , count ( * ) from driver group by constructor
select engine from driver group by engine order by count ( * ) desc limit 1
select engine from driver group by engine having count ( engine ) = ( select max ( cnt ) from ( select count ( engine ) as cnt from driver group by engine ) )
select engine from driver group by engine having count ( * ) >= 2
select engine from driver group by engine having count ( * ) >= 2
select driver_name from driver where driver_id not in ( select driver_id from race )
select driver_name from driver where driver_id not in ( select driver_id from race )
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select winning_team from race group by winning_team having count ( * ) > 1
select winning_team from race group by winning_team having count ( * ) > 1
select d.driver_name from driver d inner join race r on d.driver_id = r.driver_id where r.pole_position in ( 'James Hinchcliffe' , 'Carl Skerlong' ) group by d.driver_id having count ( distinct r.pole_position ) = 2
select driver.driver_name from race join driver on race.driver_id = driver.driver_id where race.pole_position = 'James Hinchcliffe' intersect select driver.driver_name from race join driver on race.driver_id = driver.driver_id where race.pole_position = 'Carl Skerlong'
select distinct driver_name from driver where driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select driver_name from driver where driver_id not in ( select driver_id from race where pole_position = 'James Hinchcliffe' )
select count ( * ) from languages
select count ( * ) from languages
select name from languages order by name asc
select name from languages order by name asc
select name from languages where name like '%ish%'
select name from languages where name like '%ish%'
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
select name from countries where politics_score = ( select max ( politics_score ) from countries )
select name from countries where politics_score = ( select max ( politics_score ) from countries )
select countries.name , languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id
select countries.name , languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id
select languages.name , count ( distinct countries.id ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by languages.name
select languages.name , count ( distinct countries.id ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by languages.name
select l.name from languages l where l.id in ( select ol.language_id from official_languages ol group by ol.language_id having count ( distinct ol.country_id ) = ( select max ( cnt ) from ( select count ( distinct ol.country_id ) as cnt from official_languages ol group by ol.language_id ) ) )
select languages.name from languages join official_languages on languages.id = official_languages.language_id group by official_languages.language_id order by count ( * ) desc limit 1
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by languages.id having count ( distinct official_languages.country_id ) >= 2
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by languages.id having count ( distinct country_id ) >= 2
select avg ( overall_score ) from countries where id in ( select country_id from official_languages where language_id = 'English' )
select avg ( overall_score ) from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id where languages.name = 'english'
select official_languages.language_id from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count ( * ) desc limit 3
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count ( * ) desc limit 3
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id group by languages.id order by avg ( countries.overall_score ) desc
select languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id order by countries.overall_score desc
select countries.name from countries join official_languages on countries.id = official_languages.country_id group by countries.id order by count ( * ) desc limit 1
select countries.name from countries join official_languages on countries.id = official_languages.country_id group by countries.id order by count ( * ) desc limit 1
select name from languages where id not in ( select language_id from official_languages )
select name from languages where id not in ( select language_id from official_languages )
select name from countries where id not in ( select country_id from official_languages )
select name from countries where id not in ( select country_id from official_languages )
select name from languages where id in ( select language_id from official_languages where country_id in ( select id from countries where overall_score > 95 ) intersect select language_id from official_languages where country_id in ( select id from countries where overall_score < 90 ) )
select name from languages where id in ( select language_id from official_languages where country_id in ( select id from countries where overall_score > 95 ) ) and id in ( select language_id from official_languages where country_id in ( select id from countries where overall_score < 90 ) )
select country , town_city from addresses
select country , town_city from addresses
select distinct addresses.county_state_province from addresses join properties on addresses.address_id = properties.property_address_id
select distinct county_state_province from addresses
select feature_description from features where feature_name = 'rooftop'
select feature_description from features where feature_name = 'rooftop'
select features.feature_name , features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by property_features.feature_id order by count ( * ) desc limit 1
select features.feature_name , features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by property_features.feature_id order by count ( * ) desc limit 1
select min ( room_count ) from properties
select min ( room_count ) from properties
select count ( * ) from properties where parking_lots = 1 union select count ( * ) from properties
select count ( * ) from properties where parking_lots = 1 union select count ( * ) from properties where garage_yn = 1
select distinct u.age_category_code from users u join ref_user_categories rc on u.user_category_code = rc.user_category_code where rc.user_category_description like '%Mother%'
sql placeholder
select users.first_name from properties join users on properties.owner_user_id = users.user_id group by properties.owner_user_id order by count ( * ) desc limit 1
select users.first_name from properties join users on properties.owner_user_id = users.user_id group by properties.owner_user_id order by count ( * ) desc limit 1
sql placeholder
select avg ( properties.room_count ) from properties join property_features on properties.property_id = property_features.property_id join features on property_features.feature_id = features.feature_id where property_features.property_feature_description = 'garden'
select distinct addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id join property_features on properties.property_id = property_features.property_id join features on property_features.feature_id = features.feature_id where features.feature_name = 'swimming pool'
select distinct addresses.town_city from addresses inner join properties on addresses.address_id = properties.property_address_id where properties.property_name = 'swimming_pool'
select property_id , price_min from properties where vendor_requested_price = ( select min ( vendor_requested_price ) from properties )
select property_id , vendor_requested_price from properties where vendor_requested_price = ( select min ( vendor_requested_price ) from properties )
select avg ( room_count ) from properties
select avg ( room_count ) from properties
select count ( distinct room_size ) from rooms
select count ( distinct room_size ) from rooms
select user_id , search_string from user_searches group by user_id having count ( * ) >= 2
select user_id , search_seq from user_searches group by user_id having count ( * ) >= 2
select max ( search_datetime ) from user_searches
select max ( search_datetime ) from user_searches
select search_datetime , search_string from user_searches order by search_string desc
select search_string , search_datetime from user_searches order by search_string desc
select distinct zip_postcode from addresses where address_id not in ( select properties.property_address_id from properties join users on properties.owner_user_id = users.user_id group by properties.owner_user_id having count ( * ) <= 2 )
select distinct zip_postcode from addresses where address_id not in ( select property_address_id from properties group by property_address_id having count ( property_id ) <= 2 )
select users.user_id , users.user_category_code from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) = 1
select users.user_id , users.user_category_code from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) = 1
select age_category_code from users where user_id = ( select user_id from user_searches order by search_datetime asc limit 1 )
select users.age_category_code from user_searches join users on user_searches.user_id = users.user_id order by user_searches.search_datetime asc limit 1
select login_name from users where age_category_code = 'Senior' order by first_name asc
select login_name from users where age_category_code = 'Senior' order by first_name asc
select count ( * ) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 'Y'
select count ( * ) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 'Y'
select date_registered from users where login_name = 'ratione'
select date_registered from users where login_name = 'ratione'
select first_name , middle_name , last_name , login_name from users where is_seller = 1
select first_name , middle_name , last_name , login_name from users where is_seller = 'Y'
sql placeholder
select addresses.line_1_number_building , addresses.line_2_number_street , addresses.town_city from addresses join users on addresses.address_id = users.user_address_id where users.age_category_code = 'Senior'
select count ( distinct properties.property_id ) from properties join property_features on properties.property_id = property_features.property_id group by properties.property_id having count ( distinct property_features.feature_id ) >= 2
select count ( distinct properties.property_id ) from properties join property_features on properties.property_id = property_features.property_id group by properties.property_id having count ( distinct property_features.feature_id ) >= 2
select properties.property_id , count ( * ) from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select count ( * ) , properties.property_id from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select properties.owner_user_id , count ( * ) from properties join property_photos on properties.property_id = property_photos.property_id group by properties.owner_user_id
select properties.owner_user_id , count ( * ) from properties join property_photos on properties.property_id = property_photos.property_id group by properties.owner_user_id
select sum ( price_max ) from properties join users on properties.owner_user_id = users.user_id where users.age_category_code = 'Single Mother' or users.age_category_code = 'Student'
select sum ( price_max ) from properties join users on properties.owner_user_id = users.user_id where users.age_category_code = 'Single Mother' or users.age_category_code = 'Student'
select user_property_history.datestamp , properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp asc
select user_property_history.datestamp , properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp asc
select ref_property_types.property_type_description , properties.property_type_code from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code group by properties.property_type_code order by count ( * ) desc limit 1
select property_type_description , property_type_code from ref_property_types where exists ( select 1 from properties where properties.property_type_code = ref_property_types.property_type_code group by property_type_code order by count ( * ) desc limit 1 )
select age_category_description from ref_age_categories where age_category_code = 'Over 60'
select age_category_description from ref_age_categories where age_category_code = 'Over 60'
select room_size , count ( * ) from rooms group by room_size
select room_size , count ( * ) from rooms group by room_size
select addresses.country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = 'Robbie'
select addresses.country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = 'Robbie'
select first_name , middle_name , last_name from users where user_id in ( select owner_user_id from properties )
sql placeholder
select search_string from user_searches where user_id not in ( select user_id from properties )
select search_string from user_searches where user_id not in ( select owner_user_id from properties )
select users.last_name , users.user_id from users join user_property_history on users.user_id = user_property_history.user_id group by users.user_id having count ( * ) >= 2 and count ( * ) <= 2
select users.last_name , users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) <= 2 intersect select users.last_name , users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count ( * ) >= 2
select count ( * ) from bike where weight > 780
select product_name , weight from bike order by price asc
select heat , name , nation from cyclist
select max ( weight ) , min ( weight ) from bike
select avg ( price ) from bike where material = 'Carbon CC'
select name , result from cyclist where nation != 'Russia'
select distinct bike.id , bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id where cyclists_own_bikes.purchase_year > 2015
select bike.id , bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id group by bike.id having count ( * ) >= 4
select cyclist.id , cyclist.name from cyclists_own_bikes join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id group by cyclists_own_bikes.cyclist_id order by count ( * ) desc limit 1
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.nation = 'Russia' or cyclist.nation = 'Great Britain'
select count ( distinct heat ) from cyclist
select count ( * ) from cyclist where id not in ( select cyclist_id from cyclists_own_bikes where purchase_year > 2015 )
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.result > '4:21.558'
select bike.product_name , bike.price from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.name = 'Bradley Wiggins' intersect select bike.product_name , bike.price from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.name = 'Antonio Tauler'
select name , nation , result from cyclist where id not in ( select cyclist_id from cyclists_own_bikes )
select product_name from bike where material like '%fiber%'
select cyclist.id , count ( * ) from cyclists_own_bikes join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id group by cyclist.id order by cyclist.id asc
select g.flavor , g.price from goods g where g.price = ( select max ( price ) from goods )
select id , flavor from goods where price = ( select max ( price ) from goods )
select flavor , price from goods where price = ( select min ( price ) from goods where flavor = 'cookie' )
select id , flavor from goods where price = ( select min ( price ) from goods where food = 'cookie' )
select id from goods where flavor = 'Apple'
select id from goods where flavor = 'Apple'
select id from goods where price < 3
select id from goods where price < 3
sql placeholder
sql placeholder
sql placeholder
sql placeholder
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count ( * ) >= 15
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count ( * ) >= 15
sql placeholder
sql placeholder
select count ( distinct flavor ) from goods where food = 'Cake'
select count ( distinct g.flavor ) from goods g where g.id in ( select item from items g where g.id = g.id )
select distinct flavor from goods where food = 'Croissant'
select distinct flavor from goods where food = 'croissant'
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on receipts.customerid = customers.id where customers.firstname = 'James' and customers.lastname = 'Smith'
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber join customers on customers.id = receipts.customerid where customers.firstname = '15' and customers.lastname = ''
select food , avg ( price ) , max ( price ) , min ( price ) from goods group by food
select avg ( price ) , min ( price ) , max ( price ) , food from goods group by food
select receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt where items.item = 'Cake' intersect select receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt where items.item = 'Cookie'
sql placeholder
sql placeholder
select receipts.receiptnumber from customers join receipts on customers.id = receipts.customerid join items on receipts.receiptnumber = items.receipt where customers.lastname = 'Logan' and items.item = 'croissant'
select receipts.receiptnumber , receipts.date from receipts join items on receipts.receiptnumber = items.receipt where items.item = ( select max ( price ) from goods )
select receipts.receiptnumber , receipts.date from receipts join items on receipts.receiptnumber = items.receipt where items.item = ( select max ( price ) from goods )
select item from ( select item , count ( receipt ) as cnt from items group by item ) where cnt = ( select min ( cnt ) from ( select count ( receipt ) as cnt from items group by item ) )
select item from items group by item order by count ( * ) asc limit 1
select food , count ( * ) from goods group by food
select food , count ( * ) from goods group by food
select food , avg ( price ) from goods group by food
select food , avg ( price ) from goods group by food
select id from goods where flavor = 'Apricot' and price < 5
select id from goods where flavor = 'Apricot' and price < 5
select flavor from goods where price > 10
select flavor from goods where price > 10
select distinct id , price from goods where price < ( select avg ( price ) from goods )
select distinct id , price from goods where price < ( select avg ( price ) from goods )
select distinct id from goods where price < ( select max ( price ) from goods where flavor = 'Tart' )
select distinct id from goods where price < ( select min ( price ) from goods where flavor = 'Tart' )
select distinct receipts.receiptnumber from receipts join goods on receipts.receiptnumber = goods.id where goods.price > 13
select distinct receipts.receiptnumber from receipts join items on receipts.receiptnumber = items.receipt join goods on items.item = goods.id where goods.price > 13
sql placeholder
select receipts.date from receipts join items on receipts.receiptnumber = items.receipt join customers on customers.id = receipts.customerid join goods on items.item = goods.id where goods.price > 15
select id from goods where id like '%APP%'
select id from goods where id like '%APP%'
select id , price from goods where id like '%70%'
select id , price from goods where id like '%70%'
select lastname from customers order by lastname asc
select lastname from customers order by lastname asc
select id from goods order by id asc
select distinct id from goods order by id asc
sql placeholder
sql placeholder
select receipts.date from receipts where receipts.date = ( select max ( date ) from receipts )
select receiptnumber , date from receipts where date = ( select max ( date ) from receipts )
sql placeholder
sql placeholder
select id from goods where price between 3 and 7 and food = 'Cookie' or flavor = 'Cake'
select id from goods where price between 3 and 7 and food = 'Cookies' or flavor = 'Cake'
select customers.firstname , customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
sql placeholder
select avg ( price ) from goods where flavor = 'Blackberry' or flavor = 'Blueberry'
select avg ( price ) from goods where flavor = 'Blackberry' or flavor = 'Blueberry'
select min ( price ) from goods where flavor = 'Cheese'
select price from goods where flavor = 'Cheese' and price = ( select min ( price ) from goods where flavor = 'Cheese' )
select max ( price ) , avg ( price ) , min ( price ) , flavor from goods group by flavor order by flavor asc
select max ( price ) , min ( price ) , avg ( price ) , flavor from goods group by flavor order by flavor asc
select min ( price ) , max ( price ) , food from goods group by food order by food asc
select min ( price ) , max ( price ) from goods where food = 'food' order by food asc
select date from receipts group by date order by count ( * ) desc limit 3
select date from receipts group by date order by count ( * ) desc limit 3
select customers.firstname , customers.lastname , count ( * ) from customers join receipts on customers.id = receipts.customerid group by customers.id order by count ( * ) desc limit 1
select customers.id , count ( * ) from receipts join customers on receipts.customerid = customers.id group by customers.id order by count ( * ) desc limit 1
select date , count ( distinct customers.id ) from receipts join customers on receipts.customerid = customers.id group by date
select receipts.date , count ( * ) from receipts join customers on receipts.customerid = customers.id group by receipts.date
sql placeholder
sql placeholder
select id from goods where price < ( select min ( price ) from goods where food = 'Cookie' )
select id from goods where price < ( select min ( price ) from goods where food = 'croissant' )
sql placeholder
select id from goods where price >= ( select avg ( price ) from goods )
select id from goods where price > ( select avg ( price ) from goods )
select id from goods where price > ( select avg ( price ) from goods )
select id , flavor , food from goods order by price asc
select id , flavor , food from goods order by price asc
select id , flavor from goods where flavor = 'Cake' order by flavor asc
select id , flavor from goods where flavor = 'Cake' order by flavor asc
select items.item from items join goods on items.item = goods.id where goods.flavor like 'chocolate' except select items.item from items join goods on items.item = goods.id group by items.item having count ( items.receipt ) > 10
select items.item from items join goods on items.item = goods.id where goods.flavor = 'Chocolate' group by items.item having count ( items.receipt ) <= 10
select flavor from goods where food = 'Cake' except select flavor from goods where food = 'Tart'
select flavor from goods where food = 'Cake' except select flavor from goods where food = 'Tart'
select food from goods group by flavor order by count ( * ) desc limit 3
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
select make , count ( * ) from driver where points > 150 group by make
select avg ( age ) , make from driver group by make
select avg ( age ) , make from driver group by make
select avg ( laps ) from driver where age < 20
select avg ( laps ) from driver where age < 20
select manager , sponsor from team order by car_owner asc
select manager , sponsor from team order by car_owner asc
select make from team group by make having count ( * ) > 1
select make from team group by make having count ( * ) > 1
select make from team where car_owner = 'Buddy Arrington'
select make from team where car_owner = 'Buddy Arrington'
select max ( points ) , min ( points ) from driver
select max ( points ) , min ( points ) from driver
select count ( * ) from driver where points < 150
select count ( * ) from driver where points < 150
select driver from driver order by age asc
select driver from driver order by age asc
select driver from driver order by points desc
select driver from driver order by points desc
select driver , country from driver
select driver , country from driver
select max ( points ) from driver join country on driver.country = country.country where country.capital = 'Dublin'
select max ( driver.points ) from country join driver on country.country_id = driver.country where country.capital = 'Dublin'
select avg ( age ) from country join driver on country.country_id = driver.country where country.official_native_language = 'English'
select avg ( age ) from country join driver on country.country_id = driver.country where country.official_native_language = 'English'
select distinct country.country from country join driver on country.country_id = driver.country where driver.points > 150
select distinct country.country from driver join country on driver.driver_id = country.country_id where driver.points > 150
select country.capital from country join driver on country.country_id = driver.country where driver.points = ( select max ( points ) from driver ) order by driver.points desc limit 1
select country.capital from country join driver on country.country_id = driver.country order by driver.points desc limit 1
select make , count ( * ) from driver group by make
select make , count ( * ) from driver group by make
select make from driver group by make having count ( make ) = ( select max ( count ) from ( select count ( make ) as count from driver group by make ) )
select make from driver group by make order by count ( * ) desc limit 1
select make from driver group by make having count ( * ) >= 3
select make from driver group by make having count ( * ) >= 3
select team from team where team_id not in ( select team_id from team_driver )
select team from team where team_id not in ( select team_id from team_driver )
select country from driver where make = 'Dodge' intersect select country from driver where make = 'Chevrolet'
select country.country from driver join country on driver.driver_id = country.country_id where driver.make = 'Dodge' intersect select country.country from driver join country on driver.driver_id = country.country_id where driver.make = 'Chevrolet'
select sum ( points ) , avg ( points ) from driver
select sum ( points ) , avg ( points ) from driver
select country from country except select country from driver
select country from country except select country from driver
select team.manager , team.sponsor from team join ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( driver_count ) from ( select count ( driver_id ) as driver_count from team_driver group by team_id ) ) ) as maxdrivers on team.team_id = maxdrivers.team_id
select team.manager , team.sponsor from team join ( select team_id from team_driver group by team_id having count ( driver_id ) = ( select max ( driver_count ) from ( select count ( driver_id ) as driver_count from team_driver group by team_id ) ) ) as maxdrivers on team.team_id = maxdrivers.team_id
select team.manager , team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team_driver.team_id having count ( * ) >= 2
select team.manager , team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team.team_id having count ( * ) >= 2
select count ( * ) from institution
select count ( * ) from institution
select name from institution order by name asc
select name from institution order by name asc
select name from institution order by founded asc
select name from institution order by founded asc
select city , province from institution
select city , province from institution
select max ( enrollment ) , min ( enrollment ) from institution
select max ( enrollment ) , min ( enrollment ) from institution
select affiliation from institution where city != 'Vancouver'
select affiliation from institution where city != 'Vancouver'
select stadium from institution order by capacity desc
select stadium from institution order by capacity desc
select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
select stadium from institution where enrollment = ( select max ( enrollment ) from institution )
sql placeholder
select institution.name , championship.nickname from institution join championship on institution.institution_id = championship.institution_id
select name from institution where enrollment = ( select min ( enrollment ) from institution )
select championship.nickname from championship join institution on championship.institution_id = institution.institution_id where institution.enrollment = ( select min ( enrollment ) from institution )
select institution.name from institution join championship on institution.institution_id = championship.institution_id order by number_of_championships desc
select institution.name from institution join championship on institution.institution_id = championship.institution_id order by number_of_championships desc
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count ( * ) >= 1
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count ( * ) >= 1
select total ( championship.number_of_championships ) from championship join institution on championship.institution_id = institution.institution_id where institution.affiliation = 'Public'
select total ( championship.number_of_championships ) from institution join championship on institution.institution_id = championship.institution_id where institution.affiliation = 'Public'
select affiliation , count ( * ) from institution group by affiliation
select affiliation , count ( * ) from institution group by affiliation
select affiliation from institution group by affiliation having count ( affiliation ) = ( select max ( cnt ) from ( select count ( affiliation ) as cnt from institution group by affiliation ) )
select affiliation from institution group by affiliation order by count ( * ) desc limit 1
select founded from institution group by founded having count ( * ) > 1
select founded , count ( * ) from institution group by founded having count ( * ) > 1
select c.nickname from championship c join institution i on c.institution_id = i.institution_id order by i.capacity desc
select c.nickname from championship c join institution i on c.institution_id = i.institution_id order by i.capacity desc
select sum ( enrollment ) from institution where city = 'Vancouver' or city = 'Calgary'
select enrollment from institution where city = 'Vancouver' or city = 'Calgary'
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select count ( distinct province ) from institution
select count ( distinct province ) from institution
select * from warehouses
select * from warehouses
select distinct boxes.contents from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'New York'
select distinct contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select contents from boxes where value > 150
select contents from boxes where value > 150
select warehouse , avg ( value ) from boxes group by warehouse
select avg ( value ) , warehouse from boxes group by warehouse
select avg ( value ) , sum ( value ) from boxes
select avg ( value ) , sum ( value ) from boxes
select avg ( capacity ) , sum ( capacity ) from warehouses
select avg ( capacity ) , sum ( capacity ) from warehouses
select contents , avg ( value ) , max ( value ) from boxes group by contents
select contents , avg ( value ) , max ( value ) from boxes group by contents
select contents from boxes group by contents order by sum ( value ) desc limit 1
select contents from boxes group by contents order by sum ( value ) desc limit 1
select avg ( value ) from boxes
select avg ( value ) from boxes
select distinct contents from boxes
select distinct contents from boxes
select count ( distinct contents ) from boxes
select count ( distinct contents ) from boxes
select distinct location from warehouses
select distinct location from warehouses
select code from boxes where warehouse in ( select code from warehouses where location in ( 'Chicago' , 'New York' ) )
select boxes.code from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago' or warehouses.location = 'New York'
select sum ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago' or warehouses.location = 'New York'
select sum ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' or warehouses.location = 'New York'
select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' intersect select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' intersect select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'New York'
select distinct contents from boxes where warehouse not in ( select code from warehouses where location = 'New York' )
select contents from boxes where warehouse not in ( select code from warehouses where location = 'New York' )
select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks' except select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Scissors'
select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks' except select distinct warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Scissors'
select distinct warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = 'Rocks' or boxes.contents = 'Scissors'
select distinct warehouse from boxes where contents = 'Rocks' or contents = 'Scissors'
select warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks and Scissors'
select warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks' and boxes.contents = 'Scissors'
select code , contents from boxes order by value asc
select code , contents from boxes order by value asc
select code , contents from boxes where value = ( select min ( value ) from boxes )
select code , contents from boxes where value = ( select min ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes where value > ( select avg ( value ) from boxes )
select distinct contents from boxes order by contents asc
select distinct contents from boxes order by contents asc
select code from boxes where value > ( select max ( value ) from boxes where contents = 'Rocks' )
select code from boxes where value > ( select max ( value ) from boxes where contents = 'Rocks' )
select code , contents from boxes where value > ( select max ( value ) from boxes where contents = 'Scissors' )
select b.code , b.contents from boxes b where b.value > ( select max ( value ) from boxes where contents = 'Scissors' )
select sum ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.capacity = ( select max ( capacity ) from warehouses )
select sum ( boxes.value ) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.capacity = ( select max ( capacity ) from warehouses )
select warehouse , avg ( value ) from boxes group by warehouse having avg ( value ) > 150
select avg ( value ) , warehouse from boxes group by warehouse having avg ( value ) > 150
select contents , sum ( value ) , count ( * ) from boxes group by contents
select contents , sum ( value ) , count ( * ) from boxes group by contents
select sum ( capacity ) , avg ( capacity ) , max ( capacity ) , location from warehouses group by location
select sum ( capacity ) , avg ( capacity ) , max ( capacity ) , location from warehouses group by location
select sum ( capacity ) from warehouses
select sum ( capacity ) from warehouses
select warehouses.location , max ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.location
select warehouses.location , max ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse group by warehouses.location
select warehouses.code , count ( * ) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouse , count ( * ) from boxes group by warehouse
select count ( distinct warehouses.location ) from warehouses join boxes on warehouses.code = boxes.warehouse where boxes.contents = 'Rocks'
select count ( distinct warehouse ) from boxes where contents = 'Rocks'
select boxes.code , warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse
select boxes.code , warehouses.location from warehouses join boxes on warehouses.code = boxes.warehouse
select boxes.warehouse from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago'
select boxes.code from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location = 'Chicago'
select warehouse , count ( * ) from boxes group by warehouse
select warehouse , count ( * ) from boxes group by warehouse
select count ( distinct contents ) , warehouse from boxes group by warehouse
select count ( distinct contents ) , warehouse from boxes group by warehouse
select code from warehouses where capacity > 0
sql placeholder
select sum ( value ) from boxes where warehouse not in ( select code from warehouses where location = 'Chicago' )
select sum ( boxes.value ) from warehouses join boxes on warehouses.code = boxes.warehouse where warehouses.location != 'Chicago'
select university_name , city , state from university order by university_name asc
select university_name , city , state from university order by university_name asc
select count ( * ) from university where state = 'IL' or state = 'OH'
select count ( * ) from university where state = 'IL' or state = 'OH'
select max ( enrollment ) , avg ( enrollment ) , min ( enrollment ) from university
select max ( enrollment ) , avg ( enrollment ) , min ( enrollment ) from university
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select team_name from university where enrollment > ( select avg ( enrollment ) from university )
select home_conference from university
select distinct home_conference from university
select home_conference , count ( * ) from university group by home_conference
select home_conference , count ( * ) from university group by home_conference
select state from university group by state having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from university group by state ) )
select state from university group by state having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from university group by state ) )
select home_conference from university group by home_conference having avg ( enrollment ) > 2000
select home_conference from university group by home_conference having avg ( enrollment ) > 2000
select home_conference from university group by home_conference order by sum ( enrollment ) asc limit 1
select home_conference from university where enrollment = ( select min ( enrollment ) from university )
select major_name , major_code from major order by major_code asc
select major_name , major_code from major order by major_code asc
select major.major_name , major_ranking.rank from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where university.university_name = 'Augustana College'
select major_ranking.rank , major.major_name from major_ranking join major on major_ranking.major_id = major.major_id join university on major_ranking.university_id = university.university_id where university.university_name = 'Augustana College'
sql placeholder
select university_name , city , state from university where university_id in ( select university_id from major_ranking where major_id = ( select max ( rank ) from major_ranking where major_id = 'Accounting' ) )
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id where major_ranking.rank = 1 group by university.university_id order by count ( * ) desc limit 1
select university_name from university where university_id in ( select university_id from major_ranking where rank = 1 group by university_id order by count ( major_id ) desc limit 1 )
select university_name from university where university_id not in ( select university_id from major_ranking where rank = 1 )
select university_name from university where university_id not in ( select university_id from major_ranking where rank = 1 )
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = 'Accounting' intersect select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = 'Urban Education'
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = 'Accounting' intersect select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = 'Urban Education'
select university.university_name , overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where university.state = 'Wisconsin'
select university.university_name , overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where state = 'Wisconsin'
select university_name from university where university_id in ( select university_id from overall_ranking order by research_point desc limit 1 )
select university_name from university where university_id in ( select university_id from overall_ranking group by university_id having sum ( research_point ) = ( select max ( total ) from ( select sum ( research_point ) as total from overall_ranking group by university_id ) ) )
select university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point asc
select university_name from university where university_id in ( select university_id from overall_ranking order by reputation_point asc )
select university_name from university where university_id in ( select university_id from major_ranking where major_id in ( select major_id from major where rank >= 3 ) )
select university_name from university where university_id in ( select university_id from major_ranking where major_id in ( select major_id from major where rank >= 3 ) )
select sum ( enrollment ) from university where university_id in ( select university_id from overall_ranking where rank <= 5 )
select total ( enrollment ) from university where university_id in ( select university_id from overall_ranking where rank <= 5 )
select university.university_name , overall_ranking.citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.reputation_point >= 3
select university.university_name , overall_ranking.citation_point from overall_ranking join university on overall_ranking.university_id = university.university_id order by overall_ranking.reputation_point desc limit 3
select state from university where enrollment < 3000 group by state having count ( * ) > 2
select state from university where enrollment < 3000 group by state having count ( * ) > 2
select title from movies where rating = 'null'
select title from movies where rating not in ( select rating from movies )
select title from movies where rating = 'G'
select title from movies where rating = 'G'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon'
select movies.title , movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie
select movies.title , movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie
select count ( * ) from movies where rating = 'G'
select count ( * ) from movies where rating = 'G'
select count ( * ) from movietheaters
select count ( * ) from movietheaters
select count ( distinct movie ) from movietheaters
select count ( distinct movie ) from movietheaters
select count ( distinct code ) from movietheaters
select count ( distinct code ) from movietheaters
select rating from movies where title like '%Citizen%'
select rating from movies where title like '%Citizen%'
select distinct movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie where movies.rating = 'G' or movies.rating = 'PG'
select movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie where movies.rating = 'G' or movies.rating = 'PG'
select distinct movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' or movietheaters.name = 'Imperial'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' or movietheaters.name = 'Imperial'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' intersect select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Imperial'
select movie from movietheaters where name = 'Odeon' intersect select movie from movietheaters where name = 'Imperial'
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies where code not in ( select movie from movietheaters where name = 'Odeon' )
select title from movies order by title asc
select title from movies order by title asc
select title from movies order by rating asc
select title from movies order by rating asc
select movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie group by movietheaters.name order by count ( * ) desc limit 1
select name from movietheaters group by name order by count ( * ) desc limit 1
select movies.title from movies join movietheaters on movies.code = movietheaters.movie group by movietheaters.movie order by count ( * ) desc limit 1
select movies.title from movies join movietheaters on movies.code = movietheaters.movie group by movietheaters.movie order by count ( * ) desc limit 1
select rating , count ( * ) from movies group by rating
select rating , count ( * ) from movies group by rating
select count ( * ) from movies where rating != 'null'
select count ( * ) from movies where rating != 'null'
select name from movietheaters where movie = ( select code from movies )
select name from movietheaters group by name having count ( * ) >= 1
select name from movietheaters where code not in ( select code from movietheaters )
select name from movietheaters where code not in ( select code from movietheaters )
select movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie where movies.rating = 'G'
select movietheaters.name from movies join movietheaters on movies.code = movietheaters.movie where movies.rating = 'G'
select title from movies
select title from movies
select distinct rating from movies
select distinct rating from movies
select * from movies where rating = 'null'
select * from movies where rating = 'null'
select title from movies where code not in ( select movie from movietheaters )
select title from movies where code not in ( select movie from movietheaters )
select recipient from package where weight = ( select max ( weight ) from package )
select client.name from client join package on client.accountnumber = package.recipient order by package.weight desc limit 1
select sum ( package.weight ) from client join package on client.accountnumber = package.sender where client.name = 'Leo Wong'
select sum ( weight ) from employee join package on employee.employeeid = package.sender where employee.name = 'Leo Wong'
select position from employee where name = 'Amy Wong'
select position from employee where name = 'Amy Wong'
select salary , position from employee where name = 'Turanga Leela'
select salary , position from employee where name = 'Turanga Leela'
select avg ( salary ) from employee where position = 'intern'
select avg ( salary ) from employee where position = 'intern'
select level from has_clearance where level = 'Physician'
select level from has_clearance join employee on has_clearance.employee = employee.employeeid where employee.name = 'Physician'
select packagenumber from package where sender = 'Leo Wong'
select count ( * ) from employee join package on employee.employeeid = package.sender where employee.name = 'Leo Wong'
select packagenumber from package join client on package.recipient = client.accountnumber where client.name = 'Leo Wong'
select packagenumber from package join client on package.recipient = client.accountnumber where client.name = 'Leo Wong'
select package.contents from client join package on client.accountnumber = package.sender where client.name = 'Leo Wong'
select distinct packagenumber from employee join package on employee.employeeid = package.sender where employee.name = 'Leo Wong' or package.recipient = employee.employeeid
select count ( * ) from package where sender = 'Ogden Wernstrom' and recipient = 'Leo Wong'
select count ( * ) from package join client on package.sender = client.accountnumber where client.name = 'Ogden Wernstrom' and package.recipient = 'Leo Wong'
select contents from package where sender = 'John Zoidfarb'
select contents from package where sender = 'John Zoidfarb'
select p.packagenumber , p.weight from package p join client c on p.recipient = c.accountnumber where c.name like '%John%'
select packagenumber , weight from package join client on package.sender = client.accountnumber where client.name = 'John' or client.name = 'Johnny'
select packagenumber , weight from package order by weight asc limit 3
select packagenumber , weight from package order by weight asc limit 3
select client.name , count ( * ) from package join client on package.sender = client.accountnumber group by client.accountnumber order by count ( * ) desc limit 1
select client.name , count ( * ) from client join package on client.accountnumber = package.sender group by client.accountnumber order by count ( * ) desc limit 1
select client.name , count ( package.shipment ) from package join client on package.recipient = client.accountnumber group by client.accountnumber order by count ( package.shipment ) asc limit 1
select recipient , count ( * ) from package group by recipient order by count ( * ) asc limit 1
select client.name from client join package on client.accountnumber = package.sender group by package.sender having count ( * ) > 1
select client.name from client join package on client.accountnumber = package.sender group by client.accountnumber having count ( * ) > 1
select coordinates from planet where name = 'Mars'
select coordinates from planet where name = 'Mars'
select name , coordinates from planet order by name asc
select name , coordinates from planet order by name asc
select shipmentid from shipment join employee on shipment.manager = employee.employeeid where employee.name = 'Phillip J. Fry'
select shipmentid from employee join shipment on employee.employeeid = shipment.manager where employee.name = 'Phillip J Fry'
select date from shipment
select date from shipment
select shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipmentid from shipment where planet = 'Mars' and manager = 'Turanga Leela'
select s.shipmentid from shipment s join employee e on s.manager = e.employeeid join planet p on s.planet = p.planetid where p.name = 'Mars' and e.name = 'Turanga Leela'
select shipmentid from shipment where planet = 'Mars' union select shipmentid from shipment where manager = 'Turanga Leela'
select shipmentid from employee join shipment on employee.employeeid = shipment.manager where planet = 'Mars' and employee.name = 'Turanga Leela'
select planet.name , sum ( shipment.shipmentid ) from shipment join planet on shipment.planet = planet.planetid group by planet.planetid
select planet.name , count ( * ) from shipment join planet on shipment.planet = planet.planetid group by planet.planetid
select planet.name from planet join shipment on planet.planetid = shipment.planet group by planet.planetid order by count ( * ) desc limit 1
select planet.name from shipment join planet on shipment.planet = planet.planetid group by shipment.planet order by count ( * ) desc limit 1
select employee.name , count ( * ) from employee join shipment on employee.employeeid = shipment.manager group by shipment.manager
select employee.name , count ( * ) from shipment join employee on shipment.manager = employee.employeeid group by shipment.manager
select sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select sum ( package.weight ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select planet.name from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by planet.planetid
select sum ( package.weight ) , planet.name from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by planet.name
select planet.name from package join planet on package.shipment = planet.planetid group by planet.planetid having sum ( package.weight ) > 30
sql placeholder
select packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' and package.sender = 'Zapp Brannigan'
select count ( * ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where package.sender = 'Zapp Brannigan' and shipment.planet = 'Omicron Persei 8'
select count ( * ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' or package.sender = 'Zapp Brannigan'
select count ( * ) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' or package.sender = 'Zapp Brannigan'
select packagenumber , weight from package where weight between 10 and 30
select packagenumber , weight from package where weight between 10 and 30
select name from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select name from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select name from employee where employeeid in ( select employee from has_clearance where planet = 'Omega III' )
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee join planet on has_clearance.planet = planet.planetid where planet.name = 'Omega III'
select planet.name from planet join has_clearance on planet.planetid = has_clearance.planet group by has_clearance.planet having count ( * ) = 1
select name from planet where planetid in ( select planet from has_clearance group by planet having count ( distinct employee ) = 1 )
select name from employee where salary between 5000 and 10000
select name from employee where salary between 5000 and 10000
select name from employee where salary > ( select avg ( salary ) from employee ) or salary > 5000
select name from employee where salary > ( select avg ( salary ) from employee ) or salary > 5000
select count ( * ) from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select count ( * ) from employee where employeeid not in ( select employee from has_clearance where planet = 'Mars' )
select count ( * ) from game
select count ( * ) from game
select title , developers from game order by units_sold_millions desc
select title , developers from game order by units_sold_millions desc
select avg ( units_sold_millions ) from game where developers != 'Nintendo'
select avg ( units_sold_millions ) from game where developers != 'Nintendo'
select platform_name , market_district from platform
select platform_name , market_district from platform
select platform_name , platform_id from platform where download_rank = 1
select platform_name , platform_id from platform where download_rank = 1
select max ( rank_of_the_year ) , min ( rank_of_the_year ) from player
select max ( rank_of_the_year ) , min ( rank_of_the_year ) from player
select count ( * ) from player where rank_of_the_year < 3
select count ( * ) from player where rank_of_the_year <= 3
select player_name from player order by player_name asc
select player_name from player order by player_name asc
select player_name , college from player order by rank_of_the_year desc
select player_name , college from player order by rank_of_the_year desc
select player.player_name , player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = 'Super Mario World'
select player.player_name , player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = 'Super Mario World'
select distinct game.developers from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select distinct game.developers from game_player join player on game_player.player_id = player.player_id join game on game.game_id = game_player.game_id where player.college = 'Auburn'
select avg ( units_sold_millions ) from game join game_player on game.game_id = game_player.game_id join player on game_player.player_id = player.player_id where player.position = 'Guard'
select avg ( units_sold_millions ) from game join game_player on game.game_id = game_player.game_id join player on game_player.player_id = player.player_id where player.position = 'Guard'
select game.title , platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title , platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title from game join platform on game.platform_id = platform.platform_id where platform.market_district = 'Asia' or platform.market_district = 'USA'
select title from game where platform_id in ( select platform_id from platform where market_district in ( 'Asia' , 'USA' ) )
select franchise , count ( * ) from game group by franchise
select franchise , count ( * ) from game group by franchise
select franchise from game group by franchise having count ( * ) = ( select max ( cnt ) from ( select count ( * ) as cnt from game group by franchise ) )
select franchise from game group by franchise having count ( * ) = ( select max ( total ) from ( select count ( * ) as total from game group by franchise ) )
select franchise from game group by franchise having count ( * ) >= 2
select franchise from game group by franchise having count ( * ) >= 2
select player_name from player where player_id not in ( select player_id from game_player )
select player_name from player where player_id not in ( select player_id from game_player )
select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Oklahoma' intersect select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select title from game where game_id in ( select game_id from game_player where player_id in ( select player_id from player where college = 'Oklahoma' or college = 'Auburn' ) )
select distinct franchise from game
select distinct franchise from game
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select title from game where game_id not in ( select game_id from game_player join player on game_player.player_id = player.player_id where position = 'Guard' )
select name from press order by year_profits_billion desc
select name from press order by year_profits_billion desc
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select avg ( year_profits_billion ) , max ( year_profits_billion ) from press
select avg ( year_profits_billion ) , max ( year_profits_billion ) , name from press group by name
select name from press order by month_profits_billion desc limit 1
select name from press where month_profits_billion = ( select max ( month_profits_billion ) from press )
select name from press order by month_profits_billion desc limit 1
select name from press order by month_profits_billion desc limit 1
select count ( * ) from author where age < 30
select count ( * ) from author where age < 30
select avg ( age ) , gender from author group by gender
select gender , avg ( age ) from author group by gender
select count ( * ) , gender from author where age > 30 group by gender
select count ( * ) , gender from author where age > 30 group by gender
select title from book order by release_date desc
select title from book order by release_date desc
select book_series , count ( * ) from book group by book_series
select count ( * ) , book_series from book group by book_series
select title , release_date from book order by sale_amount desc limit 5
select title , release_date from book order by sale_amount desc limit 5
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select author.name from book join author on book.author_id = author.author_id where book.book_series = 'MM' intersect select author.name from book join author on book.author_id = author.author_id where book.book_series = 'LT'
select name from author where author_id in ( select author_id from book where book_series = 'MM' intersect select author_id from book where book_series = 'LT' )
select name , age from author where author_id not in ( select author_id from book )
select name from author where author_id not in ( select author_id from book )
select author.name from book join author on book.author_id = author.author_id group by book.author_id having count ( * ) > 1
select author.name from book join author on book.author_id = author.author_id group by book.author_id having count ( * ) > 1
select title , author.name , press.name from book join author on book.author_id = author.author_id join press on book.press_id = press.press_id order by book.sale_amount desc limit 3
select book.title , author.name , press.name from book join author on book.author_id = author.author_id join press on book.press_id = press.press_id order by book.sale_amount desc limit 3
select press.name , sum ( book.sale_amount ) from book join press on book.press_id = press.press_id group by press.press_id
select press.name , sum ( book.sale_amount ) from book join press on book.press_id = press.press_id group by press.press_id
select press.name , count ( * ) from book join press on book.press_id = press.press_id where book.sale_amount > 1000 group by press.name
select press.name , count ( * ) from press join book on press.press_id = book.press_id where book.sale_amount > 1000 group by press.press_id
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select name from author where author_id in ( select author_id from book where sale_amount = ( select max ( sale_amount ) from book ) )
select author.name , author.gender from book join author on book.author_id = author.author_id group by book.author_id order by count ( * ) desc limit 1
select author.name , author.gender from author join book on author.author_id = book.author_id group by author.author_id order by count ( * ) desc limit 1
select name from author where author_id not in ( select book.author_id from book join press on book.press_id = press.press_id where press.name = 'Accor' )
select name from author where author_id not in ( select book.author_id from book join press on book.press_id = press.press_id where press.name = 'Accor' )
select press.name , press.year_profits_billion from book join press on book.press_id = press.press_id group by press.press_id having count ( * ) > 2
select press.name , press.year_profits_billion from book join press on book.press_id = press.press_id group by press.press_id having count ( * ) > 2
select count ( * ) from authors
select author_name from authors
select author_name , other_details from authors
select other_details from authors where author_name = 'Addison Denesik'
select count ( * ) from documents
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_id = 4
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to Brazil'
select count ( * ) from authors join documents on authors.author_name = documents.author_name where authors.author_name = 'Era Kerluke'
select document_name , document_description from documents
select document_id , document_name from documents join authors on documents.author_name = authors.author_name where authors.author_name = 'Bianka Cummings'
select authors.author_name , documents.other_details from authors join documents on authors.author_name = documents.author_name where documents.document_name = 'Travel to China'
select authors.author_name , count ( documents.document_id ) from authors join documents on authors.author_name = documents.author_name group by authors.author_name
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count ( documents.document_id ) = ( select max ( count ) from ( select count ( document_id ) as count from documents group by author_name ) as counts )
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count ( * ) >= 2
select count ( * ) from business_processes
select next_process_id , process_name , process_description from business_processes where process_id = 9
select process_name from business_processes where next_process_id = 9
select count ( * ) from process_outcomes
select process_outcome_code , process_outcome_description from process_outcomes
select process_outcome_description from process_outcomes where process_outcome_code = 'working'
select count ( * ) from process_status
select process_status_code , process_status_description from process_status
select process_status_description from process_status where process_status_code = 'ct'
select count ( * ) from staff
select staff_id , staff_details from staff
select staff_details from staff where staff_id = 100
select count ( * ) from ref_staff_roles
select staff_role_code , staff_role_description from ref_staff_roles
select staff_role_description from ref_staff_roles where staff_role_code = 'HR'
select count ( distinct document_id ) from documents_processes
select distinct process_id from documents_processes
select document_id from documents except select document_id from documents_processes
select process_id from business_processes except select process_id from documents_processes
select process_outcomes.process_outcome_description , process_status.process_status_description from process_outcomes join documents_processes on process_outcomes.process_outcome_code = documents_processes.process_outcome_code join process_status on documents_processes.process_status_code = process_status.process_status_code where document_id = 0
select business_processes.process_name from documents join business_processes on documents.document_id = business_processes.process_id where documents.document_name = 'Travel to Brazil'
select a.process_id , count ( b.document_id ) as num_docs from documents_processes a left join staff_in_processes b on a.process_id = b.process_id left join documents d on a.document_id = d.document_id group by a.process_id
select count ( distinct s.staff_id ) from staff s join staff_in_processes sip on s.staff_id = sip.staff_id join documents_processes dp on sip.process_id = dp.process_id where dp.document_id = 0 and dp.process_id = 9
select s.staff_id , count ( distinct sip.document_id ) as num_processes from staff s left join staff_in_processes sip on s.staff_id = sip.staff_id group by s.staff_id
select staff_role_code , count ( * ) from staff_in_processes group by staff_role_code
select count ( distinct ref_staff_roles.staff_role_code ) from staff join staff_in_processes on staff.staff_id = staff_in_processes.staff_id join ref_staff_roles on staff_in_processes.staff_role_code = ref_staff_roles.staff_role_code where staff.staff_id = 3
select count ( * ) from agencies
select count ( * ) from agencies
select agency_id , agency_details from agencies
select agency_id , agency_details from agencies
select count ( * ) from clients
select count ( * ) from clients
select client_id , client_details from clients
select client_id , client_details from clients
select a.agency_id , count ( c.client_id ) from agencies a left join clients c on a.agency_id = c.agency_id group by a.agency_id
select count ( * ) , agencies.agency_id from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agency_id , client_details from clients group by agency_id order by count ( * ) desc limit 1
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count ( * ) desc limit 1
select clients.agency_id , clients.client_details from clients join agencies on clients.agency_id = agencies.agency_id group by clients.agency_id having count ( * ) >= 2
select clients.agency_id , clients.client_details from clients join agencies on clients.agency_id = agencies.agency_id group by clients.agency_id having count ( * ) >= 2
select agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = 'Mac'
select agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id where clients.client_details = 'Mac'
select clients.client_details , staff.staff_details from clients join staff on clients.agency_id = staff.agency_id
select clients.client_details , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select sic_code , count ( * ) from clients group by sic_code
select sic_code , count ( * ) from clients group by sic_code
select client_id , client_details from clients where sic_code = 'Bad'
select client_id , client_details from clients where sic_code = 'Bad'
select clients.agency_id , agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select agencies.agency_id , agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = 'Y'
select agency_id from agencies except select agency_id from clients
select agency_id from agencies except select agency_id from clients
select count ( * ) from invoices
select count ( * ) from invoices
select invoice_id , invoice_status , invoice_details from invoices join clients on invoices.client_id = clients.client_id
select invoice_id , invoice_status , invoice_details from invoices
select clients.client_id , count ( * ) from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id
select client_id , count ( * ) from invoices group by client_id
select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id group by clients.client_id order by count ( * ) desc limit 1
select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id group by clients.client_id order by count ( * ) desc limit 1
select clients.client_id from invoices join clients on invoices.client_id = clients.client_id group by clients.client_id having count ( * ) >= 2
select clients.client_id from clients join invoices on invoices.client_id = clients.client_id group by clients.client_id having count ( * ) >= 2
select invoice_status , count ( * ) from invoices group by invoice_status
select invoice_status , count ( * ) from invoices group by invoice_status
select invoice_status from invoices group by invoice_status having count ( * ) = ( select max ( count ) from ( select count ( * ) as count from invoices group by invoice_status ) )
select invoice_status from invoices group by invoice_status order by count ( * ) desc limit 1
select invoices.invoice_status , invoices.invoice_details , clients.client_id , agencies.agency_id , clients.client_details from invoices join clients on invoices.client_id = clients.client_id join agencies on clients.agency_id = agencies.agency_id
sql placeholder
select meeting_type , other_details from meetings
select meeting_type , other_details from meetings
select meeting_outcome , purpose_of_meeting from meetings
select meeting_outcome , purpose_of_meeting from meetings
select payments.invoice_id , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = 'Working'
select payments.payment_id , payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = 'Working'
select invoice_id , invoice_status from invoices where invoice_id not in ( select invoice_id from payments )
select invoice_id , invoice_status from invoices where invoice_id not in ( select invoice_id from payments )
select count ( * ) from payments
select count ( * ) from payments
select payments.payment_id , payments.invoice_id , payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id
select payment_id , invoice_id , payment_details from payments
select distinct payments.invoice_id , invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select distinct payments.invoice_id , invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select a.invoice_id , count ( b.payment_id ) as number_of_payments from invoices a left join payments b on a.invoice_id = b.invoice_id group by a.invoice_id
select invoices.invoice_id , count ( * ) from invoices join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count ( * ) desc limit 1
select invoices.invoice_id , invoices.invoice_status , invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count ( * ) desc limit 1
select count ( * ) from staff
select count ( * ) from staff
select a.agency_id , count ( s.staff_id ) from agencies a left join staff s on a.agency_id = s.agency_id group by a.agency_id
select a.agency_id , count ( s.staff_id ) from agencies a left join staff s on a.agency_id = s.agency_id group by a.agency_id
select a.agency_id , a.agency_details from agencies a , staff s where a.agency_id = s.agency_id group by a.agency_id having count ( s.staff_id ) = ( select max ( count ) from ( select count ( staff_id ) as count from staff group by agency_id ) )
select agencies.agency_id , agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count ( * ) desc limit 1
select meeting_outcome , count ( * ) from meetings group by meeting_outcome
select meeting_outcome , count ( * ) from meetings group by meeting_outcome
select clients.client_id , count ( * ) from meetings join clients on meetings.client_id = clients.client_id group by clients.client_id
select client_id , count ( * ) from meetings group by client_id
select meeting_type , count ( * ) from meetings join clients on meetings.client_id = clients.client_id group by meetings.client_id
select meeting_type , count ( * ) from meetings group by meeting_type
select meeting_id , meeting_outcome , meeting_type , clients.client_details from meetings join clients on meetings.client_id = clients.client_id
select meeting_id , meeting_outcome , meeting_type , clients.client_details from meetings join clients on meetings.client_id = clients.client_id
select m.meeting_id , count ( distinct s.staff_id ) as staff_count from meetings m left join staff_in_meetings s on m.meeting_id = s.meeting_id group by m.meeting_id
select meetings.meeting_id , count ( staff_id ) from meetings join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id group by meetings.meeting_id
select staff.staff_id , count ( * ) from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff.staff_id order by count ( * ) asc limit 1
select staff.staff_id from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff.staff_id order by count ( * ) asc limit 1
select count ( distinct staff_id ) from staff_in_meetings
select count ( distinct staff_id ) from staff_in_meetings
select count ( * ) from staff where staff_id not in ( select staff_id from staff_in_meetings )
select count ( * ) from staff where staff_id not in ( select staff_id from staff_in_meetings )
select clients.client_id , clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id
select clients.client_id , clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select clients.client_id , clients.client_details from clients join invoices on invoices.client_id = clients.client_id
select staff.staff_id , staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id where staff_in_meetings.meeting_id like '%s%'
select staff.staff_id , staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id where staff_in_meetings.meeting_id like '%s%'
select clients.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id group by clients.client_id having count ( * ) = 1 intersect select clients.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id group by clients.client_id having count ( * ) = 1
select meetings.client_id , clients.sic_code , clients.agency_id from meetings join clients on meetings.client_id = clients.client_id join invoices on invoices.client_id = clients.client_id group by meetings.client_id having count ( * ) = 1
sql placeholder
select meetings.start_date_time , meetings.end_date_time , clients.client_details , staff.staff_details from meetings join clients on meetings.client_id = clients.client_id join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id join staff on staff_in_meetings.staff_id = staff.staff_id
