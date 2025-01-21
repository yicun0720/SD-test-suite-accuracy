select count(*) from club
select count(*) from club
select name from club order by name asc
select name from club order by name asc
select manager, captain from club
select manager, captain from club
select name from club where manufacturer!= "Nike"
select name from club where manufacturer!= "Nike"
select name from player order by wins_count asc
select name from player order by wins_count asc
select name from player order by earnings desc limit 1
select name from player order by earnings desc limit 1
select distinct country from player where earnings > 1200000
select country from player where earnings > 1200000
select country from player where wins_count > 2 order by earnings desc limit 1
select country from player where wins_count > 2 order by earnings desc limit 1
select player.name, club.name from club join player on club.club_id = player.club_id
select player.name, club.name from club join player on club.club_id = player.club_id
select club.name from club join player on club.club_id = player.club_id where player.wins_count > 2
select club.name from club join player on club.club_id = player.club_id where player.wins_count > 2
select player.name from club join player on club.club_id = player.club_id where club.manager = "Sam Allardyce"
select player.name from club join player on club.club_id = player.club_id where club.manager = "Sam Allardyce"
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg(player.earnings) desc
select club.name from club join player on club.club_id = player.club_id group by player.club_id order by avg(player.earnings) desc
select manufacturer, count(*) from club group by manufacturer
select manufacturer, count(*) from club group by manufacturer
select manufacturer from club group by manufacturer order by count(*) desc limit 1
select manufacturer from club group by manufacturer order by count(*) desc limit 1
select manufacturer from club group by manufacturer having count(*) > 1
select manufacturer from club group by manufacturer having count(*) > 1
select country, count(*) from player group by country having count(*) > 1
select country from player group by country having count(*) > 1
select name from club where club_id not in (select club_id from player)
select name from club where club_id not in (select club_id from player)
select country from player where earnings > 1400000 intersect select country from player where earnings < 1100000
select country from player where earnings > 1400000 intersect select country from player where earnings < 1100000
select count(distinct country) from player
select count(distinct country) from player
select earnings from player where country = "Australia" or country = "Zimbabwe"
select earnings from player where country = "Australia" or country = "Zimbabwe"
select customers.customer_id, customers.customer_first_name, customers.customer_last_name from customers join orders on customers.customer_id = orders.customer_id group by customers.customer_id having count(*) > 2 intersect select customers.customer_id, customers.customer_first_name, customers.customer_last_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.customer_id having count(*) > 3
select orders.customer_id, customers.customer_first_name, customers.customer_last_name from orders join order_items on orders.order_id = order_items.order_id join customers on orders.customer_id = customers.customer_id group by orders.customer_id having count(*) > 2 intersect select orders.customer_id, customers.customer_first_name, customers.customer_last_name from orders join order_items on orders.order_id = order_items.order_id group by orders.customer_id having count(*) > 2
select orders.order_id, orders.order_status_code, count(*) from orders join order_items on orders.order_id = order_items.order_id where order_items.product_id >= 1 group by orders.order_id
select orders.order_status_code, orders.order_id, count(*) from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id
select orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) > 1 order by orders.date_order_placed limit 1
select orders.date_order_placed, orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) > 1
select customer_first_name, customer_middle_initial, customer_last_name from customers except select customers.customer_first_name, customers.customer_middle_initial, customers.customer_last_name from customers join orders on customers.customer_id = orders.customer_id
select customer_first_name, customer_last_name, customer_middle_initial from customers except select customers.customer_first_name, customers.customer_last_name, customers.customer_middle_initial from customers join orders on customers.customer_id = orders.customer_id
select product_id, product_name, product_price, product_color from products except select products.product_id from products join order_items on products.product_id = order_items.product_id group by products.product_id having count(*) >= 2
select products.product_id, products.product_name, products.product_price, products.product_color from orders join order_items join products on orders.order_id = order_items.order_id and order_items.product_id = products.product_id group by products.product_id having count(*) < 2
select orders.order_id, orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) >= 2
select orders.order_id, orders.date_order_placed from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id having count(*) >= 2
select order_items.product_id, products.product_name, products.product_price from order_items join products on order_items.product_id = products.product_id group by orders.order_id order by count(*) desc limit 1
select products.product_id, products.product_name, products.product_price from order_items join products on order_items.product_id = products.product_id group by order_items.product_id order by count(*) desc limit 1
select order_id, sum(product_price) from products group by order_id order by sum(product_price) asc limit 1
select orders.order_id, sum(orders.total_cost) from orders join order_items on orders.order_id = order_items.order_id group by orders.order_id order by sum(orders.total_cost) asc limit 1
select payment_method_code from customer_payment_methods group by payment_method_code order by count(*) desc limit 1
select payment_method_code from customer_payment_methods group by payment_method_code order by count(*) desc limit 1
select customers.gender_code, count(*) from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.gender_code
select customers.gender_code, count(*) from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id group by customers.gender_code
select customers.gender_code, count(*) from customers join orders on customers.customer_id = orders.customer_id group by customers.customer_id
select customers.gender_code, count(*) from customers join orders on customers.customer_id = orders.customer_id group by customers.gender_code
select customers.customer_first_name, customers.customer_middle_initial, customers.customer_last_name, customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select customers.customer_first_name, customers.customer_middle_initial, customers.customer_last_name, customer_payment_methods.payment_method_code from customers join customer_payment_methods on customers.customer_id = customer_payment_methods.customer_id
select invoices.invoice_status_code, invoices.invoice_date, shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select invoices.invoice_status_code, invoices.invoice_date, shipments.shipment_date from invoices join shipments on invoices.invoice_number = shipments.invoice_number
select products.product_name, shipments.shipment_date from products join shipments on products.product_id = shipments.product_id
select products.product_name, shipments.shipment_date from products join shipments on products.product_id = shipments.product_id
select order_items.order_status_code, shipments.shipment_tracking_number from order_items join shipments on order_items.order_id = shipments.order_id
select order_items.order_status_code, shipments.shipment_tracking_number from order_items join shipments on order_items.order_id = shipments.order_id
select products.product_name, products.product_color from order_items join products on order_items.product_id = products.product_id join shipments on shipment_items.shipment_id = shipments.shipment_id
select products.product_name, products.product_color from products join shipments on products.product_id = shipments.product_id
select distinct products.product_name, products.product_price, products.product_description from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id where customers.gender_code = "F"
select distinct products.product_name, products.product_price, products.product_description from customers join orders join order_items join products on customers.customer_id = orders.customer_id and orders.order_id = order_items.order_id and order_items.product_id = products.product_id where customers.gender_code = "F"
select invoices.invoice_status_code from orders join shipments on orders.order_id = shipments.order_id join invoices on shipments.invoice_number = invoices.invoice_number where orders.order_id not in (select order_id from shipments)
select invoices.invoice_status_code from orders join shipments on orders.order_id = shipments.order_id join invoices on shipments.invoice_number = invoices.invoice_number where orders.order_id not in (select order_id from shipments)
select order_id, date_order_placed, sum(total cost) from orders group by order_id
select orders.order_id, orders.date_order_placed, sum(customer_payment_methods.amount_paid) from customer_payment_methods join orders on customer_payment_methods.customer_id = orders.customer_id group by orders.order_id
select count(distinct customer_id) from orders
select count(distinct customer_id) from orders
select count(distinct order_item_status_code) from orders
select count(distinct order_item_status_code) from order_items
select count(distinct payment_method_code) from customer_payment_methods
select count(distinct payment_method_code) from customer_payment_methods
select login_name, login_password from customers where phone_number like "%12%"
select login_name, login_password from customers where phone_number like "+12%"
select product_size from products where product_name like "%dell%"
select product_size from products where product_name like "%dell%"
select product_price, product_size from products where product_price > (select avg(product_price) from products)
select product_price, product_size from products where product_price > (select avg(product_price) from products)
select count(*) from products where product_id not in (select product_id from order_items)
select count(*) from products where product_id not in (select product_id from order_items)
select count(*) from customers where customer_id not in (select customer_id from customer_payment_methods)
select count(*) from customers where customer_id not in (select customer_id from customer_payment_methods)
select order_status_code, date_order_placed from orders
select order_status_code, date_order_placed from orders
select address_line_1, town_city, county from customers where country = "USA"
select address_line_1, town_city, county from customers where country = "USA"
select customers.customer_first_name, products.product_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id
select customers.customer_first_name, products.product_name from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id
select count(*) from shipment_items
select count(distinct product_id) from shipments
select avg(product_price) from products
select avg(product_price) from products
select avg(product_price) from products
select avg(product_price) from products
select email_address, town_city, county from customers group by gender_code order by count(*) asc limit 1
select email_address, town_city, county from customers where gender_code = (select customer_id from orders group by gender_code order by count(*) limit 1)
select orders.date_order_placed from orders join customer_payment_methods on orders.customer_id = customer_payment_methods.customer_id group by orders.customer_id having count(*) >= 2
select orders.date_order_placed from orders join customer_payment_methods on orders.customer_id = customer_payment_methods.customer_id group by orders.customer_id having count(*) >= 2
select order_status_code from orders group by order_status_code order by count(*) desc limit 1
select order_status_code from orders group by order_status_code order by count(*) asc limit 1
select products.product_id, products.product_description from products join order_items on products.product_id = order_items.product_id group by products.product_id having count(*) > 3
select products.product_id, products.product_description from products join order_items on products.product_id = order_items.product_id group by order_items.product_id having count(*) > 3
select invoices.invoice_date, shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count(*) >= 2
select invoices.invoice_date, shipments.invoice_number from invoices join shipments on invoices.invoice_number = shipments.invoice_number group by shipments.invoice_number having count(*) >= 2
select shipment_tracking_number, shipment_date from shipments
select shipment_tracking_number, shipment_date from shipments
select product_color, product_description, product_size from products where product_price < (select max(product_price) from products)
select product_color, product_description, product_size from products where product_price > (select max(product_price) from products)
select name from director where age > (select avg(age) from director)
select name from director order by age desc limit 1
select count(*) from channel where internet like "%bbc%"
select count(*) from channel where digital_terrestrial_channel = '1'
select title from program order by start_year desc
select director.name from director join program on director.director_id = program.director_id group by director.director_id order by count(*) desc limit 1
select director.name, director.age from director join program on director.director_id = program.director_id group by director.director_id order by count(*) desc limit 1
select title from program order by start_year desc limit 1
select channel.name, channel.internet from channel join program on channel.channel_id = program.channel_id group by program.channel_id having count(*) > 1
select count(*), channel.name from channel join program on channel.channel_id = program.channel_id group by channel.channel_id
select count(*) from channel where channel_id not in (select channel_id from program)
select director.name from director join director_admin on director.director_id = director_admin.director_id join program on director_admin.program_id = program.director_id where program.title = "Dracula"
select channel.name, channel.internet from channel join director_admin on channel.channel_id = director_admin.channel_id group by director_admin.channel_id order by count(*) desc limit 1
select name from director where age between 30 and 60
select channel.name from director join director_admin on director.director_id = director_admin.director_id join channel on director_admin.channel_id = channel.channel_id where director.age < 40 intersect select channel.name from director join director_admin on director.director_id = director_admin.director_id join channel on director_admin.channel_id = channel.channel_id where director.age > 60
select name, channel_id from channel except select channel.channel_id, channel.name from channel join director_admin on channel.channel_id = director_admin.channel_id join director on director_admin.director_id = director.director_id where director.name = "Hank Baskett"
select count(*) from radio
select transmitter from radio order by erp_kw asc
select tv_show_name, original_airdate from tv_show
select station_name from city_channel where affiliation!= "ABC"
select transmitter from radio where erp_kw > 150 or erp_kw < 30
select transmitter from radio order by erp_kw desc limit 1
select avg(erp_kw) from radio
select affiliation, count(*) from city_channel group by affiliation
select affiliation from city_channel group by affiliation order by count(*) desc limit 1
select affiliation from city_channel group by affiliation having count(*) > 3
select city, station_name from city_channel order by station_name asc
select radio.transmitter, city_channel.city from city_channel join radio on city_channel.city_channel_id = radio.radio_id
select radio.transmitter, city_channel.station_name from city_channel join radio on city_channel.radio_id = radio.radio_id order by radio.erp_kw desc
select radio.transmitter, count(*) from city_channel_radio join radio on city_channel_radio.radio_id = radio.radio_id group by radio.transmitter
select distinct transmitter from radio where radio_id not in (select radio_id from city_channel_radio)
select model from vehicle where top_speed = (select max(top_speed) from vehicle where power > 6000)
select model from vehicle where power > 6000 order by top_speed desc limit 1
select name from driver where citizenship = 'United States'
select name from driver where citizenship = 'United States'
select count(*), driver.driver_id from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id group by driver.driver_id order by count(*) desc limit 1
select driver.driver_id, count(*) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id group by driver.driver_id order by count(*) desc limit 1
select max(power), avg(power) from vehicle where builder = "Zhuzhou"
select max(power), avg(power) from vehicle where builder = "Zhuzhou"
select vehicle_id from vehicle_driver group by vehicle_id order by count(*) limit 1
select vehicle_id from vehicle_driver group by vehicle_id order by count(*) asc limit 1
select top_speed, power from vehicle where build_year = 1996
select top_speed, power from vehicle where build_year = 1996
select build_year, model, builder from vehicle
select build_year, model, builder from vehicle
select count(distinct vehicle_driver.driver_id) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count(distinct vehicle_driver.driver_id) from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.build_year = 2012
select count(*) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id where vehicle_driver.racing_series = "Nascar"
select count(*) from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id where driver.racing_series = "Nascar"
select avg(top_speed) from vehicle
select avg(top_speed) from vehicle
select distinct driver.name from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where vehicle.power > 5000
select driver.name from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.power > 5000
select model from vehicle where total_production > 100 or top_speed > 150
select model from vehicle where total_production > 100 or top_speed > 150
select model, build_year from vehicle where model like "%dj%"
select model, build_year from vehicle where model like "%dj%"
select model from vehicle where vehicle_id not in (select vehicle_id from vehicle_driver)
select model from vehicle where vehicle_id not in (select vehicle_id from vehicle_driver)
select vehicle.vehicle_id, vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = "Ziyang" group by vehicle.vehicle_id having count(*) = 2 union select vehicle.vehicle_id, vehicle.model from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id where manufacturer = "Ziyang"
select vehicle.vehicle_id, vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = "Ziyang" group by vehicle.vehicle_id having count(*) = 2 union select vehicle.vehicle_id, vehicle.model from vehicle_driver join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = "Ziyang"
select vehicle.vehicle_id, vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = "Jeff Gordon" group by vehicle.vehicle_id having count(*) > 2
select vehicle.vehicle_id, vehicle.model from vehicle_driver join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id join driver on vehicle_driver.driver_id = driver.driver_id where driver.name = "Jeff Gordon" group by vehicle_driver.vehicle_id having count(*) > 2
select count(*) from vehicle order by top_speed desc limit 1
select count(*) from vehicle where top_speed = (select max(top_speed) from vehicle)
select name from driver order by name
select name from driver order by name asc
select racing_series, count(*) from driver group by racing_series
select racing_series, count(*) from driver group by racing_series
select driver.name, driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = "DJ1"
select driver.name, driver.citizenship from driver join vehicle_driver on driver.driver_id = vehicle_driver.driver_id join vehicle on vehicle_driver.vehicle_id = vehicle.vehicle_id where vehicle.model = "DJ1"
select count(*) from driver where driver_id not in (select driver_id from vehicle_driver)
select count(*) from driver where driver_id not in (select driver_id from vehicle_driver)
select count(*) from exams
select count(*) from exams
select distinct subject_code from exams order by subject_code asc
select distinct subject_code from exams order by subject_code
select exam_name, exam_date from exams where subject_code!= "Database"
select exam_date, exam_name from exams where subject_code!= "Database"
select exam_date from exams where subject_code like "%data%" order by exam_date desc
select exam_date from exams where subject_code like "%data%" order by exam_date desc
select type_of_question_code, count(*) from questions group by type_of_question_code
select type_of_question_code, count(*) from questions group by type_of_question_code
select distinct student_answer_text from student_answers where comments = "Normal"
select distinct student_answer_text from student_answers where comments = "Normal"
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
select students.first_name from student_answers join students on student_answers.student_id = students.student_id group by student_answers.student_id having count(*) >= 2
select students.first_name from students join student_answers on students.student_id = student_answers.student_id group by students.student_id having count(*) >= 2
select valid_answer_text from valid_answers group by valid_answer_text order by count(*) desc limit 1
select valid_answers.valid_answer_text from valid_answers join student_assessments on valid_answers.valid_answer_id = student_assessments.valid_answer_id group by valid_answers.valid_answer_text order by count(*) desc limit 1
select last_name from students where gender_mfu!= "M"
select last_name from students where gender_mfu!= "M"
select gender_mfu, count(*) from students group by gender_mfu
select gender_mfu, count(*) from students group by gender_mfu
select last_name from students where gender_mfu = "F" or gender_mfu = "M"
select last_name from students where gender_mfu = "F" or gender_mfu = "M"
select first_name from students where student_id not in (select student_id from student_answers)
select first_name from students where student_id not in (select student_id from student_answers)
select student_answer_text from student_answers where comments = "Normal" intersect select student_answer_text from student_answers where comments = "Absence"
select student_answer_text from student_answers where comments = "Normal" intersect select student_answer_text from student_answers where comments = "Absence"
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
select product_price from products where product_name = "monitor"
select product_price from products where product_name = "monitor"
select min(product_price), avg(product_price), max(product_price) from products
select min(product_price), avg(product_price), max(product_price) from products
select avg(product_price) from products where product_type_code = "clothes"
select avg(product_price) from products
select count(*) from products where product_type_code = 'Hardware'
select count(*) from products where product_type_code = "hardware"
select product_name from products where product_price > (select avg(product_price) from products)
select product_name from products where product_price > (select avg(product_price) from products)
select product_name from products where product_price > (select avg(product_price) from products where product_type_code = "hardware")
select product_name from products where product_price > (select avg(product_price) from products)
select product_name from products where product_type_code = 'Clothes' order by product_price desc limit 1
select product_name from products order by product_price desc limit 1
select product_id, product_name from products where product_type_code = 'Hardware' order by product_price limit 1
select product_id, product_name from products order by product_price limit 1
select product_name from products order by product_price desc
select product_name from products order by product_price desc
select product_type_code from products order by product_price asc
select product_name from products order by product_price
select product_type_code, count(*) from products group by product_type_code
select product_type_code, count(*) from products group by product_type_code
select product_type_code, avg(product_price) from products group by product_type_code
select product_type_code, avg(product_price) from products group by product_type_code
select product_type_code from products group by product_type_code having count(*) >= 2
select product_type_code from products group by product_type_code having count(*) >= 2
select product_type_code from products group by product_type_code order by count(*) desc limit 1
select product_type_code from products group by product_type_code order by count(*) desc limit 1
select count(*) from customers
select count(*) from customers
select customer_id, customer_name from customers
select customer_id, customer_name from customers
select customer_address, customer_phone, customer_email from customers where customer_name = "jeromy"
select customer_address, customer_phone, customer_email from customers where customer_name = "Jerromy"
select payment_method_code, count(*) from customers group by payment_method_code
select payment_method_code, count(*) from customers group by payment_method_code
select payment_method_code from customers group by payment_method_code order by count(*) desc limit 1
select payment_method_code from customers group by payment_method_code order by count(*) desc limit 1
select customer_name, payment_method_code from customers group by payment_method_code order by count(*) asc limit 1
select customer_name from customers where payment_method_code = (select payment_method_code from customers group by payment_method_code order by count(*) asc limit 1)
select payment_method_code, customer_number from customers where customer_name = "jerromy"
select payment_method_code, customer_number from customers where customer_name = "Jerromy"
select distinct payment_method_code from customers
select distinct payment_method_code from customers
select product_id, product_type_code from products order by product_name
select product_id, product_type_code from products order by product_name
select product_type_code from products group by product_type_code order by count(*) asc limit 1
select product_type_code from products group by product_type_code order by count(*) asc limit 1
select count(*) from customer_orders
select count(*) from customer_orders
select order_id, order_date, order_status_code from customer_orders where customer_id = "jerromy"
select customer_orders.order_id, customer_orders.order_date, customer_orders.order_status_code from customers join customer_orders on customers.customer_id = customer_orders.customer_id where customers.customer_name = "jerromy"
select customers.customer_name, customer_orders.customer_id, count(*) from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customer_orders.customer_id
select customers.customer_name, customer_orders.customer_id, count(*) from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customer_orders.customer_id
select customers.customer_id, customers.customer_name, customers.customer_phone, customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id order by count(*) desc limit 1
select customers.customer_id, customers.customer_name, customers.customer_phone, customers.customer_email from customers join customer_orders on customers.customer_id = customer_orders.customer_id group by customers.customer_id order by count(*) desc limit 1
select order_status_code, count(*) from customer_orders group by order_status_code
select order_status_code, count(*) from customer_orders group by order_status_code
select order_status_code from customer_orders group by order_status_code order by count(*) desc limit 1
select order_status_code from customer_orders group by order_status_code order by count(*) desc limit 1
select count(*) from customers where customer_id not in (select customer_id from customer_orders)
select count(*) from customers where customer_id not in (select customer_id from customer_orders)
select product_name from products except select products.product_name from products join order_items on products.product_id = order_items.product_id
select product_name from products except select products.product_name from products join order_items on products.product_id = order_items.product_id
select count(*) from order_items join products on order_items.product_id = products.product_id where products.product_name = "monitor"
select sum(order_items.order_quantity) from order_items join products on order_items.product_id = products.product_id where products.product_name = "monitor"
select count(distinct customer_orders.customer_id) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name = "monitor"
select count(distinct customer_id) from customer_orders join order_items on customer_orders.order_id = order_items.order_id join products on order_items.product_id = products.product_id where products.product_name = "monitor"
select count(distinct customer_id) from customer_orders
select count(distinct customer_id) from customer_orders
select customer_id from customers except select customer_id from customer_orders
select customer_id from customers except select customer_id from customer_orders
select customer_orders.order_date, customer_orders.order_id from customer_orders join order_items on customer_orders.order_id = order_items.order_id where order_items.order_quantity > 6 or order_items.order_quantity > 3
select customer_orders.order_id, customer_orders.order_date from customer_orders join order_items on customer_orders.order_id = order_items.order_id where order_items.order_quantity > 6 or order_items.product_id > 3
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
select name from region order by name
select capital from region where area > 10000
select capital from region where area > 10000
select capital from region order by population desc limit 1
select capital from region order by population desc limit 1
select name from region order by area desc limit 5
select name from region order by area desc limit 5
select building.name, region.name from building join region on building.region_id = region.region_id
select building.name, region.name from building join region on building.region_id = region.region_id
select region.name from region join building on region.region_id = building.region_id group by region.region_id having count(*) > 1
select region.name from region join building on region.region_id = building.region_id group by region.region_id having count(*) > 1
select region.capital from region join building on region.region_id = building.region_id group by region.region_id order by count(*) desc limit 1
select region.capital from region join building on region.region_id = building.region_id group by region.region_id order by count(*) desc limit 1
select building.address, region.capital from building join region on building.region_id = region.region_id
select building.address, region.name from building join region on building.region_id = region.region_id
select building.number_of_stories from region join building on region.region_id = building.region_id where region.name = "Abruzzo"
select building.number_of_stories from region join building on region.region_id = building.region_id where region.name = "Abruzzo"
select completed_year, count(*) from building group by completed_year
select completed_year, count(*) from building group by completed_year
select completed_year from building group by completed_year order by count(*) desc limit 1
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
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code order by count(*) desc limit 1
select analytical_layer_type_code from analytical_layer group by analytical_layer_type_code order by count(*) desc limit 1
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = "Hardy Kutch"
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id where customers.customer_details = "Hardy Kutch"
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id group by services.service_id having count(*) > 3
select services.service_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id group by customers_and_services.service_id having count(*) > 3
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id group by customers.customer_id order by count(*) desc limit 1
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id group by customers.customer_id order by count(*) desc limit 1
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id group by customers.customer_id order by count(*) desc limit 1
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id group by customers.customer_id order by count(*) desc limit 1
select customer_details from customers except select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id
select customer_details from customers except select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id
select customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id group by customers.customer_id order by count(*) asc limit 1
select distinct customers.customer_details from customers join customers_and_services on customers.customer_id = customers_and_services.customer_id join services on customers_and_services.service_id = services.service_id group by customers.customer_id order by count(*) asc limit 1
select count(distinct customers_and_services_details) from customers_and_services
select count(*) from customers_and_services
select customer_details from customers where customer_details like "%kutch%"
select customer_details from customers where customer_details like "%kutch%"
select services.service_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join services on customer_interactions.service_id = services.service_id where customers.customer_details = "Hardy Kutch" or customer_interactions.status_code = "Good"
select services.service_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join services on customer_interactions.service_id = services.service_id where customers.customer_details = "Hardy Kutch" or customer_interactions.status_code = "Good"
select services.service_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join services on customer_interactions.service_id = services.service_id where customer_interactions.status_code = "Bad" and customers.customer_details = "Hardy Kutch"
select services.service_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join services on customer_interactions.service_id = services.service_id where customers.customer_details = "Hardy Kutch" intersect select services.service_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_interaction_id join customers_and_services on customer_interactions.customer_id = customer_interactions.customer_id where customers.customer_details = "Bad"
select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where customer_interactions.customer_interaction_id = "15 ij"
select services.service_details from services join customer_interactions on services.service_id = customer_interactions.service_id join channels on customer_interactions.channel_id = channels.channel_id where channels.channel_details = "15 ij"
select customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id where customer_interactions.status_code = "stuck" and customer_interactions.services_and_channels_details = "bad"
select customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id where customer_interactions.status_code = "stuck" and customer_interactions.services_and_channels_details = "bad"
select count(*) from integration_platform where integration_platform_details = 'Success'
select count(*) from integration_platform where integration_platform_details = 'Success'
select distinct customers.customer_details from customers join integration_platform on customers.customer_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = "fail"
select distinct customers.customer_details from customers join customer_interactions on customers.customer_id = customer_interactions.customer_id join integration_platform on customer_interactions.customer_interaction_id = integration_platform.customer_interaction_id where integration_platform.integration_platform_details = "fail"
select service_details from services where service_id not in (select service_id from customers_and_services)
select service_details from services where service_id not in (select service_id from customers_and_services)
select analytical_layer_type_code, count(*) from analytical_layer group by analytical_layer_type_code
select analytical_layer_type_code, count(*) from analytical_layer group by analytical_layer_type_code
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id where customers_and_services.customers_and_services_details = "unsatisfied"
select services.service_details from services join customers_and_services on services.service_id = customers_and_services.service_id where customers_and_services.customers_and_services_details = "unsatisfied"
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
select type_of_powertrain from vehicles group by type_of_powertrain order by count(*) desc limit 1
select type_of_powertrain from vehicles group by type_of_powertrain order by count(*) desc limit 1
select min(annual_fuel_cost), max(annual_fuel_cost), avg(annual_fuel_cost) from vehicles
select min(annual_fuel_cost), max(annual_fuel_cost), avg(annual_fuel_cost) from vehicles
select name, model_year from vehicles where city_fuel_economy_rate <= (select min(city_fuel_economy_rate) from vehicles)
select name, model_year from vehicles where city_fuel_economy_rate <= (select min(city_fuel_economy_rate) from vehicles)
select type_of_powertrain, avg(annual_fuel_cost) from vehicles group by type_of_powertrain having count(*) >= 2
select type_of_powertrain, avg(annual_fuel_cost) from vehicles group by type_of_powertrain having count(*) >= 2
select name, age, membership_credit from customers
select name, age, membership_credit from customers
select name, age from customers order by membership_credit desc limit 1
select name, age from customers order by membership_credit desc limit 1
select avg(age) from customers where membership_credit > (select avg(age) from customers)
select avg(age) from customers where membership_credit > (select avg(membership_credit) from customers)
select * from discount
select * from discount
select vehicles.name, renting_history.total_hours from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id
select vehicles.name, sum(renting_history.total_hours) from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by vehicles.id
select name from vehicles where id not in (select vehicles_id from renting_history)
select name from vehicles where id not in (select vehicles_id from renting_history)
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by customers.id having count(*) >= 2
select customers.name from customers join renting_history on customers.id = renting_history.customer_id group by customers.id having count(*) >= 2
select vehicles.name, vehicles.model_year from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id order by count(*) desc limit 1
select vehicles.name, vehicles.model_year from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id order by count(*) desc limit 1
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by vehicles.id order by renting_history.total_hours desc
select vehicles.name from vehicles join renting_history on vehicles.id = renting_history.vehicles_id order by renting_history.total_hours desc
select discount.name from discount join renting_history on discount.id = renting_history.discount_id group by discount.id order by count(*) desc limit 1
select discount.name from discount join renting_history on discount.id = renting_history.discount_id group by discount.id order by count(*) desc limit 1
select vehicles.name, vehicles.type_of_powertrain from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id having sum(renting_history.total_hours) > 30
select vehicles.name, vehicles.type_of_powertrain from vehicles join renting_history on vehicles.id = renting_history.vehicles_id group by renting_history.vehicles_id having sum(renting_history.total_hours) > 30
select avg(city_fuel_economy_rate), avg(highway_fuel_economy_rate), type_of_powertrain from vehicles group by type_of_powertrain
select avg(city_fuel_economy_rate), avg(highway_fuel_economy_rate), type_of_powertrain from vehicles group by type_of_powertrain
select avg(amount_of_loan) from student_loans
select avg(amount_of_loan) from student_loans
select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) >= 2 union select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) < 2
select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) >= 2 union select students.bio_data, students.student_id from classes join students on classes.student_id = students.student_id group by students.student_id having count(*) < 2
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.class_details like "%data%" except select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.class_details like "%net%"
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.class_details like "%data%" except select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.class_details like "%net%"
select bio_data from students except select students.bio_data from students join detention on students.student_id = detention.student_id union select students.bio_data from students join student_loans on students.student_id = student_loans.student_id
select bio_data from students except select students.bio_data from students join detention on students.student_id = detention.student_id union select students.bio_data from students join student_loans on students.student_id = student_loans.student_id
select student_loans.amount_of_loan, student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by student_loans.student_id having count(*) >= 2
select student_loans.amount_of_loan, student_loans.date_of_loan from student_loans join achievements on student_loans.student_id = achievements.student_id group by student_loans.student_id having count(*) >= 2
select teachers.teacher_details, teachers.teacher_id from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count(*) desc limit 1
select teachers.teacher_details, classes.teacher_id from classes join teachers on classes.teacher_id = teachers.teacher_id group by classes.teacher_id order by count(*) desc limit 1
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select distinct ref_detention_type.detention_type_description from ref_detention_type join detention on ref_detention_type.detention_type_code = detention.detention_type_code
select students.bio_data, ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select students.student_details, ref_address_types.address_type_description from students join students_addresses on students.student_id = students_addresses.student_id join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code
select addresses.address_details, students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id
select addresses.address_details, students.bio_data from addresses join students_addresses on addresses.address_id = students_addresses.address_id
select students.bio_data, transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select students.bio_data, transcripts.date_of_transcript from students join transcripts on students.student_id = transcripts.student_id
select count(*), behaviour_monitoring.behaviour_monitoring_details from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 1
select behaviour_monitoring.behaviour_monitoring_details, count(*) from behaviour_monitoring join count(*) on behaviour_monitoring.behaviour_monitoring_details = count(*) desc limit 1
select students.bio_data, students.student_details from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 3
select students.bio_data, students.student_details from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 3
select students.bio_data from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 1
select students.bio_data from behaviour_monitoring join students on behaviour_monitoring.student_id = students.student_id group by behaviour_monitoring.student_id order by count(*) desc limit 1
select students.bio_data, student_events.event_date from students join student_events on students.student_id = student_events.student_id
select students.bio_data, student_events.event_date from students join student_events on students.student_id = student_events.student_id
select count(*), event_types.event_type_description, ref_event_types.event_type_description from ref_event_types join student_events on ref_event_types.event_type_code = student_events.event_type_code group by event_types.event_type_code order by count(*) desc limit 1
select event_types.event_type_code, ref_event_types.event_type_description from student_events join ref_event_types on student_events.event_type_code = ref_event_types.event_type_code group by student_events.event_type_code order by count(*) desc limit 1
select achievements.achievement_details, ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select achievements.achievement_details, ref_achievement_type.achievement_type_description from achievements join ref_achievement_type on achievements.achievement_type_code = ref_achievement_type.achievement_type_code
select count(*) from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.student_id not in ( select student_id from achievements )
select count(*) from classes join teachers on classes.teacher_id = teachers.teacher_id where classes.student_id not in ( select student_id from achievements )
select date_of_transcript, transcript_details from transcripts
select date_of_transcript, transcript_details from transcripts
select achievement_type_code, achievement_details, date_achievement from achievements
select achievement_type_code, achievement_details, date_achievement from achievements
select datetime_detention_start, datetime_detention_end from detention
select datetime_detention_start, datetime_detention_end from detention
select bio_data from students where student_details like "%suite%"
select bio_data from students where student_details like "%suite%"
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id join students on classes.student_id = students.student_id group by teachers.teacher_id having count(*) = 1
select teachers.teacher_details, students.student_details from classes join teachers on classes.teacher_id = teachers.teacher_id join students on classes.student_id = students.student_id
select count(*), teachers.teacher_id from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count(*) desc limit 1
select teachers.teacher_id, count(*) from classes join teachers on classes.teacher_id = teachers.teacher_id group by teachers.teacher_id order by count(*) desc limit 1
select student_id from classes group by student_id order by count(*) desc limit 1
select student_id, count(*) from classes group by student_id order by count(*) desc limit 1
select students.student_id, students.student_details from classes join students on classes.student_id = students.student_id group by classes.student_id having count(*) = 2
select classes.student_id, students.student_details from classes join students on classes.student_id = students.student_id group by classes.student_id having count(*) = 2
select detention.detention_type_code, ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count(*) asc limit 1
select detention.detention_type_code, ref_detention_type.detention_type_description from detention join ref_detention_type on detention.detention_type_code = ref_detention_type.detention_type_code group by detention.detention_type_code order by count(*) asc limit 1
select students.bio_data, students.student_details from students join student_loans on students.student_id = student_loans.student_id where student_loans.amount_of_loan > ( select avg(amount_of_loan) from student_loans )
select students.bio_data, students.student_details from students join student_loans on students.student_id = student_loans.student_id where student_loans.amount_of_loan > (select avg(amount_of_loan) from student_loans)
select date_of_loan from student_loans order by date_of_loan asc limit 1
select date_of_loan from student_loans order by date_of_loan asc limit 1
select students.bio_data from students join student_loans on students.student_id = student_loans.student_id order by student_loans.amount_of_loan asc limit 1
select students.bio_data from students join student_loans on students.student_id = student_loans.student_id order by student_loans.amount_of_loan asc limit 1
select transcripts.date_of_transcript from transcripts join student_loans on transcripts.student_id = student_loans.student_id order by student_loans.amount_of_loan desc limit 1
select transcripts.date_of_transcript from student_loans join transcripts on student_loans.student_id = transcripts.student_id order by student_loans.amount_of_loan desc limit 1
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id join transcripts on classes.student_id = transcripts.student_id order by transcripts.date_of_transcript limit 1
select teachers.teacher_details from classes join teachers on classes.teacher_id = teachers.teacher_id join transcripts on classes.student_id = transcripts.student_id order by transcripts.date_of_transcript limit 1
select student_loans.student_id, sum(amount_of_loan) from student_loans join students on student_loans.student_id = students.student_id group by student_loans.student_id
select student_loans.student_id, sum(student_loans.amount_of_loan) from student_loans join students on student_loans.student_id = students.student_id group by student_loans.student_id
select students.student_id, students.bio_data, count(*) from students join classes on students.student_id = classes.student_id group by students.student_id
select student_id, bio_data, count(*) from students group by student_id
select count(distinct student_id) from detention
select count(distinct student_id) from detention
select students_addresses.address_type_code, ref_address_types.address_type_description from students_addresses join ref_address_types on students_addresses.address_type_code = ref_address_types.address_type_code group by students_addresses.address_type_code order by count(*) desc limit 1
select ref_address_types.address_type_code, ref_address_types.address_type_description from ref_address_types join students_addresses on ref_address_types.address_type_code = students_addresses.address_type_code group by ref_address_types.address_type_code order by count(*) desc limit 1
select bio_data from students where student_id in ( select student_id from student_events ) except select students.student_id from students join student_loans on students.student_id = student_loans.student_id
select bio_data from students except select students.bio_data from students join student_events on students.student_id = student_events.student_id join student_loans on student_events.student_id = student_loans.student_id
select students_addresses.date_from, students_addresses.date_to from students_addresses join transcripts on students_addresses.student_id = transcripts.student_id group by students_addresses.student_id having count(*) = 2
select addresses.address_details from addresses join students_addresses on addresses.address_id = students_addresses.address_id join transcripts on students_addresses.student_id = transcripts.student_id group by addresses.address_id having count(*) = 2
select datetime_detention_start from detention
select datetime_detention_start from detention
select name from author
select name from author
select name, address from client
select name, address from client
select title, isbn, saleprice from book
select title, isbn, purchaseprice from book
select count(*) from book
select count(*) from book
select count(*) from author
select count(*) from author
select count(*) from client
select count(*) from client
select name, address from client order by name
select name, address from client order by name
select book.title, author.name from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor
select book.title, author.name from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor
select orders.idorder, client.name from orders join client on orders.idclient = client.idclient
select orders.idorder, client.name from orders join client on orders.idclient = client.idclient
select author.name, count(*) from author_book join book on author_book.isbn = book.isbn group by author.name
select author.name, count(*) from author_book join book on author_book.isbn = book.isbn group by author.name
select book.isbn, count(*) from books_order join book on books_order.isbn = book.isbn group by book.isbn
select book.isbn, count(*) from books_order join book on books_order.isbn = book.isbn group by books_order.isbn
select isbn, sum(amount) from books_order group by isbn
select sum(amount), isbn from books_order group by isbn
select book.title from books_order join book on books_order.isbn = book.isbn group by books.isbn order by count(*) desc limit 1
select book.title from books_order join book on books_order.isbn = book.isbn group by books_order.isbn order by count(*) desc limit 1
select book.title, book.purchaseprice from books_order join book on books_order.isbn = book.isbn group by books.isbn order by sum(books_order.amount) desc limit 1
select book.title, book.purchaseprice from books_order join book on books_order.isbn = book.isbn group by books_order.isbn order by sum(books_order.amount) desc limit 1
select book.title from books_order join book on books_order.isbn = book.isbn
select distinct book.title from books_order join book on books_order.isbn = book.isbn
select client.name from orders join client on orders.idclient = client.idclient group by orders.idclient having count(*) >= 1
select distinct client.name from orders join client on orders.idclient = client.idclient
select client.name, count(*) from orders join client on orders.idclient = client.idclient group by client.idclient
select client.name, count(*) from orders join client on orders.idclient = client.idclient group by client.idclient
select client.name from client join orders on client.idclient = orders.idclient group by orders.idclient order by count(*) desc limit 1
select client.name from client join orders on client.idclient = orders.idclient group by orders.idclient order by count(*) desc limit 1
select client.name, sum(books_order.amount) from books_order join orders on books_order.idorder = orders.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name, sum(books_order.amount) from books_order join orders on books_order.idorder = orders.idorder join client on orders.idclient = client.idclient group by client.idclient
select client.name from books_order join orders on books_order.idorder = orders.idorder join client on orders.idclient = client.idclient group by client.idclient order by sum(books_order.amount) desc limit 1
select client.name from client join orders on client.idclient = orders.idclient join books_order on books_order.idorder = orders.idorder group by client.idclient order by sum(books_order.amount) desc limit 1
select title from book where isbn not in (select isbn from books_order)
select title from book where isbn not in (select isbn from books_order)
select name from client except select client.name from orders join client on orders.idclient = client.idclient
select name from client except select client.name from client join orders on client.idclient = orders.idclient
select max(saleprice), min(saleprice) from book
select max(saleprice), min(saleprice) from book
select avg(purchaseprice), avg(saleprice) from book
select avg(purchaseprice), avg(saleprice) from book
select max(saleprice) from book
select saleprice - purchaseprice from book order by saleprice desc limit 1
select title from book where saleprice > (select avg(saleprice) from book)
select title from book where saleprice > (select avg(saleprice) from book)
select title from book order by saleprice limit 1
select title from book where saleprice = (select min(saleprice) from book)
select title from book order by purchaseprice desc limit 1
select title from book order by purchaseprice desc limit 1
select avg(book.saleprice) from author join author_book on author.idauthor = author_book.author join book on book.isbn = author_book.isbn where author.name = "George Orwell"
select avg(book.saleprice) from author_book join book on author_book.isbn = book.isbn where author.name = "George Orwell"
select saleprice from book join author_book on book.author = author_book.author where author.name = "Plato"
select saleprice from book join author_book on book.author = author_book.author where author.name = "Plato"
select title from book where purchaseprice = (select min(purchaseprice) from book where author = "George Orwell")
select title from book where saleprice = (select min(saleprice) from book where author = "George Orwell")
select title from book where purchaseprice < (select avg(purchaseprice) from book) and author.name = "Plato"
select book.title from author_book join book on author_book.isbn = book.isbn where author.name = "Plato" and book.saleprice < (select avg(saleprice) from book)
select author.name from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where book.title = "Pride and Prejudice"
select author.name from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where book.title = "Pride and Prejudice"
select book.title from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name like "%plato%"
select book.title from author_book join book on author_book.isbn = book.isbn join author on author_book.author = author.idauthor where author.name like '%plato%'
select count(*) from orders where title = "Pride and Prejudice"
select count(*) from orders where title = "Pride and Prejudice"
select orders.idorder from orders join books_order on orders.idorder = books_order.idorder join book on books_order.isbn = book.isbn where book.title = "Pride and prejudice" intersect select orders.idorder from orders join books_order on orders.idorder = books_order.idorder where book.title = "The little Prince"
select orders.idorder from orders join books_order on orders.idorder = books_order.idorder join movie on books_order.isbn = movie.isbn where movie.title = "Pride and Prejudice" intersect select orders.idorder from orders join books_order on orders.idorder = books_order.idorder where movie.title = "The little Prince"
select book.isbn from orders join book on orders.idorder = book.isbn join author_book on books_order.isbn = author_book.isbn join client on client.idclient = orders.idclient where client.name = "Peter Doe" intersect select book.isbn from orders join author_book on orders.idorder = book_order.idorder join author on author_book.author = author.idauthor.idorder.isbn = book.isbn where author_book.author = "James Smith"
select book.isbn from books_order join orders on books_order.idorder = orders.idorder join client on orders.idclient = client.idclient where client.name = "Peter Doe" intersect select book.isbn from books_order join author on books_order.author = author.idauthor where author.name = "James Smith"
select book.title from orders join book on orders.idorder = book.isbn join author_book on books_order.isbn = author_book.isbn join client on orders.idclient = client.idclient where client.name = "Peter Doe" except select book.title from orders join author_book on orders.idorder = author_book.idorder join book on books_order.isbn = book.isbn where author.name = "James Smith"
select book.title from orders join book on orders.idorder = book.isbn join author_book on books_order.isbn = author_book.isbn join client on orders.idclient = client.idclient where client.name = "Peter Doe" and author.name = "James Smith"
select client.name from orders join client on orders.idclient = client.idclient where orders.title = "Pride and Prejudice"
select client.name from client join orders on client.idclient = orders.idclient where orders.dateorder = "Pride and Prejudice"
select count(*) from book
select title from book order by title asc
select title from book order by pages desc
select type, release from book
select max(chapters), min(chapters) from book
select title from book where title!= "Poet"
select avg(rating) from review
select book.title, review.rating from book join review on book.book_id = review.book_id
select review.rating from book join review on book.book_id = review.book_id order by book.chapters desc limit 1
select review.rank from book join review on book.book_id = review.book_id order by book.pages asc limit 1
select book.title from book join review on book.book_id = review.book_id order by review.rank desc limit 1
select avg(review.readers_in_million) from book join review on book.book_id = review.book_id where book.type = "novel"
select type, count(*) from book group by type
select type from book group by type order by count(*) desc limit 1
select type from book group by type having count(*) >= 3
select book.title from book join review on book.book_id = review.book_id order by review.rating asc
select title, audio from book order by readers_in_million desc
select count(*) from book where book_id not in (select book_id from review)
select type from book where chapters > 75 intersect select type from book where chapters < 50
select count(distinct type) from book
select type, title from book where book_id not in (select book_id from review)
select count(*) from customer
select count(*) from customer
select name from customer order by level_of_membership asc
select name from customer order by level_of_membership asc
select nationality, card_credit from customer
select nationality, card_credit from customer
select name from customer where nationality = "england" or nationality = "Australia"
select name from customer where nationality = "england" or nationality = "Australia"
select avg(card_credit) from customer where level_of_membership > 1;
select avg(card_credit) from customer where level_of_membership > 1
select card_credit from customer order by level_of_membership desc limit 1
select card_credit from customer order by level_of_membership desc limit 1
select nationality, count(*) from customer group by nationality
select nationality, count(*) from customer group by nationality
select nationality from customer group by nationality order by count(*) desc limit 1
select nationality from customer group by nationality order by count(*) desc limit 1;
select nationality from customer where card_credit < 50 intersect select nationality from customer where card_credit > 75
select nationality from customer where card_credit > 50 intersect select nationality from customer where card_credit < 75
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name, customer_order.dish_name from customer_order join customer on customer_order.customer_id = customer.customer_id order by customer_order.quantity desc
select customer.name, sum(customer_order.quantity) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id
select customer.name, sum(customer_order.quantity) from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id
select customer_id from customer_order group by customer_id having sum(quantity) > 1
select customer.name from customer_order join customer on customer_order.customer_id = customer.customer_id group by customer.customer_id having sum(customer_order.quantity) > 1
select distinct manager from branch
select distinct manager from branch
select name from customer where customer_id not in (select customer_id from customer_order)
select name from customer where customer_id not in (select customer_id from customer_order)
select count(*) from member
select name from member order by age asc
select name, nationality from member
select name from member where nationality!= "England"
select name from member where age = 19 or age = 20
select name from member order by age desc limit 1
select nationality, count(*) from member group by nationality
select nationality from member group by nationality order by count(*) desc limit 1
select nationality from member group by nationality having count(*) >= 2
select club_leader.name, club.club_name from club_leader join club on club_leader.club_id = club.club_id
select club_leader from club where overall_ranking > 100
select member.name from club_leader join member on club_leader.member_id = member.member_id where club_leader.year_join < 2018
select club_leader.name from club join club_leader on club.club_id = club_leader.club_id where club.club_name = "Houston"
select name from member where member_id not in (select member_id from club_leader)
select nationality from member where age > 22 intersect select nationality from member where age < 19
select avg(member.age) from club_leader join member on club_leader.member_id = member.member_id
select club_name from club where club_name like "%state%"
select collection_subsets.collection_subset_name from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id
select collection_subsets.collection_subset_name from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id
select collecrtion_subset_details from collection_subsets where collection_subset_name = "Top Collection"
select collection_subsets.colecrtion_subset_details from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id where collections.collection_name = "Top Collection"
select document_subsets.document_subset_name from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id
select document_subset_name from document_subsets
select document_subset_details from document_subsets where document_subset_name = "Best for 2000"
select document_subset_details from document_subsets where document_subset_name = "Best for 2000"
select document_object_id from document_objects
select document_object_id from document_objects
select parent_document_object_id from document_objects where owner = "Marlin"
select document_object_id from document_objects where owner = "Marlin"
select owner from document_objects where description = "Braeden Collection"
select document_objects.owner from document_objects join documents_in_collections on document_objects.document_object_id = documents_in_collections.document_object_id join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = "Braeden Collection"
select parent_document_object_id from document_objects where owner = "Marlin"
select parent_document_object_id from document_objects where owner = "Marlin"
select distinct description from document_objects
select distinct description from document_objects
select count(*) from document_objects where owner = "Marlin"
select count(*) from document_objects where owner = "Marlin"
select document_object_id from document_objects except select parent_document_object_id from document_objects
select document_object_id from document_objects except select document_object_id from document_objects
select parent_document_object_id, count(*) from document_objects group by parent_document_object_id
select count(*), parent_document_object_id from document_objects group by parent_document_object_id
select collection_name from collections
select collection_name from collections
select collection_description from collections order by collection_name desc limit 1
select collection_description from collections where collection_name = "Best"
select parent_collection_id from collections where collection_name = "Nice"
select parent_collection_id from collections where collection_name = "Nice"
select collection_name from collections except select collections.collection_name from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id
select collection_name from collections where parent_collection_id!= "null"
select document_id from document_objects group by document_id having count(*) > 1
select document_object_id from document_objects group by document_object_id having count(*) > 1
select count(*) from collections group by parent_collection_id order by collection_name desc limit 1
select count(*) from collections join collection_subset_members on collections.collections_id = collection_subset_members.collection_id group by collection_subset_members.collection_id order by collections.collection_name desc limit 1
select document_subset_members.document_subset_id from document_subset_members join document_objects on document_subset_members.document_object_id = document_objects.document_object_id where document_objects.owner = "ransom"
select document_subset_members.related_document_object_id from document_subset_members join document_objects on document_subset_members.document_object_id = document_objects.document_object_id where document_objects.owner = "ransom"
select collection_subsets.collection_subset_id, collection_subsets.collection_subset_name, count(*) from collection_subsets join collection_subset_members on collection_subsets.collection_subset_id = collection_subset_members.collection_subset_id group by collection_subsets.collection_subset_id
select collection_subsets.collection_subset_id, collection_subsets.collection_subset_name, count(*) from collection_subsets join collection_subset_members on collection_subsets.collection_subset_id = collection_subset_members.collection_subset_id group by collection_subsets.collection_subset_id
select document_id, count(*) from child group by document_id order by count(*) desc limit 1
select document_objects.parent_document_object_id, count(*) from document_objects join document_subset_members on document_objects.document_object_id = document_subset_members.document_object_id group by document_objects.parent_document_object_id
select document_id, count(*) from document_subset_members group by document_id order by count(*) asc limit 1
select document_object_id from document_objects group by document_object_id order by count(*) asc limit 1
select document_subset_members.document_object_id, count(*) from document_subset_members join documents on document_subset_members.document_object_id = documents.document_object_id group by document_subset_members.document_object_id having count(*) between 2 and 4
select document_subset_members.document_object_id, count(*) from document_subset_members join documents on document_subset_members.document_object_id = documents.document_object_id group by document_subset_members.document_object_id having count(*) between 2 and 4
select document_objects.owner from document_objects join document_subset_members on document_objects.document_object_id = document_subset_members.related_document_object_id join document_subset_members on document_subset_members.document_subset_id = document_subset_members.document_subset_id where document_objects.owner = "Braeden"
select distinct document_objects.owner from document_objects join document_subset_members on document_objects.document_object_id = document_subset_members.related_document_object_id join collection_subset_members on document_subset_members.document_subset_id = collection_subset_members.document_subset_id where document_objects.owner = "Braeden"
select distinct document_subsets.document_subset_name from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id join document_objects on document_subset_members.document_object_id = document_objects.document_object_id where document_objects.owner = "Braeden"
select distinct document_subsets.document_subset_name from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id join document_objects on document_subset_members.document_object_id = document_objects.document_object_id where document_objects.owner = "Braeden"
select document_subsets.document_subset_id, document_subsets.document_subset_name, count(*) from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id group by document_subsets.document_subset_id
select document_subsets.document_subset_id, document_subsets.document_subset_name, count(*) from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id group by document_subsets.document_subset_id
select document_subsets.document_subset_id, document_subsets.document_subset_name, count(distinct document_subsets.document_subset_id) from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id group by document_subsets.document_subset_id order by count(*) desc limit 1)
select document_subsets.document_subset_id, document_subsets.document_subset_name, count(*) from document_subsets join document_subset_members on document_subsets.document_subset_id = document_subset_members.document_subset_id group by document_subsets.document_subset_id order by count(*) desc limit 1
select document_subset_members.document_subset_id from document_subset_members join document_subsets on document_subset_members.document_subset_id = document_subsets.document_subset_id where document_subsets.document_subset_name = "Best for 2000"
select document_subset_members.document_subset_id from document_subset_members join document_subsets on document_subset_members.document_subset_id = document_subsets.document_subset_id where document_subsets.document_subset_name = "Best for 2000"
select document_subsets.document_subset_name, document_subsets.document_subset_id from document_subset_members join document_subsets on document_subset_members.document_subset_id = document_subset_members.document_subset_id
select document_subsets.document_subset_name, document_subsets.document_subset_id, document_subsets.document_subset_id from document_subset_members join document_subsets on document_subset_members.document_subset_id = document_subset_members.document_subset_id
select collections.collection_name from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = "Ransom"
select collections.collection_name from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_objects on documents_in_collections.document_object_id = document_objects.document_object_id where document_objects.owner = "ransom"
select count(*), document_subset_members.document_object_id from document_subset_members join documents_in_collections on document_subset_members.document_object_id = documents_in_collections.document_object_id group by document_subset_members.document_object_id
select document_objects.document_object_id, count(*) from document_objects join documents_in_collections on document_objects.document_object_id = documents_in_collections.document_object_id group by document_objects.document_object_id
select count(*) from collections join documents_in_collections on collections.collection_id = documents_in_collections.collection_id join document_subset_members on documents_in_collections.document_object_id = document_subset_members.document_object_id where collections.collection_name = "Best"
select count(*) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = "Best"
select document_object_id from documents_in_collections where collection_id = (select collection_id from collections order by collection_name desc limit 1)
select count(*) from documents_in_collections where document_object_id in (select document_object_id from documents_in_collections group by document_object_id order by count(*) desc limit 1)
select collections.collection_name, documents_in_collections.collection_id, count(*) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id group by documents_in_collections.collection_id order by count(*) desc limit 1
select collections.collection_name, collections.collection_id, count(*) from documents_in_collections join collections on documents_in_collections.collection_id = collections.collection_id where collections.collection_name = "best" group by collections.collection_id order by count(*) desc limit 1
select document_subset_members.document_object_id from document_subset_members join documents_in_collections on document_subset_members.document_object_id = documents_in_collections.document_object_id join collection_subsets on documents_in_collections.collection_subset_id = collection_subsets.collection_subset_id where document_subsets.document_subset_name = "2000" and collections.collection_name = "Best"
select distinct document_objects.document_object_id from document_subset_members join documents_in_collections on document_subset_members.document_object_id = documents_in_collections.document_object_id join collections on documents_in_collections.collection_id = collections.collection_id where documents_subsets.document_subset_name = "Best for 2000" intersect select document_subset_members.document_object_id from document_subset_members join collection_subset_members on document_subset_members.collection_id = collections.collection_id where collections.collection_name = "Best"
select document_object_id from documents_in_collections join collection_subset_members on documents_in_collections.collection_id = collection_subset_members.collection_id join document_subset_members on document_subset_members.document_subset_id = collection_subset_members.document_subset_id where collection_subsets.collection_name = ( select document_in_collections.collection_id from documents_in_collections join collection_subset_members on documents_in_collections.collection_id = collection_subset_members.collection_id where collection_subsets.collection_name = "2000"
select document_object_id from documents_in_collections where collection_id in ( select collection_id from collections where collection_name = "Best" ) except select document_object_id from document_subset_members where document_subset_members.document_subset_id in ( select collection_subset_members.collection_subset_id from documents_in_collections join collection_subset_members on documents_in_collections.document_object_id = collection_subset_members.collection_id where collection_name = "Best for 2000" )
select document_object_id from document_subset_members where document_subset_name = "2000" union select document_object_id from documents_in_collections join collection_subsets on documents_in_collections.collection_subset_id = collection_subsets.collection_subset_id
select distinct document_subset_members.document_object_id from document_subset_members join documents_in_collections on document_subset_members.document_object_id = documents_in_collections.document_object_id join collection_subsets on documents_in_collections.collection_id = collection_subsets.collection_id where collection_subsets.document_subset_name = "Best for 2000" or collections.collection_subset_name = "Best"
select collections.collection_name from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id join collection_subset_members on collection_subset_members.collection_id = collection_subset_members.collection_id where collection_subset_members.related_collection_id = (select parent_collection_id from collections join collection_subset_members on collection_subset_members.collection_id = collection_subset_members.collection_id where collection_name = "Best"
select collections.collection_name from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id join collection_subset_members on collection_subset_members.collection_id = collection_subset_members.collection_id where collection_subset_members.related_collection_id = (select parent_collection_id from collections join collection_subset_members on collection_subset_id = collection_subset_members.collection_id group by parent_collection_id order by collection_subset_id order by collection_name desc limit 1)
select count(*) from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id group by collection_subset_members.collection_id order by collections.collection_name desc limit 1
select count(distinct collection_subset_members.related_collection_id) from collections join collection_subset_members on collections.collection_id = collection_subset_members.collection_id where collections.collection_name = "Best"
select collection_subsets.collection_subset_name from collection_subsets join collections on collection_subsets.collection_subset_id = collections.collection_subset_id order by collections.collection_name desc limit 1
select collection_subsets.collection_subset_name from collections join collection_subsets on collections.collection_id = collection_subsets.collection_subset_id where collections.collection_name = "best"
select count(*) from songs where name like "%love%"
select name from songs order by name asc
select name, language from songs
select max(voice_sound_quality), min(voice_sound_quality) from performance_score
select performance_score.voice_sound_quality, performance_score.rhythm_tempo, performance_score.stage_presence from performance_score join participants on performance_score.participant_id = participants.id where participants.name = "Freeway"
select id, language, original_artist from songs where name!= "Love"
select name, original_artist from songs where english_translation = "All the streets of Love"
select distinct performance_score.stage_presence from performance_score join songs on performance_score.songs_id = songs.id where songs.language = "english"
select participants.id, participants.name from performance_score join participants on performance_score.participant_id = participants.id group by performance_score.participant_id having count(*) >= 2
select participants.id, participants.name, participants.popularity from performance_score join participants on performance_score.participant_id = participants.id group by performance_score.participant_id order by count(*) desc
select participants.id, participants.name from participants join performance_score on participants.id = performance_score.participant_id where performance_score.voice_sound_quality = 5 union select participants.id, participants.name from participants join performance_score on participants.id = performance_score.participant_id where performance_score.rhythm_tempo = 5
select performance_score.voice_sound_quality from performance_score join songs on performance_score.songs_id = songs.id where songs.name = "The balkan girls" and songs.language = "english"
select songs.id, songs.name from performance_score join songs on performance_score.songs_id = songs.id group by performance_score.songs_id order by count(*) desc limit 1
select count(*) from performance_score where stage_presence < 7 or stage_presence > 9
select count(*) from songs where id not in (select songs_id from performance_score)
select avg(performance_score.rhythm_tempo), songs.language from performance_score join songs on performance_score.songs_id = songs.id group by songs.language
select distinct participants.name from participants join performance_score on participants.id = performance_score.participant_id join songs on performance_score.songs_id = songs.id where songs.language = "english"
select participants.name, participants.popularity from performance_score join songs on performance_score.songs_id = songs.id join participants on performance_score.participant_id = participants.id where songs.language = "croatian" intersect select participants.name, participants.popularity from performance_score join songs on performance_score.songs_id = songs.id join participants on performance_score.participient_id = participants.id where songs.language = "engl"
select name from songs where name like "%is%"
select original_artist from songs where rhythm_tempo > 5 order by voice_sound_quality desc
select count(*) from city
select count(*) from city
select distinct state from city
select distinct state from city
select count(distinct country) from city
select count(distinct country) from city
select city_name, city_code, state, country from city
select city_name, city_code, state, country from city
select latitude, longitude from city where city_name = "baltimore"
select latitude, longitude from city where city_name = "baltimore"
select city_name from city where state = "Pa"
select city_name from city where state = "PA"
select count(*) from city where country = "Canada"
select count(*) from city where country = "Canada"
select city_name from city order by latitude
select city_name from city order by latitude
select state, count(*) from city group by state
select count(*), state from city group by state
select country, count(*) from city group by country
select count(*), country from city group by country
select state from city group by state having count(*) >= 2
select state from city group by state having count(*) >= 2
select state from city group by state order by count(*) desc limit 1
select state from city group by state order by count(*) desc limit 1
select country from city group by country order by count(*) limit 1
select country from city group by country order by count(*) limit 1
select student.fname, student.lname from city join student on city.city_code = student.city_code where city.state = "MD"
select student.fname, student.lname from city join student on city.city_code = student.city_code where city.state = "MD"
select count(*) from student where country = "China"
select count(*) from student where city_code in (select city_code from city where country = "China")
select fname, major from student where city_code = "Baltimore"
select fname, major from student where city_code = "Baltimore"
select country, count(*) from city group by country
select country, count(*) from city group by country
select city.city_name, count(*) from student join city on student.city_code = city.city_code group by student.city_code
select city.city_name, count(*) from student join city on student.city_code = city.city_code group by student.city_code
select state from city group by state order by count(*) desc limit 1
select state from city group by state order by count(*) desc limit 1
select country from city group by country order by count(*) limit 1
select city.country from city join student on city.city_code = student.city_code group by city.country order by count(*) limit 1
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count(*) >= 3
select city.city_name from city join student on city.city_code = student.city_code group by student.city_code having count(*) >= 3
select state from city group by state having count(*) > 5
select city.state from city join student on city.city_code = student.city_code group by city.state having count(*) > 5
select stuid from student where country!= "USA"
select stuid from student where country!= "USA"
select student.stuid from student join city on student.city_code = city.city_code where city.state = "PA" and student.sex = "F"
select stuid from student where sex = 'F' and state = "PA"
select stuid from student where sex = 'M' and country!= "USA"
select stuid from student where sex = 'M' and country!= "USA"
select distance from direct_distance where city_code = "Bal" and city_code = "chi"
select distance from direct_distance where city_code = "Bal" and city_code = "chi"
select distance from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = "Boston" and direct_distance.city2_code = "Newark"
select distance from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = "Boston" and city.city_name = "Newark"
select avg(distance), min(distance), max(distance) from direct_distance
select avg(distance), min(distance), max(distance) from direct_distance
select city_code from city group by city_code order by max(distance) desc limit 2
select city_code from direct_distance order by distance desc limit 1
select city_code from direct_distance where distance > (select avg(distance) from direct_distance) group by city_code having count(*) >= 2
select city_code from city where distance > (select avg(distance) from direct_distance)
select city_code from city where distance < 1000 group by city_code having count(*) = 2
select city_code from city where distance < 1000
select sum(direct_distance.distance) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = "Bal" group by direct_distance.city1_code
select sum(direct_distance.distance) from city join direct_distance on city.city_code = direct_distance.city2_code where city.city_name = "bal" group by direct_distance.distance
select avg(distance) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = "Boston" group by direct_distance.city2_code
select avg(distance) from city join direct_distance on city.city_code = direct_distance.city1_code where city.city_name = "Boston"
select city_name from city where city_name = "Chicago" order by distance limit 1
select city_name from city where city_name = "Chicago" order by distance limit 1
select city_name from city where city_code = (select city_code from direct_distance where distance = (select max(distance) from direct_distance where city_code = "boston")
select city.city_name from city join direct_distance on city.city_code = direct_distance.city1_code where direct_distance.distance = (select max(distance) from direct_distance where city.city_code = "boston")
select city_code, sum(distance) from direct_distance group by city_code
select city_code, sum(distance) from direct_distance group by city_code
select city.city_name, avg(direct_distance.distance) from city join direct_distance on city.city_code = direct_distance.city2_code group by city.city_name
select city.city_name, avg(direct_distance.distance) from city join direct_distance on city.city_code = direct_distance.city1_code group by city.city_name
select distance from student join direct_distance on student.city_code = direct_distance.city1_code join linda on student.stuid = direct_distance.city1_code join tracy on student.stuid = tracy.kim where linda.first name = "linda" and linda.last name = "smith"
select distance from direct_distance join city on direct_distance.city1_code = city.city_code join student on student.stuid = direct_distance.stuid where student.fname = "Linda Smith" and student.lname = "Tracy Kim"
select student.fname, student.lname from student join direct_distance on student.city_code = direct_distance.city1_code join advisor on student.advisor = advisor.city_code where advisor.advisor = "Linda Smith" order by distance desc limit 1
select student.fname, student.lname from student join direct_distance on student.city_code = direct_distance.city1_code join advisor on student.advisor = advisor.city_code where advisor.name = "Linda Smith" order by distance desc limit 1
select state from student where fname = "linda"
select city.state from city join student on city.city_code = student.city_code where student.fname = "linda"
select * from sailors where age > 30
select name from sailors where age > 30
select name, age from sailors where age < 30
select name, age from sailors where age < 30
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sid = 1
select distinct boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sailor = sailors.sid where sailors.id = 1
select owner from reserves where bid = 102
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.name = 102
select distinct bid from reserves
select sid from reserves
select name from sailors where name like '%e%'
select name from sailors where name like '%e%'
select distinct sid from sailors where age > (select min(age) from sailors)
select distinct sid from sailors where age!= (select min(age) from sailors)
select distinct name from sailors where age > (select min(age) from sailors where rating > 7)
select distinct name from sailors where age > (select min(age) from sailors where rating > 7)
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count(*) >= 1
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count(*) >= 1
select sailors.sid, sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count(*) > 1
select sailors.name from sailors join reserves on sailors.sid = reserves.sid group by sailors.sid having count(*) >= 2
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = "red" or boats.color = "blue"
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = "red" or boats.color = "blue"
select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "red" or boats.color = "blue"
select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "red" or boats.color = "blue"
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = "red" intersect select sailors.sid from sailors join reserves on sailors.sid = reserves.sid where boats.color = "blue"
select sailors.sid from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.bid = boats.bid where boats.color = "red" intersect select sailors.sid from sailors join reserves on sailors.sid = reserves.sid where boats.color = "blue"
select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = 'Red' intersect select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = 'Blue'
select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "red" intersect select sailors.name, sailors.sid from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "blue"
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select name, sid from sailors except select sailors.name, sailors.sid from reserves join sailors on reserves.sid = sailors.sid
select name, sid from sailors where sid not in (select sid from reserves)
select sid from sailors except select sid from reserves
select sid from sailors except select sid from reserves
select sailors.name from reserves join sailors on reserves.sid = sailors.sid where reserves.bid = 103
select sailors.name from sailors join reserves on sailors.sid = reserves.sid where reserves.bid = 103
select name from sailors where rating > (select max(rating) from sailors where name = "luis")
select name from sailors where rating > (select max(rating) from sailors where name = "luis")
select name from sailors where rating > (select max(rating) from sailors where name = "luis")
select name from sailors where rating > (select max(rating) from sailors where name = "luis")
select distinct sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where sailors.rating > 2 intersect select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.bid > 1
select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where sailors.rating >= 3 intersect select sailors.name, sailors.sid from sailors join reserves on sailors.sid = reserves.sid where reserves.bid >= 3
select name, age from sailors order by age desc limit 1
select name, age from sailors order by age desc limit 1
select count(*) from sailors
select count(*) from sailors
select avg(age) from sailors where rating = 7
select avg(age) from sailors where rating = 7
select count(*) from sailors where name like 'D%'
select count(*) from sailors where name like 'D%'
select avg(rating), max(age) from sailors
select avg(rating), max(age) from sailors
select boats.name, count(*) from boats join reserves on boats.bid = reserves.bid group by boats.name
select boats.name, count(*) from boats join reserves on boats.bid = reserves.bid group by boats.name
select count(*), boats.name from reserves join boats on reserves.bid = boats.bid where reserves.sid > 50 group by boats.name
select count(*), boats.name from reserves join boats on reserves.bid = boats.bid where reserves.sid > 50 group by boats.name
select boats.name, count(*) from boats join reserves on boats.bid = reserves.bid group by boats.name having count(*) > 1
select boats.name, count(*) from boats join reserves on boats.bid = reserves.bid group by boats.name having count(*) > 1
select boats.name, count(*) from reserves join boats on reserves.bid = boats.bid where reserves.sid > 1 group by boats.name
select boats.name, count(*) from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.sid > 1 group by boats.name
select sailors.rating, avg(select sailors.age) from reserves join boats on reserves.boat = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "red" group by sailors.rating
select sailors.rating, avg(select sailors.name, boats.color from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.color = "red" group by sailors.rating
select name, rating, age from sailors order by rating, age
select name, rating, age from sailors order by rating, age
select count(*) from boats
select count(*) from boats
select count(*) from boats where color = "red"
select count(*) from boats where color = "red"
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select boats.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where sailors.age between 20 and 30
select sailors.name from reserves join sailors on reserves.sid = sailors.sid join boats on reserves.boat = boats.bid where sailors.rating > (select max(rating) from sailors join boats on reserves.boat = boats.bid where boats.color = "red")
select sailors.name from sailors join reserves on sailors.sid = reserves.sid join boats on reserves.boat = boats.bid where sailors.rating > (select max(rating) from sailors join reserves on sailors.sid = reserves.sid where boats.color = "red")
select max(rating) from sailors
select max(rating) from sailors
select sailors.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.name = "melon"
select sailors.name from reserves join boats on reserves.bid = boats.bid join sailors on reserves.sid = sailors.sid where boats.name = "melon"
select name, age from sailors order by rating desc
select name, age from sailors order by rating desc
select model from headphone order by price desc limit 1
select model from headphone order by price desc limit 1
select model from headphone order by model
select distinct model from headphone order by model
select class from headphone group by class order by count(*) desc limit 1
select class from headphone group by class order by count(*) desc limit 1
select class from headphone group by class having count(*) > 2
select class from headphone group by class having count(*) <= 2
select count(*), class from headphone where price > 200 group by class
select class, count(*) from headphone where price > 200 group by class
select count(distinct earpads) from headphone
select count(distinct earpads) from headphone
select earpads from headphone group by earpads order by count(*) desc limit 2
select earpads from headphone group by earpads order by count(*) desc limit 2
select model, class, construction from headphone order by price asc limit 1
select model, class, construction from headphone order by price asc limit 1
select construction, avg(price) from headphone group by construction
select construction, avg(price) from headphone group by construction
select class from headphone where earpads = "bowls" intersect select class from headphone where earpads = "comfort pads"
select class from headphone where earpads = "bowls" intersect select class from headphone where earpads = "comfort pads"
select earpads from headphone except select earpads from headphone where construction = "plastic"
select earpads from headphone where construction!= "plastic"
select model from headphone where price < (select avg(price) from headphone)
select model from headphone where price < (select avg(price) from headphone)
select name from store order by date_opened
select name from store order by date_opened
select name, parking from store where neighborhood = "Tarzana"
select name, parking from store where neighborhood = "Tarzana"
select count(distinct neighborhood) from store
select count(distinct neighborhood) from store
select neighborhood, count(*) from store group by neighborhood
select neighborhood, count(*) from store group by neighborhood
select store.name, count(*) from stock join store on stock.store_id = store.store_id group by stock.store_id order by count(*) desc limit 1
select store.name, sum(stock.quantity) from stock join store on stock.store_id = store.store_id where stock.headphone_id = 'Headphone'
select name from store where store_id not in (select store_id from stock)
select name from store where store_id not in (select store_id from stock)
select model from headphone where headphone_id not in (select headphone_id from stock)
select model from headphone where headphone_id not in (select headphone_id from stock)
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by stock.headphone_id order by sum(stock.quantity) desc limit 1
select headphone.model from stock join headphone on stock.headphone_id = headphone.headphone_id group by stock.headphone_id order by sum(stock.quantity) desc limit 1
select count(*) from stock join headphone on stock.headphone_id = headphone.headphone_id join store on stock.store_id = store.store_id where store.name = "Woody"
select sum(stock.quantity) from stock join store on stock.store_id = store.store_id where store.name = "Woody"
select neighborhood from store where store_id not in (select store_id from stock)
select neighborhood from store where store_id not in (select store_id from stock)
select count(*) from author
select count(*) from author
select count(*) from paper
select count(*) from paper
select count(*) from affiliation
select count(*) from affiliation
select count(*) from paper where year = 2000 and venue = "Naacl"
select count(*) from paper where year = 2000 and venue = "Naacl"
select count(*) from paper where year = 2009 and affiliation = "Columbia University"
select count(*) from paper join affiliation on paper.affiliation_id = affiliation.affiliation_id where affiliation.name = "Columbia University" and paper.year = 2009
select name, address from affiliation
select name, address from affiliation
select venue, year from paper order by year
select distinct venue from paper order by year
select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "Harvard University"
select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "Harvard University"
select paper.title, paper.paper_id from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where author.name = "Mckeown"
select paper.title, paper.paper_id from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where author.name = "Mckeown"
select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id join columbia university on paper.paper_id = columbia university.paper_id where affiliation.name = "stanford university" intersect select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.paper_id join columbia university on affiliation.affilid = paper.paper_id where affiliation.name = "colombia university"
select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "Stanford" intersect select paper.title, paper.paper_id from affiliation join paper on affiliation.affiliation_id = paper.paper_id where affiliation.name = "Columbia University"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.author_id = "Mckeown, Kathy" intersect select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author_list.author_id where author.name = "Rambouchleen"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown", "Kathleen" and author.name = "Owen"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" except select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author_list.author_id where author.name = "Rambo"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" except select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author_list.author_id where author.name = "Rambo"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" and author.name = "Kathleen" union select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id where author.name = "Owen"
select paper.title, paper.paper_id from author_list join paper on author_list.paper_id = paper.paper_id join author on author_list.author_id = author.author_id where author.name = "McKeown" or author.name = "Rambow" or author.name = "Owen"
select author.name, count(*) from author_list join author on author_list.author_id = author.author_id group by author.name order by count(*) desc
select count(*), author.name from author_list join paper on author_list.paper_id = paper.paper_id group by author.name order by count(*) desc
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id group by affiliation.name order by count(*) asc
select name from affiliation group by name order by count(*)
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count(*) > 50
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count(*) > 50
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count(*) = 1
select author.name from author_list join author on author_list.author_id = author.author_id group by author.author_id having count(*) = 1
select venue, year from paper group by year order by count(*) desc limit 1
select venue, year from paper group by year order by count(*) desc limit 1
select venue from paper group by venue order by count(*) limit 1
select venue from paper group by venue order by count(*) limit 1
select count(distinct citation.cited_paper_id) from paper join citation on paper.paper_id = citation.paper_id where citation.cited_paper_id between 'A00' and '1002'
select count(distinct paper_id) from citation where cited_paper_id = 'A00-1002'
select count(*) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id between d12 and 1027
select count(*) from citation join paper on citation.paper_id = paper.paper_id where paper.paper_id = 'D12-1027'
select paper_id, count(*) from citation group by paper_id order by count(*) desc limit 1
select paper_id, count(*) from citation group by paper_id order by count(*) desc limit 1
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id order by count(*) desc limit 1
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id order by count(*) desc limit 1
select citation.cited_paper_id, count(*) from paper join citation on paper.paper_id = citation.paper_id group by citation.cited_paper_id order by count(*) desc limit 10
select paper.title, count(*) from paper join citation on paper.paper_id = citation.paper_id group by paper.paper_id order by count(*) desc limit 10
select count(*) from author join citation on author.author_id = citation.cited_paper_id join author on author.author_id = author.author_id where author.name = "Mckeown" and author.name = "Kathleen"
select count(*) from author join author_list on author.author_id = author_list.author_id join citation on author_list.paper_id = citation.cited_paper_id where author.name = "Mckeown" and author.name = "Kathleen"
select count(*) from author_list join citation on author_list.author_id = citation.cited_paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" and author.name = "Kathleen"
select count(*) from author join citation on author.author_id = citation.author_id where author.name = "Mckeown, Kathy"
select author.name, sum(citation.cited_paper_id) from author join author_list on author.author_id = author_list.author_id join citation on author.author_id = citation.cited_paper_id group by author.author_id order by sum(citation.cited_paper_id) desc limit 1
select author.name, sum(citation.cited_paper_id) from author join author_list on author.author_id = author_list.author_id join citation on author.author_id = citation.cited_paper_id group by author.author_id order by sum(citation.cited_paper_id) desc limit 1
select paper.venue, paper.year from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where author.name = "Mckeown" intersect select paper.venue, paper.year from author_list join paper on author_list.paper_id = paper.paper_id where author.name = "Kathleen"
select paper.venue, paper.year from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where author.name = "Mckeown" intersect select paper.venue, paper.year from author_list join paper on author_list.paper_id = paper.paper_id where author.name = "Kathleen"
select venue, year from paper where affiliation = "Columbia University"
select venue, year from paper where affiliation = "Columbia University"
select author.name from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where paper.year = 2009 group by author.name order by count(*) desc limit 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id where paper.year = 2009 group by author.name order by count(*) desc limit 1
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where paper.year = 2009 group by affiliation.affiliation_id order by count(*) desc limit 3
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where paper.year = 2009 group by affiliation.name order by count(*) desc limit 3
select count(*) from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "Columbia University" and paper.year <= 2009
select count(*) from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "Columbia University" and paper.year < 2009
select count(*) from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "stanford university" and paper.year >= 2000 and paper.year <= 2009
select count(*) from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.name = "stanford university" and paper.year >= 2000 and paper.year <= 2009
select paper.title from author_list join paper on author_list.paper_id = paper.paper_id group by author_list.paper_id order by count(*) desc limit 1
select paper.title from author_list join paper on author_list.paper_id = paper.paper_id group by author_list.paper_id order by count(*) desc limit 1
select count(*) from author_list join author on author_list.author_id = author.author_id where author.name = "Mckeown" and author.name = "Kathleen"
select count(distinct author_list.author_id) from author_list join author on author_list.author_id = author.author_id where author.name = "Mckeown, Kathy"
select author.name from author_list join author on author_list.author_id = author.author_id join paper on paper.paper_id = author_list.paper_id join author on author_list.author_id = author.author_id where author.name = "Mckeown" and author.name = "Kathleen" group by author.name order by count(*) desc limit 1
select author.name from author join author_list on author.author_id = author_list.author_id join paper on paper.paper_id = author_list.paper_id join mckeown on author_list.author_id = mckeown.author_id where author.name = "Kathleen" group by author.name order by count(*) desc limit 1
select paper_id from paper where title like "%translation%"
select paper_id from paper where title like "%translation%"
select paper_id, title from paper where paper_id not in (select paper_id from citation)
select paper_id, title from paper where paper_id not in (select paper_id from citation)
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.address like "%china%" group by affiliation.name order by count(*) desc limit 1
select affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id where affiliation.address like "%china%" group by affiliation.name order by count(*) desc limit 1
select count(*), year from paper group by year
select venue, count(*) from paper group by venue, year
select count(*), affiliation.name from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id group by affiliation.name
select affiliation.name, count(*) from affiliation join paper on affiliation.affiliation_id = paper.affiliation_id group by affiliation.affiliation_id
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id having count(*) > 50
select paper.title from paper join citation on paper.paper_id = citation.paper_id group by citation.paper_id having count(*) > 50
select count(*) from author where author_id not in ( select paper_id from citation group by paper_id having count(*) > 50 )
select count(*) from author where author_id not in ( select paper_id from citation group by paper_id having count(*) > 50 )
select author.name from affiliation join author_list on affiliation.affiliation_id = author_list.affiliation_id join paper on paper.paper_id = author_list.paper_id where affiliation.name = "Naacl" and affiliation.name = "ACL" and paper.year = 2009
select author.name from paper join author_list on paper.paper_id = author_list.paper_id join venue on venue.paper_id = paper.paper_id where paper.year = 2009 and venue.venue = "Naacl" intersect select author.name from author_list join venue on author_list.paper_id = venue.paper_id join paper on paper.paper_id = venue.paper_id where paper.year = 2009 and venue.venue = "ACL"
select name from author where author_id not in (select author_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = "ACL")
select name from author where author_id not in (select author_id from author_list join affiliation on author_list.affiliation_id = affiliation.affiliation_id where affiliation.name = "ACL")
select count(*) from conference
select count(*) from conference
select distinct conference_name from conference
select distinct conference_name from conference
select conference_name, year, location from conference
select conference_name, year, location from conference
select conference_name, count(*) from conference_participation group by conference_participation.conference_id
select conference_name, count(*) from conference group by conference_name
select year, count(*) from conference group by year
select count(*), year from conference group by year
select year from conference group by year order by count(*) asc limit 1
select year from conference group by year order by count(*) limit 1
select location from conference group by location having count(*) >= 2
select location from conference group by location having count(*) >= 2
select institution_name, location, founded from institution
select institution_name, location, founded from institution
select count(*) from institution where founded between 1850 and 1900
select count(*) from institution where founded between 1850 and 1900
select institution_name, location from institution order by founded desc limit 1
select institution_name, location from institution order by founded desc limit 1
select institution.institution_name, count(*) from institution join staff on institution.institution_id = staff.institution_id where institution.founded > 1800 group by staff.institution_id
select staff.name, count(*), institution.institution_id from institution join staff on institution.institution_id = staff.institution_id where institution.founded > 1800 group by institution.institution_id
select institution_name from institution where institution_id not in (select institution_id from staff)
select institution_name from institution where institution_id not in (select institution_id from staff)
select name from staff where age > (select avg(age) from staff)
select name from staff where age > (select avg(age) from staff)
select max(age), min(age) from staff where nationality = "United States"
select max(age), min(age) from staff
select conference.conference_name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where staff.nationality = "Canada"
select conference.conference_name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where staff.nationality = "Canada"
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id where conference_participation.role ='speaker' intersect select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id where conference_participation.conference_id doubles as conference_participation.conference_id
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference_participation.conference_id where conference_participation.conference_name = "ACL" intersect select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference_participation.conference_id where conference_participation.conference_name = "NACCL"
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = "ACL" intersect select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference_participation.conference_id where conference.conference_name = "NACCL"
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year = 2003 or conference.year = 2004
select staff.name from staff join conference_participation on staff.staff_id = conference_participation.staff_id join conference on conference_participation.conference_id = conference.conference_id where conference.year >= 2003 or conference.year <= 2004
select conference.conference_name, conference.year, count(*) from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference.conference_id
select conference.conference_name, conference.year, count(*) from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference.conference_id
select conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference_participation.conference_id order by count(*) desc limit 2
select conference.conference_name from conference_participation join conference on conference_participation.conference_id = conference.conference_id group by conference.conference_name order by count(*) desc limit 2
select name, nationality from staff where staff_id not in (select staff_id from conference_participation where conference_name = "ACL")
select name, nationality from staff where staff_id not in (select staff_id from conference_participation join conference on conference_participation.conference_id = conference.conference_id where conference.conference_name = "ACL")
select institution_name, location from institution except select institution.institution_name, institution.location from institution join conference_participation on institution.institution_id = conference_participation.institution_id join staff on conference_participation.staff_id = staff.staff_id where conference.year = 2004
select institution_name, location from institution except select institution.institution_name, institution.location from institution join conference_participation on institution.institution_id = conference_participation.institution_id join staff on conference_participation.staff_id = staff.staff_id where conference.year = 2004
select pilot_name from pilotskills order by age desc limit 1
select pilot_name from pilotskills order by age desc limit 1
select pilot_name from pilotskills where age < (select avg(age) from pilotskills) order by age
select pilot_name from pilotskills where age < (select avg(age) from pilotskills) order by age asc
select * from pilotskills where age < 30
select * from pilotskills where age < 30
select pilotskills.pilot_name from pilotskills join plane on pilotskills.plane_name = plane.plane_name join pilotskills on pilotskills.pilot_name = pilotskills.pilot_name where pilotskills.age < 35
select pilot_name from pilotskills where age < 35 and plane_name = "Piper Cub"
select hangar.location from hangar join plane on hangar.plane_name = plane.plane_name where plane.plane_name = 'F-14 fighter'
select location from hangar where plane_name = 'F-14 fighter'
select count(distinct location) from hangar
select count(distinct location) from hangar
select plane_name from pilotskills where age = 32
select plane_name from pilotskills where pilot_name = "Jonathan" and age = 32
select count(*) from pilotskills where age > 40
select count(*) from pilotskills where age > 40
select count(*) from pilotskills join plane_name on pilotskills.plane_name = 'B-52 bomber' and pilotskills.pilot_name < 35
select count(*) from pilotskills join plane_name on pilotskills.plane_name = 'B-52' and pilotskills.age < 35
select pilot_name from pilotskills where plane_name = "Piper Cub" order by age limit 1
select pilot_name from pilotskills where plane_name = "Piper Cub" order by age limit 1
select plane_name from pilotskills group by plane_name order by count(*) desc limit 1
select plane_name from pilotskills group by plane_name order by count(*) desc limit 1
select plane_name from pilotskills group by plane_name order by count(*) limit 1
select plane_name from pilotskills group by plane_name order by count(*) limit 1
select count(*) from pilotskills where plane_name like "%chicago%"
select count(*) from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Chicago"
select plane_name from pilotskills where age = 41
select plane_name from pilotskills where pilot_name = "Smith" and age = 41
select count(distinct plane_name) from pilotskills
select count(distinct plane_name) from pilotskills
select count(*) from pilotskills where pilot_name = "Smith"
select count(*) from pilotskills where pilot_name = "Smith"
select count(*) from pilotskills where age > 40
select count(*) from pilotskills where age > 40
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills where age between 30 and 40 order by age asc
select pilot_name from pilotskills order by age desc
select pilot_name from pilotskills order by age desc
select location from hangar order by plane_name
select location from hangar order by plane_name
select distinct plane_name from pilotskills order by plane_name
select distinct plane_name from pilotskills order by plane_name
select count(*) from pilotskills where age > 40 or age < 30
select count(*) from pilotskills where age > 40 or age < 30
select pilotskills.pilot_name, pilotskills.age from pilotskills join plane on pilotskills.plane_name = plane.plane_name where pilotskills.age > 35 or pilotskills.plane_name = "piper cub" or pilotskills.plane_name = "f-14 fighter" and pilotskills.age < 30
select pilotskills.pilot_name, pilotskills.age from pilotskills join plane_name on pilotskills.plane_name = plane.plane_name join pilotskills on pilotskills.pilot_name = pilotskills.pilot_name where pilotskills.plane_name = "Piper Cub" and pilotskills.age < 30 or pilotskills.plane_name = "F-14 Fighter"
select pilotskills.pilot_name from pilotskills join plane on pilotskills.plane_name = plane.plane_name where plane.plane_name = "piper cub" except select pilotskills.pilot_name from pilotskills join plane on pilotskills.plane_name = plane.plane_name where plane.plane_name = "b-52 bomber"
select pilotskills.pilot_name from pilotskills join plane_name on pilotskills.plane_name = plane_name of pilotskills.plane_name where pilotskills.plane_name = "piper cub" except select pilotskills.pilot_name from pilotskills join plane_name on pilotskills.plane_name = plane_name of pilotskills.plane_name where pilotskills.plane_name = "b-52"
select pilotskills.pilot_name from pilotskills join planeskills on pilotskills.plane_name = planeskills.plane_name join hangar on pilotskills.hangar = hangar.plane_name where planeskills.plane_name = "Piper Cub" intersect select pilotskills.pilot_name from pilotskills join planeskills on pilotskills.plane_name = planeskillskillskills.plan_name = "B-52 Bomber"
select pilotskills.pilot_name from pilotskills join plane_name on pilotskills.plane_name = plane_name join bomber on pilotskills.plane_name = bomber.plane_name where bomber.plane_name = "piper cub" intersect select pilotskills.pilot_name from pilotskills join bomber on pilotskills.plane_name = bomber.plane_name where bomber.plane_name = "b-52"
select avg(age), min(age) from pilotskills
select avg(age), min(age) from pilotskills
select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Austin" intersect select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Boston"
select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Austin" intersect select pilotskills.pilot_name from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Boston"
select pilotskills.pilot_name from pilotskills join planeskills on pilotskills.plane_name = planeskills.plane_name where planeskills.plane_name = "piper cub" or planeskills.plane_name = "f - 14 fighter"
select pilotskills.pilot_name from pilotskills join plane_name on pilotskills.plane_name = plane_name of pilotskills.plane_name where plane_name = "Piper Cub" or plane_name = "F-14 Fighter"
select avg(age), plane_name from pilotskills group by plane_name
select plane_name, avg(age) from pilotskills group by plane_name
select count(*), plane_name from pilotskills group by plane_name
select count(*), plane_name from pilotskills group by plane_name
select pilot_name, plane_name, max(age) from pilotskills group by plane_name order by plane_name
select plane_name, pilot_name from pilotskills order by plane_name
select pilot_name, plane_name, max(age) from pilotskills group by plane_name
select plane_name, pilot_name from pilotskills order by age desc limit 1
select max(age), pilotskills.pilot_name from pilotskills join pilotskills on pilotskills.pilot_name = pilotskills.pilot_name group by pilotskills.pilot_name
select pilot_name, max(age) from pilotskills group by pilot_name
select count(*), avg(age), hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name group by hangar.location
select count(*), avg(pilotskills.age), hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name group by hangar.location
select count(*), plane_name from pilotskills group by plane_name having avg(age) < 35
select plane_name, count(*) from pilotskills group by plane_name having avg(age) < 35
select hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name order by pilotskills.age limit 1
select hangar.location from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name order by pilotskills.age limit 1
select pilotskills.pilot_name, pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Austin"
select pilotskills.pilot_name, pilotskills.age from pilotskills join hangar on pilotskills.plane_name = hangar.plane_name where hangar.location = "Austin"
select pilot_name from pilotskills where age > (select min(age) from pilotskills where plane_name = "piper cub") order by pilot_name
select pilot_name from pilotskills where age > (select max(age) from pilotskills where plane_name = "Piper Cub") order by pilot_name
select count(*) from pilotskills where age < (select min(age) from pilotskills where plane_name = 'F-14 fighter')
select count(*) from pilotskills where age < (select min(age) from pilotskills where plane_name = 'F-14')
select distinct plane_name from pilotskills where plane_name like "%bomber%"
select distinct plane_name from pilotskills where plane_name like "%bomber%"
select count(*) from pilotskills where age > (select min(age) from pilotskills where plane_name = "piper cub")
select count(*) from pilotskills where age > (select min(age) from pilotskills where plane_name = "piper cub")
select name from district order by area_km desc limit 1
select area_km, government_website from district order by population asc limit 1
select name, population from district where area_km > (select avg(area_km) from district)
select max(area_km), avg(area_km) from district
select sum(population) from district order by area_km desc limit 3
select district_id, name, government_website from district order by population
select name from district where government_website like "%gov%"
select district_id, name from district where population > 4000 or area_km > 3000
select name, speach_title from spokesman
select avg(points), avg(age) from spokesman where rank_position = 1
select name, points from spokesman where age < 40
select name from spokesman order by age desc limit 1
select spokesman_id from spokesman where points < (select avg(points) from spokesman)
select district.name from spokesman_district join district on spokesman_district.district_id = district.district_id group by district.district_id order by count(*) desc limit 1
select spokesman.name from spokesman join spokesman_district on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman_district.start_year < 2004
select count(*), district.name from district join spokesman_district on district.district_id = spokesman_district.district_id group by district.district_id
select district.name from district join spokesman_district on district.district_id = spokesman_district.district_id join spokesman on spokesman_district.spokesman_id = spokesman.spokesman_id where spokesman.rank_position = 1 intersect select district.name from district join spokesman_district on district.district_id = spokesman_district.district_id where spokesman.rank_position = 2
select district.name from district join spokesman_district on district.district_id = spokesman_district.district_id group by district.district_id having count(*) > 1
select count(*) from district where district_id not in (select district_id from spokesman_district)
select name from spokesman where spokesman_id not in (select spokesman_id from spokesman_district)
select sum(district.population), avg(district.population) from district join spokesman_district on district.district_id = spokesman_district.district_id
select title from sculptures order by year desc limit 1
select title from sculptures order by year desc limit 1
select title, location from paintings order by year desc limit 1
select title, location from paintings order by year desc limit 1
select title from sculptures where location = "226"
select title from sculptures where location = "226"
select title, location from paintings
select title, location from paintings
select title, location from sculptures
select title, location from sculptures
select medium from paintings where paintingid = 80
select medium from paintings where paintingid = 80
select fname, lname from artists where birthyear > 1850
select fname, lname from artists where birthyear > 1850
select title, year from sculptures where location!= "Gallery 226-226"
select title, year from sculptures where location!= 226
select distinct artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.artistid where sculptures.year < 1900
select distinct artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year < 1900
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.year > 1920
select distinct artists.birthyear from artists join sculptures on artists.artistid = sculptures.artistid where sculptures.year > 1920
select fname, lname from artists order by deathyear desc limit 1
select fname, lname from artists order by deathyear desc limit 1
select birthyear from artists order by deathyear asc limit 1
select birthyear from artists order by deathyear asc limit 1
select fname, birthyear from artists order by deathyear desc limit 1
select fname, deathyear from artists order by deathyear desc limit 1
select count(*) from paintings where location = 240
select count(*) from paintings where location = 240
select count(*) from artists join paintings on artists.artistid = paintings.artistid where artists.deathyear = (select max(deathyear) from artists)
select count(*) from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid order by artists.deathyear desc limit 1
select paintings.title, paintings.year from artists join paintings on artists.artistid = paintings.artistid where artists.fname = "Mary"
select paintings.title, paintings.year from artists join paintings on artists.artistid = paintings.artistid where artists.fname = "Mary"
select paintings.width_mm from artists join paintings on artists.artistid = paintings.artistid where artists.birthyear < 1850
select width_mm from paintings join artists on paintings.artistid = artists.artistid where artists.birthyear < 1850
select paintings.location, paintings.medium from artists join paintings on artists.artistid = paintings.artistid where artists.fname = "Pablo"
select paintings.location, paintings.medium, paintings.mediumon from artists join paintings on artists.artistid = paintings.artistid where artists.fname = "Pablo"
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid intersect select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid intersect select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "oil" intersect select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "lithographic"
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "oil" intersect select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "lithographic"
select artists.birthyear from artists join paintings on artists.artistid = paintings.artistid where paintings.year = 1884 and paintings.medium = "canvas"
select artists.birthyear from artists join paintings on artists.artistid = paintings.artistid where paintings.year = 1884
select distinct artists.fname from artists join paintings on artists.artistid = paintings.artistid where paintings.mediumon = "oil" and paintings.location = "241"
select artists.fname from artists join paintings on artists.artistid = paintings.artistid where paintings.location = 241 and paintings.medium = "oil"
select mediumon, count(*) from paintings group by mediumon
select medium, count(*) from paintings group by medium
select medium, avg(height_mm) from paintings group by medium
select medium, avg(height_mm) from paintings group by medium
select count(*), location from paintings where year < 1900 group by location
select count(*), location from paintings where year < 1900 group by location
select title from paintings where medium = "oil" and year > 1910
select title from paintings where mediumon > 1910
select distinct painterid from paintings where mediumon = "oil" and location = 240
select distinct painterid from paintings where medium = "oil" and location = 240
select distinct title from paintings where height_mm > (select min(height_mm) from paintings)
select distinct title from paintings where height_mm > (select min(height_mm) from paintings)
select distinct paintingid from paintings where year > (select min(year) from paintings where location = 240)
select distinct paintingid from paintings where year > (select min(year) from paintings where location = 240)
select paintingid from paintings order by year desc limit 1
select paintingid from paintings order by year desc limit 1
select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like "%female%"
select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid where sculptures.title like '%female%'
select distinct title from paintings order by title
select distinct title from paintings order by title
select distinct title from paintings order by width_mm
select distinct title from paintings order by height_mm desc
select title from paintings union select title from sculptures where year between 1900 and 1950
select title from paintings union select title from sculptures where year between 1900 and 1950
select paintings.title, sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid join artists on artists.artistid = artists.artistid where artist.artistid = 222
select paintings.title, sculptures.title from paintings join sculptures on paintings.paintingid = sculptures.sculptorid join artists on artists.artistid = artists.artistid where artist.artistid = 222
select artistid from paintings where year < 1900 group by artistid order by count(*) desc limit 1
select artistid from paintings where year < 1900 group by artistid order by count(*) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count(*) desc limit 1
select artists.fname from artists join sculptures on artists.artistid = sculptures.sculptorid group by artists.artistid order by count(*) desc limit 1
select title from paintings where width_mm < 600 or height_mm > 800
select title from paintings where width_mm < 600 or height_mm > 800
select location from paintings where year < 1885 or year > 1930
select location from paintings where year < 1885 or year > 1930
select paintingid from paintings where height_mm > 500 intersect select paintingid from paintings where width_mm < 2000
select paintingid from paintings where height_mm > 500 intersect select paintingid from paintings where width_mm < 2000
select location from paintings where mediumon = "porch" intersect select location from paintings where mediumon = "canvas"
select location from paintings where mediumon = "panel" intersect select location from paintings where mediumon = "canvas"
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select location from paintings where year < 1885 intersect select location from paintings where year > 1930
select avg(height_mm), avg(width_mm) from paintings where medium = "oil" and location = "241"
select avg(height_mm), avg(width_mm) from paintings where medium = "oil" and location = 241
select max(height_mm), paintingid from paintings where year < 1900
select height_mm, paintingid from paintings where year < 1900 order by height_mm desc limit 1
select max(height_mm), max(width_mm), year from paintings group by year
select max(height_mm), max(width_mm), year from paintings group by year
select avg(height_mm), avg(width_mm), artists.fname from paintings join artists on paintings.artistid = artists.artistid group by artists.artistid order by artists.fname
select avg(height_mm), avg(width_mm), artists.fname from paintings join artists on paintings.artistid = artists.artistid group by artists.artistid order by artists.fname
select artists.fname, count(*) from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) >= 2
select artists.fname, count(*) from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) >= 2
select artists.deathyear from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) <= 3
select artists.deathyear from artists join paintings on artists.artistid = paintings.artistid group by artists.artistid having count(*) < 4
select artists.deathyear from artists join sculptures on artists.artistid = sculptures.artistid group by artists.artistid order by count(*) limit 1
select artists.deathyear from artists join sculptures on artists.artistid = sculptures.artistid group by artists.artistid order by count(*) limit 1
select paintingid, height_mm from paintings where width_mm = 240 order by width_mm desc limit 1
select height_mm, paintingid from paintings where width_mm = (select max(width_mm) from paintings where medium = 240)
select paintingid from paintings where year < (select min(year) from paintings where location = 240)
select paintingid from paintings where year < (select min(year) from paintings where location = 240)
select paintingid from paintings where height_mm > (select max(height_mm) from paintings where year > 1900)
select paintingid from paintings where height_mm > (select max(height_mm) from paintings where year > 1900)
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "oil" group by artists.artistid order by count(*) desc limit 3
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid where paintings.medium = "oil" group by artists.artistid order by count(*) desc limit 1
select paintingid, location, title from paintings where medium = "oil" order by year
select paintingid, location, title from paintings order by year asc
select year, location, title from paintings where height_mm > 1000 order by title
select year, location, title from paintings where height_mm > 1000 order by title
select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid except select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.sculptorid
select artists.fname, artists.lname from artists join sculptures on artists.artistid = sculptures.artistid except select artists.fname, artists.lname from artists join paintings on artists.artistid = paintings.artistid
select location from paintings where year < 1885 except select location from paintings where mediumon = "canvas"
select location from paintings where year < 1885 except select location from paintings where mediumon = "canvas"
select count(*) from race
select count(*) from race
select winning_driver, winning_team from race order by winning_team asc
select winning_driver, winning_team from race order by winning_team
select winning_driver from race where pole_position!= "junior strous"
select winning_driver from race where pole_position!= "junior strous"
select constructor from driver order by age asc
select constructor from driver order by age asc
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
select driver.driver_name, count(*) from driver join race on driver.driver_id = race.driver_id group by race.driver_id
select driver.driver_name, count(*) from driver join race on driver.driver_id = race.driver_id group by driver.driver_id
select driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id order by count(*) desc limit 1
select driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id order by count(*) desc limit 1
select driver.driver_name, driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id having count(*) >= 2
select driver.driver_name, driver.age from driver join race on driver.driver_id = race.driver_id group by race.driver_id having count(*) >= 2
select race.race_name from driver join race on driver.driver_id = race.driver_id where driver.age >= 26
select race.race_name from driver join race on driver.driver_id = race.driver_id where driver.age >= 26
select driver_name from driver where constructor!= "Bugatti"
select driver_name from driver where constructor!= "Bugatti"
select constructor, count(*) from driver group by constructor
select constructor, count(*) from driver group by constructor
select engine from driver group by engine order by count(*) desc limit 1
select engine from driver group by engine order by count(*) desc limit 1
select engine from driver group by engine having count(*) >= 2
select engine from driver group by engine having count(*) >= 2
select driver_name from driver where driver_id not in (select driver_id from race)
select driver_name from driver where driver_id not in (select driver_id from race)
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select constructor from driver where age < 20 intersect select constructor from driver where age > 30
select winning_team from race group by winning_team having count(*) > 1
select winning_team from race group by winning_team having count(*) > 1
select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = "James Hinchcliffe" intersect select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = "Carl Skerlong"
select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = "James Hinchcliffe" intersect select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = "Carl Skerlong"
select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position!= "James Hinchcliffe"
select driver_name from driver except select driver.driver_name from driver join race on driver.driver_id = race.driver_id where race.pole_position = "James Hinchcliffe"
select count(*) from languages
select count(*) from languages
select name from languages order by name asc
select name from languages order by name
select name from languages where name like "%ish%"
select name from languages where name like "%ish%"
select name from countries order by overall_score desc
select name from countries order by overall_score desc
select avg(justice_score) from countries
select avg(justice_score) from countries
select max(health_score), min(health_score) from countries where name!= "Norway"
select max(health_score), min(health_score) from countries where name!= "Norway"
select count(distinct language_id) from official_languages
select count(distinct language_id) from official_languages
select name from countries order by education_score desc
select name from countries order by education_score desc
select name from countries order by politics_score desc limit 1
select name from countries order by politics_score desc limit 1
select countries.name, languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id
select countries.name, languages.name from countries join official_languages on countries.id = official_languages.country_id join languages on official_languages.language_id = languages.id
select languages.name, count(*) from languages join official_languages on languages.id = official_languages.language_id group by languages.id
select languages.name, count(*) from languages join official_languages on languages.id = official_languages.language_id group by official_languages.language_id
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count(*) desc limit 1
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count(*) desc limit 1
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id having count(*) >= 2
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id having count(*) >= 2
select avg(countrys.overall_score) from official_languages join countries on official_languages.country_id = countries.id where official_languages.language_id = "english"
select avg(countrys.overall_score) from countries join official_languages on countries.id = official_languages.country_id where official_languages.language_id = "english"
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count(*) desc limit 3
select languages.name from official_languages join languages on official_languages.language_id = languages.id group by official_languages.language_id order by count(*) desc limit 3
select languages.name from languages join official_languages on languages.id = official_languages.language_id join countries on official_languages.country_id = countries.id order by countries.overall_score desc
select languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id group by countries.id order by avg(countrys.overall_score) desc
select countries.name from countries join official_languages on countries.id = official_languages.country_id group by countries.id order by count(*) desc limit 1
select country_id from official_languages group by country_id order by count(*) desc limit 1
select name from languages where id not in (select language_id from official_languages)
select name from languages where id not in (select language_id from official_languages)
select name from countries where id not in (select country_id from official_languages)
select name from countries where id not in (select country_id from official_languages)
select languages.name from official_languages join languages on official_languages.language_id = languages.id join countries on official_languages.country_id = countries.id where countries.overall_score > 95 intersect select languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id where countries.overall_score < 90
select languages.name from official_languages join languages on official_languages.language_id = languages.id join countries on official_languages.country_id = countries.id where countries.overall_score > 95 intersect select languages.name from official_languages join countries on official_languages.country_id = countries.id join languages on official_languages.language_id = languages.id where countries.overall_score < 90
select country, town_city from addresses
select country, town_city from addresses
select addresses.county_state_province from addresses join properties on addresses.address_id = properties.property_address_id
select addresses.county_state_province from addresses join properties on addresses.address_id = properties.property_address_id
select property_features.property_feature_description from property_features join features on property_features.feature_id = features.feature_id where features.feature_description like "%roof%"
select feature_description from features where feature_name = "roof"
select features.feature_name, features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by features.feature_id order by count(*) desc limit 1
select features.feature_name, features.feature_description from features join property_features on features.feature_id = property_features.feature_id group by features.feature_id order by count(*) desc limit 1
select min(room_count) from rooms
select min(room_count) from properties
select count(*) from properties where parking_lots = 1 or garage_yn = 1
select count(*) from properties where parking_lots = 1 or garage_yn = 1
select ref_age_categories.age_category_description from ref_age_categories join users on ref_age_categories.age_category_code = users.age_category_code where users.user_name like "%mother%"
select ref_age_categories.age_category_description from ref_age_categories join users on ref_age_categories.age_category_code = users.age_category_code where ref_user_categories.user_category_description like '%mother%'
select users.first_name from users join properties on users.user_id = properties.owner_user_id group by users.user_id order by count(*) desc limit 1
select users.first_name from users join properties on users.user_id = properties.owner_user_id group by users.user_id order by count(*) desc limit 1
select avg(room_count) from properties where property_type_code = "garden"
select avg(room_count) from properties join property_features on properties.property_id = property_features.property_id where property_features.feature_name = "garden"
select addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id where properties.property_name like "pool"
select addresses.town_city from addresses join properties on addresses.address_id = properties.property_address_id where properties.property_name like "pool"
select property_id, vendor_requested_price from properties order by vendor_requested_price limit 1
select property_id, vendor_requested_price from properties order by vendor_requested_price limit 1
select avg(room_count) from rooms
select avg(room_count) from rooms
select count(distinct room_size) from rooms
select count(distinct room_size) from rooms
select user_searches.user_id, search.search_string from user_searches join search on user_searches.user_id = search.user_id group by user_searches.user_id having count(*) >= 2
select user_searches.user_id, user_searches.search_seq from user_searches join users on user_searches.user_id = users.user_id group by user_searches.user_id having count(*) >= 2
select max(search_datetime) from user_searches
select search_datetime from user_searches order by search_datetime desc limit 1
select search_datetime, search_string from user_searches order by search_string desc
select search_string, search_datetime from user_searches order by search_string desc
select addresses.zip_postcode from addresses join properties on addresses.address_id = properties.address_id except select addresses.zip_postcode from addresses join properties on addresses.address_id = properties.address_id where properties.owner_user_id = 2
select addresses.zip_postcode from addresses join properties on addresses.address_id = properties.address_id except select addresses.zip_postcode from addresses join properties on addresses.address_id = properties.address_id where properties.owner_user_id group by addresses.zip_postcode having count(*) <= 2
select user_category_code, user_id from user_searches group by user_id having count(*) = 1
select users.user_id, users.user_category_code from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) = 1
select ref_age_categories.age_category_description from ref_age_categories join users on ref_age_categories.age_category_code = users.age_category_code where users.user_id = (select user_id from user_searches order by search_datetime asc limit 1)
select users.age_category_code from users join user_searches on users.user_id = user_searches.user_id order by user_searches.search_datetime limit 1
select login_name from users where age_category_code = "Senior" order by first_name
select login_name from users where age_category_code = "age" order by first_name
select count(*) from users join user_searches on users.user_id = user_searches.user_id group by users.user_id
select count(*) from users join user_searches on users.user_id = user_searches.user_id where users.is_buyer = 1
select date_registered from users where login_name = "ratione"
select date_registered from users where login_name = "ratione"
select first_name, middle_name, last_name, login_name from users where is_seller = 1
select first_name, middle_name, last_name, login_name from users where is_seller = 1
select line_1_number_building, line_2_number_street, town_city from addresses where age_category_code = "Senior"
select addresses.line_1_number_building, addresses.line_2_number_street, addresses.town_city from addresses join users on addresses.address_id = users.user_address_id where users.age_category_code = "senior citizens"
select count(*) from properties join property_features on properties.property_id = property_features.property_id group by properties.property_id having count(*) >= 2
select count(*) from property_features group by property_id having count(*) >= 2
select property_photos.property_id, count(*) from property_photos join properties on property_photos.property_id = properties.property_id group by property_photos.property_id
select count(*), property_photos.property_id from property_photos join properties on property_photos.property_id = properties.property_id group by property_photos.property_id
select user_property_history.user_id, count(*) from user_property_history join properties on user_property_history.property_id = properties.property_id group by user_property_history.user_id
select count(distinct owner_user_id) from property_photos
select sum(price_max) from properties join users on properties.owner_user_id = users.user_id where users.first_name = "single mom" or users.last_name = "student"
select sum(price_max) from properties join users on properties.owner_user_id = users.user_id where users.first_name = "single mom" or users.last_name = "student"
select user_property_history.datestamp, properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp
select user_property_history.datestamp, properties.property_name from user_property_history join properties on user_property_history.property_id = properties.property_id order by user_property_history.datestamp
select ref_property_types.property_type_description, properties.property_type_code from ref_property_types join properties on ref_property_types.property_type_code = properties.property_type_code group by properties.property_type_code order by count(*) desc limit 1
select ref_property_types.property_type_description, properties.property_type_code from properties join ref_property_types on properties.property_type_code = ref_property_types.property_type_code group by properties.property_type_code order by count(*) desc limit 1
select age_category_description from ref_age_categories where age_category_code = "over 60"
select age_category_description from ref_age_categories where age_category_code = "over 60"
select room_size, count(*) from rooms group by room_size
select room_size, count(*) from rooms group by room_size
select addresses.country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = "Robbie"
select addresses.country from users join addresses on users.user_address_id = addresses.address_id where users.first_name = "Robbie"
select users.first_name, users.middle_name, users.last_name from users join properties on users.user_id = properties.owner_user_id
select users.first_name, users.last_name from users join user_property_history on users.user_id = user_property_history.user_id join properties on user_property_history.property_id = properties.property_id
select * from user_searches where user_id not in (select user_id from user_property_history)
select search_string from user_searches where user_id not in (select user_id from user_property_history)
select users.last_name, users.user_id from users join properties on users.user_id = properties.owner_user_id group by users.user_id having count(*) >= 2 intersect select users.last_name, users.user_id from users join user_searches on users.user_id = user_searches.user_id group by users.user_id having count(*) <= 2
select users.last_name, users.user_id from users join user_property_history on users.user_id = user_property_history.user_id group by users.user_id having count(*) <= 2 intersect select users.last_name, users.user_id from users join user_property_history on users.user_id = user_property_history.user_id group by users.user_id having count(*) >= 2
select count(*) from bike where weight > 780
select product_name, weight from bike order by price asc
select heat, name, nation from cyclist
select max(weight), min(weight) from bike
select avg(price) from bike where material = "carbon cc"
select name, result from cyclist where nation!= 'Russia'
select distinct bike.id, bike.product_name from bike join cyclists_own_bikes on bike.id = cyclists_own_bikes.bike_id where cyclists_own_bikes.purchase_year > 2015
select bike.id, bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id group by bike.id having count(*) >= 4
select cyclist.id, cyclist.name from cyclist join cyclists_own_bikes on cyclist.id = cyclists_own_bikes.cyclist_id group by cyclist.id order by count(*) desc limit 1
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.nation = "Russia" or cyclist.nation = "Great Britain"
select count(distinct heat) from cyclist
select count(*) from cyclist where id not in ( select cyclist_id from cyclists_own_bikes where purchase_year > 2015 )
select distinct bike.product_name from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.result > "4:21.558"
select bike.product_name, bike.price from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join cyclist on cyclists_own_bikes.cyclist_id = cyclist.id where cyclist.name = "Bradley Wiggins" intersect select bike.product_name, bike.price from cyclists_own_bikes join bike on cyclists_own_bikes.bike_id = bike.id join bike on cyclists_own_bikes.bike_id = bike.id where cyclist.name = "Antonio Tauler"
select name, nation, result from cyclist where id not in (select cyclist_id from cyclists_own_bikes)
select product_name from bike where material like "%fiber%"
select cyclists_own_bikes.cyclist_id, count(*) from cyclists_own_bikes join cyclists on cyclists_own_bikes.cyclist_id = cyclist.id group by cyclist.id order by cyclist.id
select flavor, price from goods order by price desc limit 1
select id, flavor from goods order by price desc limit 1
select flavor, price from goods order by price limit 1
select id, flavor from goods order by price limit 1
select id from goods where flavor = "apple"
select id from goods where flavor = "apple"
select id from goods where price < 3
select id from goods where price < 3
select distinct receipts.customerid from receipts join goods on receipts.goods = goods.id where goods.flavor = "lemon"
select distinct receipts.customerid from receipts join goods on receipts.goods = goods.id where goods.flavor = "lemon"
select food, count(*) from receipts join goods on receipts.id = goods.id group by goods.food
select food, count(*) from goods group by food
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having count(*) >= 15
select customerid from receipts group by customerid having count(*) >= 15
select customers.lastname from customers join receipts on customers.id = receipts.customerid group by customers.id having count(*) > 10
select customers.lastname from customers join receipts on customers.id = receipts.customerid group by receipts.customerid having count(*) > 10
select count(distinct cake) from goods
select count(distinct flavor) from goods
select flavor from goods where food = "croissant"
select distinct flavor from goods where flavor = "croissant"
select distinct items.item from items join receipts on items.receipt = receipts.receiptnumber where receipts.customerid = 15
select distinct items.item from receipts join items on receipts.receiptnumber = items.receiptnumber where receipts.customerid = 15
select food, avg(price), max(price), min(price) from goods group by food
select avg(price), min(price), max(price) from goods group by food
select receiptnumber from items join receipts on items.receipt = receipts.receipt where items.food = "cookie" intersect select receiptnumber from items join receipts on items.receipt = receipts.receipt where items.food = "cake"
select receiptnumber from items join receipts on items.receipt = receipts.receipt where items.food = "cookies" intersect select receiptnumber from items join receipts on items.receipt = receipts.receipt where items.food = "cake"
select receipts.receiptnumber from receipts join items on receipts.item = items.receipt where items.food = "croissant" and customers.id = (select customers.id from customers join receipts on customers.id = receipts.customerid where customers.lastname = "Logan")
select receipts.receiptnumber from receipts join items on receipts.item = items.receipt join customers on receipts.customerid = customers.id where customers.lastname = "Logan" and items.food = "croissant"
select receipts.receiptnumber, receipts.date from items join receipts on items.receipt = receipts.receipt where items.price = (select max(price) from items)
select receipts.receiptnumber, receipts.date from receipts join items on receipts.item = items.receipt where items.price = (select max(price) from items)
select item from items group by item order by count(*) limit 1
select item from items group by item order by count(*) limit 1
select food, count(*) from goods group by food
select count(*), food from goods group by food
select food, avg(price) from goods group by food
select food, avg(price) from goods group by food
select id from goods where flavor = "apricot" and price < 5
select id from goods where flavor = "apricot" and price < 5
select flavor from goods where price > 10
select flavor from goods where price > 10
select distinct id, price from goods where price < (select avg(price) from goods)
select distinct id, price from goods where price < (select avg(price) from goods)
select distinct id from goods where price < (select max(price) from goods where flavor = "tart")
select distinct id from goods where price < (select max(price) from goods where flavor = "tart")
select distinct receipts.receiptnumber from receipts join goods on receipts.goods = goods.id where goods.price > 13
select distinct receipts.receiptnumber from receipts join goods on receipts.goods = goods.id where goods.price > 13
select receipts.date from receipts join goods on receipts.goods = goods.id where goods.price > 15
select receipts.date from receipts join goods on receipts.goods = goods.id where goods.price > 15
select * from goods where id like "%app%"
select id from goods where id like '%app%'
select price, id from goods where id like "%70%"
select id, price from goods where id like "%70%"
select lastname from customers order by lastname
select lastname from customers order by lastname
select id from goods order by id
select distinct id from goods order by id
select * from receipts join items on receipts.receipt = items.receipt where goods.flavor = "Apple Flavor Pie" or receipts.customerid = 12
select receiptnumber from items join receipts on items.receipt = receipts.receipt where items.flavor = "Apple Flavor Pie" union select receiptnumber from receipts join items on receipts.receipt = items.receipt where receipts.customerid = 12
select receiptnumber, date from receipts order by date desc limit 1
select receiptnumber, date from receipts order by date desc limit 1
select receipts.date from receipts join goods on receipts.id = goods.id where goods.price > 10 order by receipts.date limit 1
select receiptnumber from goods join receipts on goods.id = receipts.receipt where goods.price > 10 union select receiptnumber from receipts order by date limit 1
select id from goods where price between 3 and 7
select id from goods where price between 3 and 7
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid order by receipts.date asc limit 1
select avg(price) from goods where flavor = "blackberry" or flavor = "blueberry"
select avg(price) from goods where flavor = "blackberry" or flavor = "blueberry"
select min(price) from goods where flavor = "cheese"
select min(price) from goods where flavor = "cheese"
select max(price), min(price), avg(price), flavor from goods group by flavor order by flavor
select max(price), min(price), avg(price), flavor from goods group by flavor order by flavor
select min(price), max(price), food from goods group by food order by food
select min(price), max(price), food from goods order by food
select date from receipts group by date order by count(*) desc limit 3
select date from receipts group by date order by count(*) desc limit 3
select customers.firstname, customers.lastname, count(*) from customers join receipts on customers.id = receipts.customerid group by customers.id order by count(*) desc limit 1
select customerid, count(*) from receipts group by customerid order by count(*) desc limit 1
select date, count(distinct customerid) from receipts group by date
select date, count(*) from receipts group by date
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid join goods on receipts.goods = goods.id where goods.flavor = "apple flavor tart"
select customers.firstname, customers.lastname from customers join receipts on customers.id = receipts.customerid join goods on receipts.goods = goods.id where goods.flavor = "apple" and items.item = "tarts"
select id from goods where price < (select max(price) from goods)
select id from goods where price < (select max(price) from goods)
select id from goods where price > (select avg(price) from goods)
select id from goods where price > (select avg(price) from goods)
select id from goods where price > (select avg(price) from goods)
select id from goods where price > 2
select id, flavor, food from goods order by price
select id, flavor, food from goods order by price
select id, flavor from goods order by flavor
select id, flavor from goods order by flavor
select item from goods where flavor = "chocolate" except select items.item from items join receipts on items.receipt = receipts.receiptnumber join goods on receipts.goodid = goods.id where goods.flavor = "chocolate" group by items.item having count(*) > 10
select items.item from items join goods on items.id = goods.id where goods.flavor = "chocolate" group by items.item having count(*) <= 10
select flavor from goods where flavor = "crust" except select flavor from goods where flavor = "tart"
select flavor from goods where flavor!= "tart"
select goods.food from goods join items on goods.id = items.receipt group by goods.id order by count(*) desc limit 3
select item from items group by item order by count(*) desc limit 3
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum(receipts.price) > 150
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having sum(receipts.price) > 150
select customers.id from customers join receipts on customers.id = receipts.customerid group by customers.id having avg(goods.price) > 5
select customers.id, avg(goods.price) from customers join receipts on customers.id = receipts.customerid join goods on receipts.item = goods.id group by customers.id having avg(goods.price) > 5
select receipts.date from receipts join goods on receipts.receipt = goods.id group by receipts.date having sum(goods.price) > 100
select receipts.date from receipts join goods on receipts.receipt = goods.id group by receipts.date having sum(goods.price) > 100
select count(*) from driver
select count(*) from driver
select count(*), make from driver where points > 150 group by make
select make, count(*) from driver where points > 150 group by make
select make, avg(age) from driver group by make
select avg(age), make from driver group by make
select avg(laps) from driver where age < 20
select avg(laps) from driver where age < 20
select manager, sponsor from team order by car_owner
select manager, sponsor from team order by car_owner
select make from team group by make having count(*) > 1
select make from team group by make having count(*) > 1
select make from team where car_owner = "Buddy Arrington"
select make from team where car_owner = "Buddy Arrington"
select max(points), min(points) from driver
select max(points), min(points) from driver
select count(*) from driver where points < 150
select count(*) from driver where points < 150
select driver from driver order by age asc
select driver from driver order by age asc
select driver from driver order by points desc
select driver from driver order by points desc
select driver.driver, country.country from driver join country on driver.country = country.country_id
select driver.driver, country.country from driver join country on driver.country = country.country_id
select max(driver.points) from country join driver on country.country_id = driver.country where country.capital = "Dublin"
select max(driver.points) from country join driver on country.country_id = driver.country where country.capital = "Dublin"
select avg(driver.age) from country join driver on country.country_id = driver.country where country.official_native_language = "english"
select avg(driver.age) from country join driver on country.country_id = driver.country where country.official_native_language = "english"
select country.country from country join driver on country.country_id = driver.country where driver.points > 150
select country.country from country join driver on country.country_id = driver.country where driver.points > 150
select country.capital from country join driver on country.country_id = driver.country order by driver.points desc limit 1
select country.capital from country join driver on country.country_id = driver.country order by driver.points desc limit 1
select make, count(*) from driver group by make
select make, count(*) from driver group by make
select make from driver group by make order by count(*) desc limit 1
select make from driver group by make order by count(*) desc limit 1
select make from driver group by make having count(*) >= 3
select make from driver group by make having count(*) >= 3
select team from team where team_id not in (select team_id from team_driver)
select team from team where team_id not in (select team_id from team_driver)
select country.country from country join driver on country.country_id = driver.country where driver.make = "Dodge" intersect select country.country from country join driver on country.country_id = driver.country where driver.make = "Chrysler"
select country.country from country join driver on country.country_id = driver.country where driver.make = "Dodge" intersect select country.country from country join driver on country.country_id = driver.country where driver.make = "Chrysler"
select sum(points), avg(points) from driver
select sum(points), avg(points) from driver
select country from country where country_id not in (select country_id from driver)
select country from country where country_id not in (select country from driver)
select team.manager, team.sponsor from team join team_driver on team.team_id = team_driver.team_id group by team.team_id order by count(*) desc limit 1
select team.manager, team.sponsor from team join team_driver on team.team_id = team_driver.team_id group by team.team_id order by count(*) desc limit 1
select team.manager, team.car_owner from team join team_driver on team.team_id = team_driver.team_id group by team.team_id having count(*) >= 2
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
select affiliation from institution where city!= "Vancouver"
select affiliation from institution where city!= "Vancouver"
select stadium from institution order by capacity desc
select stadium from institution order by capacity desc
select stadium from institution order by enrollment desc limit 1
select stadium from institution order by enrollment desc limit 1
select name, nickname from institution
select institution.name, championship.nickname from institution join championship on institution.institution_id = championship.institution_id
select championship.nickname from institution join championship on institution.institution_id = championship.institution_id order by institution.enrollment limit 1
select championship.nickname from institution join championship on institution.institution_id = championship.institution_id order by institution.enrollment limit 1
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id order by championship.number_of_championships desc
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id order by championship.number_of_championships desc
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count(*) >= 1
select institution.name from institution join championship on institution.institution_id = championship.institution_id group by championship.institution_id having count(*) >= 1
select sum(championship.number_of_championships) from institution join championship on institution.institution_id = championship.institution_id where institution.affiliation = "Public"
select sum(championship.number_of_championships) from institution join championship on institution.institution_id = championship.institution_id where institution.affiliation = "Public"
select affiliation, count(*) from institution group by affiliation
select affiliation, count(*) from institution group by affiliation
select affiliation from institution group by affiliation order by count(*) desc limit 1
select affiliation from institution group by affiliation order by count(*) desc limit 1
select founded from institution group by founded having count(*) > 1
select founded, count(*) from institution group by founded having count(*) > 1
select nickname from institution order by capacity desc
select nickname from institution order by capacity desc
select sum(enrollment) from institution where city = "Vancouver" or city = "Calgary"
select enrollment from institution where city = "Vancouver" or city = "Calgary"
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select province from institution where founded < 1920 intersect select province from institution where founded > 1950
select count(distinct province) from institution
select count(distinct province) from institution
select * from warehouses
select * from warehouses
select distinct contents from boxes where warehouse = "new york city"
select distinct contents from boxes where warehouse = "new york city"
select contents from boxes where value > 150
select contents from boxes where value > 150
select warehouse, avg(value) from boxes group by warehouse
select avg(value), warehouse from boxes group by warehouse
select avg(value), sum(value) from boxes
select avg(value), sum(value) from boxes
select avg(capacity), sum(capacity) from warehouses
select avg(capacity), sum(capacity) from warehouses
select avg(value), max(value), contents from boxes group by contents
select contents, avg(value), max(value) from boxes group by contents
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
select boxes.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "Chicago" or warehouses.location = "New york City"
select code from boxes where warehouse = "Chicago" or warehouses = "New york City"
select sum(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "Chicago" or warehouses.location = "New york City"
select sum(value) from boxes where warehouse = "Chicago" or warehouse = "New york City"
select boxes.contents from warehouses join boxes on warehouses.code = boxes.code where warehouses.location = "Chicago" intersect select boxes.contents from warehouses join boxes on warehouses.code = boxes.code where warehouses.location = "New york City"
select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "Chicago" intersect select boxes.contents from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "New york City"
select distinct contents from boxes where warehouse not in (select warehouses.code from warehouses join boxes on warehouses.code = boxes.code where warehouses.location = "new york city")
select distinct contents from boxes where warehouse not in (select warehouses.code from warehouses join boxes on warehouses.code = boxes.code where warehouses.location = "new york city")
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "rocks" except select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "scissors"
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "rocks" except select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "scissors"
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "rocks" or boxes.contents = "scissors"
select distinct warehouse from boxes where contents = "rocks" or contents = "scissors"
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "rocks" intersect select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "scissors"
select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "rocks" intersect select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.contents = "scissors"
select code, contents from boxes order by value
select code, contents from boxes order by value
select code, contents from boxes order by value limit 1
select code, contents from boxes order by value asc limit 1
select distinct contents from boxes where value > (select avg(value) from boxes)
select distinct contents from boxes where value > (select avg(value) from boxes)
select distinct contents from boxes order by contents
select distinct contents from boxes order by contents
select code from boxes where value > (select max(value) from boxes where contents = "rocks")
select code from boxes where value > (select max(value) from boxes where contents = "rocks")
select code, contents from boxes where value > (select max(value) from boxes where contents = "scissors")
select code, contents from boxes where value > (select max(value) from boxes where contents like 'Scissor')
select sum(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.capacity = (select max(capacity) from warehouses)
select sum(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code order by warehouses.capacity desc limit 1
select warehouse, avg(value) from boxes group by warehouse having avg(value) > 150
select avg(boxes.value), warehouse from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.code having avg(boxes.value) > 150
select sum(value), count(*), contents from boxes group by contents
select contents, sum(value), count(*) from boxes group by contents
select sum(capacity), avg(capacity), max(capacity), location from warehouses group by location
select sum(capacity), avg(capacity), max(capacity) from warehouses group by location
select sum(capacity) from warehouses
select sum(capacity) from warehouses
select max(boxes.value), warehouses.location from boxes join warehouses on boxes.code = warehouses.code group by warehouses.location
select warehouses.location, max(boxes.value) from boxes join warehouses on boxes.warehouse = warehouses.code group by warehouses.location
select warehouse, count(*) from boxes group by warehouse
select warehouse, count(*) from boxes group by warehouse
select count(distinct location) from warehouses where rock = 'Rock'
select count(distinct warehouse) from boxes
select code, location from boxes
select boxes.code, warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code
select code from boxes where warehouse = "Chicago"
select code from boxes where warehouse = "Chicago"
select count(*), warehouse from boxes group by warehouse
select warehouse, count(*) from boxes group by warehouse
select count(distinct contents), warehouse from boxes group by warehouse
select count(distinct contents), warehouse from boxes group by warehouse
select code from warehouses where capacity > (select max(capacity) from warehouses)
select warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code where boxes.value > warehouses.capacity
select sum(value) from boxes where warehouse not in (select warehouses.code from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "Chicago")
select sum(value) from boxes where warehouse not in (select warehouses.location from boxes join warehouses on boxes.warehouse = warehouses.code where warehouses.location = "Chicago")
select university_name, city, state from university order by university_name
select university_name, city, state from university order by university_name
select count(*) from university where state = "IL" or state = "OHIO"
select count(*) from university where state = "IL" or state = "OHIO"
select max(enrollment), avg(enrollment), min(enrollment) from university
select max(enrollment), avg(enrollment), min(enrollment) from university
select team_name from university where enrollment > (select avg(enrollment) from university)
select team_name from university where enrollment > (select avg(enrollment) from university)
select distinct home_conference from university
select distinct home_conference from university
select home_conference, count(*) from university group by home_conference
select home_conference, count(*) from university group by home_conference
select state from university group by state order by count(*) desc limit 1
select state from university group by state order by count(*) desc limit 1
select home_conference from university group by home_conference having avg(enrollment) > 2000
select home_conference from university group by home_conference having avg(enrollment) > 2000
select home_conference from university group by home_conference order by sum(enrollment) limit 1
select home_conference from university order by enrollment limit 1
select major_name, major_code from major order by major_code
select major_name, major_code from major order by major_code
select major.major_name, major_ranking.rank from university join major_ranking on university.university_id = major_ranking.university_id where university.university_name = "augustana college"
select major_ranking.rank, major.major_name from major_ranking join major on major_ranking.major_id = major.major_id join university on major_ranking.university_id = university.university_id where university.university_name = "augustana college"
select university.university_name, university.city, university.state from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" and major_ranking.rank = 1
select university.university_name, university.city, university.state from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" and major_ranking.rank = 1
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id where major_ranking.rank = 1 group by university.university_name order by count(*) desc limit 1
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id where major_ranking.rank = 1 group by university.university_name order by count(*) desc limit 1
select university_name from university except select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id where major_ranking.rank = 1
select university_name from university where university_id not in (select university_id from major_ranking order by rank 1)
select university_name from university where university_id in (select university_id from major_ranking join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" intersect select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Ur Education"
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" intersect select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Ur Education"
select university_name, overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where university.state = "Wisconsin"
select university_name, overall_ranking.rank from university join overall_ranking on university.university_id = overall_ranking.university_id where university.state = "Wisconsin"
select university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.research_point desc limit 1
select university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by research_point desc limit 1
select university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point asc
select university.university_name from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point asc
select university.university_name from university join major_ranking on university.university_id = major_ranking.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" and major_ranking.rank >= 3
select university.university_name from major_ranking join university on major_ranking.university_id = university.university_id join major on major_ranking.major_id = major.major_id where major.major_name = "Accounting" and major_ranking.rank >= 3
select sum(university.enrollment) from university join overall_ranking on university.university_id = overall_ranking.university_id where overall_ranking.rank <= 5
select sum(enrollment) from university where university_id in (select university_id from overall_ranking group by university_id having rank <= 5)
select university.university_name, overall_ranking.citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point desc limit 3
select university.university_name, overall_ranking.citation_point from university join overall_ranking on university.university_id = overall_ranking.university_id order by overall_ranking.reputation_point desc limit 3
select state from university where enrollment < 3000 group by state having count(*) > 2
select state from university where enrollment < 3000 group by state having count(*) > 2
select title from movies where rating = "null"
select title from movies where rating = "null"
select title from movies where rating = "g"
select title from movies where rating = "G"
select movies.title from movietheaters join movies on movietheaters.code = movies.code where movietheaters.name = "Odeon"
select movies.title from movietheaters join movies on movietheaters.code = movies.code where movietheaters.name = "Odeon"
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code
select count(*) from movies where rating = "g"
select count(*) from movies where rating = "G"
select count(*) from movietheaters
select count(distinct movie) from movietheaters
select count(distinct movie) from movietheaters
select count(distinct movie) from movietheaters
select count(distinct name) from movietheaters
select count(*) from movietheaters
select rating from movies where title like "%citizen%"
select rating from movies where title like "%citizen%"
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = "g" or movies.rating = "pg"
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = "G" or movies.rating = "PG"
select movies.title from movietheaters join movies on movietheaters.code = movies.code where movietheaters.name = "cinema odeon" or movietheaters.name = "imperial"
select movies.title from movietheaters join movies on movietheaters.code = movies.code where movietheaters.name = "Odeon" or movietheaters.name = "Imperial"
select movies.title from movies join movietheaters on movies.code = movietheaters.code join movies on movietheaters.movie = movies.code where movietheaters.name = 'Odeon' intersect select movies.title from movies join movietheaters on movies.code = movietheaters.code where movietheaters.name = 'Imperial'
select movies.title from movietheaters join movies on movietheaters.code = movies.code join movietheaters on movietheaters.code = movies.code where movietheaters.name = 'Odeon' intersect select movies.title from movietheaters join movies on movietheaters.code = movies.code where movietheaters.name = 'Imperial Theater'
select title from movies except select movies.title from movies join movietheaters on movies.code = movietheaters.code where movietheaters.name = "Odeon"
select title from movies except select movies.title from movies join movietheaters on movies.code = movietheaters.code where movietheaters.name = "Odeon"
select title from movies order by title
select title from movies order by title
select title from movies order by rating
select title from movies order by rating
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code group by movietheaters.name order by count(*) desc limit 1
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code group by movietheaters.name order by count(*) desc limit 1
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code group by movietheaters.name order by count(*) desc limit 1
select movies.title, movietheaters.name from movies join movietheaters on movies.code = movietheaters.code group by movietheaters.name order by count(*) desc limit 1
select rating, count(*) from movies group by rating
select rating, count(*) from movies group by rating
select count(*) from movies where rating!= "null"
select count(*) from movies where rating!= "null"
select distinct movietheaters.name from movietheaters join movies on movietheaters.code = movies.code group by movietheaters.name having count(*) >= 1
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code group by movietheaters.name having count(*) >= 1
select name from movietheaters where code not in (select code from movietheaters where movie = "null")
select name from movietheaters where code not in (select code from movies)
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = "g"
select movietheaters.name from movietheaters join movies on movietheaters.code = movies.code where movies.rating = "G"
select title from movies
select distinct title from movies
select distinct rating from movies
select distinct rating from movies
select * from movies where rating = "null"
select * from movies where rating = "null"
select title from movies where code not in (select movie from movietheaters)
select title from movies where code not in (select movie from movietheaters)
select recipient from package order by weight desc limit 1
select client.name from client join package on client.accountnumber = package.recipient order by package.weight desc limit 1
select sum(package.weight) from client join package on client.accountnumber = package.sender where client.name = "Leo Wong"
select sum(package.weight) from employee join package on employee.employeeid = package.sender where employee.name = "Leo Wong"
select position from employee where name = "Amy Wong"
select position from employee where name = "amy wong"
select salary, position from employee where name = 'Turanga Leela'
select salary, position from employee where name = 'Turanga Leela'
select avg(salary) from employee where position = 'intern'
select avg(salary) from employee where position = 'intern'
select level from employee where position = 'Physician'
select level from has_clearance where employee = 'Physician'
select packagenumber from package join shipment on package.shipment = shipment.shipmentid join employee on employee.employeeid = shipment.employeeid where employee.name = "Leo Wong"
select count(*) from employee join package on employee.employeeid = package.sender where employee.name = "Leo Wong"
select package.packagenumber from employee join package on employee.employeeid = package.receiver where employee.name = "Leo Wong"
select package.packagenumber from employee join package on employee.employeeid = package.receiver where employee.name = "Leo Wong"
select * from package join employee on package.sender = employee.employeeid where employee.name = "Leo Wong"
select distinct package.packagenumber from employee join package on employee.employeeid = package.sender or package.receiver = shipment.shipmentid where employee.name = "Leo Wong"
select count(*) from package join employee on package.sender = employee.employeeid join recipient on package.receiver = employee.employeeid where employee.name = "Ogden Wernstrom" and employee.name = "Leo Wong"
select count(*) from package join employee on package.sender = employee.employeeid join client on client.accountnumber = employee.employeeid where employee.name = "Ogden Wernstrom" and recipient.name = "Leo Wong"
select contents from package join shipment on package.shipmentid = shipment.shipmentid join client on client.accountnumber = shipment.clientnumber where client.name = "John Zoidfarb"
select package.contents from employee join package on employee.employeeid = package.sender where employee.name = "John Zoidfarb"
select package.packagenumber, package.weight from client join package on client.accountnumber = package.sender where client.name like "%john%"
select package.packagenumber, package.weight from client join package on client.accountnumber = package.senter where client.name = "John" or something similar order by package.weight desc limit 1
select packagenumber, weight from package order by weight desc limit 3
select packagenumber, weight from package order by weight asc limit 3
select client.name, count(*) from client join package on client.accountnumber = package.sender group by client.name order by count(*) desc limit 1
select client.name, count(*) from client join package on client.accountnumber = package.sender group by client.accountnumber order by count(*) desc limit 1
select client.name, count(*) from client join package on client.accountnumber = package.receiver group by client.name order by count(*) asc limit 1
select recipient, count(*) from package group by recipient order by count(*) asc limit 1
select client.name from client join package on client.accountnumber = package.sender group by package.sender having count(*) > 1
select client.name from client join package on client.accountnumber = package.sender group by client.accountnumber having count(*) > 1
select coordinates from planet where name = "Mars"
select coordinates from planet where name = "Mars"
select name, coordinates from planet order by name
select name, coordinates from planet order by name
select shipment.shipmentid from employee join shipment on employee.employeeid = shipment.employeeid where employee.name = "Phillip j. Fried"
select shipmentid from shipment where manager = "Phillip j Fried"
select date from shipment
select date from shipment
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = "Mars"
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = "Mars"
select shipment.shipmentid from shipment join planet on shipment.planet = planet.planetid where planet.name = "Mars" and shipment.manager = "Turanga Leela"
select shipmentid from shipment where planet = "Mars" and manager = "Turanga Leela"
select shipmentid from shipment where planet = "Mars" or manager = "Turanga Leela"
select shipmentid from shipment where planet = "Mars" and manager = "Turanga Leela"
select planet.name, sum(shipment.shipments) from planet join shipment on planet.planet = shipment.planet group by shipment.planet
select planet.name, count(*) from planet join shipment on planet.planetid = shipment.planetid group by planet.planetid
select planet.name from planet join shipment on planet.planetid = shipment.planetid group by shipment.planetid order by count(*) desc limit 1
select planet.name from planet join shipment on planet.planetid = shipment.planetid group by shipment.planet order by count(*) desc limit 1
select employee.name, count(*) from employee join shipment on employee.employeeid = shipment.manager group by shipment.manager
select count(*), manager from shipment group by manager
select sum(weight) from package where planet = "Mars"
select sum(weight) from package where planet = "Mars"
select planet.name, sum(package.weight) from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid group by shipment.planet
select sum(package.weight), planet.name from package join planet on package.planet = planet.planetid group by planet.name
select planet.name from package join planet on package.planet = planet.planetid group by package.planet having sum(package.weight) > 30
select planet.name from package join planet on package.planet = planet.planetid group by package.planet having sum(package.weight) > 30
select package.packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = "Omicron Persei" and employee.name = "Zapp Brannigan"
select count(*) from employee join package on employee.employeeid = package.sender join shipment on package.shipmentid = shipment.shipmentid where employee.name = "Zapp Brannigan" and shipment.shipmentid = "Omicron Persei 8"
select package.packagenumber from package join shipment on package.shipment = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = "Omicron Persei 8" or client.name = "Zapp Brannigan"
select count(*) from package join shipment on package.shipmentid = shipment.shipmentid join planet on shipment.planet = planet.planetid where planet.name = "Omicron Persei 8" or client.name = "Zapp Brannigan"
select packagenumber, weight from package where weight between 10 and 30
select packagenumber, weight from package where weight between 10 and 30
select name from employee except select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.planet = "Mars"
select name from employee except select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.planet = "Mars"
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee where has_clearance.planet = "omega iii"
select employee.name from employee join has_clearance on employee.employeeid = has_clearance.employee join planet on has_clearance.planet = planet.planetid where planet.name = "omega iii"
select planet.name from has_clearance join planet on has_clearance.planet = planet.planetid group by has_clearance.planet having count(*) = 1
select planet.name from has_clearance join planet on has_clearance.planet = planet.planetid group by has_clearance.planet having count(*) = 1
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
select avg(units_sold_millions) from game where developers!= "Nintendo"
select avg(units_sold_millions) from game where developers!= "Nintendo"
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
select player.player_name, player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = "Super mario World"
select player.player_name, player.rank_of_the_year from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where game.title = "Super mario World"
select distinct game.developers from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.college = "Auburn"
select distinct game.developers from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.college = "Auburn"
select avg(game.units_sold_millions) from game join game_player on game.game_id = game_player.game_id join player on game_player.player_id = player.player_id where player.position = "guard"
select avg(game.units_sold_millions) from game join game_player on game.game_id = game_player.game_id join player on game_player.player_id = player.player_id where player.position = "guard"
select game.title, platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title, platform.platform_name from game join platform on game.platform_id = platform.platform_id
select game.title from game join platform on game.platform_id = platform.platform_id where platform.market_district = "Asia" or platform.market_district = "USA"
select game.title from game join platform on game.platform_id = platform.platform_id where platform.market_district = "Asia" or platform.market_district = "USA"
select franchise, count(*) from game group by franchise
select franchise, count(*) from game group by franchise
select franchise from game group by franchise order by count(*) desc limit 1
select franchise from game group by franchise order by count(*) desc limit 1
select franchise from game group by franchise having count(*) >= 2
select franchise from game group by franchise having count(*) >= 2
select player_name from player where player_id not in (select player_id from game_player)
select player_name from player where player_id not in (select player_id from game_player)
select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = "Oklahoma" intersect select game.title from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.college = "Auburn"
select game.title from game_player join game on game_player.game_id = game.game_id join player on game_player.player_id = player.player_id where player.college = "Oklahoma" or player.college = "Auburn"
select distinct franchise from game
select distinct franchise from game
select title from game except select game.title from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.position = "guard"
select title from game except select game.title from game_player join player on game_player.player_id = player.player_id join game on game_player.game_id = game.game_id where player.position = "guard"
select name from press order by year_profits_billion desc
select name from press order by year_profits_billion desc
select publisher.name from press join book on press.press_id = book.press_id where press.year_profits_billion > 15 or press.month_profits_billion > 1
select name from press where year_profits_billion > 15 or month_profits_billion > 1
select avg(year_profits_billion), max(year_profits_billion) from press
select avg(year_profits_billion), max(year_profits_billion) from press
select name from press order by month_profits_billion desc limit 1
select name from press order by month_profits_billion desc limit 1
select name from press order by month_profits_billion desc limit 1
select name from press order by month_profits_billion desc limit 1
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
select author.name from book join author on book.author_id = author.author_id where book.book_series = "MM" intersect select author.name from book join author on book.author_id = author.author_id where book.book_series = "LT"
select author.name from book join author on book.author_id = author.author_id where book.book_series = "MM" intersect select author.name from book join author on book.author_id = author.author_id where book.book_series = "LT"
select name, age from author where author_id not in (select author_id from book)
select name from author where author_id not in (select author_id from book)
select author.name from author join book on author.author_id = book.author_id group by book.author_id having count(*) > 1
select author.name from book join author on book.author_id = author.author_id group by book.author_id having count(*) > 1
select title, author.name, publisher.name from book join author on book.author_id = author.author_id order by sale_amount desc limit 3
select book.title, author.name, press.name from book join author on book.author_id = author.author_id join press on press.press_id = book.press_id order by book.sale_amount desc limit 3
select press.name, sum(book.sale_amount) from book join press on book.press_id = press.press_id group by book.press_id
select press.name, sum(book.sale_amount) from book join press on book.press_id = press.press_id group by book.press_id
select count(*), press.name from book join press on book.press_id = press.press_id where book.sale_amount > 1000 group by press.name
select press.name, count(*) from book join press on book.press_id = press.press_id where book.sale_amount > 1000 group by book.press_id
select author.name from book join author on book.author_id = author.author_id order by book.sale_amount desc limit 1
select author.name from book join author on book.author_id = author.author_id order by book.sale_amount desc limit 1
select author.name, author.gender from book join author on book.author_id = author.author_id group by book.author_id order by count(*) desc limit 1
select author.name, author.gender from book join author on book.author_id = author.author_id group by book.author_id order by count(*) desc limit 1
select name from author except select author.name from book join author on book.author_id = author.author_id join press on book.press_id = press.press_id where press.name = "Accor"
select name from author where author_id not in (select author_id from book join press on book.press_id = press.press_id where press.name = "Accor")
select press.name, press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count(*) > 2
select press.name, press.year_profits_billion from book join press on book.press_id = press.press_id group by book.press_id having count(*) > 2
select count(*) from authors
select author_name from authors
select author_name, other_details from authors
select other_details from authors where author_name = "addison denesik"
select count(*) from documents
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_id = 4
select authors.author_name from authors join documents on authors.author_name = documents.author_name where documents.document_name = "Travel to Brazil"
select count(*) from documents join authors on documents.author_name = authors.author_name where authors.author_name = "Era Kerluke"
select document_name, document_description from documents
select document_id, document_name from documents join authors on documents.author_name = authors.author_name where authors.author_name = "bianka cummings"
select authors.author_name, authors.other_details from documents join authors on documents.author_name = authors.author_name join documents on documents.document_id = documents.document_id where documents.document_name = "Tour to China"
select authors.author_name, count(*) from documents join authors on documents.author_name = authors.author_name group by authors.author_name
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name order by count(*) desc limit 1
select authors.author_name from authors join documents on authors.author_name = documents.author_name group by authors.author_name having count(*) >= 2
select count(*) from business_processes
select business_processes.process_name, business_processes.process_description from business_processes join business_processes on business_processes.process_id = business_processes.process_id where business_processes.process_id = 9
select process_name from business_processes where process_id = 9 order by next_process_id
select count(*) from process_outcomes
select process_outcome_code, process_outcome_description from process_outcomes
select process_outcome_description from process_outcomes
select count(*) from process_status
select process_status_code, process_status_description from process_status
select process_status_description from process_status where process_status_code = "CT"
select count(*) from staff
select staff_id, staff_details from staff
select staff_details from staff where staff_id = 100
select count(*) from staff_in_processes
select staff_role_code, staff_role_description from ref_staff_roles
select staff_role_description from ref_staff_roles where staff_role_code = "HR"
select count(distinct document_id) from documents_processes
select process_id from documents_processes
select document_id from documents except select document_id from documents_processes
select process_id from process except select process_id from documents_processes
select process_outcomes.process_outcome_description, process_status.process_status_description from documents_processes join process_outcomes on documents_processes.process_outcome_code = process_outcomes.process_outcome_code join process_status on documents_processes.process_status_code = process_status.process_status_code where documents_processes.document_id = 0
select business_processes.process_name from documents join documents_processes on documents.document_id = documents_processes.document_id join business_processes on documents_processes.process_id = business_processes.process_id where documents.document_name = "Travel to Brazil"
select process_id, count(*) from documents_processes group by process_id
select count(*) from staff_in_processes where document_id = 0 and process_id = 9
select staff_in_processes.staff_id, count(*) from staff_in_processes join documents_processes on staff_in_processes.process_id = documents_processes.process_id group by staff_in_processes.staff_id
select staff_role_code, count(*) from staff_in_processes group by staff_role_code
select count(distinct staff_role_code) from staff_in_processes where staff_id = 3
select count(*) from agencies
select count(*) from agencies
select agency_id, agency_details from agencies
select agency_id, agency_details from agencies
select count(*) from clients
select count(*) from clients
select client_id, client_details from clients
select client_id, client_details from clients
select agency_id, count(*) from clients group by agency_id
select agencies.agency_details, count(*) from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count(*) desc limit 1
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id order by count(*) desc limit 1
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id having count(*) >= 2
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id group by agencies.agency_id having count(*) >= 2
select agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = "mac"
select agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id where clients.client_details = "mac"
select clients.client_details, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id
select clients.client_details, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id
select sic_code, count(*) from clients group by sic_code
select sic_code, count(*) from clients group by sic_code
select client_id, client_details from clients where sic_code = "bad"
select client_ideas, client_details from clients where sic_code = "Bad"
select agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id
select distinct agencies.agency_id, agencies.agency_details from agencies join clients on agencies.agency_id = clients.agency_id
select agency_id from agencies except select agency_id from clients
select agency_id from agencies except select agency_id from clients
select count(*) from invoices
select count(*) from invoices
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from invoices join clients on invoices.client_id = clients.client_id
select invoice_id, invoice_status, invoice_details from invoices
select client_id, count(*) from invoices group by client_id
select client_id, count(*) from invoices group by client_id
select clients.client_id, clients.client_details from clients join invoices on invoices.client_id = clients.client_id group by clients.client_id order by count(*) desc limit 1
select clients.client_id, clients.client_details from clients join invoices on invoices.client_id = clients.client_id group by clients.client_id order by count(*) desc limit 1
select client_id from invoices group by client_id having count(*) >= 2
select client_id from invoices group by client_id having count(*) >= 2
select invoice_status, count(*) from invoices group by invoice_status
select invoice_status, count(*) from invoices group by invoice_status
select invoice_status from invoices group by invoice_status order by count(*) desc limit 1
select invoice_status from invoices group by invoice_status order by count(*) desc limit 1
select invoices.invoice_status, invoices.invoice_details, invoices.client_id, agencies.agency_id from invoices join clients on invoices.client_id = clients.client_id join agencies on invoices.agency_id = agencies.agency_id
select invoices.invoice_status, invoices.invoice_details, invoices.client_id, agencies.agency_details from invoices join clients on invoices.client_id = clients.client_id join agencies on invoices.agency_id = agencies.agency_id
select meeting_type, other_details from meetings
select meeting_type, other_details from meetings
select meeting_outcome, purpose_of_meeting from meetings
select meeting_outcome, purpose_of_meeting from meetings
select payments.payment_id, payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = "Working"
select payments.payment_id, payments.payment_details from payments join invoices on payments.invoice_id = invoices.invoice_id where invoices.invoice_status = "working"
select invoice_id, invoice_status from invoices except select invoices.invoice_id, invoices.invoice_status from invoices join payments on invoices.invoice_id = payments.invoice_id
select invoice_id, invoice_status from invoices where invoice_id not in (select invoice_id from payments)
select count(*) from payments
select count(*) from payments
select payment_id, invoice_id, payment_details from payments
select payment_id, invoice_id, payment_details from payments
select invoices.invoice_id, invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select distinct invoices.invoice_id, invoices.invoice_status from payments join invoices on payments.invoice_id = invoices.invoice_id
select invoice_id, count(*) from payments group by invoice_id
select invoice_id, count(*) from payments group by invoice_id
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count(*) desc limit 1
select invoices.invoice_id, invoices.invoice_status, invoices.invoice_details from payments join invoices on payments.invoice_id = invoices.invoice_id group by payments.invoice_id order by count(*) desc limit 1
select count(*) from staff
select count(*) from staff
select agency_id, count(*) from staff group by agency_id
select agency_id, count(*) from staff group by agency_id
select agencies.agency_id, agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count(*) desc limit 1
select agencies.agency_id, agencies.agency_details from agencies join staff on agencies.agency_id = staff.agency_id group by agencies.agency_id order by count(*) desc limit 1
select meeting_outcome, count(*) from meetings group by meeting_outcome
select meeting_outcome, count(*) from meetings group by meeting_outcome
select client_id, count(*) from meetings group by client_id
select client_id, count(*) from meetings group by client_id
select meeting_type, count(*) from meetings join clients on meetings.client_id = clients.client_id group by clients.client_id
select meeting_type, count(*) from meetings group by meeting_type
select meeting_id, meeting_outcome, meeting_type, clients.client_details from clients join meetings on clients.client_id = meetings.client_id
select meeting_id, meeting_outcome, meeting_type, client_details from meetings
select meeting_id, count(*) from staff_in_meetings group by meeting_id
select count(*), meetings.meeting_id from staff_in_meetings join meetings on staff_in_meetings.meeting_id = meetings.meeting_id group by meetings.meeting_id
select staff_in_meetings.staff_id, count(*) from staff_in_meetings join meetings on staff_in_meetings.meeting_id = meetings.meeting_id group by staff_in_meetings.staff_id order by count(*) asc limit 1
select staff_id from staff_in_meetings group by staff_id order by count(*) asc limit 1
select count(distinct staff_id) from staff_in_meetings
select count(distinct staff_id) from staff_in_meetings
select count(*) from staff where staff_id not in (select staff_id from staff_in_meetings)
select count(*) from staff where staff_id not in (select staff_id from staff_in_meetings)
select clients.client_id, clients.client_details from clients join meetings on clients.client_id = meetings.client_id union select clients.client_id, clients.client_details from clients join invoices on clients.client_id = invoices.client_id
select clients.client_id, clients.client_details from clients join meetings on clients.client_id = meetings.client_id join invoices on invoices.client_id = meetings.client_id
select staff.staff_id, staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff_in_meetings.staff_id having count(*) >= 1 and staff.staff_details like '%s%'
select staff.staff_id, staff.staff_details from staff join staff_in_meetings on staff.staff_id = staff_in_meetings.staff_id group by staff_in_meetings.staff_id having count(*) >= 1
select clients.client_id, clients.sic_code, clients.agency_id from clients join meetings on clients.client_id = meetings.client_id group by clients.client_id having count(*) = 1 intersect select clients.client_id, clients.sic_code, clients.agency_id from clients join meetings on clients.client_id = meetings.client_id join invoices on invoices.client_id = meetings.client_id group by clients.client_id having count(*) >= 1
select clients.client_id, clients.sic_code, clients.agency_id from clients join meetings on clients.client_id = meetings.client_id join invoices on meetings.invoice_id = invoices.invoice_id group by clients.client_id having count(*) = 1
select meetings.start_date_time, meetings.end_date_time, clients.client_details, staff.staff_details from meetings join clients on meetings.client_id = clients.client_id join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id
select meetings.start_date_time, meetings.end_date_time, clients.client_details, staff.staff_details from meetings join clients on meetings.client_id = clients.client_id join staff_in_meetings on meetings.meeting_id = staff_in_meetings.meeting_id