SELECT COUNT(club_id) FROM club
SELECT COUNT(*) FROM club
SELECT name FROM club ORDER BY name ASC
SELECT name FROM club ORDER BY name ASC
SELECT manager, captain FROM club
SELECT manager, captain FROM club
SELECT name FROM club WHERE manufacturer <> 'Nike'
SELECT name FROM club WHERE manufacturer != 'Nike'
SELECT name FROM player ORDER BY wins_count ASC
SELECT name FROM player ORDER BY wins_count ASC
SELECT name FROM player ORDER BY earnings DESC LIMIT 1;
SELECT name FROM player ORDER BY earnings DESC LIMIT 1
SELECT DISTINCT country FROM player WHERE earnings > 1200000
SELECT DISTINCT country FROM player WHERE earnings > 1200000
SELECT country FROM player WHERE earnings = (SELECT MAX(earnings) FROM player WHERE wins_count > 2)
SELECT country FROM player WHERE wins_count > 2 ORDER BY earnings DESC LIMIT 1
SELECT player.name, club.name FROM player JOIN club ON player.club_id = club.club_id
SELECT player.name, club.name FROM player INNER JOIN club ON player.club_id = club.club_id
SELECT DISTINCT club.name FROM club JOIN player ON club.club_id = player.club_id WHERE player.wins_count > 2
SELECT club.name FROM club WHERE club_id IN (SELECT club_id FROM player WHERE wins_count > 2 GROUP BY club_id)
SELECT p.name FROM player p INNER JOIN club c ON p.club_id = c.club_id WHERE c.manager = 'Sam Allardyce'
SELECT player.name FROM player JOIN club ON player.club_id = club.club_id WHERE club.manager = 'Sam Allardyce'
SELECT c.name FROM club c JOIN player p ON c.club_id = p.club_id GROUP BY c.name ORDER BY AVG(p.earnings) DESC
SELECT c.name FROM club c JOIN player p ON c.club_id = p.club_id GROUP BY c.name ORDER BY AVG(p.earnings) DESC
SELECT manufacturer, COUNT(club_id) FROM club GROUP BY manufacturer
SELECT manufacturer, COUNT(DISTINCT club_id) FROM club GROUP BY manufacturer
SELECT manufacturer FROM club GROUP BY manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT manufacturer FROM club GROUP BY manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(club_id) > 1
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(DISTINCT club_id) > 1
SELECT country FROM player GROUP BY country HAVING COUNT(player_id) > 1
SELECT country FROM player GROUP BY country HAVING COUNT(player_id) > 1
SELECT name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT club.name FROM club WHERE club_id NOT IN (SELECT club_id FROM player)
SELECT DISTINCT country FROM player WHERE earnings > 1400000 OR earnings < 1100000
SELECT DISTINCT p1.country FROM player p1 WHERE p1.earnings > 1400000 AND EXISTS (SELECT 1 FROM player p2 WHERE p2.earnings < 1100000 AND p1.country = p2.country)
SELECT COUNT(DISTINCT country) FROM player
SELECT COUNT(DISTINCT country) FROM player
SELECT earnings FROM player WHERE country IN ('Australia', 'Zimbabwe')
SELECT earnings FROM player WHERE country IN ('Australia', 'Zimbabwe')
SELECT DISTINCT customers.customer_id, customers.customer_first_name, customers.customer_last_name FROM customers, orders, order_items WHERE customers.customer_id = orders.customer_id AND orders.order_id = order_items.order_id GROUP BY customers.customer_id HAVING COUNT(DISTINCT orders.order_id) > 2 AND COUNT(order_items.order_item_id) >= 3
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM customers c WHERE c.customer_id IN (SELECT o.customer_id FROM orders o GROUP BY o.customer_id HAVING COUNT(*) > 2) AND c.customer_id IN (SELECT o.customer_id FROM orders o JOIN order_items i ON o.order_id = i.order_id GROUP BY o.customer_id HAVING COUNT(i.order_item_id) >= 3)
SELECT o.order_id, o.order_status_code, COUNT(oi.product_id) AS number_of_products FROM orders o JOIN order_items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(*) AS product_count FROM orders o JOIN order_items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.date_order_placed FROM orders o WHERE o.date_order_placed = (SELECT MIN(date_order_placed) FROM orders) OR o.order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING COUNT(order_item_id) > 1)
SELECT MIN(date_order_placed), date_order_placed FROM orders WHERE order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING COUNT(order_item_id) > 1) GROUP BY date_order_placed
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM orders)
SELECT c.customer_first_name, c.customer_last_name, c.customer_middle_initial FROM customers c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id)
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM products P WHERE P.product_id NOT IN (SELECT product_id FROM order_items GROUP BY product_id HAVING COUNT(order_id) >= 2)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM products p WHERE (SELECT COUNT(DISTINCT oi.order_id) FROM order_items oi WHERE oi.product_id = p.product_id) < 2
SELECT distinct o.order_id, o.date_order_placed FROM orders o JOIN order_items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING COUNT(distinct oi.product_id) >= 2
SELECT orders.order_id, date_order_placed FROM orders JOIN order_items ON orders.order_id = order_items.order_id GROUP BY orders.order_id HAVING COUNT(DISTINCT product_id) >= 2
SELECT P.product_id, P.product_name, P.product_price FROM products P JOIN order_items OI ON P.product_id = OI.product_id GROUP BY P.product_id ORDER BY COUNT(OI.product_id) DESC LIMIT 1;
SELECT P.product_id, P.product_name, P.product_price FROM products P JOIN order_items OI ON P.product_id = OI.product_id GROUP BY P.product_id ORDER BY COUNT(OI.order_item_id) DESC LIMIT 1
SELECT order_id, MIN(sum_price) FROM (SELECT oi.order_id AS order_id, SUM(p.product_price) AS sum_price FROM order_items oi JOIN products p ON oi.product_id = p.product_id GROUP BY oi.order_id) AS Price_SumTable
SELECT o.order_id, MIN(total_cost) FROM (SELECT orders.order_id, SUM(products.product_price) AS total_cost FROM orders JOIN order_items ON orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id GROUP BY orders.order_id) o
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM customer_payment_methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customers.gender_code, COUNT(DISTINCT products.product_id) AS num_products FROM customers JOIN orders ON customers.customer_id = orders.customer_id JOIN order_items ON orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id GROUP BY customers.gender_code
SELECT customers.gender_code, COUNT(products.product_id) FROM customers JOIN orders ON customers.customer_id = orders.customer_id JOIN order_items ON orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id GROUP BY customers.gender_code
SELECT gender_code, COUNT(DISTINCT orders.order_id) FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY gender_code
SELECT gender_code, COUNT(order_id) AS orders_count FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, pm.payment_method_code FROM customers c JOIN customer_payment_methods pm ON c.customer_id = pm.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM customers c JOIN customer_payment_methods p ON c.customer_id = p.customer_id
SELECT invoices.invoice_status_code, invoices.invoice_date, shipments.shipment_date FROM invoices JOIN shipments ON invoices.invoice_number = shipments.invoice_number
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM invoices I JOIN shipments S ON I.invoice_number = S.invoice_number
SELECT p.product_name, s.shipment_date FROM products p JOIN order_items oi ON p.product_id = oi.product_id JOIN shipment_items si ON oi.order_item_id = si.order_item_id JOIN shipments s ON si.shipment_id = s.shipment_id
SELECT p.product_name, s.shipment_date FROM products p JOIN shipments s ON p.product_id = s.order_id
SELECT order_items.order_item_status_code, shipments.shipment_tracking_number FROM order_items JOIN shipments ON order_items.order_id = shipments.order_id
SELECT DISTINCT order_items.order_item_status_code, shipments.shipment_tracking_number FROM order_items JOIN orders ON order_items.order_id = orders.order_id JOIN shipments ON orders.order_id = shipments.order_id JOIN shipment_items ON order_items.order_item_id = shipment_items.order_item_id
SELECT DISTINCT pr.product_name, pr.product_color FROM products pr JOIN order_items oi ON pr.product_id = oi.product_id JOIN shipment_items si ON oi.order_item_id = si.order_item_id
SELECT DISTINCT p.product_name, p.product_color FROM products p JOIN order_items oi ON p.product_id = oi.product_id JOIN shipment_items si ON oi.order_item_id = si.order_item_id JOIN shipments s ON si.shipment_id = s.shipment_id
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM products p WHERE product_id IN (SELECT product_id FROM invoices NATURAL JOIN customers WHERE gender_code = 'Female')
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM products AS p JOIN customer_payment_methods AS cpm ON p.product_id = cpm.customer_id JOIN customers AS c ON c.customer_id = cpm.customer_id WHERE c.gender_code = 'Female'
SELECT inv.invoice_status_code FROM invoices inv WHERE inv.invoice_number NOT IN (SELECT sh.invoice_number FROM shipments sh)
SELECT inv.invoice_status_code FROM invoices inv WHERE inv.invoice_number NOT IN (SELECT sh.invoice_number FROM shipments sh)
SELECT o.order_id, o.date_order_placed AS date, SUM(p.product_price) AS total_cost FROM orders AS o JOIN order_items AS oi ON o.order_id = oi.order_id JOIN products AS p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT o.order_id, o.date_order_placed AS date, SUM(oi.order_item_id) AS total_amount_paid FROM orders o JOIN order_items oi ON o.order_id = oi.order_id WHERE EXISTS (SELECT 1 FROM invoices i JOIN shipments s ON i.invoice_number = s.invoice_number WHERE s.order_id = o.order_id AND i.invoice_status_code = 'Paid') GROUP BY o.order_id, o.date_order_placed
SELECT COUNT(DISTINCT o.customer_id) FROM orders o;
SELECT COUNT(DISTINCT customer_id) FROM orders
SELECT COUNT(DISTINCT order_item_status_code) FROM order_items
SELECT COUNT(DISTINCT order_item_status_code) FROM order_items
SELECT COUNT(DISTINCT payment_method_code) FROM customer_payment_methods;
SELECT COUNT(DISTINCT payment_method_code) FROM customer_payment_methods
SELECT login_name, login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM products WHERE product_price > (SELECT AVG(product_price) FROM products)
SELECT product_price, product_size FROM products WHERE product_price > (SELECT AVG(product_price) FROM products)
SELECT COUNT(DISTINCT product_id) FROM products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items)
SELECT COUNT(*) FROM products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items)
SELECT COUNT(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT COUNT(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_payment_methods)
SELECT DISTINCT order_status_code, date_order_placed FROM orders
SELECT order_status_code, date_order_placed FROM orders
SELECT address_line_1, town_city, county FROM customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM customers WHERE country = 'United States';
SELECT cu.customer_first_name, pr.product_name FROM customers cu JOIN orders orr ON cu.customer_id = orr.customer_id JOIN order_items oi ON orr.order_id = oi.order_id JOIN products pr ON oi.product_id = pr.product_id
SELECT c.customer_first_name, p.product_name FROM customers c JOIN orders o ON c.customer_id = o.customer_id JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id;
SELECT COUNT(*) FROM shipment_items
SELECT COUNT(DISTINCT products.product_id) FROM products JOIN order_items ON products.product_id = order_items.product_id JOIN shipment_items ON order_items.order_item_id = shipment_items.order_item_id
SELECT AVG(product_price) FROM products
SELECT AVG(product_price) FROM products
SELECT AVG(products.product_price) FROM products JOIN order_items ON products.product_id = order_items.product_id
SELECT AVG(products.product_price) FROM products JOIN order_items ON products.product_id = order_items.product_id
SELECT c.email_address, c.town_city, c.county FROM customers c WHERE c.gender_code = (SELECT gender_code FROM customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT c.email_address, c.town_city, c.county FROM customers c WHERE c.gender_code = (SELECT gender_code FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id ORDER BY COUNT(order_id) ASC LIMIT 1))
SELECT DISTINCT O.date_order_placed FROM orders O INNER JOIN customers C ON O.customer_id = C.customer_id INNER JOIN customer_payment_methods PM ON C.customer_id = PM.customer_id GROUP BY O.order_id HAVING COUNT(DISTINCT PM.payment_method_code) >= 2
SELECT DISTINCT o.date_order_placed FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE c.customer_id IN (SELECT customer_id FROM customer_payment_methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT P.product_id, P.product_description FROM products P JOIN order_items OI ON OI.product_id = P.product_id GROUP BY P.product_id HAVING COUNT(DISTINCT OI.order_id) > 3
SELECT products.product_id, products.product_description FROM products JOIN order_items ON products.product_id = order_items.product_id GROUP BY products.product_id HAVING COUNT(order_items.product_id) > 3
SELECT I.invoice_date, I.invoice_number FROM invoices I WHERE I.invoice_number IN (SELECT S.invoice_number FROM shipments S GROUP BY S.invoice_number HAVING COUNT(*) >= 2)
SELECT DISTINCT i.invoice_date, i.invoice_number FROM invoices i JOIN shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number HAVING COUNT(s.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM shipments;
SELECT shipment_tracking_number, shipment_date FROM shipments
SELECT product_color, product_description, product_size FROM products WHERE product_price < (SELECT MAX(product_price) FROM products);
SELECT product_color, product_description, product_size FROM products WHERE product_price < (SELECT MAX(product_price) FROM products)
SELECT d.name FROM director d WHERE d.age > (SELECT AVG(age) FROM director)
SELECT name FROM channel JOIN program ON channel.channel_id = program.channel_id GROUP BY director_id ORDER BY start_year ASC LIMIT 1
SELECT COUNT(*) FROM channel WHERE internet LIKE '%bbc%'
SELECT COUNT(DISTINCT digital_terrestrial_channel) FROM channel
SELECT title FROM program ORDER BY start_year DESC
SELECT D.name FROM director D JOIN program P ON D.director_id = P.director_id GROUP BY D.director_id ORDER BY COUNT(P.program_id) DESC LIMIT 1
SELECT d.name, d.age FROM director d JOIN program p ON d.director_id = p.director_id GROUP BY d.director_id ORDER BY COUNT(p.program_id) DESC LIMIT 1
SELECT title FROM program WHERE start_year = (SELECT MAX(start_year) FROM program);
SELECT ch.name, ch.internet FROM channel ch JOIN program pr ON ch.channel_id = pr.channel_id GROUP BY ch.channel_id HAVING COUNT(pr.program_id) > 1
SELECT channel.name, COUNT(program.program_id) FROM channel JOIN program ON channel.channel_id = program.channel_id GROUP BY channel.channel_id
SELECT COUNT(*) FROM channel WHERE channel_id NOT IN (SELECT DISTINCT channel_id FROM program)
SELECT director.name FROM director JOIN program ON director.director_id = program.director_id WHERE program.title = 'Dracula'
SELECT channel.name, channel.internet FROM channel JOIN director_admin ON channel.channel_id = director_admin.channel_id GROUP BY channel.channel_id ORDER BY COUNT(DISTINCT director_admin.director_id) DESC LIMIT 1
SELECT D.name FROM director D WHERE D.age BETWEEN 30 AND 60
SELECT channel.name FROM channel JOIN director_admin ON channel.channel_id = director_admin.channel_id JOIN director ON director_admin.director_id = director.director_id GROUP BY channel.channel_id HAVING SUM(CASE WHEN director.age < 40 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN director.age > 60 THEN 1 ELSE 0 END) > 0
SELECT ch.channel_id, ch.name FROM channel ch WHERE ch.channel_id NOT IN (SELECT da.channel_id FROM director_admin da JOIN director d ON da.director_id = d.director_id WHERE d.name = 'Hank Baskett')
SELECT COUNT(radio_id) FROM radio
SELECT transmitter FROM radio ORDER BY erp_kw ASC
SELECT tv_show_name, original_airdate FROM tv_show;
SELECT station_name FROM city_channel WHERE affiliation <> 'ABC'
SELECT transmitter FROM radio WHERE erp_kw > 150 OR erp_kw < 30
SELECT transmitter FROM radio ORDER BY erp_kw DESC LIMIT 1
SELECT AVG(erp_kw) FROM radio
SELECT affiliation, COUNT(*) AS num_channels FROM city_channel GROUP BY affiliation
SELECT affiliation, COUNT(*) AS count FROM city_channel GROUP BY affiliation ORDER BY count DESC LIMIT 1
SELECT affiliation FROM city_channel GROUP BY affiliation HAVING COUNT(*) > 3
SELECT city, station_name FROM city_channel ORDER BY station_name ASC
SELECT r.transmitter, cc.city FROM radio r JOIN city_channel_radio ccr ON r.radio_id = ccr.radio_id JOIN city_channel cc ON ccr.city_channel_id = cc.id
SELECT r.transmitter, cc.station_name FROM radio r JOIN city_channel_radio ccr ON r.radio_id = ccr.radio_id JOIN city_channel cc ON ccr.city_channel_id = cc.id ORDER BY r.erp_kw DESC
SELECT r.transmitter, COUNT(DISTINCT ccr.city_channel_id) FROM radio r JOIN city_channel_radio ccr ON r.radio_id = ccr.radio_id GROUP BY r.transmitter
SELECT DISTINCT transmitter FROM radio WHERE radio_id NOT IN (SELECT radio_id FROM city_channel_radio)
SELECT model FROM vehicle WHERE power > 6000 ORDER BY top_speed DESC LIMIT 1
SELECT model FROM vehicle WHERE power > 6000 ORDER BY top_speed DESC LIMIT 1
SELECT name FROM driver WHERE citizenship = 'United States'
SELECT name FROM driver WHERE citizenship = 'United States'
SELECT driver_id, MAX(vehicle_count) FROM (SELECT driver_id, COUNT(vehicle_id) AS vehicle_count FROM vehicle_driver GROUP BY driver_id)
SELECT d.driver_id, COUNT(vd.vehicle_id) AS num_vehicles FROM driver d JOIN vehicle_driver vd ON d.driver_id = vd.driver_id GROUP BY d.driver_id ORDER BY num_vehicles DESC LIMIT 1
SELECT MAX(power) AS max_power, AVG(power) AS avg_power FROM vehicle WHERE builder = 'Zhuzhou'
SELECT MAX(power) AS max_power, AVG(power) AS avg_power FROM vehicle WHERE builder = 'Zhuzhou'
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id ORDER BY COUNT(vehicle_id) ASC LIMIT 1
SELECT top_speed, power FROM vehicle WHERE build_year = 1996
SELECT top_speed, power FROM vehicle WHERE build_year = 1996
SELECT build_year, model, builder FROM vehicle
SELECT build_year, model, builder FROM vehicle
SELECT COUNT(DISTINCT driver_id) FROM vehicle_driver WHERE vehicle_id IN (SELECT vehicle_id FROM vehicle WHERE build_year = 2012)
SELECT COUNT(DISTINCT vd.driver_id) FROM vehicle_driver vd JOIN vehicle v ON vd.vehicle_id = v.vehicle_id WHERE v.build_year = 2012
SELECT COUNT(DISTINCT driver.driver_id) FROM driver WHERE racing_series = 'NASCAR'
SELECT COUNT(DISTINCT driver_id) FROM driver WHERE racing_series = 'NASCAR';
SELECT AVG(top_speed) FROM vehicle
SELECT AVG(top_speed) FROM vehicle
SELECT DISTINCT d.name FROM driver d JOIN vehicle_driver vd ON d.driver_id = vd.driver_id JOIN vehicle v ON vd.vehicle_id = v.vehicle_id WHERE v.power > 5000
SELECT DISTINCT d.name FROM driver AS d JOIN vehicle_driver AS vd ON d.driver_id = vd.driver_id JOIN vehicle AS v ON vd.vehicle_id = v.vehicle_id WHERE v.power > 5000
SELECT model FROM vehicle WHERE total_production > 100 OR top_speed > 150;
SELECT model FROM vehicle WHERE total_production > 100 OR top_speed > 150;
SELECT model, build_year FROM vehicle WHERE model LIKE '%DJ%'
SELECT model, build_year FROM vehicle WHERE model LIKE '%DJ%'
SELECT model FROM vehicle WHERE vehicle_id NOT IN (SELECT vehicle_id FROM vehicle_driver)
SELECT model FROM vehicle WHERE vehicle_id NOT IN (SELECT vehicle_id FROM vehicle_driver)
SELECT DISTINCT v.vehicle_id, v.model FROM vehicle v WHERE v.builder = 'Ziyang' OR v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd GROUP BY vd.vehicle_id HAVING COUNT(vd.driver_id) = 2)
SELECT DISTINCT v.vehicle_id, v.model FROM vehicle v WHERE v.builder = 'Ziyang' OR v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd GROUP BY vd.vehicle_id HAVING COUNT(vd.driver_id) = 2)
SELECT DISTINCT v.vehicle_id, v.model FROM vehicle v JOIN vehicle_driver vd ON v.vehicle_id = vd.vehicle_id JOIN driver d ON vd.driver_id = d.driver_id WHERE d.name = 'Jeff Gordon' OR v.vehicle_id IN (SELECT vehicle_id FROM vehicle_driver GROUP BY vehicle_id HAVING COUNT(distinct driver_id) > 2)
SELECT v.vehicle_id, v.model FROM vehicle v WHERE v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd GROUP BY vd.vehicle_id HAVING COUNT(DISTINCT vd.driver_id) > 2) OR v.vehicle_id IN (SELECT vd.vehicle_id FROM vehicle_driver vd JOIN driver d ON vd.driver_id = d.driver_id WHERE d.name = 'Jeff Gordon')
SELECT COUNT(*) FROM vehicle WHERE top_speed = (SELECT MAX(top_speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE top_speed = (SELECT MAX(top_speed) FROM vehicle)
SELECT name FROM driver ORDER BY name ASC
SELECT driver.name FROM driver ORDER BY driver.name ASC
SELECT racing_series, COUNT(DISTINCT driver_id) AS num_drivers FROM driver GROUP BY racing_series
SELECT racing_series, COUNT(DISTINCT driver_id) AS num_drivers FROM driver GROUP BY racing_series
SELECT d.name, d.citizenship FROM driver d JOIN vehicle_driver vd ON d.driver_id = vd.driver_id JOIN vehicle v ON vd.vehicle_id = v.vehicle_id WHERE v.model = 'DJ1'
SELECT d.name, d.citizenship FROM driver d JOIN vehicle_driver vd ON d.driver_id = vd.driver_id JOIN vehicle v ON vd.vehicle_id = v.vehicle_id WHERE v.model = 'DJ1'
SELECT COUNT(*) FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE driver_id NOT IN (SELECT DISTINCT driver_id FROM vehicle_driver)
SELECT COUNT(exam_id) FROM exams
SELECT COUNT(*) FROM exams
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT DISTINCT subject_code FROM exams ORDER BY subject_code ASC
SELECT exam_name, exam_date FROM exams WHERE subject_code <> 'Database'
SELECT exam_date, exam_name FROM exams WHERE subject_code != 'Database'
SELECT exam_date FROM exams WHERE subject_code LIKE '%data%' ORDER BY exam_date DESC
SELECT exams.exam_date FROM exams WHERE exams.subject_code LIKE '%data%' ORDER BY exams.exam_date DESC
SELECT type_of_question_code, COUNT(*) AS count FROM questions GROUP BY type_of_question_code
SELECT q.type_of_question_code, COUNT(*) AS count FROM questions q GROUP BY q.type_of_question_code
SELECT DISTINCT student_answer_text FROM student_answers WHERE comments = 'Normal'
SELECT DISTINCT student_answer_text FROM student_answers WHERE comments = 'Normal'
SELECT COUNT(DISTINCT comments) FROM student_answers
SELECT COUNT(DISTINCT comments) FROM student_answers
SELECT student_answer_text FROM student_answers GROUP BY student_answer_text ORDER BY COUNT(*) DESC;
SELECT student_answer_text FROM student_answers GROUP BY student_answer_text ORDER BY COUNT(*) DESC
SELECT s.first_name, a.date_of_answer FROM students s JOIN student_answers a ON s.student_id = a.student_id
SELECT s.first_name, sa.date_of_answer FROM student_answers sa JOIN students s ON sa.student_id = s.student_id
SELECT s.email_adress, sa.date_of_answer FROM students s JOIN student_answers sa ON s.student_id = sa.student_id ORDER BY sa.date_of_answer DESC
SELECT students.first_name || ' ' || last_name AS full_name, student_answers.date_of_answer FROM student_answers JOIN students on student_answers.student_id = students.student_id ORDER BY student_answers.date_of_answer DESC
SELECT assessment FROM student_assessments GROUP BY assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT assessment FROM student_assessments GROUP BY assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT DISTINCT s.first_name FROM students s JOIN student_answers sa ON s.student_id = sa.student_id GROUP BY s.student_id HAVING COUNT(sa.student_answer_id) >= 2
SELECT s.first_name FROM students s JOIN student_answers sa ON s.student_id = sa.student_id GROUP BY s.student_id HAVING COUNT(sa.student_answer_id) >= 2
SELECT valid_answer_text FROM valid_answers GROUP BY valid_answer_text ORDER BY COUNT(*) DESC LIMIT 1
SELECT valid_answer_text FROM valid_answers WHERE valid_answer_id IN (SELECT valid_answer_id FROM student_assessments GROUP BY valid_answer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT last_name FROM students WHERE gender_mfu <> 'M'
SELECT last_name FROM students WHERE gender_mfu != 'M'
SELECT gender_mfu, COUNT(student_id) as number_of_students FROM students GROUP BY gender_mfu
SELECT gender_mfu, COUNT(student_id) FROM students GROUP BY gender_mfu
SELECT last_name FROM students WHERE gender_mfu IN ('F', 'M');
SELECT last_name FROM students WHERE gender_mfu IN ('F', 'M');
SELECT first_name FROM students WHERE student_id NOT IN (SELECT DISTINCT student_id FROM student_answers)
SELECT s.first_name FROM students s WHERE NOT EXISTS (SELECT 1 FROM student_answers sa WHERE sa.student_id = s.student_id)
SELECT DISTINCT sa.student_answer_text FROM student_answers sa JOIN student_assessments sae ON sa.student_answer_id = sae.student_answer_id WHERE sa.comments IN ('Normal', 'Absent') AND EXISTS (SELECT 1 FROM student_answers sa2 WHERE sa2.student_answer_text = sa.student_answer_text AND sa2.comments <> sa.comments)
SELECT DISTINCT a.student_answer_text FROM student_answers a WHERE a.comments IN ('Normal', 'Absent') GROUP BY a.student_answer_text HAVING COUNT(DISTINCT a.comments) = 2
SELECT type_of_question_code FROM questions GROUP BY type_of_question_code HAVING COUNT(question_id) >= 3
SELECT type_of_question_code FROM questions GROUP BY type_of_question_code HAVING COUNT(question_id) >= 3
SELECT * FROM students
SELECT * FROM students;
SELECT COUNT(*) FROM addresses
SELECT COUNT(*) FROM addresses;
SELECT address_id, address_details FROM addresses;
SELECT address_id, address_details FROM addresses
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM products
SELECT product_id, product_type_code, product_name FROM products;
SELECT product_id, product_type_code, product_name FROM products;
SELECT product_price FROM products WHERE product_name = 'Monitor'
SELECT product_price FROM products WHERE product_name = 'Monitor'
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM products
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM products
SELECT AVG(product_price) FROM products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM products WHERE product_type_code = 'Hardware'
SELECT COUNT(*) FROM products WHERE product_type_code = 'Hardware'
SELECT product_name FROM products WHERE product_price > (SELECT AVG(product_price) FROM products)
SELECT p.product_name FROM products p WHERE p.product_price > (SELECT AVG(product_price) FROM products)
SELECT p.product_name FROM products p WHERE p.product_type_code = 'Hardware' AND p.product_price > (SELECT AVG(product_price) FROM products WHERE product_type_code = 'Hardware')
SELECT product_name FROM products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM products WHERE product_type_code = 'Hardware')
SELECT product_name FROM products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT p.product_name FROM products p WHERE p.product_type_code = 'Clothes' ORDER BY p.product_price DESC LIMIT 1
SELECT product_id, product_name FROM products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT products.product_id, products.product_name FROM products WHERE products.product_type_code = 'Hardware' ORDER BY products.product_price ASC LIMIT 1
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name FROM products ORDER BY product_price DESC
SELECT product_name, product_price FROM products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_name FROM products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) AS number_of_products FROM products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) AS product_count FROM products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS avg_price FROM products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS avg_price FROM products GROUP BY product_type_code
SELECT product_type_code FROM products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM customers
SELECT COUNT(*) FROM customers
SELECT customer_id, customer_name FROM customers
SELECT customer_id, customer_name FROM customers
SELECT c.customer_address, c.customer_phone, c.customer_email FROM customers c WHERE c.customer_name = 'Jeromy'
SELECT addresses.address_details, customers.customer_phone, customers.customer_email FROM customers JOIN addresses ON customers.address_id = addresses.address_id WHERE customers.customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) AS count_customers FROM customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(customer_id) AS num_customers FROM customers GROUP BY payment_method_code
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM customers WHERE payment_method_code = (SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM customers WHERE payment_method_code = (SELECT payment_method_code FROM customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM customers
SELECT DISTINCT payment_method_code FROM customers
SELECT product_id, product_type_code FROM products ORDER BY product_name
SELECT product_id, product_type_code FROM products ORDER BY product_name ASC
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY COUNT(product_id) ASC LIMIT 1
SELECT product_type_code FROM products GROUP BY product_type_code ORDER BY COUNT(product_id) ASC LIMIT 1
SELECT COUNT(*) FROM customer_orders
SELECT COUNT(*) FROM customer_orders
SELECT co.order_id, co.order_date, co.order_status_code FROM customer_orders co JOIN customers c ON co.customer_id = c.customer_id WHERE c.customer_name = 'Jeromy'
SELECT co.order_id, co.order_date, co.order_status_code FROM customer_orders co JOIN customers c ON co.customer_id = c.customer_id WHERE c.customer_name = 'Jeromy'
SELECT customers.customer_name, customers.customer_id, COUNT(customer_orders.order_id) AS number_of_orders FROM customers LEFT JOIN customer_orders ON customers.customer_id = customer_orders.customer_id GROUP BY customers.customer_id, customers.customer_name
SELECT c.customer_name, c.customer_id, COUNT(co.order_id) AS num_orders FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM customers c JOIN (SELECT customer_id, COUNT(*) as total_orders FROM customer_orders GROUP BY customer_id ORDER BY total_orders DESC LIMIT 1) most_orders ON c.customer_id = most_orders.customer_id
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT order_status_code, COUNT(order_id) AS num_orders FROM customer_orders GROUP BY order_status_code
SELECT order_status_code, COUNT(*) AS total_orders FROM customer_orders GROUP BY order_status_code
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM customer_orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT COUNT(*) FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT p.product_name FROM products p WHERE p.product_id NOT IN (SELECT o.product_id FROM order_items o)
SELECT product_name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items)
SELECT COUNT(DISTINCT products.product_id) FROM products JOIN order_items ON products.product_id = order_items.product_id WHERE products.product_name = 'Monitor'
SELECT SUM(oi.order_quantity) FROM order_items oi INNER JOIN products p ON oi.product_id = p.product_id WHERE p.product_name = 'Monitor'
SELECT COUNT(DISTINCT c.customer_id) FROM customers c JOIN customer_orders co ON c.customer_id = co.customer_id JOIN order_items oi ON co.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id WHERE p.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM customers WHERE customer_id IN (SELECT customer_id FROM customer_orders WHERE order_id IN (SELECT order_id FROM order_items WHERE product_id = (SELECT product_id FROM products WHERE product_name = 'Monitor')))
SELECT COUNT(DISTINCT customer_orders.customer_id) FROM customer_orders;
SELECT COUNT(DISTINCT customer_orders.customer_id) FROM customer_orders
SELECT customer_id FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT customer_id FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customer_orders)
SELECT DISTINCT co.order_date, co.order_id FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id WHERE oi.order_quantity > 6 OR co.order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING COUNT(product_id) > 3)
SELECT DISTINCT co.order_id, co.order_date FROM customer_orders co JOIN order_items oi ON co.order_id = oi.order_id WHERE oi.order_quantity > 6 OR co.order_id IN (SELECT order_id FROM order_items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT COUNT(*) FROM building
SELECT COUNT(*) FROM building
SELECT name FROM building ORDER BY number_of_stories ASC
SELECT name FROM building ORDER BY number_of_stories ASC
SELECT b.address FROM building b ORDER BY b.completed_year DESC
SELECT address FROM building ORDER BY completed_year DESC
SELECT MAX(number_of_stories) FROM building WHERE completed_year <> 1980
SELECT MAX(number_of_stories) FROM building WHERE completed_year != 1980
SELECT AVG(population) FROM region
SELECT AVG(population) FROM region
SELECT name FROM region ORDER BY name ASC
SELECT name FROM region ORDER BY name ASC
SELECT capital FROM region WHERE area > 10000
SELECT capital FROM region WHERE area > 10000
SELECT capital FROM region WHERE population = (SELECT MAX(population) FROM region)
SELECT capital FROM region ORDER BY population DESC LIMIT 1
SELECT name FROM region ORDER BY area DESC LIMIT 5
SELECT name FROM region ORDER BY area DESC LIMIT 5
SELECT building.name, region.name FROM building JOIN region ON building.region_id = region.region_id
SELECT b.name, r.name FROM building b JOIN region r ON b.region_id = r.region_id
SELECT name FROM region WHERE region_id IN (SELECT region_id FROM building GROUP BY region_id HAVING COUNT(*) > 1)
SELECT r.name FROM region r JOIN building b ON r.region_id = b.region_id GROUP BY r.name HAVING COUNT(b.building_id) > 1
SELECT R.capital FROM region R WHERE R.region_id = (SELECT B.region_id FROM building B GROUP BY B.region_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT r.capital FROM region r WHERE r.region_id = (SELECT b.region_id FROM building b GROUP BY b.region_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT b.address, r.capital FROM building b JOIN region r ON b.region_id = r.region_id
SELECT building.address, region.name FROM building JOIN region ON building.region_id = region.region_id
SELECT number_of_stories FROM building WHERE region_id IN (SELECT region_id FROM region WHERE name = 'Abruzzo')
SELECT building.number_of_stories FROM building INNER JOIN region ON building.region_id = region.region_id WHERE region.name = 'Abruzzo'
SELECT completed_year, COUNT(building_id) FROM building GROUP BY completed_year
SELECT completed_year, COUNT(building_id) AS number_of_buildings FROM building GROUP BY completed_year
SELECT completed_year FROM building GROUP BY completed_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT completed_year FROM building GROUP BY completed_year ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT name FROM region WHERE region_id NOT IN (SELECT region_id FROM building)
SELECT DISTINCT b1.completed_year FROM building b1 WHERE b1.number_of_stories > 20 AND b1.completed_year IN (SELECT b2.completed_year FROM building b2 WHERE b2.number_of_stories < 15)
SELECT DISTINCT b1.completed_year FROM building b1 WHERE b1.number_of_stories > 20 AND EXISTS (SELECT 1 FROM building b2 WHERE b2.number_of_stories < 15 AND b1.completed_year = b2.completed_year)
SELECT DISTINCT address FROM building
SELECT DISTINCT address FROM building;
SELECT completed_year FROM building ORDER BY number_of_stories DESC
SELECT completed_year FROM building ORDER BY number_of_stories DESC
SELECT channel_details FROM channels ORDER BY channel_details ASC
SELECT channel_details FROM channels ORDER BY channel_details ASC
SELECT COUNT(service_id) FROM services
SELECT COUNT(*) FROM services
SELECT analytical_layer_type_code FROM analytical_layer GROUP BY analytical_layer_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT analytical_layer_type_code FROM analytical_layer GROUP BY analytical_layer_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.service_id FROM services s JOIN customers_and_services cas ON s.service_id = cas.service_id JOIN customers c ON cas.customer_id = c.customer_id WHERE c.customer_details = 'Hardy Kutch'
SELECT service_details FROM services WHERE service_id IN (SELECT service_id FROM customers_and_services WHERE customer_id IN (SELECT customer_id FROM customers WHERE customer_details = 'Hardy Kutch'))
SELECT s.service_details FROM services s WHERE s.service_id IN (SELECT cas.service_id FROM customers_and_services cas GROUP BY cas.service_id HAVING COUNT(cas.customers_and_services_id) > 3)
SELECT s.service_details FROM services s WHERE s.service_id IN (SELECT c.service_id FROM customer_interactions c GROUP BY c.service_id HAVING COUNT(*) > 3)
SELECT c.customer_details FROM customers c WHERE c.customer_id = (SELECT customer_id FROM customer_interactions GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT customer_details FROM customers WHERE customer_id = (SELECT customer_id FROM customers_and_services GROUP BY customer_id ORDER BY COUNT(service_id) DESC LIMIT 1)
SELECT customer_details FROM customers WHERE customer_id = (SELECT customer_id FROM customers_and_services GROUP BY customer_id ORDER BY COUNT(DISTINCT service_id) DESC LIMIT 1)
SELECT customer_details FROM customers WHERE customer_id = (SELECT customer_id FROM customers_and_services GROUP BY customer_id ORDER BY COUNT(DISTINCT service_id) DESC LIMIT 1)
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT customer_details FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM customers_and_services)
SELECT customer_details FROM customers WHERE customer_id IN (SELECT customer_id FROM customers_and_services WHERE service_id = (SELECT service_id FROM customers_and_services GROUP BY service_id ORDER BY COUNT(*) ASC LIMIT 1))
SELECT DISTINCT c.customer_details FROM customers c JOIN customers_and_services cas ON c.customer_id = cas.customer_id WHERE cas.service_id = (SELECT service_id FROM customers_and_services GROUP BY service_id ORDER BY COUNT(*) ASC LIMIT 1)
SELECT COUNT(*) FROM (SELECT DISTINCT customer_details, service_details FROM customers INNER JOIN customers_and_services ON customers.customer_id = customers_and_services.customer_id INNER JOIN services ON customers_and_services.service_id = services.service_id)
SELECT COUNT(*) FROM (SELECT customer_details FROM customers UNION SELECT service_details FROM services)
SELECT customer_details FROM customers WHERE customer_details LIKE '%Kutch%'
SELECT customer_details FROM customers WHERE customer_details LIKE '%Kutch%'
SELECT DISTINCT s.service_details FROM services s WHERE s.service_id IN (SELECT cas.service_id FROM customers_and_services cas JOIN customers c ON cas.customer_id = c.customer_id WHERE c.customer_details = 'Hardy Kutch') OR s.service_id IN (SELECT ci.service_id FROM customer_interactions ci WHERE ci.services_and_channels_details = 'good')
SELECT DISTINCT s.service_details FROM services s JOIN customers_and_services cas ON s.service_id = cas.service_id JOIN customers c ON cas.customer_id = c.customer_id WHERE c.customer_details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM customer_interactions ci WHERE ci.service_id = s.service_id AND ci.status_code = 'good')
SELECT s.service_details FROM services s JOIN customers_and_services cs ON s.service_id = cs.service_id JOIN customers c ON cs.customer_id = c.customer_id JOIN customer_interactions ci ON ci.customer_id = c.customer_id AND ci.service_id = s.service_id WHERE c.customer_details = 'Hardy Kutch' AND ci.status_code = 'bad'
SELECT s.service_details FROM services s JOIN customers_and_services cs ON s.service_id = cs.service_id JOIN customers c ON cs.customer_id = c.customer_id JOIN customer_interactions ci ON ci.customer_id = c.customer_id AND ci.service_id = s.service_id WHERE c.customer_details = 'Hardy Kutch' AND ci.status_code = 'bad'
SELECT DISTINCT S.service_details FROM services S JOIN customer_interactions CI ON S.service_id = CI.service_id JOIN channels C ON CI.channel_id = C.channel_id WHERE C.channel_details = '15 ij'
SELECT DISTINCT S.service_details FROM services S JOIN customer_interactions CI ON S.service_id = CI.service_id JOIN channels C ON CI.channel_id = C.channel_id WHERE C.channel_details = '15 ij'
SELECT cu.* FROM customers cu JOIN customer_interactions ci ON cu.customer_id = ci.customer_id JOIN services s ON ci.service_id = s.service_id JOIN channels ch ON ci.channel_id = ch.channel_id WHERE ci.status_code = 'Stuck' AND s.service_details = 'bad' AND ch.channel_details = 'bad'
SELECT DISTINCT cus.customer_details FROM customers cus JOIN customer_interactions ci ON cus.customer_id = ci.customer_id WHERE ci.status_code = 'Stuck' AND ci.services_and_channels_details = 'bad'
SELECT COUNT(DISTINCT integration_platform.integration_platform_id) FROM integration_platform JOIN customer_interactions ON integration_platform.customer_interaction_id = customer_interactions.customer_interaction_id WHERE customer_interactions.status_code = 'successful'
SELECT COUNT(*) FROM integration_platform WHERE integration_platform_details LIKE '%Success%'
SELECT DISTINCT cust.customer_details FROM customers cust JOIN customer_interactions ci ON ci.customer_id = cust.customer_id JOIN integration_platform ip ON ip.customer_interaction_id = ci.customer_interaction_id WHERE ip.integration_platform_details = 'failed'
SELECT DISTINCT Cust.customer_details FROM customers Cust INNER JOIN customer_interactions CI ON Cust.customer_id = CI.customer_id INNER JOIN integration_platform IP ON CI.customer_interaction_id = IP.customer_interaction_id WHERE IP.integration_platform_details = 'Fail'
SELECT * FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)
SELECT service_details FROM services WHERE service_id NOT IN (SELECT service_id FROM customers_and_services)
SELECT analytical_layer_type_code, COUNT(*) AS usage_count FROM analytical_layer GROUP BY analytical_layer_type_code
SELECT analytical_layer_type_code, COUNT(*) FROM analytical_layer GROUP BY analytical_layer_type_code
SELECT S.service_details FROM services S JOIN customers_and_services CS ON S.service_id = CS.service_id WHERE CS.customers_and_services_details = 'Unsatisfied'
SELECT s.service_details FROM services s JOIN customers_and_services cs ON s.service_id = cs.service_id WHERE cs.customers_and_services_details = 'Unsatisfied'
SELECT COUNT(*) FROM vehicles
SELECT COUNT(*) FROM vehicles
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT name FROM vehicles ORDER BY model_year DESC
SELECT DISTINCT type_of_powertrain FROM vehicles;
SELECT DISTINCT type_of_powertrain FROM vehicles;
SELECT name, type_of_powertrain, annual_fuel_cost FROM vehicles WHERE model_year IN (2013, 2014)
SELECT name, type_of_powertrain, annual_fuel_cost FROM vehicles WHERE model_year IN (2013, 2014)
SELECT DISTINCT type_of_powertrain FROM vehicles WHERE model_year IN (2013, 2014) AND type_of_powertrain IN (SELECT type_of_powertrain FROM vehicles WHERE model_year IN (2013, 2014) GROUP BY type_of_powertrain HAVING COUNT(DISTINCT model_year) > 1)
SELECT DISTINCT v.type_of_powertrain FROM vehicles v JOIN renting_history rh ON v.id = rh.vehicles_id WHERE v.model_year IN (2013, 2014) GROUP BY v.type_of_powertrain HAVING COUNT(DISTINCT v.model_year) = 2
SELECT type_of_powertrain, COUNT(id) FROM vehicles GROUP BY type_of_powertrain
SELECT type_of_powertrain, COUNT(id) FROM vehicles GROUP BY type_of_powertrain
SELECT type_of_powertrain FROM vehicles GROUP BY type_of_powertrain ORDER BY COUNT(id) DESC LIMIT 1
SELECT type_of_powertrain FROM vehicles GROUP BY type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(annual_fuel_cost), MAX(annual_fuel_cost), AVG(annual_fuel_cost) FROM vehicles
SELECT MIN(annual_fuel_cost), MAX(annual_fuel_cost), AVG(annual_fuel_cost) FROM vehicles;
SELECT name, model_year FROM vehicles WHERE city_fuel_economy_rate <= highway_fuel_economy_rate
SELECT name, model_year FROM vehicles WHERE city_fuel_economy_rate <= highway_fuel_economy_rate
SELECT v.type_of_powertrain, AVG(v.annual_fuel_cost) AS average_fuel_cost FROM vehicles v GROUP BY v.type_of_powertrain HAVING COUNT(v.id) >= 2
SELECT type_of_powertrain, AVG(annual_fuel_cost) FROM vehicles GROUP BY type_of_powertrain HAVING COUNT(id) >= 2
SELECT name, age, membership_credit FROM customers
SELECT name, age, membership_credit FROM customers
SELECT name, age FROM customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM customers)
SELECT c.name, c.age FROM customers c ORDER BY c.membership_credit DESC LIMIT 1
SELECT AVG(customers.age) FROM customers WHERE customers.membership_credit > (SELECT AVG(membership_credit) FROM customers)
SELECT AVG(customers.age) FROM customers WHERE customers.membership_credit > (SELECT AVG(membership_credit) FROM customers)
SELECT * FROM discount
SELECT * FROM discount
SELECT vehicles.name, SUM(renting_history.total_hours) FROM vehicles JOIN renting_history ON vehicles.id = renting_history.vehicles_id GROUP BY vehicles.name
SELECT vehicles.name, SUM(renting_history.total_hours) AS total_hours FROM vehicles JOIN renting_history ON vehicles.id = renting_history.vehicles_id GROUP BY vehicles.id
SELECT v.name FROM vehicles v WHERE NOT EXISTS (SELECT * FROM renting_history rh WHERE rh.vehicles_id = v.id)
SELECT name FROM vehicles WHERE id NOT IN (SELECT vehicles_id FROM renting_history)
SELECT name FROM customers WHERE id IN (SELECT customer_id FROM renting_history GROUP BY customer_id HAVING COUNT(*) >= 2)
SELECT name FROM customers WHERE id IN (SELECT customer_id FROM renting_history GROUP BY customer_id HAVING COUNT(id) >= 2)
SELECT v.name, v.model_year FROM vehicles v WHERE v.id = (SELECT rh.vehicles_id FROM renting_history rh GROUP BY rh.vehicles_id ORDER BY COUNT(rh.id) DESC LIMIT 1)
SELECT v.name, v.model_year FROM vehicles v JOIN renting_history rh ON v.id = rh.vehicles_id GROUP BY v.id ORDER BY COUNT(rh.id) DESC LIMIT 1
SELECT vehicles.name FROM vehicles JOIN renting_history ON vehicles.id = renting_history.vehicles_id GROUP BY vehicles.id ORDER BY SUM(renting_history.total_hours) DESC
SELECT vehicles.name FROM vehicles JOIN renting_history ON vehicles.id = renting_history.vehicles_id GROUP BY vehicles.name ORDER BY SUM(renting_history.total_hours) DESC
SELECT d.name FROM discount d JOIN renting_history rh ON d.id = rh.discount_id GROUP BY d.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT discount.name FROM discount JOIN renting_history ON discount.id = renting_history.discount_id GROUP BY discount.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT V.name, V.type_of_powertrain FROM vehicles V JOIN renting_history RH ON V.id = RH.vehicles_id WHERE RH.total_hours > 30
SELECT V.name, V.type_of_powertrain FROM vehicles V WHERE V.id IN (SELECT R.vehicles_id FROM renting_history R GROUP BY R.vehicles_id HAVING SUM(R.total_hours) > 30)
SELECT type_of_powertrain, AVG(city_fuel_economy_rate) AS avg_city_fuel, AVG(highway_fuel_economy_rate) AS avg_highway_fuel FROM vehicles GROUP BY type_of_powertrain
SELECT type_of_powertrain, AVG(city_fuel_economy_rate) AS avg_city_rate, AVG(highway_fuel_economy_rate) AS avg_highway_rate FROM vehicles GROUP BY type_of_powertrain
SELECT AVG(amount_of_loan) FROM student_loans
SELECT AVG(amount_of_loan) FROM student_loans
SELECT s.student_id, s.bio_data FROM students s WHERE s.student_id IN (SELECT c.student_id FROM classes c GROUP BY c.student_id HAVING COUNT(*) >= 2) AND s.student_id NOT IN (SELECT d.student_id FROM detention d GROUP BY d.student_id HAVING COUNT(*) >= 2)
SELECT s.student_id, s.bio_data FROM students s WHERE (SELECT COUNT(*) FROM classes c WHERE c.student_id = s.student_id) >= 2 OR (SELECT COUNT(*) FROM detention d WHERE d.student_id = s.student_id) < 2
SELECT DISTINCT teacher_details FROM teachers WHERE teacher_id IN (SELECT teacher_id FROM classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM classes WHERE class_details LIKE 'net%')
SELECT DISTINCT t.teacher_details FROM teachers t JOIN classes c ON t.teacher_id = c.teacher_id WHERE c.class_details LIKE '%data%' AND t.teacher_id NOT IN (SELECT teacher_id FROM classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM students WHERE student_id NOT IN (SELECT student_id FROM detention) AND student_id NOT IN (SELECT student_id FROM student_loans)
SELECT bio_data FROM students WHERE student_id NOT IN (SELECT student_id FROM detention) AND student_id NOT IN (SELECT student_id FROM student_loans)
SELECT sl.date_of_loan, sl.amount_of_loan FROM student_loans sl JOIN students s ON sl.student_id = s.student_id WHERE sl.student_id IN (SELECT a.student_id FROM achievements a GROUP BY a.student_id HAVING COUNT(a.achievement_id) >= 2)
SELECT amount_of_loan, date_of_loan FROM student_loans WHERE student_id IN (SELECT student_id FROM achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2)
SELECT teacher_details, teacher_id FROM teachers WHERE teacher_id = (SELECT teacher_id FROM classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1)
SELECT T.teacher_details, T.teacher_id FROM teachers T JOIN classes C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id ORDER BY COUNT(DISTINCT C.class_id) DESC LIMIT 1
SELECT DISTINCT rt.detention_type_description FROM detention d JOIN ref_detention_type rt ON d.detention_type_code = rt.detention_type_code
SELECT DISTINCT ref_detention_type.detention_type_description FROM detention JOIN ref_detention_type ON detention.detention_type_code = ref_detention_type.detention_type_code
SELECT s.student_details, r.address_type_description FROM students s JOIN students_addresses sa ON s.student_id = sa.student_id JOIN ref_address_types r ON sa.address_type_code = r.address_type_code
SELECT s.student_details, r.address_type_description FROM students s JOIN students_addresses sa ON s.student_id = sa.student_id JOIN ref_address_types r ON sa.address_type_code = r.address_type_code
SELECT a.address_details, s.bio_data FROM addresses a JOIN students_addresses sa ON a.address_id = sa.address_id JOIN students s ON sa.student_id = s.student_id
SELECT bio_data, address_details FROM students JOIN students_addresses ON students.student_id = students_addresses.student_id JOIN addresses ON students_addresses.address_id = addresses.address_id
SELECT students.bio_data, transcripts.date_of_transcript FROM students JOIN transcripts ON students.student_id = transcripts.student_id
SELECT bio_data, date_of_transcript FROM students JOIN transcripts ON students.student_id = transcripts.student_id
SELECT COUNT(DISTINCT bm.student_id) AS student_count, bm.behaviour_monitoring_details FROM behaviour_monitoring bm GROUP BY bm.behaviour_monitoring_details ORDER BY COUNT(bm.student_id) DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM behaviour_monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT b.student_id FROM behaviour_monitoring b GROUP BY b.behaviour_monitoring_details HAVING COUNT(b.behaviour_monitoring_details) = 3 AND COUNT(b.behaviour_monitoring_details) = (SELECT MAX(c.cnt) FROM (SELECT COUNT(*) as cnt FROM behaviour_monitoring GROUP BY behaviour_monitoring_details) c))
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT b.student_id FROM behaviour_monitoring b GROUP BY b.student_id HAVING COUNT(b.student_id) = 3 AND COUNT(*) = (SELECT COUNT(*) FROM (SELECT student_id FROM behaviour_monitoring GROUP BY student_id HAVING COUNT(student_id) IN (3)) AS x))
SELECT s.bio_data FROM students s JOIN behaviour_monitoring bm ON s.student_id = bm.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1 AND bm.behaviour_monitoring_details = (SELECT bm2.behaviour_monitoring_details FROM behaviour_monitoring bm2 GROUP BY bm2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT bm.student_id FROM behaviour_monitoring bm GROUP BY bm.behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(sub.cnt) FROM (SELECT COUNT(*) AS cnt FROM behaviour_monitoring GROUP BY behaviour_monitoring_details) sub))
SELECT s.bio_data, se.event_date FROM students AS s JOIN student_events AS se ON s.student_id = se.student_id
SELECT students.bio_data, student_events.event_date FROM students JOIN student_events ON students.student_id = student_events.student_id
SELECT COUNT(DISTINCT student_id), E.event_type_code, R.event_type_description FROM student_events E JOIN ref_event_types R ON E.event_type_code = R.event_type_code WHERE E.event_type_code = (SELECT event_type_code FROM student_events GROUP BY event_type_code ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY E.event_type_code, R.event_type_description
SELECT sub.event_type_code, e.event_type_description, sub.num_students FROM (SELECT event_type_code, COUNT(DISTINCT student_id) as num_students FROM student_events GROUP BY event_type_code ORDER BY num_students DESC LIMIT 1) sub JOIN ref_event_types e ON sub.event_type_code = e.event_type_code
SELECT a.achievement_details, r.achievement_type_description FROM achievements a JOIN ref_achievement_type r ON a.achievement_type_code = r.achievement_type_code
SELECT a.achievement_details, r.achievement_type_description FROM achievements a JOIN ref_achievement_type r ON a.achievement_type_code = r.achievement_type_code
SELECT COUNT(DISTINCT t.teacher_id) FROM teachers t JOIN students s ON t.teacher_id = s.student_id LEFT JOIN achievements a ON s.student_id = a.student_id WHERE a.achievement_id IS NULL
SELECT COUNT(DISTINCT t.teacher_id) FROM teachers t JOIN classes c ON t.teacher_id = c.teacher_id LEFT JOIN achievements a ON c.student_id = a.student_id WHERE a.student_id IS NULL
SELECT date_of_transcript, transcript_details FROM transcripts
SELECT date_of_transcript, transcript_details FROM transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM achievements
SELECT a.achievement_type_code, a.achievement_details, a.date_achievement FROM achievements a
SELECT datetime_detention_start, datetime_detention_end FROM detention
SELECT datetime_detention_start, datetime_detention_end FROM detention;
SELECT bio_data FROM students WHERE student_details LIKE '%Suite%'
SELECT s.bio_data FROM students s WHERE s.student_details LIKE '%Suite%'
SELECT teachers.teacher_details, students.bio_data FROM teachers JOIN classes ON teachers.teacher_id = classes.teacher_id JOIN students ON classes.student_id = students.student_id
SELECT teachers.teacher_details, students.student_details FROM teachers INNER JOIN classes ON teachers.teacher_id = classes.teacher_id INNER JOIN students ON classes.student_id = students.student_id
SELECT MAX(course_count) AS max_courses, teacher_id FROM (SELECT teacher_id, COUNT(DISTINCT class_id) AS course_count FROM classes GROUP BY teacher_id) GROUP BY teacher_id ORDER BY max_courses DESC LIMIT 1;
SELECT teacher_id, COUNT(class_id) AS num_courses FROM classes GROUP BY teacher_id ORDER BY num_courses DESC LIMIT 1
SELECT student_id, COUNT(class_id) AS num_courses FROM classes GROUP BY student_id ORDER BY num_courses DESC LIMIT 1
SELECT student_id, COUNT(*) as course_count FROM classes GROUP BY student_id ORDER BY course_count DESC LIMIT 1
SELECT s.student_id, s.student_details FROM students s JOIN classes c ON s.student_id = c.student_id GROUP BY s.student_id HAVING COUNT(c.class_id) = 2
SELECT s.student_id, s.student_details FROM students s JOIN classes c ON s.student_id = c.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT c.class_id) = 2
SELECT r.detention_type_code, r.detention_type_description FROM ref_detention_type r WHERE r.detention_type_code = (SELECT d.detention_type_code FROM detention d GROUP BY d.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT r.detention_type_code, r.detention_type_description FROM ref_detention_type r JOIN (SELECT detention_type_code, COUNT(*) as freq FROM detention GROUP BY detention_type_code ORDER BY freq ASC LIMIT 1) x ON r.detention_type_code = x.detention_type_code
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT sl.student_id FROM student_loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM student_loans))
SELECT s.bio_data, s.student_details FROM students s WHERE s.student_id IN (SELECT sl.student_id FROM student_loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM student_loans))
SELECT MIN(date_of_loan) FROM student_loans
SELECT MIN(date_of_loan) FROM student_loans
SELECT s.bio_data FROM students s JOIN student_loans sl ON s.student_id = sl.student_id WHERE sl.amount_of_loan = (SELECT MIN(amount_of_loan) FROM student_loans)
SELECT s.bio_data FROM students s JOIN student_loans sl ON s.student_id = sl.student_id ORDER BY sl.amount_of_loan ASC LIMIT 1
SELECT date_of_transcript FROM transcripts WHERE student_id = (SELECT student_id FROM student_loans ORDER BY amount_of_loan DESC LIMIT 1)
SELECT date_of_transcript FROM transcripts WHERE student_id = (SELECT student_id FROM student_loans ORDER BY amount_of_loan DESC LIMIT 1)
SELECT teacher_details FROM teachers WHERE teacher_id IN (SELECT teacher_id FROM transcripts WHERE student_id = (SELECT student_id FROM transcripts ORDER BY date_of_transcript ASC LIMIT 1))
SELECT teacher_details FROM teachers WHERE teacher_id IN (SELECT teacher_id FROM classes WHERE student_id = (SELECT student_id FROM transcripts ORDER BY date_of_transcript ASC LIMIT 1))
SELECT student_loans.student_id, SUM(amount_of_loan) AS total_loan_amount FROM student_loans GROUP BY student_loans.student_id
SELECT s.student_id, SUM(sl.amount_of_loan) FROM students s JOIN student_loans sl ON s.student_id = sl.student_id GROUP BY s.student_id
SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS course_count FROM students s JOIN classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.bio_data
SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS num_courses FROM students s JOIN classes c ON s.student_id = c.student_id GROUP BY s.student_id
SELECT COUNT(DISTINCT student_id) FROM detention;
SELECT COUNT(DISTINCT student_id) FROM detention
SELECT r.address_type_code, r.address_type_description FROM ref_address_types r JOIN students_addresses s ON r.address_type_code = s.address_type_code GROUP BY s.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.address_type_code, r.address_type_description FROM ref_address_types r JOIN (SELECT address_type_code, COUNT(*) as cnt FROM students_addresses GROUP BY address_type_code ORDER BY cnt DESC LIMIT 1) s ON r.address_type_code = s.address_type_code
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT student_id FROM student_events) AND s.student_id NOT IN (SELECT student_id FROM student_loans)
SELECT s.bio_data FROM students s WHERE s.student_id IN (SELECT student_id FROM student_events) AND s.student_id NOT IN (SELECT student_id FROM student_loans)
SELECT sa.date_from, sa.date_to FROM students_addresses sa JOIN students s ON s.student_id = sa.student_id WHERE EXISTS (SELECT 1 FROM transcripts t WHERE t.student_id = s.student_id GROUP BY t.student_id HAVING COUNT(*) = 2)
SELECT SA.date_from, SA.date_to FROM students_addresses SA WHERE SA.student_id IN (SELECT T.student_id FROM transcripts T GROUP BY T.student_id HAVING COUNT(T.transcript_id) = 2)
SELECT datetime_detention_start FROM detention
SELECT datetime_detention_start FROM detention
SELECT DISTINCT name FROM author
SELECT name FROM author
SELECT name, address FROM client
SELECT name, address FROM client
SELECT title, isbn, saleprice FROM book
SELECT title, isbn, saleprice FROM book
SELECT COUNT(*) FROM book
SELECT COUNT(*) FROM book
SELECT COUNT(DISTINCT idauthor) FROM author
SELECT COUNT(DISTINCT idauthor) FROM author
SELECT COUNT(*) FROM client
SELECT COUNT(*) FROM client
SELECT name, address FROM client ORDER BY name ASC;
SELECT name, address FROM client ORDER BY name ASC
SELECT b.title, a.name FROM book b JOIN author_book ab ON ab.isbn = b.isbn JOIN author a ON a.idauthor = ab.author
SELECT book.title, author.name FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor
SELECT orders.idorder, client.name FROM orders JOIN client ON orders.idclient = client.idclient
SELECT orders.idorder, client.name FROM orders JOIN client ON orders.idclient = client.idclient
SELECT a.name, COUNT(ab.isbn) AS NumberOfBooks FROM author a JOIN author_book ab ON a.idauthor = ab.author GROUP BY a.idauthor
SELECT a.name, COUNT(ab.isbn) FROM author a JOIN author_book ab ON a.idauthor = ab.author GROUP BY a.idauthor
SELECT b.isbn, COUNT(o.idorder) FROM book b JOIN books_order bo ON b.isbn = bo.isbn JOIN orders o ON o.idorder = bo.idorder GROUP BY b.isbn
SELECT book.isbn, COUNT(books_order.isbn) AS order_count FROM book LEFT JOIN books_order ON book.isbn = books_order.isbn GROUP BY book.isbn
SELECT books_order.isbn, SUM(books_order.amount) AS total_amount FROM books_order GROUP BY books_order.isbn
SELECT b.isbn, SUM(bo.amount) AS total_amount FROM book b LEFT JOIN books_order bo ON b.isbn = bo.isbn GROUP BY b.isbn
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM books_order GROUP BY isbn ORDER BY COUNT(isbn) DESC LIMIT 1)
SELECT title FROM book WHERE isbn = (SELECT isbn FROM books_order GROUP BY isbn ORDER BY SUM(amount) DESC LIMIT 1)
SELECT book.title, book.purchaseprice FROM book JOIN books_order ON book.isbn = books_order.isbn ORDER BY books_order.amount DESC LIMIT 1
SELECT book.title, book.purchaseprice FROM book WHERE book.isbn = (SELECT isbn FROM books_order GROUP BY isbn ORDER BY SUM(amount) DESC LIMIT 1)
SELECT DISTINCT book.title FROM book JOIN books_order ON book.isbn = books_order.isbn;
SELECT DISTINCT book.title FROM book JOIN books_order ON book.isbn = books_order.isbn
SELECT DISTINCT client.name FROM client JOIN orders ON client.idclient = orders.idclient;
SELECT DISTINCT client.name FROM client JOIN orders ON client.idclient = orders.idclient
SELECT client.name, COUNT(orders.idorder) FROM client JOIN orders ON client.idclient = orders.idclient GROUP BY client.name
SELECT c.name, COUNT(o.idorder) FROM client c JOIN orders o ON c.idclient = o.idclient GROUP BY c.name
SELECT name FROM client WHERE idclient = (SELECT idclient FROM orders GROUP BY idclient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM client WHERE idclient = (SELECT idclient FROM orders GROUP BY idclient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT c.name, SUM(bo.amount) FROM client c JOIN orders o ON c.idclient = o.idclient JOIN books_order bo ON o.idorder = bo.idorder GROUP BY c.name
SELECT client.name, SUM(books_order.amount) AS TotalBooks FROM client JOIN orders ON client.idclient = orders.idclient JOIN books_order ON orders.idorder = books_order.idorder GROUP BY client.name
SELECT c.name FROM client c JOIN orders o ON c.idclient = o.idclient JOIN books_order bo ON o.idorder = bo.idorder GROUP BY c.idclient ORDER BY SUM(bo.amount) DESC LIMIT 1
SELECT client.name FROM client JOIN orders ON client.idclient = orders.idclient JOIN books_order ON orders.idorder = books_order.idorder GROUP BY client.idclient ORDER BY SUM(books_order.amount) DESC LIMIT 1
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT title FROM book WHERE isbn NOT IN (SELECT isbn FROM books_order)
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)
SELECT name FROM client WHERE idclient NOT IN (SELECT idclient FROM orders)
SELECT MAX(saleprice) AS MaxSalePrice, MIN(saleprice) AS MinSalePrice FROM book;
SELECT MAX(saleprice) AS MaxSalePrice, MIN(saleprice) AS MinSalePrice FROM book
SELECT AVG(purchaseprice) AS AvgPurchasePrice, AVG(saleprice) AS AvgSalePrice FROM book
SELECT AVG(purchaseprice) AS AveragePurchasePrice, AVG(saleprice) AS AverageSalePrice FROM book
SELECT MAX(saleprice - purchaseprice) FROM book
SELECT MAX(saleprice - purchaseprice) FROM book
SELECT title FROM book WHERE saleprice > (SELECT AVG(saleprice) FROM book)
SELECT book.title FROM book WHERE book.saleprice > (SELECT AVG(book.saleprice) FROM book);
SELECT title FROM book WHERE saleprice = (SELECT MIN(saleprice) FROM book)
SELECT title FROM book WHERE saleprice = (SELECT MIN(saleprice) FROM book)
SELECT title FROM book WHERE purchaseprice = (SELECT MAX(purchaseprice) FROM book)
SELECT title FROM book WHERE purchaseprice = (SELECT MAX(purchaseprice) FROM book)
SELECT AVG(b.saleprice) FROM book b JOIN author_book ab ON b.isbn = ab.isbn JOIN author a ON ab.author = a.idauthor WHERE a.name = 'George Orwell'
SELECT AVG(B.saleprice) FROM book B JOIN author_book AB ON B.isbn = AB.isbn JOIN author A ON AB.author = A.idauthor WHERE A.name = 'George Orwell'
SELECT b.saleprice FROM book b JOIN author_book ab ON b.isbn = ab.isbn JOIN author a ON ab.author = a.idauthor WHERE a.name = 'Plato'
SELECT book.saleprice FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name = 'Plato'
SELECT B.title FROM book B JOIN author_book AB ON B.isbn = AB.isbn JOIN author A ON AB.author = A.idauthor WHERE A.name = 'George Orwell' ORDER BY B.saleprice LIMIT 1
SELECT b.title FROM book b JOIN author_book ab ON b.isbn = ab.isbn JOIN author a ON a.idauthor = ab.author WHERE a.name = 'George Orwell' ORDER BY b.saleprice LIMIT 1
SELECT b.title FROM book b JOIN author_book ab ON b.isbn = ab.isbn JOIN author a ON ab.author = a.idauthor WHERE a.name = 'Plato' AND b.saleprice < (SELECT AVG(saleprice) FROM book)
SELECT B.title FROM book B JOIN author_book AB ON B.isbn = AB.isbn JOIN author A ON AB.author = A.idauthor WHERE A.name = 'Plato' AND B.saleprice < (SELECT AVG(saleprice) FROM book)
SELECT a.name FROM author a JOIN author_book ab ON a.idauthor = ab.author JOIN book b ON ab.isbn = b.isbn WHERE b.title = 'Pride and Prejudice'
SELECT a.name FROM author a JOIN author_book ab ON a.idauthor = ab.author JOIN book b ON ab.isbn = b.isbn WHERE b.title = 'Pride and Prejudice'
SELECT title FROM book WHERE isbn IN (SELECT isbn FROM author_book WHERE author IN (SELECT idauthor FROM author WHERE name LIKE '%Plato%'))
SELECT book.title FROM book JOIN author_book ON book.isbn = author_book.isbn JOIN author ON author_book.author = author.idauthor WHERE author.name LIKE '%Plato%'
SELECT COUNT(DISTINCT orders.idorder) FROM book JOIN books_order ON book.isbn = books_order.isbn JOIN orders ON books_order.idorder = orders.idorder WHERE book.title = 'Pride and Prejudice'
SELECT COUNT(o.idorder) FROM orders o JOIN books_order bo ON o.idorder = bo.idorder JOIN book b ON bo.isbn = b.isbn WHERE b.title = 'Pride and Prejudice'
SELECT o.idorder FROM orders o JOIN books_order bo ON o.idorder = bo.idorder JOIN book b ON bo.isbn = b.isbn WHERE b.title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.idorder HAVING COUNT(DISTINCT b.title) = 2
SELECT o1.idorder FROM orders o1 JOIN books_order bo1 ON o1.idorder = bo1.idorder JOIN book b1 ON bo1.isbn = b1.isbn WHERE b1.title = 'Pride and Prejudice' AND EXISTS (SELECT 1 FROM books_order bo2 JOIN book b2 ON bo2.isbn = b2.isbn WHERE b2.title = 'The Little Prince' AND bo2.idorder = o1.idorder)
SELECT DISTINCT B.isbn FROM book B JOIN orders O ON O.idorder = B.isbn JOIN client C ON C.idclient = O.idclient WHERE C.name IN ('James Smith', 'Peter Doe') GROUP BY B.isbn HAVING COUNT(DISTINCT C.name) = 2
SELECT DISTINCT B.isbn FROM book B JOIN orders O ON B.isbn = O.idorder JOIN client C ON O.idclient = C.idclient WHERE C.name IN ('James Smith', 'Peter Doe') GROUP BY B.isbn HAVING COUNT(DISTINCT C.name) = 2
SELECT bo.title FROM book bo JOIN orders o ON bo.isbn = o.idorder JOIN client c ON c.idclient = o.idclient WHERE c.name = 'Peter Doe' AND bo.title NOT IN (SELECT b.title FROM book b JOIN orders o ON b.isbn = o.idorder JOIN client cl ON cl.idclient = o.idclient WHERE cl.name = 'James Smith')
SELECT DISTINCT book.title FROM book JOIN orders ON orders.idorder IN (SELECT orders.idorder FROM orders JOIN client ON orders.idclient = client.idclient WHERE client.name = 'Peter Doe') AND book.isbn NOT IN (SELECT book.isbn FROM book JOIN orders ON orders.idorder IN (SELECT orders.idorder FROM orders JOIN client ON orders.idclient = client.idclient WHERE client.name = 'James Smith'))
SELECT client.name FROM client JOIN orders ON client.idclient = orders.idclient JOIN book ON book.title = 'Pride and Prejudice' WHERE orders.idorder = book.isbn
SELECT DISTINCT c.name FROM client c JOIN orders o ON c.idclient = o.idclient JOIN book b ON b.title = 'Pride and Prejudice' WHERE b.isbn IN (SELECT isbn FROM orders WHERE idclient = o.idclient)
SELECT COUNT(*) FROM book
SELECT title FROM book ORDER BY title ASC
SELECT title FROM book ORDER BY pages DESC
SELECT type, release FROM book;
SELECT book.title, MAX(book.chapters) as max_chapters, MIN(book.chapters) as min_chapters FROM book GROUP BY book.book_id
SELECT title FROM book WHERE type != 'Poet'
SELECT AVG(rating) FROM review
SELECT book.title, review.rating FROM book JOIN review ON book.book_id = review.book_id
SELECT r.rating FROM review r JOIN book b ON r.book_id = b.book_id WHERE b.chapters = (SELECT MAX(chapters) FROM book)
SELECT r.rank FROM review r JOIN book b ON r.book_id = b.book_id WHERE b.pages = (SELECT MIN(pages) FROM book)
SELECT title FROM book WHERE book_id = (SELECT book_id FROM review ORDER BY rank DESC LIMIT 1)
SELECT AVG(R.readers_in_million) FROM review R JOIN book B ON R.book_id = B.book_id WHERE B.type = 'Novel'
SELECT type, COUNT(book_id) AS number_of_books FROM book GROUP BY type
SELECT type FROM book GROUP BY type ORDER BY COUNT(*) DESC LIMIT 1
SELECT type FROM book GROUP BY type HAVING COUNT(book_id) >= 3
SELECT B.title FROM book B JOIN review R ON B.book_id = R.book_id ORDER BY R.rating ASC;
SELECT book.title, book.audio FROM book JOIN review ON book.book_id = review.book_id GROUP BY book.title, book.audio ORDER BY SUM(review.readers_in_million) DESC
SELECT COUNT(*) FROM book WHERE book_id NOT IN (SELECT book_id FROM review)
SELECT DISTINCT b1.type FROM book b1 JOIN book b2 ON b1.type = b2.type WHERE b1.chapters > 75 AND b2.chapters < 50
SELECT COUNT(DISTINCT type) FROM book
SELECT book.type, book.title FROM book LEFT JOIN review ON book.book_id = review.book_id WHERE review.rating IS NULL
SELECT COUNT(*) FROM customer
SELECT COUNT(*) FROM customer
SELECT name FROM customer ORDER BY level_of_membership ASC
SELECT name FROM customer ORDER BY level_of_membership ASC
SELECT nationality, card_credit FROM customer
SELECT nationality, card_credit FROM customer
SELECT name FROM customer WHERE nationality IN ('Australia', 'England')
SELECT name FROM customer WHERE nationality IN ('Australia', 'England')
SELECT AVG(card_credit) FROM customer WHERE level_of_membership > 1
SELECT AVG(card_credit) FROM customer WHERE level_of_membership > 1;
SELECT card_credit FROM customer WHERE level_of_membership = (SELECT MAX(level_of_membership) FROM customer);
SELECT card_credit FROM customer WHERE level_of_membership = (SELECT MAX(level_of_membership) FROM customer);
SELECT nationality, COUNT(customer_id) as num_customers FROM customer GROUP BY nationality
SELECT nationality, COUNT(customer_id) FROM customer GROUP BY nationality
SELECT nationality FROM customer GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT nationality FROM customer GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT c1.nationality FROM customer c1 WHERE EXISTS (SELECT 1 FROM customer c2 WHERE c2.nationality = c1.nationality AND c2.card_credit < 50) AND EXISTS (SELECT 1 FROM customer c3 WHERE c3.nationality = c1.nationality AND c3.card_credit > 75)
SELECT DISTINCT c1.nationality FROM customer c1 JOIN customer c2 ON c1.nationality = c2.nationality WHERE c1.card_credit > 50 AND c2.card_credit < 75
SELECT customer.name, customer_order.dish_name FROM customer JOIN customer_order ON customer.customer_id = customer_order.customer_id
SELECT customer.name, customer_order.dish_name FROM customer_order JOIN customer ON customer_order.customer_id = customer.customer_id
SELECT customer.name, customer_order.dish_name FROM customer_order INNER JOIN customer ON customer_order.customer_id = customer.customer_id ORDER BY customer_order.quantity DESC
SELECT c.name, co.dish_name FROM customer c INNER JOIN customer_order co ON c.customer_id = co.customer_id ORDER BY co.quantity DESC
SELECT name, SUM(quantity) AS total_quantity FROM customer JOIN customer_order ON customer.customer_id = customer_order.customer_id GROUP BY customer.customer_id
SELECT customer.name, SUM(customer_order.quantity) FROM customer_order JOIN customer ON customer_order.customer_id = customer.customer_id GROUP BY customer_order.customer_id
SELECT c.customer_id, c.name FROM customer c JOIN customer_order co ON c.customer_id = co.customer_id GROUP BY c.customer_id HAVING SUM(co.quantity) > 1
SELECT c.name FROM customer c WHERE c.customer_id IN (SELECT co.customer_id FROM customer_order co GROUP BY co.customer_id HAVING SUM(co.quantity) > 1)
SELECT DISTINCT manager FROM branch
SELECT DISTINCT manager FROM branch
SELECT name FROM customer WHERE customer_id NOT IN (SELECT customer_id FROM customer_order)
SELECT name FROM customer WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM customer_order)
SELECT COUNT(member_id) FROM member
SELECT name FROM member ORDER BY age ASC
SELECT name, nationality FROM member
SELECT name FROM member WHERE nationality != 'England'
SELECT name FROM member WHERE age IN (19, 20)
SELECT name FROM member WHERE age = (SELECT MAX(age) FROM member)
SELECT nationality, COUNT(member_id) AS count FROM member GROUP BY nationality
SELECT nationality FROM member GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT nationality FROM member GROUP BY nationality HAVING COUNT(member_id) >= 2
SELECT m.name, c.club_name FROM club_leader cl JOIN member m ON cl.member_id = m.member_id JOIN club c ON cl.club_id = c.club_id
SELECT member.name FROM member JOIN club_leader ON member.member_id = club_leader.member_id JOIN club ON club_leader.club_id = club.club_id WHERE club.overall_ranking > 100
SELECT m.name FROM member m JOIN club_leader cl ON m.member_id = cl.member_id WHERE cl.year_join < 2018
SELECT m.name FROM member m JOIN club_leader cl ON m.member_id = cl.member_id JOIN club c ON cl.club_id = c.club_id WHERE c.club_name = 'Houston'
SELECT name FROM member WHERE member_id NOT IN (SELECT member_id FROM club_leader)
SELECT DISTINCT nationality FROM member AS m1 WHERE EXISTS (SELECT 1 FROM member AS m2 WHERE m2.age > 22 AND m2.nationality = m1.nationality) AND EXISTS (SELECT 1 FROM member AS m3 WHERE m3.age < 19 AND m3.nationality = m1.nationality)
SELECT AVG(m.age) AS avg_age FROM member m JOIN club_leader cl ON m.member_id = cl.member_id
SELECT club_name FROM club WHERE club_name LIKE '%state%'
SELECT collection_subset_name FROM collection_subsets
SELECT collection_subset_name FROM collection_subsets
SELECT collecrtion_subset_details FROM collection_subsets WHERE collection_subset_name = 'Top collection'
SELECT c.collection_name, c.collection_description FROM collections c JOIN collection_subset_members m ON m.collection_id = c.collection_id JOIN collection_subsets s ON s.collection_subset_id = m.collection_subset_id WHERE s.collection_subset_name = 'Top collection'
SELECT ds.document_subset_name FROM document_subsets ds;
SELECT document_subset_name FROM document_subsets
SELECT document_subset_details FROM document_subsets WHERE document_subset_name = 'Best for 2000'
SELECT d.document_subset_details FROM document_subsets d WHERE d.document_subset_name = 'Best for 2000'
SELECT document_object_id FROM document_objects
SELECT document_object_id FROM document_objects;
SELECT parent_document_object_id FROM document_objects WHERE owner = 'Marlin' AND parent_document_object_id IS NOT NULL
SELECT document_object_id FROM document_objects WHERE owner = 'Marlin'
SELECT owner FROM document_objects WHERE description = 'Braeden Collection'
SELECT owner FROM document_objects WHERE description = 'Braeden Collection'
SELECT parent.owner FROM document_objects AS child JOIN document_objects AS parent ON child.parent_document_object_id = parent.document_object_id WHERE child.owner = 'Marlin'
SELECT do.owner FROM document_objects AS do JOIN document_objects AS child ON do.document_object_id = child.parent_document_object_id WHERE child.owner = 'Marlin'
SELECT DISTINCT parent.description FROM document_objects AS doc INNER JOIN document_objects AS parent ON doc.parent_document_object_id = parent.document_object_id
SELECT DISTINCT d1.description FROM document_objects d1 WHERE EXISTS (SELECT 1 FROM document_objects d2 WHERE d2.parent_document_object_id = d1.document_object_id)
SELECT COUNT(*) FROM document_objects WHERE owner = 'Marlin'
SELECT COUNT(*) FROM document_objects WHERE owner = 'Marlin'
SELECT doc.document_object_id FROM document_objects AS doc WHERE NOT EXISTS (SELECT 1 FROM document_objects AS subdoc WHERE subdoc.parent_document_object_id = doc.document_object_id)
SELECT document_object_id FROM document_objects WHERE document_object_id NOT IN (SELECT parent_document_object_id FROM document_objects WHERE parent_document_object_id IS NOT NULL)
SELECT d.parent_document_object_id, COUNT(d.document_object_id) AS child_count FROM document_objects AS d WHERE d.parent_document_object_id IS NOT NULL GROUP BY d.parent_document_object_id
SELECT parent_document_object_id, COUNT(document_object_id) AS child_count FROM document_objects WHERE parent_document_object_id IS NOT NULL GROUP BY parent_document_object_id;
SELECT collection_name FROM collections;
SELECT collection_name FROM collections;
SELECT collection_description FROM collections WHERE collection_name = 'Best'
SELECT collection_description FROM collections WHERE collection_name = 'Best'
SELECT parent.collection_name FROM collections child JOIN collections parent ON child.parent_collection_id = parent.collection_id WHERE child.collection_name = 'Nice'
SELECT par.collection_name FROM collections child JOIN collections par ON child.parent_collection_id = par.collection_id WHERE child.collection_name = 'Nice'
SELECT collection_name FROM collections WHERE collection_id NOT IN (SELECT parent_collection_id FROM collections WHERE parent_collection_id IS NOT NULL)
SELECT collection_name FROM collections WHERE collection_id NOT IN (SELECT parent_collection_id FROM collections WHERE parent_collection_id IS NOT NULL)
SELECT parent_document_object_id FROM document_objects GROUP BY parent_document_object_id HAVING COUNT(document_object_id) > 1
SELECT parent_document_object_id FROM document_objects GROUP BY parent_document_object_id HAVING COUNT(document_object_id) > 1
SELECT COUNT(DISTINCT collection_id) FROM collections WHERE parent_collection_id IN (SELECT collection_id FROM collections WHERE collection_name = 'Best')
SELECT COUNT(*) FROM collections WHERE parent_collection_id = (SELECT collection_id FROM collections WHERE collection_name = 'Best')
SELECT DISTINCT d.document_object_id FROM document_objects d JOIN document_subset_members dsm ON d.document_object_id = dsm.related_document_object_id JOIN document_objects do ON do.document_object_id = dsm.document_object_id WHERE do.owner = 'Ransom'
SELECT DISTINCT dsm.related_document_object_id FROM document_objects do INNER JOIN document_subset_members dsm ON do.document_object_id = dsm.document_object_id WHERE do.owner = 'Ransom'
SELECT cs.collection_subset_id, cs.collection_subset_name, COUNT(csm.collection_id) AS number_of_collections FROM collection_subsets cs LEFT JOIN collection_subset_members csm ON cs.collection_subset_id = csm.collection_subset_id GROUP BY cs.collection_subset_id, cs.collection_subset_name
SELECT cs.collection_subset_id, cs.collection_subset_name, COUNT(csm.collection_id) AS num_collections FROM collection_subsets cs LEFT JOIN collection_subset_members csm ON cs.collection_subset_id = csm.collection_subset_id GROUP BY cs.collection_subset_id, cs.collection_subset_name
SELECT parent_document_object_id, COUNT(*) AS child_count FROM document_objects WHERE parent_document_object_id IS NOT NULL GROUP BY parent_document_object_id ORDER BY child_count DESC LIMIT 1
SELECT parent.document_object_id, COUNT(child.document_object_id) AS child_count FROM document_objects AS parent LEFT JOIN document_objects AS child ON parent.document_object_id = child.parent_document_object_id GROUP BY parent.document_object_id
SELECT document_object_id, COUNT(related_document_object_id) AS related_count FROM document_subset_members GROUP BY document_object_id ORDER BY related_count ASC LIMIT 1
SELECT document_object_id FROM documents_in_collections GROUP BY document_object_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT doc.document_object_id, COUNT(rel_doc.related_document_object_id) AS RelatedDocCount FROM document_objects AS doc LEFT JOIN document_subset_members AS rel_doc ON doc.document_object_id = rel_doc.document_object_id GROUP BY doc.document_object_id HAVING RelatedDocCount BETWEEN 2 AND 4
SELECT dsm.document_object_id, COUNT(dsm.related_document_object_id) AS related_count FROM document_subset_members dsm GROUP BY dsm.document_object_id HAVING related_count BETWEEN 2 AND 4
SELECT DISTINCT doc.owner FROM document_objects AS doc JOIN document_subset_members AS members ON doc.document_object_id = members.related_document_object_id JOIN document_objects AS parent_doc ON members.document_object_id = parent_doc.document_object_id WHERE parent_doc.owner = 'Braeden'
SELECT DISTINCT do.owner FROM document_objects AS do INNER JOIN document_objects AS braeden_docs ON do.document_object_id = braeden_docs.parent_document_object_id WHERE braeden_docs.owner = 'Braeden'
SELECT DISTINCT document_subsets.document_subset_name FROM document_objects JOIN document_subset_members ON document_objects.document_object_id = document_subset_members.document_object_id JOIN document_subsets ON document_subset_members.document_subset_id = document_subsets.document_subset_id WHERE document_objects.owner = 'Braeden'
SELECT DISTINCT ds.document_subset_name FROM document_objects do JOIN document_subset_members dsm ON do.document_object_id = dsm.document_object_id JOIN document_subsets ds ON ds.document_subset_id = dsm.document_subset_id WHERE do.owner = 'Braeden'
SELECT ds.document_subset_id, ds.document_subset_name, COUNT(DISTINCT dsm.document_object_id) AS num_documents FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id GROUP BY ds.document_subset_id, ds.document_subset_name
SELECT ds.document_subset_id, ds.document_subset_name, COUNT(DISTINCT dmo.document_object_id) FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id JOIN document_objects dmo ON dsm.document_object_id = dmo.document_object_id GROUP BY ds.document_subset_id, ds.document_subset_name
SELECT ds.document_subset_id, ds.document_subset_name, COUNT(DISTINCT dsm.document_object_id) as num_docs FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id GROUP BY ds.document_subset_id, ds.document_subset_name ORDER BY num_docs DESC LIMIT 1
SELECT DS.document_subset_id, DS.document_subset_name, COUNT(DISTINCT DSM.document_object_id) AS document_count FROM document_subsets DS JOIN document_subset_members DSM ON DS.document_subset_id = DSM.document_subset_id GROUP BY DS.document_subset_id, DS.document_subset_name ORDER BY document_count DESC LIMIT 1
SELECT distinct DSM.document_object_id FROM document_subset_members DSM JOIN document_subsets DS ON DSM.document_subset_id = DS.document_subset_id WHERE DS.document_subset_name = 'Best for 2000'
SELECT dsm.related_document_object_id FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id WHERE ds.document_subset_name = 'Best for 2000'
SELECT DS.document_subset_name, DSM.document_object_id FROM document_subset_members DSM JOIN document_subsets DS ON DSM.document_subset_id = DS.document_subset_id
SELECT ds.document_subset_name, dsm.document_object_id FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id
SELECT c.collection_name FROM collections c JOIN documents_in_collections dc ON c.collection_id = dc.collection_id JOIN document_objects d ON dc.document_object_id = d.document_object_id WHERE d.owner = 'Ransom'
SELECT c.collection_name FROM document_objects d INNER JOIN documents_in_collections dc ON d.document_object_id = dc.document_object_id INNER JOIN collections c ON dc.collection_id = c.collection_id WHERE d.owner = 'Ransom'
SELECT document_object_id, COUNT(collection_id) AS collection_count FROM documents_in_collections GROUP BY document_object_id
SELECT doc_obj.document_object_id, COUNT(distinct doc_col.collection_id) FROM document_objects doc_obj JOIN documents_in_collections doc_col ON doc_obj.document_object_id = doc_col.document_object_id GROUP BY doc_obj.document_object_id
SELECT COUNT(doc.document_object_id) FROM document_objects AS doc JOIN documents_in_collections AS doc_col ON doc.document_object_id = doc_col.document_object_id JOIN collections AS col ON col.collection_id = doc_col.collection_id WHERE col.collection_name = 'Best'
SELECT COUNT(doc.document_object_id) FROM collections col JOIN documents_in_collections docinc ON col.collection_id = docinc.collection_id JOIN document_objects doc ON docinc.document_object_id = doc.document_object_id WHERE col.collection_name = 'Best'
SELECT doc.document_object_id FROM document_objects AS doc JOIN documents_in_collections AS dc ON doc.document_object_id = dc.document_object_id JOIN collections AS col ON dc.collection_id = col.collection_id WHERE col.collection_name = 'Best'
SELECT COUNT(DISTINCT doc.document_object_id) FROM documents_in_collections AS doc JOIN collections AS col ON doc.collection_id = col.collection_id WHERE col.collection_name = 'Best'
SELECT collections.collection_name, collections.collection_id, COUNT(documents_in_collections.document_object_id) AS num_documents FROM collections JOIN documents_in_collections ON collections.collection_id = documents_in_collections.collection_id GROUP BY collections.collection_id ORDER BY num_documents DESC LIMIT 1
SELECT collections.collection_name, collections.collection_id, COUNT(documents_in_collections.document_object_id) AS doc_count FROM collections JOIN documents_in_collections ON collections.collection_id = documents_in_collections.collection_id WHERE collections.collection_name = 'Best' GROUP BY collections.collection_id ORDER BY doc_count DESC LIMIT 1
SELECT DISTINCT dsm.document_object_id FROM document_subset_members AS dsm JOIN document_subsets AS ds ON dsm.document_subset_id = ds.document_subset_id JOIN documents_in_collections AS dic ON dsm.document_object_id = dic.document_object_id JOIN collections AS c ON dic.collection_id = c.collection_id WHERE ds.document_subset_name = 'Best for 2000' AND c.collection_name = 'Best'
SELECT DISTINCT dsm.document_object_id FROM document_subsets ds JOIN document_subset_members dsm ON ds.document_subset_id = dsm.document_subset_id JOIN documents_in_collections dic ON dsm.document_object_id = dic.document_object_id WHERE ds.document_subset_name = 'Best for 2000' AND dic.collection_id IN (SELECT collection_id FROM documents_in_collections WHERE collection_id = (SELECT collection_id FROM documents_in_collections JOIN document_objects ON documents_in_collections.document_object_id = document_objects.document_object_id WHERE description = 'Best'))
SELECT doc.document_object_id FROM documents_in_collections doc INNER JOIN collections col ON doc.collection_id = col.collection_id WHERE col.collection_name = 'Best' AND doc.document_object_id NOT IN (SELECT ds.document_object_id FROM document_subset_members ds WHERE ds.document_subset_id = 2000)
SELECT DISTINCT doc.document_object_id FROM document_objects doc JOIN documents_in_collections dcol ON doc.document_object_id = dcol.document_object_id JOIN collections col ON dcol.collection_id = col.collection_id LEFT JOIN document_subset_members dsm ON doc.document_object_id = dsm.document_object_id WHERE col.collection_name = 'Best' AND (dsm.document_subset_id != (SELECT document_subset_id FROM document_subset_members WHERE related_document_object_id IN (SELECT document_object_id FROM document_objects WHERE description = 'Best for 2000')) OR dsm.document_subset_id IS NULL)
SELECT DISTINCT doc_member.related_document_object_id FROM document_subset_members doc_member JOIN document_subsets doc_subset ON doc_member.document_subset_id = doc_subset.document_subset_id WHERE doc_subset.document_subset_name = 'Best for 2000' UNION SELECT documents_in_collections.document_object_id FROM documents_in_collections JOIN collections ON documents_in_collections.collection_id = collections.collection_id WHERE collections.collection_name = 'Best'
SELECT DISTINCT DSM.document_object_id FROM document_subsets DS JOIN document_subset_members DSM ON DS.document_subset_id = DSM.document_subset_id WHERE DS.document_subset_name = 'Best for 2000' UNION SELECT DIC.document_object_id FROM documents_in_collections DIC JOIN document_objects DO ON DIC.document_object_id = DO.document_object_id WHERE DO.description = 'Best'
SELECT col.collection_name FROM collections col JOIN collection_subset_members csm ON col.collection_id = csm.related_collection_id JOIN collections parent ON parent.collection_id = csm.collection_id WHERE parent.collection_name = 'Best'
SELECT cl.collection_name FROM collections cl JOIN collection_subset_members cm ON cl.collection_id = cm.related_collection_id WHERE cm.collection_id IN (SELECT collection_id FROM collections WHERE collection_name = 'Best')
SELECT COUNT(DISTINCT c.collection_id) FROM collections c JOIN collection_subset_members cm ON c.collection_id = cm.related_collection_id JOIN collections cp ON cp.collection_id = c.parent_collection_id WHERE cp.collection_name = 'Best'
SELECT COUNT(DISTINCT c.collection_id) FROM collections c JOIN collection_subset_members m ON c.collection_id = m.collection_id WHERE m.related_collection_id = (SELECT collection_id FROM collections WHERE collection_name = 'Best')
SELECT css.collection_subset_name FROM collections c JOIN collection_subset_members csm ON csm.collection_id = c.collection_id JOIN collection_subsets css ON css.collection_subset_id = csm.collection_subset_id WHERE c.collection_name = 'Best'
SELECT cs.collection_subset_name FROM collections c JOIN collection_subset_members csm ON c.collection_id = csm.collection_id JOIN collection_subsets cs ON csm.collection_subset_id = cs.collection_subset_id WHERE c.collection_name = 'Best'
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality), MIN(voice_sound_quality) FROM performance_score
SELECT ps.voice_sound_quality, ps.rhythm_tempo, ps.stage_presence FROM performance_score AS ps JOIN participants AS p ON ps.participant_id = p.id WHERE p.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT ps.stage_presence FROM performance_score ps INNER JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English'
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id HAVING COUNT(ps.songs_id) >= 2
SELECT p.id, p.name, p.popularity FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id ORDER BY COUNT(ps.songs_id) DESC
SELECT participants.id, participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id WHERE performance_score.voice_sound_quality = 5 OR performance_score.rhythm_tempo = 5
SELECT ps.voice_sound_quality FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.name = 'The Balkan Girls' AND s.language = 'English'
SELECT songs.id, songs.name FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY songs.id ORDER BY COUNT(distinct performance_score.participant_id) DESC LIMIT 1
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT s.language, AVG(ps.rhythm_tempo) AS AverageRhythm FROM songs s JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.language
SELECT DISTINCT p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English'
SELECT DISTINCT p.name, p.popularity FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'Croatian' AND EXISTS (SELECT 1 FROM performance_score ps2 JOIN songs s2 ON ps2.songs_id = s2.id WHERE s2.language = 'English' AND ps2.participant_id = p.id)
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT DISTINCT s.original_artist FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE ps.rhythm_tempo > 5 ORDER BY ps.voice_sound_quality DESC
SELECT COUNT(*) FROM city
SELECT COUNT(*) FROM city
SELECT DISTINCT state FROM city;
SELECT DISTINCT state FROM city
SELECT COUNT(DISTINCT country) FROM city
SELECT COUNT(DISTINCT country) FROM city
SELECT city_name, city_code, state, country FROM city;
SELECT city_name, city_code, state, country FROM city
SELECT latitude, longitude FROM city WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM city WHERE city_name = 'Baltimore'
SELECT city_name FROM city WHERE state = 'PA'
SELECT city_name FROM city WHERE state = 'PA'
SELECT COUNT(*) FROM city WHERE country = 'CANADA';
SELECT COUNT(*) FROM city WHERE country = 'CANADA'
SELECT city_name FROM city WHERE country = 'USA' ORDER BY latitude ASC;
SELECT city_name FROM city WHERE country = 'USA' ORDER BY latitude
SELECT state, COUNT(city_name) AS number_of_cities FROM city GROUP BY state
SELECT state, COUNT(city_name) AS total_cities FROM city GROUP BY state
SELECT country, COUNT(city_name) FROM city GROUP BY country
SELECT country, COUNT(city_code) FROM city GROUP BY country
SELECT state FROM city GROUP BY state HAVING COUNT(city_name) >= 2
SELECT state FROM city GROUP BY state HAVING COUNT(city_name) >= 2
SELECT state FROM city GROUP BY state ORDER BY COUNT(city_name) DESC LIMIT 1
SELECT state FROM city GROUP BY state ORDER BY COUNT(city_name) DESC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY COUNT(city_name) ASC LIMIT 1
SELECT country FROM city GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT s.fname, s.lname FROM student AS s JOIN city AS c ON s.city_code = c.city_code WHERE c.state = 'MD'
SELECT fname || ' ' || lname FROM student JOIN city ON student.city_code = city.city_code WHERE city.state = 'MD'
SELECT COUNT(*) FROM student JOIN city ON student.city_code = city.city_code WHERE city.country = 'CHINA'
SELECT COUNT(*) FROM student JOIN city ON student.city_code = city.city_code WHERE city.country = 'CHINA'
SELECT fname, major FROM student JOIN city ON student.city_code = city.city_code WHERE city.city_name = 'Baltimore'
SELECT student.fname, student.major FROM student JOIN city ON student.city_code = city.city_code WHERE city.city_name = 'Baltimore'
SELECT country, COUNT(s.stuid) AS NumberOfStudents FROM student s JOIN city c ON s.city_code = c.city_code GROUP BY country
SELECT country, COUNT(stuid) AS student_count FROM city JOIN student ON city.city_code = student.city_code GROUP BY country
SELECT city.city_name, COUNT(student.stuid) AS num_students FROM city JOIN student ON city.city_code = student.city_code GROUP BY city.city_name
SELECT city.city_name, COUNT(student.stuid) AS student_count FROM student JOIN city ON student.city_code = city.city_code GROUP BY city.city_name
SELECT state FROM city JOIN student ON city.city_code = student.city_code GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM (SELECT state, COUNT(stuid) AS total_students FROM city JOIN student ON city.city_code = student.city_code GROUP BY state ORDER BY total_students DESC LIMIT 1)
SELECT country FROM city JOIN student ON city.city_code = student.city_code GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT country FROM city JOIN student ON city.city_code = student.city_code GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT city_name FROM city WHERE city_code IN (SELECT city_code FROM student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT city_name FROM city WHERE city_code IN (SELECT city_code FROM student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT state FROM city JOIN student ON city.city_code = student.city_code GROUP BY state HAVING COUNT(stuid) > 5
SELECT state FROM city JOIN student ON city.city_code = student.city_code GROUP BY state HAVING COUNT(DISTINCT student.stuid) > 5
SELECT stuid FROM student JOIN city ON student.city_code = city.city_code WHERE city.country != 'USA'
SELECT stuid FROM student JOIN city ON student.city_code = city.city_code WHERE city.country != 'USA'
SELECT student.stuid FROM student JOIN city ON student.city_code = city.city_code WHERE student.sex = 'F' AND city.state = 'PA'
SELECT student.stuid FROM student JOIN city ON student.city_code = city.city_code WHERE student.sex = 'female' AND city.state = 'PA'
SELECT s.stuid FROM student s JOIN city c ON s.city_code = c.city_code WHERE s.sex = 'male' AND c.country != 'USA'
SELECT stuid FROM student JOIN city ON student.city_code = city.city_code WHERE sex = 'male' AND country != 'USA'
SELECT distance FROM direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI';
SELECT distance FROM direct_distance JOIN city AS c1 ON direct_distance.city1_code = c1.city_code JOIN city AS c2 ON direct_distance.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark'
SELECT dd.distance FROM direct_distance dd JOIN city c1 ON dd.city1_code = c1.city_code JOIN city c2 ON dd.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark'
SELECT AVG(distance), MIN(distance), MAX(distance) FROM direct_distance
SELECT AVG(distance) AS avg_distance, MIN(distance) AS min_distance, MAX(distance) AS max_distance FROM direct_distance
SELECT city1_code, city2_code FROM direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code FROM direct_distance WHERE distance = (SELECT MAX(distance) FROM direct_distance)
SELECT d.city1_code, d.city2_code FROM direct_distance d WHERE d.distance > (SELECT AVG(distance) FROM direct_distance);
SELECT city1_code AS city_code FROM direct_distance WHERE distance > (SELECT AVG(distance) FROM direct_distance) UNION SELECT city2_code FROM direct_distance WHERE distance > (SELECT AVG(distance) FROM direct_distance)
SELECT dd.city1_code, dd.city2_code FROM direct_distance dd WHERE dd.distance < 1000
SELECT city1_code FROM direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM direct_distance WHERE distance < 1000
SELECT SUM(dd.distance) FROM direct_distance dd WHERE dd.city1_code = 'BAL'
SELECT SUM(distance) FROM direct_distance WHERE city1_code = 'BAL'
SELECT AVG(distance) FROM direct_distance JOIN city ON city.city_code = direct_distance.city1_code WHERE city_name = 'Boston'
SELECT AVG(distance) FROM direct_distance JOIN city ON city.city_code = direct_distance.city2_code WHERE city.city_name = 'Boston'
SELECT city_name FROM city WHERE city_code = (SELECT city2_code FROM direct_distance WHERE city1_code = (SELECT city_code FROM city WHERE city_name = 'Chicago') ORDER BY distance LIMIT 1)
SELECT c.city_name FROM city c JOIN direct_distance d ON c.city_code = d.city2_code WHERE d.city1_code = (SELECT city_code FROM city WHERE city_name = 'Chicago') ORDER BY d.distance ASC LIMIT 1
SELECT c.city_name FROM city c JOIN direct_distance d ON d.city2_code = c.city_code WHERE d.city1_code = (SELECT city_code FROM city WHERE city_name = 'Boston') ORDER BY d.distance DESC LIMIT 1
SELECT city_name FROM city WHERE city_code = (SELECT city2_code FROM direct_distance JOIN city ON city.city_code = direct_distance.city1_code WHERE city_name = 'Boston' ORDER BY distance DESC LIMIT 1)
SELECT city1_code, SUM(distance) AS total_distance FROM direct_distance GROUP BY city1_code
SELECT dd.city1_code, SUM(dd.distance) FROM direct_distance dd GROUP BY dd.city1_code
SELECT c.city_name, AVG(d.distance) FROM city c JOIN direct_distance d ON c.city_code = d.city1_code GROUP BY c.city_name
SELECT city_name, AVG(distance) AS avg_distance FROM city JOIN direct_distance ON city.city_code = direct_distance.city1_code GROUP BY city_name
SELECT dd.distance FROM direct_distance dd JOIN city c1 ON dd.city1_code = c1.city_code JOIN city c2 ON dd.city2_code = c2.city_code JOIN student s1 ON c1.city_code = s1.city_code JOIN student s2 ON c2.city_code = s2.city_code WHERE s1.fname = 'Linda' AND s1.lname = 'Smith' AND s2.fname = 'Tracy' AND s2.lname = 'Kim'
SELECT dd.distance FROM direct_distance dd JOIN city c1 ON dd.city1_code = c1.city_code JOIN city c2 ON dd.city2_code = c2.city_code JOIN student s1 ON c1.city_code = s1.city_code JOIN student s2 ON c2.city_code = s2.city_code WHERE s1.fname = 'Linda' AND s1.lname = 'Smith' AND s2.fname = 'Tracy' AND s2.lname = 'Kim'
SELECT s.fname, s.lname FROM student s JOIN city c ON s.city_code = c.city_code JOIN direct_distance d ON c.city_code = d.city2_code WHERE d.distance = (SELECT MAX(distance) FROM direct_distance WHERE city1_code = (SELECT city_code FROM student WHERE fname = 'Linda' AND lname = 'Smith'))
SELECT S.fname || ' ' || S.lname FROM student S JOIN city C1 ON S.city_code = C1.city_code JOIN direct_distance D ON C1.city_code = D.city1_code JOIN city C2 ON D.city2_code = C2.city_code JOIN student S2 ON C2.city_code = S2.city_code WHERE S2.fname = 'Linda' AND S2.lname = 'Smith' ORDER BY D.distance DESC LIMIT 1
SELECT state FROM city JOIN student ON city.city_code = student.city_code WHERE student.fname = 'Linda'
SELECT state FROM city WHERE city_code = (SELECT city_code FROM student WHERE fname = 'Linda')
SELECT * FROM sailors WHERE age > 30
SELECT * FROM sailors WHERE age > 30;
SELECT s.name, s.age FROM sailors s WHERE s.age < 30
SELECT name, age FROM sailors WHERE age < 30
SELECT boats.name FROM boats JOIN reserves ON boats.bid = reserves.bid WHERE reserves.sid = 1;
SELECT DISTINCT r.bid FROM reserves r WHERE r.sid = 1
SELECT s.name FROM sailors AS s JOIN reserves AS r ON s.sid = r.sid WHERE r.bid = 102
SELECT s.name FROM sailors s JOIN reserves r ON s.sid = r.sid WHERE r.bid = 102
SELECT DISTINCT bid FROM reserves
SELECT DISTINCT bid FROM reserves
SELECT name FROM sailors WHERE name LIKE '%e%'
SELECT name FROM sailors WHERE name LIKE '%e%'
SELECT DISTINCT S.sid FROM sailors S WHERE NOT EXISTS (SELECT 1 FROM sailors S2 WHERE S2.age > S.age)
SELECT DISTINCT s.sid FROM sailors s WHERE s.age > (SELECT MIN(age) FROM sailors)
SELECT DISTINCT s1.name FROM sailors AS s1 WHERE s1.age > (SELECT MAX(s2.age) FROM sailors AS s2 WHERE s2.rating > 7)
SELECT DISTINCT s1.name FROM sailors s1 WHERE s1.age > (SELECT s2.age FROM sailors s2 WHERE s2.rating > 7)
SELECT DISTINCT sailors.name, sailors.sid FROM sailors JOIN reserves ON sailors.sid = reserves.sid
SELECT DISTINCT s.sid, s.name FROM sailors s JOIN reserves r ON s.sid = r.sid
SELECT S.sid, S.name FROM sailors S INNER JOIN reserves R ON S.sid = R.sid GROUP BY S.sid, S.name HAVING COUNT(DISTINCT R.bid) > 1
SELECT DISTINCT sailors.name FROM sailors JOIN reserves ON sailors.sid = reserves.sid GROUP BY sailors.sid HAVING COUNT(DISTINCT reserves.bid) >= 2
SELECT DISTINCT s.sid FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT r.sid FROM reserves r JOIN boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT s.sid, s.name FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT s.name, s.sid FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON b.bid = r.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT s.sid FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color = 'red' INTERSECT SELECT DISTINCT s.sid FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color = 'blue'
SELECT DISTINCT s.sid FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT s.sid, s.name FROM sailors AS s JOIN reserves AS r ON s.sid = r.sid JOIN boats AS b ON r.bid = b.bid WHERE b.color IN ('red', 'blue') GROUP BY s.sid, s.name HAVING COUNT(DISTINCT b.color) = 2
SELECT DISTINCT s.sid, s.name FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue') GROUP BY s.sid, s.name HAVING COUNT(DISTINCT b.color) = 2
SELECT s.sid FROM sailors s WHERE NOT EXISTS (SELECT 1 FROM reserves r WHERE r.sid = s.sid)
SELECT s.sid FROM sailors s WHERE s.sid NOT IN (SELECT r.sid FROM reserves r)
SELECT sailors.name, sailors.sid FROM sailors LEFT JOIN reserves ON sailors.sid = reserves.sid WHERE reserves.sid IS NULL
SELECT s.name, s.sid FROM sailors s WHERE NOT EXISTS (SELECT 1 FROM reserves r WHERE r.sid = s.sid)
SELECT sid FROM sailors WHERE sid NOT IN (SELECT reserves.sid FROM reserves)
SELECT s.sid FROM sailors s WHERE s.sid NOT IN (SELECT r.sid FROM reserves r)
SELECT s.name FROM sailors s JOIN reserves r ON s.sid = r.sid WHERE r.bid = 103
SELECT s.name FROM sailors s JOIN reserves r ON s.sid = r.sid WHERE r.bid = 103
SELECT name FROM sailors WHERE rating > (SELECT MAX(rating) FROM sailors WHERE name = 'Luis')
SELECT DISTINCT S.name FROM sailors S WHERE S.rating > (SELECT MAX(S2.rating) FROM sailors S2 WHERE S2.name = 'Luis')
SELECT name FROM sailors WHERE rating > (SELECT MAX(rating) FROM sailors WHERE name = 'Luis')
SELECT DISTINCT s1.name FROM sailors s1 WHERE s1.rating > (SELECT MAX(s2.rating) FROM sailors s2 WHERE s2.name = 'Luis')
SELECT s.sid, s.name FROM sailors s JOIN reserves r ON s.sid = r.sid WHERE s.rating > 2
SELECT DISTINCT sailors.name, sailors.sid FROM sailors JOIN reserves ON sailors.sid = reserves.sid WHERE sailors.rating >= 3
SELECT name, age FROM sailors WHERE age = (SELECT MAX(age) FROM sailors)
SELECT name, age FROM sailors WHERE age = (SELECT MAX(age) FROM sailors)
SELECT COUNT(DISTINCT sid) FROM sailors
SELECT COUNT(*) FROM sailors
SELECT AVG(age) FROM sailors WHERE rating = 7
SELECT AVG(age) FROM sailors WHERE rating = 7
SELECT COUNT(*) FROM sailors WHERE name LIKE 'D%'
SELECT COUNT(*) FROM sailors WHERE name LIKE 'D%'
SELECT AVG(rating) AS average_rating, MAX(age) AS max_age FROM sailors
SELECT AVG(rating) AS AverageRating, MAX(age) AS LargestAge FROM sailors
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats LEFT JOIN reserves ON boats.bid = reserves.bid GROUP BY boats.bid
SELECT b.name, COUNT(*) AS reservation_count FROM boats b JOIN reserves r ON b.bid = r.bid GROUP BY b.bid
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM boats JOIN reserves ON boats.bid = reserves.bid WHERE boats.bid > 50 GROUP BY boats.bid
SELECT boats.bid, COUNT(*) AS reservations_count FROM boats JOIN reserves ON boats.bid = reserves.bid WHERE boats.bid > 50 GROUP BY boats.bid
SELECT boats.name, COUNT(*) AS reservation_count FROM reserves JOIN boats ON reserves.bid = boats.bid GROUP BY boats.name HAVING COUNT(*) > 1
SELECT boats.bid, COUNT(reserves.bid) AS reservation_count FROM reserves INNER JOIN boats ON reserves.bid = boats.bid GROUP BY boats.bid HAVING COUNT(reserves.bid) > 1
SELECT boats.bid, boats.name, COUNT(*) AS reservation_count FROM reserves JOIN boats ON reserves.bid = boats.bid WHERE reserves.sid > 1 GROUP BY boats.bid, boats.name
SELECT boats.name, COUNT(reserves.bid) AS reservation_count FROM reserves JOIN boats ON reserves.bid = boats.bid WHERE reserves.sid > 1 GROUP BY boats.name
SELECT s.rating, AVG(s.age) AS average_age FROM sailors s JOIN reserves r ON s.sid = r.sid JOIN boats b ON r.bid = b.bid WHERE b.color = 'red' GROUP BY s.rating
SELECT sailors.rating, AVG(sailors.age) FROM sailors JOIN reserves ON sailors.sid = reserves.sid JOIN boats ON reserves.bid = boats.bid WHERE boats.color = 'red' GROUP BY sailors.rating
SELECT name, rating, age FROM sailors ORDER BY rating, age;
SELECT name, rating, age FROM sailors ORDER BY rating, age
SELECT COUNT(*) FROM boats
SELECT COUNT(*) FROM boats
SELECT COUNT(*) FROM boats WHERE color = 'red';
SELECT COUNT(*) FROM boats WHERE color = 'red'
SELECT DISTINCT boats.name FROM boats JOIN reserves ON boats.bid = reserves.bid JOIN sailors ON reserves.sid = sailors.sid WHERE sailors.age BETWEEN 20 AND 30
SELECT DISTINCT b.name FROM boats b JOIN reserves r ON b.bid = r.bid JOIN sailors s ON r.sid = s.sid WHERE s.age BETWEEN 20 AND 30
SELECT S.name FROM sailors S WHERE S.rating > (SELECT MAX(sailors.rating) FROM sailors INNER JOIN reserves ON sailors.sid = reserves.sid INNER JOIN boats ON reserves.bid = boats.bid WHERE boats.color = 'red')
SELECT s.name FROM sailors s WHERE s.rating > (SELECT MAX(s2.rating) FROM sailors s2 INNER JOIN reserves r2 ON s2.sid = r2.sid INNER JOIN boats b2 ON r2.bid = b2.bid WHERE b2.color = 'red')
SELECT MAX(rating) FROM sailors
SELECT MAX(rating) FROM sailors
SELECT sailors.name FROM sailors JOIN reserves ON sailors.sid = reserves.sid JOIN boats ON reserves.bid = boats.bid WHERE boats.name = 'Melon'
SELECT DISTINCT sailors.name FROM sailors JOIN reserves ON sailors.sid = reserves.sid JOIN boats ON boats.bid = reserves.bid WHERE boats.name = 'Melon'
SELECT s.name, s.age FROM sailors s ORDER BY s.rating DESC
SELECT name, age FROM sailors ORDER BY rating DESC
SELECT model FROM headphone WHERE price = (SELECT MAX(price) FROM headphone)
SELECT model FROM headphone ORDER BY price DESC LIMIT 1
SELECT DISTINCT model FROM headphone ORDER BY model ASC
SELECT DISTINCT model FROM headphone ORDER BY model ASC
SELECT class FROM headphone GROUP BY class ORDER BY COUNT(*) DESC LIMIT 1
SELECT class FROM headphone GROUP BY class ORDER BY COUNT(*) DESC LIMIT 1
SELECT class FROM headphone GROUP BY class HAVING COUNT(headphone_id) > 2
SELECT h.class FROM headphone h GROUP BY h.class HAVING COUNT(DISTINCT h.headphone_id) <= 2
SELECT class, COUNT(*) FROM headphone WHERE price > 200 GROUP BY class
SELECT class, COUNT(*) FROM headphone WHERE price > 200 GROUP BY class
SELECT COUNT(DISTINCT earpads) FROM headphone;
SELECT COUNT(DISTINCT earpads) FROM headphone
SELECT earpads FROM headphone GROUP BY earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT earpads, COUNT(*) AS total FROM headphone GROUP BY earpads ORDER BY total DESC LIMIT 2
SELECT model, class, construction FROM headphone WHERE price = (SELECT MIN(price) FROM headphone)
SELECT model, class, construction FROM headphone WHERE price = (SELECT MIN(price) FROM headphone)
SELECT construction, AVG(price) FROM headphone GROUP BY construction
SELECT construction, AVG(price) AS average_price FROM headphone GROUP BY construction
SELECT DISTINCT h.class FROM headphone h WHERE EXISTS (SELECT 1 FROM headphone WHERE class = h.class AND earpads = 'Bowls') AND EXISTS (SELECT 1 FROM headphone WHERE class = h.class AND earpads = 'Comfort Pads')
SELECT DISTINCT h1.class FROM headphone h1 JOIN headphone h2 ON h1.class = h2.class WHERE h1.earpads = 'Bowls' AND h2.earpads = 'Comfort Pads'
SELECT DISTINCT H.earpads FROM headphone H WHERE H.construction != 'Plastic'
SELECT earpads FROM headphone WHERE construction != 'Plastic'
SELECT model FROM headphone WHERE price < (SELECT AVG(price) FROM headphone)
SELECT model FROM headphone WHERE price < (SELECT AVG(price) FROM headphone)
SELECT name FROM store ORDER BY date_opened ASC
SELECT name FROM store ORDER BY date_opened
SELECT name, parking FROM store WHERE neighborhood = 'Tarzana'
SELECT name, parking FROM store WHERE neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT neighborhood) FROM store
SELECT COUNT(DISTINCT neighborhood) FROM store
SELECT neighborhood, COUNT(store_id) AS num_stores FROM store GROUP BY neighborhood
SELECT neighborhood, COUNT(store_id) as store_count FROM store GROUP BY neighborhood
SELECT S.name, SUM(ST.quantity) AS total_quantity FROM store S JOIN stock ST ON S.store_id = ST.store_id GROUP BY S.store_id ORDER BY total_quantity DESC LIMIT 1
SELECT s.name, SUM(st.quantity) FROM store s JOIN stock st ON s.store_id = st.store_id GROUP BY s.name
SELECT name FROM store WHERE store_id NOT IN (SELECT store_id FROM stock WHERE quantity > 0)
SELECT s.name FROM store s WHERE NOT EXISTS (SELECT 1 FROM stock st WHERE st.store_id = s.store_id)
SELECT model FROM headphone WHERE headphone_id NOT IN (SELECT headphone_id FROM stock)
SELECT model FROM headphone WHERE headphone_id NOT IN (SELECT headphone_id FROM stock)
SELECT headphone.model FROM headphone JOIN stock ON headphone.headphone_id = stock.headphone_id GROUP BY headphone.model ORDER BY SUM(stock.quantity) DESC LIMIT 1
SELECT model FROM headphone WHERE headphone_id = (SELECT headphone_id FROM stock GROUP BY headphone_id ORDER BY SUM(quantity) DESC LIMIT 1)
SELECT SUM(stock.quantity) FROM stock JOIN store ON store.store_id = stock.store_id WHERE store.name = 'Woodman'
SELECT SUM(s.quantity) FROM stock s JOIN store st ON st.store_id = s.store_id WHERE st.name = 'Woodman'
SELECT neighborhood FROM store WHERE store_id NOT IN (SELECT store_id FROM stock WHERE quantity > 0)
SELECT neighborhood FROM store WHERE store_id NOT IN (SELECT store_id FROM stock WHERE quantity > 0)
SELECT COUNT(DISTINCT author_id) FROM author
SELECT COUNT(*) FROM author
SELECT COUNT(*) FROM paper
SELECT COUNT(*) FROM paper
SELECT COUNT(*) FROM affiliation;
SELECT COUNT(*) FROM affiliation
SELECT COUNT(*) FROM paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON author_list.affiliation_id = affiliation.affiliation_id WHERE paper.year = 2009 AND affiliation.name = 'Columbia University'
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON author_list.affiliation_id = affiliation.affiliation_id WHERE affiliation.name = 'Columbia University' AND paper.year = 2009
SELECT name, address FROM affiliation
SELECT name, address FROM affiliation;
SELECT venue, year FROM paper ORDER BY year
SELECT DISTINCT venue FROM paper ORDER BY year
SELECT paper.title, paper.paper_id FROM paper JOIN author_list ON author_list.paper_id = paper.paper_id JOIN affiliation ON author_list.affiliation_id = affiliation.affiliation_id WHERE affiliation.name = 'Harvard University'
SELECT p.title, p.paper_id FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Harvard University'
SELECT paper.title, paper.paper_id FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown'
SELECT p.title, p.paper_id FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown'
SELECT p.title, p.paper_id FROM paper p JOIN author_list al ON al.paper_id = p.paper_id JOIN affiliation a ON a.affiliation_id = al.affiliation_id WHERE a.name IN ('Stanford University', 'Columbia University') GROUP BY p.paper_id HAVING COUNT(DISTINCT a.name) = 2
SELECT P.title, P.paper_id FROM paper P JOIN author_list AL ON P.paper_id = AL.paper_id JOIN affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' AND P.paper_id IN (SELECT P2.paper_id FROM paper P2 JOIN author_list AL2 ON P2.paper_id = AL2.paper_id JOIN affiliation A2 ON AL2.affiliation_id = A2.affiliation_id WHERE A2.name = 'Stanford University')
SELECT p.title, p.paper_id FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN author a ON al.author_id = a.author_id WHERE a.name IN ('McKeown, Kathleen', 'Rambow, Owen') GROUP BY p.paper_id HAVING COUNT(DISTINCT a.name) = 2
SELECT p.title, p.paper_id FROM paper p JOIN author_list al1 ON p.paper_id = al1.paper_id JOIN author a1 ON al1.author_id = a1.author_id JOIN author_list al2 ON p.paper_id = al2.paper_id JOIN author a2 ON al2.author_id = a2.author_id WHERE a1.name = 'McKeown, Kathleen' AND a2.name = 'Rambow, Owen'
SELECT p.title, p.paper_id FROM paper p WHERE EXISTS (SELECT 1 FROM author_list al JOIN author a ON al.author_id = a.author_id WHERE al.paper_id = p.paper_id AND a.name = 'Mckeown') AND NOT EXISTS (SELECT 1 FROM author_list al JOIN author a ON al.author_id = a.author_id WHERE al.paper_id = p.paper_id AND a.name = 'Rambow')
SELECT P.title, P.paper_id FROM paper P JOIN author_list AL ON P.paper_id = AL.paper_id WHERE AL.author_id IN (SELECT A.author_id FROM author A WHERE A.name = 'Mckeown') AND P.paper_id NOT IN (SELECT P.paper_id FROM paper P JOIN author_list AL ON P.paper_id = AL.paper_id JOIN author A ON A.author_id = AL.author_id WHERE A.name = 'Rambow')
SELECT paper.paper_id, paper.title FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name IN ('McKeown, Kathleen', 'Rambow, Owen')
SELECT paper.paper_id, paper.title FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name IN ('McKeown, Kathleen', 'Rambow, Owen')
SELECT A.name, COUNT(P.paper_id) AS num_papers FROM author A JOIN author_list AL ON A.author_id = AL.author_id JOIN paper P ON AL.paper_id = P.paper_id GROUP BY A.author_id ORDER BY num_papers DESC
SELECT author.name, COUNT(paper.paper_id) AS publications FROM author JOIN author_list ON author.author_id = author_list.author_id JOIN paper ON author_list.paper_id = paper.paper_id GROUP BY author.author_id ORDER BY publications DESC
SELECT a.name, COUNT(DISTINCT p.paper_id) AS papers_count FROM affiliation a JOIN author_list al ON a.affiliation_id = al.affiliation_id JOIN paper p ON al.paper_id = p.paper_id GROUP BY a.name ORDER BY papers_count ASC
SELECT name FROM affiliation WHERE affiliation_id IN (SELECT affiliation_id FROM author_list GROUP BY affiliation_id ORDER BY COUNT(paper_id) DESC)
SELECT a.name FROM author a WHERE (SELECT COUNT(*) FROM author_list al WHERE al.author_id = a.author_id) > 50
SELECT a.name FROM author a WHERE (SELECT COUNT(*) FROM author_list al WHERE al.author_id = a.author_id) > 50
SELECT author.name FROM author WHERE author.author_id IN (SELECT author_list.author_id FROM author_list GROUP BY author_list.author_id HAVING COUNT(author_list.paper_id) = 1)
SELECT author.name FROM author JOIN author_list ON author.author_id = author_list.author_id GROUP BY author.author_id HAVING COUNT(DISTINCT author_list.paper_id) = 1
SELECT venue, year FROM paper GROUP BY venue, year ORDER BY COUNT(paper_id) DESC LIMIT 1
SELECT venue, year FROM paper GROUP BY venue, year ORDER BY COUNT(paper_id) DESC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1
SELECT venue FROM paper GROUP BY venue ORDER BY COUNT(paper_id) ASC LIMIT 1
SELECT COUNT(*) FROM citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT citing.paper_id) FROM citation AS citing WHERE citing.cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM citation WHERE paper_id = 'D12-1027'
SELECT COUNT(*) FROM citation WHERE paper_id = 'D12-1027'
SELECT cited_paper_id, COUNT(*) AS citation_count FROM citation GROUP BY cited_paper_id ORDER BY citation_count DESC LIMIT 1
SELECT paper_id, COUNT(*) as num_citations FROM citation GROUP BY paper_id ORDER BY num_citations DESC LIMIT 1
SELECT P.title FROM paper P INNER JOIN citation C ON P.paper_id = C.paper_id GROUP BY P.title ORDER BY COUNT(*) DESC LIMIT 1
SELECT title FROM paper WHERE paper_id = (SELECT paper_id FROM citation GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT p.title, COUNT(c.cited_paper_id) AS citations FROM paper AS p JOIN citation AS c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id ORDER BY citations DESC LIMIT 10
SELECT P.title, COUNT(C.cited_paper_id) AS citations FROM paper P JOIN citation C ON P.paper_id = C.cited_paper_id GROUP BY P.paper_id ORDER BY citations DESC LIMIT 10
SELECT COUNT(*) FROM citation INNER JOIN author_list ON citation.paper_id = author_list.paper_id INNER JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown , Kathleen'
SELECT COUNT(citation.cited_paper_id) FROM citation JOIN paper ON citation.cited_paper_id = paper.paper_id JOIN author_list ON paper.paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT citation.paper_id) FROM citation JOIN author_list ON citation.cited_paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT c.cited_paper_id) FROM citation c JOIN paper p ON c.paper_id = p.paper_id JOIN author_list al ON p.paper_id = al.paper_id JOIN author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.paper_id) AS citations FROM author A JOIN author_list AL ON A.author_id = AL.author_id JOIN citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citations DESC LIMIT 1
SELECT name, COUNT(*) AS citation_count FROM author JOIN author_list ON author.author_id = author_list.author_id JOIN citation ON author_list.paper_id = citation.cited_paper_id GROUP BY author.author_id ORDER BY citation_count DESC LIMIT 1
SELECT DISTINCT p.venue, p.year FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT DISTINCT paper.venue, paper.year FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown, Kathleen'
SELECT DISTINCT p.venue, p.year FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University'
SELECT DISTINCT P.venue, P.year FROM paper P JOIN author_list AL ON P.paper_id = AL.paper_id JOIN affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT author.name FROM author JOIN author_list ON author.author_id = author_list.author_id JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.year = 2009 GROUP BY author.author_id ORDER BY COUNT(paper.paper_id) DESC LIMIT 1
SELECT author.name FROM author JOIN author_list ON author.author_id = author_list.author_id JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.year = 2009 GROUP BY author.author_id ORDER BY COUNT(paper.paper_id) DESC LIMIT 1
SELECT affiliation.name FROM affiliation JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.year = 2009 GROUP BY affiliation.name ORDER BY COUNT(paper.paper_id) DESC LIMIT 3
SELECT affiliation.name FROM affiliation JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.year = 2009 GROUP BY affiliation.affiliation_id ORDER BY COUNT(paper.paper_id) DESC LIMIT 3
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON affiliation.affiliation_id = author_list.affiliation_id WHERE affiliation.name = 'Columbia University' AND paper.year <= 2009
SELECT COUNT(DISTINCT paper.paper_id) FROM paper JOIN author_list ON paper.paper_id = author_list.paper_id JOIN affiliation ON author_list.affiliation_id = affiliation.affiliation_id WHERE affiliation.name = 'Columbia University' AND paper.year <= 2009
SELECT COUNT(DISTINCT p.paper_id) FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN affiliation a ON a.affiliation_id = al.affiliation_id WHERE a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT COUNT(DISTINCT p.paper_id) FROM paper p JOIN author_list al ON p.paper_id = al.paper_id JOIN affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT p.title FROM paper p JOIN author_list al ON p.paper_id = al.paper_id GROUP BY p.paper_id ORDER BY COUNT(al.author_id) DESC LIMIT 1
SELECT title FROM paper WHERE paper_id = (SELECT paper_id FROM author_list GROUP BY paper_id ORDER BY COUNT(author_id) DESC LIMIT 1)
SELECT COUNT(DISTINCT al2.author_id) FROM author AS a INNER JOIN author_list AS al ON a.author_id = al.author_id INNER JOIN paper AS p ON al.paper_id = p.paper_id INNER JOIN author_list AS al2 ON p.paper_id = al2.paper_id WHERE a.name = 'Mckeown, Kathleen' AND al2.author_id != a.author_id
SELECT COUNT(DISTINCT al2.author_id) FROM author a JOIN author_list al ON a.author_id = al.author_id JOIN paper p ON al.paper_id = p.paper_id JOIN author_list al2 ON p.paper_id = al2.paper_id WHERE a.name = 'Mckeown, Kathleen' AND al2.author_id != a.author_id
SELECT author.name FROM author JOIN author_list ON author.author_id = author_list.author_id WHERE author_list.paper_id IN (SELECT paper_id FROM author_list JOIN author ON author_list.author_id = author.author_id WHERE author.name = 'Mckeown, Kathleen') GROUP BY author.author_id ORDER BY COUNT(author_list.paper_id) DESC LIMIT 1
SELECT a.name FROM author a JOIN author_list al ON a.author_id = al.author_id WHERE al.paper_id IN (SELECT al2.paper_id FROM author_list al2 JOIN author a2 ON al2.author_id = a2.author_id WHERE a2.name = 'Mckeown, Kathleen') GROUP BY a.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT paper_id FROM paper WHERE title LIKE '%translation%'
SELECT paper_id FROM paper WHERE title LIKE '%translation%'
SELECT p.paper_id, p.title FROM paper p LEFT JOIN citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT p.paper_id, p.title FROM paper p LEFT JOIN citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT A.name FROM affiliation A WHERE A.address LIKE '%China%' AND A.affiliation_id IN (SELECT AL.affiliation_id FROM author_list AL GROUP BY AL.affiliation_id ORDER BY COUNT(AL.paper_id) DESC LIMIT 1)
SELECT a.name FROM affiliation a JOIN author_list al ON a.affiliation_id = al.affiliation_id JOIN paper p ON p.paper_id = al.paper_id WHERE a.address LIKE '%China%' GROUP BY a.affiliation_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT year, venue, COUNT(DISTINCT paper_id) AS num_papers FROM paper GROUP BY year, venue
SELECT venue, year, COUNT(paper_id) AS total_papers FROM paper GROUP BY venue, year
SELECT affiliation.name, COUNT(DISTINCT paper.paper_id) AS total_papers FROM affiliation JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id JOIN paper ON author_list.paper_id = paper.paper_id GROUP BY affiliation.affiliation_id
SELECT affiliation.name, COUNT(DISTINCT paper.paper_id) AS num_papers FROM affiliation JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id JOIN paper ON author_list.paper_id = paper.paper_id GROUP BY affiliation.name
SELECT p.title FROM paper p JOIN citation c ON p.paper_id = c.cited_paper_id GROUP BY p.title HAVING COUNT(c.cited_paper_id) > 50
SELECT title FROM paper WHERE paper_id IN (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id HAVING COUNT(paper_id) > 50)
SELECT COUNT(DISTINCT a.author_id) FROM author a WHERE NOT EXISTS (SELECT 1 FROM paper p JOIN citation c ON p.paper_id = c.cited_paper_id GROUP BY c.cited_paper_id HAVING COUNT(c.paper_id) > 50 AND p.paper_id IN (SELECT al.paper_id FROM author_list al WHERE al.author_id = a.author_id))
SELECT COUNT(DISTINCT author.author_id) FROM author WHERE author.author_id NOT IN (SELECT author_list.author_id FROM author_list JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.paper_id IN (SELECT cited_paper_id FROM citation GROUP BY cited_paper_id HAVING COUNT(paper_id) > 50))
SELECT DISTINCT a.name FROM author a JOIN author_list al ON a.author_id = al.author_id JOIN paper p ON al.paper_id = p.paper_id WHERE p.venue IN ('NAACL', 'ACL') AND p.year = 2009
SELECT DISTINCT author.name FROM author JOIN author_list ON author.author_id = author_list.author_id JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.venue IN ('NAACL', 'ACL') AND paper.year = 2009 GROUP BY author.name HAVING COUNT(DISTINCT paper.venue) = 2
SELECT name FROM author WHERE author_id NOT IN (SELECT author.author_id FROM author INNER JOIN author_list ON author.author_id = author_list.author_id INNER JOIN paper ON author_list.paper_id = paper.paper_id WHERE paper.venue = 'ACL')
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM author_list WHERE paper_id IN (SELECT paper_id FROM paper WHERE venue = 'ACL'))
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference
SELECT DISTINCT conference_name FROM conference
SELECT DISTINCT conference_name FROM conference
SELECT conference_name, year, location FROM conference
SELECT conference_name, year, location FROM conference;
SELECT conference.conference_name, COUNT(conference_participation.conference_id) AS num_participations FROM conference JOIN conference_participation ON conference.conference_id = conference_participation.conference_id GROUP BY conference.conference_name
SELECT conference_name, COUNT(*) FROM conference GROUP BY conference_name
SELECT year, COUNT(conference_id) FROM conference GROUP BY year
SELECT year, COUNT(conference_id) as num_conferences FROM conference GROUP BY year
SELECT year FROM conference GROUP BY year ORDER BY COUNT(*) ASC LIMIT 1
SELECT MIN(year) FROM (SELECT year, COUNT(conference_id) AS num_conferences FROM conference GROUP BY year)
SELECT location FROM conference GROUP BY location HAVING COUNT(conference_id) >= 2
SELECT location FROM conference GROUP BY location HAVING COUNT(conference_id) >= 2
SELECT institution_name, location, founded FROM institution
SELECT institution_name, location, founded FROM institution
SELECT COUNT(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT COUNT(*) FROM institution WHERE founded BETWEEN 1850 AND 1900
SELECT institution_name, location FROM institution ORDER BY founded DESC LIMIT 1
SELECT institution_name, location FROM institution WHERE founded = (SELECT MAX(founded) FROM institution)
SELECT i.institution_name, COUNT(s.staff_id) AS staff_count FROM institution i JOIN staff s ON i.institution_id = s.institution_id WHERE i.founded > 1800 GROUP BY i.institution_name
SELECT staff.name FROM staff JOIN institution ON staff.institution_id = institution.institution_id WHERE institution.founded > 1800
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT institution_name FROM institution WHERE institution_id NOT IN (SELECT institution_id FROM staff)
SELECT name FROM staff WHERE age > (SELECT AVG(age) FROM staff)
SELECT name FROM staff WHERE age > (SELECT AVG(age) FROM staff)
SELECT MAX(age) AS maximum_age, MIN(age) AS minimum_age FROM staff WHERE nationality = 'United States'
SELECT MAX(staff.age), MIN(staff.age) FROM staff
SELECT DISTINCT conference.conference_name FROM conference JOIN conference_participation ON conference.conference_id = conference_participation.conference_id JOIN staff ON conference_participation.staff_id = staff.staff_id WHERE staff.nationality = 'Canada'
SELECT DISTINCT conference.conference_name FROM conference JOIN conference_participation ON conference.conference_id = conference_participation.conference_id JOIN staff ON conference_participation.staff_id = staff.staff_id WHERE staff.nationality = 'Canada'
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp1 ON s.staff_id = cp1.staff_id WHERE cp1.role = 'Speaker' AND EXISTS (SELECT 1 FROM conference_participation cp2 WHERE cp2.staff_id = s.staff_id AND cp2.role = 'Sponsor' AND cp2.conference_id = cp1.conference_id)
SELECT DISTINCT s.name FROM staff s INNER JOIN conference_participation cp1 ON s.staff_id = cp1.staff_id WHERE cp1.role = 'Speaker' AND EXISTS (SELECT 1 FROM conference_participation cp2 WHERE cp2.staff_id = s.staff_id AND cp2.role = 'Sponsor')
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON c.conference_id = cp.conference_id WHERE c.conference_name IN ('ACL', 'Naccl') GROUP BY s.name HAVING COUNT(DISTINCT c.conference_name) = 2
SELECT s.name FROM staff s WHERE EXISTS(SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE cp.staff_id = s.staff_id AND c.conference_name = 'ACL') AND EXISTS(SELECT 1 FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE cp.staff_id = s.staff_id AND c.conference_name = 'NACCL');
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON cp.conference_id = c.conference_id WHERE c.year IN (2003, 2004)
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON cp.conference_id = c.conference_id WHERE c.year IN (2003, 2004)
SELECT conference_name, year, COUNT(staff_id) AS participants FROM conference INNER JOIN conference_participation ON conference.conference_id = conference_participation.conference_id GROUP BY conference.conference_id
SELECT c.conference_id, c.conference_name, c.year, COUNT(cp.staff_id) AS total_participants FROM conference c JOIN conference_participation cp ON c.conference_id = cp.conference_id GROUP BY c.conference_id
SELECT conference_name FROM conference WHERE conference_id IN (SELECT conference_id FROM conference_participation GROUP BY conference_id ORDER BY COUNT(*) DESC LIMIT 2)
SELECT conference_name FROM conference WHERE conference_id IN (SELECT conference_id FROM conference_participation GROUP BY conference_id ORDER BY COUNT(staff_id) DESC LIMIT 2)
SELECT s.name, s.nationality FROM staff s WHERE s.staff_id NOT IN (SELECT cp.staff_id FROM conference_participation cp JOIN conference c ON cp.conference_id = c.conference_id WHERE c.conference_name = 'ACL')
SELECT s.name, s.nationality FROM staff s WHERE NOT EXISTS (SELECT 1 FROM conference_participation cp INNER JOIN conference c ON cp.conference_id = c.conference_id WHERE cp.staff_id = s.staff_id AND c.conference_name = 'ACL')
SELECT i.institution_name, i.location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON c.conference_id = cp.conference_id WHERE c.year = 2004 AND s.institution_id = i.institution_id)
SELECT i.institution_name, i.location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_id = cp.staff_id JOIN conference c ON cp.conference_id = c.conference_id WHERE s.institution_id = i.institution_id AND c.year = 2004)
SELECT pilot_name FROM pilotskills WHERE age = (SELECT MAX(age) FROM pilotskills)
SELECT pilot_name FROM pilotskills WHERE age = (SELECT MAX(age) FROM pilotskills)
SELECT pilot_name FROM pilotskills WHERE age < (SELECT AVG(age) FROM pilotskills) ORDER BY age
SELECT pilot_name FROM pilotskills WHERE age < (SELECT AVG(age) FROM pilotskills) ORDER BY age ASC
SELECT * FROM pilotskills WHERE age < 30
SELECT * FROM pilotskills WHERE age < 30
SELECT DISTINCT ps.pilot_name FROM pilotskills ps INNER JOIN hangar h ON ps.plane_name = h.plane_name WHERE ps.plane_name = 'Piper Cub' AND ps.age < 35
SELECT ps.pilot_name FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE ps.age < 35 AND ps.plane_name = 'Piper Cub'
SELECT location FROM hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM hangar
SELECT COUNT(DISTINCT location) FROM hangar
SELECT ps.plane_name FROM pilotskills ps WHERE ps.pilot_name = 'Jones' AND ps.age = 32
SELECT ps.plane_name FROM pilotskills ps WHERE ps.pilot_name = 'Jones' AND ps.age = 32
SELECT COUNT(DISTINCT pilot_name) FROM pilotskills WHERE age > 40
SELECT COUNT(pilot_name) FROM pilotskills WHERE age > 40
SELECT COUNT(*) FROM hangar WHERE plane_name = 'B-52 Bomber' AND location IN (SELECT pilot_name FROM pilotskills WHERE plane_name = 'B-52 Bomber' AND age < 35)
SELECT COUNT(DISTINCT ps.pilot_name) FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE h.plane_name = 'B-52 Bomber' AND ps.age < 35
SELECT pilot_name FROM pilotskills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT pilot_name FROM pilotskills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'Piper Cub')
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM hangar GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT plane_name FROM pilotskills GROUP BY plane_name ORDER BY COUNT(pilot_name) ASC LIMIT 1
SELECT COUNT(DISTINCT pilot_name) FROM pilotskills WHERE plane_name IN (SELECT plane_name FROM hangar WHERE location = 'Chicago')
SELECT COUNT(DISTINCT ps.pilot_name) FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE h.location = 'Chicago'
SELECT ps.plane_name FROM pilotskills ps WHERE ps.pilot_name = 'Smith' AND ps.age = 41
SELECT ps.plane_name FROM pilotskills ps WHERE ps.pilot_name = 'Smith' AND ps.age = 41
SELECT COUNT(DISTINCT plane_name) FROM pilotskills
SELECT COUNT(DISTINCT plane_name) FROM pilotskills
SELECT COUNT(DISTINCT plane_name) FROM pilotskills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT ps.plane_name) FROM pilotskills ps WHERE ps.pilot_name = 'Smith'
SELECT COUNT(DISTINCT ps.plane_name) FROM pilotskills ps WHERE ps.age > 40
SELECT COUNT(DISTINCT ps.plane_name) FROM pilotskills ps WHERE ps.age > 40
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM pilotskills ORDER BY age DESC
SELECT pilot_name FROM pilotskills ORDER BY age DESC
SELECT location FROM hangar ORDER BY plane_name;
SELECT location FROM hangar ORDER BY plane_name
SELECT DISTINCT ps.plane_name FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name ORDER BY ps.plane_name ASC
SELECT DISTINCT plane_name FROM hangar ORDER BY plane_name ASC
SELECT COUNT(DISTINCT pilot_name) FROM pilotskills WHERE age > 40 OR age < 30
SELECT COUNT(*) FROM pilotskills WHERE age > 40 OR age < 30
SELECT ps.pilot_name, ps.age FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE (ps.plane_name = 'Piper Cub' AND ps.age > 35) OR (ps.plane_name = 'F-14 Fighter' AND ps.age < 30)
SELECT ps.pilot_name, ps.age FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE (ps.age > 35 AND ps.plane_name = 'Piper Cub') OR (ps.age < 30 AND ps.plane_name = 'F-14 Fighter')
SELECT DISTINCT ps1.pilot_name FROM pilotskills ps1 WHERE ps1.plane_name = 'Piper Cub' AND NOT EXISTS (SELECT 1 FROM pilotskills ps2 WHERE ps2.plane_name = 'B-52 Bomber' AND ps2.pilot_name = ps1.pilot_name)
SELECT pilot_name FROM pilotskills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM pilotskills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM pilotskills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY pilot_name HAVING COUNT(DISTINCT plane_name) = 2
SELECT ps.pilot_name FROM pilotskills ps WHERE ps.plane_name = 'Piper Cub' INTERSECT SELECT ps.pilot_name FROM pilotskills ps WHERE ps.plane_name = 'B-52 Bomber';
SELECT AVG(age) AS average_age, MIN(age) AS youngest FROM pilotskills;
SELECT AVG(age) AS average_age, MIN(age) AS minimum_age FROM pilotskills
SELECT DISTINCT p1.pilot_name FROM pilotskills p1 WHERE p1.plane_name IN (SELECT plane_name FROM hangar WHERE location = 'Austin') AND p1.plane_name IN (SELECT plane_name FROM hangar WHERE location = 'Boston')
SELECT DISTINCT ps.pilot_name FROM pilotskills ps JOIN hangar h ON ps.plane_name = h.plane_name WHERE h.location IN ('Austin', 'Boston') GROUP BY ps.pilot_name HAVING COUNT(DISTINCT h.location) = 2
SELECT DISTINCT pilot_name FROM pilotskills WHERE plane_name IN ('F-14 Fighter', 'Piper Cub')
SELECT pilot_name FROM pilotskills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT plane_name, AVG(age) AS avg_age FROM pilotskills GROUP BY plane_name
SELECT ps.plane_name, AVG(ps.age) FROM pilotskills ps GROUP BY ps.plane_name
SELECT location, COUNT(plane_name) FROM hangar GROUP BY location
SELECT plane_name, COUNT(*) FROM hangar GROUP BY plane_name
SELECT ps.plane_name, ps.pilot_name FROM pilotskills ps WHERE ps.age = (SELECT MAX(age) FROM pilotskills WHERE plane_name = ps.plane_name) ORDER BY ps.plane_name
SELECT h.plane_name, ps.pilot_name FROM hangar h JOIN pilotskills ps ON h.plane_name = ps.plane_name WHERE ps.age = (SELECT MAX(age) FROM pilotskills WHERE plane_name = h.plane_name) ORDER BY h.plane_name
SELECT ps.pilot_name FROM pilotskills ps INNER JOIN (SELECT plane_name, MAX(age) AS max_age FROM pilotskills GROUP BY plane_name) max_ps ON ps.plane_name = max_ps.plane_name AND ps.age = max_ps.max_age
SELECT DISTINCT hangar.plane_name, pilotskills.pilot_name FROM hangar JOIN pilotskills ON hangar.plane_name = pilotskills.plane_name WHERE pilotskills.age = (SELECT MAX(age) FROM pilotskills WHERE pilotskills.plane_name = hangar.plane_name)
SELECT pilot_name, MAX(age) AS max_age FROM pilotskills GROUP BY pilot_name
SELECT pilot_name, MAX(age) FROM pilotskills GROUP BY pilot_name
SELECT h.location, COUNT(ps.pilot_name) AS num_pilots, AVG(ps.age) AS avg_age FROM hangar h JOIN pilotskills ps ON h.plane_name = ps.plane_name GROUP BY h.location
SELECT h.location, COUNT(DISTINCT ps.pilot_name) AS num_pilots, AVG(ps.age) AS average_age FROM hangar h JOIN pilotskills ps ON h.plane_name = ps.plane_name GROUP BY h.location
SELECT COUNT(DISTINCT ps.pilot_name) FROM pilotskills ps INNER JOIN hangar h ON ps.plane_name = h.plane_name GROUP BY ps.plane_name HAVING AVG(ps.age) < 35
SELECT h.plane_name, COUNT(p.pilot_name) FROM hangar h JOIN pilotskills p ON h.plane_name = p.plane_name GROUP BY h.plane_name HAVING AVG(p.age) < 35
SELECT h.location FROM hangar h JOIN pilotskills ps ON h.plane_name = ps.plane_name WHERE ps.age = (SELECT MIN(age) FROM pilotskills)
SELECT location FROM hangar WHERE plane_name = (SELECT plane_name FROM pilotskills ORDER BY age ASC LIMIT 1)
SELECT pilotskills.pilot_name, pilotskills.age FROM pilotskills JOIN hangar ON pilotskills.plane_name = hangar.plane_name WHERE hangar.location = 'Austin'
SELECT ps.pilot_name, ps.age FROM pilotskills ps INNER JOIN hangar h ON ps.plane_name = h.plane_name WHERE h.location = 'Austin'
SELECT DISTINCT S1.pilot_name FROM pilotskills S1 WHERE S1.age > (SELECT MAX(S2.age) FROM pilotskills S2 WHERE S2.plane_name = 'Piper Cub') ORDER BY S1.pilot_name
SELECT DISTINCT ps1.pilot_name FROM pilotskills ps1 WHERE ps1.age > (SELECT MAX(ps2.age) FROM pilotskills ps2 WHERE ps2.plane_name = 'Piper Cub') ORDER BY ps1.pilot_name
SELECT COUNT(*) FROM pilotskills WHERE age < (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(DISTINCT pilot_name) FROM pilotskills WHERE age < (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(DISTINCT ps1.pilot_name) FROM pilotskills AS ps1 WHERE ps1.age > (SELECT MIN(ps2.age) FROM pilotskills AS ps2 WHERE ps2.plane_name = 'Piper Cub')
SELECT COUNT(*) FROM pilotskills WHERE age > (SELECT MIN(age) FROM pilotskills WHERE plane_name = 'Piper Cub')
SELECT name FROM district ORDER BY area_km DESC LIMIT 1
SELECT area_km, government_website FROM district ORDER BY population LIMIT 1
SELECT d.name, d.population FROM district d WHERE d.area_km > (SELECT AVG(area_km) FROM district)
SELECT MAX(area_km) AS LargestArea, AVG(area_km) AS AverageArea FROM district
SELECT SUM(population) FROM district WHERE district_id IN (SELECT district_id FROM district ORDER BY area_km DESC LIMIT 3)
SELECT district_id, name, government_website FROM district ORDER BY population
SELECT district.name FROM district WHERE district.government_website LIKE '%.gov%'
SELECT district_id, name FROM district WHERE population > 4000 OR area_km > 3000
SELECT name, speach_title FROM spokesman
SELECT AVG(points) AS average_points, AVG(age) AS average_age FROM spokesman WHERE rank_position = 1
SELECT name, points FROM spokesman WHERE age < 40
SELECT name FROM district ORDER BY population ASC LIMIT 1
SELECT name FROM spokesman WHERE points < (SELECT AVG(points) FROM spokesman)
SELECT d.name FROM district d JOIN spokesman_district sd ON d.district_id = sd.district_id GROUP BY d.name ORDER BY COUNT(sd.spokesman_id) DESC LIMIT 1
SELECT DISTINCT s.name FROM spokesman s JOIN spokesman_district sd ON s.spokesman_id = sd.spokesman_id WHERE sd.start_year < 2004
SELECT d.name, COUNT(sd.spokesman_id) AS num_spokesmen FROM district d JOIN spokesman_district sd ON d.district_id = sd.district_id GROUP BY d.district_id
SELECT DISTINCT d.name FROM district d JOIN spokesman_district sd ON d.district_id = sd.district_id JOIN spokesman s ON sd.spokesman_id = s.spokesman_id WHERE s.rank_position IN (1, 2) GROUP BY d.name HAVING COUNT(DISTINCT s.rank_position) = 2
SELECT D.name FROM district D JOIN spokesman_district SD ON D.district_id = SD.district_id GROUP BY D.name HAVING COUNT(DISTINCT SD.spokesman_id) > 1
SELECT COUNT(*) FROM district WHERE district_id NOT IN (SELECT DISTINCT district_id FROM spokesman_district)
SELECT name FROM spokesman WHERE spokesman_id NOT IN (SELECT spokesman_id FROM spokesman_district)
SELECT SUM(d.population) AS total_population, AVG(d.population) AS average_population FROM district d WHERE d.district_id IN (SELECT distinct sd.district_id FROM spokesman_district sd)
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title FROM sculptures ORDER BY year DESC LIMIT 1
SELECT title, location FROM paintings ORDER BY year ASC LIMIT 1
SELECT title, location FROM paintings ORDER BY year ASC LIMIT 1
SELECT title FROM sculptures WHERE location = 'Gallery 226'
SELECT title FROM sculptures WHERE location = 'Gallery 226'
SELECT title, location FROM paintings;
SELECT title, location FROM paintings
SELECT title, location FROM sculptures;
SELECT title, location FROM sculptures;
SELECT medium FROM paintings WHERE paintingid = 80
SELECT medium FROM paintings WHERE paintingid = 80
SELECT sculptorid, title FROM sculptures WHERE year > 1850
SELECT fname || ' ' || lname AS full_name FROM artists WHERE birthyear > 1850
SELECT title, year FROM sculptures WHERE location != 'Gallery 226'
SELECT title, year FROM sculptures WHERE location != 'Gallery 226'
SELECT DISTINCT artists.fname, artists.lname FROM artists JOIN sculptures ON artists.artistid = sculptures.sculptorid WHERE sculptures.year < 1900
SELECT a.fname, a.lname FROM artists a JOIN sculptures s ON a.artistid = s.sculptorid WHERE s.year < 1900
SELECT DISTINCT a.birthyear FROM artists a JOIN sculptures s ON a.artistid = s.sculptorid WHERE s.year > 1920
SELECT DISTINCT a.birthyear FROM artists a JOIN sculptures s ON a.artistid = s.sculptorid WHERE s.year > 1920
SELECT fname, lname FROM artists ORDER BY (deathyear - birthyear) DESC LIMIT 1
SELECT artists.fname || ' ' || artists.lname AS FullName FROM artists ORDER BY (artists.deathyear - artists.birthyear) DESC LIMIT 1
SELECT MIN(deathyear - birthyear) AS ShortestLife FROM artists
SELECT MIN(deathyear - birthyear) AS ShortestLifespan FROM artists WHERE deathyear IS NOT NULL
SELECT fname, deathyear - birthyear AS age FROM artists WHERE (deathyear - birthyear) = (SELECT MAX(deathyear - birthyear) FROM artists);
SELECT fname, (deathyear - birthyear) AS age FROM artists ORDER BY age DESC LIMIT 1
SELECT COUNT(*) FROM paintings WHERE location = 'Gallery 240'
SELECT COUNT(*) FROM paintings WHERE location = 'Gallery 240'
SELECT COUNT(*) FROM paintings WHERE painterid = (SELECT artistid FROM artists ORDER BY (deathyear - birthyear) DESC LIMIT 1)
SELECT COUNT(*) FROM paintings WHERE painterid = (SELECT artistid FROM artists ORDER BY (deathyear - birthyear) DESC LIMIT 1)
SELECT A.fname, A.lname, P.title, P.year FROM paintings P JOIN artists A ON P.painterid = A.artistid WHERE A.fname = 'Mary'
SELECT p.title, p.year FROM paintings p JOIN artists a ON p.painterid = a.artistid WHERE a.fname = 'Mary'
SELECT p.width_mm FROM paintings p JOIN artists a ON p.painterid = a.artistid WHERE a.birthyear < 1850
SELECT width_mm FROM paintings WHERE painterid IN (SELECT artistid FROM artists WHERE birthyear < 1850)
SELECT p.location, p.medium FROM paintings p JOIN artists a ON p.painterid = a.artistid WHERE a.fname = 'Pablo'
SELECT location, medium FROM paintings WHERE painterid = (SELECT artistid FROM artists WHERE fname = 'Pablo')
SELECT a.fname, a.lname FROM artists a WHERE EXISTS (SELECT 1 FROM paintings p WHERE p.painterid = a.artistid) AND EXISTS (SELECT 1 FROM sculptures s WHERE s.sculptorid = a.artistid)
SELECT DISTINCT ar.fname || ' ' || ar.lname AS fullname FROM artists ar JOIN paintings p ON ar.artistid = p.painterid JOIN sculptures s ON ar.artistid = s.sculptorid
SELECT DISTINCT a.fname, a.lname FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' INTERSECT SELECT a.fname, a.lname FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'lithograph'
SELECT a.fname, a.lname FROM artists a INNER JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' INTERSECT SELECT a.fname, a.lname FROM artists a INNER JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'lithograph'
SELECT birthyear FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE year = 1884 AND mediumon = 'canvas')
SELECT birthyear FROM artists WHERE artistid IN (SELECT painterid FROM paintings WHERE year = 1884)
SELECT DISTINCT artists.fname FROM artists JOIN paintings ON artists.artistid = paintings.painterid WHERE paintings.medium = 'oil' AND paintings.location = 'Gallery 241'
SELECT a.fname FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' AND p.location = 'Gallery 241'
SELECT medium, COUNT(*) AS NumWorks FROM (SELECT medium FROM paintings UNION ALL SELECT medium FROM sculptures) GROUP BY medium
SELECT medium, COUNT(*) AS total_works FROM (SELECT medium FROM paintings UNION ALL SELECT medium FROM sculptures) GROUP BY medium
SELECT medium, AVG(height_mm) FROM paintings GROUP BY medium
SELECT medium, AVG(height_mm) FROM paintings GROUP BY medium
SELECT location, COUNT(*) FROM paintings WHERE year < 1900 GROUP BY location
SELECT location, COUNT(*) FROM paintings WHERE year < 1900 GROUP BY location
SELECT title FROM paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM paintings WHERE medium = 'oil' AND year > 1910
SELECT DISTINCT painterid FROM paintings WHERE medium = 'oil' AND location = 'Gallery 240'
SELECT DISTINCT painterid FROM paintings WHERE medium = 'oil' AND location = 'Gallery 240'
SELECT DISTINCT p1.title FROM paintings p1 WHERE p1.height_mm > (SELECT p2.height_mm FROM paintings p2 WHERE p2.mediumon = 'canvas')
SELECT DISTINCT p1.title FROM paintings p1 WHERE p1.height_mm > (SELECT MIN(p2.height_mm) FROM paintings p2 WHERE p2.medium = 'canvas')
SELECT DISTINCT p1.paintingid FROM paintings p1 WHERE p1.year < (SELECT MIN(p2.year) FROM paintings p2 WHERE p2.location = 'Gallery 240')
SELECT DISTINCT p1.paintingid FROM paintings p1 WHERE EXISTS (SELECT 1 FROM paintings p2 WHERE p2.location = 'Gallery 240' AND p1.year < p2.year)
SELECT paintingid FROM paintings ORDER BY year ASC LIMIT 1
SELECT paintingid FROM paintings ORDER BY year ASC LIMIT 1
SELECT fname, lname FROM artists WHERE artistid IN (SELECT sculptorid FROM sculptures WHERE title LIKE '%female%')
SELECT a.fname || ' ' || a.lname FROM artists a JOIN sculptures s ON a.artistid = s.sculptorid WHERE s.title LIKE '%female%'
SELECT DISTINCT title FROM paintings ORDER BY title ASC;
SELECT DISTINCT title FROM paintings ORDER BY title ASC
SELECT DISTINCT title FROM paintings ORDER BY LENGTH(title)
SELECT DISTINCT title FROM paintings ORDER BY height_mm ASC
SELECT title FROM paintings WHERE year BETWEEN 1900 AND 1950 UNION ALL SELECT title FROM sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM paintings WHERE painterid = 222 UNION SELECT title FROM sculptures WHERE sculptorid = 222
SELECT p.title FROM paintings p WHERE p.painterid = 222 UNION SELECT s.title FROM sculptures s WHERE s.sculptorid = 222
SELECT p.painterid FROM paintings p WHERE p.year < 1900 GROUP BY p.painterid ORDER BY COUNT(*) DESC LIMIT 1
SELECT artistid FROM artists WHERE artistid = (SELECT painterid FROM paintings WHERE year < 1900 GROUP BY painterid ORDER BY COUNT(*) DESC LIMIT 1)
SELECT fname FROM artists WHERE artistid = (SELECT sculptorid FROM sculptures GROUP BY sculptorid ORDER BY COUNT(*) DESC LIMIT 1)
SELECT a.fname FROM artists a INNER JOIN sculptures s ON a.artistid = s.sculptorid GROUP BY a.artistid ORDER BY COUNT(*) DESC LIMIT 1
SELECT title FROM paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM paintings WHERE year < 1885 OR year > 1930;
SELECT paintingid FROM paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingid FROM paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT DISTINCT location FROM paintings WHERE medium IN ('canvas', 'panel')
SELECT DISTINCT location FROM paintings WHERE medium IN ('canvas', 'panel')
SELECT DISTINCT location FROM paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM paintings WHERE year < 1885 OR year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM paintings WHERE medium = 'oil' AND location = 'Gallery 241'
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM paintings WHERE medium = 'oil' AND location = 'Gallery 241'
SELECT MAX(height_mm), paintingid FROM paintings WHERE year < 1900 GROUP BY paintingid ORDER BY height_mm DESC LIMIT 1
SELECT height_mm, paintingid FROM paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM paintings GROUP BY year
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM paintings GROUP BY year
SELECT artists.lname, AVG(paintings.height_mm) AS avg_height, AVG(paintings.width_mm) AS avg_width FROM paintings INNER JOIN artists ON paintings.painterid = artists.artistid GROUP BY artists.lname ORDER BY artists.lname
SELECT fname, lname, AVG(height_mm) AS avg_height, AVG(width_mm) AS avg_width FROM paintings JOIN artists ON paintings.painterid = artists.artistid GROUP BY paintings.painterid ORDER BY lname, fname
SELECT a.fname, COUNT(p.title) AS num_of_paintings FROM artists a JOIN paintings p ON a.artistid = p.painterid GROUP BY a.artistid HAVING COUNT(p.title) >= 2
SELECT a.fname, COUNT(p.paintingid) AS num_paintings FROM artists a JOIN paintings p ON a.artistid = p.painterid GROUP BY a.artistid HAVING num_paintings >= 2
SELECT deathyear FROM artists WHERE artistid IN (SELECT painterid FROM paintings GROUP BY painterid HAVING COUNT(*) <= 3)
SELECT a.deathyear FROM artists a WHERE a.artistid IN (SELECT p.painterid FROM paintings p GROUP BY p.painterid HAVING COUNT(p.paintingid) < 4)
SELECT a.deathyear FROM artists a WHERE a.artistid = (SELECT s.sculptorid FROM sculptures s GROUP BY s.sculptorid ORDER BY COUNT(*) ASC LIMIT 1)
SELECT a.deathyear FROM artists a WHERE a.artistid = (SELECT s.sculptorid FROM sculptures s GROUP BY s.sculptorid ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingid, height_mm FROM paintings WHERE location = 'Gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT paintingid, height_mm FROM paintings WHERE width_mm = (SELECT MAX(width_mm) FROM paintings WHERE location = 'Gallery 240') AND location = 'Gallery 240'
SELECT p.paintingid FROM paintings p WHERE p.year < (SELECT MIN(year) FROM paintings WHERE location = 'Gallery 240')
SELECT p.paintingid FROM paintings p WHERE p.year < (SELECT MIN(year) FROM paintings WHERE location = 'Gallery 240')
SELECT paintingid FROM paintings AS p WHERE p.height_mm > (SELECT MAX(height_mm) FROM paintings WHERE year > 1900)
SELECT paintingid FROM paintings WHERE height_mm > (SELECT MAX(height_mm) FROM paintings WHERE year > 1900)
SELECT fname, lname FROM artists JOIN paintings ON artists.artistid = paintings.painterid WHERE medium = 'oil' GROUP BY artists.artistid ORDER BY COUNT(*) DESC LIMIT 3
SELECT a.fname, a.lname FROM artists a JOIN paintings p ON a.artistid = p.painterid WHERE p.medium = 'oil' GROUP BY a.artistid ORDER BY COUNT(p.paintingid) DESC LIMIT 1
SELECT paintingid, location, title FROM paintings WHERE medium = 'oil' ORDER BY year
SELECT paintingid, location, title FROM paintings WHERE medium = 'oil' ORDER BY year
SELECT year, location, title FROM paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT p.year, p.location, p.title FROM paintings p WHERE p.height_mm > 1000 ORDER BY p.title ASC
SELECT a.fname, a.lname FROM artists a WHERE EXISTS (SELECT 1 FROM paintings p WHERE p.painterid = a.artistid) AND NOT EXISTS (SELECT 1 FROM sculptures s WHERE s.sculptorid = a.artistid)
SELECT a.fname, a.lname FROM artists a WHERE a.artistid IN (SELECT p.painterid FROM paintings p) AND a.artistid NOT IN (SELECT s.sculptorid FROM sculptures s)
SELECT DISTINCT p.location FROM paintings p WHERE p.year < 1885 AND p.mediumon != 'canvas'
SELECT title, year, location FROM paintings WHERE year < 1885 AND mediumon != 'canvas'
SELECT COUNT(*) FROM race
SELECT COUNT(*) FROM race
SELECT winning_driver, winning_team FROM race ORDER BY winning_team ASC
SELECT r.winning_driver, r.winning_team FROM race r ORDER BY r.winning_team ASC
SELECT DISTINCT r.winning_driver FROM race r WHERE r.pole_position != 'Junior Strous'
SELECT d.driver_name FROM race r JOIN driver d ON r.driver_id = d.driver_id WHERE r.winning_driver != 'Junior Strous'
SELECT constructor FROM driver ORDER BY age ASC
SELECT DISTINCT d.constructor FROM driver d ORDER BY d.age ASC
SELECT DISTINCT entrant FROM driver WHERE age >= 20
SELECT DISTINCT d.entrant FROM driver d WHERE d.age >= 20
SELECT MAX(age) AS MaximumAge, MIN(age) AS MinimumAge FROM driver;
SELECT MAX(age) AS MaxAge, MIN(age) AS MinAge FROM driver;
SELECT COUNT(DISTINCT engine) FROM driver WHERE age > 30 OR age < 20
SELECT COUNT(DISTINCT engine) FROM driver WHERE age > 30 OR age < 20
SELECT driver_name FROM driver ORDER BY driver_name DESC
SELECT driver_name FROM driver ORDER BY driver_name DESC
SELECT driver.driver_name, race.race_name FROM driver JOIN race ON driver.driver_id = race.driver_id
SELECT d.driver_name, r.race_name FROM driver d JOIN race r ON d.driver_id = r.driver_id
SELECT d.driver_name, COUNT(r.driver_id) FROM driver d JOIN race r ON d.driver_id = r.driver_id GROUP BY d.driver_name
SELECT driver.driver_name, COUNT(race.driver_id) AS Races_Participated FROM driver JOIN race ON driver.driver_id = race.driver_id GROUP BY driver.driver_name
SELECT d.age FROM driver d JOIN (SELECT driver_id, COUNT(*) AS race_count FROM race GROUP BY driver_id ORDER BY race_count DESC LIMIT 1) rc ON d.driver_id = rc.driver_id
SELECT d.age FROM driver d WHERE d.driver_id = (SELECT r.driver_id FROM race r GROUP BY r.driver_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT driver_name, age FROM driver WHERE driver_id IN (SELECT driver_id FROM race GROUP BY driver_id HAVING COUNT(*) >= 2)
SELECT D.driver_name, D.age FROM driver D WHERE D.driver_id IN (SELECT R.driver_id FROM race R GROUP BY R.driver_id HAVING COUNT(R.driver_id) >= 2)
SELECT race_name FROM race JOIN driver ON race.driver_id = driver.driver_id WHERE driver.age >= 26
SELECT DISTINCT r.race_name FROM race r JOIN driver d ON r.driver_id = d.driver_id WHERE d.age >= 26
SELECT driver_name FROM driver WHERE constructor <> 'Bugatti'
SELECT driver_name FROM driver WHERE constructor <> 'Bugatti'
SELECT constructor, COUNT(DISTINCT driver_id) FROM driver GROUP BY constructor
SELECT constructor, COUNT(driver_id) FROM driver GROUP BY constructor
SELECT engine FROM driver GROUP BY engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT engine FROM driver GROUP BY engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT engine FROM driver GROUP BY engine HAVING COUNT(DISTINCT driver_id) >= 2
SELECT engine FROM driver GROUP BY engine HAVING COUNT(driver_id) >= 2
SELECT driver_name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM race)
SELECT driver.driver_name FROM driver WHERE driver.driver_id NOT IN (SELECT race.driver_id FROM race)
SELECT DISTINCT d1.constructor FROM driver d1 JOIN driver d2 ON d1.constructor = d2.constructor WHERE d1.age < 20 AND d2.age > 30
SELECT DISTINCT constructor FROM driver WHERE age < 20 INTERSECT SELECT DISTINCT constructor FROM driver WHERE age > 30
SELECT winning_team FROM race GROUP BY winning_team HAVING COUNT(*) > 1
SELECT winning_team FROM race GROUP BY winning_team HAVING COUNT(*) > 1
SELECT d.driver_name FROM driver d JOIN race r ON r.driver_id = d.driver_id WHERE r.pole_position IN ('Carl Skerlong', 'James Hinchcliffe') GROUP BY d.driver_name HAVING COUNT(DISTINCT r.pole_position) = 2
SELECT driver_name FROM driver WHERE driver_id IN (SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe') INTERSECT SELECT driver_name FROM driver WHERE driver_id IN (SELECT driver_id FROM race WHERE pole_position = 'Carl Skerlong')
SELECT driver_name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe')
SELECT driver_name FROM driver WHERE driver_id NOT IN (SELECT driver_id FROM race WHERE pole_position = 'James Hinchcliffe')
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC;
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries
SELECT MAX(health_score) AS max_health, MIN(health_score) AS min_health FROM countries WHERE name <> 'Norway'
SELECT MAX(health_score) AS MaxHealthScore, MIN(health_score) AS MinHealthScore FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT languages.name) FROM official_languages JOIN languages ON official_languages.language_id = languages.id
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name as country_name, l.name as language_name FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON l.id = ol.language_id
SELECT c.name as country_name, l.name as language_name FROM countries c JOIN official_languages o ON c.id = o.country_id JOIN languages l ON o.language_id = l.id
SELECT L.name AS Language, COUNT(DISTINCT O.country_id) AS CountryCount FROM languages L JOIN official_languages O ON L.id = O.language_id GROUP BY L.name
SELECT L.name, COUNT(DISTINCT O.country_id) AS num_countries FROM languages L JOIN official_languages O ON L.id = O.language_id GROUP BY L.name
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.id ORDER BY COUNT(ol.country_id) DESC LIMIT 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT L.name FROM official_languages AS O JOIN languages AS L ON O.language_id = L.id GROUP BY L.id HAVING COUNT(DISTINCT O.country_id) >= 2
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.name HAVING COUNT(DISTINCT ol.country_id) >= 2
SELECT AVG(countries.overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT AVG(countries.overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 3)
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(DISTINCT OL.country_id) DESC LIMIT 3
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id JOIN countries C ON OL.country_id = C.id GROUP BY L.name ORDER BY AVG(C.overall_score) DESC
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id JOIN countries C ON OL.country_id = C.id GROUP BY L.name ORDER BY AVG(C.overall_score) DESC
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id GROUP BY countries.id ORDER BY COUNT(official_languages.language_id) DESC LIMIT 1
SELECT C.name FROM countries C WHERE C.id = (SELECT O.country_id FROM official_languages O GROUP BY O.country_id ORDER BY COUNT(O.language_id) DESC LIMIT 1)
SELECT l.name FROM languages l WHERE l.id NOT IN (SELECT ol.language_id FROM official_languages ol)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT c.name FROM countries c LEFT JOIN official_languages ol ON c.id = ol.country_id WHERE ol.language_id IS NULL
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id JOIN countries c ON ol.country_id = c.id WHERE c.overall_score > 95 INTERSECT SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id JOIN countries c ON ol.country_id = c.id WHERE c.overall_score < 90;
SELECT DISTINCT lang.name FROM languages lang WHERE lang.id IN (SELECT ol.language_id FROM official_languages ol INNER JOIN countries c ON ol.country_id = c.id WHERE c.overall_score > 95) AND lang.id IN (SELECT ol.language_id FROM official_languages ol INNER JOIN countries c ON ol.country_id = c.id WHERE c.overall_score < 90)
SELECT DISTINCT country, town_city FROM addresses
SELECT country, town_city FROM addresses
SELECT p.property_name, a.county_state_province FROM properties p JOIN addresses a ON p.property_address_id = a.address_id
SELECT county_state_province FROM properties JOIN addresses ON properties.property_address_id = addresses.address_id
SELECT feature_description FROM features WHERE feature_name = 'rooftop';
SELECT feature_description FROM features WHERE feature_name = 'rooftop'
SELECT features.feature_name, features.feature_description FROM features WHERE features.feature_id = (SELECT feature_id FROM property_features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT f.feature_name, f.feature_description FROM features f JOIN property_features pf ON f.feature_id = pf.feature_id GROUP BY pf.feature_id ORDER BY COUNT(pf.property_id) DESC LIMIT 1
SELECT MIN(room_count) FROM properties
SELECT MIN(room_count) FROM properties;
SELECT COUNT(*) FROM properties WHERE parking_lots = 1;
SELECT COUNT(DISTINCT property_id) FROM properties WHERE parking_lots = 1 OR property_name = 'garage'
SELECT DISTINCT r.age_category_description FROM users u JOIN ref_age_categories r ON u.age_category_code = r.age_category_code WHERE r.age_category_description LIKE '%Mother%'
SELECT DISTINCT rac.age_category_description FROM ref_age_categories rac JOIN users u ON rac.age_category_code = u.age_category_code WHERE rac.age_category_description LIKE '%Mother%'
SELECT first_name FROM users WHERE user_id = (SELECT owner_user_id FROM properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT first_name FROM users WHERE user_id = (SELECT owner_user_id FROM properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(properties.room_count) FROM properties JOIN property_features ON properties.property_id = property_features.property_id JOIN features ON property_features.feature_id = features.feature_id WHERE features.feature_name = 'garden'
SELECT AVG(room_count) AS avg_rooms FROM properties WHERE property_id IN (SELECT properties.property_id FROM properties JOIN property_features ON properties.property_id = property_features.property_id JOIN features ON property_features.feature_id = features.feature_id WHERE features.feature_name = 'garden')
SELECT DISTINCT t.town_city FROM addresses t JOIN properties p ON t.address_id = p.property_address_id JOIN property_features pf ON p.property_id = pf.property_id JOIN features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool'
SELECT DISTINCT a.town_city FROM addresses a JOIN properties p ON a.address_id = p.property_address_id JOIN features f ON f.feature_name = 'swimming pool' WHERE p.property_id IN (SELECT property_id FROM rooms);
SELECT property_id, vendor_requested_price FROM properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, MIN(vendor_requested_price) AS lowest_price FROM properties GROUP BY property_id ORDER BY lowest_price LIMIT 1
SELECT AVG(room_count) FROM properties;
SELECT AVG(room_count) FROM properties
SELECT COUNT(DISTINCT room_size) FROM rooms
SELECT COUNT(DISTINCT room_size) FROM rooms;
SELECT u.user_id, us.search_string FROM users u JOIN user_searches us ON u.user_id = us.user_id GROUP BY u.user_id, us.search_string HAVING COUNT(us.search_seq) >= 2
SELECT user_searches.user_id, user_searches.search_seq FROM user_searches GROUP BY user_searches.user_id, user_searches.search_seq HAVING COUNT(user_searches.search_seq) >= 2
SELECT MAX(search_datetime) FROM user_searches
SELECT MAX(search_datetime) AS MostRecentSearch FROM user_searches
SELECT search_datetime, search_string FROM user_searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM user_searches ORDER BY search_string DESC
SELECT DISTINCT Z.zip_postcode FROM addresses AS Z JOIN properties AS P ON Z.address_id = P.property_address_id WHERE P.owner_user_id NOT IN (SELECT U.user_id FROM users AS U JOIN properties AS PP ON U.user_id = PP.owner_user_id GROUP BY U.user_id HAVING COUNT(PP.property_id) <= 2)
SELECT DISTINCT ad.zip_postcode FROM properties pr JOIN addresses ad ON pr.property_address_id = ad.address_id WHERE pr.owner_user_id NOT IN (SELECT owner_user_id FROM properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT DISTINCT u.user_id, u.user_category_code FROM users u WHERE EXISTS (SELECT 1 FROM user_searches us WHERE us.user_id = u.user_id GROUP BY us.user_id HAVING COUNT(*) = 1)
SELECT u.user_id, u.user_category_code FROM users u WHERE u.user_id IN (SELECT user_id FROM user_searches GROUP BY user_id HAVING COUNT(*) = 1)
SELECT r.age_category_description FROM ref_age_categories r JOIN users u ON r.age_category_code = u.age_category_code JOIN user_searches us ON u.user_id = us.user_id ORDER BY us.search_datetime ASC LIMIT 1
SELECT r.age_category_description FROM ref_age_categories r JOIN users u ON r.age_category_code = u.age_category_code JOIN user_searches s ON u.user_id = s.user_id ORDER BY s.search_datetime LIMIT 1
SELECT u.login_name FROM users u INNER JOIN ref_user_categories r ON u.user_category_code = r.user_category_code WHERE r.user_category_description = 'Senior Citizen' ORDER BY u.first_name ASC
SELECT u.login_name FROM users u JOIN ref_user_categories r ON u.user_category_code = r.user_category_code WHERE r.user_category_description = 'Senior Citizen' ORDER BY u.first_name;
SELECT COUNT(*) FROM user_searches JOIN users ON user_searches.user_id = users.user_id WHERE users.is_buyer = 1
SELECT COUNT(*) FROM user_searches INNER JOIN users ON user_searches.user_id = users.user_id WHERE users.is_buyer = 1
SELECT date_registered FROM users WHERE login_name = 'ratione'
SELECT date_registered FROM users WHERE login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM users WHERE is_seller = 1
SELECT first_name, middle_name, last_name, login_name FROM users WHERE is_seller = 1
SELECT addresses.line_1_number_building, addresses.line_2_number_street, addresses.town_city FROM users INNER JOIN addresses ON users.user_address_id = addresses.address_id WHERE users.user_category_code = 'Senior Citizen'
SELECT ad.line_1_number_building, ad.line_2_number_street, ad.town_city FROM addresses ad JOIN users u ON u.user_address_id = ad.address_id JOIN ref_user_categories ruc ON ruc.user_category_code = u.user_category_code WHERE ruc.user_category_description = 'Senior Citizen'
SELECT COUNT(DISTINCT properties.property_id) FROM properties JOIN property_features ON properties.property_id = property_features.property_id GROUP BY properties.property_id HAVING COUNT(property_features.feature_id) >= 2
SELECT COUNT(DISTINCT pf.property_id) FROM property_features pf GROUP BY pf.property_id HAVING COUNT(pf.feature_id) >= 2
SELECT properties.property_id, COUNT(property_photos.photo_seq) AS photo_count FROM properties JOIN property_photos ON properties.property_id = property_photos.property_id GROUP BY properties.property_id
SELECT properties.property_id, COUNT(property_photos.photo_seq) AS photo_count FROM properties LEFT JOIN property_photos ON properties.property_id = property_photos.property_id GROUP BY properties.property_id
SELECT u.user_id, COUNT(p.photo_seq) AS photo_count FROM users u JOIN properties pr ON u.user_id = pr.owner_user_id JOIN property_photos p ON pr.property_id = p.property_id GROUP BY u.user_id
SELECT p.owner_user_id, COUNT(pp.photo_seq) AS PhotoCount FROM properties p JOIN property_photos pp ON p.property_id = pp.property_id GROUP BY p.owner_user_id
SELECT SUM(p.price_max) FROM properties p JOIN users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN ('Single Mother', 'Student')
SELECT SUM(p.price_max) FROM properties p JOIN users u ON p.owner_user_id = u.user_id JOIN ref_user_categories r ON u.user_category_code = r.user_category_code WHERE r.user_category_description IN ('Single Mother', 'Student')
SELECT u.datestamp, p.property_name FROM user_property_history u JOIN properties p ON u.property_id = p.property_id ORDER BY u.datestamp
SELECT uph.datestamp, p.property_name FROM user_property_history uph JOIN properties p ON uph.property_id = p.property_id ORDER BY uph.datestamp
SELECT ref_property_types.property_type_description, ref_property_types.property_type_code FROM properties JOIN ref_property_types ON properties.property_type_code = ref_property_types.property_type_code GROUP BY properties.property_type_code ORDER BY COUNT(properties.property_id) DESC LIMIT 1
SELECT r.property_type_description FROM ref_property_types r JOIN properties p ON r.property_type_code = p.property_type_code GROUP BY r.property_type_code ORDER BY COUNT(p.property_type_code) DESC LIMIT 1;
SELECT age_category_description FROM ref_age_categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM ref_age_categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) FROM rooms GROUP BY room_size
SELECT room_size, COUNT(*) FROM rooms GROUP BY room_size
SELECT addresses.country FROM addresses JOIN users ON users.user_address_id = addresses.address_id WHERE users.first_name = 'Robbie'
SELECT a.country FROM users u INNER JOIN addresses a ON u.user_address_id = a.address_id WHERE u.first_name = 'Robbie';
SELECT u.first_name, u.middle_name, u.last_name FROM users u JOIN properties p ON u.user_id = p.owner_user_id WHERE u.user_address_id = p.property_address_id
SELECT u.first_name || ' ' || u.last_name AS full_name FROM users u JOIN properties p ON u.user_id = p.owner_user_id WHERE u.user_address_id = p.property_address_id
SELECT u.user_id FROM users u LEFT JOIN properties p ON u.user_id = p.owner_user_id WHERE p.property_id IS NULL
SELECT us.search_string FROM user_searches us WHERE us.user_id NOT IN (SELECT p.owner_user_id FROM properties p)
SELECT u.user_id, u.last_name FROM users u WHERE (SELECT COUNT(*) FROM properties p WHERE p.owner_user_id = u.user_id) >= 2 AND (SELECT COUNT(*) FROM user_searches s WHERE s.user_id = u.user_id) <= 2
SELECT DISTINCT u.last_name, u.user_id FROM users u JOIN properties p ON u.user_id = p.owner_user_id JOIN user_searches s ON u.user_id = s.user_id GROUP BY u.user_id HAVING COUNT(DISTINCT p.property_id) >= 2 AND COUNT(DISTINCT s.search_seq) <= 2
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight) AS max_weight, MIN(weight) AS min_weight FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC';
SELECT name, result FROM cyclist WHERE nation <> 'Russia'
SELECT DISTINCT b.id, b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id WHERE cob.purchase_year > 2015
SELECT b.id, b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id WHERE b.material = 'racing' GROUP BY b.id HAVING COUNT(DISTINCT cob.cyclist_id) >= 4
SELECT c.id, c.name FROM cyclist c JOIN cyclists_own_bikes cb ON c.id = cb.cyclist_id GROUP BY c.id HAVING COUNT(cb.bike_id) = (SELECT MAX(bike_count) FROM (SELECT COUNT(bike_id) AS bike_count FROM cyclists_own_bikes GROUP BY cyclist_id));
SELECT DISTINCT B.product_name FROM bike B JOIN cyclists_own_bikes COB ON B.id = COB.bike_id JOIN cyclist C ON COB.cyclist_id = C.id WHERE C.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(DISTINCT cob.cyclist_id) FROM cyclists_own_bikes cob LEFT JOIN bike b ON cob.bike_id = b.id WHERE cob.purchase_year <= 2015
SELECT DISTINCT bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.result < '4:21.558'
SELECT DISTINCT bike.product_name, bike.price FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY bike.id HAVING COUNT(DISTINCT cyclist.name) = 2
SELECT c.name, c.nation, c.result FROM cyclist c WHERE NOT EXISTS (SELECT 1 FROM cyclists_own_bikes cob INNER JOIN bike b ON cob.bike_id = b.id WHERE cob.cyclist_id = c.id AND b.product_name LIKE '%racing%')
SELECT DISTINCT b.product_name FROM bike b WHERE b.material LIKE '%fiber%'
SELECT cyclist.id, COUNT(bike_id) FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id GROUP BY cyclist_id ORDER BY cyclist.id
SELECT flavor FROM goods WHERE food = 'cake' ORDER BY price DESC LIMIT 1
SELECT id, flavor FROM goods WHERE price = (SELECT MAX(price) FROM goods WHERE food = 'cake')
SELECT flavor FROM goods WHERE food = 'cookie' ORDER BY price ASC LIMIT 1
SELECT id, flavor FROM goods WHERE food = 'cookie' ORDER BY price LIMIT 1
SELECT id FROM goods WHERE flavor = 'apple'
SELECT id FROM goods WHERE flavor = 'apple'
SELECT id FROM goods WHERE price < 3;
SELECT id FROM goods WHERE price < 3
SELECT DISTINCT customers.id FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id WHERE goods.food = 'cake' AND goods.flavor = 'lemon'
SELECT DISTINCT c.id FROM customers c JOIN receipts r ON c.id = r.customerid JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.flavor = 'lemon' AND g.food = 'cake'
SELECT g.food, COUNT(DISTINCT r.customerid) FROM goods g JOIN items i ON g.id = i.item JOIN receipts r ON i.receipt = r.receiptnumber GROUP BY g.food
SELECT goods.food, COUNT(DISTINCT customers.id) AS customers_count FROM goods JOIN items ON goods.id = items.item JOIN receipts ON items.receipt = receipts.receiptnumber JOIN customers ON receipts.customerid = customers.id GROUP BY goods.food
SELECT DISTINCT c.id FROM customers c JOIN receipts r ON c.id = r.customerid JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.food = 'bakery' GROUP BY c.id HAVING COUNT(*) >= 15
SELECT cust.id FROM customers cust JOIN receipts rec ON cust.id = rec.customerid GROUP BY cust.id HAVING COUNT(rec.receiptnumber) >= 15
SELECT DISTINCT c.lastname FROM customers c JOIN receipts r ON c.id = r.customerid JOIN items i ON r.receiptnumber = i.receipt GROUP BY c.id HAVING COUNT(DISTINCT i.receipt) > 10
SELECT c.lastname FROM customers c WHERE (SELECT COUNT(*) FROM receipts r WHERE r.customerid = c.id) > 10
SELECT COUNT(DISTINCT id) FROM goods WHERE food = 'Cake'
SELECT COUNT(DISTINCT id) FROM goods WHERE food = 'cake';
SELECT DISTINCT g.flavor FROM goods g WHERE g.food = 'Croissant'
SELECT DISTINCT g.flavor FROM goods g WHERE g.food = 'croissant'
SELECT DISTINCT G.id FROM goods G JOIN items I ON G.id = I.item JOIN receipts R ON I.receipt = R.receiptnumber WHERE R.customerid = 15
SELECT DISTINCT goods.id FROM goods JOIN items ON goods.id = items.item JOIN receipts ON items.receipt = receipts.receiptnumber WHERE receipts.customerid = 15
SELECT food, AVG(price) AS avg_price, MAX(price) AS max_price, MIN(price) AS min_price FROM goods GROUP BY food
SELECT food, AVG(price) AS Average_Price, MIN(price) AS Min_Price, MAX(price) AS Max_Price FROM goods GROUP BY food
SELECT r.receiptnumber FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.food = 'Cake' INTERSECT SELECT r.receiptnumber FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.food = 'Cookie'
SELECT DISTINCT r.receiptnumber FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g1 ON i.item = g1.id WHERE g1.food = 'cake' AND EXISTS (SELECT 1 FROM items i2 JOIN goods g2 ON i2.item = g2.id WHERE g2.food = 'cookie' AND i2.receipt = r.receiptnumber)
SELECT receipts.receiptnumber FROM receipts JOIN customers ON receipts.customerid = customers.id JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id WHERE customers.lastname = 'LOGAN' AND goods.food = 'Croissant'
SELECT DISTINCT r.receiptnumber FROM receipts r JOIN customers c ON r.customerid = c.id JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE c.lastname = 'Logan' AND g.food = 'croissant'
SELECT r.receiptnumber, r.date FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id ORDER BY g.price DESC LIMIT 1
SELECT R.receiptnumber, R.date FROM receipts R JOIN items I ON R.receiptnumber = I.receipt JOIN goods G ON I.item = G.id WHERE G.price = (SELECT MAX(G.price) FROM goods G JOIN items I ON G.id = I.item)
SELECT item FROM items GROUP BY item ORDER BY COUNT(item) ASC LIMIT 1
SELECT items.item FROM items GROUP BY items.item ORDER BY COUNT(*) ASC LIMIT 1
SELECT food, COUNT(*) FROM goods GROUP BY food
SELECT food, COUNT(*) AS num_goods FROM goods GROUP BY food
SELECT food, AVG(price) FROM goods GROUP BY food
SELECT food, AVG(price) AS avg_price FROM goods GROUP BY food
SELECT id FROM goods WHERE flavor = 'Apricot' AND price < 5;
SELECT id FROM goods WHERE flavor = 'Apricot' AND price < 5
SELECT DISTINCT flavor FROM goods WHERE price > 10 AND food = 'cake'
SELECT DISTINCT g.flavor FROM goods g WHERE g.food = 'cake' AND g.price > 10
SELECT DISTINCT id, price FROM goods WHERE price < (SELECT AVG(price) FROM goods)
SELECT DISTINCT id, price FROM goods WHERE price < (SELECT AVG(price) FROM goods)
SELECT DISTINCT g.id FROM goods g WHERE g.price < (SELECT MIN(price) FROM goods WHERE food = 'Tart')
SELECT DISTINCT g1.id FROM goods g1 WHERE g1.price < (SELECT MIN(g2.price) FROM goods g2 WHERE g2.flavor = 'Tart')
SELECT DISTINCT r.receiptnumber FROM receipts AS r JOIN items AS i ON r.receiptnumber = i.receipt JOIN goods AS g ON i.item = g.id WHERE g.price > 13
SELECT DISTINCT receipts.receiptnumber FROM receipts JOIN items ON items.receipt = receipts.receiptnumber JOIN goods ON items.item = goods.id WHERE goods.price > 13
SELECT DISTINCT R.date FROM receipts R JOIN items I ON R.receiptnumber = I.receipt JOIN goods G ON I.item = G.id WHERE G.price > 15
SELECT DISTINCT r.date FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.price > 15
SELECT id FROM goods WHERE id LIKE '%APP%'
SELECT id FROM goods WHERE id LIKE '%APP%'
SELECT price FROM goods WHERE id LIKE '%70%'
SELECT id, price FROM goods WHERE id LIKE '%70%'
SELECT lastname FROM customers ORDER BY lastname ASC
SELECT DISTINCT lastname FROM customers ORDER BY lastname ASC
SELECT id FROM goods ORDER BY id
SELECT DISTINCT item FROM items;
SELECT DISTINCT r.receiptnumber FROM receipts r WHERE r.customerid = 12 OR r.receiptnumber IN (SELECT i.receipt FROM items i JOIN goods g ON i.item = g.id WHERE g.flavor = 'apple' AND g.food = 'pie')
SELECT DISTINCT receipts.receiptnumber FROM receipts JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id JOIN customers ON receipts.customerid = customers.id WHERE goods.flavor = 'apple' AND goods.food = 'pie' OR customers.id = 12
SELECT receiptnumber, date FROM receipts WHERE date = (SELECT MAX(date) FROM receipts)
SELECT receiptnumber, date FROM receipts ORDER BY date DESC LIMIT 1
SELECT DISTINCT rc.receiptnumber FROM receipts rc LEFT JOIN items it ON rc.receiptnumber = it.receipt LEFT JOIN goods gd ON it.item = gd.id WHERE rc.date = (SELECT MIN(date) FROM receipts) OR gd.price > 10
SELECT DISTINCT receiptnumber FROM receipts WHERE receiptnumber IN (SELECT receipt FROM items JOIN goods ON items.item = goods.id WHERE goods.price > 10) OR date = (SELECT MIN(date) FROM receipts)
SELECT id FROM goods WHERE food IN ('Cookie', 'Cake') AND price BETWEEN 3 AND 7
SELECT id FROM goods WHERE food IN ('Cookies', 'Cakes') AND price BETWEEN 3 AND 7
SELECT C.firstname, C.lastname FROM customers C JOIN receipts R ON C.id = R.customerid WHERE R.date = (SELECT MIN(date) FROM receipts)
SELECT firstname || ' ' || lastname FROM customers WHERE id = (SELECT customerid FROM receipts ORDER BY date LIMIT 1)
SELECT AVG(price) FROM goods WHERE flavor IN ('blackberry', 'blueberry')
SELECT AVG(price) FROM goods WHERE flavor IN ('blackberry', 'blueberry')
SELECT MIN(price) FROM goods WHERE flavor = 'cheese'
SELECT id FROM goods WHERE flavor = 'cheese' ORDER BY price LIMIT 1
SELECT flavor, MAX(price) AS highest, MIN(price) AS lowest, AVG(price) AS average FROM goods GROUP BY flavor ORDER BY flavor
SELECT flavor, MAX(price) AS max_price, MIN(price) AS min_price, AVG(price) AS avg_price FROM goods GROUP BY flavor ORDER BY flavor
SELECT food, MIN(price) AS LowestPrice, MAX(price) AS HighestPrice FROM goods GROUP BY food ORDER BY food;
SELECT food, MIN(price) AS MinPrice, MAX(price) AS MaxPrice FROM goods GROUP BY food ORDER BY food
SELECT date FROM receipts GROUP BY date ORDER BY COUNT(receiptnumber) DESC LIMIT 3
SELECT date FROM receipts GROUP BY date ORDER BY COUNT(*) DESC LIMIT 3
SELECT customers.firstname, customers.lastname, COUNT(*) AS shopping_count FROM customers JOIN receipts ON customers.id = receipts.customerid GROUP BY customers.id ORDER BY shopping_count DESC LIMIT 1
SELECT customerid, COUNT(*) AS num_purchases FROM receipts GROUP BY customerid ORDER BY num_purchases DESC LIMIT 1
SELECT date, COUNT(DISTINCT customerid) FROM receipts GROUP BY date
SELECT r.date, COUNT(DISTINCT r.customerid) FROM receipts r GROUP BY r.date
SELECT c.firstname, c.lastname FROM customers c JOIN receipts r ON c.id = r.customerid JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id WHERE g.flavor = 'apple' AND g.food = 'Tart'
SELECT customers.firstname || ' ' || customers.lastname FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id WHERE goods.food = 'Tarts' AND goods.flavor = 'apple'
SELECT G.id FROM goods G WHERE G.food = 'Cookies' AND G.price < (SELECT MIN(price) FROM goods WHERE food = 'Croissant')
SELECT id FROM goods WHERE price < (SELECT MIN(price) FROM goods WHERE food = 'croissant') AND food = 'cookies'
SELECT g.id FROM goods g WHERE g.food = 'Cake' AND g.price >= (SELECT AVG(price) FROM goods WHERE food = 'Tart')
SELECT id FROM goods WHERE food = 'cake' AND price >= (SELECT AVG(price) FROM goods WHERE food = 'Tart')
SELECT id FROM goods WHERE price > 2 * (SELECT AVG(price) FROM goods)
SELECT id FROM goods WHERE price > 2 * (SELECT AVG(price) FROM goods)
SELECT id, flavor, food FROM goods ORDER BY price
SELECT id, flavor, food FROM goods ORDER BY price
SELECT g.id, g.flavor FROM goods g JOIN items i ON g.id = i.item WHERE g.food = 'Cake' ORDER BY g.flavor
SELECT id, flavor FROM goods WHERE food = 'cake' ORDER BY flavor
SELECT g.id FROM goods g WHERE g.flavor = 'chocolate' AND (SELECT COUNT(*) FROM items i WHERE i.item = g.id) <= 10
SELECT item FROM items JOIN goods ON items.item = goods.id WHERE goods.flavor = 'chocolate' GROUP BY item HAVING COUNT(*) <= 10
SELECT DISTINCT g1.flavor FROM goods g1 WHERE g1.food = 'Cake' AND g1.flavor NOT IN (SELECT g2.flavor FROM goods g2 WHERE g2.food = 'Tart')
SELECT DISTINCT g1.flavor FROM goods g1 WHERE g1.food = 'Cake' AND g1.flavor NOT IN (SELECT g2.flavor FROM goods g2 WHERE g2.food = 'Tart')
SELECT goods.id, COUNT(*) AS popularity FROM items JOIN goods ON items.item = goods.id GROUP BY goods.id ORDER BY popularity DESC LIMIT 3
SELECT goods.id FROM goods JOIN items ON goods.id = items.item GROUP BY goods.id ORDER BY COUNT(*) DESC LIMIT 3
SELECT DISTINCT cu.id FROM customers cu JOIN receipts re ON cu.id = re.customerid JOIN items it ON it.receipt = re.receiptnumber JOIN goods go ON it.item = go.id GROUP BY cu.id HAVING SUM(go.price) > 150
SELECT customers.id FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id GROUP BY customers.id HAVING SUM(goods.price) > 150
SELECT customers.id FROM customers JOIN receipts ON customers.id = receipts.customerid JOIN items ON receipts.receiptnumber = items.receipt JOIN goods ON items.item = goods.id GROUP BY customers.id HAVING AVG(goods.price) > 5
SELECT DISTINCT c.id FROM customers c JOIN receipts r ON c.id = r.customerid JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id GROUP BY c.id HAVING AVG(g.price) > 5
SELECT r.date FROM receipts r JOIN items i ON r.receiptnumber = i.receipt JOIN goods g ON i.item = g.id GROUP BY r.date HAVING SUM(g.price) > 100;
SELECT R.date FROM receipts R JOIN items I ON R.receiptnumber = I.receipt JOIN goods G ON I.item = G.id GROUP BY R.date HAVING SUM(G.price) > 100
SELECT COUNT(*) FROM driver
SELECT COUNT(driver_id) FROM driver
SELECT make, COUNT(driver_id) FROM driver WHERE points > 150 GROUP BY make
SELECT make, COUNT(*) FROM driver WHERE points > 150 GROUP BY make
SELECT make, AVG(age) AS average_age FROM driver GROUP BY make
SELECT make, AVG(age) AS average_age FROM driver GROUP BY make
SELECT AVG(laps) FROM driver WHERE age < 20
SELECT AVG(d.laps) FROM driver d WHERE d.age < 20
SELECT manager, sponsor FROM team ORDER BY car_owner
SELECT manager, sponsor FROM team ORDER BY car_owner
SELECT make FROM team GROUP BY make HAVING COUNT(team_id) > 1
SELECT make FROM team GROUP BY make HAVING COUNT(team_id) > 1
SELECT DISTINCT team.make FROM team WHERE team.car_owner = 'Buddy Arrington'
SELECT make FROM team WHERE car_owner = 'Buddy Arrington'
SELECT MAX(points) AS MaximumPoints, MIN(points) AS MinimumPoints FROM driver
SELECT MAX(points) AS HighestPoints, MIN(points) AS LowestPoints FROM driver
SELECT COUNT(*) FROM driver WHERE points < 150
SELECT COUNT(*) FROM driver WHERE points < 150
SELECT driver FROM driver ORDER BY age ASC
SELECT driver FROM driver ORDER BY age ASC;
SELECT driver FROM driver ORDER BY points DESC
SELECT driver FROM driver ORDER BY points DESC
SELECT driver.driver, driver.country FROM driver
SELECT driver.driver, driver.country FROM driver
SELECT MAX(driver.points) FROM driver JOIN country ON driver.country = country.country WHERE country.capital = 'Dublin'
SELECT MAX(d.points) FROM driver d JOIN country c ON d.country = c.country WHERE c.capital = 'Dublin'
SELECT AVG(D.age) FROM driver D JOIN country C ON D.country = C.country WHERE C.official_native_language = 'English'
SELECT AVG(d.age) FROM driver d JOIN country c ON d.country = c.country WHERE c.official_native_language = 'English'
SELECT DISTINCT country FROM driver WHERE points > 150
SELECT DISTINCT country.country FROM country JOIN driver ON country.country = driver.country WHERE driver.points > 150;
SELECT capital FROM country WHERE country = (SELECT country FROM driver ORDER BY points DESC LIMIT 1)
SELECT capital FROM country WHERE country = (SELECT country FROM driver WHERE driver_id = (SELECT driver_id FROM driver ORDER BY points DESC LIMIT 1))
SELECT make, COUNT(driver_id) FROM driver GROUP BY make
SELECT d.make, COUNT(d.driver_id) FROM driver d GROUP BY d.make
SELECT D.make FROM driver D JOIN team_driver TD ON D.driver_id = TD.driver_id GROUP BY D.make ORDER BY COUNT(D.driver_id) DESC LIMIT 1
SELECT make FROM driver GROUP BY make ORDER BY COUNT(*) DESC LIMIT 1
SELECT make FROM driver GROUP BY make HAVING COUNT(driver_id) >= 3
SELECT make FROM driver GROUP BY make HAVING COUNT(*) >= 3
SELECT team FROM team WHERE team_id NOT IN (SELECT team_id FROM team_driver)
SELECT t.team FROM team t LEFT JOIN team_driver td ON t.team_id = td.team_id WHERE td.driver_id IS NULL
SELECT DISTINCT d.country FROM driver d WHERE d.make = 'Dodge' AND EXISTS (SELECT 1 FROM driver WHERE make = 'Chevrolet' AND country = d.country)
SELECT DISTINCT d.country FROM driver d WHERE d.make IN ('Dodge', 'Chevrolet') GROUP BY d.country HAVING COUNT(DISTINCT d.make) = 2
SELECT SUM(points) AS total_points, AVG(points) AS average_points FROM driver;
SELECT SUM(points) AS TotalPoints, AVG(points) AS AveragePoints FROM driver
SELECT country FROM country WHERE country NOT IN (SELECT country FROM driver)
SELECT country FROM country WHERE country NOT IN (SELECT country FROM driver)
SELECT t.manager, t.sponsor FROM team t JOIN team_driver td ON t.team_id = td.team_id GROUP BY t.team_id ORDER BY COUNT(td.driver_id) DESC LIMIT 1
SELECT team.manager, team.sponsor FROM team JOIN team_driver ON team.team_id = team_driver.team_id GROUP BY team.team_id ORDER BY COUNT(team_driver.driver_id) DESC LIMIT 1
SELECT DISTINCT t.manager, t.car_owner FROM team t JOIN team_driver td ON t.team_id = td.team_id GROUP BY t.team_id HAVING COUNT(DISTINCT td.driver_id) >= 2
SELECT manager, car_owner FROM team WHERE team_id IN (SELECT team_id FROM team_driver GROUP BY team_id HAVING COUNT(driver_id) >= 2)
SELECT COUNT(*) FROM institution
SELECT COUNT(*) FROM institution
SELECT name FROM institution ORDER BY name ASC
SELECT name FROM institution ORDER BY name ASC;
SELECT name FROM institution ORDER BY founded ASC
SELECT name FROM institution ORDER BY founded
SELECT DISTINCT city, province FROM institution
SELECT city, province FROM institution
SELECT MAX(enrollment) AS MaxEnrollment, MIN(enrollment) AS MinEnrollment FROM institution
SELECT MAX(enrollment) AS MaxEnrollment, MIN(enrollment) AS MinEnrollment FROM institution
SELECT DISTINCT affiliation FROM institution WHERE city != 'Vancouver'
SELECT affiliation FROM institution WHERE city != 'Vancouver'
SELECT stadium FROM institution ORDER BY capacity DESC
SELECT stadium FROM institution ORDER BY capacity DESC
SELECT stadium FROM institution WHERE enrollment = (SELECT MAX(enrollment) FROM institution);
SELECT stadium FROM institution WHERE enrollment = (SELECT MAX(enrollment) FROM institution)
SELECT i.name, c.nickname FROM institution i JOIN championship c ON i.institution_id = c.institution_id
SELECT i.name, c.nickname FROM institution i JOIN championship c ON i.institution_id = c.institution_id
SELECT c.nickname FROM championship c JOIN institution i ON c.institution_id = i.institution_id ORDER BY i.enrollment ASC LIMIT 1
SELECT c.nickname FROM championship c JOIN institution i ON c.institution_id = i.institution_id WHERE i.enrollment = (SELECT MIN(enrollment) FROM institution)
SELECT i.name FROM institution i JOIN championship c ON i.institution_id = c.institution_id ORDER BY c.number_of_championships DESC
SELECT i.name FROM institution i INNER JOIN championship c ON i.institution_id = c.institution_id ORDER BY c.number_of_championships DESC
SELECT DISTINCT i.name FROM institution i JOIN championship c ON i.institution_id = c.institution_id WHERE c.number_of_championships >= 1
SELECT i.name FROM institution i JOIN championship c ON i.institution_id = c.institution_id WHERE c.number_of_championships >= 1
SELECT SUM(championship.number_of_championships) FROM championship JOIN institution ON championship.institution_id = institution.institution_id WHERE institution.affiliation = 'Public'
SELECT SUM(c.number_of_championships) FROM institution i JOIN championship c ON i.institution_id = c.institution_id WHERE i.affiliation = 'Public'
SELECT affiliation, COUNT(*) AS num_institutions FROM institution GROUP BY affiliation
SELECT affiliation, COUNT(*) AS total_institutions FROM institution GROUP BY affiliation
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT affiliation FROM institution GROUP BY affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT founded FROM institution GROUP BY founded HAVING COUNT(*) > 1
SELECT founded, COUNT(*) AS count FROM institution GROUP BY founded HAVING COUNT(*) > 1
SELECT c.nickname FROM institution i JOIN championship c ON i.institution_id = c.institution_id ORDER BY i.capacity DESC
SELECT c.nickname FROM championship c JOIN institution i ON c.institution_id = i.institution_id ORDER BY i.capacity DESC
SELECT SUM(enrollment) FROM institution WHERE city IN ('Vancouver', 'Calgary')
SELECT enrollment FROM institution WHERE city IN ('Calgary', 'Vancouver')
SELECT DISTINCT i1.province FROM institution i1, institution i2 WHERE i1.province = i2.province AND i1.founded < 1920 AND i2.founded > 1950
SELECT DISTINCT i1.province FROM institution i1 WHERE i1.founded < 1920 AND EXISTS (SELECT i2.province FROM institution i2 WHERE i2.province = i1.province AND i2.founded > 1950)
SELECT COUNT(DISTINCT province) FROM institution
SELECT COUNT(DISTINCT province) FROM institution
SELECT * FROM warehouses
SELECT * FROM warehouses;
SELECT DISTINCT boxes.contents FROM boxes JOIN warehouses ON boxes.warehouse = warehouses.code WHERE warehouses.location = 'New York'
SELECT DISTINCT contents FROM boxes JOIN warehouses ON boxes.warehouse = warehouses.code WHERE warehouses.location = 'New York'
SELECT contents FROM boxes WHERE value > 150
SELECT contents FROM boxes WHERE value > 150
SELECT b.warehouse, AVG(b.value) FROM boxes b GROUP BY b.warehouse
SELECT AVG(boxes.value) AS average_value, warehouse FROM boxes GROUP BY warehouse
SELECT AVG(value) AS AverageValue, SUM(value) AS TotalValue FROM boxes
SELECT AVG(value), SUM(value) FROM boxes
SELECT AVG(capacity) AS avg_capacity, SUM(capacity) AS total_capacity FROM warehouses
SELECT AVG(capacity) AS average_capacity, SUM(capacity) AS total_capacity FROM warehouses
SELECT contents, AVG(value) AS AverageValue, MAX(value) AS MaxValue FROM boxes GROUP BY contents
SELECT contents, AVG(value) AS average_value, MAX(value) AS maximum_value FROM boxes GROUP BY contents
SELECT contents FROM boxes GROUP BY contents ORDER BY SUM(value) DESC LIMIT 1
SELECT contents FROM boxes ORDER BY value DESC LIMIT 1
SELECT AVG(value) FROM boxes
SELECT AVG(value) FROM boxes
SELECT DISTINCT contents FROM boxes
SELECT DISTINCT contents FROM boxes;
SELECT COUNT(DISTINCT contents) FROM boxes
SELECT COUNT(DISTINCT contents) FROM boxes
SELECT DISTINCT location FROM warehouses;
SELECT DISTINCT location FROM warehouses;
SELECT code FROM boxes WHERE warehouse IN (SELECT code FROM warehouses WHERE location IN ('Chicago', 'New York'))
SELECT b.code FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location IN ('Chicago', 'New York')
SELECT SUM(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location IN ('Chicago', 'New York')
SELECT SUM(value) FROM boxes JOIN warehouses ON boxes.warehouse = warehouses.code WHERE location IN ('Chicago', 'New York')
SELECT DISTINCT b.contents FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location IN ('Chicago', 'New York')
SELECT DISTINCT b.contents FROM boxes AS b JOIN warehouses AS w1 ON b.warehouse = w1.code JOIN warehouses AS w2 ON b.warehouse = w2.code WHERE w1.location = 'Chicago' AND w2.location = 'New York'
SELECT DISTINCT b.contents FROM boxes b WHERE b.warehouse NOT IN (SELECT w.code FROM warehouses w WHERE w.location = 'New York')
SELECT DISTINCT contents FROM boxes WHERE warehouse NOT IN (SELECT code FROM warehouses WHERE location = 'New York')
SELECT w.location FROM warehouses w WHERE EXISTS (SELECT 1 FROM boxes b WHERE b.contents = 'Rocks' AND b.warehouse = w.code) AND NOT EXISTS (SELECT 1 FROM boxes b WHERE b.contents = 'Scissors' AND b.warehouse = w.code)
SELECT DISTINCT w.location FROM warehouses w JOIN boxes b ON w.code = b.warehouse WHERE b.contents = 'Rocks' AND b.warehouse NOT IN (SELECT warehouse FROM boxes WHERE contents = 'Scissors')
SELECT DISTINCT warehouses.location FROM warehouses JOIN boxes ON warehouses.code = boxes.warehouse WHERE boxes.contents IN ('Rocks', 'Scissors')
SELECT DISTINCT warehouse FROM boxes WHERE contents IN ('Rocks', 'Scissors')
SELECT DISTINCT w.location FROM warehouses w JOIN boxes b ON w.code = b.warehouse WHERE b.contents IN ('Rocks', 'Scissors') GROUP BY w.location HAVING COUNT(DISTINCT b.contents) = 2
SELECT DISTINCT w.location FROM warehouses w JOIN boxes b ON w.code = b.warehouse WHERE b.contents = 'Rocks' OR b.contents = 'Scissors'
SELECT code, contents FROM boxes ORDER BY value
SELECT code, contents FROM boxes ORDER BY value
SELECT code, contents FROM boxes WHERE value = (SELECT MIN(value) FROM boxes)
SELECT code, contents FROM boxes WHERE value = (SELECT MIN(value) FROM boxes)
SELECT DISTINCT B.contents FROM boxes B WHERE B.value > (SELECT AVG(value) FROM boxes)
SELECT DISTINCT contents FROM boxes WHERE value > (SELECT AVG(value) FROM boxes)
SELECT DISTINCT contents FROM boxes ORDER BY contents
SELECT DISTINCT contents FROM boxes ORDER BY contents ASC
SELECT DISTINCT b1.code FROM boxes b1 WHERE b1.value > (SELECT MAX(b2.value) FROM boxes b2 WHERE b2.contents = 'Rocks')
SELECT b.code FROM boxes b WHERE b.value > (SELECT MAX(b2.value) FROM boxes b2 WHERE b2.contents = 'Rocks')
SELECT b.code, b.contents FROM boxes b WHERE b.value > (SELECT MAX(b2.value) FROM boxes b2 WHERE b2.contents = 'Scissors')
SELECT code, contents FROM boxes WHERE value > (SELECT MAX(value) FROM boxes WHERE contents = 'Scissors')
SELECT SUM(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.capacity = (SELECT MAX(capacity) FROM warehouses)
SELECT SUM(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code ORDER BY w.capacity DESC LIMIT 1
SELECT warehouses.code, AVG(boxes.value) AS avg_value FROM boxes JOIN warehouses ON boxes.warehouse = warehouses.code GROUP BY warehouses.code HAVING AVG(boxes.value) > 150
SELECT boxes.warehouse, AVG(boxes.value) AS average_value FROM boxes GROUP BY boxes.warehouse HAVING average_value > 150
SELECT contents, SUM(value) AS total_value, COUNT(*) AS num_boxes FROM boxes GROUP BY contents
SELECT contents, SUM(value) AS total_value, COUNT(*) AS num_boxes FROM boxes GROUP BY contents
SELECT SUM(capacity) AS total_capacity, AVG(capacity) AS average_capacity, MAX(capacity) AS max_capacity FROM warehouses GROUP BY location
SELECT location, SUM(capacity) AS total_capacity, AVG(capacity) AS average_capacity, MAX(capacity) AS max_capacity FROM warehouses GROUP BY location
SELECT SUM(capacity) FROM warehouses;
SELECT SUM(capacity) FROM warehouses
SELECT MAX(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code GROUP BY w.location
SELECT w.location, MAX(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code GROUP BY w.location
SELECT warehouses.code, COUNT(boxes.code) FROM warehouses LEFT JOIN boxes ON warehouses.code = boxes.warehouse GROUP BY warehouses.code
SELECT warehouse, COUNT(*) AS box_count FROM boxes GROUP BY warehouse
SELECT COUNT(DISTINCT location) FROM warehouses WHERE code IN (SELECT warehouse FROM boxes WHERE contents = 'Rocks')
SELECT COUNT(DISTINCT warehouse) FROM boxes WHERE contents = 'Rocks';
SELECT boxes.code, warehouses.location FROM boxes INNER JOIN warehouses ON boxes.warehouse = warehouses.code
SELECT b.code, w.location FROM boxes AS b JOIN warehouses AS w ON b.warehouse = w.code
SELECT b.code FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location = 'Chicago'
SELECT b.code FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location = 'Chicago'
SELECT w.code, COUNT(b.code) FROM warehouses w LEFT JOIN boxes b ON w.code = b.warehouse GROUP BY w.code
SELECT boxes.warehouse, COUNT(*) as total_boxes FROM boxes GROUP BY boxes.warehouse
SELECT w.location, COUNT(DISTINCT b.contents) FROM warehouses w JOIN boxes b ON w.code = b.warehouse GROUP BY w.code
SELECT warehouse, COUNT(DISTINCT contents) FROM boxes GROUP BY warehouse
SELECT w.code FROM warehouses w WHERE w.capacity < (SELECT COUNT(*) FROM boxes b WHERE b.warehouse = w.code)
SELECT warehouses.code FROM warehouses JOIN boxes ON warehouses.code = boxes.warehouse GROUP BY warehouses.code HAVING COUNT(boxes.code) > warehouses.capacity
SELECT SUM(b.value) FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location != 'Chicago'
SELECT SUM(b.value) AS TotalValue FROM boxes b JOIN warehouses w ON b.warehouse = w.code WHERE w.location != 'Chicago'
SELECT university_name, city, state FROM university ORDER BY university_name ASC
SELECT university_name, city, state FROM university ORDER BY university_name ASC
SELECT COUNT(*) FROM university WHERE state IN ('Illinois', 'Ohio')
SELECT COUNT(*) FROM university WHERE state IN ('Illinois', 'Ohio');
SELECT MAX(enrollment) AS MaxEnrollment, AVG(enrollment) AS AvgEnrollment, MIN(enrollment) AS MinEnrollment FROM university
SELECT MAX(enrollment), AVG(enrollment), MIN(enrollment) FROM university
SELECT team_name FROM university WHERE enrollment > (SELECT AVG(enrollment) FROM university)
SELECT team_name FROM university WHERE enrollment > (SELECT AVG(enrollment) FROM university)
SELECT DISTINCT home_conference FROM university;
SELECT DISTINCT home_conference FROM university;
SELECT home_conference, COUNT(university_id) AS total_universities FROM university GROUP BY home_conference
SELECT home_conference, COUNT(university_id) FROM university GROUP BY home_conference
SELECT state FROM university GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM university GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT home_conference, AVG(enrollment) FROM university GROUP BY home_conference HAVING AVG(enrollment) > 2000
SELECT home_conference FROM university GROUP BY home_conference HAVING AVG(enrollment) > 2000
SELECT home_conference FROM university GROUP BY home_conference ORDER BY SUM(enrollment) ASC LIMIT 1
SELECT U.home_conference FROM university U GROUP BY U.home_conference ORDER BY SUM(U.enrollment) ASC LIMIT 1
SELECT major_name, major_code FROM major ORDER BY major_code
SELECT major_name, major_code FROM major ORDER BY major_code
SELECT m.major_name, mr.rank FROM major m JOIN major_ranking mr ON m.major_id = mr.major_id JOIN university u ON mr.university_id = u.university_id WHERE u.university_name = 'Augustana College'
SELECT m.major_name, mr.rank FROM university u JOIN major_ranking mr ON u.university_id = mr.university_id JOIN major m ON mr.major_id = m.major_id WHERE u.university_name = 'Augustana College'
SELECT university_name, city, state FROM university WHERE university_id IN (SELECT university_id FROM major_ranking WHERE rank = 1 AND major_id = (SELECT major_id FROM major WHERE major_name = 'Accounting'))
SELECT U.university_name, U.city, U.state FROM university U JOIN major_ranking R ON R.university_id = U.university_id JOIN major M ON M.major_id = R.major_id WHERE M.major_name = 'Accounting' AND R.rank = 1
SELECT u.university_name FROM university u JOIN major_ranking m ON u.university_id = m.university_id WHERE m.rank = 1 GROUP BY u.university_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT university_name FROM university WHERE university_id = (SELECT university_id FROM major_ranking WHERE rank = 1 GROUP BY university_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT u.university_name FROM university u WHERE NOT EXISTS (SELECT * FROM major_ranking mr WHERE mr.rank = 1 AND mr.university_id = u.university_id)
SELECT university_name FROM university WHERE university_id NOT IN (SELECT university_id FROM major_ranking WHERE rank = 1)
SELECT DISTINCT U.university_name FROM university U WHERE EXISTS (SELECT 1 FROM major M JOIN major_ranking MR ON M.major_id = MR.major_id WHERE MR.university_id = U.university_id AND M.major_name = 'Accounting') AND EXISTS (SELECT 1 FROM major M JOIN major_ranking MR ON M.major_id = MR.major_id WHERE MR.university_id = U.university_id AND M.major_name = 'Urban Education')
SELECT university_name FROM university WHERE university_id IN (SELECT mr.university_id FROM major_ranking mr JOIN major m ON mr.major_id = m.major_id WHERE m.major_name = 'Accounting' INTERSECT SELECT mr.university_id FROM major_ranking mr JOIN major m ON mr.major_id = m.major_id WHERE m.major_name = 'Urban Education')
SELECT university_name, rank FROM university INNER JOIN overall_ranking ON university.university_id = overall_ranking.university_id WHERE state = 'Wisconsin'
SELECT university_name, rank FROM university JOIN overall_ranking ON university.university_id = overall_ranking.university_id WHERE state = 'Wisconsin'
SELECT university_name FROM university WHERE university_id = (SELECT university_id FROM overall_ranking ORDER BY research_point DESC LIMIT 1)
SELECT U.university_name FROM university U JOIN overall_ranking O ON U.university_id = O.university_id ORDER BY O.research_point DESC LIMIT 1
SELECT university_name FROM university JOIN overall_ranking ON university.university_id = overall_ranking.university_id ORDER BY reputation_point ASC
SELECT university.university_name FROM university JOIN overall_ranking ON university.university_id = overall_ranking.university_id ORDER BY overall_ranking.reputation_point ASC
SELECT university.university_name FROM university JOIN major_ranking ON university.university_id = major_ranking.university_id JOIN major ON major_ranking.major_id = major.major_id WHERE major.major_name = 'Accounting' AND major_ranking.rank <= 3
SELECT U.university_name FROM university U INNER JOIN major_ranking MR ON U.university_id = MR.university_id INNER JOIN major M ON MR.major_id = M.major_id WHERE M.major_name = 'Accounting' AND MR.rank <= 3
SELECT SUM(u.enrollment) FROM university AS u JOIN overall_ranking AS o ON u.university_id = o.university_id WHERE o.rank <= 5
SELECT SUM(university.enrollment) FROM university JOIN overall_ranking ON university.university_id = overall_ranking.university_id WHERE overall_ranking.rank <= 5
SELECT U.university_name, O.citation_point FROM university U JOIN overall_ranking O ON U.university_id = O.university_id WHERE O.rank <= 3
SELECT university.university_name, overall_ranking.citation_point FROM overall_ranking JOIN university ON overall_ranking.university_id = university.university_id ORDER BY overall_ranking.reputation_point DESC LIMIT 3
SELECT state FROM university GROUP BY state HAVING COUNT(university_id) > 2 AND MAX(enrollment) < 3000
SELECT state FROM university GROUP BY state HAVING COUNT(university_id) > 2 AND SUM(CASE WHEN enrollment < 3000 THEN 1 ELSE 0 END) > 2
SELECT title FROM movies WHERE rating IS NULL
SELECT title FROM movies WHERE rating IS NULL
SELECT title FROM movies WHERE rating = 'G'
SELECT title FROM movies WHERE rating = 'G'
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')
SELECT m.title FROM movies m JOIN movietheaters mt ON mt.movie = m.code WHERE mt.name = 'Odeon'
SELECT movies.title, movietheaters.name FROM movietheaters JOIN movies ON movietheaters.movie = movies.code
SELECT movies.title, movietheaters.name FROM movietheaters JOIN movies ON movietheaters.movie = movies.code
SELECT COUNT(*) FROM movies WHERE rating = 'G'
SELECT COUNT(*) FROM movies WHERE rating = 'G'
SELECT COUNT(DISTINCT movie) FROM movietheaters
SELECT COUNT(DISTINCT movie) FROM movietheaters
SELECT COUNT(DISTINCT movie) FROM movietheaters;
SELECT COUNT(DISTINCT movie) FROM movietheaters
SELECT COUNT(DISTINCT name) FROM movietheaters;
SELECT COUNT(DISTINCT name) FROM movietheaters
SELECT rating FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name LIKE '%Citizen%')
SELECT rating FROM movies WHERE title LIKE '%Citizen%'
SELECT DISTINCT mt.name FROM movietheaters AS mt JOIN movies AS m ON mt.movie = m.code WHERE m.rating IN ('G', 'PG')
SELECT DISTINCT mt.name FROM movietheaters mt JOIN movies mv ON mt.movie = mv.code WHERE mv.rating IN ('G', 'PG')
SELECT DISTINCT movies.title FROM movietheaters JOIN movies ON movietheaters.movie = movies.code WHERE movietheaters.name IN ('Odeon', 'Imperial')
SELECT DISTINCT movies.title FROM movies JOIN movietheaters ON movies.code = movietheaters.movie WHERE movietheaters.name IN ('Odeon', 'Imperial')
SELECT title FROM movies WHERE code IN (SELECT movie FROM movietheaters WHERE name = 'Imperial') AND code IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')
SELECT movies.title FROM movietheaters JOIN movies ON movietheaters.movie = movies.code WHERE movietheaters.name = 'Imperial' INTERSECT SELECT title FROM movies JOIN movietheaters ON movies.code = movietheaters.movie WHERE movietheaters.name = 'Odeon'
SELECT DISTINCT movies.title FROM movies WHERE movies.code NOT IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters WHERE name = 'Odeon')
SELECT title FROM movies ORDER BY title ASC
SELECT DISTINCT name FROM movietheaters ORDER BY name ASC
SELECT title FROM movies ORDER BY rating
SELECT name FROM movietheaters JOIN movies ON movietheaters.movie = movies.code ORDER BY rating
SELECT name FROM movietheaters GROUP BY name ORDER BY COUNT(movie) DESC LIMIT 1
SELECT m.name FROM movietheaters m GROUP BY m.name ORDER BY COUNT(m.movie) DESC LIMIT 1
SELECT movies.title FROM movies JOIN movietheaters ON movies.code = movietheaters.movie GROUP BY movies.title ORDER BY COUNT(movietheaters.name) DESC LIMIT 1
SELECT movies.title FROM movies JOIN movietheaters ON movies.code = movietheaters.movie GROUP BY movietheaters.movie ORDER BY COUNT(movietheaters.name) DESC LIMIT 1
SELECT rating, COUNT(*) AS NumberOfMovies FROM movies GROUP BY rating
SELECT rating, COUNT(*) AS num_movies FROM movies GROUP BY rating
SELECT COUNT(*) FROM movies WHERE rating IS NOT NULL
SELECT COUNT(*) FROM movies WHERE rating IS NOT NULL
SELECT DISTINCT mt.name FROM movietheaters mt WHERE mt.movie IN (SELECT m.code FROM movies m)
SELECT DISTINCT mt.name FROM movietheaters mt WHERE mt.movie IS NOT NULL
SELECT name FROM movietheaters WHERE movie IS NULL
SELECT name FROM movietheaters WHERE movie IS NULL
SELECT mt.name FROM movietheaters mt JOIN movies mo ON mt.movie = mo.code WHERE mo.rating = 'G'
SELECT DISTINCT name FROM movietheaters JOIN movies ON movietheaters.movie = movies.code WHERE movies.rating = 'G'
SELECT title FROM movies
SELECT name FROM movietheaters
SELECT DISTINCT rating FROM movies;
SELECT DISTINCT rating FROM movies;
SELECT * FROM movies WHERE rating IS NULL
SELECT * FROM movies WHERE rating IS NULL
SELECT title FROM movies WHERE code NOT IN (SELECT movie FROM movietheaters)
SELECT M.title FROM movies M WHERE NOT EXISTS (SELECT 1 FROM movietheaters T WHERE T.movie = M.code)
SELECT C.name FROM client C JOIN package P ON C.accountnumber = P.recipient WHERE P.weight = (SELECT MAX(weight) FROM package)
SELECT client.name FROM client JOIN package ON client.accountnumber = package.recipient ORDER BY package.weight DESC LIMIT 1
SELECT SUM(P.weight) FROM package P JOIN client C ON P.sender = C.accountnumber WHERE C.name = 'Leo Wong'
SELECT SUM(weight) FROM package JOIN client ON package.sender = client.accountnumber WHERE client.name = 'Leo Wong'
SELECT position FROM employee WHERE name = 'Amy Wong'
SELECT position FROM employee WHERE name = 'Amy Wong'
SELECT salary, position FROM employee WHERE name = 'Turanga Leela'
SELECT position, salary FROM employee WHERE name = 'Turanga Leela'
SELECT AVG(salary) FROM employee WHERE position = 'Intern'
SELECT AVG(salary) FROM employee WHERE position = 'Intern'
SELECT DISTINCT h.level FROM has_clearance h JOIN employee e ON h.employee = e.employeeid WHERE e.position = 'Physician'
SELECT h.level FROM has_clearance h JOIN employee e ON e.employeeid = h.employee WHERE e.position = 'Physician'
SELECT P.packagenumber FROM package P INNER JOIN client C ON P.sender = C.accountnumber WHERE C.name = 'Leo Wong'
SELECT COUNT(*) FROM package WHERE sender = (SELECT accountnumber FROM client WHERE name = 'Leo Wong')
SELECT p.packagenumber FROM package p JOIN client c ON p.recipient = c.accountnumber WHERE c.name = 'Leo Wong'
SELECT packagenumber FROM package JOIN client ON package.recipient = client.accountnumber WHERE client.name = 'Leo Wong'
SELECT DISTINCT p.packagenumber FROM package p JOIN client c ON p.sender = c.accountnumber OR p.recipient = c.accountnumber WHERE c.name = 'Leo Wong'
SELECT DISTINCT p.packagenumber FROM package p JOIN client c ON p.sender = c.accountnumber WHERE c.name = 'Leo Wong' UNION SELECT DISTINCT p.packagenumber FROM package p JOIN client c ON p.recipient = c.accountnumber WHERE c.name = 'Leo Wong'
SELECT COUNT(*) FROM package JOIN client AS sender ON package.sender = sender.accountnumber JOIN client AS recipient ON package.recipient = recipient.accountnumber WHERE sender.name = 'Ogden Wernstrom' AND recipient.name = 'Leo Wong'
SELECT COUNT(*) FROM package p JOIN client sender ON p.sender = sender.accountnumber JOIN client recipient ON p.recipient = recipient.accountnumber WHERE sender.name = 'Ogden Wernstrom' AND recipient.name = 'Leo Wong'
SELECT contents FROM package WHERE sender = (SELECT accountnumber FROM client WHERE name = 'John Zoidfarb')
SELECT contents FROM package INNER JOIN client ON package.sender = client.accountnumber WHERE client.name = 'John Zoidfarb'
SELECT P.packagenumber, P.weight FROM package P JOIN client C ON P.sender = C.accountnumber WHERE C.name LIKE '%John%' ORDER BY P.weight DESC LIMIT 1
SELECT package.packagenumber, package.weight FROM package JOIN client ON package.sender = client.accountnumber WHERE client.name LIKE 'John%' ORDER BY package.weight DESC LIMIT 1
SELECT packagenumber, weight FROM package ORDER BY weight ASC LIMIT 3
SELECT packagenumber, weight FROM package ORDER BY weight ASC LIMIT 3
SELECT cl.name, COUNT(*) AS packages_sent FROM package p JOIN client cl ON p.sender = cl.accountnumber GROUP BY p.sender ORDER BY packages_sent DESC LIMIT 1
SELECT cl.name, COUNT(*) AS packages_sent FROM client cl JOIN package pk ON cl.accountnumber = pk.sender GROUP BY cl.name ORDER BY packages_sent DESC LIMIT 1
SELECT name, COUNT(packagenumber) AS NumPackages FROM client JOIN package ON client.accountnumber = package.recipient GROUP BY client.accountnumber ORDER BY NumPackages ASC LIMIT 1
SELECT c.name, COUNT(p.packagenumber) AS num_packages FROM package p JOIN client c ON p.recipient = c.accountnumber GROUP BY p.recipient ORDER BY num_packages ASC LIMIT 1
SELECT c.name FROM client c JOIN package p ON c.accountnumber = p.sender GROUP BY c.name HAVING COUNT(*) > 1
SELECT name FROM client WHERE accountnumber IN (SELECT sender FROM package GROUP BY sender HAVING COUNT(*) > 1)
SELECT coordinates FROM planet WHERE name = 'Mars'
SELECT coordinates FROM planet WHERE name = 'Mars';
SELECT name, coordinates FROM planet ORDER BY name ASC
SELECT name, coordinates FROM planet ORDER BY name ASC
SELECT shipmentid FROM shipment JOIN employee ON shipment.manager = employee.employeeid WHERE employee.name = 'Phillip J. Fry'
SELECT s.shipmentid FROM shipment s JOIN employee e ON s.manager = e.employeeid WHERE e.name = 'Phillip J Fry'
SELECT date FROM shipment
SELECT date FROM shipment;
SELECT shipmentid FROM shipment JOIN planet ON shipment.planet = planet.planetid WHERE planet.name = 'Mars'
SELECT shipmentid FROM shipment WHERE planet = (SELECT planetid FROM planet WHERE name = 'Mars')
SELECT s.shipmentid FROM shipment s JOIN planet p ON s.planet = p.planetid JOIN employee e ON s.manager = e.employeeid WHERE p.name = 'Mars' AND e.name = 'Turanga Leela'
SELECT s.shipmentid FROM shipment s JOIN planet p ON s.planet = p.planetid JOIN employee e ON s.manager = e.employeeid WHERE p.name = 'Mars' AND e.name = 'Turanga Leela'
SELECT shipmentid FROM shipment WHERE planet IN (SELECT planetid FROM planet WHERE name = 'Mars') OR manager IN (SELECT employeeid FROM employee WHERE name = 'Turanga Leela')
SELECT shipment.shipmentid FROM shipment JOIN planet ON shipment.planet = planet.planetid JOIN employee ON shipment.manager = employee.employeeid WHERE planet.name = 'Mars' AND employee.name = 'Turanga Leela'
SELECT p.name, COUNT(s.shipmentid) AS total_shipments FROM planet p JOIN shipment s ON p.planetid = s.planet GROUP BY p.planetid
SELECT p.name, COUNT(s.shipmentid) FROM planet p JOIN shipment s ON p.planetid = s.planet GROUP BY p.planetid
SELECT p.name FROM planet p JOIN shipment s ON p.planetid = s.planet GROUP BY p.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT p.name FROM planet p JOIN shipment s ON p.planetid = s.planet GROUP BY p.planetid ORDER BY COUNT(*) DESC LIMIT 1
SELECT e.name, COUNT(s.shipmentid) FROM employee e JOIN shipment s ON e.employeeid = s.manager GROUP BY e.employeeid
SELECT e.name, COUNT(s.shipmentid) AS num_shipments FROM employee e JOIN shipment s ON e.employeeid = s.manager GROUP BY e.name
SELECT SUM(p.weight) FROM package p INNER JOIN shipment s ON p.shipment = s.shipmentid INNER JOIN planet pl ON s.planet = pl.planetid WHERE pl.name = 'Mars'
SELECT SUM(p.weight) FROM package p JOIN shipment s ON p.shipment = s.shipmentid JOIN planet pl ON s.planet = pl.planetid WHERE pl.name = 'Mars'
SELECT p.name, SUM(pa.weight) AS total_weight FROM planet p JOIN shipment s ON p.planetid = s.planet JOIN package pa ON s.shipmentid = pa.shipment GROUP BY p.name
SELECT p.name, SUM(pkg.weight) FROM planet p JOIN shipment s ON p.planetid = s.planet JOIN package pkg ON s.shipmentid = pkg.shipment GROUP BY p.name
SELECT p.name FROM planet p WHERE EXISTS (SELECT 1 FROM shipment s JOIN package k ON s.shipmentid = k.shipment WHERE s.planet = p.planetid GROUP BY s.planet HAVING SUM(k.weight) > 30)
SELECT p.name FROM planet p JOIN shipment s ON p.planetid = s.planet JOIN package pk ON s.shipmentid = pk.shipment GROUP BY p.name HAVING SUM(pk.weight) > 30
SELECT p.packagenumber FROM package p JOIN client c ON p.sender = c.accountnumber JOIN shipment s ON p.shipment = s.shipmentid JOIN planet pl ON s.planet = pl.planetid WHERE pl.name = 'Omicron Persei 8' AND c.name = 'Zapp Brannigan'
SELECT COUNT(p.packagenumber) FROM package p JOIN client c ON p.sender = c.accountnumber JOIN shipment s ON p.shipment = s.shipmentid JOIN planet pl ON s.planet = pl.planetid WHERE c.name = 'Zapp Brannigan' AND pl.name = 'Omicron Persei 8'
SELECT DISTINCT p.packageNumber FROM package p JOIN shipment s ON p.shipment = s.shipmentid JOIN planet pl ON s.planet = pl.planetid JOIN client c ON p.sender = c.accountnumber WHERE pl.name = 'Omicron Persei 8' OR c.name = 'Zapp Brannigan'
SELECT COUNT(*) FROM package WHERE shipment IN (SELECT shipmentid FROM shipment WHERE planet = (SELECT planetid FROM planet WHERE name = 'Omicron Persei 8')) OR sender = (SELECT accountnumber FROM client WHERE name = 'Zapp Brannigan')
SELECT packagenumber, weight FROM package WHERE weight BETWEEN 10 AND 30
SELECT packagenumber, weight FROM package WHERE weight BETWEEN 10 AND 30
SELECT e.name FROM employee e WHERE NOT EXISTS (SELECT 1 FROM has_clearance h JOIN planet p ON h.planet = p.planetid WHERE h.employee = e.employeeid AND p.name = 'Mars')
SELECT e.name FROM employee e WHERE NOT EXISTS (SELECT 1 FROM has_clearance h INNER JOIN planet p ON h.planet = p.planetid WHERE h.employee = e.employeeid AND p.name = 'Mars')
SELECT e.name FROM employee e JOIN has_clearance hc ON e.employeeid = hc.employee JOIN planet p ON hc.planet = p.planetid WHERE p.name = 'Omega III'
SELECT e.name FROM employee e JOIN has_clearance h ON e.employeeid = h.employee JOIN planet p ON h.planet = p.planetid WHERE p.name = 'Omega III'
SELECT p.name FROM planet p WHERE (SELECT COUNT(*) FROM has_clearance hc WHERE hc.planet = p.planetid) = 1
SELECT p.name FROM planet p WHERE 1 = (SELECT COUNT(*) FROM has_clearance h WHERE h.planet = p.planetid GROUP BY h.planet)
SELECT name FROM employee WHERE salary BETWEEN 5000 AND 10000;
SELECT name FROM employee WHERE salary BETWEEN 5000 AND 10000
SELECT name FROM employee WHERE salary > 5000 OR salary > (SELECT AVG(salary) FROM employee)
SELECT name FROM employee WHERE salary > 5000 OR salary > (SELECT AVG(salary) FROM employee)
SELECT COUNT(DISTINCT e.employeeid) FROM employee e WHERE e.employeeid NOT IN (SELECT h.employee FROM has_clearance h JOIN planet p ON h.planet = p.planetid WHERE p.name = 'Mars')
SELECT COUNT(*) FROM employee WHERE employeeid NOT IN (SELECT employee FROM has_clearance WHERE planet = (SELECT planetid FROM planet WHERE name = 'Mars'))
SELECT COUNT(*) FROM game
SELECT COUNT(*) FROM game;
SELECT title, developers FROM game ORDER BY units_sold_millions DESC
SELECT title, developers FROM game ORDER BY units_sold_millions DESC
SELECT AVG(units_sold_millions) FROM game WHERE developers != 'Nintendo'
SELECT AVG(units_sold_millions) FROM game WHERE developers <> 'Nintendo'
SELECT platform_name, market_district FROM platform
SELECT platform_name, market_district FROM platform;
SELECT platform_id, platform_name FROM platform WHERE download_rank = 1;
SELECT platform_name, platform_id FROM platform WHERE download_rank = 1;
SELECT MAX(rank_of_the_year) AS MaxRank, MIN(rank_of_the_year) AS MinRank FROM player
SELECT MAX(rank_of_the_year) AS max_rank, MIN(rank_of_the_year) AS min_rank FROM player
SELECT COUNT(DISTINCT player_id) FROM player WHERE rank_of_the_year < 3
SELECT COUNT(DISTINCT player.player_id) FROM player WHERE player.rank_of_the_year <= 3;
SELECT player_name FROM player ORDER BY player_name ASC
SELECT player_name FROM player ORDER BY player_name ASC;
SELECT player_name, college FROM player ORDER BY rank_of_the_year DESC;
SELECT player_name, college FROM player ORDER BY rank_of_the_year DESC
SELECT p.player_name, p.rank_of_the_year FROM player p JOIN game_player gp ON p.player_id = gp.player_id JOIN game g ON gp.game_id = g.game_id WHERE g.title = 'Super Mario World'
SELECT p.player_name, p.rank_of_the_year FROM player p JOIN game_player gp ON p.player_id = gp.player_id JOIN game g ON gp.game_id = g.game_id WHERE g.title = 'Super Mario World';
SELECT DISTINCT g.developers FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.college = 'Auburn'
SELECT DISTINCT g.developers FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.college = 'Auburn';
SELECT AVG(g.units_sold_millions) FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard'
SELECT AVG(g.units_sold_millions) FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard'
SELECT game.title, platform.platform_name FROM game JOIN platform ON game.platform_id = platform.platform_id
SELECT g.title, p.platform_name FROM game g JOIN platform p ON g.platform_id = p.platform_id
SELECT game.title FROM game INNER JOIN platform ON game.platform_id = platform.platform_id WHERE platform.market_district IN ('Asia', 'USA')
SELECT DISTINCT g.title FROM game g JOIN platform p ON g.platform_id = p.platform_id WHERE p.market_district IN ('Asia', 'USA')
SELECT franchise, COUNT(game_id) AS number_of_games FROM game GROUP BY franchise
SELECT franchise, COUNT(game_id) AS game_count FROM game GROUP BY franchise
SELECT franchise FROM game GROUP BY franchise ORDER BY COUNT(game_id) DESC LIMIT 1
SELECT franchise FROM game GROUP BY franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT franchise FROM game GROUP BY franchise HAVING COUNT(game_id) >= 2
SELECT franchise FROM game GROUP BY franchise HAVING COUNT(game_id) >= 2
SELECT player_name FROM player WHERE player_id NOT IN (SELECT player_id FROM game_player)
SELECT player.player_name FROM player LEFT JOIN game_player ON player.player_id = game_player.player_id WHERE game_player.player_id IS NULL
SELECT DISTINCT g.title FROM game AS g JOIN game_player AS gp ON g.game_id = gp.game_id JOIN player AS p ON gp.player_id = p.player_id WHERE p.college = 'Auburn' INTERSECT SELECT g.title FROM game AS g JOIN game_player AS gp ON g.game_id = gp.game_id JOIN player AS p ON gp.player_id = p.player_id WHERE p.college = 'Oklahoma'
SELECT DISTINCT g.title FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.college IN ('Oklahoma', 'Auburn')
SELECT DISTINCT franchise FROM game
SELECT DISTINCT franchise FROM game;
SELECT title FROM game WHERE game_id NOT IN (SELECT g.game_id FROM game g JOIN game_player gp ON g.game_id = gp.game_id JOIN player p ON gp.player_id = p.player_id WHERE p.position = 'Guard')
SELECT DISTINCT g.title FROM game g WHERE NOT EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.player_id = p.player_id WHERE g.game_id = gp.game_id AND p.position = 'Guard')
SELECT name FROM press ORDER BY year_profits_billion DESC
SELECT name FROM press ORDER BY year_profits_billion DESC
SELECT name FROM press WHERE year_profits_billion > 15 OR month_profits_billion > 1
SELECT name FROM press WHERE year_profits_billion > 15 OR month_profits_billion > 1
SELECT AVG(year_profits_billion) AS Average_Profit, MAX(year_profits_billion) AS Maximum_Profit FROM press
SELECT press.name, AVG(press.year_profits_billion) AS avg_yearly_profit, MAX(press.year_profits_billion) AS max_yearly_profit FROM press GROUP BY press.press_id
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT name FROM press ORDER BY month_profits_billion DESC LIMIT 1
SELECT name FROM press WHERE month_profits_billion = (SELECT MAX(month_profits_billion) FROM press) OR month_profits_billion = (SELECT MIN(month_profits_billion) FROM press)
SELECT p.name FROM press p WHERE p.month_profits_billion = (SELECT MAX(month_profits_billion) FROM press) OR p.month_profits_billion = (SELECT MIN(month_profits_billion) FROM press)
SELECT COUNT(*) FROM author WHERE age < 30
SELECT COUNT(author_id) FROM author WHERE age < 30
sql placeholder
SELECT gender, AVG(age) FROM author GROUP BY gender
SELECT gender, COUNT(DISTINCT author_id) FROM author WHERE age > 30 GROUP BY gender;
SELECT gender, COUNT(author_id) FROM author WHERE age > 30 GROUP BY gender
SELECT title FROM book ORDER BY release_date DESC
SELECT title FROM book ORDER BY release_date DESC
SELECT book_series, COUNT(*) FROM book GROUP BY book_series
SELECT book_series, COUNT(*) AS number_of_books FROM book GROUP BY book_series
SELECT title, release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT title, release_date FROM book ORDER BY sale_amount DESC LIMIT 5
SELECT DISTINCT book1.book_series FROM book AS book1 WHERE book1.sale_amount > 1000 AND EXISTS (SELECT 1 FROM book AS book2 WHERE book2.book_series = book1.book_series AND book2.sale_amount < 500)
SELECT book_series FROM book WHERE sale_amount > 1000 INTERSECT SELECT book_series FROM book WHERE sale_amount < 500
SELECT DISTINCT a.name FROM author a JOIN book b1 ON a.author_id = b1.author_id JOIN book b2 ON a.author_id = b2.author_id WHERE b1.book_series = 'MM' AND b2.book_series = 'LT'
SELECT DISTINCT a.name FROM author a JOIN book b1 ON a.author_id = b1.author_id JOIN book b2 ON a.author_id = b2.author_id WHERE b1.book_series = 'LT' AND b2.book_series = 'MM'
SELECT name, age FROM author WHERE author_id NOT IN (SELECT author_id FROM book)
SELECT A.name FROM author A LEFT JOIN book B ON A.author_id = B.author_id WHERE B.author_id IS NULL
SELECT a.name FROM author a WHERE a.author_id IN (SELECT b.author_id FROM book b GROUP BY b.author_id HAVING COUNT(b.book_id) > 1)
SELECT DISTINCT author.name FROM author JOIN book ON author.author_id = book.author_id GROUP BY author.author_id HAVING COUNT(book.title) > 1
SELECT b.title, a.name AS author_name, p.name AS publisher_name FROM book b JOIN author a ON b.author_id = a.author_id JOIN press p ON b.press_id = p.press_id ORDER BY b.sale_amount DESC LIMIT 3
SELECT title, author.name, press.name FROM book JOIN author ON book.author_id = author.author_id JOIN press ON book.press_id = press.press_id ORDER BY sale_amount DESC LIMIT 3
SELECT p.name, SUM(b.sale_amount) AS TotalSaleAmount FROM press p JOIN book b ON p.press_id = b.press_id GROUP BY p.name
SELECT p.name, SUM(b.sale_amount) AS TotalSaleAmount FROM press p JOIN book b ON p.press_id = b.press_id GROUP BY p.name
SELECT p.name, COUNT(b.book_id) FROM press p JOIN book b ON p.press_id = b.press_id WHERE b.sale_amount > 1000 GROUP BY p.press_id, p.name
SELECT p.name, COUNT(*) FROM press p JOIN book b ON p.press_id = b.press_id WHERE b.sale_amount > 1000 GROUP BY p.name
SELECT author.name FROM author JOIN book ON author.author_id = book.author_id ORDER BY book.sale_amount DESC LIMIT 1
SELECT author.name FROM author JOIN book ON author.author_id = book.author_id ORDER BY book.sale_amount DESC LIMIT 1
SELECT author.name, author.gender FROM author JOIN book ON author.author_id = book.author_id GROUP BY author.author_id ORDER BY COUNT(book.title) DESC LIMIT 1
SELECT author.name, author.gender FROM author WHERE author.author_id = (SELECT book.author_id FROM book GROUP BY book.author_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT DISTINCT a.name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.press_id = p.press_id WHERE p.name = 'Accor' AND b.author_id = a.author_id)
SELECT name FROM author WHERE author_id NOT IN (SELECT author_id FROM book WHERE press_id IN (SELECT press_id FROM press WHERE name = 'Accor'))
SELECT p.name, p.year_profits_billion FROM press p WHERE (SELECT COUNT(*) FROM book b WHERE b.press_id = p.press_id) > 2
SELECT p.name, p.year_profits_billion FROM press p JOIN book b ON p.press_id = b.press_id GROUP BY p.press_id HAVING COUNT(b.book_id) > 2
SELECT COUNT(DISTINCT author_name) FROM authors
SELECT author_name FROM authors
SELECT author_name, other_details FROM authors
SELECT other_details FROM authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(document_id) FROM documents
SELECT author_name FROM documents WHERE document_id = 4
SELECT d.author_name FROM documents d WHERE d.document_name = 'Travel to Brazil'
SELECT COUNT(*) FROM documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM documents
SELECT document_id, document_name FROM documents WHERE author_name = 'Bianka Cummings'
SELECT authors.author_name, authors.other_details FROM documents JOIN authors ON documents.author_name = authors.author_name WHERE documents.document_name = 'Travel to China'
SELECT authors.author_name, COUNT(documents.document_id) FROM authors JOIN documents ON authors.author_name = documents.author_name GROUP BY authors.author_name
SELECT author_name FROM (SELECT author_name, COUNT(*) AS doc_count FROM documents GROUP BY author_name) ORDER BY doc_count DESC LIMIT 1
SELECT a.author_name FROM authors a WHERE 2 <= (SELECT COUNT(*) FROM documents d WHERE d.author_name = a.author_name)
SELECT COUNT(*) FROM business_processes;
SELECT bp2.process_id AS next_process_id, bp2.process_name, bp2.process_description FROM business_processes bp1 JOIN business_processes bp2 ON bp1.next_process_id = bp2.process_id WHERE bp1.process_id = 9
SELECT bp2.process_name FROM business_processes bp1 JOIN business_processes bp2 ON bp1.next_process_id = bp2.process_id WHERE bp1.process_id = 9
SELECT COUNT(*) FROM process_outcomes
SELECT process_outcome_code, process_outcome_description FROM process_outcomes
SELECT process_outcome_description FROM process_outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(DISTINCT process_status_code) FROM process_status
SELECT process_status_code, process_status_description FROM process_status;
SELECT process_status_description FROM process_status WHERE process_status_code = 'ct'
SELECT COUNT(DISTINCT staff_id) FROM staff
SELECT staff_id, staff_details FROM staff
SELECT staff_details FROM staff WHERE staff_id = 100;
SELECT COUNT(DISTINCT staff_role_code) FROM ref_staff_roles
SELECT staff_role_code, staff_role_description FROM ref_staff_roles;
SELECT staff_role_description FROM ref_staff_roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT document_id) FROM documents_processes
SELECT DISTINCT dp.process_id FROM documents_processes dp
SELECT d.document_id FROM documents d LEFT JOIN documents_processes dp ON d.document_id = dp.document_id WHERE dp.document_id IS NULL
SELECT process_id FROM business_processes WHERE process_id NOT IN (SELECT process_id FROM documents_processes)
SELECT po.process_outcome_description, ps.process_status_description FROM documents_processes dp JOIN process_outcomes po ON dp.process_outcome_code = po.process_outcome_code JOIN process_status ps ON dp.process_status_code = ps.process_status_code WHERE dp.document_id = 0
SELECT bp.process_name FROM documents d JOIN documents_processes dp ON d.document_id = dp.document_id JOIN business_processes bp ON dp.process_id = bp.process_id WHERE d.document_name = 'Travel to Brazil'
SELECT bp.process_id, COUNT(dp.document_id) FROM business_processes bp JOIN documents_processes dp ON bp.process_id = dp.process_id GROUP BY bp.process_id
SELECT COUNT(DISTINCT staff.staff_id) FROM staff INNER JOIN staff_in_processes ON staff.staff_id = staff_in_processes.staff_id WHERE staff_in_processes.document_id = 0 AND staff_in_processes.process_id = 9
SELECT s.staff_id, COUNT(dp.process_id) FROM staff s JOIN staff_in_processes sip ON s.staff_id = sip.staff_id JOIN documents_processes dp ON sip.document_id = dp.document_id AND sip.process_id = dp.process_id GROUP BY s.staff_id
SELECT sr.staff_role_code, COUNT(dp.document_id) FROM staff_in_processes sip JOIN ref_staff_roles sr ON sip.staff_role_code = sr.staff_role_code JOIN documents_processes dp ON sip.document_id = dp.document_id AND sip.process_id = dp.process_id GROUP BY sr.staff_role_code
SELECT COUNT(DISTINCT sip.staff_role_code) FROM staff_in_processes sip WHERE sip.staff_id = 3
SELECT COUNT(*) FROM agencies
SELECT COUNT(agency_id) FROM agencies
SELECT agency_id, agency_details FROM agencies
SELECT agency_id, agency_details FROM agencies
SELECT COUNT(*) FROM clients
SELECT COUNT(*) FROM clients
SELECT client_id, client_details FROM clients
SELECT client_id, client_details FROM clients
SELECT agencies.agency_id, COUNT(clients.client_id) FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id GROUP BY agencies.agency_id
SELECT agencies.agency_id, COUNT(clients.client_id) AS client_count FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id GROUP BY agencies.agency_id
SELECT A.agency_id, A.agency_details FROM agencies A WHERE A.agency_id = (SELECT B.agency_id FROM clients B GROUP BY B.agency_id ORDER BY COUNT(B.client_id) DESC LIMIT 1)
SELECT A.agency_id, A.agency_details FROM agencies A JOIN clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id ORDER BY COUNT(C.client_id) DESC LIMIT 1
SELECT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id GROUP BY agencies.agency_id HAVING COUNT(DISTINCT clients.client_id) >= 2
SELECT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id GROUP BY agencies.agency_id HAVING COUNT(DISTINCT clients.client_id) >= 2
SELECT agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id WHERE clients.client_details = 'Mac'
SELECT agency_details FROM agencies WHERE agency_id IN (SELECT agency_id FROM clients WHERE client_details = 'Mac')
SELECT clients.client_details, agencies.agency_details FROM clients JOIN agencies ON clients.agency_id = agencies.agency_id
SELECT clients.client_details, agencies.agency_details FROM clients JOIN agencies ON clients.agency_id = agencies.agency_id
SELECT sic_code, COUNT(client_id) AS client_count FROM clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) FROM clients GROUP BY sic_code
SELECT client_id, client_details FROM clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM clients WHERE sic_code = 'Bad'
SELECT DISTINCT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id
SELECT DISTINCT agencies.agency_id, agencies.agency_details FROM agencies JOIN clients ON agencies.agency_id = clients.agency_id
SELECT agency_id FROM agencies WHERE agency_id NOT IN (SELECT agency_id FROM clients)
SELECT A.agency_id FROM agencies A WHERE NOT EXISTS (SELECT 1 FROM clients C WHERE C.agency_id = A.agency_id)
SELECT COUNT(*) FROM invoices
SELECT COUNT(*) FROM invoices
SELECT invoice_id, invoice_status, invoice_details FROM invoices JOIN clients ON invoices.client_id = clients.client_id
SELECT invoice_id, invoice_status, invoice_details FROM invoices
SELECT clients.client_id, COUNT(invoices.invoice_id) AS num_invoices FROM clients JOIN invoices ON clients.client_id = invoices.client_id GROUP BY clients.client_id
SELECT client_id, COUNT(invoice_id) AS invoice_count FROM invoices GROUP BY client_id
SELECT clients.client_id, clients.client_details FROM clients JOIN invoices ON clients.client_id = invoices.client_id GROUP BY clients.client_id ORDER BY COUNT(invoices.invoice_id) DESC LIMIT 1
SELECT clients.client_id, clients.client_details FROM clients JOIN (SELECT client_id, COUNT(*) AS total FROM invoices GROUP BY client_id ORDER BY total DESC LIMIT 1) invoiced_max ON clients.client_id = invoiced_max.client_id
SELECT clients.client_id FROM clients JOIN invoices ON clients.client_id = invoices.client_id GROUP BY clients.client_id HAVING COUNT(invoices.invoice_id) >= 2
SELECT client_id FROM invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT invoice_status, COUNT(*) FROM invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(invoice_id) AS count FROM invoices GROUP BY invoice_status
SELECT invoice_status FROM invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT invoice_status FROM invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT invoices.invoice_status, invoices.invoice_details, clients.client_id, clients.client_details, agencies.agency_id, agencies.agency_details FROM invoices JOIN clients ON invoices.client_id = clients.client_id JOIN agencies ON clients.agency_id = agencies.agency_id
SELECT invoices.invoice_status, invoices.invoice_details, invoices.client_id, clients.client_details, agencies.agency_id, agencies.agency_details FROM invoices JOIN clients ON invoices.client_id = clients.client_id JOIN agencies ON clients.agency_id = agencies.agency_id
SELECT DISTINCT meeting_type FROM meetings
SELECT meeting_type, other_details FROM meetings
SELECT meeting_outcome, purpose_of_meeting FROM meetings;
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM meetings
SELECT p.payment_id, p.payment_details FROM payments p JOIN invoices i ON p.invoice_id = i.invoice_id WHERE i.invoice_status = 'Working';
SELECT p.payment_id, p.payment_details FROM payments p JOIN invoices i ON p.invoice_id = i.invoice_id WHERE i.invoice_status = 'Working'
SELECT invoice_id, invoice_status FROM invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM payments)
SELECT invoice_id, invoice_status FROM invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM payments)
SELECT COUNT(*) FROM payments
SELECT COUNT(payment_id) FROM payments
SELECT p.payment_id, p.invoice_id, i.invoice_details FROM payments p INNER JOIN invoices i ON p.invoice_id = i.invoice_id
SELECT payment_id, invoice_id, payment_details FROM payments
SELECT DISTINCT invoices.invoice_id, invoices.invoice_status FROM invoices JOIN payments ON invoices.invoice_id = payments.invoice_id
SELECT DISTINCT invoices.invoice_id, invoices.invoice_status FROM invoices JOIN payments ON invoices.invoice_id = payments.invoice_id
SELECT invoices.invoice_id, COUNT(payments.payment_id) AS payment_count FROM invoices LEFT JOIN payments ON invoices.invoice_id = payments.invoice_id GROUP BY invoices.invoice_id
SELECT i.invoice_id, COUNT(p.payment_id) AS payment_count FROM invoices i LEFT JOIN payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id
SELECT i.invoice_id, i.invoice_status, i.invoice_details FROM invoices i WHERE i.invoice_id = (SELECT invoice_id FROM payments GROUP BY invoice_id ORDER BY COUNT(payment_id) DESC LIMIT 1)
SELECT i.invoice_id, i.invoice_status, i.invoice_details FROM invoices i WHERE i.invoice_id IN (SELECT p.invoice_id FROM payments p GROUP BY p.invoice_id ORDER BY COUNT(p.payment_id) DESC LIMIT 1)
SELECT COUNT(*) FROM staff
SELECT COUNT(*) FROM staff
SELECT a.agency_id, COUNT(s.staff_id) FROM agencies a LEFT JOIN staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT agencies.agency_id, COUNT(DISTINCT staff.staff_id) FROM agencies JOIN staff ON agencies.agency_id = staff.agency_id GROUP BY agencies.agency_id
SELECT a.agency_id, a.agency_details FROM agencies a JOIN (SELECT agency_id, COUNT(staff_id) AS staff_count FROM staff GROUP BY agency_id ORDER BY staff_count DESC LIMIT 1) staff_ct ON a.agency_id = staff_ct.agency_id
SELECT agencies.agency_id, agencies.agency_details FROM agencies JOIN (SELECT agency_id, COUNT(staff_id) AS staff_count FROM staff GROUP BY agency_id ORDER BY staff_count DESC LIMIT 1) as temp ON agencies.agency_id = temp.agency_id
SELECT meeting_outcome, COUNT(*) AS outcome_count FROM meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(*) AS count FROM meetings GROUP BY meeting_outcome
SELECT clients.client_id, COUNT(meetings.meeting_id) AS number_of_meetings FROM clients JOIN meetings ON clients.client_id = meetings.client_id GROUP BY clients.client_id
SELECT clients.client_id, COUNT(meetings.meeting_id) AS num_meetings FROM clients JOIN meetings ON clients.client_id = meetings.client_id GROUP BY clients.client_id
SELECT c.client_id, m.meeting_type, COUNT(m.meeting_type) AS number_of_meetings FROM clients c JOIN meetings m ON c.client_id = m.client_id GROUP BY c.client_id, m.meeting_type
SELECT meeting_type, COUNT(*) AS number_of_meetings FROM meetings GROUP BY meeting_type
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM meetings m JOIN clients c ON m.client_id = c.client_id
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM meetings m JOIN clients c ON m.client_id = c.client_id
SELECT meeting_id, COUNT(staff_id) FROM staff_in_meetings GROUP BY meeting_id
SELECT meeting_id, COUNT(staff_id) AS staff_count FROM staff_in_meetings GROUP BY meeting_id
SELECT s.staff_id, COUNT(*) AS num_meetings FROM staff s JOIN staff_in_meetings sim ON s.staff_id = sim.staff_id GROUP BY s.staff_id HAVING num_meetings = (SELECT MIN(total_meetings) FROM (SELECT COUNT(*) AS total_meetings FROM staff_in_meetings GROUP BY staff_id))
SELECT staff_id FROM staff_in_meetings GROUP BY staff_id ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(DISTINCT staff_id) FROM staff_in_meetings
SELECT COUNT(DISTINCT staff_id) FROM staff_in_meetings
SELECT COUNT(*) FROM staff WHERE staff_id NOT IN (SELECT staff_id FROM staff_in_meetings)
SELECT COUNT(*) FROM staff WHERE staff_id NOT IN (SELECT DISTINCT staff_id FROM staff_in_meetings)
SELECT DISTINCT clients.client_id, clients.client_details FROM clients WHERE clients.client_id IN (SELECT client_id FROM meetings) UNION SELECT DISTINCT clients.client_id, clients.client_details FROM clients WHERE clients.client_id IN (SELECT client_id FROM invoices)
SELECT DISTINCT clients.client_id, clients.client_details FROM clients JOIN meetings ON clients.client_id = meetings.client_id UNION SELECT DISTINCT clients.client_id, clients.client_details FROM clients JOIN invoices ON clients.client_id = invoices.client_id
SELECT DISTINCT staff.staff_id, staff.staff_details FROM staff JOIN staff_in_meetings ON staff.staff_id = staff_in_meetings.staff_id JOIN meetings ON staff_in_meetings.meeting_id = meetings.meeting_id WHERE staff.staff_details LIKE '%s%';
SELECT DISTINCT s.staff_id, s.staff_details FROM staff s INNER JOIN staff_in_meetings sim ON s.staff_id = sim.staff_id INNER JOIN meetings m ON sim.meeting_id = m.meeting_id WHERE s.staff_details LIKE '%s%'
SELECT clients.client_id, clients.sic_code, clients.agency_id FROM clients JOIN meetings ON clients.client_id = meetings.client_id JOIN invoices ON clients.client_id = invoices.client_id GROUP BY clients.client_id HAVING COUNT(DISTINCT meetings.meeting_id) = 1;
SELECT c.client_id, c.sic_code, c.agency_id FROM clients c JOIN meetings m ON c.client_id = m.client_id JOIN invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(DISTINCT m.meeting_id) = 1
SELECT m.start_date_time, m.end_date_time, c.client_details, s.staff_details FROM meetings m JOIN clients c ON m.client_id = c.client_id JOIN staff_in_meetings sim ON m.meeting_id = sim.meeting_id JOIN staff s ON sim.staff_id = s.staff_id
SELECT m.start_date_time, m.end_date_time, c.client_details, s.staff_details FROM meetings m JOIN clients c ON m.client_id = c.client_id JOIN staff_in_meetings sim ON m.meeting_id = sim.meeting_id JOIN staff s ON sim.staff_id = s.staff_id
