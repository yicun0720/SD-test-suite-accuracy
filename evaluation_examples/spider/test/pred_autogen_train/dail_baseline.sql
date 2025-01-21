SELECT COUNT(*) FROM club;
SELECT COUNT(*) FROM club;
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager, Captain FROM club;
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC;
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player);
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT p.Name AS player_name, c.Name AS club_name FROM player p JOIN club c ON p.Club_ID = c.Club_ID
SELECT player.Name AS player_name, club.Name AS club_name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT c.Name, AVG(p.Earnings) AS average_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID ORDER BY average_earnings DESC
SELECT Name FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Name ORDER BY AVG(player.Earnings) DESC
SELECT manufacturer, COUNT(Club_ID) AS number_of_clubs FROM club GROUP BY manufacturer
SELECT manufacturer, COUNT(DISTINCT Club_ID) AS num_clubs FROM club GROUP BY manufacturer
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(manufacturer) = (SELECT MAX(count) FROM (SELECT COUNT(manufacturer) as count FROM club GROUP BY manufacturer))
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT country FROM player WHERE earnings > 1400000 INTERSECT SELECT country FROM player WHERE earnings < 1100000
SELECT country FROM player WHERE earnings > 1400000 INTERSECT SELECT country FROM player WHERE earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT earnings FROM player WHERE country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c WHERE c.customer_id IN (SELECT o.customer_id FROM Orders o GROUP BY o.customer_id HAVING COUNT(o.order_id) > 2) AND c.customer_id IN (SELECT oi.customer_id FROM Order_Items oi JOIN Orders o ON oi.order_id = o.order_id GROUP BY oi.customer_id HAVING COUNT(oi.order_item_id) >= 3)
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id HAVING COUNT(DISTINCT o.order_id) > 2 AND SUM(oi.order_item_id) >= 3
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS number_of_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS number_of_products FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT DISTINCT Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.order_item_id) > 1 OR Orders.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT MIN(o.date_order_placed) AS EarliestOrderDate, o.date_order_placed AS OrderDate, COUNT(oi.order_item_id) AS NumberOfItems FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.date_order_placed HAVING COUNT(oi.order_item_id) > 1
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN ( SELECT product_id, COUNT(*) AS order_count FROM Order_Items GROUP BY product_id HAVING COUNT(*) >= 2 ) oc ON p.product_id = oc.product_id WHERE oc.product_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_id) < 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(Order_Items.product_id) >= 2
SELECT order_id, date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(DISTINCT Order_Items.product_id) >= 2
SELECT product_id, product_name, product_price FROM Products WHERE product_id = (SELECT product_id FROM Order_Items GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id ORDER BY COUNT(*) DESC
SELECT o.order_id, SUM(p.product_price) AS total_price FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_price ASC LIMIT 1
SELECT o.order_id, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(Order_Items.product_id) AS number_of_products FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.gender_code
SELECT c.gender_code, COUNT(DISTINCT p.product_id) AS products_bought FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id JOIN Order_Items AS oi ON o.order_id = oi.order_id JOIN Products AS p ON oi.product_id = p.product_id GROUP BY c.gender_code
SELECT gender_code, COUNT(order_id) AS number_of_orders FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT c.gender_code, COUNT(o.order_id) AS orders_count FROM Customers AS c JOIN Orders AS o ON c.customer_id = o.customer_id GROUP BY c.gender_code
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id;
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT p.product_name, s.shipment_date FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipments s ON oi.order_id = s.order_id
SELECT product_name, shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id ORDER BY shipment_date
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipments s ON oi.order_id = s.order_id
SELECT order_item_status_code, shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT p.product_name, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipments s ON oi.order_id = s.order_id
SELECT p.product_name, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipments s ON oi.order_id = s.order_id
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'Female'
SELECT DISTINCT p.product_name, p.product_price, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Orders o ON oi.order_id = o.order_id JOIN Customers c ON o.customer_id = c.customer_id WHERE c.gender_code = 'Female'
SELECT i.invoice_status_code FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number WHERE s.shipment_id IS NULL
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT Orders.order_id, Orders.date_order_placed AS date, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount_paid FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code, date_order_placed FROM Orders;
SELECT order_status_code, date_order_placed FROM Orders;
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT c.customer_first_name, p.product_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id
SELECT Customers.customer_first_name, Products.product_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT COUNT(*) FROM Shipment_Items;
SELECT COUNT(DISTINCT `product_id`) FROM `Shipment_Items` JOIN `Order_Items` ON `Shipment_Items`.`order_item_id` = `Order_Items`.`order_item_id`;
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT AVG(product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT c.email_address, c.town_city, c.county FROM Customers c WHERE c.gender_code = (SELECT gender_code FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id GROUP BY c.gender_code ORDER BY COUNT(o.order_id) ASC LIMIT 1)
SELECT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id GROUP BY o.order_id HAVING COUNT(DISTINCT cpm.payment_method_code) >= 2
SELECT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id JOIN Customer_Payment_Methods cpm ON c.customer_id = cpm.customer_id GROUP BY o.order_id HAVING COUNT(DISTINCT cpm.payment_method_code) >= 2
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_item_id) > 3)
SELECT p.product_id, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) > 3
SELECT i.invoice_number, i.invoice_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number, i.invoice_date HAVING COUNT(s.shipment_id) >= 2
SELECT i.invoice_number, i.invoice_date FROM Invoices i JOIN Shipments s ON i.invoice_number = s.invoice_number GROUP BY i.invoice_number HAVING COUNT(s.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments;
SELECT shipment_tracking_number, shipment_date FROM Shipments;
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT Name FROM director WHERE Director_ID = (SELECT Director_ID FROM program GROUP BY Director_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT d.Name, d.Age FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING COUNT(Program_ID) > 1)
SELECT c.Name, COUNT(p.Program_ID) AS number_of_programs FROM channel c LEFT JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID WHERE program.Title = 'Dracula'
SELECT C.Name, C.Internet FROM channel C JOIN director_admin DA ON C.Channel_ID = DA.Channel_ID GROUP BY C.Channel_ID ORDER BY COUNT(DA.Director_ID) DESC LIMIT 1
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT DISTINCT c.Name FROM channel c WHERE EXISTS (SELECT 1 FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age < 40) AND EXISTS (SELECT 1 FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age > 60)
SELECT channel.Channel_ID, channel.Name FROM channel WHERE channel.Channel_ID NOT IN (SELECT director_admin.Channel_ID FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID WHERE director.Name = 'Hank Baskett')
SELECT COUNT(*) FROM radio;
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) FROM radio;
SELECT Affiliation, COUNT(ID) AS num_city_channels FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(Affiliation) = (SELECT MAX(count) FROM (SELECT COUNT(Affiliation) as count FROM city_channel GROUP BY Affiliation))
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT radio.Transmitter, city_channel.City FROM radio INNER JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID INNER JOIN city_channel ON city_channel_radio.City_channel_ID = city_channel.ID
SELECT r.Transmitter, cc.Station_name FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT r.Transmitter, COUNT(DISTINCT ccr.City_channel_ID) AS num_city_channels FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT d.Name FROM driver d WHERE d.Citizenship = 'United States'
SELECT Driver_ID, COUNT(Vehicle_ID) AS total_vehicles FROM vehicle_driver GROUP BY Driver_ID ORDER BY total_vehicles DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) AS total_vehicles FROM vehicle_driver GROUP BY Driver_ID ORDER BY total_vehicles DESC LIMIT 1
SELECT MAX(Power) AS MaxPower, AVG(Power) AS AvgPower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS MaxPower, AVG(Power) AS AveragePower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT v.Vehicle_ID FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID ORDER BY COUNT(vd.Driver_ID) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(Driver_ID) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle;
SELECT Build_Year, Model, Builder FROM vehicle;
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT vd.Driver_ID) FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT v.Vehicle_ID, v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE v.Builder = 'Ziyang' OR (SELECT COUNT(DISTINCT vd.Driver_ID) FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID) >= 2 GROUP BY v.Vehicle_ID, v.Model
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN (SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID HAVING COUNT(vd.Driver_ID) = 2) OR v.Builder = 'Ziyang'
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) > 2) OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver WHERE Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon'))
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) > 2 OR 'Jeff Gordon' IN (SELECT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver WHERE Vehicle_ID = vehicle.Vehicle_ID)))
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC;
SELECT Name FROM driver ORDER BY Name
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(Driver_ID) AS num_drivers FROM driver GROUP BY Racing_Series
SELECT d.Name, d.Citizenship FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT d.Name, d.Citizenship FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM Exams;
SELECT COUNT(*) FROM Exams;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(Question_ID) AS question_count FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal';
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) AS answer_count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY answer_count DESC
SELECT Student_Answer_Text, COUNT(*) AS frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT S.First_Name, A.Date_of_Answer FROM Student_Answers A JOIN Students S ON A.Student_ID = S.Student_ID
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT First_Name FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID GROUP BY s.Student_ID HAVING COUNT(sa.Student_Answer_ID) >= 2
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_Answer_ID) >= 2)
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text HAVING COUNT(Valid_Answer_Text) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Valid_Answer_Text) AS Cnt FROM Valid_Answers GROUP BY Valid_Answer_Text))
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Gender_MFU, COUNT(Student_ID) AS number_of_students FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent')
SELECT sa.Student_Answer_Text FROM Student_Answers AS sa WHERE sa.Comments = 'Normal' INTERSECT SELECT sa.Student_Answer_Text FROM Student_Answers AS sa WHERE sa.Comments = 'Absent'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT * FROM Students;
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses;
SELECT COUNT(*) FROM Addresses;
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses;
SELECT COUNT(*) FROM Products;
SELECT COUNT(*) FROM Products;
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products;
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes';
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes';
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware');
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) AS product_count FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT customer_id) FROM Customers;
SELECT COUNT(*) FROM Customers;
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers;
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT c.customer_address, c.customer_phone, c.customer_email FROM Customers c WHERE c.customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) AS NumberOfCustomers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(DISTINCT customer_id) AS num_customers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy';
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers;
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_id, product_type_code FROM Products ORDER BY product_name ASC;
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Customer_Orders;
SELECT COUNT(*) FROM Customer_Orders
SELECT Customer_Orders.order_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id WHERE Customers.customer_name = 'Jeromy'
SELECT order_id, order_date, order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id WHERE customer_name = 'Jeromy';
SELECT customer_name, customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE Customer_Orders.customer_id = Customers.customer_id) AS number_of_orders FROM Customers
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS num_orders FROM Customers C LEFT JOIN Customer_Orders O ON C.customer_id = O.customer_id GROUP BY C.customer_id, C.customer_name
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id ORDER BY COUNT(o.order_id) DESC LIMIT 1
SELECT order_status_code, COUNT(order_id) AS number_of_orders FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(order_id) AS order_count FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(order_status_code) AS Cnt FROM Customer_Orders GROUP BY order_status_code))
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(order_status_code) AS Cnt FROM Customer_Orders GROUP BY order_status_code) Temp);
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT SUM(Order_Items.order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT SUM(Order_Items.order_quantity) AS TotalMonitorsOrdered FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items WHERE product_id = (SELECT product_id FROM Products WHERE product_name = 'Monitor'))
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT o.order_date, o.order_id FROM Customer_Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id HAVING MAX(oi.order_quantity) > 6 OR COUNT(oi.product_id) > 3
SELECT CO.order_id, CO.order_date FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id GROUP BY CO.order_id HAVING SUM(OI.order_quantity) > 6 OR COUNT(OI.product_id) > 3
SELECT COUNT(*) FROM building;
SELECT COUNT(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT AVG(Population) FROM region;
SELECT AVG(Population) FROM region;
SELECT Name FROM region ORDER BY Name ASC
SELECT name FROM region ORDER BY name ASC
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT b.Name AS building_name, r.Name AS region_name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT building.Name, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT R.Name FROM region R WHERE EXISTS (SELECT 1 FROM building B WHERE B.Region_ID = R.Region_ID GROUP BY B.Region_ID HAVING COUNT(B.Building_ID) > 1)
SELECT Name FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID HAVING COUNT(b.Building_ID) > 1
SELECT R.Capital FROM region R WHERE R.Region_ID = (SELECT B.Region_ID FROM building B GROUP BY B.Region_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT R.Capital FROM region R WHERE R.Region_ID = (SELECT B.Region_ID FROM building B GROUP BY B.Region_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT b.Address, r.Capital FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT building.Address, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT b.Number_of_Stories FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT "Completed_Year", COUNT("Building_ID") AS "Number_of_Buildings" FROM "building" GROUP BY "Completed_Year"
SELECT Completed_Year, COUNT(*) AS buildings_count FROM building GROUP BY Completed_Year;
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT DISTINCT b1.Completed_Year FROM building b1 WHERE b1.Number_of_Stories > 20 AND b1.Completed_Year IN (SELECT b2.Completed_Year FROM building b2 WHERE b2.Number_of_Stories < 15)
SELECT DISTINCT b1.Completed_Year FROM building AS b1 WHERE b1.Number_of_Stories > 20 INTERSECT SELECT DISTINCT b2.Completed_Year FROM building AS b2 WHERE b2.Number_of_Stories < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT "Address" FROM "building";
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC;
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC;
SELECT COUNT(*) FROM Services;
SELECT COUNT(*) FROM Services;
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(Analytical_Layer_Type_Code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Analytical_Layer_Type_Code) AS Cnt FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) Temp);
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.Service_Details FROM Services s JOIN Customers_and_Services cs ON s.Service_ID = cs.Service_ID JOIN Customers c ON cs.Customer_ID = c.Customer_ID WHERE c.Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(Service_ID) > 3)
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Services.Service_ID HAVING COUNT(DISTINCT Customer_ID) > 3
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(Service_ID) = (SELECT MAX(counts) FROM (SELECT Customer_ID, COUNT(Service_ID) AS counts FROM Customers_and_Services GROUP BY Customer_ID)))
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(DISTINCT Service_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT Service_ID) AS cnt FROM Customers_and_Services GROUP BY Customer_ID)))
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT DISTINCT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services;
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')) OR Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customer_Details = 'Hardy Kutch' UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID AND Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Details = 'Hardy Kutch' AND Status_Code = 'bad'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'bad' AND Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch'))
SELECT s.Service_Details FROM Services s JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID JOIN Channels c ON ci.Channel_ID = c.Channel_ID WHERE c.Channel_Details = '15 ij'
SELECT Service_Details FROM Services s JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID JOIN Channels c ON ci.Channel_ID = c.Channel_ID WHERE c.Channel_Details = '15 ij'
SELECT c.Customer_Details FROM Customers c JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID WHERE ci.Status_Code = 'Stuck' AND ci.Services_and_Channels_Details = 'bad'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT COUNT(*) FROM Integration_Platform JOIN Customer_Interactions ON Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'successful'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%failed%'))
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform_Details = 'Fail')
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) AS usage_count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customers_and_Services_Details = 'unsatisfied'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customers_and_Services_Details = 'unsatisfied')
SELECT COUNT(*) FROM Vehicles;
SELECT COUNT(*) FROM Vehicles;
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT DISTINCT V1.Type_of_powertrain FROM Vehicles V1 WHERE EXISTS (SELECT 1 FROM Vehicles V2 WHERE V2.Type_of_powertrain = V1.Type_of_powertrain AND V2.Model_year = 2014) AND EXISTS (SELECT 1 FROM Vehicles V3 WHERE V3.Type_of_powertrain = V1.Type_of_powertrain AND V3.Model_year = 2013)
SELECT DISTINCT v1.Type_of_powertrain FROM Vehicles v1 JOIN Vehicles v2 ON v1.Type_of_powertrain = v2.Type_of_powertrain WHERE v1.Model_year = 2013 AND v2.Model_year = 2014
SELECT Type_of_powertrain, COUNT(id) AS number_of_vehicles FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) AS vehicle_count FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(Annual_fuel_cost) AS Min_Annual_Fuel_Cost, MAX(Annual_fuel_cost) AS Max_Annual_Fuel_Cost, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles
SELECT MIN(Annual_fuel_cost) AS MinAnnualFuelCost, MAX(Annual_fuel_cost) AS MaxAnnualFuelCost, AVG(Annual_fuel_cost) AS AvgAnnualFuelCost FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT V.Type_of_powertrain, AVG(V.Annual_fuel_cost) AS AverageAnnualFuelCost FROM Vehicles V GROUP BY V.Type_of_powertrain HAVING COUNT(V.id) >= 2
SELECT V.Type_of_powertrain, AVG(V.Annual_fuel_cost) AS AverageAnnualFuelCost FROM Vehicles V GROUP BY V.Type_of_powertrain HAVING COUNT(V.id) >= 2
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(Customers.age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount;
SELECT * FROM Discount;
SELECT V.name, SUM(RH.total_hours) FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.name
SELECT Vehicles.name, SUM(Renting_history.total_hours) AS TotalRentalHours FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.name HAVING COUNT(Renting_history.id) >= 2
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id, Vehicles.name, Vehicles.Model_year HAVING COUNT(Renting_history.id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM Renting_history GROUP BY vehicles_id))
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT V.name, SUM(RH.total_hours) AS total_renting_hours FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.name ORDER BY total_renting_hours DESC
SELECT V.name FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.name ORDER BY SUM(R.total_hours) DESC
SELECT Discount.name FROM Discount JOIN Renting_history ON Discount.id = Renting_history.discount_id GROUP BY Discount.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.id ORDER BY COUNT(RH.id) DESC LIMIT 1
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.total_hours > 30
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id HAVING SUM(Renting_history.total_hours) > 30
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Fuel_Rate, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Fuel_Rate FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Fuel_Economy, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Fuel_Economy FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans;
SELECT Students.student_id, Students.bio_data FROM Students WHERE Students.student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) >= 2) AND Students.student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) < 2)
SELECT Students.student_id, Students.bio_data FROM Students LEFT JOIN ( SELECT student_id, COUNT(class_id) AS class_count FROM Classes GROUP BY student_id ) AS ClassCounts ON Students.student_id = ClassCounts.student_id LEFT JOIN ( SELECT student_id, COUNT(detention_id) AS detention_count FROM Detention GROUP BY student_id ) AS DetentionCounts ON Students.student_id = DetentionCounts.student_id WHERE (ClassCounts.class_count >= 2 OR DetentionCounts.detention_count < 2 OR DetentionCounts.detention_count IS NULL)
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT DISTINCT T.teacher_details FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans AS sl WHERE sl.student_id IN (SELECT a.student_id FROM Achievements AS a GROUP BY a.student_id HAVING COUNT(a.achievement_id) >= 2)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl WHERE sl.student_id IN ( SELECT a.student_id FROM Achievements a GROUP BY a.student_id HAVING COUNT(a.achievement_id) >= 2 )
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT s.bio_data, s.student_details, rat.address_type_description FROM Students s JOIN Students_Addresses sa ON s.student_id = sa.student_id JOIN Ref_Address_Types rat ON sa.address_type_code = rat.address_type_code
SELECT s.bio_data, s.student_details, rat.address_type_description FROM Students s JOIN Students_Addresses sa ON s.student_id = sa.student_id JOIN Addresses a ON sa.address_id = a.address_id JOIN Ref_Address_Types rat ON sa.address_type_code = rat.address_type_code
SELECT a.address_details, s.bio_data FROM Students s JOIN Students_Addresses sa ON s.student_id = sa.student_id JOIN Addresses a ON sa.address_id = a.address_id
SELECT bio_data, address_details FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id
SELECT bio_data, date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT bio_data, date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = 3)
SELECT DISTINCT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id GROUP BY bm.behaviour_monitoring_details HAVING COUNT(bm.student_id) = 3
SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id GROUP BY s.student_id, s.bio_data HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1 AND bm.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id GROUP BY bm.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.bio_data, se.event_date FROM Students s JOIN Student_Events se ON s.student_id = se.student_id
SELECT Students.bio_data, Student_Events.event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id
SELECT COUNT(DISTINCT se.student_id) AS num_students, et.event_type_code, et.event_type_description FROM Student_Events se JOIN Ref_Event_Types et ON se.event_type_code = et.event_type_code GROUP BY et.event_type_code ORDER BY num_students DESC LIMIT 1
SELECT et.event_type_code, et.event_type_description, COUNT(DISTINCT se.student_id) AS student_count FROM Student_Events se JOIN Ref_Event_Types et ON se.event_type_code = et.event_type_code GROUP BY se.event_type_code ORDER BY student_count DESC LIMIT 1
SELECT a.achievement_details, rat.achievement_type_description FROM Achievements a JOIN Ref_Achievement_Type rat ON a.achievement_type_code = rat.achievement_type_code
SELECT a.achievement_details, rat.achievement_type_description FROM Achievements a JOIN Ref_Achievement_Type rat ON a.achievement_type_code = rat.achievement_type_code;
SELECT COUNT(DISTINCT t.teacher_id) FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT COUNT(DISTINCT t.teacher_id) FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id NOT IN (SELECT DISTINCT a.student_id FROM Achievements a)
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT c.class_details, t.teacher_details, s.student_details FROM Classes c JOIN Teachers t ON c.teacher_id = t.teacher_id JOIN Students s ON c.student_id = s.student_id
SELECT t.teacher_details, s.student_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Students s ON c.student_id = s.student_id
SELECT MAX(Count), teacher_id FROM (SELECT teacher_id, COUNT(class_id) AS Count FROM Classes GROUP BY teacher_id) GROUP BY teacher_id ORDER BY Count DESC LIMIT 1
SELECT t.teacher_id, COUNT(c.class_id) AS number_of_courses FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id ORDER BY COUNT(c.class_id) DESC LIMIT 1
SELECT MAX(course_count) AS max_courses, student_id FROM (SELECT COUNT(class_id) AS course_count, student_id FROM Classes GROUP BY student_id) AS course_totals ORDER BY course_count DESC LIMIT 1
SELECT student_id, COUNT(class_id) AS number_of_courses FROM Classes GROUP BY student_id ORDER BY number_of_courses DESC LIMIT 1
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2)
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2)
SELECT d.detention_type_code, r.detention_type_description FROM Detention d JOIN Ref_Detention_Type r ON d.detention_type_code = r.detention_type_code GROUP BY d.detention_type_code, r.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type WHERE detention_type_code = (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT bio_data, other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT s.bio_data, s.student_details FROM Students s WHERE s.student_id IN (SELECT sl.student_id FROM Student_Loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans;
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans))
SELECT bio_data FROM Students WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans GROUP BY student_id ORDER BY SUM(amount_of_loan) DESC LIMIT 1)
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript LIMIT 1))
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id = ( SELECT tr.student_id FROM Transcripts tr WHERE tr.date_of_transcript = ( SELECT MIN(date_of_transcript) FROM Transcripts ) )
SELECT student_id, SUM(amount_of_loan) AS TotalLoanAmount FROM Student_Loans GROUP BY student_id
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id
SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS course_count FROM Students s LEFT JOIN Classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.bio_data
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) AS courses_count FROM Students LEFT JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id, Students.bio_data
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT address_type_code, address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Address_Types.address_type_code, Ref_Address_Types.address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY Ref_Address_Types.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT S.bio_data FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id LEFT JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.student_id IS NULL
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa WHERE sa.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(t.transcript_id) = 2)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa WHERE sa.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(t.transcript_id) = 2)
SELECT MIN(datetime_detention_start) FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author;
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book;
SELECT Title, ISBN, SalePrice FROM Book
SELECT COUNT(*) FROM Book;
SELECT COUNT(*) FROM Book;
SELECT COUNT(*) FROM Author;
SELECT COUNT(*) FROM Author;
SELECT COUNT(*) FROM Client;
SELECT COUNT(*) FROM Client
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT Name, Address FROM Client ORDER BY Name ASC;
SELECT Book.Title, Author.Name FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient;
SELECT a.Name, COUNT(ab.ISBN) AS NumOfBooks FROM Author a JOIN Author_Book ab ON a.idAuthor = ab.Author GROUP BY a.Name
SELECT Author.Name, COUNT(Author_Book.Author) AS number_of_books FROM Author JOIN Author_Book ON Author.idAuthor = Author_Book.Author GROUP BY Author.Name
SELECT B.ISBN, COUNT(O.IdOrder) AS order_count FROM Book B LEFT JOIN Books_Order O ON B.ISBN = O.ISBN GROUP BY B.ISBN
SELECT ISBN, COUNT(IdOrder) AS number_of_orders FROM Books_Order GROUP BY ISBN
SELECT B.ISBN, SUM(BO.amount) AS total_amount FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN
SELECT ISBN, SUM(amount) AS total_amount_ordered FROM Books_Order GROUP BY ISBN
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY COUNT(*) DESC LIMIT 1
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.Title
SELECT DISTINCT Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN;
SELECT Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient HAVING COUNT(*) >= 1
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient
SELECT Client.Name, COUNT(Orders.IdOrder) AS NumberOfOrders FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Client.Name, COUNT(Orders.IdOrder) AS number_of_orders FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Client.Name, SUM(Books_Order.amount) AS TotalBooks FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name
SELECT C.Name, SUM(BO.amount) AS TotalBooksOrdered FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.Name
SELECT C.Name FROM Client C WHERE C.IdClient = (SELECT O.IdClient FROM Orders O JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY O.IdClient ORDER BY SUM(BO.amount) DESC LIMIT 1)
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book;
SELECT AVG(PurchasePrice) AS Average_Purchase_Price, AVG(SalePrice) AS Average_Sale_Price FROM Book
SELECT AVG(PurchasePrice) AS AveragePurchasePrice, AVG(SalePrice) AS AverageSalePrice FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS MaxDifference FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS LargestDifference FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell';
SELECT AVG(b.SalePrice) FROM Book b JOIN Author_Book ab ON b.ISBN = ab.ISBN JOIN Author a ON ab.Author = a.idAuthor WHERE a.Name = 'George Orwell'
SELECT Book.SalePrice FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato'
SELECT Book.SalePrice FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato'
SELECT Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell' ORDER BY Book.SalePrice ASC LIMIT 1
SELECT Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell' ORDER BY Book.SalePrice LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato' AND Book.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT a.Name FROM Author a JOIN Author_Book ab ON a.idAuthor = ab.Author JOIN Book b ON ab.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT a.Name FROM Author a JOIN Author_Book ab ON a.idAuthor = ab.Author JOIN Book b ON ab.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT Book.Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT COUNT(*) FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')
SELECT COUNT(*) FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')
SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')) INTERSECT SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'The Little Prince'))
SELECT DISTINCT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.IdOrder HAVING COUNT(DISTINCT b.Title) = 2
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name IN ('Peter Doe', 'James Smith'))) GROUP BY ISBN HAVING COUNT(DISTINCT IdClient) = 2
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe')) AND ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT COUNT(*) FROM book;
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Book_ID, MAX(Chapters) AS MaxChapters, MIN(Chapters) AS MinChapters FROM book GROUP BY Book_ID
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) FROM review
SELECT Title, Rating FROM book JOIN review ON book.Book_ID = review.Book_ID;
SELECT Rating FROM review WHERE Book_ID = (SELECT Book_ID FROM book ORDER BY Chapters DESC LIMIT 1)
SELECT R.rank FROM review R JOIN book B ON R.Book_ID = B.Book_ID ORDER BY B.Pages ASC LIMIT 1
SELECT b.Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Rank = (SELECT MAX(Rank) FROM review)
SELECT AVG(Readers_in_Million) FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE Type = 'Novel'
SELECT Type, COUNT(Book_ID) AS number_of_books FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type HAVING COUNT(Type) = (SELECT MAX(CountType) FROM (SELECT COUNT(Type) AS CountType FROM book GROUP BY Type) Temp)
SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3
SELECT Title FROM book JOIN review ON book.Book_ID = review.Book_ID ORDER BY review.Rating ASC
SELECT b.Title, b.Audio FROM book b JOIN review r ON b.Book_ID = r.Book_ID GROUP BY b.Book_ID ORDER BY SUM(r.Readers_in_Million) DESC
SELECT COUNT(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT DISTINCT b.type FROM book b WHERE EXISTS (SELECT 1 FROM book WHERE chapters > 75 AND type = b.type) AND EXISTS (SELECT 1 FROM book WHERE chapters < 50 AND type = b.type)
SELECT COUNT(DISTINCT Type) FROM book
SELECT type, title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT COUNT(*) FROM customer;
SELECT COUNT(*) FROM customer;
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC;
SELECT Nationality, Card_Credit FROM customer;
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1;
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT c.Card_Credit FROM customer c WHERE c.Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer)
SELECT Nationality, COUNT(Customer_ID) AS number_of_customers FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(Customer_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Customer_ID) as count FROM customer GROUP BY Nationality) sub)
SELECT DISTINCT c.Nationality FROM customer AS c WHERE c.Card_Credit < 50 INTERSECT SELECT DISTINCT c.Nationality FROM customer AS c WHERE c.Card_Credit > 75
SELECT DISTINCT nationality FROM customer WHERE card_credit > 50 INTERSECT SELECT DISTINCT nationality FROM customer WHERE card_credit < 75
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID
SELECT customer.Name, customer_order.Dish_Name FROM customer_order JOIN customer ON customer_order.Customer_ID = customer.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, SUM(co.Quantity) AS Total_Quantities FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT c.Name, SUM(co.Quantity) AS TotalQuantity FROM customer_order co JOIN customer c ON co.Customer_ID = c.Customer_ID GROUP BY c.Customer_ID ORDER BY TotalQuantity
SELECT Customer_ID, Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING SUM(Quantity) > 1
SELECT customer.Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING SUM(customer_order.Quantity) > 1
SELECT DISTINCT Manager FROM branch;
SELECT DISTINCT Manager FROM branch;
SELECT c.Name FROM customer c LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE co.Customer_ID IS NULL
SELECT c.Name FROM customer c LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE co.Customer_ID IS NULL
SELECT COUNT(*) FROM member;
SELECT Name FROM member ORDER BY Age ASC
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE Nationality != 'England'
SELECT name FROM member WHERE age IN (19, 20)
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(Member_ID) AS number_of_members FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Nationality) = (SELECT MAX(count) FROM (SELECT COUNT(Nationality) as count FROM member GROUP BY Nationality))
SELECT m.Nationality FROM member m GROUP BY m.Nationality HAVING COUNT(m.Member_ID) >= 2
SELECT m.Name AS leader_name, c.Club_Name AS club_name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Overall_Ranking > 100
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Year_Join < 2018
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Club_Name = 'Houston'
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT DISTINCT m.Nationality FROM member m WHERE EXISTS (SELECT 1 FROM member WHERE Age > 22 AND Nationality = m.Nationality) AND EXISTS (SELECT 1 FROM member WHERE Age < 19 AND Nationality = m.Nationality);
SELECT AVG(m.Age) FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets;
SELECT Collection_Subset_Name FROM Collection_Subsets;
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection';
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects;
SELECT Document_Object_ID FROM Document_Objects;
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Document_Object_ID = (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Document_Objects.Owner FROM Document_Objects JOIN Document_Objects AS ParentDocs ON Document_Objects.Parent_Document_Object_ID = ParentDocs.Document_Object_ID WHERE Document_Objects.Owner = 'Marlin'
SELECT parent.Owner FROM Document_Objects AS doc JOIN Document_Objects AS parent ON doc.Parent_Document_Object_ID = parent.Document_Object_ID WHERE doc.Owner = 'Marlin'
SELECT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL
SELECT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS child_documents_count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID AS parent_document_id, COUNT(Document_Object_ID) AS child_documents_count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections;
SELECT Collection_Name FROM Collections;
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Name FROM Collections WHERE Collection_ID = (SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name = 'Nice')
SELECT parent.Collection_Name FROM Collections AS parent INNER JOIN Collections AS child ON parent.Collection_ID = child.Parent_Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT c.Collection_Name FROM Collections c LEFT JOIN Collections pc ON c.Collection_ID = pc.Parent_Collection_ID WHERE pc.Parent_Collection_ID IS NULL
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Related_Document_Object_ID FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT Related_Document_Object_ID FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(Collection_ID) AS NumOfCollections FROM Collection_Subset_Members JOIN Collection_Subsets ON Collection_Subset_Members.Collection_Subset_ID = Collection_Subsets.Collection_Subset_ID GROUP BY Collection_Subset_ID, Collection_Subset_Name
SELECT Collection_Subsets.Collection_Subset_ID, Collection_Subsets.Collection_Subset_Name, COUNT(Collection_Subset_Members.Collection_ID) AS number_of_collections FROM Collection_Subsets JOIN Collection_Subset_Members ON Collection_Subsets.Collection_Subset_ID = Collection_Subset_Members.Collection_Subset_ID GROUP BY Collection_Subsets.Collection_Subset_ID, Collection_Subsets.Collection_Subset_Name
SELECT Parent_Document_Object_ID, COUNT(*) AS child_count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID ORDER BY child_count DESC LIMIT 1
SELECT Parent_Document_Object_ID, COUNT(*) AS children_count FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS count FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY count ASC LIMIT 1
SELECT Document_Object_ID FROM Document_Objects GROUP BY Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS num_related_documents FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT DISTINCT do.Owner FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Related_Document_Object_ID JOIN Document_Objects do2 ON dsm.Document_Object_ID = do2.Document_Object_ID WHERE do2.Owner = 'Braeden'
SELECT DISTINCT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID JOIN Document_Objects do ON dsm.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Braeden'
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS number_of_documents FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID GROUP BY Document_Subset_ID, Document_Subset_Name
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) AS number_of_documents FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) AS number_of_documents FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID ORDER BY number_of_documents DESC LIMIT 1
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) AS document_count FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name ORDER BY document_count DESC LIMIT 1
SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')
SELECT Document_Object_ID, Document_Subset_Name FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID
SELECT Document_Objects.Document_Object_ID, Document_Subsets.Document_Subset_Name FROM Document_Objects JOIN Document_Subset_Members ON Document_Objects.Document_Object_ID = Document_Subset_Members.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID
SELECT c.Collection_Name FROM Collections c JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID JOIN Document_Objects do ON dic.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT c.Collection_Name FROM Collections c JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID JOIN Document_Objects do ON dic.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) AS NumberOfCollections FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(Collection_ID) AS Number_of_Collections FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT COUNT(*) FROM Documents_in_Collections dic JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(*) FROM Documents_in_Collections WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(*) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best';
SELECT Collection_Name, Collection_ID, COUNT(Document_Object_ID) AS number_of_documents FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID GROUP BY Collections.Collection_ID ORDER BY number_of_documents DESC LIMIT 1
SELECT C.Collection_Name, C.Collection_ID, COUNT(DIC.Document_Object_ID) AS NumberOfDocuments FROM Collections C JOIN Documents_in_Collections DIC ON C.Collection_ID = DIC.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT Document_Objects.Document_Object_ID FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID JOIN Document_Subset_Members ON Document_Objects.Document_Object_ID = Document_Subset_Members.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000' AND Collections.Collection_Name = 'Best'
SELECT Document_Objects.Document_Object_ID FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID JOIN Document_Subset_Members ON Document_Objects.Document_Object_ID = Document_Subset_Members.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000' AND Collections.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN ( SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') )
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) OR Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) UNION SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT c.Collection_Name FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Related_Collection_ID JOIN Collections c2 ON csm.Collection_ID = c2.Collection_ID WHERE c2.Collection_Name = 'Best'
SELECT c2.Collection_Name FROM Collections c1 INNER JOIN Collection_Subset_Members csm ON c1.Collection_ID = csm.Collection_ID INNER JOIN Collections c2 ON csm.Related_Collection_ID = c2.Collection_ID WHERE c1.Collection_Name = 'Best'
SELECT COUNT(*) FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Related_Collection_ID JOIN Collections c2 ON csm.Collection_ID = c2.Collection_ID WHERE c2.Collection_Name = 'Best';
SELECT COUNT(DISTINCT csm.Related_Collection_ID) FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT cs.Collection_Subset_Name FROM Collection_Subsets cs JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID JOIN Collections c ON csm.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality) AS MaxVoiceSoundQuality, MIN(voice_sound_quality) AS MinVoiceSoundQuality FROM performance_score;
SELECT ps.voice_sound_quality, ps.rhythm_tempo, ps.stage_presence FROM performance_score ps JOIN participants p ON ps.participant_id = p.id WHERE p.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT ps.stage_presence FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English'
SELECT p.id, p.name FROM participants p WHERE p.id IN (SELECT participant_id FROM performance_score GROUP BY participant_id HAVING COUNT(songs_id) >= 2)
SELECT participants.id, participants.name, participants.popularity FROM participants JOIN performance_score ON participants.id = performance_score.participant_id GROUP BY participants.id ORDER BY COUNT(performance_score.songs_id) DESC
SELECT participants.id, participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id WHERE performance_score.voice_sound_quality = 5 OR performance_score.rhythm_tempo = 5
SELECT ps.voice_sound_quality FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.name = 'The Balkan Girls' AND s.language = 'English'
SELECT songs.id, songs.name FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY songs.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9;
SELECT COUNT(DISTINCT s.id) FROM songs s LEFT JOIN performance_score ps ON s.id = ps.songs_id WHERE ps.songs_id IS NULL
SELECT s.language, AVG(p.rhythm_tempo) AS average_rhythm FROM songs s JOIN performance_score p ON s.id = p.songs_id GROUP BY s.language
SELECT DISTINCT p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English'
SELECT DISTINCT p.name, p.popularity FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language IN ('Croatian', 'English') GROUP BY p.id HAVING COUNT(DISTINCT s.language) = 2
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT original_artist FROM songs s JOIN performance_score p ON s.id = p.songs_id WHERE p.rhythm_tempo > 5 ORDER BY p.voice_sound_quality DESC
SELECT COUNT(*) FROM City;
SELECT COUNT(*) FROM City;
SELECT DISTINCT state FROM City;
SELECT DISTINCT state FROM City;
SELECT COUNT(DISTINCT country) FROM City;
SELECT COUNT(DISTINCT country) FROM City;
SELECT city_name, city_code, state, country FROM City;
SELECT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore';
SELECT city_name FROM City WHERE state = 'PA';
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT state, COUNT(city_code) AS number_of_cities FROM City GROUP BY state
SELECT state, COUNT(city_code) AS city_count FROM City GROUP BY state
SELECT country, COUNT(city_code) AS number_of_cities FROM City GROUP BY country
SELECT country, COUNT(city_code) AS number_of_cities FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) = (SELECT MAX(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY state))
SELECT country FROM City GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT Fname, LName FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD';
SELECT Fname || ' ' || LName AS full_name FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD';
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(*) FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.country = 'China'
SELECT S.Fname, S.Major FROM Student S JOIN City C ON S.city_code = C.city_code WHERE C.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country, COUNT(StuID) AS num_students FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT country, COUNT(StuID) FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT city_code, COUNT(StuID) AS num_students FROM Student GROUP BY city_code
SELECT city_code, COUNT(StuID) AS number_of_students FROM Student GROUP BY city_code
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT country FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY country HAVING COUNT(s.StuID) = (SELECT MIN(student_count) FROM (SELECT COUNT(StuID) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country))
SELECT city_name FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY c.city_name HAVING COUNT(s.StuID) >= 3
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING COUNT(StuID) > 5
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND Country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND country != 'USA'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'EWR') OR (city1_code = 'EWR' AND city2_code = 'BOS')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'EWR') OR (city1_code = 'EWR' AND city2_code = 'BOS')
SELECT AVG(distance) AS AvgDistance, MIN(distance) AS MinDistance, MAX(distance) AS MaxDistance FROM Direct_distance
SELECT AVG(distance) AS Average_Distance, MIN(distance) AS Minimum_Distance, MAX(distance) AS Maximum_Distance FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT DISTINCT d.city1_code FROM Direct_distance d WHERE d.distance > (SELECT AVG(distance) FROM Direct_distance) UNION SELECT DISTINCT d.city2_code FROM Direct_distance d WHERE d.distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT dd.city1_code, dd.city2_code FROM Direct_distance dd WHERE dd.distance < 1000
SELECT city1_code FROM Direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = 'BOS' OR city2_code = 'BOS'
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance ASC LIMIT 1
SELECT C.city_name FROM City C WHERE C.city_code = (SELECT D.city2_code FROM Direct_distance D JOIN City C1 ON D.city1_code = C1.city_code WHERE C1.city_name = 'Chicago' ORDER BY D.distance ASC LIMIT 1)
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city1_code, SUM(distance) AS total_distance FROM Direct_distance GROUP BY city1_code
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT City.city_name, AVG(Direct_distance.distance) AS average_distance FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.city_name
SELECT City.city_name, AVG(Direct_distance.distance) AS average_distance FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.city_name
SELECT dd.distance FROM Student s1 JOIN City c1 ON s1.city_code = c1.city_code JOIN Student s2 ON s1.city_code != s2.city_code JOIN City c2 ON s2.city_code = c2.city_code JOIN Direct_distance dd ON (c1.city_code = dd.city1_code AND c2.city_code = dd.city2_code) OR (c1.city_code = dd.city2_code AND c2.city_code = dd.city1_code) WHERE s1.Fname = 'Linda' AND s1.LName = 'Smith' AND s2.Fname = 'Tracy' AND s2.LName = 'Kim'
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE LName = 'Smith' AND Fname = 'Linda') AND city2_code = (SELECT city_code FROM Student WHERE LName = 'Kim' AND Fname = 'Tracy') OR city1_code = (SELECT city_code FROM Student WHERE LName = 'Kim' AND Fname = 'Tracy') AND city2_code = (SELECT city_code FROM Student WHERE LName = 'Smith' AND Fname = 'Linda')
SELECT s.fname, s.lname FROM Student s JOIN City c1 ON s.city_code = c1.city_code JOIN City c2 ON c2.city_name = 'Linda Smith' JOIN Direct_distance dd ON (dd.city1_code = c1.city_code AND dd.city2_code = c2.city_code) OR (dd.city1_code = c2.city_code AND dd.city2_code = c1.city_code) ORDER BY dd.distance DESC LIMIT 1
SELECT CONCAT(s.Fname, ' ', s.LName) AS FullName FROM Student s JOIN City c1 ON s.city_code = c1.city_code JOIN Student linda ON linda.Fname = 'Linda' AND linda.LName = 'Smith' JOIN City c2 ON linda.city_code = c2.city_code JOIN Direct_distance dd ON (dd.city1_code = c1.city_code AND dd.city2_code = c2.city_code) OR (dd.city1_code = c2.city_code AND dd.city2_code = c1.city_code) ORDER BY dd.distance DESC LIMIT 1
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code WHERE S.Fname = 'Linda'
SELECT City.state FROM Student JOIN City ON Student.city_code = City.city_code WHERE Student.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30;
SELECT * FROM Sailors WHERE age > 30;
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE r.bid = 102
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102)
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT s1.name FROM Sailors s1 WHERE s1.age > (SELECT MAX(s2.age) FROM Sailors s2 WHERE s2.rating > 7)
SELECT DISTINCT s1.name FROM Sailors s1, Sailors s2 WHERE s1.age > s2.age AND s2.rating > 7;
SELECT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid
SELECT DISTINCT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid GROUP BY Sailors.sid HAVING COUNT(DISTINCT Reserves.bid) > 1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves GROUP BY sid HAVING COUNT(DISTINCT bid) >= 2)
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT red_sailors.sid FROM Reserves AS red_reserves JOIN Boats AS red_boats ON red_reserves.bid = red_boats.bid JOIN Sailors AS red_sailors ON red_reserves.sid = red_sailors.sid WHERE red_boats.color = 'red' INTERSECT SELECT blue_sailors.sid FROM Reserves AS blue_reserves JOIN Boats AS blue_boats ON blue_reserves.bid = blue_boats.bid JOIN Sailors AS blue_sailors ON blue_reserves.sid = blue_sailors.sid WHERE blue_boats.color = 'blue'
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT s.name, s.sid FROM Sailors AS s JOIN Reserves AS r ON s.sid = r.sid JOIN Boats AS b ON r.bid = b.bid WHERE b.color = 'red' INTERSECT SELECT s.name, s.sid FROM Sailors AS s JOIN Reserves AS r ON s.sid = r.sid JOIN Boats AS b ON r.bid = b.bid WHERE b.color = 'blue'
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE r.bid = 103
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103
SELECT DISTINCT s.name FROM Sailors s WHERE s.rating > (SELECT MAX(s2.rating) FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT DISTINCT s1.name FROM Sailors s1 WHERE s1.rating > (SELECT MAX(s2.rating) FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT DISTINCT s1.name FROM Sailors s1 WHERE s1.rating > (SELECT MAX(s2.rating) FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT s.name FROM Sailors s WHERE s.rating > ALL (SELECT s2.rating FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE s.rating > 2
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE s.rating >= 3
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT COUNT(*) FROM Sailors;
SELECT COUNT(*) FROM Sailors
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT AVG(age) FROM Sailors WHERE rating = 7;
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating) AS AverageRating, MAX(age) AS MaxAge FROM Sailors
SELECT AVG(rating) AS AverageRating, MAX(age) AS MaxAge FROM Sailors
SELECT bid, COUNT(*) AS number_of_reservations FROM Reserves GROUP BY bid
SELECT bid, COUNT(*) AS number_of_reservations FROM Reserves GROUP BY bid
SELECT bid, COUNT(sid) AS number_of_reservations FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(*) FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(sid) AS reservation_count FROM Reserves GROUP BY bid HAVING COUNT(sid) > 1
SELECT bid, COUNT(*) AS num_reservations FROM Reserves GROUP BY bid HAVING COUNT(*) > 1
SELECT Boats.name, COUNT(*) AS number_of_reservations FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Reserves.sid > 1 GROUP BY Boats.bid
SELECT Boats.name, COUNT(*) AS reservation_count FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Reserves.sid > 1 GROUP BY Boats.name
SELECT Sailors.rating, AVG(Sailors.age) AS avg_age FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating
SELECT Sailors.rating, AVG(Sailors.age) AS avg_age FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats;
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT DISTINCT b.name FROM Boats b JOIN Reserves r ON b.bid = r.bid JOIN Sailors s ON r.sid = s.sid WHERE s.age BETWEEN 20 AND 30
SELECT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age BETWEEN 20 AND 30
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT S2.rating FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red')
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) FROM Sailors
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon'
SELECT Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon'
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC;
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Headphone_ID) AS count FROM headphone GROUP BY Class))
SELECT "Class" FROM headphone GROUP BY "Class" HAVING COUNT(Headphone_ID) > 2
SELECT `Class` FROM headphone GROUP BY `Class` HAVING COUNT(Headphone_ID) <= 2
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT `Class`, COUNT(`Headphone_ID`) FROM `headphone` WHERE `Price` > 200 GROUP BY `Class`
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT Earpads, COUNT(*) AS count FROM headphone GROUP BY Earpads ORDER BY count DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) AS NumberOfHeadphones FROM headphone GROUP BY Earpads ORDER BY NumberOfHeadphones DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Construction, AVG(Price) AS average_price FROM headphone GROUP BY Construction
SELECT Construction, AVG(Price) AS AveragePrice FROM headphone GROUP BY Construction
SELECT DISTINCT h.Class FROM headphone AS h WHERE h.Earpads = 'Bowls' INTERSECT SELECT DISTINCT h.Class FROM headphone AS h WHERE h.Earpads = 'Comfort Pads'
SELECT DISTINCT h.Class FROM headphone h WHERE EXISTS (SELECT 1 FROM headphone WHERE Earpads = 'Bowls' AND Class = h.Class) AND EXISTS (SELECT 1 FROM headphone WHERE Earpads = 'Comfort Pads' AND Class = h.Class);
SELECT DISTINCT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened ASC
SELECT Name FROM store ORDER BY Date_Opened ASC
SELECT s.Name, s.Parking FROM store s WHERE s.Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT Neighborhood, COUNT(Store_ID) AS num_stores FROM store GROUP BY Neighborhood
SELECT Neighborhood, COUNT(Store_ID) AS number_of_stores FROM store GROUP BY Neighborhood
SELECT s.Name, SUM(st.Quantity) AS TotalHeadphones FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Store_ID ORDER BY TotalHeadphones DESC LIMIT 1
SELECT s.Name, SUM(st.Quantity) AS Total_Quantity FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Name
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT s.Name FROM store s LEFT JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Headphone_ID IS NULL
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID HAVING SUM(Quantity) = (SELECT MAX(total) FROM (SELECT SUM(Quantity) AS total FROM stock GROUP BY Headphone_ID)))
SELECT Model FROM headphone WHERE Headphone_ID = (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT COUNT(*) FROM Author;
SELECT COUNT(DISTINCT author_id) FROM Author
SELECT COUNT(*) FROM Paper;
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Affiliation;
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000;
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE p.year = 2009 AND a.name = 'Columbia University';
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University' AND p.year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Harvard University'
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University'
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown';
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown'
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al1 ON p.paper_id = al1.paper_id JOIN Author_list al2 ON p.paper_id = al2.paper_id JOIN Affiliation a1 ON al1.affiliation_id = a1.affiliation_id JOIN Affiliation a2 ON al2.affiliation_id = a2.affiliation_id WHERE a1.name = 'Stanford University' AND a2.name = 'Columbia University' AND al1.author_id != al2.author_id
SELECT p.paper_id, p.title FROM Paper AS p JOIN Author_list AS al ON p.paper_id = al.paper_id JOIN Affiliation AS a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Stanford' INTERSECT SELECT p.paper_id, p.title FROM Paper AS p JOIN Author_list AS al ON p.paper_id = al.paper_id JOIN Affiliation AS a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University'
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list AS AL1 ON Paper.paper_id = AL1.paper_id JOIN Author AS A1 ON AL1.author_id = A1.author_id JOIN Author_list AS AL2 ON Paper.paper_id = AL2.paper_id JOIN Author AS A2 ON AL2.author_id = A2.author_id WHERE A1.name = 'Mckeown, Kathleen' AND A2.name = 'Rambow, Owen'
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY p.paper_id HAVING COUNT(DISTINCT a.name) = 2
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND AL.paper_id = P.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Rambow' AND AL.paper_id = P.paper_id)
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' AND NOT EXISTS (SELECT 1 FROM Author_list al2 JOIN Author a2 ON al2.author_id = a2.author_id WHERE a2.name = 'Rambow' AND al2.paper_id = al.paper_id)
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Author.name, COUNT(Author_list.paper_id) AS number_of_papers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id ORDER BY number_of_papers DESC
SELECT Author.name, COUNT(Author_list.paper_id) AS number_of_papers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id ORDER BY number_of_papers DESC
SELECT a.affiliation_id, a.name, COUNT(DISTINCT al.paper_id) AS number_of_papers FROM Affiliation a LEFT JOIN Author_list al ON a.affiliation_id = al.affiliation_id GROUP BY a.affiliation_id, a.name ORDER BY number_of_papers ASC
SELECT a.name FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id JOIN Paper p ON al.paper_id = p.paper_id GROUP BY a.affiliation_id ORDER BY COUNT(*) DESC
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id HAVING COUNT(Author_list.paper_id) > 50
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id HAVING COUNT(Author_list.paper_id) > 50
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = 1)
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id HAVING COUNT(Author_list.paper_id) = 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002';
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027';
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027'
SELECT paper_id, COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY paper_id ORDER BY citation_count DESC LIMIT 1
SELECT paper_id, COUNT(cited_paper_id) AS number_of_citations FROM Citation GROUP BY cited_paper_id ORDER BY number_of_citations DESC LIMIT 1
SELECT P.title FROM Paper P WHERE P.paper_id = (SELECT C.paper_id FROM Citation C GROUP BY C.paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT P.title FROM Paper P WHERE P.paper_id = (SELECT C.paper_id FROM Citation C GROUP BY C.paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT p.title, COUNT(c.cited_paper_id) AS citation_count FROM Paper p JOIN Citation c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT p.title, COUNT(c.cited_paper_id) AS citation_count FROM Paper p JOIN Citation c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT COUNT(*) FROM Citation WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen'))
SELECT COUNT(*) FROM Citation c JOIN Author_list al ON c.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation c JOIN Author_list al ON c.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation c JOIN Author_list al ON c.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT a.name, COUNT(*) AS citation_count FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Citation c ON al.paper_id = c.cited_paper_id GROUP BY a.author_id ORDER BY citation_count DESC LIMIT 1
SELECT A.name, COUNT(*) AS citation_count FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT Paper.venue, Paper.year FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT p.venue, p.year FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT DISTINCT venue, year FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University'))
SELECT DISTINCT Paper.venue, Paper.year FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University'
SELECT author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 GROUP BY al.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT A.name FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.author_id ORDER BY COUNT(P.paper_id) DESC LIMIT 1
SELECT Affiliation.name FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Affiliation.affiliation_id ORDER BY COUNT(*) DESC LIMIT 3
SELECT A.affiliation_id, COUNT(*) AS paper_count FROM Author_list A JOIN Paper P ON A.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.affiliation_id ORDER BY paper_count DESC LIMIT 3
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University' AND p.year <= 2009;
SELECT COUNT(*) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(*) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University')) AND year BETWEEN 2000 AND 2009
SELECT COUNT(paper_id) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University')) AND year BETWEEN 2000 AND 2009
SELECT P.title FROM Paper P WHERE P.paper_id = (SELECT AL.paper_id FROM Author_list AL GROUP BY AL.paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id GROUP BY Paper.paper_id ORDER BY COUNT(Author_list.author_id) DESC LIMIT 1
SELECT COUNT(DISTINCT al.author_id) FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id JOIN Author a ON al.author_id = a.author_id WHERE p.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND a.name != 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT al2.author_id) FROM Author_list al1 JOIN Author a ON al1.author_id = a.author_id JOIN Author_list al2 ON al1.paper_id = al2.paper_id WHERE a.name = 'Mckeown, Kathleen' AND al2.author_id != al1.author_id
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Author.name = 'Mckeown, Kathleen' GROUP BY Author.name ORDER BY COUNT(Paper.paper_id) DESC LIMIT 1
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id WHERE Author_list.paper_id IN (SELECT Author_list.paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen') AND Author.name != 'Mckeown, Kathleen' GROUP BY Author.name ORDER BY COUNT(Author_list.paper_id) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT P.paper_id, P.title FROM Paper P WHERE P.paper_id NOT IN (SELECT C.cited_paper_id FROM Citation C)
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT name FROM Affiliation WHERE address LIKE '%China%' ORDER BY (SELECT COUNT(*) FROM Author_list WHERE Author_list.affiliation_id = Affiliation.affiliation_id) DESC LIMIT 1
SELECT Affiliation.name FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Affiliation.address LIKE '%China%' GROUP BY Affiliation.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue, year, COUNT(paper_id) FROM Paper GROUP BY venue, year
SELECT venue, year, COUNT(paper_id) AS num_papers FROM Paper GROUP BY venue, year
SELECT a.name, COUNT(p.paper_id) FROM Affiliation a LEFT JOIN Author_list al ON a.affiliation_id = al.affiliation_id LEFT JOIN Paper p ON al.paper_id = p.paper_id GROUP BY a.name
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) AS paper_count FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.affiliation_id
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(paper_id) > 50)
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(paper_id) > 50)
SELECT COUNT(DISTINCT a.author_id) FROM Author a LEFT JOIN Author_list al ON a.author_id = al.author_id LEFT JOIN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(*) > 50) c ON al.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT COUNT(DISTINCT a.author_id) FROM Author a WHERE a.author_id NOT IN (SELECT al.author_id FROM Author_list al JOIN (SELECT c.cited_paper_id FROM Citation c GROUP BY c.cited_paper_id HAVING COUNT(c.paper_id) > 50) cp ON al.paper_id = cp.cited_paper_id)
SELECT DISTINCT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue IN ('NAACL', 'ACL') AND p.year = 2009 GROUP BY a.author_id HAVING COUNT(DISTINCT p.venue) = 2
SELECT DISTINCT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue IN ('NAACL', 'ACL') AND p.year = 2009 GROUP BY a.author_id HAVING COUNT(DISTINCT p.venue) = 2
SELECT a.name FROM Author a WHERE NOT EXISTS (SELECT 1 FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL' AND al.author_id = a.author_id)
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT COUNT(*) FROM conference;
SELECT COUNT(*) FROM conference
SELECT DISTINCT "Conference_Name" FROM conference
SELECT DISTINCT "Conference_Name" FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT c.Conference_Name, COUNT(cp.Conference_ID) AS number_of_times FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT Conference_Name, COUNT(Conference_ID) AS occurrence_count FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(Conference_ID) AS number_of_conferences FROM conference GROUP BY Year
SELECT Year, COUNT(Conference_ID) AS conferences_count FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution;
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900;
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900;
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT institution.Institution_Name, COUNT(staff.staff_ID) AS staff_count FROM institution LEFT JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE institution.Founded > 1800 GROUP BY institution.Institution_Name
SELECT i.Institution_ID, COUNT(s.staff_ID) AS staff_count FROM institution i JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM staff
SELECT DISTINCT Conference_Name FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID JOIN staff ON conference_participation.staff_ID = staff.staff_ID WHERE staff.Nationality = 'Canada'
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada'
SELECT DISTINCT s.name FROM staff s WHERE s.staff_ID IN (SELECT cp1.staff_ID FROM conference_participation cp1 WHERE cp1.role = 'speaker') AND s.staff_ID IN (SELECT cp2.staff_ID FROM conference_participation cp2 WHERE cp2.role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'Naccl'))
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name IN ('ACL', 'NACCL') GROUP BY s.staff_ID HAVING COUNT(DISTINCT c.Conference_Name) = 2
SELECT DISTINCT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year IN (2003, 2004);
SELECT DISTINCT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year IN (2003, 2004)
SELECT Conference_Name, Year, COUNT(staff_ID) AS number_of_participants FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY conference.Conference_ID, Conference_Name, Year
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS number_of_participants FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year
SELECT c.Conference_Name FROM conference c WHERE c.Conference_ID IN (SELECT cp.Conference_ID FROM conference_participation cp GROUP BY cp.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2)
SELECT C.Conference_Name FROM conference C WHERE C.Conference_ID IN (SELECT CP.Conference_ID FROM conference_participation CP GROUP BY CP.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2)
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL')
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)))
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)))
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT COUNT(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT h.plane_name FROM Hangar h LEFT JOIN PilotSkills ps ON h.plane_name = ps.plane_name GROUP BY h.plane_name ORDER BY COUNT(ps.pilot_name) ASC LIMIT 1
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills;
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC;
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name ASC
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC;
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber')
SELECT ps1.pilot_name FROM PilotSkills ps1 JOIN PilotSkills ps2 ON ps1.pilot_name = ps2.pilot_name WHERE ps1.plane_name = 'Piper Cub' AND ps2.plane_name = 'B-52 Bomber'
SELECT AVG(age) AS Average_Age, MIN(age) AS Minimum_Age FROM PilotSkills
SELECT AVG(age) AS AverageAge, MIN(age) AS MinimumAge FROM PilotSkills
SELECT ps1.pilot_name FROM PilotSkills ps1 JOIN PilotSkills ps2 ON ps1.pilot_name = ps2.pilot_name JOIN Hangar h1 ON ps1.plane_name = h1.plane_name JOIN Hangar h2 ON ps2.plane_name = h2.plane_name WHERE h1.location = 'Austin' AND h2.location = 'Boston'
SELECT DISTINCT pilot_name FROM PilotSkills ps JOIN Hangar h ON ps.plane_name = h.plane_name WHERE h.location IN ('Austin', 'Boston')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT plane_name, AVG(age) AS avg_age FROM PilotSkills GROUP BY plane_name
SELECT plane_name, AVG(age) AS average_age FROM PilotSkills GROUP BY plane_name
SELECT plane_name, COUNT(*) AS number_of_planes FROM Hangar GROUP BY plane_name
SELECT plane_name, COUNT(pilot_name) AS number_of_pilots FROM PilotSkills GROUP BY plane_name
SELECT ps.plane_name, ps.pilot_name, MIN(ps.age) AS oldest_age FROM PilotSkills ps GROUP BY ps.plane_name ORDER BY ps.plane_name ASC;
SELECT H.plane_name, PS.pilot_name FROM Hangar H INNER JOIN PilotSkills PS ON H.plane_name = PS.plane_name WHERE PS.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT ps.plane_name, ps.pilot_name, MAX(ps.age) AS oldest_age FROM PilotSkills ps GROUP BY ps.plane_name
SELECT Hangar.plane_name, PilotSkills.pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE (Hangar.plane_name, PilotSkills.age) IN (SELECT plane_name, MAX(age) FROM PilotSkills GROUP BY plane_name)
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT H.location, COUNT(P.pilot_name) AS num_pilots, AVG(P.age) AS avg_age FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name GROUP BY H.location
SELECT H.location, COUNT(DISTINCT PS.pilot_name) AS num_pilots, AVG(PS.age) AS average_age FROM Hangar H JOIN PilotSkills PS ON H.plane_name = PS.plane_name GROUP BY H.location
SELECT plane_name, COUNT(pilot_name) AS num_pilots FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT H.plane_name, COUNT(P.pilot_name) AS num_pilots FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name GROUP BY H.plane_name HAVING AVG(P.age) < 35
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills))
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills))
SELECT pilot_name, age FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin')
SELECT ps.pilot_name, ps.age FROM PilotSkills ps JOIN Hangar h ON ps.plane_name = h.plane_name WHERE h.location = 'Austin'
SELECT DISTINCT p1.pilot_name FROM PilotSkills p1 WHERE p1.age > (SELECT MIN(p2.age) FROM PilotSkills p2 WHERE p2.plane_name = 'Piper Cub') ORDER BY p1.pilot_name
SELECT DISTINCT p1.pilot_name FROM PilotSkills p1 WHERE p1.age > (SELECT MAX(p2.age) FROM PilotSkills p2 WHERE p2.plane_name = 'Piper Cub') ORDER BY p1.pilot_name;
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(DISTINCT ps.pilot_name) FROM PilotSkills ps WHERE ps.age < (SELECT MIN(ps2.age) FROM PilotSkills ps2 WHERE ps2.plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT Area_km, Government_website FROM district WHERE Population = (SELECT MIN(Population) FROM district)
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km) AS largest_area, AVG(Area_km) AS average_area FROM district
SELECT SUM(Population) FROM district WHERE District_ID IN (SELECT District_ID FROM district ORDER BY Area_km DESC LIMIT 3)
SELECT District_ID, Name, Government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE '%.gov%'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT AVG(Points) AS average_points, AVG(Age) AS average_age FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40;
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT Name FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman)
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID ORDER BY COUNT(sd.Spokesman_ID) DESC LIMIT 1
SELECT s.Name FROM spokesman s JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Start_year < 2004
SELECT d.Name, COUNT(sd.Spokesman_ID) AS num_spokesmen FROM district d LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.Name
SELECT DISTINCT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE s.Rank_position = 1 INTERSECT SELECT DISTINCT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE s.Rank_position = 2
SELECT DISTINCT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID HAVING COUNT(sd.Spokesman_ID) > 1
SELECT COUNT(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT SUM(Population) AS Total_Population, AVG(Population) AS Average_Population FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT fname, lname FROM Artists WHERE birthYear > 1850;
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT a.birthYear FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year > 1920
SELECT DISTINCT a.birthYear FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year > 1920
SELECT fname, lname FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT deathYear - birthYear AS age FROM Artists ORDER BY (deathYear - birthYear) ASC LIMIT 1
SELECT deathYear - birthYear AS age FROM Artists ORDER BY age ASC LIMIT 1
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(*) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT title, year FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE fname = 'Mary')
SELECT p.width_mm FROM Paintings p JOIN Artists a ON p.painterID = a.artistID WHERE a.birthYear < 1850
SELECT Paintings.width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT location, medium FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE fname = 'Pablo')
SELECT Paintings.location, Paintings.medium FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT DISTINCT CONCAT(Artists.fname, ' ', Artists.lname) AS FullName FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil') INTERSECT SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'lithographic')
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' INTERSECT SELECT painterID FROM Paintings WHERE medium = 'lithographic')
SELECT a.birthYear FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.year = 1884 AND p.mediumOn = 'canvas'
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884)
SELECT DISTINCT a.fname FROM Artists a INNER JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium = 'oil' AND p.location = 'gallery 241'
SELECT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241')
SELECT medium, COUNT(*) AS number_of_works FROM ( SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures ) AS Combined GROUP BY medium
SELECT medium, COUNT(*) AS number_of_works FROM ( SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures ) AS combined GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT location, COUNT(paintingID) AS paintings_count FROM Paintings WHERE year < 1900 GROUP BY location
SELECT COUNT(DISTINCT location) FROM Paintings WHERE year < 1900
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM Paintings WHERE medium = 'oil' AND year > 1910
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 240'
SELECT DISTINCT Paintings.painterID FROM Paintings WHERE Paintings.medium = 'oil' AND Paintings.location = 'gallery 240'
SELECT DISTINCT p1.title FROM Paintings p1 WHERE p1.height_mm > (SELECT MIN(p2.height_mm) FROM Paintings p2 WHERE p2.mediumOn = 'canvas')
SELECT DISTINCT p.title FROM Paintings p WHERE p.height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE mediumOn = 'canvas')
SELECT DISTINCT p1.paintingID FROM Paintings p1 WHERE p1.year < (SELECT MIN(p2.year) FROM Paintings p2 WHERE p2.location = 'gallery 240')
SELECT DISTINCT p1.paintingID FROM Paintings p1 JOIN Paintings p2 ON p1.year < p2.year WHERE p2.location = 'gallery 240'
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT MIN(paintingID) AS oldest_painting_id FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT Artists.fname || ' ' || Artists.lname AS full_name FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.title LIKE '%female%'
SELECT a.fname || ' ' || a.lname AS full_name FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title ASC;
SELECT DISTINCT title FROM Paintings ORDER BY title ASC
SELECT DISTINCT title FROM Paintings ORDER BY width_mm
SELECT DISTINCT title FROM Paintings ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950;
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950;
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT Artists.artistID FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.year < 1900 GROUP BY Artists.artistID ORDER BY COUNT(*) DESC LIMIT 1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(Counted) FROM (SELECT sculptorID, COUNT(sculptureID) AS Counted FROM Sculptures GROUP BY sculptorID) AS SculptureCounts))
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(Counted) FROM (SELECT sculptorID, COUNT(sculptureID) AS Counted FROM Sculptures GROUP BY sculptorID) AS SculptureCounts))
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT location FROM Paintings WHERE mediumOn IN ('on panel', 'on canvas')
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('panels', 'canvas')
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT AVG(height_mm) AS average_height, AVG(width_mm) AS average_width FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT MAX(height_mm), paintingID FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS Largest_Height, MAX(width_mm) AS Largest_Width FROM Paintings GROUP BY year
SELECT Artists.fname, Artists.lname, AVG(Paintings.height_mm) AS Avg_Height, AVG(Paintings.width_mm) AS Avg_Width FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Paintings.painterID ORDER BY Artists.lname, Artists.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(P.paintingID) FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT a.fname, COUNT(p.paintingID) AS number_of_paintings FROM Artists a JOIN Paintings p ON a.artistID = p.painterID GROUP BY a.artistID HAVING COUNT(p.paintingID) >= 2
SELECT deathYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings GROUP BY painterID HAVING COUNT(paintingID) <= 3)
SELECT Artists.deathYear FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(Paintings.paintingID) < 4
SELECT Artists.deathYear FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID GROUP BY Artists.artistID ORDER BY COUNT(Sculptures.sculptureID) ASC LIMIT 1
SELECT A.deathYear FROM Artists A WHERE A.artistID = (SELECT S.sculptorID FROM Sculptures S GROUP BY S.sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT height_mm, paintingID FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT p.paintingID FROM Paintings p WHERE p.year < ALL (SELECT year FROM Paintings WHERE location = 'gallery 240')
SELECT p.paintingID FROM Paintings p WHERE p.year < (SELECT MIN(p2.year) FROM Paintings p2 WHERE p2.location = 'gallery 240')
SELECT p1.paintingID FROM Paintings p1 WHERE p1.height_mm > ALL (SELECT p2.height_mm FROM Paintings p2 WHERE p2.year > 1900)
SELECT p.paintingID FROM Paintings p WHERE p.height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT Artists.fname, Artists.lname, COUNT(Paintings.paintingID) AS num_paintings FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium = 'oil' GROUP BY Artists.artistID ORDER BY num_paintings DESC LIMIT 3
SELECT fname, lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE medium = 'oil' GROUP BY Artists.artistID ORDER BY COUNT(*) DESC LIMIT 1
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas' GROUP BY location
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas'
SELECT COUNT(*) FROM race;
SELECT COUNT(*) FROM race;
SELECT winning_driver, winning_team FROM race ORDER BY winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT race.Winning_driver FROM race WHERE race.Pole_Position != 'Junior Strous'
SELECT r.Winning_driver FROM race r WHERE r.Pole_Position != 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT entrant FROM driver WHERE age >= 20;
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20;
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM driver
SELECT MAX(Age), MIN(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT d.Driver_Name, r.Race_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID
SELECT d.Driver_Name, r.Race_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID
SELECT driver.Driver_Name, COUNT(race.Driver_ID) AS Races_Participated FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_Name
SELECT driver.Driver_Name, COUNT(race.Road) AS races_participated FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_Name
SELECT D.Age FROM driver D JOIN race R ON D.Driver_ID = R.Driver_ID GROUP BY D.Driver_ID ORDER BY COUNT(R.Road) DESC LIMIT 1
SELECT Age FROM driver WHERE Driver_ID = (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT d.Driver_Name, d.Age FROM driver d WHERE d.Driver_ID IN (SELECT r.Driver_ID FROM race r GROUP BY r.Driver_ID HAVING COUNT(r.Road) >= 2)
SELECT d.Driver_Name, d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID HAVING COUNT(r.Road) >= 2
SELECT DISTINCT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26
SELECT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Constructor, COUNT(Driver_ID) AS number_of_drivers FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(DISTINCT Driver_ID) AS num_drivers FROM driver GROUP BY Constructor
SELECT engine FROM driver GROUP BY engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2
SELECT driver.Engine, COUNT(DISTINCT driver.Driver_ID) AS NumberOfDrivers FROM driver GROUP BY driver.Engine HAVING COUNT(DISTINCT driver.Driver_ID) >= 2;
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT constructor FROM driver WHERE age < 20 INTERSECT SELECT constructor FROM driver WHERE age > 30
SELECT constructor FROM driver WHERE age < 20 INTERSECT SELECT constructor FROM driver WHERE age > 30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(Road) > 1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe' INTERSECT SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
SELECT d1.Driver_Name FROM driver d1 JOIN race r1 ON d1.Driver_ID = r1.Driver_ID JOIN race r2 ON d1.Driver_ID = r2.Driver_ID WHERE r1.Pole_Position = 'James Hinchcliffe' AND r2.Pole_Position = 'Carl Skerlong'
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) FROM languages;
SELECT COUNT(*) FROM languages;
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC;
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries;
SELECT MAX(health_score) AS MaxHealthScore, MIN(health_score) AS MinHealthScore FROM countries WHERE name != 'Norway'
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name, l.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT c.name, l.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT languages.name, COUNT(official_languages.country_id) AS num_countries FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name
SELECT languages.name, COUNT(official_languages.country_id) AS number_of_countries FROM official_languages JOIN languages ON official_languages.language_id = languages.id GROUP BY languages.name
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM languages WHERE id = (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name HAVING COUNT(official_languages.country_id) >= 2
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.id HAVING COUNT(ol.country_id) >= 2
SELECT AVG(c.overall_score) FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English'
SELECT AVG(c.overall_score) FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English'
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 3)
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name ORDER BY COUNT(official_languages.country_id) DESC LIMIT 3
SELECT languages.name, AVG(countries.overall_score) AS average_overall_score FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY average_overall_score DESC
SELECT languages.name, AVG(countries.overall_score) AS average_overall_score FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY average_overall_score DESC
SELECT name FROM countries WHERE id IN (SELECT country_id FROM official_languages GROUP BY country_id HAVING COUNT(language_id) = (SELECT MAX(count) FROM (SELECT COUNT(language_id) AS count FROM official_languages GROUP BY country_id)))
SELECT C.name FROM countries AS C WHERE C.id = (SELECT O.country_id FROM official_languages AS O GROUP BY O.country_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT l.name FROM languages AS l JOIN official_languages AS ol ON l.id = ol.language_id JOIN countries AS c ON ol.country_id = c.id WHERE c.overall_score > 95 INTERSECT SELECT l.name FROM languages AS l JOIN official_languages AS ol ON l.id = ol.language_id JOIN countries AS c ON ol.country_id = c.id WHERE c.overall_score < 90
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id WHERE countries.overall_score > 95 INTERSECT SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id WHERE countries.overall_score < 90
SELECT DISTINCT country, town_city FROM Addresses;
SELECT country, town_city FROM Addresses
SELECT a.county_state_province FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id
SELECT a.address_id, a.county_state_province FROM Properties p JOIN Addresses a ON p.property_address_id = a.address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT F.feature_name, F.feature_description FROM Features F JOIN Property_Features PF ON F.feature_id = PF.feature_id GROUP BY F.feature_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(room_count) FROM Properties
SELECT MIN(room_count) FROM Properties
SELECT COUNT(*) FROM Properties WHERE parking_lots = '1' OR garage_yn = '1'
SELECT COUNT(*) FROM Properties WHERE parking_lots = '1' OR garage_yn = '1'
SELECT DISTINCT ac.age_category_description FROM Users u JOIN Ref_Age_Categories ac ON u.age_category_code = ac.age_category_code WHERE u.other_user_details LIKE '%Mother%'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_description LIKE '%Mother%'
SELECT U.first_name FROM Users U WHERE U.user_id = (SELECT P.owner_user_id FROM Properties P GROUP BY P.owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT first_name FROM Users WHERE user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(room_count) FROM Properties WHERE property_description LIKE '%garden%'
SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id IN (SELECT feature_id FROM Features WHERE feature_name = 'garden'))
SELECT Addresses.town_city FROM Properties JOIN Property_Features ON Properties.property_id = Property_Features.property_id JOIN Features ON Property_Features.feature_id = Features.feature_id JOIN Addresses ON Properties.property_address_id = Addresses.address_id WHERE Features.feature_name = 'Swimming Pool'
SELECT town_city FROM Addresses INNER JOIN Properties ON Addresses.address_id = Properties.property_address_id INNER JOIN Property_Features ON Properties.property_id = Property_Features.property_id INNER JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'Swimming Pool' GROUP BY town_city
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, MIN(vendor_requested_price) FROM Properties
SELECT AVG(room_count) FROM Properties
SELECT AVG(room_count) FROM Properties
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT user_id, search_string FROM User_Searches GROUP BY user_id, search_string HAVING COUNT(*) >= 2
SELECT user_id, search_seq FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2
SELECT MAX(search_datetime) FROM User_Searches
SELECT MAX(search_datetime) FROM User_Searches
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT a.zip_postcode FROM Addresses a WHERE a.address_id IN (SELECT p.property_address_id FROM Properties p WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2))
SELECT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT u.user_id, u.user_category_code FROM Users u JOIN User_Searches us ON u.user_id = us.user_id GROUP BY u.user_id, u.user_category_code HAVING COUNT(us.search_seq) = 1
SELECT user_id, user_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) = 1)
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1))
SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC LIMIT 1)
SELECT Users.login_name FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Ref_Age_Categories.age_category_description = 'Senior Citizen' ORDER BY Users.first_name
SELECT login_name FROM Users WHERE age_category_code = 'senior' ORDER BY first_name
SELECT COUNT(*) FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE is_buyer = '1')
SELECT COUNT(*) FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE is_buyer = '1')
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1'
SELECT a.line_1_number_building, a.line_2_number_street, a.town_city FROM Addresses a INNER JOIN Users u ON a.address_id = u.user_address_id WHERE u.age_category_code = 'Senior'
SELECT Addresses.line_1_number_building, Addresses.line_2_number_street, Addresses.town_city FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Ref_Age_Categories.age_category_description = 'Senior Citizen'
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2)
SELECT COUNT(property_id) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2)
SELECT property_id, COUNT(photo_seq) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT property_id, COUNT(photo_seq) AS num_photos FROM Property_Photos GROUP BY property_id
SELECT Users.user_id, COUNT(Property_Photos.photo_seq) AS num_photos FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Users.user_id
SELECT owner_user_id, COUNT(DISTINCT photo_seq) AS number_of_photos FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT SUM(price_max) FROM Properties JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN ('Single Mother', 'Student')
SELECT SUM(price_max) FROM Properties JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN ('Single Mother', 'Student')
SELECT datestamp, property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY datestamp;
SELECT datestamp, property_name FROM User_Property_History UPH JOIN Properties P ON UPH.property_id = P.property_id ORDER BY datestamp;
SELECT property_type_description, property_type_code FROM Ref_Property_Types JOIN Properties ON Ref_Property_Types.property_type_code = Properties.property_type_code GROUP BY Ref_Property_Types.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT RPT.property_type_description, COUNT(*) AS count FROM Properties P JOIN Ref_Property_Types RPT ON P.property_type_code = RPT.property_type_code GROUP BY RPT.property_type_description ORDER BY count DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) AS number_of_rooms FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) AS number_of_rooms FROM Rooms GROUP BY room_size
SELECT country FROM Addresses WHERE address_id = (SELECT user_address_id FROM Users WHERE first_name = 'Robbie')
SELECT a.country FROM Addresses a JOIN Users u ON a.address_id = u.user_address_id WHERE u.first_name = 'Robbie'
SELECT u.first_name, u.middle_name, u.last_name FROM Users u JOIN Properties p ON u.user_id = p.owner_user_id WHERE u.user_address_id = p.property_address_id
SELECT CONCAT(u.first_name, ' ', u.middle_name, ' ', u.last_name) AS full_name FROM Users u JOIN Properties p ON u.user_id = p.owner_user_id JOIN Addresses a ON u.user_address_id = a.address_id WHERE p.property_address_id = a.address_id
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT u.last_name, u.user_id FROM Users u JOIN Properties p ON u.user_id = p.owner_user_id LEFT JOIN User_Searches us ON u.user_id = us.user_id GROUP BY u.user_id, u.last_name HAVING COUNT(DISTINCT p.property_id) >= 2 AND COUNT(DISTINCT us.search_seq) <= 2
SELECT U.last_name, U.user_id FROM Users U JOIN User_Searches US ON U.user_id = US.user_id GROUP BY U.user_id HAVING COUNT(DISTINCT US.search_seq) <= 2 AND U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) >= 2)
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight) AS MaxWeight, MIN(weight) AS MinWeight FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC';
SELECT name, result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id GROUP BY bike.id, bike.product_name HAVING COUNT(DISTINCT cyclists_own_bikes.cyclist_id) >= 4
SELECT cyclist.id, cyclist.name FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id, cyclist.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT product_name FROM bike WHERE id IN (SELECT bike_id FROM cyclists_own_bikes WHERE cyclist_id IN (SELECT id FROM cyclist WHERE nation IN ('Russia', 'Great Britain')))
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(*) FROM cyclist WHERE id NOT IN (SELECT DISTINCT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.result < '4:21.558'
SELECT DISTINCT b.product_name, b.price FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY b.id HAVING COUNT(DISTINCT c.name) = 2
SELECT c.name, c.nation, c.result FROM cyclist c WHERE c.id NOT IN (SELECT cob.cyclist_id FROM cyclists_own_bikes cob)
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT c.id, COUNT(cb.bike_id) AS bike_count FROM cyclist c LEFT JOIN cyclists_own_bikes cb ON c.id = cb.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT Food, Flavor FROM goods WHERE Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake');
SELECT goods.Id, goods.Flavor FROM goods WHERE goods.Food = 'cake' ORDER BY goods.Price DESC LIMIT 1
SELECT Flavor, Food, Price FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
SELECT DISTINCT r.CustomerId FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT goods.Food, COUNT(DISTINCT receipts.CustomerId) AS num_customers FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY goods.Food
SELECT g.Food, COUNT(DISTINCT r.CustomerId) AS customer_count FROM goods AS g JOIN items AS i ON g.Id = i.Item JOIN receipts AS r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT DISTINCT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'bakery' GROUP BY r.CustomerId HAVING COUNT(r.ReceiptNumber) >= 15
SELECT customers.Id FROM customers JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id HAVING COUNT(receipts.ReceiptNumber) >= 15
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) > 10)
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10)
SELECT COUNT(*) FROM goods WHERE Food = 'Cake'
SELECT COUNT(*) FROM goods WHERE Food = 'cake'
SELECT G.Flavor FROM goods G WHERE G.Food = 'Croissant'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Croissant'
SELECT DISTINCT g.Food FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber WHERE r.CustomerId = 15
SELECT DISTINCT goods.Id, goods.Flavor, goods.Food FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT Food, AVG(Price) AS AvgPrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food
SELECT i.Receipt FROM items i WHERE i.Item IN (SELECT g.Id FROM goods g WHERE g.Food = 'Cake') AND i.Receipt IN (SELECT i2.Receipt FROM items i2 WHERE i2.Item IN (SELECT g2.Id FROM goods g2 WHERE g2.Food = 'Cookie'))
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('cake', 'cookie') GROUP BY r.ReceiptNumber HAVING COUNT(DISTINCT g.Food) = 2
SELECT receipts.ReceiptNumber FROM receipts JOIN customers ON receipts.CustomerId = customers.Id JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE customers.LastName = 'LOGAN' AND goods.Food = 'Croissant'
SELECT r.ReceiptNumber FROM receipts r JOIN customers c ON r.CustomerId = c.Id JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE c.LastName = 'Logan' AND g.Food = 'croissant'
SELECT receipts.ReceiptNumber, receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt WHERE items.Item = (SELECT Id FROM goods WHERE Price = (SELECT MAX(Price) FROM goods))
SELECT r.ReceiptNumber, r.Date FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
SELECT goods.Id, goods.Flavor, goods.Food FROM goods JOIN items ON goods.Id = items.Item GROUP BY goods.Id ORDER BY COUNT(*) ASC LIMIT 1
SELECT items.Item FROM items GROUP BY items.Item ORDER BY COUNT(*) ASC LIMIT 1
SELECT Food, COUNT(*) AS num_goods FROM goods GROUP BY Food
SELECT Food, COUNT(*) AS number_of_goods FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS Average_Price FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS Average_Price FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id, g.Price FROM goods g WHERE g.Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g1.Id FROM goods g1 WHERE g1.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart')
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT r.ReceiptNumber FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 15
SELECT r.Date FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id WHERE g.Price > 15
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Flavor, Price FROM goods WHERE Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName ASC;
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT Id FROM goods ORDER BY Id ASC;
SELECT DISTINCT Id FROM goods ORDER BY Id ASC;
SELECT ReceiptNumber FROM receipts WHERE CustomerId = 12 OR ReceiptNumber IN (SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE Flavor = 'apple' AND Food = 'pie')
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt LEFT JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie' OR r.CustomerId = 12
SELECT r.ReceiptNumber, r.Date FROM receipts r WHERE r.Date = (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR g.Price > 10
SELECT ReceiptNumber FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10)) OR Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE Food IN ('Cookie', 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE Food IN ('Cookies', 'Cakes') AND Price BETWEEN 3 AND 7
SELECT customers.FirstName, customers.LastName FROM customers JOIN receipts ON customers.Id = receipts.CustomerId WHERE receipts.Date = (SELECT MIN(Date) FROM receipts)
SELECT FirstName, LastName FROM customers WHERE Id = (SELECT CustomerId FROM receipts ORDER BY Date LIMIT 1)
SELECT AVG(g.Price) FROM goods g WHERE g.Flavor IN ('blackberry', 'blueberry')
SELECT AVG(g.Price) FROM goods g WHERE g.Flavor IN ('blackberry', 'blueberry')
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT Item FROM goods WHERE Flavor = 'cheese' ORDER BY Price LIMIT 1
SELECT Flavor, MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price) AS Max_Price, MIN(Price) AS Min_Price, AVG(Price) AS Avg_Price FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Food, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods WHERE Food IS NOT NULL GROUP BY Food ORDER BY Food ASC
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(*) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(*) DESC LIMIT 3
SELECT customers.FirstName, customers.LastName, COUNT(receipts.ReceiptNumber) AS shopping_count FROM customers JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id ORDER BY shopping_count DESC LIMIT 1
SELECT receipts.CustomerId, COUNT(receipts.ReceiptNumber) AS total_purchases FROM receipts GROUP BY receipts.CustomerId ORDER BY total_purchases DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) AS num_customers FROM receipts GROUP BY Date
SELECT Date, COUNT(DISTINCT CustomerId) AS customers_count FROM receipts GROUP BY Date
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tart'
SELECT C.FirstName || ' ' || C.LastName AS full_name FROM customers C JOIN receipts R ON C.Id = R.CustomerId JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Flavor = 'apple' AND G.Food = 'Tarts'
SELECT g.Id FROM goods g WHERE g.Food = 'Cookies' AND g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Croissant')
SELECT g.Id FROM goods g WHERE g.Food = 'cookies' AND g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
SELECT g.Id FROM goods g WHERE g.Food = 'Cake' AND g.Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT g.Id FROM goods g WHERE g.Food = 'Cake' AND g.Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id, Flavor, Food FROM goods ORDER BY Price ASC
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT goods.Id, goods.Flavor FROM goods WHERE goods.Food = 'Cake' ORDER BY goods.Flavor
SELECT g.Id, g.Flavor FROM goods g WHERE g.Food = 'cake' ORDER BY g.Flavor
SELECT G.Id FROM goods G WHERE G.Flavor = 'chocolate' AND (SELECT COUNT(*) FROM items I WHERE I.Item = G.Id) <= 10
SELECT g.Id FROM goods g JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(i.Receipt) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT customers.Id FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY customers.Id HAVING SUM(goods.Price) > 150
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY CustomerId HAVING AVG(g.Price) > 5
SELECT Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY Date HAVING SUM(Price) > 100
SELECT Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY Date HAVING SUM(Price) > 100
SELECT COUNT(*) FROM driver;
SELECT COUNT(*) FROM driver
SELECT make, COUNT(Driver_ID) FROM driver WHERE Points > 150 GROUP BY make
SELECT Make, COUNT(Driver_ID) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) AS average_age FROM driver GROUP BY Make
SELECT d.Make, AVG(d.Age) AS average_age FROM driver d GROUP BY d.Make
SELECT AVG(d.Laps) FROM driver d WHERE d.Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner ASC
SELECT manager, sponsor FROM team ORDER BY car_owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT team.Make FROM team WHERE team.Car_Owner = 'Buddy Arrington'
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS MaxPoints, MIN(Points) AS MinPoints FROM driver
SELECT MAX(Points) AS HighestPoints, MIN(Points) AS LowestPoints FROM driver
SELECT COUNT(*) FROM driver WHERE Points < 150
SELECT COUNT(*) FROM driver WHERE Points < 150;
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT driver.Driver, country.Country FROM driver JOIN country ON driver.Country = country.Country_Id
SELECT driver.Driver, country.Country FROM driver JOIN country ON driver.Country = country.Country_Id
SELECT MAX(d.Points) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT MAX(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT DISTINCT c.Country FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Points > 150
SELECT DISTINCT c.Country FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Points > 150
SELECT C.Capital FROM country C JOIN driver D ON C.Country_Id = D.Country WHERE D.Driver_ID = (SELECT Driver_ID FROM driver ORDER BY Points DESC LIMIT 1)
SELECT c.Capital FROM country AS c JOIN driver AS d ON c.Country_Id = d.Country WHERE d.Points = (SELECT MAX(Points) FROM driver)
SELECT d.Make, COUNT(td.Driver_ID) AS num_drivers FROM driver d JOIN team_driver td ON d.Driver_ID = td.Driver_ID GROUP BY d.Make
SELECT make, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Driver_ID) as count FROM driver GROUP BY Make))
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT t.Team FROM team t WHERE NOT EXISTS (SELECT 1 FROM team_driver td WHERE td.Team_ID = t.Team_ID)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT c.Country FROM country AS c JOIN driver AS d ON c.Country_Id = d.Country WHERE d.Make = 'Dodge' INTERSECT SELECT c.Country FROM country AS c JOIN driver AS d ON c.Country_Id = d.Country WHERE d.Make = 'Chevrolet'
SELECT DISTINCT c.Country FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Make = 'Dodge' AND EXISTS (SELECT 1 FROM driver d2 WHERE d2.Country = d.Country AND d2.Make = 'Chevrolet')
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT T.Manager, T.Sponsor FROM team T WHERE T.Team_ID = (SELECT TD.Team_ID FROM team_driver TD GROUP BY TD.Team_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT manager, sponsor FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Driver_ID) AS count FROM team_driver GROUP BY Team_ID)))
SELECT Manager, Car_Owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) >= 2)
SELECT t.Manager, t.Car_Owner FROM team t WHERE t.Team_ID IN (SELECT td.Team_ID FROM team_driver td GROUP BY td.Team_ID HAVING COUNT(td.Driver_ID) >= 2)
SELECT COUNT(*) FROM institution;
SELECT COUNT(*) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC;
SELECT Name FROM institution ORDER BY Founded ASC
SELECT city, province FROM institution;
SELECT City, Province FROM institution
SELECT MAX(Enrollment) AS MaxEnrollment, MIN(Enrollment) AS MinEnrollment FROM institution
SELECT MAX(enrollment) AS MaxEnrollment, MIN(enrollment) AS MinEnrollment FROM institution
SELECT affiliation FROM institution WHERE city != 'Vancouver'
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT i.Stadium FROM institution i ORDER BY i.Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT i.Stadium FROM institution i WHERE i.Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Name, Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID;
SELECT i.Name, c.Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT Institution_ID FROM institution ORDER BY Enrollment ASC LIMIT 1)
SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT Institution_ID FROM institution ORDER BY Enrollment ASC LIMIT 1)
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC;
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC
SELECT Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID GROUP BY Name HAVING COUNT(Championship.Institution_ID) >= 1
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship WHERE Number_of_Championships >= 1)
SELECT SUM(c.Number_of_Championships) FROM Championship AS c JOIN institution AS i ON c.Institution_ID = i.Institution_ID WHERE i.Affiliation = 'Public'
SELECT SUM(Championship.Number_of_Championships) FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID WHERE institution.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM institution GROUP BY Affiliation))
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT Founded, COUNT(Institution_ID) AS Number_of_Institutions FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT Nickname FROM Championship c JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC;
SELECT Nickname FROM Championship c JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT DISTINCT i1.Province FROM institution i1 JOIN institution i2 ON i1.Province = i2.Province WHERE i1.Founded < 1920 AND i2.Founded > 1950
SELECT province FROM institution WHERE Founded < 1920 INTERSECT SELECT province FROM institution WHERE Founded > 1950
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York';
SELECT DISTINCT Boxes.Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse
SELECT Warehouses.Location, AVG(Boxes.Value) AS avg_value FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Location
SELECT AVG(Value) AS Average_Value, SUM(Value) AS Total_Value FROM Boxes
SELECT AVG(Value) AS Average_Value, SUM(Value) AS Total_Value FROM Boxes
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses
SELECT Contents, AVG(Value) AS AverageValue, MAX(Value) AS MaximumValue FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes)
SELECT AVG(Value) FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes;
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses;
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') INTERSECT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT b.Contents FROM Boxes b WHERE NOT EXISTS (SELECT 1 FROM Warehouses w WHERE w.Code = b.Warehouse AND w.Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors'))
SELECT DISTINCT w.Location FROM Warehouses w JOIN Boxes b ON w.Code = b.Warehouse WHERE b.Contents IN ('Rocks', 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors'))
SELECT DISTINCT w.Location FROM Warehouses w JOIN Boxes b ON w.Code = b.Warehouse WHERE b.Contents IN ('Rocks', 'Scissors')
SELECT Code, Contents FROM Boxes ORDER BY Value ASC
SELECT Code, Contents FROM Boxes ORDER BY Value ASC
SELECT Code, Contents FROM Boxes ORDER BY Value ASC LIMIT 1
SELECT Code, Contents FROM Boxes ORDER BY Value ASC LIMIT 1
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC;
SELECT DISTINCT b1.Code FROM Boxes b1 WHERE b1.Value > (SELECT MAX(b2.Value) FROM Boxes b2 WHERE b2.Contents = 'Rocks')
SELECT B.Code FROM Boxes B WHERE B.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT b.Code, b.Contents FROM Boxes b WHERE b.Value > (SELECT MAX(b2.Value) FROM Boxes b2 WHERE b2.Contents = 'Scissors')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT SUM(Boxes.Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Code = (SELECT Code FROM Warehouses ORDER BY Capacity DESC LIMIT 1)
SELECT SUM(Boxes.Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT W.Code, AVG(B.Value) AS avg_value FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code HAVING AVG(B.Value) > 150
SELECT W.Location, AVG(B.Value) AS avg_value FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code GROUP BY W.Code HAVING AVG(B.Value) > 150
SELECT Contents, COUNT(Code) AS number_of_boxes, SUM(Value) AS total_value FROM Boxes GROUP BY Contents
SELECT Contents, COUNT(Code) AS number_of_boxes, SUM(Value) AS total_value FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) FROM Warehouses
SELECT SUM(Capacity) FROM Warehouses
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT W.Location, MAX(B.Value) AS HighestValue FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT Warehouse, COUNT(Code) AS number_of_boxes FROM Boxes GROUP BY Warehouse
SELECT W.Location, COUNT(B.Code) AS number_of_boxes FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code GROUP BY W.Code
SELECT COUNT(DISTINCT Warehouses.Location) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Boxes.Contents = 'Rocks'
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks'
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'Chicago'
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago'
SELECT Location, COUNT(*) AS box_count FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Location
SELECT Warehouses.Location, COUNT(Boxes.Code) AS box_count FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Location, COUNT(DISTINCT Boxes.Contents) AS number_of_contents_types FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT Warehouse, COUNT(DISTINCT Contents) FROM Boxes GROUP BY Warehouse
SELECT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code HAVING COUNT(B.Code) > W.Capacity
SELECT w.Code FROM Warehouses w WHERE (SELECT COUNT(*) FROM Boxes b WHERE b.Warehouse = w.Code) > w.Capacity
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location != 'Chicago'
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location != 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC;
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT MAX(Enrollment) AS MaximumEnrollment, AVG(Enrollment) AS AverageEnrollment, MIN(Enrollment) AS MinimumEnrollment FROM university
SELECT MAX(Enrollment) AS MaxEnrollment, AVG(Enrollment) AS AvgEnrollment, MIN(Enrollment) AS MinEnrollment FROM university;
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university;
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(*) AS NumberOfUniversities FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(University_ID) AS Universities_Attended FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY SUM(Enrollment) ASC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) T)
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code ASC
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code ASC
SELECT m.Major_Name, mr.Rank FROM major m JOIN major_ranking mr ON m.Major_ID = mr.Major_ID JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT mr.Rank, m.Major_Name FROM major_ranking mr INNER JOIN major m ON mr.Major_ID = m.Major_ID INNER JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT u.University_Name FROM university u WHERE NOT EXISTS (SELECT 1 FROM major_ranking mr WHERE mr.University_ID = u.University_ID AND mr.Rank = 1)
SELECT DISTINCT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name IN ('Accounting', 'Urban Education') GROUP BY u.University_ID HAVING COUNT(DISTINCT m.Major_Name) = 2
SELECT u.University_Name FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.University_ID = u.University_ID) AND EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Urban Education' AND mr.University_ID = u.University_ID)
SELECT University_Name, Rank FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE State = 'Wisconsin'
SELECT u.University_Name, or.Rank FROM university u JOIN overall_ranking or ON u.University_ID = or.University_ID WHERE u.State = 'Wisconsin'
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM overall_ranking WHERE Research_point = (SELECT MAX(Research_point) FROM overall_ranking))
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM overall_ranking ORDER BY Research_point DESC LIMIT 1)
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID WHERE r.Rank <= 5
SELECT SUM(Enrollment) FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank <= 5)
SELECT u.University_Name, o.Citation_point FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Reputation_point >= 3
SELECT University_Name, Citation_point FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(University_ID) > 2
SELECT Title FROM Movies WHERE Rating IS NULL OR Rating = ''
SELECT Title FROM Movies WHERE Rating IS NULL OR Rating = ''
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies m JOIN MovieTheaters mt ON m.Code = mt.Movie WHERE mt.Name = 'Odeon'
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon'
SELECT M.Title, MT.Name FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM Movies WHERE Rating = 'G';
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT COUNT(*) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
SELECT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT m.Title FROM Movies m JOIN MovieTheaters mt1 ON m.Code = mt1.Movie JOIN MovieTheaters mt2 ON m.Code = mt2.Movie WHERE mt1.Name = 'Odeon' AND mt2.Name = 'Imperial'
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial') GROUP BY M.Code HAVING COUNT(DISTINCT MT.Name) = 2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Rating
SELECT Title FROM Movies ORDER BY Rating
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(Movie) DESC LIMIT 1
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code GROUP BY MT.Name ORDER BY COUNT(M.Code) DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie GROUP BY M.Title ORDER BY COUNT(MT.Name) DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie GROUP BY M.Title ORDER BY COUNT(MT.Name) DESC LIMIT 1
SELECT Rating, COUNT(Code) AS num_movies FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) AS movie_count FROM Movies GROUP BY Rating
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating = 'G'
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
SELECT Title FROM Movies;
SELECT Title FROM Movies;
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating IS NULL
SELECT * FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Movie IS NOT NULL)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Recipient ORDER BY p.Weight DESC LIMIT 1
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Recipient ORDER BY p.Weight DESC LIMIT 1
SELECT SUM(p.Weight) FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name = 'Leo Wong'
SELECT SUM(p.Weight) FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong';
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position, Salary FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT AVG(Salary) FROM Employee WHERE Position = 'Intern'
SELECT Level FROM Has_Clearance WHERE Employee = (SELECT EmployeeID FROM Employee WHERE Position = 'Physician')
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'Physician'
SELECT PackageNumber FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT Package.PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT * FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT DISTINCT Package.PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package p JOIN Client s ON p.Sender = s.AccountNumber JOIN Client r ON p.Recipient = r.AccountNumber WHERE s.Name = 'Ogden Wernstrom' AND r.Name = 'Leo Wong';
SELECT COUNT(*) FROM Package JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT Package.Contents FROM Package INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb'
SELECT Package.Contents FROM Package INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb'
SELECT p.PackageNumber, p.Weight FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name LIKE '%John%' ORDER BY p.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE 'John%' ORDER BY Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT P.PackageNumber, P.Weight FROM Package P ORDER BY P.Weight ASC LIMIT 3
SELECT Client.Name, COUNT(*) AS NumberOfPackages FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber ORDER BY NumberOfPackages DESC LIMIT 1
SELECT Client.Name, COUNT(*) AS PackageCount FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber ORDER BY PackageCount DESC LIMIT 1
SELECT Client.Name, COUNT(Package.Recipient) AS NumberOfPackagesReceived FROM Client JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.AccountNumber ORDER BY COUNT(Package.Recipient) ASC LIMIT 1
SELECT Recipient, COUNT(*) AS total_packages_received FROM Package GROUP BY Recipient ORDER BY total_packages_received ASC LIMIT 1
SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber HAVING COUNT(Package.PackageNumber) > 1
SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber HAVING COUNT(Package.PackageNumber) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC;
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC;
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry'
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT Date FROM Shipment;
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' OR Employee.Name = 'Turanga Leela'
SELECT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS TotalShipments FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.Name
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS shipment_count FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.Name
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.PlanetID ORDER BY COUNT(*) DESC LIMIT 1
SELECT P.Name FROM Planet P WHERE P.PlanetID = (SELECT S.Planet FROM Shipment S GROUP BY S.Planet ORDER BY COUNT(*) DESC LIMIT 1)
SELECT e.Name, COUNT(s.ShipmentID) AS number_of_shipments FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.EmployeeID, e.Name
SELECT e.Name, COUNT(s.ShipmentID) AS number_of_shipments FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.EmployeeID, e.Name
SELECT SUM(p.Weight) FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID WHERE pl.Name = 'Mars'
SELECT SUM(p.Weight) FROM Package AS p JOIN Shipment AS s ON p.Shipment = s.ShipmentID JOIN Planet AS pl ON s.Planet = pl.PlanetID WHERE pl.Name = 'Mars'
SELECT Planet.Name, SUM(Package.Weight) AS Total_Weight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package PK ON S.ShipmentID = PK.Shipment GROUP BY P.PlanetID HAVING SUM(PK.Weight) > 30
SELECT Planet.Name FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID HAVING SUM(Package.Weight) > 30
SELECT PackageNumber FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' AND c.Name = 'Zapp Brannigan';
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Client ON Package.Sender = Client.AccountNumber JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT p.PackageNumber FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' OR c.Name = 'Zapp Brannigan';
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' OR Client.Name = 'Zapp Brannigan';
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omega III'))
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omega III'))
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet GROUP BY Planet.PlanetID, Planet.Name HAVING COUNT(DISTINCT Has_Clearance.Employee) = 1
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Has_Clearance GROUP BY Planet HAVING COUNT(DISTINCT Employee) = 1)
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT COUNT(*) FROM game;
SELECT COUNT(*) FROM game;
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo';
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3;
SELECT COUNT(*) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC;
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT p.Player_name, p.Rank_of_the_year FROM player p JOIN game_player gp ON p.Player_ID = gp.Player_ID JOIN game g ON gp.Game_ID = g.Game_ID WHERE g.Title = 'Super Mario World'
SELECT player.Player_name, player.Rank_of_the_year FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game_player.Game_ID = game.Game_ID WHERE game.Title = 'Super Mario World';
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn'
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn'
SELECT AVG(g.Units_sold_Millions) FROM game AS g JOIN game_player AS gp ON g.Game_ID = gp.Game_ID JOIN player AS p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT AVG(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID;
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT Title FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district IN ('Asia', 'USA')
SELECT DISTINCT game.Title FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district IN ('Asia', 'USA')
SELECT Franchise, COUNT(Game_ID) AS num_games FROM game GROUP BY Franchise
SELECT Franchise, COUNT(*) AS number_of_games FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM game GROUP BY Franchise) sub)
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT p.Player_name FROM player p LEFT JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Game_ID IS NULL
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College IN ('Oklahoma', 'Auburn') GROUP BY g.Game_ID HAVING COUNT(DISTINCT p.College) = 2
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College IN ('Oklahoma', 'Auburn')
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game;
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT DISTINCT press.Name FROM press WHERE Month_Profits_billion > 1 OR Year_Profits_billion > 15
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1;
SELECT AVG(Year_Profits_billion) AS AverageAnnualProfit, MAX(Year_Profits_billion) AS MaxAnnualProfit FROM press
SELECT Press_ID, AVG(Year_Profits_billion) AS AverageYearlyProfit, MAX(Year_Profits_billion) AS MaximumYearlyProfit FROM press GROUP BY Press_ID
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT p.Name FROM press p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR p.Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT COUNT(*) FROM author WHERE age < 30
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) AS average_age FROM author GROUP BY Gender
SELECT Gender, AVG(Age) AS average_age FROM author GROUP BY Gender
SELECT Gender, COUNT(Author_ID) AS num_authors FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(Author_ID) AS Number_of_Authors FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS number_of_books FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(Book_ID) AS books_count FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT DISTINCT b1.Book_Series FROM book b1 WHERE b1.Sale_Amount > 1000 AND EXISTS (SELECT 1 FROM book b2 WHERE b2.Book_Series = b1.Book_Series AND b2.Sale_Amount < 500)
SELECT DISTINCT b1.Book_Series FROM book b1 WHERE b1.Sale_Amount > 1000 AND EXISTS (SELECT 1 FROM book b2 WHERE b2.Book_Series = b1.Book_Series AND b2.Sale_Amount < 500)
SELECT DISTINCT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_Series = 'MM' AND a.Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT DISTINCT a.Name FROM author a JOIN book b1 ON a.Author_ID = b1.Author_ID JOIN book b2 ON a.Author_ID = b2.Author_ID WHERE b1.Book_Series = 'MM' AND b2.Book_Series = 'LT'
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book GROUP BY Author_ID HAVING COUNT(Book_ID) > 1)
SELECT book.Title, author.Name, press.Name FROM book JOIN author ON book.Author_ID = author.Author_ID JOIN press ON book.Press_ID = press.Press_ID ORDER BY book.Sale_Amount DESC LIMIT 3
SELECT book.Title, author.Name, press.Name FROM book JOIN author ON book.Author_ID = author.Author_ID JOIN press ON book.Press_ID = press.Press_ID ORDER BY book.Sale_Amount DESC LIMIT 3
SELECT p.Name, SUM(b.Sale_Amount) AS Total_Sales FROM press p JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Name
SELECT p.Name, SUM(b.Sale_Amount) AS total_sale_amount FROM press p JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Name
SELECT press.Name, COUNT(book.Book_ID) FROM press JOIN book ON press.Press_ID = book.Press_ID WHERE book.Sale_Amount > 1000 GROUP BY press.Name
SELECT p.Name, COUNT(b.Book_ID) FROM press p JOIN book b ON p.Press_ID = b.Press_ID WHERE b.Sale_Amount > 1000 GROUP BY p.Name
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book ORDER BY Sale_Amount DESC LIMIT 1)
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID ORDER BY b.Sale_Amount DESC LIMIT 1
SELECT author.Name, author.Gender FROM author JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID ORDER BY COUNT(book.Book_ID) DESC LIMIT 1
SELECT a.Name, a.Gender FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID ORDER BY COUNT(b.Book_ID) DESC LIMIT 1
SELECT A.name FROM author A WHERE A.Author_ID NOT IN (SELECT B.Author_ID FROM book B JOIN press P ON B.Press_ID = P.Press_ID WHERE P.Name = 'Accor')
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book JOIN press ON book.Press_ID = press.Press_ID WHERE press.Name = 'Accor')
SELECT press.Name, press.Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2
SELECT press.Name, press.Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2
SELECT COUNT(*) FROM Authors;
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors;
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT Authors.author_name FROM Documents JOIN Authors ON Documents.author_name = Authors.author_name WHERE Documents.document_name = 'Travel to Brazil'
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke';
SELECT document_name, document_description FROM Documents
SELECT Documents.document_id, Documents.document_name FROM Documents WHERE Documents.author_name = 'Bianka Cummings'
SELECT author_name, other_details FROM Authors WHERE author_name = (SELECT author_name FROM Documents WHERE document_name = 'Travel to China')
SELECT author_name, COUNT(document_id) AS number_of_documents FROM Documents GROUP BY author_name
SELECT author_name FROM Authors WHERE author_name = (SELECT author_name FROM Documents GROUP BY author_name ORDER BY COUNT(*) DESC LIMIT 1)
SELECT author_name FROM Authors WHERE author_name IN (SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(document_id) >= 2)
SELECT COUNT(*) FROM Business_Processes;
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9)
SELECT COUNT(*) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(DISTINCT process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status;
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(*) FROM Staff;
SELECT staff_id, staff_details FROM Staff;
SELECT staff_details FROM Staff WHERE staff_id = 100;
SELECT COUNT(DISTINCT staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles;
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT document_id) FROM Documents_Processes
SELECT process_id FROM Documents_Processes
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT process_id FROM Documents_Processes)
SELECT process_outcome_description, process_status_description FROM Process_Outcomes JOIN Documents_Processes ON Process_Outcomes.process_outcome_code = Documents_Processes.process_outcome_code JOIN Process_Status ON Documents_Processes.process_status_code = Process_Status.process_status_code WHERE document_id = 0
SELECT process_name FROM Business_Processes WHERE process_id IN (SELECT process_id FROM Documents WHERE document_name = 'Travel to Brazil')
SELECT process_id, COUNT(document_id) AS number_of_documents FROM Documents_Processes GROUP BY process_id
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9;
SELECT staff_id, COUNT(*) AS process_count FROM Staff_in_Processes GROUP BY staff_id
SELECT staff_role_code, COUNT(*) AS num_document_processes FROM Staff_in_Processes GROUP BY staff_role_code
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3;
SELECT COUNT(*) FROM Agencies;
SELECT COUNT(*) FROM Agencies;
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies;
SELECT COUNT(*) FROM Clients
SELECT COUNT(*) FROM Clients;
SELECT client_id, client_details FROM Clients
SELECT client_id, client_details FROM Clients;
SELECT Agencies.agency_id, COUNT(Clients.client_id) AS client_count FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT agency_id, COUNT(client_id) AS num_clients FROM Clients GROUP BY agency_id
SELECT agency_id, agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id ORDER BY COUNT(Clients.client_id) DESC LIMIT 1
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT agency_id, agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id, Agencies.agency_details HAVING COUNT(Clients.client_id) >= 2
SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id HAVING COUNT(Clients.client_id) >= 2
SELECT agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id WHERE client_details LIKE '%Mac%'
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT c.client_details, a.agency_details FROM Clients c JOIN Agencies a ON c.agency_id = a.agency_id
SELECT client_details, agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) AS num_clients FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad';
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id;
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT COUNT(*) FROM Invoices;
SELECT COUNT(*) FROM Invoices;
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT Clients.client_id, COUNT(Invoices.invoice_id) AS number_of_invoices FROM Clients LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT client_id, COUNT(invoice_id) AS invoice_count FROM Invoices GROUP BY client_id
SELECT client_id, client_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id ORDER BY COUNT(Invoices.invoice_id) DESC LIMIT 1
SELECT c.client_id, c.client_details FROM Clients c JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id ORDER BY COUNT(i.invoice_id) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT invoice_status, COUNT(invoice_id) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(invoice_id) AS num_invoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(invoice_id) = (SELECT MAX(count) FROM (SELECT COUNT(invoice_id) AS count FROM Invoices GROUP BY invoice_status))
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT i.invoice_status, i.invoice_details, c.client_id, c.client_details, a.agency_id, a.agency_details FROM Invoices i JOIN Clients c ON i.client_id = c.client_id JOIN Agencies a ON c.agency_id = a.agency_id
SELECT i.invoice_status, i.invoice_details, i.client_id, c.client_details, c.agency_id, a.agency_details FROM Invoices i JOIN Clients c ON i.client_id = c.client_id JOIN Agencies a ON c.agency_id = a.agency_id
SELECT meeting_type, other_details FROM Meetings;
SELECT meeting_type, other_details FROM Meetings;
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings;
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT Invoices.invoice_id, Invoices.invoice_status FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id WHERE Payments.invoice_id IS NULL
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT COUNT(*) FROM Payments;
SELECT COUNT(*) FROM Payments;
SELECT payment_id, invoice_id, payment_details FROM Payments;
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT invoice_id, invoice_status FROM Invoices
SELECT DISTINCT invoice_id, invoice_status FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id;
SELECT invoices.invoice_id, COUNT(payments.payment_id) AS number_of_payments FROM invoices LEFT JOIN payments ON invoices.invoice_id = payments.invoice_id GROUP BY invoices.invoice_id
SELECT invoice_id, COUNT(payment_id) AS number_of_payments FROM Payments GROUP BY invoice_id
SELECT invoice_id, invoice_status, invoice_details FROM Invoices i JOIN Payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id ORDER BY COUNT(p.payment_id) DESC LIMIT 1
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE invoice_id = (SELECT invoice_id FROM Payments GROUP BY invoice_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(*) FROM Staff;
SELECT COUNT(*) FROM Staff;
SELECT agency_id, COUNT(staff_id) AS num_staff FROM Staff GROUP BY agency_id
SELECT agency_id, COUNT(staff_id) AS number_of_staff FROM Staff GROUP BY agency_id
SELECT a.agency_id, a.agency_details FROM Agencies a JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id ORDER BY COUNT(s.staff_id) DESC LIMIT 1
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id ORDER BY COUNT(S.staff_id) DESC LIMIT 1
SELECT meeting_outcome, COUNT(meeting_id) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(meeting_id) AS num_meetings FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(meeting_id) AS number_of_meetings FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(meeting_id) AS meeting_count FROM Meetings GROUP BY client_id
SELECT meeting_type, client_id, COUNT(meeting_id) AS NumberOfMeetings FROM Meetings GROUP BY client_id, meeting_type
SELECT meeting_type, COUNT(meeting_id) AS number_of_meetings FROM Meetings GROUP BY meeting_type
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings AS m JOIN Clients AS c ON m.client_id = c.client_id
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings m JOIN Clients c ON m.client_id = c.client_id
SELECT m.meeting_id, COUNT(s.staff_id) AS staff_count FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT meeting_id, COUNT(staff_id) AS num_staff FROM Staff_in_Meetings GROUP BY meeting_id
SELECT S.staff_id, COUNT(*) AS meetings_attended FROM Staff_in_Meetings S GROUP BY S.staff_id HAVING COUNT(*) = ( SELECT MIN(meeting_count) FROM ( SELECT staff_id, COUNT(*) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id ) AS SubQuery )
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) = (SELECT MIN(MeetingCount) FROM (SELECT COUNT(meeting_id) AS MeetingCount FROM Staff_in_Meetings GROUP BY staff_id) AS Temp) AND COUNT(meeting_id) > 0
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT DISTINCT c.client_id, c.client_details FROM Clients c LEFT JOIN Meetings m ON c.client_id = m.client_id LEFT JOIN Invoices i ON c.client_id = i.client_id WHERE m.client_id IS NOT NULL OR i.client_id IS NOT NULL
SELECT DISTINCT c.client_id, c.client_details FROM Clients c LEFT JOIN Meetings m ON c.client_id = m.client_id LEFT JOIN Invoices i ON c.client_id = i.client_id WHERE m.client_id IS NOT NULL OR i.client_id IS NOT NULL
SELECT s.staff_id, s.staff_details FROM Staff s JOIN Staff_in_Meetings sm ON s.staff_id = sm.staff_id WHERE s.staff_details LIKE '%s%' GROUP BY s.staff_id HAVING COUNT(sm.meeting_id) >= 1
SELECT s.staff_id, s.staff_details FROM Staff s INNER JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id WHERE s.staff_details LIKE '%s%' GROUP BY s.staff_id, s.staff_details HAVING COUNT(sim.meeting_id) >= 1
SELECT c.client_id, c.sic_code, c.agency_id FROM Clients c JOIN Meetings m ON c.client_id = m.client_id JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(DISTINCT m.meeting_id) = 1
SELECT Clients.client_id, Clients.sic_code, Clients.agency_id FROM Clients JOIN Meetings ON Clients.client_id = Meetings.client_id JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id HAVING COUNT(DISTINCT Meetings.meeting_id) = 1
SELECT start_date_time, end_date_time, Clients.client_details, Staff.staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
SELECT start_date_time, end_date_time, client_details, staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
