select count(*) from club
select count(*) from club
select name from club order by name asc
select name from club order by name asc
select manager, captain from club
select manager, captain from club
select name from club where manufacturer!= 'Nike'
select name from club where manufacturer!= 'Nike'
select name from player order by wins_count asc
select name from player order by wins_count asc
select name from player where earnings = (select max(earnings) from player)
select name from player where earnings = (select max(earnings) from player)
select distinct country from player where earnings > 1200000
select country from player where earnings > 1200000
select p.country from player p where p.earnings = (select max(earnings) from player where wins_count > 2) and p.wins_count > 2
select country from player where wins_count > 2 group by country order by earnings desc limit 1
select player.name, club.name from club join player on club.club_id = player.club_id
select player.name, club.name from player join club on player.club_id = club.club_id
select c.name from club c where exists (select 1 from player p where p.club_id = c.club_id and p.wins_count > 2)
select club.name from club where club_id in (select club_id from player where wins_count > 2)
select player.name from club join player on club.club_id = player.club_id where club.manager = 'Sam Allardyce'
select player.name from club join player on club.club_id = player.club_id where club.manager = 'Sam Allardyce'
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg(player.earnings) desc
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg(player.earnings) desc
select manufacturer, count(*) from club group by manufacturer
select manufacturer, count(*) from club group by manufacturer
select manufacturer from club group by manufacturer having count(*)(*) = (select max(count(*)) from (select count(*)(*) from club group by manufacturer))
with desc)edmanufacturers manufacturer, desc)() over (order by count(club_id) desc) from club group by manufacturer) select manufacturer from desc)edmanufacturers where desc) = 1
select manufacturer from club group by manufacturer having count(*) > 1
select manufacturer from club group by manufacturer having count(*) > 1
select country from player group by country having count(*) > 1
select country from player group by country having count(*) > 1
select name from club where club_id not in (select club_id from player)
select name from club where club_id not in (select club_id from player)
select country from player where earnings > 1400000 intersect select country from player where earnings < 1100000
select country from player where earnings > 1400000 intersect select country from player where earnings < 1100000
select count(distinct country) from player
select count(distinct country) from player
select earnings from player where country = 'Australia' or country = 'Zimbabwe'
select earnings from player where country = 'Australia' or country = 'Zimbabwe'
select customers.customer_id, customers.customer_first_name, customers.customer_last_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.customer_id having count(*) > 2 intersect select customers.customer_id, customers.customer_first_name, customers.customer_id from customers join order_items on orders.order_id = order_id group by customers.customer_id having count(*) > 3
select customers.customer_id, customers.customer_first_name, customers.customer_last_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.customer_id having count(*) > 2 intersect select customers.customer_id, customers.customer_first_name, customers.customer_id from customers join orders on orders.order_id = 3
select orders.order_id, orders.order_status_code, count(*) from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id
select order.count(*), orders.order_status_code, orders.order_id from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id
select orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id order by date_order_placed limit 1 or count(*) > 1
select orders.date_order_placed, all_orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(order_items.order_id) > 1
select customer_first_name, customer_middle_initial, customer_last_name from customers where customer_id not in (select customer_id from orders)
select customer_first_name, customer_last_name, customer_middle_initial from customers where customer_id not in (select customer_id from orders)
select p.product_id, p.product_name, p.product_price, p.product_color from products p where p.product_id not in (select oi.product_id from order_items oi) group by p.product_id having count(oi.order_id) >= 2
select products.product_id, products.product_name, products.product_price, products.product_color from order_items join products on order_items.product_id = products.product_id group by order_items.product_id having count(*) < 2
select orders.order_id, orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) >= 2
select orders.order_id, orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) >= 2
select products.product_id, products.product_name, products.product_price from order_items join products on order_items.product_id = products.product_id group by order_items.product_id order by count(*) desc limit 1
select products.product_id, products.product_name, products.product_price from order_items join products on order_items.product_id = products.product_id group by order_items.product_id order by count(*) desc limit 1
select orders.order_id, min(product_price) from orders join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id group by orders.order_id order by sum(product_price) asc limit 1
select o.order_id, sum(o.total_cost) from orders o where o.total_cost = (select min(total_cost) from orders)
select cp.payment_method_code from customer_payment_methods cp group by cp.payment_method_code having count(cp.payment_method_code)(cp.payment_method_code) = (select max(count(payment_method_code)) from (select count(payment_method_code)(payment_method_code) from customer_payment_methods group by payment_method_code))
with popularpayment payment_method_code, count(customer_id) from customer_payment_methods group by payment_method_code) select payment_method_code from popularpayment where count(customer_id) = popularpayment max(count(customer_id)) from popularpayment)
select gender_code, count(*) from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by gender_code
select gender_code, count(*) from customers join order_items on customers.customer_id = order_items.customer_id join products on order_items.product_id = products.product_id group by gender_code
select gender_code, count(*) from orders join customers on orders.customer_id = customers.customer_id group by gender_code
select customers.gender_code, count(*) from orders join customers on orders.customer_id = customers.customer_id group by customers.gender_code
select customer_first_name, customer_middle_initial, customer_last_name, customer_payment_methods from customers
select customer_first_name, customer_middle_initial, customer_last_name, customer_payment_methods from customers
select invoices.invoice_status_code, invoices.invoice_date, shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select invoice_status_code, invoice_date, shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select products.product_name, shipments.shipment_date from products join order_items on products.product_id = order_items.product_id join shipments on order_items.shipment_id = shipments.shipment_id
select products.product_name, shipments.shipment_date from order_items join products on order_items.product_id = products.product_id join shipments on order_items.shipment_id = shipments.shipment_id
select order_items.order_item_status_code, shipments.shipment_tracking_number from order_items join shipments on order_items.order_id = shipments.order_id
select order_items.order_status_code, shipments.shipment_tracking_number from order_items join shipments on order_items.order_id = shipments.order_id
select products.product_name, products.product_color from order_items join products on order_items.product_id = products.product_id join shipment_items on shipment_items.order_id = order_items.order_id
select product_name, product_color from products where product_id in (select product_id from shipment_items)
select distinct products.product_name, products.product_price, products.product_description from orders join order_items join products on orders.order_id = order_items.order_id join customers on orders.customer_id = customers.customer_id where customers.gender_code = 'F'
select distinct products.product_name, products.product_price, products.product_description from orders join order_items join products on orders.order_id = order_items.order_id join customers on orders.customer_id = customers.customer_id where customers.gender_code = 'F'
select i.invoice_status_code from invoices i where not exists (select 1 from orders o where o.order_id = s.order_id)
select invoices.invoice_status_code from orders join shipments on orders.order_id = shipments.order_id where shipments.shipment_date is null
select order_id, date_order_placed, sum(total_cost) from orders
select o.order_id, o.date_order_placed, sum(o.invoice_number) from orders o left join shipments s on o.order_id = s.order_id group by o.order_id, o.date_order_placed
select count(distinct customer_id) from orders
select count(distinct customer_id) from orders
select count(distinct order_item_status_code) from orders
select count(distinct order_item_status_code) from order_items
select count(distinct payment_method_code) from customer_payment_methods
select count(distinct payment_method_code) from customer_payment_methods
select login_name, login_password from customers where phone_number like '%plus12%'
select login_name, login_password from customers where phone_number like '%12%'
select product_size from products where product_name like '%dell%'
select product_size from products where product_name like '%dell%'
select product_price, product_size from products where product_price > (select avg(product_price) from products)
select product_price, product_size from products where product_price > (select avg(product_price) from products)
select count(*) from products where product_id not in ( select product_id from order_items )
select count(*) from products where product_id not in ( select product_id from order_items )
select count(*) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select count(*) from customers where customer_id not in ( select customer_id from customer_payment_methods )
select order_status_code, date_order_placed from orders
select order_status_code, date_order_placed from orders
select address_line_1, town_city, county from customers where country = 'USA'
select address_line_1, town_city, county from customers where country = 'USA'
select distinct customers.customer_first_name, products.product_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id
select customers.customer_first_name, products.product_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id
select count(distinct item_id) from shipments
select count(distinct s.product_id) from shipments s join order_items oi on s.shipment_id = oi.order_id where oi.product_id = s.product_id
select avg(product_price) from products
select avg(product_price) from products
select avg(product_price) from products where product_id in (select product_id from order_items)
select avg(product_price) from products where product_id in (select product_id from order_items)
select email_address, town_city, county from customers group by gender_code order by count(*) asc limit 1
select email_address, town_city, county from customers where customer_id in (select customer_id from orders where gender_code = 'M' group by customer_id having count(*) = (select min(count(*)) from (select count(*) from orders group by gender_code)))
select distinct o.date_order_placed from orders o join customer_payment_methods cpm on o.customer_id = cpm.customer_id group by o.customer_id having count(distinct cpm.payment_method_code) >= 2
select distinct o.date_order_placed from orders o join customer_payment_methods cpm on o.customer_id = cpm.customer_id group by o.customer_id having count(distinct cpm.payment_method_code) >= 2
select order_status_code from orders group by order_status_code having count(*)(*) = (select max(count(*)) from (select count(*)(*) from orders group by order_status_code)s)
select order_status_code from orders group by order_status_code order by count(*) asc limit 1
select product_id, product_description from products where product_id in (select product_id from order_items group by product_id having count(*) > 3)
select order_items.product_id, products.product_description from order_items join products on order_items.product_id = products.product_id group by order_items.product_id having count(*) > 3
select invoices.invoice_date, shipments.shipment_id from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count(*) >= 2
select invoices.invoice_date, shipments.invoice_id from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count(*) >= 2
select shipment_tracking_number, shipment_date from shipments
select shipment_tracking_number, shipment_date from shipments
select product_color, product_description, product_size from products where product_price < (select max(product_price) from products)
select product_color, product_description, product_size from products where product_price iarnă between (select max(product_price) from products)
select name from director where age > (select avg(age) from director)
select name from director where age = (select max(age) from director)
select count(*) from channel where internet like '%bbc%'
select count(distinct digital_terrestrial_channel) from channel
select title from program order by start_year desc
select director.name from director join program on director.director_id = program.director_id group by program.director_id order by count(*) desc limit 1
select director.name, director.age from director join program on director.director_id = program.director_id group by program.director_id order by count(*) desc limit 1
select title from program order by start_year desc limit 1
select channel.name, channel.internet from channel join program on channel.channel_id = program.channel_id group by program.channel_id having count(*) > 1
select channel.name, count(*) from channel join program on channel.channel_id = program.channel_id group by channel.channel_id
select count(*) from channel where channel_id not in (select channel_id from program)
select director.name from director join director_admin on director.director_id = director_admin.director_id join program on director_admin.program_id = program.program_id where program.title = 'Dracula'
select channel.name, channel.internet from channel join director_admin on channel.channel_id = director_admin.channel_id group by director_admin.channel_id order by count(*) desc limit 1
select name from director where age between 30 and 60
select name from channel where channel_id in (select channel_id from director_admin where director_id in (select director_id from director where age < 40) intersect select channel_id from director_admin where age > 60)
select channel.channel_id, channel.name from channel where channel.channel_id not in (select channel_id from director_admin where director_id = (select director_id from director where name = 'Hank Baskett'))
select count(*) from radio
select transmitter from radio order by erp_kw asc
select tv_show_name, original_airdate from tv_show
select station_name from city_channel where affiliation!= 'ABC'
select transmitter from radio where erp_kw > 150 or erp_kw < 30
select transmitter from radio where erp_kw = (select max(erp_kw) from radio)
select avg(erp_kw) from radio
select affiliation, count(*) from city_channel group by affiliation
select affiliation from city_channel group by affiliation having count(*)(*) = (select max(count(*)) from (select count(*)(*) from city_channel group by affiliation))
select affiliation from city_channel group by affiliation having count(*) > 3
select city, station_name from city_channel order by station_name asc
select radio.transmitter, city_channel.city from city_channel_radio join radio on city_channel_radio.radio_id = radio.radio_id join city_channel_channel on city_channel_radio.city_channel_id = city_channel_radio.city_channel_id
select transmitter, station_name from city_channel where id in (select radio_id from radio order by erp_kw desc)
select radio.transmitter, count(city_channel.city_channel_id) from radio left join city_channel_radio on radio.radio_id = city_channel_radio.radio_id left join city_channel_channel on city_channel_radio.city_channel_id = city_channel_radio.city_channel_id group by radio.radio_id
select distinct transmitter from radio where radio_id not in (select radio_id from city_channel_radio)
select model from vehicle where power > 6000 and top_speed = (select max(top_speed) from vehicle)
select model from vehicle where power > 6000 order by top_speed desc limit 1
select name from driver where citizenship = 'United States'
select name from driver where citizenship = 'USA'
select max(count(vehicle_id)) from vehicle_driver group by driver_id
select driver.driver_id, count(*) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id group by driver.driver_id order by count(*) desc limit 1
select max(power), avg(power) from vehicle where builder = 'Zhuzhou'
select max(power), avg(power) from vehicle where builder = 'Zhuzhou'
select vd.vehicle_id from vehicle_driver vd group by vd.vehicle_id having count(vd.vehicle_id)(vd.vehicle_id) = (select min(count(vehicle_id)) from (select count(vehicle_id)(vehicle_id) from vehicle_driver group by vehicle_driver)
select vehicle_id from vehicle_driver group by vehicle_id having count(vehicle_id)(vehicle_id) = (select min(count(vehicle_id)) from (select count(vehicle_id)(vehicle_id) from vehicle_driver group by vehicle_id))
select top_speed, power from vehicle where build_year = 1996
select top_speed, power from vehicle where build_year = 1996
select build_year, model, builder from vehicle
select build_year, model, builder from vehicle
select count(distinct driver_id) from vehicle_driver where vehicle_id in (select vehicle_id from vehicle where build_year = 2012)
select count(distinct driver_id) from vehicle_driver where vehicle_id in (select vehicle_id from vehicle where build_year = 2012)
select count(*) from driver where racing_series = 'Nascar'
select count(*) from driver where racing_series = 'Nascar'
select avg(top_speed) from vehicle
select avg(top_speed) from vehicle
select distinct driver.name from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.power > 5000
select driver.name from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.power > 5000
select model from vehicle where total_production > 100 or top_speed > 150
select model from vehicle where total_production > 100 or top_speed > 150
select model, build_year from vehicle where model like '%dj%'
select model, build_year from vehicle where model like '%dj%'
select model from vehicle except select model from vehicle where vehicle_id in (select vehicle_id from vehicle_driver)
select model from vehicle where vehicle_id not in (select vehicle_id from vehicle_driver)
select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_id group by vehicle.vehicle_id having count(distinct vehicle_driver.driver_id) = 2 union select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehid where manufacturer = 'Ziyang'
select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_id group by vehicle_driver.vehicle_id having count(*) = 2 union select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle_driver.vehicle_id = vehicle.vehicle_driver.vehid where driver.name = 'Ziyang'
select vehicle.vehicle_id, vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jeff Gordon' group by vehicle_driver.vehicle_id having count(*) > 2 union select vehicle.vehicle_id from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = 'Jefft Gordon'
select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_id group by vehicle_driver.vehicle_id having count(*) > 2 union select vehicle.vehicle_id, vehicle.model from vehicle join vehicle_driver on vehicle.vehicle_id = vehicle_driver.vehicle_driver.vehid where driver.name = 'Jef Gordon'
select count(*) from vehicle where top_speed = (select max(top_speed) from vehicle)
select count(*) from vehicle where top_speed = (select max(top_speed) from vehicle)
select name from driver order by name asc
select name from driver order by name asc
select racing_series, count(*) from driver group by racing_series
select racing_series, count(*) from driver group by racing_series
select driver.name, driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select driver.name, driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = 'DJ1'
select count(*) from driver where driver_id not in (select driver_id from vehicle_driver)
select count(*) from driver where driver_id not in (select driver_id from vehicle_driver)
select count(*) from exams
select count(*) from exams
select distinct subject_code from exams order by subject_code asc
select distinct subject_code from exams order by subject_code
select exam_name, exam_date from exams where subject_code!= 'Database'
select exam_date, exam_name from exams where subject_code!= 'Database'
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select exam_date from exams where subject_code like '%data%' order by exam_date desc
select type_of_question_code, count(*) from questions group by type_of_question_code
select type_of_question_code, count(*) from questions group by type_of_question_code
select distinct student_answer_text from student_answers where comments = 'Normal'
select distinct student_answer_text from student_answers where comments = 'Normal'
select count(distinct comments) from student_answers
select count(distinct comments) from student_answers
select student_answer_text from student_answers group by student_answer_text order by count(*) desc
select student_answer_text from student_answers group by student_answer_text order by count(*) desc
select students.first_name, student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id
select students.first_name, student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id
select students.email_address, student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id order by student_answers.date_of_answer desc
select students.email_address, student_answers.date_of_answer from students join student_answers on students.student_id = student_answers.student_id order by student_answers.date_of_answer desc
select assessment from student_assessments group by assessment order by count(*) asc limit 1
select assessment from student_assessments group by assessment order by count(*) limit 1
select students.first_name from students join student_answers on students.student_id = student_answers.student_id group by students.student_id having count(*) >= 2
select s.first_name from students s join student_answers sa on s.student_id = sa.student_id group by s.student_id having count(sa.student_answer_id) >= 2
select valid_answer_text from valid_answers group by valid_answer_text having count(valid_answer_text) = (select max(count(valid_answer_text)) from (select count(valid_answer_text) from valid_answers group by valid_answer_text))
select valid_answer_text from valid_answers group by valid_answer_text order by count(*) desc limit 1
select last_name from students where gender_mfu!= 'M'
select last_name from students where gender_mfu!= 'M'
select gender_mfu, count(*) from students group by gender_mfu
select gender_mfu, count(*) from students group by gender_mfu
select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
select last_name from students where gender_mfu = 'F' or gender_mfu = 'M'
select first_name from students where student_id not in (select student_id from student_answers)
select first_name from students where student_id not in (select student_id from student_answers)
select student_answer_text from student_answers where comments = 'Normal' intersect select student_answer_text from student_answers where comments = 'Absence'
select student_answer_text from student_answers where comments = 'Normal' intersect select student_answer_text from student_answers where comments = 'Absence'
select type_of_question_code from questions group by type_of_question_code having count(*) >= 3
select type_of_question_code from questions group by type_of_question_code having count(*) >= 3
select * from students
select * from students
select count(*) from addresses
select count(*) from addresses
select address_id, address_details from addresses
select address_id, address_details from addresses
select count(*) from products
select count(*) from products
select product_id, product_type_code, product_name from products
select product_id, product_type_code, product_name from products
select product_price from products where product_name ='monitor'
select product_price from products where product_name ='monitor'
select min(product_price), avg(product_price), max(product_price) from products
select min(product_price), avg(product_price), max(product_price) from products
select avg(product_price) from products where product_type_code = 'clothes'
select avg(product_price) from products where product_id = (select product_id from products where product_name = 'clothes')
select count(*) from products where product_type_code = 'Hardware'
select count(*) from products where product_type_code = 'Hardware'
select product_name from products where product_price > (select avg(product_price) from products)
select product_name from products where product_price > (select avg(product_price) from products)
select product_name from products where product_price > (select avg(product_price) from products where product_type_code = 'Hardware')
select product_name from products where product_price > (select avg(product_price) from products)
select p.product_name from products p where p.product_type_code = 'clothes' and p.product_price = (select max(product_price) from products where product_type_code = 'clothes')
select p.product_name from products p where p.product_price = (select max(product_price) from products where product_type_code = p.product_type_code)
select p.product_id, p.product_name from products p where p.product_price = (select min(product_price) from products where product_type_code = 'Hardware') and p.product_type_code = 'Hardware'
select product_id, product_name from products where product_price = (select min(product_price) from products where product_type_code = hardware)
select product_name from products order by product_price desc
select product_name from products order by product_price desc
select product_price from products where product_type_code = 'Hardware' order by product_price asc
select product_name from products where product_price = (select avg(product_price) from products where product_type_code = 'Hardware') order by product_price asc
select product_type_code, count(*) from products group by product_type_code
select product_type_code, count(*) from products group by product_type_code
select product_type_code, avg(product_price) from products group by product_type_code
select product_type_code, avg(product_price) from products group by product_type_code
select product_type_code from products group by product_type_code having count(*) >= 2
select product_type_code from products group by product_type_code having count(distinct product_id) >= 2
select product_type_code from products group by product_type_code having count(product_id) = (select max(count(product_id)) from (select count(product_id) from products group by product_type_code))
select product_type_code from products group by product_type_code order by count(*) desc limit 1
select count(*) from customers
select count(*) from customers
select customer_id, customer_name from customers
select customer_id, customer_name from customers
select customer_address, customer_phone, customer_email from customers where customer_name = 'Jerromy'
select addresses.address, customers.customer_phone, customers.customer_email from customers join addresses on customers.address_id = addresses.address_id where customers.customer_name = 'Jeromy'
select payment_method_code, count(*) from customers group by payment_method_code
select payment_method_code, count(*) from customers group by payment_method_code
select payment_method_code from customers group by payment_method_code having count(customer_id)(customer_id) = (select max(count(customer_id)) from (select count(customer_id)(customer_id) from customers group by payment_method_code))
select payment_method_code from customers group by payment_method_code order by count(*) desc limit 1
select customer_name from customers where payment_method_code = (select payment_method_code from customers group by payment_method_code order by count(customer_id) asc limit 1)
select customer_name from customers where payment_method_code = (select payment_method_code from customers group by payment_method_code order by count(*) asc limit 1)
select payment_method_code, customer_number from customers where customer_name = 'Jeromy'
select payment_method_code, customer_number from customers where customer_name = 'Jeromy'
select distinct payment_method_code from customers
select distinct payment_method_code from customers
select product_id, product_type_code from products order by product_name
select product_id, product_type_code from products order by product_name
select product_type_code from products group by product_type_code order by count(*) asc limit 1
select product_type_code from products group by product_type_code order by count(*) asc limit 1
select count(*) from customer_orders
select count(*) from customer_orders
select customer_orders.order_id, customer_orders.order_date, customer_orders.order_status_code from customers join customer_orders on customers.customer_id = customer_orders.customer_id where customers.customer_name = 'Jeromy'
select customer_orders.order_id, customer_orders.order_date, customer_orders.order_status_code from customers join customer_orders on customers.customer_id = customer_orders.customer_id where customers.customer_name = 'Jeromy'
select customers.customer_name, customers.customer_id, (select count(*) from customer_orders where customer_orders.customer_id = customers.customer_id) from customers
select customers.customer_name, customers.customer_id, count(customer_orders.order_id) from customers left join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id
select customers.customer_id, customers.customer_name, customers.customer_phone, customers.customer_email from customers join (select customer_id, count(order_id) from customer_orders group by customer_id) cnt_orders on customers.customer_id = cnt_orders.customer_id where count(order_id) = (select max(count(order_id)) from (select customer_id) from customer_orders group by customer_id))
select customer_orders.customer_id, customers.customer_name, customers.customer_phone, customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customer_orders.customer_id order by count(*) desc limit 1
select order_status_code, count(*) from customer_orders group by order_status_code
select order_status_code, count(*) from customer_orders group by order_status_code
select order_status_code from customer_orders group by order_status_code having count(order_id)(order_id) = (select max(count(order_id)) from (select count(order_id)(order_id) from customer_orders group by order_status_code))
select order_status_code from customer_orders group by order_status_code order by count(*) desc limit 1
select count(*) from customers where customer_id not in (select customer_id from customer_orders)
select count(*) from customers where customer_id not in ( select customer_id from customer_orders )
select product_name from products where product_id not in (select product_id from order_items)
select product_name from products where product_id not in (select product_id from order_items)
select count(*) from order_items join products on order_items.product_id = products.product_id where products.product_name ='monitor'
select count(*) from order_items join products on order_items.product_id = products.product_id where products.product_name ='monitor'
select count(distinct customer_orders.customer_id) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name ='monitor'
select count(distinct customer_id) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name ='monitor'
select count(distinct customer_id) from customer_orders
select count(distinct customer_id) from customer_orders
select customer_id from customers except select customer_id from customer_orders
select customer_id from customers except select customer_id from customer_orders
select customer_orders.order_date, customer_orders.order_id from customer_orders join order_items on customer_orders.order_id = order_items.order_id where order_items.order_quantity > 6 or order_items.product_id in (select product_id from order_items group by product_id having count(product_id) > 3)
select customer_orders.order_id, customer_orders.order_date from customer_orders join order_items on customer_orders.order_id = order_items.order_id group by customer_orders.order_id having sum(order_items.order_quantity) > 6 or count(distinct order_items.product_id) > 3
select count(*) from building
select count(*) from building
select name from building order by number_of_stories asc
select name from building order by number_of_stories asc
select address from building order by completed_year desc
select address from building order by completed_year desc
select max(number_of_stories) from building where completed_year!= 1980
select max(number_of_stories) from building where completed_year!= 1980
select avg(population) from region
select avg(population) from region
select name from region order by name asc
select name from region order by name asc
select capital from region where area > 10000
select capital from region where area > 10000
select capital from region where population = (select max(population) from region)
select capital from region where population = (select max(population) from region)
select name from region order by area desc limit 5
select name from region order by area desc limit 5
select building.name, region.name from building join region on building.region_id = region.region_id
select building.name, region.name from building join region on building.region_id = region.region_id
select region.name from region join building on region.region_id = building.region_id group by building.region_id having count(*) > 1
select region.name from region join building on region.region_id = building.region_id group by region.region_id having count(*) > 1
select region.capital from region join building on region.region_id = building.region_id group by region.region_id order by count(*) desc limit 1
select region.capital from region join building on region.region_id = building.region_id group by region.region_id order by count(*) desc limit 1
select building.address, region.capital from building join region on building.region_id = region.region_id
select building.address, region.name from building join region on building.region_id = region.region_id
select number_of_stories from building where region_id in (select region_id from region where name = 'Abruzzo')
select building.number_of_stories from building join region on building.region_id = region.region_id where region.name = 'Abruzzo'
select completed_year, count(*) from building group by completed_year
select completed_year, count(*) from building group by completed_year
select completed_year from building group by completed_year having count(building_id)(building_id) = (select max(count(building_id)) from (select count(building_id)(building_id) from building group by completed_year))
select completed_year from building group by completed_year order by count(*) desc limit 1
select name from region where region_id not in (select region_id from building)
select name from region where region_id not in (select region_id from building)
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select completed_year from building where number_of_stories > 20 intersect select completed_year from building where number_of_stories < 15
select distinct address from building
select distinct address from building
select completed_year from building order by number_of_stories desc
select completed_year from building order by number_of_stories desc
select channel_details from channels order by channel_details
select channel_details from channels order by channel_details
select count(*) from services
select count(*) from services
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code having count(analytical_layer_type_code)(analytical_layer_type_code) = (select max(count(analytical_layer_type_code)) from (select count(analytical_layer_type_code)(analytical_layer_type_code) from analytical_layer group by analytical_layer_type_code))
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code having count(analytical_layer_type_code)(analytical_layer_type_code) = (select max(count(analytical_layer_type_code)) from (select count(analytical_layer_type_code)(analytical_layer_type_code) from analytical_layer group by analytical_layer_type_code))
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customers on customers_and_services.customer_id = customers.customer_id where customers.customer_details = 'Hardy Kutch'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id group by customers_and_services.service_id having count(*) > 3
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id group by services.service_id having count(customers_and_services.customer_id) > 3
select customer_details from customers where customer_id in (select customer_id from customer_interactions group by customer_id having count(customer_id)(customer_id) = (select max(count(customer_id)) from (select count(customer_id)(customer_id) from customer_interactions group by customer_id)))
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id group by customers.customer_id order by count(*) desc limit 1
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id group by customers.customer_id order by count(*) desc limit 1
select c.customer_details from customers c where exists (select 1 from customers_and_services co where co.customer_id = c.customer_id group by co.customer_id having count(distinct co.service_id) = (select max(count(distinct co.service_id)) from (select count(distinct co.service_id) from customers_and_services group by co.customer_id))
select customer_details from customers where customer_id not in (select customer_id from customers_and_services)
select customer_details from customers where customer_id not in (select customer_id from customers_and_services)
select customer_details from customers where customer_id in (select customer_id from customers_and_services where service_id in (select service_id from services group by service_id order by count(service_id) asc limit 1))
select distinct customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id where customers_and_services.service_id in (select service_id from customers_and_services group by service_id order by count(*) asc limit 1)
select count(distinct customers_and_services_details) from customers_and_services
select count(*) from customers_and_services
select customer_details from customers where customer_details like '%kutch%'
select customer_details from customers where customer_details like '%kutch%'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customer_interactions on customers_and_services.customer_id = customer_interactions.customer_id where customers.customer_details = 'Hardy Kutch' or customer_interactions.status_code = 'Good'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customer_interactions on customer_interactions.customer_id = customers.customer_id where customers.customer_details = 'Hardy Kutch' or customer_interactions.status_code = 'Good'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customer_interactions on customers_and_services.customer_id = customer_interactions.customer_id where customers.customer_name = 'Hardy Kutch' intersect select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id where customers.customer_name = 'Bad'
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id join customer_interactions on customer_interactions.customer_id = customers.customer_id where customers.customer_details = 'Hardy Kutch' intersect select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id where customers.customer_id = 'Bad'
select distinct services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where customer_interactions.customer_id = 15_ij
select distinct services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where channels.channel_details = '15 ij'
select customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id where customer_interactions.status_code = 'Stuck' and customer_interactions.services_and_channels_details = 'Bad'
select customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join services_and_services on customer_interactions.service_id = services_and_services.service_id where customer_interactions.status_code ='stuck' and services_and_channels_details = 'bad'
select count(*) from integration_platform where integration_platform_details = 'Y'
select count(*) from integration_platform where integration_platform_details like '%success%'
select customer_details from customers where customer_id in (select customer_id from customer_interactions where customer_interaction_id in (select customer_interaction_id from integration_platform where integration_platform_details are not null))
select customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = 'fail'
select s.service_details from services s where s.service_id not in (select cs.service_id from customers_and_services cs)
select service_details from services where service_id not in (select service_id from customers_and_services)
select analytical_layer_type_code, count(*) from analytical_layer group by analytical_layer_type_code
select analytical_layer_type_code, count(*) from analytical_layer group by analytical_layer_type_code
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id where customers_and_services.customers_and_services_details like '%unsatisfied%'
select service_details from services where service_id in (select service_id from customers_and_services where customers_and_services_details = 'Unsatisfied')
select count(*) from vehicles
select count(*) from vehicles
select name from vehicles order by model_year desc
select name from vehicles order by model_year desc
select distinct type_of_powertrain from vehicles
select distinct type_of_powertrain from vehicles
select name, type_of_powertrain, annual_fuel_cost from vehicles where model_year = 2013 or model_year = 2014
select name, type_of_powertrain, annual_fuel_cost from vehicles where model_year = 2013 or model_year = 2014
select type_of_powertrain from vehicles where model_year = 2014 intersect select type_of_powertrain from vehicles where model_year = 2013
select type_of_powertrain from vehicles where model_year = 2013 intersect select type_of_powertrain from vehicles where model_year = 2014
select type_of_powertrain, count(*) from vehicles group by type_of_powertrain
select type_of_powertrain, count(*) from vehicles group by type_of_powertrain
select type_of_powertrain from vehicles group by type_of_powertrain having count(id)(id) = (select max(count(id)) from (select count(id)(id) from vehicles group by type_of_powertrain))
select type_of_powertrain from vehicles group by type_of_powertrain having count(type_of_powertrain) = (select max(count(type_of_powertrain)) from (select count(type_of_powertrain) from vehicles group by type_of_powertrain))
select min(annual_fuel_cost), max(annual_fuel_cost), avg(annual_fuel_cost) from vehicles
select min(annual_fuel_cost), max(annual_fuel_cost), avg(annual_fuel_cost) from vehicles
select name, model_year from vehicles where city_fuel_economy_rate <= (select max(city_fuel_economy_rate) from vehicles where highway_fuel_economy_rate >= 0)
select name, model_year from vehicles where city_fuel_economy_rate <= (select max(city_fuel_economy_rate) from vehicles)
select type_of_powertrain, avg(annual_fuel_cost) from vehicles group by type_of_powertrain having count(*) >= 2
select type_of_powertrain, avg(annual_fuel_cost) from vehicles group by type_of_powertrain having count(distinct id) >= 2
select name, age, membership_credit from customers
select name, age, membership_credit from customers
select name, age from customers where id in (select customer_id from discount group by customer_id having sum(membership_credit) = (select max(sum(membership_credit)) from (select sum(membership_credit) from discount group by customer_id)))
select name, age from customers where id in (select customer_id from discount group by customer_id having sum(membership_credit) = (select max(sum(membership_credit)) from (select sum(membership_credit) from discount group by customer_id)))
select avg(age) from customers where membership_credit > (select avg(age) from customers)
select avg(age) from customers where membership_credit > (select avg(age) from customers)
select * from discount
select * from discount
select vehicles.name, sum(renting_history.total_hours) from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by renting_history.vehicles_id
select vehicles.name, sum(renting_history.total_hours) from renting_history join vehicles on renting_history.vehicles_id = vehicles.id group by renting_history.vehicles_id
select name from vehicles where id not in (select vehicles_id from renting_history)
select name from vehicles where id not in (select vehicles_id from renting_history)
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by renting_history.customer_id having count(*) >= 2
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by renting_history.customer_id having count(*) >= 2
select vehicles.name, vehicles.model_year from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id order by count(*) desc limit 1
select vehicles.name, vehicles.model_year from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id order by count(*) desc limit 1
select vehicles.name from renting_history join vehicles on renting_history.vehicles_id = vehicles.id order by renting_history.total_hours desc
select vehicle.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id order by renting_history.total_hours desc
select discount.name from renting_history join discount on renting_history.discount_id = discount.id group by renting_history.discount_id order by count(*) desc limit 1
select discount.name from renting_history join discount on renting_history.discount_id = discount.id group by renting_history.discount_id order by count(*) desc limit 1
select vehicles.name, vehicles.type_of_powertrain from vehicles join renting_history on vehicles.id = renting_history.vehicles_id where renting_history.total_hours > 30
select vehicles.name, vehicles.type_of_powertrain from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id having sum(renting_history.total_hours) > 30
select avg(city_fuel_economy_rate), avg(highway_fuel_economy_rate), type_of_powertrain from vehicles group by type_of_powertrain
select avg(city_fuel_economy_rate), avg(highway_fuel_economy_rate), type_of_powertrain from vehicles group by type_of_powertrain
select avg(amount_of_loan) from student_loans
select avg(amount_of_loan) from student_loans
select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) >= 2 intersect select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) < 2
select students.bio_data, students.student_id from students join classes on students.student_id = classes.student_id group by students.student_id having count(*) >= 2 union select bio_data, student_id from students where student_id in (select student_id from detention group by student_id having count(detention_id) < 2)
select t.teacher_details from teachers t where exists (select 1 from classes c where c.teacher_id = t.teacher_id and c.class_details like '%data%') and not exists (select 1 from classes c2 where c2.teacher_id = t.teacher_id and c2.class_details like '%net%')
select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.details like '%data%' except select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id where classes.details like '%net%'
select bio_data from students where student_id not in (select student_id from detention or student_loan)
select bio_data from students where student_id not in (select student_id from detention or student_loans)
select student_loans.amount_of_loan, student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by student_loans.student_id having count(*) >= 2
select student_loans.amount_of_loan, student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by student_loans.student_id having count(*) >= 2
select teachers.teacher_details, teachers.teacher_id from teachers join classes on teachers.teacher_id = classes.teacher_id group by teachers.teacher_id order by count(*) desc limit 1
select teachers.teacher_details, teachers.teacher_id from teachers join classes on teachers.teacher_id = classes.teacher_id group by teachers.teacher_id order by count(*) desc limit 1
select distinct ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code
select distinct detention_type_description from ref_detention_type
select students.bio_data, ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select students.bio_data, ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select addresses.address_details, students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id
select addresses.address_details, students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id join students on students_addresses.student_id = students.student_id
select students.bio_data, transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select students.bio_data, transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select count(*), behaviour_monitoring.behaviour_monitoring_details from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 1
select count(*), behaviour_monitoring_details from behaviour_monitoring group by behaviour_monitoring_details order by count(*) desc limit 1
select s.bio_data, s.student_details from students s join behaviour_monitoring bm on s.student_id = bm.student_id group by s.student_id having count(bm.behaviour_monitoring_id) = (select max(count(*)) from (select count(*) from behaviour_monitoring group by student_id))
select bio_data, student_details from students where student_id in (select student_id from behaviour_monitoring group by student_id having count(student_id) = (select max(count(student_id)) from (select count(student_id) from behaviour_monitoring group by student_id)))
select s.bio_data from students s join behaviour_monitoring bm on s.student_id = bm.student_id group by s.student_id order by count(bm.behaviour_monitoring_details) desc limit 1
select bio_data from students where student_id in (select student_id from behaviour_monitoring group by student_id having count(behavioural_monitoring_details) = (select max(count(behavioural_monitoring_details)) from (select count(behavioural_monitoring_details) from behaviour_monitoring group by student_id)))
select students.bio_data, student_events.event_date from students join student_events on students.student_id = student_events.student_id
select bio_data, event_date from students where student_id in (select student_id from student_events)
select count(distinct student_id), ref_event_types.event_type_code, ref_event_types.event_type_description from student_events join ref_event_types on student_events.event_type_code = ref_event_types.event_type_code group by ref_event_types.event_type_code order by count(*) desc limit 1
select count(distinct student_id), event_type_code, ref_event_types.event_type_description from student_events join ref_event_types on student_events.event_type_code = ref_event_types.event_type_code group by event_type_code order by count(distinct student_id) desc limit 1
select achievements.achievement_details, ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select achievements.achievement_details, ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select count(distinct c.teacher_id) from classes c join students s on c.student_id = s.student_id where s.student_id not in (select a.student_id from achievements a)
select count(*) from classes join teachers on classes.teacher_id = teachers.teacher_id join achievements on classes.student_id = achievements.student_id where achievements.achievement_id is null
select date_of_transcript, transcript_details from transcripts
select date_of_transcript, transcript_details from transcripts
select achievement_type_code, achievement_details, date_achievement from achievements
select achievement_type_code, achievement_details, date_achievement from achievements
select datetime_detention_start, datetime_detention_end from detention
select datetime_detention_start, datetime_detention_end from detention
select bio_data from students where student_details like '%suite%'
select bio_data from students where student_details like '%suite%'
select distinct class_details from classes join teachers on classes.teacher_id = teachers.teacher_id join students on classes.student_id = students.student_id
select distinct t.teacher_details from teachers t join classes c on t.teacher_id = c.teacher_id join students s on c.student_id = s.student_id
select teacher_id from classes group by teacher_id order by count(*) desc limit 1
select t.teacher_id, count(distinct c.class_id) from teachers t left join classes c on t.teacher_id = c.teacher_id group by t.teacher_id order by count(distinct c.class_id) desc limit 1
select student_id from students group by student_id order by count(*) desc limit 1
select s.student_id, count(*) from students s group by s.student_id having count(*) = (select max(count(*)) from (select count(*) from courses group by student_id))
select students.student_id, students.student_details from students join classes on students.student_id = classes.student_id group by students.student_id having count(*) = 2
select students.student_id, students.student_details from students join classes on students.student_id = classes.student_id group by students.student_id having count(*) = 2
select detention.detention_type_code, ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count(*) asc limit 1
select detention.detention_type_code, ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count(*) asc limit 1
select bio_data, student_details from students where student_id in (select student_id from student_loans where amount_of_loan > (select avg(amount_of_loan) from student_loans))
select bio_data, student_details from students where student_id in (select student_id from student_loans where amount_of_loan > (select avg(amount_of_loan) from student_loans))
select date_of_loan from student_loans order by date_of_loan asc limit 1
select date_of_loan from student_loans order by date_of_loan asc limit 1
select bio_data from students where student_id in (select student_id from student_loans where amount_of_loan = (select min(amount_of_loan) from student_loans))
select bio_data from students where student_id in (select student_id from student_loans where amount_of_loan = (select min(amount_of_loan) from student_loans))
select t.date_of_transcript from transcripts t inner join student_loans sl on t.student_id = sl.student_id where sl.amount_of_loan = (select max(amount_of_loan) from student_loans)
select t.date_of_transcript from transcripts t inner join student_loans sl on t.student_id = sl.student_id where sl.amount_of_loan = (select max(amount_of_loan) from student_loans)
select teachers.teacher_details from teachers join classes on teachers.teacher_id = classes.teacher_id join transcripts on classes.student_id = transcripts.student_id order by transcripts.date_of_transcript limit 1
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id join transcripts on classes.student_id = transcripts.student_id order by transcripts.date_of_transcript limit 1
select student_id, sum(amount_of_loan) from student_loans group by student_id
select student_id, sum(amount_of_loan) from student_loans group by student_id
select student_id, bio_data, (select count(*) from classes where classes.student_id = students.student_id) from students
select s.student_id, s.bio_data, count(distinct c.class_id) from students s
select count(distinct student_id) from detention
select count(distinct student_id) from detention
select address_type_code, address_type_description from ref_address_types where address_type_code = (select address_type_code from students_addresses group by address_type_code order by count(*) desc limit 1)
select address_type_code, address_type_description from ref_address_types where address_type_code = (select address_type_code from students_addresses group by address_type_code order by count(*) desc limit 1)
select bio_data from students where student_id in (select student_id from student_events except select student_id from student_loans)
select bio_data from students where student_id in (select student_id from student_events except select student_id from student_loans)
select students_addresses.date_from, students_addresses.date_to from students_addresses join transcripts on students_addresses.student_id = transcripts.student_id group by students_addresses.student_id having count(*) = 2
select students_addresses.date_from, students_addresses.date_to from addresses join students_addresses on addresses.address_id = students_addresses.address_id group by students_addresses.student_id having count(*) = 2
select datetime_detention_start from detention
select datetime_detention_start from detention
select name from author
select name from author
select name, address from client
select name, address from client
select title, isbn, saleprice from book
select title, isbn, saleprice from book
select count(*) from book
select count(*) from book
select count(*) from author
select count(*) from author
select count(*) from client
select count(*) from client
select name, address from client order by name
select name, address from client order by name
select book.title, author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select book.title, author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor
select orders.idorder, client.name from orders join client on orders.idclient = client.idclient
select orders.idorder, client.name from orders join client on orders.idclient = client.idclient
select name, (select count(*) from book where book.isbn = author_book.isbn) from author
select name, (select count(*) from book where book.author = author.idauthor) from author
select book.isbn, count(books_order.idorder) from book left join books_order on book.isbn = books_order.isbn group by book.isbn
select isbn, count(*) from books_order join book on books_order.isbn = book.isbn group by isbn
select book.isbn, sum(books_order.amount) from book join books_order on book.isbn = books_order.isbn group by book.isbn
select isbn, sum(amount) from books_order group by isbn
select book.title from book join books_order on book.isbn = books_order.isbn group by books.isbn order by count(*) desc limit 1
select title from book where isbn in (select isbn from books_order group by isbn having count(isbn) = (select max(count(isbn)) from (select count(isbn) from books_order group by isbn)))
select book.title, book.purchaseprice from book join books_order on book.isbn = books_order.isbn group by books_order.isbn order by sum(orders.amount) desc limit 1
select title, purchaseprice from book where isbn in (select isbn from books_order group by isbn order by sum(amount) desc limit 1)
select title from book where isbn in (select isbn from books_order)
select distinct title from book where isbn in (select isbn from books_order)
select distinct c.name from client c join orders o on c.idclient = o.idclient
select distinct client.name from orders join client on orders.idclient = client.idclient
select client.name, count(*) from orders join client on orders.idclient = client.idclient group by client.idclient
select name, (select count(*) from orders where orders.idclient = client.idclient) from client
select name from client where idclient in (select idclient from orders group by idclient having count(idorder) = (select max(count(idorder)) from (select count(idorder) from orders group by idclient)))
select client.name from orders join client on orders.idclient = client.idclient group by orders.idclient order by count(*) desc limit 1
select client.name, sum(books_order.amount) from orders join books_order on orders.idorder = books_order.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name, sum(books_order.amount), orders.idclient from orders join client on orders.idclient = client.idclient group by orders.idclient
select client.name from client join orders on client.idclient = orders.idclient join books_order on books_order.idorder = orders.idorder group by client.idclient order by sum(books_order.amount) desc limit 1
select client.name from client join orders on client.idclient = orders.idclient join books_order on orders.idorder = books_order.idorder group by client.idclient order by sum(books_order.amount) desc limit 1
select title from book where isbn not in (select isbn from books_order)
select title from book where isbn not in (select isbn from books_order)
select name from client where idclient not in (select idclient from orders)
select name from client where idclient not in (select idclient from orders)
select max(saleprice), min(saleprice) from book
select max(saleprice), min(saleprice) from book
select avg(purchaseprice), avg(saleprice) from book
select avg(purchaseprice), avg(saleprice) from book
select max(difference between saleprice and purchaseprice) from book
select max(saleprice), max(purchaseprice) from book
select title from book where saleprice > (select avg(saleprice) from book)
select title from book where saleprice > (select avg(saleprice) from book)
select title from book where saleprice = (select min(saleprice) from book)
select title from book where saleprice = (select min(saleprice) from book)
select title from book order by purchaseprice desc limit 1
select title from book where purchaseprice = (select max(purchaseprice) from book)
select avg(book.saleprice) from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select avg(book.saleprice) from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name = 'George Orwell'
select saleprice from book where author = 'Plato'
select book.saleprice from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name = 'Plato'
select title from book where saleprice = (select min(saleprice) from book where author = 'George Orwell')
select title from book where saleprice = (select min(saleprice) from book where author = 'George Orwell')
select title from book where saleprice < (select avg(saleprice) from book) and author.name = 'Plato'
select book.title from author_book join book on author_book.isbn = book.isbn where author.name = 'Plato' and book.saleprice < (select avg(saleprice) from book)
select author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where book.title = 'Pride and Prejudice'
select author.name from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where book.title = 'Pride and Prejudice'
select book.title from book join author_book on book.isbn = author_book.isbn join author on author_book.author = author.idauthor where author.name like '%plato%'
select book.title from author join author_book on author.idauthor = author_book.author join book on author_book.isbn = book.isbn where author.name like '%plato%'
select count(*) from orders join book on orders.idorder = book.isbn where book.title = 'Pride and Prejudice'
select count(*) from orders where idorder in (select idorder from books_order where author.author = "Pride and Prejudice")
select idorder from orders where title = 'Pride and Prejudice' intersect select idorder from books_order where title = 'The little Prince'
select o.idorder from orders o where o.title in (select b.title from books_order b join author b on b.author = b.idauthor where b.title = 'Pride and Prejudice' intersect select o.idorder from books_order b join author b on b.isbn = b.isbn where b.author = 'The Little Prince')
select book.isbn from book join orders on book.isbn = orders.idorder join client on orders.idclient = client.idclient where client.name = 'Peter Doe' intersect select book.isbn from book join books_order on book.isbn = books_order.isbn join author on author_book.author = author.idauthor where author.name = 'James Smith'
select books_order.isbn from books_order join orders on books_order.idorder = orders.idorder join client on orders.idclient = client.idclient where client.name = 'Peter Doe' intersect select books_order.isbn from books_order join author on books_order.author = author.idauthor where author.name = 'James Smith'
select book.title from books_order join orders on books_order.idorder = orders.idorder join author on author_book.isbn = book.isbn join client on orders.idclient = client.idclient where author.name = 'Peter Doe' except select book.title from books_order join orders on books_order.idorder = orders.idorder join author on author_book.author = author.idauthor where author.name = 'James Smith'
select book.title from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn join author on author_book.author = author.idauthor where author.name = 'Peter Doe' and author.name!= 'James Smith'
select distinct c.name from client c join orders o on c.idclient = o.idclient join book b on o.idorder = b.idorder where b.title = 'Pride and Prejudice'
select name from client where idclient in (select idclient from orders where idorder in (select idorder from orders where title = 'Pride and Prejudice'))
select count(*) from book
select title from book order by title asc
select title from book order by pages desc
select type, release from book
select max(chapters), min(chapters) from book
select title from book where title!= 'Poet'
select avg(rating) from review
select book.title, review.rating from book join review on book.book_id = review.book_id
select r.rating from review r join book b on r.book_id = b.book_id group by r.book_id having count(b.chapters) = (select max(count(chapters)) from (select count(chapters) from book group by book_id))
select r.rank from review r join book b on r.book_id = b.book_id where b.pages = (select min(pages) from book)
select b.title from book b inner join review r on b.book_id = r.book_id where r.rank = (select max(rank) from review)
select avg(readers_in_million) from review join book on review.book_id = book.book_id where book.type = 'novel'
select type, count(*) from book group by type
select b.type from book b group by b.type having count(b.type) = (select max(count(type)) from (select count(type) from book group by type))
select type from book group by type having count(*) >= 3
select book.title from book join review on book.book_id = review.book_id order by review.rating asc
select title, audio from book order by readers_in_million desc
select count(*) from book where book_id not in (select book_id from review)
select type from book where chapters > 75 intersect select type from book where chapters < 50
select count(distinct type) from book
select type, title from book where book_id not in (select book_id from review)
select count(*) from customer;
select count(*) from customer;
select name from customer order by level_of_membership asc, name asc
select name from customer order by level_of_membership asc
select nationality, card_credit from customer
select nationality, card_credit from customer
select name from customer where nationality = 'England' or nationality = 'Australia';
select name from customer where nationality = 'England' or nationality = 'Australia'
select avg(card_credit) from customer where level_of_membership > 1;
select avg(card_credit) from customer where level_of_membership > 1
select card_credit from customer where level_of_membership = (select max(level_of_membership) from customer)
select card_credit from customer where level_of_membership = (select max(level_of_membership) from customer)
select nationality, count(*) from customer group by nationality
select nationality, count(*) from customer group by nationality
select nationality from customer group by nationality having count(nationality) = (select max(count(nationality)) from (select nationality, count(nationality) from customer group by nationality)
with nationalitycount(customer_id) nationality, count(customer_id)(customer_id) from customer group by nationality) select nationality from nationalitycount(customer_id) where count(customer_id) = nationalitycount(customer_id) max(count(customer_id)) from nationalitycount(customer_id))
select nationality from customer where card_credit < 50 intersect select nationality from customer where card_credit > 75
select nationality from customer where card_credit > 50 intersect select nationality from customer where card_credit < 75
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name, dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name, sum(customer_order.quantity) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id
select customer.name, sum(customer_order.quantity) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id
select customer_id from customer_order group by customer_id having sum(quantity) > 1;
select customer.name from customer join customer_order on customer.customer_id = customer_order.customer_id group by customer.customer_id having sum(customer_order.quantity) > 1;
select distinct manager from branch;
select distinct manager from branch;
select name from customer where customer_id not in (select customer_id from customer_order)
select name from customer where customer_id not in (select customer_id from customer_order)
select count(*) from member
select name from member order by age asc
select name, nationality from member
select name from member where nationality!= 'England'
select name from member where age = 19 or age = 20
select name from member where age = (select max(age) from member)
select nationality, count(*) from member group by nationality
select m.nationality from member m group by m.nationality having count(m.nationality)(m.nationality) = (select max(count(nationality)) from (select count(nationality)(nationality) from member group by nationality)
select nationality from member group by nationality having count(*) >= 2
select club_leader.name, club.club_name from club_leader join club on club_leader.club_id = club.club_id
select club_leader.club_name from club join club_leader on club.club_id = club_leader.club_id where club.overall_ranking > 100
select member.name from club_leader join member on club_leader.member_id = member.member_id where club_leader.year_join < 2018
select member.name from club_leader join club on club_leader.club_id = club.club_id join member on club_leader.member_id = member.member_id where club.club_name = 'Houston'
select name from member where member_id not in (select member_id from club_leader)
select nationality from member where age > 22 intersect select nationality from member where age < 19
select avg(member.age) from club_leader join member on club_leader.member_id = member.member_id group by club_leader.club_id
select club_name from club where club_name like '%state%'
select collection_subsets.collection_subset_name from collections join collection_subsets on collections.collection_subset_id = collection_subsets.collection_subset_id
select collection_subsets.collection_subset_name from collections join collection_subsets on collections.collection_subset_id = collection_subsets.collection_subset_id
select collecrtion_subset_details from collection_subsets where collection_subset_name = 'Top Collection'
select collection_subsets.collection_subset_details from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id where collection_subsets.collection_subset_name = 'Top Collection'
select document_subset_name from document_subsets
select document_subset_name from document_subsets
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_details from document_subsets where document_subset_name = 'Best for 2000'
select document_id from documents
select document_object_id from document_objects
select parent_document_id from document_objects where owner = 'Marlin'
select document_object_id from document_objects where owner = 'Marlin'
select owner from document_objects where description = 'Braeden Collection'
select owner from document_objects where document_object_id in (select document_object_id from documents_in_collections where collection_id in (select collection_id from collections where collection_name = 'Braeden Collection'))
select owner from document_objects where parent_document_object_id in (select parent_document_object_id from document_objects where owner = 'Marlin')
select owner from document_objects where parent_document_object_id = (select parent_document_object_id from document_objects where owner = 'Marlin')
select distinct description from document_objects
select distinct description from document_objects
select count(*) from document_objects where owner = 'Marlin'
select count(*) from document_objects where owner = 'Marlin'
select document_id from document except select parent_document_id from document_objects
select document_id from documents except select parent_document_id from document_objects
select d.parent_document_id, count(d.child_document_id) from document_objects d left join document_objects d on d.parent_document_object_id = d.parent_document_object_id group by d.parent_document_id
select count(*), parent_document_id from document_objects group by parent_document_id
select collection_name from collections
select collection_name from collections
select collection_description from collections where collection_name = (select collection_name from collections order by collection_name desc limit 1)
select collection_description from collections where collection_name = 'Best'
select parent_collection_name from collections where collection_name = 'Nice'
select parent_collection_name from collections where collection_name = 'Nice'
select collection_name from collections where parent_collection_id not in (select parent_collection_id from collections)
select collection_name from collections where collection_id not in (select parent_collection_id from collections)
select document_id from (select document_id, count(*) from document_objects group by document_id having count(*) > 1)
select document_id from (select document_id, count(distinct child) from document_objects group by document_id having count(distinct child) > 1)
select count(*) from collections where collection_name = (select collection_name from collections order by collection_name desc limit 1)
select count(distinct collection_id) from collections where collection_name = 'Best'
select document_id from document_objects where owner = 'Ransom'
select document_object_id from document_subset_members where related_document_object_id in (select document_object_id from document_objects where owner = 'Ransom')
select collection_subsets.collection_subset_id, collection_subsets.collection_subset_name, count(*) from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id group by collection_subsets.collection_subset_id, collection_subsets.collection_subset_name
select collection_subsets.collection_subset_id, collection_subsets.collection_subset_name, count(*) from collection_subsets left join collection_subset_members on collection_subsets.collection_subset_id = collection_subset_members.collection_subset_id group by collection_subsets.collection_subset_id, collection_subsets.collection_subset_name
select document_id, count(child) from document group by document_id having count(child) = (select max(count(child)) from (select count(child) from document group by document_id))
select document_object_id, count(*) from document_objects group by document_object_id
with documentcounts document_id, count(related_document_id) from document_subset_members group by document_id) select document_id, count(related_document_id) from documentcounts where count(related_document_id) = documentcounts min(count(related_document_id)) from documentcounts)
select document_object_id from document_objects group by document_object_id order by count(*) asc limit 1
select d.document_id, count(d.related_document_id) from document d left join document_subset_members ds on d.document_subset_id = ds.document_subset_id group by d.document_id having count(ds.related_document_id) between 2 and 4
select dcoument_id, count(distinct related_document_object_id) from document_subset_members group by dcoument_id having count(related_document_object_id) between 2 and 4
select owner from document_objects where document_object_id in (select related_document_object_id from document_subset_members where related_document_object_id = (select document_object_id from document_objects where owner = 'Braeden'))
select distinct owner from document_objects where document_object_id in (select related_document_object_id from document_subset_members where related_document_object_id = (select document_object_id from document_objects where owner = 'Braeden'))
select distinct document_subsets.document_subset_name from document_subsets join document_subset_members on document_subset_members.document_subset_id = document_subset_members.document_subset_id join document_objects on document_objects.document_object_id = document_objects.document_object_id where document_objects.owner = 'Braeden'
select distinct document_subsets.document_subset_name from document_objects join document_subset_members on document_objects.document_subset_id = document_subset_members.document_subset_id join document_subsets on document_subset_members.document_subset_id = document_subsets.document_subset_id where document_objects.owner = 'Braeden'
select document_subset_id, document_subset_name, count(distinct document_subset_id) from document_subsets group by document_subset_id, document_subset_name
select subset_id, document_subset_name, count(distinct document_subset_id) from document_subsets group by subset_id
select subset_id, document_subset_name, count(distinct document_subset_id) from document_subsets group by document_subset_id order by count(distinct document_subset_id) desc limit 1
select ds.document_subset_id, ds.document_subset_name, count(distinct d.document_subset_id) from document_subsets ds where exists (select 1 from document_subsets ds where ds.document_subset_id = ds.document_subset_id group by ds.document_subset_id having count(distinct ds.document_subset_id) = (select max(count(distinct.document_subset_id)) from (select count(distinct d) from document_subsets group by ds.document_subset_id))
select document_subset_id from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_id from document_subsets where document_subset_name = 'Best for 2000'
select document_subset_name, document_subset_id from document_subsets where document_subset_id in (select document_subset_id from document_subset_members)
select document_subset_name, document_subset_id from document_subsets
select collections.collection_name from collections join documents_in_collections on documents_in_collections.collection_id = collections.collection_id join document_objects on document_objects.document_object_id = documents_in_collections.document_object_id where document_objects.owner = 'Ransom'
select collections.collection_name from collections join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = 'Ransom'
select count(*), document_id from documents_in_collections group by document_id
select document_object_id, count(*) from documents_in_collections group by document_object_id
select count(*) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_subsets on documents_in_collections.document_subset_id = document_subsets.document_subset_id where collections.collection_name = 'Best'
select count(*) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_subsets on documents_in_collections.document_subset_id = document_subsets.document_subset_id where collections.collection_name = 'Best'
select document_object_id from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = 'Best'
select count(distinct d.document_object_id) from documents_in_collections d inner join collections c on d.collection_id = c.collection_id where c.collection_name = 'Best'
select collections.collection_name, collections.collection_id, count(documents_in_collections.document_id) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id group by collections.collection_id order by count(documents_in_collections.document_id) desc limit 1
select collections.collection_name, collections.collection_id, count(*) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id group by collections.collection_id order by count(*) desc limit 1
select document_subset_id from document_subsets where document_subset_name = '2000' intersect select document_subset_id from documents_in_collections join collection_subsets on documents_in_collections.collection_id = collection_subsets.collection_id where collection_subsets.collection_subset_name = 'Best'
select distinct document_object_id from document_objects join document_subset_members on document_objects.document_object_id = document_subset_members.document_object_id join collection_subsets on document_subset_members.document_subset_id = collection_subsets.document_subset_id where document_subsets.document_subset_name = 'Best for 2000' and collection_subsets.collection_name = 'Best'
select d.document_id from documents_in_collections d inner join collections c on d.collection_id = c.collection_id inner join document_subsets ds on d.document_subset_id = ds.document_subset_id where c.collection_name = 'Best' and ds.document_subset_name!= 2000
select distinct d.document_object_id from documents_in_collections d inner join collections c on d.collection_id = c.collection_id inner join document_subset_members ds on ds.document_object_id = ds.document_object_id where c.collection_name = 'Best' and ds.document_subset_id not in (select_subset_id from collection_subset_id where collection_name = 'Best for 2000')
select document_subset_id from document_subsets where document_subset_name = '2000' union select document_subset_id from documents_subset_members join collection_subset_members on documents_subset_members.document_subset_id = collection_subset_members.document_subset_id where collection_subsets.collection_subset_name = 'Best'
select distinct document_subset_id from document_subsets where document_subset_name = 'Best for 2000' or document_subset_id in (select document_subset_id from documents_in_collections where collection_subset_id in (select collection_subset_id from collections where collection_name = 'Best'))
select collection_name from collections where parent_collection_id in (select related_collection_id from collection_subset_members where collection_id = collections.collection_id where collection_name = (select collection_name from collections where collection_name = (select collection_name from collections where collection_name = (select collection_name from collections where collection_name = 'Best'))
select collection_name from collections where collection_id in (select related_collection_id from collection_subset_members where collection_id = collections.collection_id) order by collection_name desc limit 1
select count(*) from collections where collection_id in (select related_collection_id from collection_subset_members where collection_id = collections.collection_id where collection_name = 'Best')
select count(distinct collection_id) from collections where collection_name = 'Best'
select collection_subset_name from collection_subsets where collection_subset_id = (select collection_subset_id from collections order by collection_subset_name desc limit 1)
select collection_subsets.collection_subset_name from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_id where collections.collection_name = 'Best'
select count(*) from songs where name like '%love%'
select name from songs order by name asc
select name, language from songs
select max(voice_sound_quality), min(voice_sound_quality) from performance_score
select performance_score.voice_sound_quality, performance_score.rhythm_tempo, performance_score.stage_presence from performance_score join participants on performance_score.participant_id = participants.id where participants.name = 'Freeway'
select id, language, original_artist from songs where name!= 'Love'
select name, original_artist from songs where english_translation = 'All the streets of love'
select distinct performance_score.stage_presence from performance_score join songs on performance_score.songs_id = songs.id where songs.language = 'english'
select participants.id, participants.name from performance_score join participants on performance_score.participant_id = participants.id group by performance_score.participant_id having count(*) >= 2
select id, name, popularity from participants order by count(*) desc
select participants.id, participants.name from performance_score join participants on performance_score.participant_id = participants.id where performance_score.rhythm_tempo, voice_sound_quality = 5
select performance_score.voice_sound_quality from performance_score join songs on performance_score.songs_id = songs.id where songs.name = 'The balkan Girls' and songs.language = 'english'
select songs.id, songs.name from performance_score join songs on performance_score.songs_id = songs.id join participants on performance_score.participant_id = participants.id group by songs.id order by count(*) desc limit 1
select count(*) from performance_score where stage_presence < 7 or stage_presence > 9
select count(*) from songs where id not in (select songs_id from performance_score)
select avg(performance_score.rhythm_tempo), songs.language from performance_score join songs on performance_score.songs_id = songs.id group by songs.language
select distinct participants.name from performance_score join participants on performance_score.participant_id = participants.id join songs on performance_score.songs_id = songs.id where songs.english_translation = 'english'
select p.name, p.popularity from participants p where exists (select 1 from performance_score ps join songs s on ps.song_id = s.id where s.language = 'croatian' and ps.participant_id = p.id) and exists (select 1 from performance_score ps join songs s on ps.song_id = song_id where s.language = 'engl' and p.participient_id = p.id)
select name from songs where name like '%is%'
select original_artist from songs where id in (select songs_id from performance_score where rhythm_tempo > 5) order by voice_sound_quality desc
select count(*) from city
select count(*) from city
select distinct state from city
select distinct state from city
select count(distinct country) from city
select count(distinct country) from city
select city_name, city_code, state, country from city
select city_name, city_code, state, country from city
select latitude, longitude from city where city_name = 'Baltimore'
select latitude, longitude from city where city_name = 'Baltimore'
select city_name from city where state = 'PA'
select city_name from city where state = 'PA'
select count(*) from city where country = 'Canada'
select count(*) from city where country = 'Canada'
select city_name from city where country = 'United States' order by latitude
select city_name from city order by latitude asc
select state, count(*) from city group by state
select state, count(*) from city group by state
select country, count(*) from city group by country
select country, count(*) from city group by country
select state from city group by state having count(*) >= 2
select state from city group by state having count(*) >= 2
select state from city group by state having count(city_code) = (select max(count(city_code)) from (select count(city_code) from city group by state))
select state from city group by state having count(city_code) = (select max(count(city_code)) from (select count(city_code) from city group by state))
with citycounts country, count(city_code) from city group by country) select country from citycounts where count(city_code) = citycounts min(count(city_code)) from citycounts)
select country from city group by country having count(city_code) = (select min(count(city_code)) from (select count(city_code) from city group by country))
select fname, lname from student where stuid in (select stuid from student where state = 'MD')
select fname
select count(*) from student where city_code in (select city_code from city where country = 'China')
select count(*) from student where city_code in (select city_code from city where country = 'China')
select fname, major from student where city_code = "baltimore"
select fname, major from student where city_code = "baltimore"
select country, count(*) from student join city on student.city_code = city.city_code group by country
select country, count(*) from student group by country
select city_name, count(*) from student join city on student.city_code = city.city_code group by city.city_name
select city_name, count(*) from city join student on city.city_code = student.city_code group by city.city_code
select state from student group by state order by count(*) desc limit 1
select city.state from city join student on city.city_code = student.city_code group by city.state order by count(*) desc limit 1
with countedcounts country, count(stuid) from city left join student on city.city_code = student.city_code group by country) select country from countedcounts where count(stuid) = countedcounts min(count(stuid)) from countedcounts)
select country from city group by country order by count(*) asc limit 1
select city_name from city where city_code in (select city_code from student group by city_code having count(*) >= 3)
select city_name from city where city_code in (select city_code from student group by city_code having count(*) >= 3)
select state from city group by state having count(*) > 5
select state from student group by state having count(*) > 5
select stuid from student where country!= 'USA'
select stuid from student where country!= 'United States'
select stuid from student where sex = 'F' and state = 'PA'
select stuid from student where sex = 'F' and state = 'PA'
select stuid from student where sex = 'M' and country!= 'USA'
select stuid from student where sex = 'M' except select stuid from student where sex = 'M'
select distance from direct_distance where city_code = "bal" and city_code = "chi"
select distance from direct_distance where city_code = "bal" and city_code = "chi"
select distance from direct_distance where city_code = (select city_code from city where city_name = 'Boston') and city_code = 'Newark'
select distance from direct_distance where city_code in (select city_code from city where city_name = 'Boston' intersect select city_code from direct_distance where city_name = 'Newark')
select avg(distance), min(distance), max(distance) from direct_distance between city2_code and city1_code
select avg(distance), min(distance), max(distance) from direct_distance where city_code = direct_distance.city_code
select city_code from city join direct_distance on city.city_code = direct_distance.city2_code order by direct_distance.distance desc limit 2
select city_code from city where city_code in (select city2_code from direct_distance where distance = (select max(distance) from direct_distance))
select city_code from city where city_code in (select city2_code from direct_distance where distance > (select avg(distance) from direct_distance))
select city_code from city where city_code in (select city2_code from direct_distance where distance > (select avg(distance) from direct_distance))
select city_code from city where city_code in (select city2_code from direct_distance where distance < 1000)
select city_code from city where city_code in (select city2_code from direct_distance where distance < 1000)
select sum(distance) from direct_distance join city on direct_distance.city2_code = city.city_code where city.city_name = 'Bal'
select sum(distance) from direct_distance where city_code = "bal" and city_code = "city2_code";
select avg(distance) from direct_distance where city_code = (select city_code from city where city_name = 'Boston')
select avg(distance) from direct_distance where city_code = (select city_code from city where city_name = 'Boston')
select city_name from city where city_code in (select city_code from direct_distance where city_code = (select city_code from direct_distance where distance = "chicago" ))
select city_name from city where city_code in (select city_code from direct_distance where distance = (select max(distance) from direct_distance where city_code = 'Chicago'))
select city_name from city where distance = (select min(distance) from direct_distance where city_code = direct_distance.city2_code) and city_code in (select city_code from city where city_code = direct_distance.city_code)
select city_name from city where city_code in (select city_code from direct_distance where distance = (select max(distance) from direct_distance where city_code = city2.city_code))
select city_code, sum(distance) from direct_distance join city on direct_distance.city2_code = city.city_code group by city_code
select city_code, city_name, sum(distance) from direct_distance join city on direct_distance.city2_code = city.city_code group by city.city_code
select city_name, avg(distance) from direct_distance join city on direct_distance.city2_code = city.city_code group by city.city_name
select city_name, avg(distance) from direct_distance where city2_code = city.city_code group by city_code
select distance from direct_distance join student on direct_distance.city_code = student.city_code join direct_distance on student.stuid = direct_distance.stuid join linda on direct_distance.city_code = student.city_code join tracy on student.stuid = tracy.stuid where linda.fname = 'Linda' and lname = 'Tracy' Kim'
select distance between direct_distance.city2_code and direct_distance.city1_code from city join direct_distance on city.city_code = direct_distance.city2_code join student on student.stuid = direct_distance.stuid where student.fname = 'Linda Smith' and student.lname = 'Tracy Kim'
select student.fname, student.lname from student join direct_distance on student.city_code = direct_distance.city_code join advisor on student.advisor = advisor.linda_smith order by direct_distance.distance limit 1
select student.fname
select state from city where exists (select 1 from student where student.stuid = city.city_code and student.fname = 'Linda')
select state from city where exists (select 1 from student where student.stuid = city.city_code and student.fname = 'Linda')
select * from sailors where age > 30
select * from sailors where age > 30
select name, age from sailors where age < 30
select name, age from sailors where age < 30
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.sid = 1
select distinct reserves.sid from reserves join sailors on reserves.sid = sailors.sid where sailors.sid = 1
select s.name from sailors s where exists (select 1 from reserves r where r.sid = s.sid and r.bid = 102)
select sailor.name from sailors join reserves on sailors.sid = reserves.sid where reserves.bid = 102
select distinct bid from boats
select sid from reserves
select name from sailors where name like '%e%'
select name from sailors where name like '%e%'
select distinct sid from sailors where age > (select max(age) from sailors)
select distinct sid from sailors where age!= (select min(age) from sailors)
select distinct name from sailors where age > (select max(age) from sailors where rating > 7)
select distinct name from sailors where age > (select min(age) from sailors where rating > 7)
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid
select s.name, s.id from sailors s join reserves r on s.sid = r.sid group by s.sid having count(r.bid) >= 1
select sailors.sid, sailors.name from sailors join reserves on sailors.sid = reserves.sid group by reserves.sid having count(*) > 1
select distinct sailors.name from sailors join reserves on sailors.sid = reserves.sid group by reserves.sid having count(*) >= 2
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.bid in (select bid from boats where color ='red' or colors = 'blue')
select distinct s.sid from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color ='red' or b.color = 'blue'
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.bid in (select bid from boats where color ='red' or boats.color = 'blue')
select s.name, s.id from sailors s join reserves r on s.sid = r.sid where r.bid in (select bid from boats where color ='red' or 'blue')
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.bid in (select bid from boats where color ='red' intersect select bid from boats where color = 'blue')
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color ='red' intersect select sailors.sid from sailors join reserves on sailors.sid = reserves.sid where boats.color = 'blue'
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color ='red' intersect select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where boats.color = 'blue'
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color ='red' intersect select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where boats.color = 'blue'
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select name, sid from sailors where sid not in (select sid from reserves)
select name, sid from sailors where sid not in (select sid from reserves)
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select s.name from sailors s where exists (select 1 from reserves rb where rb.sid = s.sid and rb.bid = 103)
select s.name from sailors s where exists (select 1 from reserves rb where rb.sid = s.sid and rb.bid = 103)
select name from sailors s where rating > (select max(rating) from sailors where name = 'luis')
select name from sailors where rating > (select max(rating) from sailors where name = 'Luis')
select name from sailors s where s.rating > (select max(rating) from sailors where name = 'luis')
select name from sailors where rating > (select max(rating) from sailors where name = 'luis')
select s.name, s.id from sailors s join reserves r on s.sid = r.sid where s.rating > 2 and r.sid = r.sid
select s.name, s.id from sailors s where s.rating >= 3 and s.sid in (select r.sid from reserves r join boats b on r.bid = b.bid)
select name, age from sailors where age = (select max(age) from sailors)
select name, age from sailors where age = (select max(age) from sailors)
select count(*) from sailors
select count(*) from sailors
select avg(age) from sailors where rating = 7
select avg(age) from sailors where rating = 7
select count(*) from sailors where name like 'D%'
select count(*) from sailors where name like 'D%'
select avg(rating), max(age) from sailors
select avg(rating), max(age) from sailors
select boats.name, count(reservations.sid) from boats left join reserves on boats.bid = reserves.sid group by boats.name
select boats.name, count(reservations.sid) from boats left join reserves on boats.bid = reserves.sid group by boats.name
select count(*), boats.name from reserves join boats on reserves.sid = boats.sid group by boats.sid having count(*) > 50
select count(*), boats.name from reserves join boats on reserves.bid = boats.bid where boats.id > 50 group by boats.name
select count(*), boats.name from boats join reserves on boats.bid = reserves.bid group by boats.name having count(*) > 1
select count(*), boats.name from boats join reserves on boats.bid = reserves.sid group by boats.name having count(*) > 1
select count(*), boats.name from reserves join sailors on reserves.sid = sailors.sid group by boats.name
select count(*), boats.name from sailors join reserves on sailors.sid = reserves.sid where sailors.sid > 1 group by boats.name
select s.rating, avg(s.age) from sailors s where exists (select 1 from reserves rb join boats b on rb.bid = b.bid where rb.color ='red' group by rb.sid) order by s.rating
select s.rating, avg(s.age) from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color ='red' group by s.rating
select name, rating, age from sailors order by rating, age
select name, rating, age from sailors order by rating, age
select count(*) from boats
select count(*) from boats
select count(*) from boats where color ='red'
select count(*) from boats where color ='red'
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select s.name from sailors s where s.rating > (select max(rating) from sailors where sid in (select sid from reserves where bid ='red'))
select s.name from sailors s where s.rating > (select min(s.rating) from sailors s join reserves r on s.sid = r.sid where r.color ='red')
select max(rating) from sailors
select max(rating) from sailors
select s.name from sailors s where exists (select 1 from reserves r join boats b on r.bid = b.bid where r.sid = s.sid and b.name = 'Melon')
select s.name from sailors s where exists (select 1 from reserves rb join boats b on rb.bid = b.bid where rb.sid = s.sid and b.name ='melon')
select name, age from sailors order by rating desc
select name, age from sailors order by rating desc
select model from headphone where price = (select max(price) from headphone);
select model from headphone order by price desc limit 1
select distinct model from headphone order by model
select distinct model from headphone order by model
select class from headphone group by class having count(headphone_id) = (select max(count(headphone_id)) from (select count(headphone_id) from headphone group by class))
select class from headphone group by class having count(headphone_id)(headphone_id) = (select max(count(headphone_id)) from (select count(headphone_id)(headphone_id) from headphone group by class))
select class from headphone group by class having count(*) > 2
select class from headphone group by class having count(*) <= 2
select count(*), class from headphone where price > 200 group by class
select class, count(*) from headphone where price > 200 group by class
select count(distinct earpads) from headphone
select count(distinct earpads) from headphone
select earpads from headphone group by earpads order by count(*) desc limit 2
select earpads from headphone group by earpads order by count(*) desc limit 2
select model, class, construction from headphone where price = (select min(price) from headphone);
select model, class, construction from headphone where price = (select min(price) from headphone)
select construction, avg(price) from headphone group by construction
select construction, avg(price) from headphone group by construction
select class from headphone where earpads = 'bowls' intersect select class from headphone where earpads = 'comfort pads'
select class from headphone where earpads = 'bowls' intersect select class from headphone where earpads = 'comfort pads'
select earpads from headphone where construction!= 'plastic'
select earpads from headphone where construction!= 'plastic'
select model from headphone where price < (select avg(price) from headphone)
select model from headphone where price < (select avg(price) from headphone)
select name from store order by date_opened
select name from store order by date_opened asc
select name, parking from store where neighborhood = 'Tarzana'
select name, parking from store where neighborhood = 'Tarzana'
select count(distinct neighborhood) from store
select count(distinct neighborhood) from store
select neighborhood, count(*) from store group by neighborhood
select neighborhood, count(*) from store group by neighborhood
select store.name, count(*) from stock join store on stock.store_id = store.store_id group by stock.store_id order by count(*) desc limit 1
select store.name, sum(stock.quantity) from stock join store on stock.store_id = store.store_id where stock.headphone_id = headphone.headphone_id group by stock.store_id
select distinct s.name from store s left outer join stock st on s.store_id = st.store_id where st.store_id is null
select name from store where store_id not in (select store_id from stock where quantity > 0)
select model from headphone except select model from headphone where headphone_id in (select headphone_id from stock)
select model from headphone where headphone_id not in (select headphone_id from stock)
select h.model from headphone h join stock s on h.headphone_id = s.headphone_id group by h.headphone_id having sum(s.quantity) = (select max(sum(quantity)) from (select sum(quantity) from stock group by headphone_id))
select headphone.model from headphone join stock on headphone.headphone_id = stock.headphone_id group by stock.headphone_id order by sum(quantity) desc limit 1
select count(*) from stock join headphone on stock.headphone_id = headphone.headphone_id join store on stock.store_id = store.store_id where store.name = 'Woody'
select sum(stock.quantity) from stock join headphone on stock.headphone_id = headphone.headphone_id join store on stock.store_id = store.store_id where store.name = 'Woodman'
select neighborhood from store except select neighborhood from store where store_id in (select store_id from stock where headphone_id = headphone)
select distinct store.neighborhood from store join stock on store.store_id = stock.store_id join headphone on stock.headphone_id = headphone.headphone_id where stock.headphone_id is null
select count(*) from author
select count(*) from author
select count(*) from paper
select count(*) from paper
select count(*) from affiliation
select count(*) from affiliation
select count(*) from paper where venue = "Naacl 2000";
select count(*) from paper where venue = "Naacl" and year = 2000
select count(*) from paper where year = 2009 and author_id = ( select author_id from author_list where author_id = ( select author_id from affiliation where name = "Columbia University" );
select count(*) from affiliation join author_list on affiliation.affiliation_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where affiliation.name = "Columbia University" and paper.year = 2009;
select name, address from affiliation
select name, address from affiliation
select venue, year from paper order by year
select distinct venue from paper order by year
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join affiliation on author_list.affiliate_id = affiliation.affiliate_id where affiliation.name = 'Harvard University'
select paper.title, paper.paper_id from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Harvard University'
select paper.title, paper.paper_id from author_list join paper on author_list.author_id = paper.author_id where author.name = "Mckeown"
select paper.title, paper.paper_id from author_list join paper on author_list.author_id = paper.author_id where author.name = 'Mckeown'
select paper.title, paper.paper_id from author_list join author on author_list.author_id = author.author_id join paper on author_list.paper_id = paper.paper_id join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = 'Stanford University' intersect select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id where affiliation.name = 'Columbia University'
select paper.title, paper.paper_id from paper join affiliation on paper.paper_id = affiliation.affiliation_id where affiliation.name = 'Stanford' intersect select paper.title, paper.paper_id from paper join affiliation on paper.paper_id = affiliation.affiliation_id where affiliation.name = 'Columbia'
select paper.title, paper.paper_id from author_list join author on author_list.author_id = author.author_id join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Kathleen' and author.name = 'Mckeown'
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = 'Kathleen' and author.name = 'Mckeown';
select paper.title, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'McKeown' except select author.name, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id where author.name = 'Rambow'
select paper.title, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'Mckeown' except select paper.title, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id where author.name = 'Rambow'
select paper.title, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'McKeown', author.name = 'Kathleen' or author.name = 'Rambow', author.name where author.author_id = 'Owen'
select paper.title, paper.paper_id from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = 'McKeown', author.name = 'Kathleen' or author.name = 'Rambow', author.name where author.author_id = 'Owen'
select name, count(*) from author join author_list on author.author_id = author_list.author_id group by author.author_id order by count(*) desc
select author.name, count(*) from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id group by author.author_id order by count(*)
select affiliation.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id order by count(*) asc
select name from affiliation order by count(distinct paper_id) desc
select author.name from author join author_list on author.author_id = author_list.author_id group by author_list.author_id having count(author_list.paper_id) > 50
select author.name from author join author_list on author.author_id = author_list.author_id group by author_list.author_id having count(author_list.paper_id) > 50
select author.name from author join author_list on author.author_id = author_list.author_id group by author_list.author_id having count(*) = 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id group by author.author_id having count(*) = 1
select venue, year from paper group by venue, year having count(paper_id) = (select max(count(paper_id)) from (select count(paper_id) from paper group by venue, year))
select venue, year from paper group by venue, year order by count(*) desc limit 1
select venue from paper group by venue order by count(*) limit 1
select venue from paper group by venue order by count(*) asc limit 1
select count(distinct citation.cited_paper_id) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id in (select paper_id from citation where cited_paper_id = 'A00-1002')
select count(distinct citation.paper_id) from citation join paper on citation.paper_id = paper.paper_id where paper.year = 2000 and paper.year = 1002
select count(*) from paper join citation on paper.paper_id = citation.paper_id where paper.year = 2012 and paper.year >= 1027
select count(*) from citation join paper on citation.paper_id = paper.paper_id where paper.year = 2012-1027
select citation.paper_id, count(citation.cited_paper_id) from citation join paper on citation.paper_id = paper.paper_id group by citation.paper_id order by count(citation.cited_paper_id) desc limit 1
select citation.paper_id, count(citation.cited_paper_id) from citation join paper on citation.paper_id = paper.paper_id group by citation.paper_id order by count(citation.cited_paper_id) desc limit 1
select title from paper where paper_id in (select paper_id from citation group by paper_id order by count(cited_paper_id) desc limit 1)
select p.title from paper p where p.paper_id in (select cite_paper_id from citation group by cite_paper_id order by count(cite_paper_id) desc limit 1)
select cite.cited_paper_id, count(cite.cited_paper_id) from paper join citation on paper.paper_id = citation.paper_id group by cite.cited_paper_id order by count(cite.cited_paper_id) desc limit 10;
select cite.cited_paper_id, count(*) from citation join paper on citation.paper_id = paper.paper_id group by cite.cited_paper_id order by count(*) desc limit 10
select count(*) from author join citation on author.author_id = citation.author_id where author.name = 'McKeown' and author.name = 'Kathleen'
select count(*) from author join citation on author.author_id = citation.author_id where author.name = 'Mckeown' and author.name = 'Kathleen'
select count(*) from author join citation on author.author_id = citation.author_id join paper on paper.paper_id = citation.paper_id where author.name = 'McKeown' and author.name = 'Kathleen';
select count(*) from author join citation on author.author_id = citation.author_id join paper on paper.paper_id = citation.paper_id where author.author_name = "Mckeown, Kathleen";
select author.name, sum(citation.cited_paper_id) from author join citation on author.author_id = citation.author_id group by author.author_id order by sum(citation.cited_paper_id) desc limit 1
select name, count(citation_id) from author where author_id in (select author_id from author_list group by author_id having count(citation_id) = (select max(count(citation_id)) from (select count(citation_id) from author_list group by author_id)))
select venue, year from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" intersect select venue, year from paper join author_list on author_list.paper_id = paper.paper_id where author.name = "Kathleen"
select venue, year from paper join author_list on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = "McKeown" and author.name = "Kathleen";
select venue, year from paper where venue = 'Columbia University'
select venue, year from paper where affiliation = 'Columbia University'
select author.name from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where paper.year = 2009 group by author.name order by count(*) desc limit 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id where paper.year = 2009 group by author.name order by count(*) desc limit 1
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliate_id where paper.year = 2009 order by count(*) desc limit 3
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliate_id group by affiliation.affiliate_id order by count(*) desc limit 3
select count(*) from affiliation join author_list on affiliation.affiliation_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where affiliation.name = "Columbia University" and paper.year <= 2009
select count(*) from paper where year <= 2009 and venue = 'Columbia University'
select count(*) from affiliation join author_list on affiliation.affiliation_id = author_list.author_id join paper on author_list.paper_id = paper.paper_id where affiliation.name = "stanford university" and paper.year >= 2000 and paper.year <= 2009;
select count(*) from paper where venue = 'Stanford University' and year between 2000 and 2009;
select paper.title from paper join author_list on paper.paper_id = author_list.paper_id group by paper.paper_id order by count(author_list.author_id) desc limit 1
select p.title from paper p group by p.paper_id having count(distinct a.author_id) = (select max(a2.author_id)) from (select count(distinct a2.author_id) from author_list a2 group by a2.paper_id))
select count(*) from author_list join author on author_list.author_id = author.author_id where author.name = 'McKeown' and author.name = 'Kathleen'
select count(distinct collaborators) from author_list join author on author_list.author_id = author.author_id where author.name = 'McKeown, kathleen'
select author.name from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.author_id = "Mckeown" and author.name = "Kathleen" group by author.name order by count(*) desc limit 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = "McKeown" and author.name = "Kathleen" group by author.name order by count(*) desc limit 1
select paper_id from paper where title like '%translation%'
select paper_id from paper where title like '%translation%'
select paper_id, title from paper where paper_id not in (select paper_id from citation)
select paper_id, title from paper where paper_id not in (select paper_id from citation)
select name from affiliation where address like '%china%' group by affiliation_id order by count(*) desc limit 1
select name from affiliation where address like '%china%' group by name order by count(*) desc limit 1
select count(*), venue from paper group by venue
select venue, count(*), year from paper group by venue
select affiliation.name, count(*) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.name
select affiliation.name, count(*) from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id group by affiliation.affiliation_id
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id having count(citation.cited_paper_id) > 50
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id having count(citation.cited_paper_id) > 50
select count(*) from author where author_id not in ( select author_id from author_list where paper_id in ( select paper_id from citation group by paper_id having count(cited_paper_id) > 50 ) )
select count(*) from author where author_id not in ( select author_id from author_list where paper_id in ( select paper_id from citation group by paper_id having count(cited_paper_id) > 50 ) );
select distinct author.name from author_list join paper on author_list.paper_id = paper.paper_id join venue on venue.venue_id = paper.venue where paper.year = 2009 and venue.venue = 'Naacl' intersect select distinct author.name from author_list join paper on author_list.paper_id = paper.paper_id join venue on author_list.venue_id = venue.venue_id where venue.year = 2009 and venue.venue = 'ACL'
select author.name from paper join author_list on paper.paper_id = author_list.paper_id join conference on paper.paper_id = author_list.paper_id where conference.year = 2009 and venue.venue = "Naacl" intersect select author.name from paper join author_list on paper.paper_id = author_list.paper_id join conference on paper.paper_id = conference.paper_id where conference.year = 2009 and venue.venue = "ACL"
select name from author where author_id not in (select author_id from author_list where affiliation_id in (select affiliation_id from paper where venue = 'ACL'))
select name from author where author_id not in (select author_id from author_list where affiliation_id in (select affiliation_id from paper where venue = 'ACL'))
select count(*) from conference
select count(*) from conference
select distinct conference_name from conference
select distinct conference_name from conference
select conference_name, year, location from conference
select conference_name, year, location from conference
select conference_name, count(*) from conference group by conference_name
select conference_name, count(*) from conference group by conference_name
select year, count(*) from conference group by year
select count(*), year from conference group by year
with countedconférences year, count(conférence_id) from conference group by year) select year from countedconférences where count(conférence_id) = countedconférences min(count(conference_id)) from countedconférences)
select year from conference group by year having count(conference_id) = (select min(count(conference_id)) from (select count(conference_id) from conference group by year))
select location from conference group by location having count(*) >= 2
select location from conference group by location having count(*) >= 2
select institution_name, location, founded from institution
select institution_name, location, founded from institution
select count(*) from institution where founded between 1850 and 1900
select count(*) from institution where founded between 1850 and 1900
select institution_name, location from institution order by founded desc limit 1
select institution_name, location from institution order by founded desc limit 1
select institution_name, (select count(*) from staff where institution_id = institution.institution_id) from institution where founded > 1800
select institution.institution_name, count(*) from institution join staff on institution.institution_id = staff.institution_id where institution.founded > 1800 group by institution.institution_id
select institution_name from institution where institution_id not in (select institution_id from staff)
select institution_name from institution where institution_id not in (select institution_id from staff)
select name from staff where age > (select avg(age) from staff)
select name from staff where age > (select avg(age) from staff)
select max(age), min(age) from staff where nationality = 'USA'
select max(age), min(age) from staff
select conference_name from conference where conference_id in (select conference_id from conference_participation where staff_id in (select staff_id from staff where nationality = 'CANADA'))
select conference.conference_name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where staff.nationality = 'Canada'
select s.name from staff s where exists (select 1 from conference_participation co where co.staff_id = s.staff_id and co.conference_id = cp.conference_id) and exists (select 1 from conference_participation co where co.staff_id = s.staff_id and co.role ='speaker')
select s.name from staff s where exists (select 1 from conference_participation co where co.staff_id = s.staff_id and co.conference_id = cp.conference_id) and exists (select 1 from conference_participation co where co.staff_id = s.staff_id and co.conference_name = 'Conference')
select name from staff where staff_id in (select staff_id from conference_participation where role = 'ACL' intersect select staff_id from conference_participation where role = 'NACCL')
select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference_participation.conference_id in (select conference_id from conference where conference_name = 'ACL' intersect select conference_id from conference_participation where conference_name = 'NACCL')
select name from staff where staff_id in (select staff_id from conference_participation where conference_id in (select conference_id from conference where year in (2003, 2004)))
select staff.name from conference_participation join staff on conference_participation.staff_id = staff.staff_id where conference.year >= 2003 and conference_participation.year <= 2004
select conference_name, year, (select count(*) from conference_participation where conference_id = conference.conference_id) from conference
select c.conference_id, c.conference_name, c.year, count(cp.participation_id) from conference c left join conference_participation cp on c.conference_id = cp.conference_id group by c.conference_id, c.conference_name, c.year
select conference_name from conference where conference_id in (select conference_id from conference_participation group by conference_id order by count(attendee_id) desc limit 2)
with desc)edconferences conference_name, desc)() over (order by count(staff_id) desc) from conference_participation group by conference_id) select conference_name from desc)edconferences where desc) <= 2
select name, nationality from staff where staff_id not in (select staff_id from conference_participation where conference_id = 'ACL')
select name, nationality from staff where staff_id not in (select staff_id from conference_participation where conference_id in (select conference_id from conference_participation where conference_name = 'ACL'))
select institution_name, location from institution where institution_id not in (select institution_id from conference_participation where year = 2004)
select i.institution_name, i.location from institution i left outer join conference c on i.institution_id = c.institution_id where c.year = 2004 and i.institution_id not in (select cp.institution_id from conference_participation cp group by cp.institution_id having count(distinct cp.staff_id) > 0)
select pilot_name from pilotskills where age = (select max(age) from pilotskills)
select p.pilot_name from pilotskills p where p.age = (select max(age) from pilotskills)
select pilot_name from pilotskills where age < (select avg(age) from pilotskills) order by age
select pilot_name from pilotskills where age < (select avg(age) from pilotskills) order by age asc
select * from pilotskills where age < 30
select * from pilotskills where age < 30
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age < 35
select p.pilot_name from pilotskills ps where ps.plane_name = 'Piper Cub' and p.age < 35
select location from hangar where plane_name = 'F-14 fighter'
select location from hangar where plane_name = 'F-14'
select count(distinct location) from hangar
select count(distinct location) from hangar
select plane_name from pilotskills where pilot_name = 'Jones' and age = 32
select plane_name from pilotskills where pilot_name = 'Jones' and age = 32
select count(*) from pilotskills where age > 40
select count(*) from pilotskills where age > 40
select count(*) from pilotskills join plane on pilotskills.plane_name = plane.b_52 bomber where pilotskills.pilot_name = (select sub.pilot_name from pilotskills sub join plane on pilotskills.plane_name = plane.b_52 bomber where pilotskills.age < 35)
select count(*) from pilotskills join plane on pilotskills.plane_name = plane.plane_name where plane.name = 'B-52' and pilotskills.age < 35
select pilot_name from pilotskills where plane_name = 'Piper Cub' and age = (select min(age) from pilotskills where plane_name = 'Piper Cub')
select p1.pilot_name from pilotskills p1 where p1.age = (select min(p2.age) from pilotskills p2 where p2.plane_name = 'Piper Cub')
select plane_name from pilotskills group by plane_name having count(*)(*) = (select max(count(*)) from (select count(*)(*) from pilotskills group by plane_name))
select plane_name from pilotskills where plane_name in (select plane_name from flight(*) group by plane_name having count(*) = (select max(count(*)) from (select count(*) from flight(*) group by plane_name)))
select plane_name from pilotskills where (select count(*) from pilotskills where plane_name = (select min(count(*)) from (select count(*) from pilotskills group by plane_name))
select plane_name from pilotskills where plane_name in (select plane_name from pilotskills group by plane_name having count(plane_name)(plane_name) = (select min(count(plane_name)) from (select count(plane_name)(plane_name) from pilotskills group by plane_name)))
select count(*) from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'chicago'
select count(distinct p1.pilot_name) from pilotskills p1 join hangar h on p1.plane_name = h2.plane_name where h1.location = 'Chicago'
select plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select plane_name from pilotskills where pilot_name = 'Smith' and age = 41
select count(distinct plane_name) from pilotskills
select count(distinct plane_name) from pilotskills
select count(*) from pilotskills where pilot_name = 'Smith'
select count(*) from pilotskills join plane on pilotskills.plane_name = planeskills.plane_name where pilotskills.pilot_name = 'Smith'
select count(*) from pilotskills where age > 40
select count(*) from pilotskills where age > 40 and plane_name in (select plane_name from pilotskills where age > 40)
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills order by age desc
select pilot_name from pilotskills order by age desc
select location from hangar order by plane_name
select location from hangar order by plane_name
select distinct plane_name from pilotskills order by plane_name
select distinct plane_name from pilotskills order by plane_name asc
select count(*) from pilotskills where age > 40 or age < 30
select count(*) from pilotskills where age > 40 or age < 30
select pilot_name, age from pilotskills where plane_name = 'Piper Cub' and age > 35, or plane_name = 'F-14 fighter' and age < 30
select pilot_name, age from pilotskills where plane_name in (select plane_name from Piper Cub where age > 35) or plane_name in (select plane_name from fighter where age < 30)
select pilot_name from pilotskills where plane_name = 'Piper Cub' except select pilot_name from pilotskills where plane_name = 'B-52 Bomber'
select p1.pilot_name from pilotskills p1 where exists (select 1 from pilotskills p2 where p2.plane_name = 'Piper Cub' and p1.pilot_name not in (select 1 from pilotskills p2 where p2.plane_name = 'B-52'))
select pilotskills.pilot_name from pilotskills join planeskills on pilotskills.plane_name = planeskills.plane_name where planeskills.plane_name = 'Piper Cub' intersect select pilotskills.pilot_name from pilotskills join planeskills on pilotskills.plane_name = planeskills.plane_name where planeskills.plane_name = 'B-52'
select p.pilot_name from pilotskills p where exists (select 1 from pilotskills ps where ps.plane_name = 'Piper Cub' and ps.pilot_name = p.pilot_name) and exists (select 1 from pilotskills ps where ps.plane_name = 'B-52' and ps.pilot_name = p.pilot_name)
select avg(age), min(age) from pilotskills
select avg(age), min(age) from pilotskills
select pilot_name from pilotskills where plane_name in (select plane_name from hangar where location = 'Austin' intersect select plane_name from hangar where location = 'Boston')
select pilot_name from pilotskills where plane_name in (select plane_name from hangar where location = 'Austin' intersect select plane_name from hangar where location = 'Boston')
select pilot_name from pilotskills where plane_name in (select plane_name from Piper Cub or plane_name in (select plane_name from fighter))
select pilot_name from pilotskills where plane_name in (select plane_name from Piper Cub or plane_name in (select plane_name from fighter))
select avg(age), plane_name from pilotskills group by plane_name
select plane_name, avg(age) from pilotskills group by plane_name
select type, count(*) from pilotskills group by type
select count(*), plane_name from pilotskills group by plane_name
select pilot_name, plane_name from pilotskills order by plane_name
select distinct plane_name, (select max(age) from pilotskills where plane_name = plane_name) from pilotskills order by plane_name
select plane_name, max(age), from pilotskills group by plane_name
select plane_name, pilot_name from pilotskills where age = (select max(age) from pilotskills where plane_name = pilotskills.plane_name)
select max(age), pilot_name from pilotskills group by pilot_name
select pilot_name, max(age) from pilotskills group by pilot_name
select hangar.location, avg(pilotskills.age), count(*) from hangar join pilotskills on hangar.plane_name = pilotskills.plane_name group by hangar.location
select count(*), hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name group by hangar.location
select count(*), plane_name from pilotskills group by plane_name having avg(age) < 35
select plane_name, (select count(*) from pilotskills where age < 35) from pilotskills group by plane_name
select hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where pilotskills.age = (select min(age) from pilotskills)
select hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where pilotskills.age = (select min(age) from pilotskills)
select pilotskills.pilot_name, pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'Austin'
select pilotskills.pilot_name, pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = 'austin'
select pilot_name from pilotskills where age > (select min(age) from pilotskills where plane_name = 'Piper Cub') order by pilot_name
select p1.pilot_name from pilotskills p1 where p1.age > (select max(p2.age) from pilotskills p2 where p2.plane_name = 'Piper Cub') order by p1.pilot_name
select count(*) from pilotskills where age < (select max(age) from pilotskills where plane_name = 'F-14 fighter')
select count(*) from pilotskills where age < (select min(age) from pilotskills where plane_name = 'F-14')
select distinct plane_name from pilotskills where plane_name like '%bomber%'
select distinct plane_name from pilotskills where plane_name like '%bomber%'
select count(*) from pilotskills where age > (select min(age) from pilotskills where plane_name = 'Piper Cub')
select count(*) from pilotskills where age > (select min(age) from pilotskills where plane_name = 'Piper Cub')
select name from district where area_km = (select max(area_km) from district)
select area_km, government_website from district where population = (select min(population) from district)
select name, population from district where area_km > (select avg(area_km) from district)
select max(area_km), avg(area_km) from district
select sum(population) from district where area_km in (select area_km from district order by area_km desc limit 3)
select district_id, name, government_website from district order by population
select name from district where government_website like '%gov%'
select district_id, name from district where population > 4000 or area_km > 3000
select name, speach_title from spokesman
select avg(points), avg(age) from spokesman where rank_position = 1
select name, points from spokesman where age < 40
select name from spokesman where age = (select max(age) from spokesman)
select spokesman_id from spokesman where points < (select avg(points) from spokesman)
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by spokesman_district.district_id order by count(*) desc limit 1
select spokesman.name from spokesman join spokesman_district on spokesman.spokesman_id = spokesman_district.spokesman_id where spokesman_district.start_year < 2004
select district.name, count(spokesman_id) from spokesman_district join district on spokesman_district.district_id = district.district_id group by district.district_id
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 1 intersect select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id where spokesman.rank_position = 2
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by spokesman_district.district_id having count(*) > 1
select count(*) from district where district_id not in (select district_id from spokesman_district)
select name from spokesman where spokesman_id not in (select spokesman_id from spokesman_district)
select sum(population), avg(population) from district where district_id in (select district_id from spokesman_district)
select title from sculptures where year = (select max(year) from sculptures)
select title from sculptures order by year desc limit 1
select title, location from paintings where year = (select min(year) from paintings)
select title, location from paintings where year = (select max(year) from paintings)
select title from sculptures where location = 226
select title from sculptures where location = 226
select title, location from paintings
select title, location from paintings
select title, location from sculptures
select title, location from sculptures
select medium from paintings where paintingid = 80
select medium from paintings where paintingid = 80
select fname, lname from artists where birthyear > 1850
select fname
select title, year from sculptures where location!= 226
select title, year from sculptures where location!= 226
select distinct artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select fname, lname from artists where deathyear = (select max(deathyear) from artists)
select lname
select a.birthyear from artists a where a.deathyear = (select min(deathyear) from artists)
select a.birthyear from artists a where a.deathyear = (select min(deathyear) from artists)
select fname, birthyear from artists where deathyear = (select max(deathyear) from artists)
select fname, birthyear from artists where deathyear = (select max(deathyear) from artists)
select count(*) from paintings where location = 240
select count(*) from paintings join gallery on paintings.paintingid = gallery.240
select count(*) from artists join paintings on artists.artistid = paintings.artistid where artists.deathyear = (select max(deathyear) from artists)
select count(*) from artists join paintings on artists.artistid = paintings.artistid where artists.deathyear = (select max(deathyear) from artists)
select paintings.title, paintings.year from artists join paintings on artists.artistid = paintings.paintingid where artists.fname = 'Mary'
select paintings.title, paintings.year from artists join paintings on artists.artistid = paintings.paintingid where artists.fname = 'Mary'
select paintings.width_mm from artists join paintings on artists.artistid = paintings.paintingid where artists.birthyear < 1850
select width_mm from paintings where painterid in (select artistid from artists where birthyear < 1850)
select paintings.location, paintings.medium from artists join paintings on artists.artistid = paintings.paintingid where artists.fname = 'Pablo'
select paintings.location, paintings.medium from artists join paintings on artists.artistid = paintings.paintingid where artists.fname = 'Pablo'
select a.fname, a.lname from artists a where exists (select 1 from paintings p where p.paintingid = s.paintingid and s.sculptureid = m.sculptureid) and exists (select 1 from sculptures s where s.sculptureid = m.sculptureid)
select a.fname
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = 'oil' intersect select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = 'lithographic'
select a.fname, a.lname from artists a where exists (select 1 from paintings p where p.paintingid = a.artistid and p.medium = 'oil') and exists (select 1 from paintings p where p.medium = 'lithographic')
select artists.birthyear from artists join paintings on artists.artistid = paintings.artistid where paintings.year = 1884 and paintings.medium = 'canvas'
select artists.birthyear from artists join paintings on artists.artistid = paintings.artistid where paintings.year = 1884
select distinct artists.fname from artists join paintings on artists.artistid = paintings.artistid where paintings.location = 241 and paintings.medium = 'oil'
select a.fname from artists a where exists (select 1 from paintings p where p.paintingid = a.artistid and p.location = 241 and p.medium = 'oil')
select medium, count(*) from paintings group by medium
select medium, count(*) from paintings group by medium
select avg(height_mm), medium from paintings group by medium
select avg(height_mm), medium from paintings group by medium
select count(*), location from paintings where year < 1900 group by location
select count(*), location from paintings where year < 1900 group by location
select title from paintings where medium = 'oil' and year > 1910
select title from paintings where medium = 'Oil' and year > 1910
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct painterid from paintings where medium = 'oil' and location = 240
select distinct title from paintings where height_mm > (select min(height_mm) from paintings where medium = 'canvas')
select distinct title from paintings where height_mm > (select min(height_mm) from paintings on paintings.medium)
select distinct paintingid from paintings where year > (select min(year) from paintings where location = 240)
select distinct paintingid from paintings where year > (select min(year) from paintings where location = 240)
select paintingid from paintings order by year desc limit 1
select paintingid from paintings order by year desc limit 1
select a.fname, a.lname from artists a where exists (select 1 from sculptures s where s.sculptorid = a.artistid and s.title like '%female%')
select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
select distinct title from paintings order by title
select distinct title from paintings order by title
select distinct title from paintings order by width_mm
select distinct title from paintings order by height_mm desc
select title from paintings join sculptures on paintings.paintingid = sculptures.sculptureid where paintings.year >= 1900 and sculptures.year <= 1950
select title from paintings, sculptures where year between 1900 and 1950
select paintings.title, sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid join artists on artists.artistid = 222
select paintings.title, sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid join artists on sculptures.artistid = artists.artistid where artists.artistid = 222
select artistid from paintings where year < 1900 group by artistid order by count(*) desc limit 1
select artistid from paintings where year < 1900 group by artistid order by count(*) desc limit 1
select a.fname from artists a where a.artistid in (select s.sculptorid from sculptures s group by s.sculptorid having count(s.sculptorid) = (select max(count(sculptorid)) from (select count(sculptorid) from sculptures group by sculptorid)))
select a.fname from artists a where a.artistid in (select s.sculptorid from sculptures s group by s.sculptorid having count(s.sculptorid) = (select max(count(sculptorid)) from (select count(sculptorid) from sculptures group by sculptorid)))
select title from paintings where width_mm < 600 or height_mm > 800
select title from paintings where width_mm < 600 or height_mm > 800
select location from paintings where year < 1885 or year > 1930
select location from paintings where year < 1885 or year > 1930
select paintingid from paintings where height_mm > 500 intersect select paintingid from paintings where width_mm < 2000
select paintingid from paintings where height_mm > 500 intersect select paintingid from paintings where width_mm < 2000
select location from paintings where medium = 'panel' intersect select location from paintings where medium = 'canvas'
select location from paintings where medium = 'panel' intersect select location from paintings where medium = 'canvas'
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select avg(height_mm), avg(width_mm) from paintings where medium = 'oil' and location = 241
select avg(height_mm), avg(width_mm) from paintings where medium = 'oil' and location = 241
select max(height_mm), max(paintingid) from paintings where year < 1900
select max(height_mm), paintingid from paintings where year < 1900
select max(height_mm), max(width_mm), year from paintings group by year
select max(height_mm), max(width_mm), year from paintings group by year
select avg(height_mm), avg(width_mm), painterid from paintings group by painterid order by name
select avg(height_mm), avg(width_mm), painterid from paintings group by painterid order by name
select artists.fname, count(*) from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) >= 2
select artists.fname, count(*) from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) >= 2
select artists.deathyear from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) <= 3
select artists.deathyear from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) < 4
select artists.deathyear from artists join (select artistid, count(sculptorid) from sculptures group by artistid) on artists.artistid = artist.artistid order by count(sculptorid) asc limit 1
select a.deathyear from artists a where (select count(*) from sculptures s where s.artistid = a.artistid) = (select min(count(*)) from (select count(*) from sculptures group by sculptorid))
select p.paintingid, p.height_mm from paintings p where p.width_mm = (select max(width_mm) from paintings where location = 240)
select p.paintingid, p.height_mm from paintings p where p.location = 240 and p.width_mm = (select max(width_mm) from paintings where location = 240)
select paintingid from paintings where year < (select min(year) from paintings where location = 240)
select p.paintingid from paintings p where p.year < (select min(year) from paintings where location = 240)
select paintingid from paintings where height_mm > (select max(height_mm) from paintings where year > 1900)
select paintingid from paintings where height_mm > (select max(height_mm) from paintings where year > 1900)
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.paintingid where paintings.medium = 'oil' group by artists.fname order by count(*) desc limit 3
select artists.fname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = 'oil' group by artists.fname order by count(*) desc limit 1
select paintingid, location, title from paintings where medium = 'oil' order by year
select paintingid, location, title from paintings where medium = 'oil' order by year
select year, location, title from paintings where height_mm > 1000 order by title
select year, location, title from paintings where height_mm > 1000 order by title
select a.fname, a.lname from artists a where exists (select 1 from paintings p where p.paintingid = a.artistid and p.paintingid not in (select s.sculptorid from sculptures s where s.sculptorid = p.sculptorid))
select fname, lname from artists where artistid not in (select sculptorid from sculptures) but artistid in (select painterid from paintings)
select distinct location from paintings where year < 1885 except select distinct location from sculptures where medium in (select medium from paintings where year <= 1885)
select location from paintings where year < 1885 and medium!= canvas
select count(*) from race
select count(*) from race
select winning_driver, winning_team from race order by winning_team asc
select winning_driver, winning_team from race order by winning_team
select winning_driver from race where pole_position!= 'Junior strous'
select winning_driver from race where pole_position!= 'Junior Strous'
select constructor from driver order by age asc
select distinct constructor from driver order by age asc
select distinct entrant from driver where age >= 20
select distinct entrant from driver where age >= 20
select max(age), min(age) from driver
select max(age), min(age) from driver
select count(distinct engine) from driver where age > 30 or age < 20
select count(distinct engine) from driver where age > 30 or age < 20
select driver_name from driver order by driver_name desc
select driver_name from driver order by driver_name desc
select driver.driver_name, race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name, race.race_name from driver join race on driver.driver_id = race.driver_id
select driver.driver_name, count(race.race_name) from driver left join race on driver.driver_id = race.driver_id group by driver.driver_id
select driver.driver_name, count(*) from driver join race on driver.driver_id = race.driver_id group by driver.driver_id
select age from driver where driver_id in (select driver_id from race group by driver_id having count(driver_id) = (select max(count(driver_id)) from (select count(driver_id) from race group by driver_id)))
select driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id order by count(*) desc limit 1
select driver.driver_name, driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id having count(*) >= 2
select driver.driver_name, driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id having count(*) >= 2
select race_name from race where driver_id in (select driver_id from driver where age >= 26)
select race_name from race where driver_id in (select driver_id from driver where age >= 26)
select driver_name from driver where constructor!= 'Bugatti'
select driver_name from driver where constructor!= 'Bugatti'
select constructor, count(*) from driver group by constructor
select constructor, count(*) from driver group by constructor
select engine from driver group by engine order by count(*) desc limit 1
select d.engine from driver d group by d.engine having count(d.engine) = (select max(count(engine)) from (select count(engine) from driver group by engine))
select engine from driver group by engine having count(*) >= 2
select engine from driver group by engine having count(*) >= 2
select driver_name from driver where driver_id not in (select driver_id from race)
select driver_name from driver where driver_id not in (select driver_id from race)
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select winning_team from race group by winning_team having count(*) > 1
select winning_team from race group by winning_team having count(*) > 1
select driver_name from driver where driver_id in (select driver_id from race where pole_position = 'James Hinchcliffe' intersect select driver_id from race where pole_position = 'Carl Skerlong')
select driver_name from driver where driver_id in (select driver_id from race where pole_position = 'James Hinchcliffe' intersect select driver_id from race where pole_position = 'Carl Skerlong')
select driver_name from driver where driver_id not in (select driver_id from race where pole_position = 'James Hinchcliffe')
select d.driver_name from driver d where not exists (select 1 from race r where r.driver_id = d.driver_id and r.pole_position = 'James Hinchcliffe')
select count(*) from languages
select count(*) from languages
select name from languages order by name asc
select name from languages order by name asc
select name from languages where name like '%ish%'
select name from languages where name like '%ish%'
select name from countries order by overall_score desc
select name from countries order by overall_score desc
select avg(justice_score) from countries
select avg(justice_score) from countries
select max(health_score), min(health_score) from countries where name!= 'Norway'
select max(health_score), min(health_score) from countries where name!= 'Norway'
select count(distinct language_id) from official_languages
select count(distinct language_id) from official_languages
select name from countries order by education_score desc
select name from countries order by education_score desc
select name from countries where politics_score = (select max(politics_score) from countries)
select name from countries where politics_score = (select max(politics_score) from countries)
select countries.name, languages.name from countries join official_languages on countries.id = official_languages.country_id
select countries.name, languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id
select language_id, count(distinct country_id) from official_languages group by language_id
select name, (select count(distinct country_id) from official_languages where language_id = languages.id) from languages
select ol.name from official_languages ol group by ol.language_id having count(ol.country_id)(ol.count(country_id)) = (select max(count(country_id)) from (select count(country_id)(country_id) from official_languages group by language_id))
select ol.name from languages ol join official_languages ol on ol.language_id = ol.language_id group by ol.language_id having count(ol.language_id) = (select max(count(language_id)) from (select count(language_id) from official_languages group by language_id))
select language_id from official_languages group by language_id having count(distinct country_id) >= 2
select languages.name from languages join official_languages on languages.id = official_languages.language_id group by languages.id having count(*) >= 2
select avg(overall_score) from countries where id in (select country_id from official_languages where language_id = 'english')
select avg(overall_score) from countries where id in (select country_id from official_languages where language_id = 'english')
select language_id from official_languages group by language_id order by count(*) desc limit 3
select languages.name from languages join official_languages on languages.id = official_languages.language_id group by official_languages.language_id order by count(*) desc limit 3
select official_languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id group by official_languages.language_id order by avg(countrys.overall_score) desc
select l.name from languages l join official_languages ol on l.id = ol.language_id join countries c on ol.country_id = c.id group by l.id order by avg(c.overall_score) desc
select c.name from countries c where c.id in (select ol.country_id from official_languages ol group by ol.country_id having count(ol.language_id) = (select max(count(language_id)) from (select count(language_id) from official_languages group by country_id)))
select c.name from countries c left join official_languages ol on c.id = ol.country_id group by c.id having count(ol.language_id) = (select max(count(language_id)) from (select count(language_id) from official_languages group by country_id) t)
select name from languages where id not in (select language_id from official_languages)
select name from languages where id not in (select language_id from official_languages)
select name from countries where id not in (select country_id from official_languages)
select name from countries where id not in (select country_id from official_languages)
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id where countries.overall_score > 95 intersect select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id where countries.overall_score < 90
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id where countries.overall_score > 95 and countries.overall_score < 90
select country, town_city from addresses
select country, town_city from addresses
select distinct a.county_state_province from properties a join addresses a on a.property_address_id = p.property_address_id
select county_state_province from properties
select property_features.property_feature_description from property_features join features on property_features.feature_id = features.feature_id where features.feature_name = 'rooftop'
select feature_description from features where feature_name = 'Rooftop'
select features.feature_name, features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by property_features.feature_id order by count(*) desc limit 1
select features.feature_name, features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by property_features.feature_id order by count(*) desc limit 1
select min(room_count) from rooms
select min(room_count) from properties
select count(*) from properties where parking_lots = 1 union select count(*) from properties where garage_lots = 1
select count(*) from properties where parking_lots = 1 union select count(*) from properties where garage_lots = 1
select user_category_code from users where user_category_description like '%mother%'
select age_categories.age_category_description from users join ref_age_categories on users.age_category_code = ref_age_categories.age_category_code where users.user_category_description like '%mother%'
select first_name from users where user_id in (select owner_user_id from properties group by owner_user_id having count(property_id) = (select max(count(property_id)) from (select count(property_id) from properties group by owner_user_id)))
select users.first_name from users join (select owner_user_id from properties group by owner_user_id having count(property_id) = (select max(count(property_id)) from (select count(property_id) from properties group by owner_user_id) tmp)) filtered on users.user_id = filtered.user_id
select avg(room_count) from properties where property_id in (select property_id from gardens)
select avg(room_count) from properties join property_features on properties.property_id = property_features.property_id join rooms on properties.room_id = rooms.room_id where property_features.feature_id like '%garden%'
select addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id where properties.room_type_code like '%pool%'
select addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id where properties.room_type_code = 'Swimming Pool'
select p.property_id, min(p.price_min) from properties p join vendors v on p.vendor_requested_price = v.requested_price group by p.property_id
select p.property_id, min(p.price_max) from properties p where p.vendor_requested_price = (select min(price_max) from properties)
select avg(room_count) from properties join rooms on properties.property_id = rooms.property_id group by properties.property_id
select avg(room_count) from rooms
select count(distinct room_size) from rooms
select count(distinct room_size) from rooms
select user_id, search_string from user_searches group by user_id having count(*) >= 2
select user_id, search_seq from user_searches group by user_id having count(*) >= 2
select search_datetime from user_searches order by search_datetime desc limit 1
select max(search_datetime) from user_searches
select search_datetime, search_string from user_searches order by search_string desc
select search_string, search_datetime from user_searches order by search_string desc
select addresses.zip_postcode from addresses join properties on addresses.address_id = properties.property_address_id except select addresses.zip_postcode from properties join user_property_history on properties.owner_user_id = user_property_history.owner_id group by addresses.address_code having count(*) <= 2
select distinct a.zip_postcode from addresses a where a.property_id not in (select p.property_id from properties p group by p.owner_user_id having count(distinct p.property_id) <= 2)
select ref_user_categories.age_category_description, users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) = 1
select users.user_id, users.user_category_code from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) = 1
select age_category_description from ref_age_categories where age_category_code in (select user_category_code from users where user_id in (select user_id from user_searches order by search_seq asc limit 1))
select age_category_code from users where user_id in (select user_id from user_searches where search_datetime = (select min(search_datetime) from user_searches))
select login_name from users where age_category_code = 'Senior' order by first_name
select login_name from users where age_category_code = 'Senior' order by first_name
select count(*) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 'Y'
select count(*) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 'Y'
select date_registered from users where login_name = 'ratione'
select date_registered from users where login_name = 'ratione'
select first_name, middle_name, last_name, login_name from users where is_seller = 1
select first_name, middle_name, last_name, login_name from users where is_seller = 'Y'
select line_1_number_building, line_2_number_street, town_city from addresses where line_1_number_street in (select line_2_number_street from addresses where line_3_area_locality = 'NY') and line_2_number_street in (select line_2_number_street from addresses where line_3_area_locality = 'NY')
select line_1_number_building, line_2_number_street, town_city from addresses where address_id in (select user_address_id from users where age_category_code = 1 group by user_address_id having count(user_id) = (select max(count(user_id)) from (select count(user_id) from users where age_category_category_code))
select count(distinct p.property_id) from properties p join property_features pf on p.property_id = pf.property_id group by p.property_id having count(distinct pf.feature_id) >= 2
select count(distinct property_id) from property_features group by property_id having count(distinct feature_id) >= 2
select properties.property_id, count(*) from properties join property_photos on properties.property_id = property_photos.property_id group by properties.property_id
select count(*), property_id from property_photos group by property_id
select user_id, count(*) from properties join property_photos on properties.property_id = property_photos.property_id group by user_id
select distinct p.owner_user_id, count(p.photo_id) from properties p join property_photos p on p.property_id = p.property_id group by p.owner_user_id
select sum(price_max) from properties join users on properties.owner_user_id = users.user_id where users.first_name = 'Single Mother' or users.last_name = 'Student'
select sum(price_max) from properties join users on properties.owner_user_id = users.user_id where users.first_name = 'Single Mother' or users.last_name = 'Student'
select user_property_history.datestamp, properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp
select user_property_history.datestamp, properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp
select property_type_description, property_type_code from ref_property_types where property_type_code = (select property_type_code from properties group by property_type_code order by count(*) desc limit 1)
select property_type_description, property_type_count(*) from ref_property_types where property_type_count(*) = (select max(count(*)) from (select count(*) from ref_property_types group by property_type_code) temp_tab)
select age_category_description from ref_age_categories where age_category_code = 'over 60'
select age_category_description from ref_age_categories where age_category_code = (select age_category_code from users where user_id = (select user_id from users where age_category_code = (select age_category_code from users where age_category_description = 'over 60'))
select room_size, count(*) from rooms group by room_size
select room_size, count(*) from rooms group by room_size
select addresses.country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = 'Robbie'
select addresses.country from users join addresses on users.user_category_code = addresses.address_id where users.first_name = 'Robbie'
select users.first_name, users.middle_name, users.last_name from users join user_property_history on users.user_id = user_property_history.owner_user_id join properties on user_property_history.property_id = properties.property_id
select distinct u.first_name
select search_string from user_searches where user_id not in (select user_id from properties)
select search_string from user_searches where user_id not in (select user_id from user_property_history)
select users.last_name, users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) >= 2 except select users.last_name, users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) >= 2
select users.last_name, users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) <= 2 intersect select users.last_name, users.user_id from users join user_property_history on users.user_id = user_property_history.owner_user_id group by users.user_id having count(*) >= 2
select count(*) from bike where weight > 780
select product_name, weight from bike order by price asc
select heat, name, nation from cyclist
select max(weight), min(weight) from bike
select avg(price) from bike where material = 'carbon cc'
select name, result from cyclist where nation!= 'Russia'
select distinct bike.id, bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id where cyclists_own_bikes.purchase_year > 2015
select bike.id, bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id group by cyclists_own_bikes.bike_id having count(*) >= 4
select c.id, c.name from cyclist c where exists (select 1 from cyclists_own_bikes co where co.cyclist_id = c.id group by co.cyclist_id having count(bike_id) = (select max(count(bike_id)) from (select count(bike_id) from cyclists_own_bikes group by cyclist_id)))
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.nation = 'Russia' or cyclist.nation = 'Great Britain'
select count(distinct heat) from cyclist
select count(*) from cyclist where id not in ( select cyclist_id from cyclists_own_bikes where purchase_year > 2015 )
select distinct bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.result > '4:21.558'
select bike.product_name, bike.price from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.name = 'Bradley Wiggins' intersect select bike.product_name, bike.price from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id where cyclist.name = 'Anton Tauler'
select name, nation, result from cyclist where id not in (select cyclist_id from cyclists_own_bikes)
select product_name from bike where material like '%fiber%'
select cyclist.id, count(*) from cyclists_own_bikes join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id group by cyclist.id order by cyclist.id
select g.flavor, g.price from goods g where g.price = (select max(price) from goods)
select id, flavor from goods where price = (select max(price) from goods)
select g.flavor, g.price from goods g where g.price = (select min(price) from goods)
select id, flavor from goods where price = (select min(price) from goods);
select id from goods where flavor = 'apple'
select id from goods where flavor = 'apple'
select id from goods where price < 3
select id from goods where price < 3
select distinct customers.id from customers join receipts on customers.id = receipts.customerid join goods on receipts.receipt = goods.id where goods.flavor = 'Lemon'
select distinct customers.id from customers join receipts on customers.id = receipts.customerid join goods on receipts.receipt = goods.id where goods.flavor = 'lemon'
select food, count(distinct customerid) from goods group by food
select goods.food, count(distinct items.customerid) from receipts join goods on receipts.receipt = goods.id group by goods.food
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count(*) >= 15
select customerid from receipts group by customerid having count(*) >= 15
select customers.lastname from customers join receipts on customers.id = receipts.customerid group by customers.id having count(*) > 10
select customers.lastname from customers join receipts on customers.id = receipts.customerid group by customers.id having count(*) > 10
select count(distinct item) from goods where flavor = 'Cake'
select count(distinct item) from items where item in (select item from goods where flavor = 'cake')
select distinct flavor from goods where food = 'Croissant'
select distinct flavor from goods where food = 'croissant'
select distinct items.item from receipts join items on receipts.receiptnumber = items.receiptnumber join customers on receipts.customerid = customers.id where customers.id = 15
select distinct items.item from receipts join items on receipts.receiptnumber = items.receiptnumber join customers on receipts.customerid = customers.id where customers.id = 15
select food, avg(price), max(price), min(price) from goods group by food
select food, avg(price), min(price), max(price) from goods group by food
select receiptnumber from items where item = 'cake' intersect select receiptnumber from items where item = 'cookie'
select receipts.receiptnumber from receipts join items on receipts.receipt = items.receipt where items.food = 'cake' intersect select receipts.receiptnumber from receipts join items on receipts.receipt = items.receipt where items.food = 'cookies'
select receipts.receiptnumber from items join receipts on items.receipt = receipts.receiptnumber join customers on receipts.customerid = customers.id where customers.lastname = 'Logan' and items.item = 'Crissant'
select receipts.receiptnumber from receipts join items on receipts.receipt = items.receipt where items.item = 'Croissant' and receipts.customerid = customers.id and customers.lastname = 'Logan'
select receipts.receiptnumber, receipts.date from receipts join items on receipts.receipt = items.receipt where items.price = (select max(price) from items)
select receipts.receiptnumber, receipts.date from receipts join items on receipts.receipt = items.receipt where items.price = (select max(price) from items)
select i.item from items i inner join receipts r on i.receipt = r.receiptnumber group by i.item order by count(r.receiptnumber) asc limit 1
select item from items group by item having count(receiptnumber)(receiptnumber) = (select min(count(receiptnumber)) from (select count(receiptnumber)(receiptnumber) from items group by item))
select food, count(*) from goods group by food
select count(*), food from goods group by food
select food, avg(price) from goods group by food
select food, avg(price) from goods group by food
select id from goods where flavor = 'apricot' and price < 5
select id from goods where flavor = 'apricot' and price < 5
select flavor from goods where price > 10
select flavor from goods where price > 10
select distinct id, price from goods where price < (select avg(price) from goods)
select distinct g.id, g.price from goods g where g.price < (select avg(price) from goods)
select distinct g.id from goods g where g.price < (select max(price) from goods where flavor = 'tart')
select distinct id from goods where price < (select max(price) from goods where flavor = 'tart')
select distinct receipts.receiptnumber from receipts join items on receipts.item = items.receipt where items.price > 13
select distinct receipts.receiptnumber from receipts join items on receipts.item = items.receipt where items.price > 13
select receipts.date from receipts join goods on receipts.receiptnumber = goods.id where goods.price > 15 and receipts.customerid = customers.id
select receipts.date from receipts join items on receipts.receipt = items.receipt where items.price > 15 and items.id = receipts.customerid
select * from goods where id like '%app%'
select * from goods where id like '%app%'
select g.id, g.price from goods g where g.id like '%70%'
select g.id, g.price from goods g where g.id like '%70%'
select lastname from customers order by lastname
select lastname from customers order by lastname
select id from goods order by id
select distinct id from goods order by id
select receipts.receipt from items join receipts on items.receipt = receipts.receiptnumber join goods on items.item = goods.id where goods.flavor = 'Apple flavor Pie' or items.item = receipts.item and receipts.customerid = 12
select receipts.receiptnumber from items join receipts on items.receipt = receipts.receiptnumber join goods on items.goodid = goods.id where goods.flavor = 'Apple Flavor' and items.id = 12 union select receipts.receiptnumber from receipts join items on receipts.receipt = items.receipt where items.id = 12
select receiptnumber, date from receipts where date = (select max(date) from receipts)
select receiptnumber, date from receipts where date = (select max(date) from receipts)
select receipts.date from receipts join items on receipts.receipt = items.receipt where receipts.date = (select min(date) from receipts join goods on receipts.id = goods.id where price > 10)
select distinct receiptnumber from receipts where date = (select min(date) from receipts where item = receipts.id) or good.price > 10
select id from goods where price between 3 and 7 and flavor = 'cookie' or flavor = 'cake'
select id from goods where price between 3 and 7
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
select avg(price) from goods where flavor = 'blackberry' or flavor = 'blueberry'
select avg(price) from goods where flavor in (blackberry, blueberry)
select min(price) from goods where flavor = 'cheese'
select g.price from goods g where g.flavor = 'cheese' and g.price = (select min(price) from goods where flavor = 'cheese')
select max(price), min(price), avg(price), flavor from goods group by flavor order by flavor
select max(price), min(price), avg(price), flavor from goods group by flavor order by flavor
select min(price), max(price), food from goods group by food order by food
select min(price), max(price), food from goods order by food
select date from receipts group by date order by count(*) desc limit 3
select date from receipts group by date order by count(*) desc limit 3
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid group by customers.id order by count(*) desc limit 1
select customerid, count(*) from receipts group by customerid order by count(*) desc limit 1
select date, count(distinct customerid) from receipts group by date
select date, count(*) from receipts group by date
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid join goods on receipts.receipt = goods.id where goods.flavor = 'Apple Flavor Tart'
select distinct customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid join goods on receipts.receipt = goods.id where goods.flavor = 'Apple' and items.item = tarts.item
select id from goods where price < (select max(price) from goods where flavor = 'cookies')
select id from goods where price < that of a croissant
select id from goods where price >= (select avg(price) from goods where flavor = 'cake')
select id from goods where price > (select avg(price) from goods)
select id from goods where price > 2 (select avg(price) from goods)
select id from goods where price > 2 times (select avg(price) from goods)
select id, flavor, food from goods order by price
select id, flavor, food from goods order by price
select id, flavor from goods order by flavor
select id, flavor from goods order by flavor
select item from items where receiptnumber in (select receiptnumber from receipts where flavor = 'chocolate' group by receiptnumber having count(receiptnumber) <= 10)
select i.item from items i inner join goods g on i.receipt = g.id where g.flavor = 'chocolate' group by i.item having count(i.receiptnumber) <= 10
select flavor from goods where food = 'cake' except select flavor from goods where food = 'tart'
select flavor from goods where flavor not in (select flavor from goods where id in (select id from items where item = 'Tart'))
select item from items group by item order by count(*) desc limit 3
select item from items group by item order by count(receiptnumber) desc limit 3
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum(receipts.price) > 150
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum(receipts.price) > 150
select customers.id from customers join goods on customers.id = goods.id group by customers.id having avg(goods.price) > 5
select avg(goods.price), goods.id from customers join receipts on customers.id = receipts.customerid join goods on receipts.receipt = goods.id group by goods.id having avg(goods.price) > 5
select date from receipts join goods on receipts.receiptnumber = goods.id group by date having sum(goods.price) > 100
select receipts.date from receipts join goods on receipts.receiptnumber = goods.id group by receipts.date having sum(goods.price) > 100
select count(*) from driver
select count(*) from driver
select count(*), make from driver where points > 150 group by make
select make, count(*) from driver where points > 150 group by make
select avg(age), make from driver group by make
select avg(age), make from driver group by make
select avg(laps) from driver where age < 20
select avg(laps) from driver where age < 20
select manager, sponsor from team order by car_owner
select manager, sponsor from team order by car_owner
select make from team group by make having count(*) > 1
select make from team group by make having count(*) > 1
select make from team where car_owner = 'Buddy Arrington'
select make from team where car_owner = 'Buddy Arrington'
select max(points), min(points) from driver
select max(points), min(points) from driver
select count(*) from driver where points < 150
select count(*) from driver where points < 150
select driver from driver order by age asc
select age from driver order by age asc
select driver from driver order by points desc
select driver from driver order by points desc
select driver.driver, country.country from driver join country on driver.country = country.country_id
select driver.name, country.country from driver join country on driver.country = country.country_id
select max(driver.points) from country join driver on country.country_id = driver.country where country.capital = 'Dublin'
select max(driver.points) from country join driver on country.country_id = driver.country where country.capital = 'Dublin'
select avg(driver.age) from country join driver on country.country_id = driver.country where country.official_native_language = 'english'
select avg(driver.age) from country join driver on country.country_id = driver.country where country.official_native_language = 'English'
select country from country where country_id in (select country from driver where points > 150)
select distinct country from driver where points > 150
select capital from country where country_id in (select country from driver where points = (select max(points) from driver))
select country.capital from country join driver on country.country_id = driver.country order by driver.points desc limit 1
select make, count(*) from driver group by make
select make, count(*) from driver group by make
select make from driver group by make having count(driver_id)(driver) = (select max(count(driver_id)) from (select count(driver_id)(driver_id) from driver group by make))
select make from driver group by make having count(driver_id)(driver.driver_id) = (select max(count(driver_id)) from (select count(driver_id)(driver.driver_id) from driver group by make))
select make from driver group by make having count(*) >= 3
select make from driver group by make having count(*) >= 3
select team from team where team_id not in (select team_id from team_driver)
select team from team except select team.team from team join team_driver on team.team_id = team_driver.team_id
select country.country from country join driver on country.country_id = driver.country where driver.make = 'Damsel' intersect select country.country from country join driver on country.country_id = driver.country where driver.make = 'Chrysler'
select country.country from country join driver on country.country_id = driver.country where driver.make = 'Damsel' intersect select country.country from country join driver on country.country_id = driver.country where driver.make = 'Chrysler'
select sum(points), avg(points) from driver
select sum(points), avg(points) from driver
select country from country where country_id not in (select country from driver)
select country from country where country_id not in (select country from driver)
select team.manager, team.sponsor from team join team_driver on team.team_id = team_driver.team_id group by team_driver.team_id order by count(*) desc limit 1
select team.manager, team.sponsor from team_driver join team on team_driver.team_id = team.team_id group by team.team_id order by count(*) desc limit 1
select team.manager, team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team_driver.team_id having count(*) >= 2
select team.manager, team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team.team_id having count(*) >= 2
select count(*) from institution
select count(*) from institution
select name from institution order by name asc
select name from institution order by name asc
select name from institution order by founded asc
select name from institution order by founded
select city, province from institution
select city, province from institution
select max(enrollment), min(enrollment) from institution
select max(enrollment), min(enrollment) from institution
select affiliation from institution where city!= 'Vancouver'
select affiliation from institution where city!= 'Vancouver'
select stadium from institution order by capacity desc
select stadium from institution order by capacity desc
select i.stadium from institution i where i.enrollment = (select max(enrollment) from institution)
select i.stadium from institution i where i.enrollment = (select max(enrollment) from institution)
select name, nickname from institution
select name, nickname from institution join championship on institution.institution_id = championship.institution_id
select c.nickname from championship c where exists (select 1 from institution i where i.institution_id = c.institution_id and i.enrollment = (select min(enrollment) from institution))
select nickname from championship where institution_id in (select institution_id from institution where enrollment = (select min(enrollment) from institution))
select name from institution where institution_id in (select institution_id from championship group by institution_id order by number_of_championships desc)
select name from institution where institution_id in (select institution_id from championship order by number_of_championships desc)
select institution.name from institution join championship on institution.institution_id = championship.institution_id
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count(*) >= 1
select sum(number_of_championships) from championship join institution on championship.institution_id = institution.institution_id where institution.affiliation = 'Public'
select sum(number_of_championships) from championship join institution on championship.institution_id = institution.institution_id where institution.affiliation = 'Public'
select affiliation, count(*) from institution group by affiliation
select affiliation, count(*) from institution group by affiliation
select affiliation from institution group by affiliation having count(affiliation) = (select max(count(affiliation)) from (select count(affiliation) from institution group by affiliation))
select i.affiliate from institution i group by i.affiliate having count(i.affiliate)(i.affiliate) = (select max(count(i.affiliate)) from (select count(i.affiliate)(i.affiliate) from institution i group by i.affiliate))
select founded from institution group by founded having count(*) > 1
select founded, count(*) from institution group by founded having count(*) > 1
select nickname from institution order by capacity desc
select nickname from institution order by capacity desc
select sum(enrollment) from institution where city = 'Vancouver' or city = 'Calgary'
select enrollment from institution where city = 'Vancouver' or city = 'Calgary'
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select count(distinct province) from institution
select count(distinct province) from institution
select * from warehouses
select * from warehouses
select distinct contents from boxes where warehouse = 'new york city'
select distinct contents from boxes where warehouse = 'new york city'
select contents from boxes where value > 150
select contents from boxes where value > 150
select warehouse_1, avg(value), avg(value) from boxes group by warehouse_1
select avg(value), warehouse from boxes group by warehouse
select avg(value), sum(value) from boxes
select avg(value), sum(value) from boxes
select avg(capacity), sum(capacity) from warehouses
select avg(capacity), sum(capacity) from warehouses
select contents, avg(value), max(value) from boxes group by contents
select contents, avg(value), max(value), from boxes group by contents
select contents from boxes group by contents order by sum(value) desc limit 1
select contents from boxes order by value desc limit 1
select avg(value) from boxes
select avg(value) from boxes
select distinct contents from boxes
select distinct contents from boxes
select count(distinct contents) from boxes
select count(distinct contents) from boxes
select distinct location from warehouses
select distinct location from warehouses
select box.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' or warehouses.location = 'New york City'
select box.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago' or warehouses.location = 'New york City'
select sum(value) from boxes where warehouse in (select code from warehouses where location = 'Chicago' or location = 'New york City')
select sum(value) from boxes where warehouse in (select warehouse from warehouses where location = 'Chicago' or warehouse in (select warehouse from warehouses where location = 'New york City'))
select contents from boxes where warehouse in (select code from warehouses where location = 'chicago' intersect select contents from boxes where warehouse in (select code from warehouses where location = 'new york'))
select contents from boxes where warehouse = 'chicago' intersect select contents from boxes where warehouse = 'new york'
select contents from boxes where warehouse not in (select code from warehouses where location = 'new york city')
select contents from boxes where warehouse not in (select code from warehouses where location = 'new york city')
select distinct w.location from warehouses w where w.code in (select b.warehouse from boxes b where b.contents = 'rocks' except select w.location from warehouses w where w.code in (select w.code from boxes b where b.contents ='scissors'))
select distinct w.location from warehouses w where exists (select 1 from boxes b where b.warehouse = w.code and b.contents in (select contents from boxes where warehouse = w.code and b.contents = 'rocks') and not exists (select 1 from boxes b2 where b2.warehouse = w.code and b2.contents ='scissors')
select distinct warehouse from boxes where contents in (select contents from boxes where contents in (select contents from boxes where value > 0) or contents in (select contents from boxes where value > 0))
select distinct warehouse from boxes where contents like 'rocks' or contents like'scissors'
select distinct w.location from warehouses w where exists (select 1 from boxes b where b.warehouse = w.code and b.contents = 'rocks' and b.contents ='scissors')
select distinct w.location from warehouses w where exists (select 1 from boxes b where b.warehouse = w.code and b.contents in (select contents from boxes where warehouse = w.code and contents in (select contents from boxes where warehouse = w.code and contents = 'rocks' and contents ='scissors'))
select code, contents from boxes order by value
select code, contents from boxes order by value
select box.code, box.contents from boxes where box.value = (select min(value) from boxes)
select b.code, b.contents from boxes b where b.value = (select min(value) from boxes)
select distinct contents from boxes where value > (select avg(value) from boxes)
select distinct contents from boxes where value > (select avg(value) from boxes)
select distinct contents from boxes order by contents
select distinct contents from boxes order by contents asc
select distinct b1.code from boxes b1 where b1.value > (select max(b2.value) from boxes b2 where b2.contents = 'rocks')
select b.code from boxes b where b.value > (select max(value) from boxes where contents like '%rocks%')
select boxes.code, boxes.content from boxes where boxes.value > (select max(value) from boxes where contents ='scissors')
select boxes.code, boxes.contents from boxes where boxes.value > (select max(value) from boxes where contents like 'Scissors')
select sum(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.capacity = (select max(capacity) from warehouses)
select sum(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.capacity = (select max(capacity) from warehouses)
select warehouse, avg(value) from boxes group by warehouse having avg(value) > 150
select avg(value), warehouse from boxes group by warehouse having avg(value) > 150
select sum(value), count(*), contents from boxes group by contents
select sum(value), count(*) from boxes group by contents
select sum(capacity), avg(capacity), max(capacity), location from warehouses group by location
select location, sum(capacity), avg(capacity), max(capacity) from warehouses group by location
select sum(capacity), location from warehouses
select sum(capacity) from warehouses
select max(boxes.value), warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select warehouses.location, max(boxes.value), warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select warehouses.code, count(*) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code
select warehouse, count(*) from boxes group by warehouse
select count(distinct location) from warehouses where location = 'Rock'
select count(distinct warehouse) from boxes where contents = 'Rocks'
select box.code, city.name from boxes join warehouses on boxes.warehouse = warehouses.warehouse.code
select boxes.code, warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code
select box.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago'
select boxes.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = 'Chicago'
select warehouse, count(*) from boxes group by warehouse
select warehouse, count(*) from boxes group by warehouse
select count(distinct contents), warehouse from boxes group by warehouse
select warehouse, count(distinct contents) from boxes group by warehouse
select distinct code from warehouses where capacity > 100
select w.code from warehouses w where w.capacity > (select max(capacity) from warehouses)
select sum(value) from boxes where warehouse not in (select code from warehouses where location = 'Chicago')
select sum(value) from boxes where warehouse not in (select warehouse from warehouses where location = 'Chicago')
select university_name, city, state from university order by university_name
select university_name, city, state from university order by university_name
select count(*) from university where state = 'IL' or state = 'OHI'
select count(*) from university where state = 'IL' or state = 'OHI'
select max(enrollment), avg(enrollment), min(enrollment) from university
select max(enrollment), avg(enrollment), min(enrollment) from university
select team_name from university where enrollment > (select avg(enrollment) from university)
select team_name from university where enrollment > (select avg(enrollment) from university)
select home_conference from university
select distinct home_conference from university
select home_conference, count(*) from university group by home_conference
select home_conference, count(*) from university group by home_conference
select state from university group by state order by count(*) desc limit 1
select state from university group by state having count(university_id) = (select max(count(university_id)) from (select count(university_id) from university group by state))
select home_conference from university group by home_conference having avg(enrollment) > 2000
select home_conference from university group by home_conference having avg(enrollment) > 2000
select home_conference from university group by home_conference order by sum(enrollment) asc limit 1
select home_conference from university group by home_conference order by count(*) asc limit 1
select major_name, major_code from major order by major_code
select major_name, major_code from major order by major_code
select major.major_id, major_ranking.rank from major join major_ranking on major.major_id = major_ranking.major_id join university on major_ranking.university_id = university.university_id where university.university_name = 'Augustana College'
select major_ranking.rank, major.major_name from major join major_ranking on major.major_id = major_ranking.major_id join university on major_ranking.university_id = university.university_id where university.university_name = 'Augustana'
select university.university_name, university.city, university.state from major join university on major.university_id = university.university_id join major_ranking on major.major_id = major_ranking.major_id where major_ranking.rank = 1 and major.major_name = 'Accounting'
select university.university_name, university.city, university.state from major join university on major.university_id = university.university_id join major_ranking on major.major_id = major_ranking.major_id where major.major_name = 'Accounting' order by major_ranking.rank desc limit 1
select u.university_name from university u inner join major_ranking mr on u.university_id = mr.university_id where mr.rank = 1 group by u.university_id having count(mr.major_id) = (select max(count(major_id)) from (select count(major_id) from major_ranking where rank = 1) group by university_id)
select u.university_name from university u inner join major_ranking mr on u.university_id = mr.university_id group by u.university_id having count(mr.major_id) = (select max(count(major_id)) from (select count(major_id) from major_ranking group by university_id) sub)
select university_name from university where university_id not in (select university_id from major_ranking where rank = 1)
select university_name from university where university_id not in (select university_id from major_ranking where rank = 1)
select university_name from university where university_id in (select university_id from major_ranking where major_id = (select major_id from major where major_name = 'Accounting') intersect select university_id from major_ranking where major_id in (select major_id from major where major_name = 'Urban Education'))
select u.university_name from university u where exists (select 1 from major_ranking mr join major m on mr.major_id = m.major_id where mr.university_id = u.university_id and m.major_name = 'Accounting') and exists (select 1 from major_ranking mr join major m on mr.major_id = mr.major_id where mr.major_id = 'U.major_id' and mr.major_id = 'U.major_id)
select university_name, overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where university.state = 'Wisconsin'
select university_name, rank from university where state = 'WISCONIN'
select u.university_name from university u inner join overall_ranking or on u.university_id = or.university_id where or.research_point = (select max(research_point) from overall_ranking)
select u.university_name from university u inner join overall_ranking or on u.university_id = or.university_id group by u.university_id having count(or.research_point) = (select max(count(research_point)) from (select count(research_point) from overall_ranking group by university_id))
select university_name from university order by reputation_point asc
select university_name from university order by reputation_point asc
select university.university_name from major join university on major.university_id = university.university_id join major_ranking on major.major_id = major_ranking.major_id where major_ranking.rank >= 3 and major.major_name = 'Accounting'
select distinct u.university_name from university u join major_ranking mr on u.university_id = mr.university_id join major on mr.major_id = major.major_id where mr.rank >= 3 and major.major_name = 'Accounting'
select sum(enrollment) from university where university_id in (select university_id from overall_ranking where rank <= 5)
select total(uni.enrollment) from university u inner join overall_ranking or on u.university_id = or.university_id where or.rank <= 5
select university_name, citation_point from university where university_id in (select university_id from overall_ranking where reputation_point >= 3)
select university_name, citation_point from university where university_id in (select university_id from overall_ranking order by reputation_point desc limit 3)
select state from university where enrollment < 3000 group by state having count(*) > 2
select state from university where enrollment < 3000 group by state having count(*) > 2
select title from movies where rating = 'null'
select title from movies where code not in (select code from movietheaters)
select title from movies where rating = 'G'
select title from movies where rating = 'G'
select movie.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon'
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon'
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code
select count(*) from movies where rating = 'G'
select count(*) from movies where rating = 'G'
select count(distinct movie) from movietheaters
select count(*) from movietheaters
select count(distinct movie) from movietheaters
select count(distinct movie) from movietheaters
select count(distinct code) from movietheaters
select count(distinct code) from movietheaters
select distinct m.rating from movies m join movietheaters mt on m.code = mt.movie where mt.name like '%citizen%'
select rating from movies where title like '%citizen%'
select distinct movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = 'G' or movies.rating = 'Pg'
select distinct m.name from movietheaters m inner join movies m on m.code = m.code where m.rating in ('G', 'Pg')
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name in (select movie from movietheaters where theaters.name = 'Odeon' or movietheaters.name = 'Imperial')
select movies.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name in ('Odeon', 'Imperial')
select movie.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Odeon' intersect select movie.title from movies join movietheaters on movies.code = movietheaters.movie where movietheaters.name = 'Imperial'
select movie from movies where code in (select movie from movietheaters where name = 'Odeon' intersect select movie from movietheaters where name = 'Imperial')
select title from movies where code not in (select movie from movietheaters where name = 'Odeon Theater')
select title from movies where code not in (select movie from movietheaters where name = 'Odeon')
select title from movies order by title
select title from movies order by title
select title from movies order by rating
select title from movies order by rating
select name from movietheaters group by name having count(movie)(movie) = (select max(count(movie)) from (select count(movie)(movie) from movietheaters group by name))
select m.name from movietheaters m where m.code in (select m.code from movies m group by m.code having count(m.title) = (select max(count(title)) from (select count(title) from movies group by code)))
select movie.title from movies join movietheaters on movies.code = movietheaters.code group by movie.title order by count(*) desc limit 1
select title from movies where code in (select movietheaters.code from movietheaters group by movietheaters.name having count(theaters.code) = (select max(count(theaters.code)) from (select count(theaters.code) from movietheaters group by movietheaters.name))
select count(*), rating from movies group by rating
select rating, count(*) from movies group by rating
select count(*) from movies where rating!= 'null'
select count(*) from movies where rating!= 'null'
select name from movietheaters where movie = (select 1 from movies m where m.code = m.code)
select name from movietheaters where movie = (select min(movie) from movies)
select name from movietheaters where code not in (select code from movies)
select name from cinema where code not in (select code from movietheaters)
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = 'G'
select distinct m.name from movietheaters m inner join movies m on m.code = m.code where m.rating = 'G'
select title from movies
select title from movies
select distinct rating from movies
select distinct rating from movies
select * from movies where rating = 'Unrated'
select * from movies where rating = 'Unrated'
select title from movies where code not in (select movie from movietheaters)
select title from movies where code not in (select movie from movietheaters)
select recipient from package where weight = (select max(weight) from package)
select c.name from client c where exists (select 1 from package p where p.recipient = c.accountnumber and p.weight = (select max(weight) from package))
select sum(package.weight) from client join package on client.accountnumber = package.sender where client.name = 'Leo Wang'
select sum(package.weight) from package join sender on package.sender = sender.employeeid where sender.name = 'Leo Wong'
select position from employee where name = 'Amy Wong'
select position from employee where name = 'Amy wong'
select salary, position from employee where name = 'Turanga Leela'
select salary, position from employee where name = 'Turanga Leela'
select avg(salary) from employee where position = 'intern'
select avg(salary) from employee where position = 'intern'
select level from has_clearance where employee = (select employee from employee where position = 'Physician')
select level from has_clearance where employee = (select employee from employee where name = 'Ph.employee')
select packagenumber from package where sender = 'Leo Wong'
select count(*) from package join sender on package.sender = sender.employeeid where sender.name = 'Leo Wong'
select packagenumber from package where recipient = "Leo Wong"
select packagenumber from package where recipient = 'Leo Wong'
select package.contents from package join employee on package.sender = employee.employeeid where employee.name = "Leo Wong" union select package.contents from package join employee on package.receiver = employee.employeeid where employee.name = "Leo Wong"
select distinct package.packagenumber from employee join package on employee.employeeid = package.senter where employee.name = 'Leo Wong'
select count(*) from package join sender on package.sender = sender.sender join recipient on package.receiver = recipient.receiver where sender.name = 'Ogden Wernstrom' and recipient.name = 'Leo Wong'
select count(*) from package join sender on package.sender = sender.employeeid and recipient = leo wong
select contents from package where sender = 'John zoidfarb'
select contents from package where sender = 'John zoidfarb'
select p.packagenumber, p.weight from package p join client c on p.senter = c.accountnumber where c.name like '%john%' order by p.weight desc limit 1
select p.packagenumber, p.weight from package p join client c on p.sender = c.accountnumber where c.name = 'John' or similar and p.weight = (select max(weight) from package where sender = c.accountnumber)
select packagenumber, weight from package order by weight limit 3
select packagenumber, weight from package order by weight asc limit 3
select client.name, count(*) from client join package on client.accountnumber = package.sender group by client.accountnumber order by count(*) desc limit 1
select client.name, count(*) from client join package on client.accountnumber = package.sender group by client.accountnumber order by count(*) desc limit 1
select client.name, count(*) from client join package on client.accountnumber = package.receiver group by client.name order by count(*) asc limit 1
select min(receiver.name), min(sender.count(*)) from package join recipient on package.receiver = recipient.receiver group by sender.name
select client.name from client join package on client.accountnumber = package.sender group by package.sender having count(*) > 1
select client.name from client join package on client.accountnumber = package.sender group by package.sender having count(*) > 1
select coordinates from planet where name = 'Mars'
select coordinates from planet where name = 'Mars'
select name, coordinates from planet order by name
select name, coordinates from planet order by name
select shipment.shipmentid from shipment join employee on shipment.manager = employee.employeeid where employee.name = 'Phillip j. Fried'
select shipment.shipmentid from shipment join manager on shipment.manager = manager.employeeid where manager.name = 'Phillip j fry'
select date from shipment
select date from shipment
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars'
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = 'Mars' and shipment.manager = 'Turanga Leela'
select shipment.shipmentid from shipment join has_clearance on shipment.planet = has_clearance.planetid join employee on has_clearance.employee = employee.employeeid where has_clearance.manager = 'Turanga Leela' and shipment.planet = mars
select shipmentid from shipment where planet = 'Mars' or manager = 'Turanga Leela'
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid join has_clearance on shipment.manager = has_clearance.employeeid where planet.planetid = mars and has_clearance.name = 'Turanga Leela'
select planet.name, sum(shipment.shipmentid) from planet left join shipment on planet.planetid = shipment.planet group by planet.planetid
select planet.name, count(*) from shipment join planet on shipment.planet = planet.planetid group by shipment.planetid
select planet.name from planet join shipment on planet.planetid = shipment.planet group by shipment.planet order by count(*) desc limit 1
select planet.name from planet join shipment on planet.planetid = shipment.planet group by shipment.planetid order by count(*) desc limit 1
select manager.name, count(*) from shipment join employee on shipment.manager = employee.employeeid group by shipment.manager
select manager, count(*) from shipment group by manager
select sum(weight) from package where shipmentid in (select shipmentid from shipment where planet = 'Mars')
select sum(p.weight) from package p join shipment s on p.shipment = s.shipmentid where s.planet = 'Mars'
select planet.name from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by package.planetid
select sum(package.weight), planet.name from package join planet on package.planet = planet.planetid group by planet.name
select planet.name from planet join shipment on planet.planetid = shipment.planet group by shipment.planet having sum(package.weight) > 30
select planet.name from planet join shipment on planet.planetid = shipment.planet group by shipment.planetid having sum(package.weight) > 30
select package.packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planetid = planet.planetid where planet.name = 'Omicron Persei 8' and sender = 'Zapp Brannigan'
select count(*) from package join shipment on package.shipment = shipment.shipmentid join employee on package.senter = employee.employeeid where employee.name = 'Zapp Brannigan' and shipment.planet = 'Omicron Persei 8'
select package.packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' or sender.name = 'Zapp Brannigan'
select count(*) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = 'Omicron Persei 8' or sender.name = 'Zapp Brannigan'
select packagenumber, weight from package where weight between 10 and 30
select packagenumber, weight from package where weight between 10 and 30
select name from employee where employeeid not in (select employee from has_clearance where planet = 'Mars')
select name from employee where employeeid not in (select employee from has_clearance where planet = 'Mars')
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.planet = 'ocean iii'
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.planet = 'Omega iii'
select name from planet where planetid in (select planet from has_clearance group by planet having count(*) = 1)
select distinct planet.name from planet join has_clearance on planet.planetid = has_clearance.planet group by has_clearance.planet having count(*) = 1
select name from employee where salary between 5000 and 10000
select name from employee where salary between 5000 and 10000
select name from employee where salary > (select avg(salary) from employee) or salary > 5000
select name from employee where salary > (select avg(salary) from employee) or salary > 5000
select count(*) from employee where employeeid not in (select employee from has_clearance where planet = 'Mars')
select count(*) from employee where employeeid not in (select employee from has_clearance where planet = 'Mars')
select count(*) from game
select count(*) from game
select title, developers from game order by units_sold_millions desc
select title, developers from game order by units_sold_millions desc
select avg(units_sold_millions) from game where developers!= 'Nintendo'
select avg(units_sold_millions) from game where developers!= 'Nintendo'
select platform_name, market_district from platform
select platform_name, market_district from platform
select platform_name, platform_id from platform where download_rank = 1
select platform_name, platform_id from platform where download_rank = 1
select max(rank_of_the_year), min(rank_of_the_year) from player
select max(rank_of_the_year), min(rank_of_the_year) from player
select count(*) from player where rank_of_the_year < 3
select count(*) from player where rank_of_the_year <= 3
select player_name from player order by player_name asc
select player_name from player order by player_name
select player_name, college from player order by rank_of_the_year desc
select player_name, college from player order by rank_of_the_year desc
select player.player_name, player.rank_of_the_year from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where game.title = 'Super mario World'
select player.player_name, player.rank_of_the_year from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where game.title = 'Super mario World'
select distinct game.developers from game_player join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select distinct game.developers from game_player join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select avg(game.units_sold_millions) from game join game_player on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.position = 'guard'
select avg(game.units_sold_millions) from game join game_player on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.position = 'guard'
select game.title, platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title, platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title from game join platform on game.platform_id = platform.platform_id where platform.market_district in ('Asia', 'USA')
select game.title from game join platform on game.platform_id = platform.platform_id where platform.market_district in (select market_district from platform where region = 'Asia' or region = 'United States')
select franchise, count(*) from game group by franchise
select franchise, count(*) from game group by franchise
select franchise from game group by franchise having count(game_id) = (select max(count(game_id)) from (select count(game_id) from game group by franchise))
select franchise from game group by franchise having count(game_id) = (select max(count(game_id)) from (select count(game_id) from game group by franchise))
select franchise from game group by franchise having count(*) >= 2
select franchise from game group by franchise having count(*) >= 2
select player_name from player where player_id not in (select player_id from game_player)
select player_name from player where player_id not in (select player_id from game_player)
select game.title from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.college = 'Oklahoma' intersect select game.title from game_player join player on game_player.player_id = player.player_id where player.college = 'Auburn'
select game.title from game_player join player on game_player.player_id = player.player_id where player.college = 'Oklahoma' or player.college = 'Auburn'
select distinct franchise from game
select distinct franchise from game
select title from game where game_id not in (select game_id from game_player where player_id in (select player_id from player where position = 'guard'))
select title from game where game_id not in (select game_id from game_player where player_id in (select player_id from player where position = 'guard'))
select name from press order by year_profits_billion desc
select name from press order by year_profits_billion desc
select name from press where year_profits_billion > 15 billion union select name from press where month_profits_billion > 1
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select avg(month_profits_billion), max(year_profits_billion) from press
select avg(year_profits_billion), max(year_profits_billion), name from press
select name from press where month_profits_billion = (select max(month_profits_billion) from press)
select name from press where month_profits_billion = (select max(month_profits_billion) from press)
select name from press order by month_profits_billion desc limit 1 or min(month_profits_billion) desc limit 1
select p.name from press p where p.month_profits_billion = (select max(month_profits_billion) from press) or p.month_profits_billion = (select min(month_profits_billion) from press)
select count(*) from author where age < 30
select count(*) from author where age < 30
select avg(age), gender from author group by gender
select gender, avg(age) from author group by gender
select count(*), gender from author where age > 30 group by gender
select count(*), gender from author where age > 30 group by gender
select title from book order by release_date desc
select title from book order by release_date desc
select book_series, count(*) from book group by book_series
select count(*), book_series from book group by book_series
select title, release_date from book order by sale_amount desc limit 5
select title, release_date from book order by sale_amount desc limit 5
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select book_series from book where sale_amount > 1000 intersect select book_series from book where sale_amount < 500
select author.name from author join book on author.author_id = book.author_id where book.book_series = 'MM' intersect select author.name from book join author on book.author_id = author.author_id where book.book_series = 'LT'
select author.name from book join author on book.author_id = author.author_id where book.book_series = 'MM' intersect select author.name from book join author on book.author_id = author.author_id where book.book_series = 'LT'
select name, age from author where author_id not in (select author_id from book)
select name from author where author_id not in (select author_id from book)
select author.name from book join author on book.author_id = author.author_id group by book.author_id having count(*) > 1
select author.name from book join author on book.author_id = author.author_id group by book.author_id having count(*) > 1
select book.title, author.name, publisher.name from book join author on book.author_id = author.author_id order by book.sale_amount desc limit 3
select book.title, author.name, press.name from book join author on book.author_id = author.author_id join press on book.press_id = press.press_id order by book.sale_amount desc limit 3
select press.name, sum(book.sale_amount), press.press_id from book join press on book.press_id = press.press_id group by press.press_id
select press.name, sum(book.sale_amount), press.press_id from book join press on book.press_id = press.press_id group by press.press_id
select press.name, count(*) from book join press on book.press_id = press.press_id where book.sale_amount > 1000 group by press.name
select press.name, count(*) from book join press on book.press_id = press.press_id group by book.press_id having sum(book.sale_amount) > 1000 group by press.press_id
select a.name from author a where exists (select 1 from book b where b.author_id = a.author_id and b.sale_amount = (select max(sale_amount) from book))
select author.name from book join author on book.author_id = author.author_id order by book.sale_amount desc limit 1
select author.name, author.gender from book join author on book.author_id = author.author_id group by book.author_id order by count(*) desc limit 1
select author.name, author.gender from book join author on book.author_id = author.author_id group by book.author_id order by count(*) desc limit 1
select name from author where author_id not in (select author_id from book where press_id in (select press_id from press where name = 'Accor'))
select name from author where author_id not in (select author_id from book where press_id in (select press_id from press where name = 'Accor'))
select press.name, press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count(*) > 2
select press.name, press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count(*) > 2
select count(*) from authors
select author_name from authors
select author_name, other_details from authors
select other_details from authors where author_name = 'Adison Denesik'
select count(*) from documents
select author_name from authors where author_name in (select author_name from documents where document_id = 4)
select author_name from documents where document_name = 'Travel to Brazil'
select count(*) from authors join documents on authors.author_name = documents.author_name where authors.author_name = 'Era Kerluke'
select document_name, document_description from documents
select documents.document_id, documents.document_name from authors join documents on authors.author_name = documents.author_name where authors.author_name = 'Bianka Cummings'
select authors.author_name, other_details from documents join authors on documents.author_name = authors.author_name where document_name = 'Travel to China'
select authors.author_name, count(documents.document_id) from authors left join documents on authors.author_name = documents.author_name group by authors.author_name
select author_name from documents group by author_name having count(document_id) = (select max(count(document_id)) from (select count(document_id) from documents group by author_name))
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count(*) >= 2
select count(*) from business_processes
select next_process_id, process_name, process_description from business_processes where process_id = 9
select process_name from business_processes where next_process_id = 9
select count(*) from process_outcomes
select process_outcome_code, process_outcome_description from process_outcomes
select process_outcome_description from process_outcomes
select count(*) from process_status
select process_status_code, process_status_description from process_status
select process_status_description from process_status where process_status_code = 'ct'
select count(*) from staff
select staff_id, staff_details from staff
select staff_details from staff where staff_id = 100
select count(distinct staff_role_code) from ref_staff_roles
select staff_role_code, staff_role_description from ref_staff_roles
select staff_role_description from ref_staff_roles where staff_role_code = 'HR'
select count(distinct document_id) from documents_processes
select process_id from documents_processes
select document_id from documents except select document_id from documents_processes
select process_id from business_processes except select process_id from documents_processes
select process_outcomes.process_outcome_description, process_status.process_status_description from documents_processes join process_outcomes on documents_processes.process_outcome_code = process_outcomes.process_outcome_code join process_status on documents_processes.process_status_code = process_status.process_status_code where document_id = 0
select business_processes.process_name from documents join documents_processes on documents.document_id = documents_processes.document_id join business_processes on documents_processes.process_id = business_processes.process_id where documents.document_name = 'Travel to Brazil'
select bp.process_id, count(dp.document_id) from business_processes bp left join documents_processes dp on bp.process_id = dp.process_id group by bp.process_id
select count(distinct staff_id) from staff_in_processes where document_id = 0 and process_id = 9
select s.staff_id, count(d.document_id) from staff s left join staff_in_processes d on s.staff_id = d.staff_id group by s.staff_id
select s.staff_role_code, count(d.process_id) from staff s left join staff_in_processes d on s.staff_id = d.staff_id group by s.staff_role_code
select count(distinct staff_role_code) from ref_staff_roles where staff_role_code = 3
select count(*) from agencies
select count(*) from agencies
select agency_id, agency_details from agencies
select agency_id, agency_details from agencies
select count(*) from clients
select count(*) from clients
select client_id, client_details from clients
select client_id, client_details from clients
select a.agency_id, count(c.client_id) from agencies a left join clients c on a.agency_id = c.agency_id group by a.agency_id
select agencies.agency_details, count(clients.client_id) from agencies left join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count(*) desc limit 1
select a.agency_id, a.agency_details from agencies a where exists (select 1 from clients c where c.agency_id = a.agency_id group by c.agency_id having count(c.client_id) = (select max(count(client_id)) from (select count(client_id) from clients group by agency_id))
select agency_id, client_details from clients group by agency_id having count(*) >= 2
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id having count(*) >= 2
select agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = 'Mac'
select agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = 'Mac'
select client_details, agency_details from clients union all select agency_details from agencies where agency_details is not null
select clients.client_details, agencies.agency_details from clients join agencies on clients.agency_id = agencies.agency_id
select sic_code, count(*) from clients group by sic_code
select sic_code, count(*) from clients group by sic_code
select client_id, client_details from clients where sic_code = 'Bad'
select client_ideas, client_details from clients where sic_code = 'bad'
select agency_id, agency_details from agencies where agency_id in (select agency_id from clients)
select agency_id, agency_details from agencies where agency_id in (select agency_id from clients)
select agency_id from agencies except select agency_id from clients
select agency_id from agencies except select agency_id from clients
select count(*) from invoices
select count(*) from invoices
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from invoices join clients on invoices.client_id = clients.client_id
select invoice_id, invoice_status, invoice_details from invoices
select clients.client_id, count(invoices.invoice_id) from clients left join invoices on clients.client_id = invoices.client_id group by clients.client_id
select client_id, count(*) from invoices group by client_id
select client_id, invoice_details from invoices group by client_id having count(invoice_id)(invoice_id) = (select max(count(invoice_id)) from (select count(invoice_id)(invoice_id) from invoices group by client_id))
select invoices.client_id, clients.client_details from invoices join clients on invoices.client_id = clients.client_id group by invoices.client_id order by count(*) desc limit 1
select client_id from invoices group by client_id having count(*) >= 2
select client_id from invoices group by client_id having count(*) >= 2
select invoice_status, count(*) from invoices group by invoice_status
select invoice_status, count(*) from invoices group by invoice_status
select invoice_status from invoices group by invoice_status having count(invoice_id)(invoice_id) = (select max(count(invoice_id)) from (select count(invoice_id)(invoice_id) from invoices group by invoice_status))
select invoice_status from invoices group by invoice_status order by count(*) desc limit 1
select invoices.invoice_status, invoices.invoice_details, clients.client_id, agencies.agency_details from invoices join clients on invoices.client_id = clients.client_id join agencies on invoices.agency_id = agencies.agency_id
select invoices.invoice_status, invoices.invoice_details, invoices.client_id, agencies.agency_details from invoices join clients on invoices.client_id = clients.client_id join agencies on agencies.agency_id = clients.agency_id
select meeting_type, other_details from meetings
select meeting_type, other_details from meetings
select meeting_outcome, purpose_of_meeting from meetings
select meeting_outcome, purpose_of_meeting from meetings
select payments.payment_id, invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = 'working'
select payments.payment_id, payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = 'working'
select invoice_id, invoice_status from invoices where invoice_id not in (select invoice_id from payments)
select invoice_id, invoice_status from invoices where invoice_id not in (select invoice_id from payments)
select count(*) from payments
select count(*) from payments
select payment_id, invoice_id, payment_details from payments
select payment_id, invoice_id, payment_details from payments
select invoices.invoice_id, invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id
select distinct invoice_id, invoice_status from payments
select i.invoice_id, count(p.payment_id) from invoices i left join payments p on i.invoice_id = p.invoice_id group by i.invoice_id
select invoices.invoice_id, count(payments.payment_id) from invoices left join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from invoices join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id order by count(*) desc limit 1
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from invoices join payments on invoices.invoice_id = payments.invoice_id group by invoices.invoice_id order by count(*) desc limit 1
select count(*) from staff
select count(*) from staff
select a.agency_id, count(b.staff_id) from agencies a left join staff b on a.agency_id = b.agency_id group by a.agency_id
select a.agency_id, count(b.staff_id) from agencies a left join staff b on a.agency_id = b.agency_id group by a.agency_id
select agencies.agency_id, agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count(*) desc limit 1
select agencies.agency_id, agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count(*) desc limit 1
select meeting_outcome, count(*) from meetings group by meeting_outcome
select meeting_outcome, count(*) from meetings group by meeting_outcome
select clients.client_id, count(meetings.meeting_id) from clients left join meetings on clients.client_id = meetings.client_id group by clients.client_id
select client_id, count(*) from meetings group by client_id
select meeting_type, count(*), client_id from meetings group by client_id
select meeting_type, count(*) from meetings group by meeting_type
select meeting_id, meeting_outcome, meeting_type, clients.client_details from meetings join clients on meetings.client_id = clients.client_id
select meeting_id, meeting_outcome, meeting_type, client_details from meetings
select m.meeting_id, count(distinct s.staff_id) from meetings m left join staff_in_meetings s on m.meeting_id = s.meeting_id group by m.meeting_id
select count(*), meeting_id from staff_in_meetings group by meeting_id
select staff.staff_id, count(*) from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff.staff_id having count(*) = (select min(count(*)) from (select count(*) from staff_in_meetings group by staff_id))
select s.staff_id from staff s join staff_in_meetings sm on s.staff_id = sm.staff_id group by s.staff_id having count(sm.meeting_id) = (select min(count(meeting_id)) from (select count(meeting_id) from staff_in_meetings group by staff_id))
select count(distinct staff_id) from staff_in_meetings
select count(distinct staff_id) from staff_in_meetings
select count(*) from staff where staff_id not in (select staff_id from staff_in_meetings)
select count(*) from staff where staff_id not in (select staff_id from staff_in_meetings)
select distinct clients.client_id, clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select distinct clients.client_id, clients.client_details from clients join invoices on clients.client_id = invoices.client_id
select distinct clients.client_id, clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select distinct clients.client_id, clients.client_details from clients join invoices on clients.client_id = invoices.client_id
select staff.staff_id, staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff.staff_id having count(*) >= 1 and staff.staff_details like '%s%'
select staff.staff_id, staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff_in_meetings.staff_id having count(*) >= 1 and staff.staff_details like '%s%'
select clients.client_id, clients.sic_code, clients.agency_id from clients join meetings on clients.client_id = meetings.client_id group by clients.client_id having count(*) = 1 intersect select clients.client_id, clients.sic_code, clients.agency_id from clients join invoices on clients.client_id = invoices.client_id
select clients.client_id, clients.sic_code, clients.agency_id from clients join meetings on clients.client_id = meetings.client_id intersect select clients.client_id, clients.agency_id from clients join invoices on clients.client_id = invoices.client_id group by clients.client_id having count(*) = 1
select start_date_time, end_date_time, clients.client_details, staff.staff_details from meetings join clients on meetings.client_id = clients.client_id join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id
select m.start_date_time, m.end_date_time, m.client_details, m.staff_details from meetings m join clients c on m.client_id = c.client_id join staff_in_meetings s on m.staff_id = s.staff_id