SELECT count(*) FROM club
SELECT count(*) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1;
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT C.Name FROM club C JOIN player P ON C.Club_ID = P.Club_ID WHERE P.Wins_count > 2 GROUP BY C.Name
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT club.Name, AVG(player.Earnings) AS average_earnings FROM club JOIN player ON club.Club_ID = player.Club_ID GROUP BY club.Club_ID ORDER BY average_earnings DESC
SELECT C.Name FROM club C JOIN player P ON C.Club_ID = P.Club_ID GROUP BY C.Name ORDER BY AVG(P.Earnings) DESC
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT manufacturer FROM club GROUP BY manufacturer HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM club GROUP BY manufacturer))
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id, C.customer_first_name, C.customer_last_name HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(OI.order_item_id) >= 3
SELECT DISTINCT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND SUM(1) >= 3;
SELECT O.order_id, O.order_status_code, COUNT(*) AS product_count FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code;
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS number_of_products FROM Orders AS o JOIN Order_Items AS oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT DISTINCT O.date_order_placed FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING MIN(O.date_order_placed) OR COUNT(OI.order_item_id) > 1;
SELECT (SELECT MIN(date_order_placed) AS earliest_order_date FROM Orders) UNION (SELECT O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(*) > 1)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN ( SELECT product_id, COUNT(*) AS order_count FROM Order_Items GROUP BY product_id ) AS oi ON p.product_id = oi.product_id WHERE IFNULL(oi.order_count, 0) < 2
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_id) < 2
SELECT O.order_id, O.date_order_placed FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING count(OI.product_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING count(*) >= 2
SELECT product_id, product_name, product_price FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(*) DESC
SELECT t1.order_id, SUM(t2.product_price) AS total_price FROM Orders AS t1 JOIN Order_Items AS t3 ON t1.order_id = t3.order_id JOIN Products AS t2 ON t3.product_id = t2.product_id GROUP BY t1.order_id ORDER BY total_price ASC LIMIT 1
SELECT order_id, SUM(product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY total_cost ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.gender_code, COUNT(DISTINCT OI.product_id) AS number_of_products FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id GROUP BY C.gender_code
SELECT gender_code, COUNT(DISTINCT product_id) AS products_bought FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY gender_code
SELECT gender_code, COUNT(*) AS total_orders FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT gender_code, COUNT(*) AS total_orders FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT P.product_name, S.shipment_date FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipments AS S ON OI.order_id = S.order_id
SELECT product_name, shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id ORDER BY shipment_date
SELECT order_item_status_code, shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT order_item_status_code, shipment_tracking_number FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT P.product_name, P.product_color FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Shipments AS S ON OI.order_id = S.order_id
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'Female'
SELECT P.product_name, P.product_price, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id JOIN Orders AS O ON OI.order_id = O.order_id JOIN Customers AS C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT i.invoice_status_code FROM Invoices i WHERE NOT EXISTS (SELECT 1 FROM Shipments s WHERE s.invoice_number = i.invoice_number)
SELECT Orders.order_id, Orders.date_order_placed, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) AS total_amount_paid FROM Orders AS O JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT count(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT count(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT count(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT count(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT C.customer_first_name, P.product_name FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id
SELECT C.customer_first_name, P.product_name FROM Customers AS C JOIN Orders AS O ON C.customer_id = O.customer_id JOIN Order_Items AS OI ON O.order_id = OI.order_id JOIN Products AS P ON OI.product_id = P.product_id
SELECT COUNT(*) FROM Shipment_Items;
SELECT count(DISTINCT `product_id`) FROM `Order_Items` JOIN `Shipment_Items` ON `Order_Items`.`order_item_id` = `Shipment_Items`.`order_item_id`
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(p.product_price) FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id
SELECT AVG(product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Orders JOIN Customers ON Orders.customer_id = Customers.customer_id GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT o.date_order_placed FROM Orders AS o JOIN Customers AS c ON o.customer_id = c.customer_id WHERE c.customer_id IN ( SELECT cp.customer_id FROM Customer_Payment_Methods AS cp GROUP BY cp.customer_id HAVING COUNT(cp.payment_method_code) >= 2 )
SELECT o.date_order_placed FROM Orders o WHERE o.customer_id IN (SELECT cp.customer_id FROM Customer_Payment_Methods cp GROUP BY cp.customer_id HAVING COUNT(*) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MIN(Cnt) FROM (SELECT COUNT(order_status_code) AS Cnt FROM Orders GROUP BY order_status_code) Temp);
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_item_id) > 3)
SELECT P.product_id, P.product_description FROM Products AS P JOIN Order_Items AS OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(*) > 3
SELECT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(*) >= 2
SELECT I.invoice_number, I.invoice_date FROM Invoices AS I JOIN Shipments AS S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(*) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products);
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT count(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT T1.Name, T1.Age FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY count(*) DESC LIMIT 1
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT T2.Name, T2.Internet FROM program AS T1 JOIN channel AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(*) > 1
SELECT c.Name, COUNT(p.Program_ID) AS program_count FROM channel c LEFT JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT count(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT Name FROM director WHERE Director_ID IN (SELECT Director_ID FROM program WHERE Title = 'Dracula')
SELECT T2.Name, T2.Internet FROM channel AS T2 JOIN director_admin AS T1 ON T2.Channel_ID = T1.Channel_ID GROUP BY T2.Channel_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin WHERE Director_ID IN (SELECT Director_ID FROM director WHERE Age < 40)) INTERSECT SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin WHERE Director_ID IN (SELECT Director_ID FROM director WHERE Age > 60))
SELECT channel.Channel_ID, channel.Name FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID LEFT JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name != 'Hank Baskett' OR director.Name IS NULL
SELECT count(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT avg(ERP_kW) FROM radio
SELECT Affiliation, COUNT(*) FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT R.Transmitter, C.City FROM radio AS R JOIN city_channel_radio AS CCR ON R.Radio_ID = CCR.Radio_ID JOIN city_channel AS C ON CCR.City_channel_ID = C.ID
SELECT R.Transmitter, C.Station_name FROM radio AS R JOIN city_channel_radio AS CCR ON R.Radio_ID = CCR.Radio_ID JOIN city_channel AS C ON CCR.City_channel_ID = C.ID ORDER BY R.ERP_kW DESC
SELECT Transmitter, COUNT(DISTINCT City_channel_ID) FROM radio JOIN city_channel_radio ON radio.Radio_ID = city_channel_radio.Radio_ID GROUP BY Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT MAX(count(*)), driver_id FROM vehicle_driver GROUP BY driver_id ORDER BY count(*) DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID ORDER BY Vehicle_Count DESC LIMIT 1
SELECT max(Power), avg(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT max(Power), avg(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY count(*) LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996;
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT count(DISTINCT T2.Driver_ID) FROM vehicle AS T1 JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Build_Year = 2012
SELECT count(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID WHERE driver.Racing_Series = 'NASCAR'
SELECT count(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT avg(Top_Speed) FROM vehicle
SELECT avg(Top_Speed) FROM vehicle
SELECT DISTINCT T2.Name FROM driver AS T2 JOIN vehicle_driver AS T3 ON T2.Driver_ID = T3.Driver_ID JOIN vehicle AS T1 ON T3.Vehicle_ID = T1.Vehicle_ID WHERE T1.Power > 5000
SELECT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Power > 5000))
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T1.Builder = 'Ziyang' OR T1.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2)
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT Vehicle_ID, Model FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID GROUP BY vehicle_driver.Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN (SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2) OR v.Vehicle_ID IN (SELECT vd.Vehicle_ID FROM vehicle_driver vd JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon')
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' OR (SELECT COUNT(*) FROM vehicle_driver WHERE Vehicle_ID = v.Vehicle_ID) > 2 GROUP BY v.Vehicle_ID, v.Model
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT count(*) , Racing_Series FROM driver GROUP BY Racing_Series
SELECT d.Name, d.Citizenship FROM driver d WHERE d.Driver_ID IN (SELECT vd.Driver_ID FROM vehicle_driver vd WHERE vd.Vehicle_ID IN (SELECT v.Vehicle_ID FROM vehicle v WHERE v.Model = 'DJ1'))
SELECT T2.Name, T2.Citizenship FROM vehicle_driver AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T1.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT count(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT count(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT count(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name, T3.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T3 ON T1.Student_ID = T3.Student_ID
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM Student_Assessments GROUP BY Assessment))
SELECT First_Name FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID GROUP BY Students.Student_ID HAVING COUNT(*) >= 2
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_Answer_ID) >= 2)
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text HAVING COUNT(Valid_Answer_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Valid_Answer_ID) AS Cnt FROM Valid_Answers GROUP BY Valid_Answer_Text) Temp);
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU;
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent')
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT count(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT count(*) FROM Products
SELECT count(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products;
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT min(product_price), avg(product_price), max(product_price) FROM Products
SELECT min(product_price), avg(product_price), max(product_price) FROM Products
SELECT avg(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT count(*) FROM Products WHERE product_type_code = 'hardware'
SELECT count(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT avg(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC;
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code;
SELECT product_type_code, COUNT(*) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code;
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(product_id) AS cnt FROM Products GROUP BY product_type_code))
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(*) FROM Customers
SELECT count(*) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers;
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(DISTINCT customer_id) AS CustomerCount FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(*) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY count(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MIN(count) FROM (SELECT COUNT(product_id) AS count FROM Products GROUP BY product_type_code) AS counts)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) as cnt FROM Products GROUP BY product_type_code))
SELECT count(*) FROM Customer_Orders
SELECT count(*) FROM Customer_Orders
SELECT T1.order_id, T1.order_date, T1.order_status_code FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_name = 'Jeromy'
SELECT T1.order_id, T1.order_date, T1.order_status_code FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_name = 'Jeromy'
SELECT T1.customer_name, T1.customer_id, COUNT(*) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id
SELECT Customers.customer_name, Customers.customer_id, COUNT(Customer_Orders.order_id) AS num_orders FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id, Customers.customer_name
SELECT customer_id, customer_name, customer_phone, customer_email FROM Customers WHERE customer_id = (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.customer_id, T2.customer_name, T2.customer_phone, T2.customer_email FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, count(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Customer_Orders GROUP BY order_status_code) Temp);
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT count(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_name = 'Monitor'
SELECT SUM(Order_Items.order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT Customer_Orders.customer_id) FROM Customer_Orders JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT count(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT customer_id FROM Customers EXCEPT SELECT customer_id FROM Customer_Orders
SELECT CO.order_date, CO.order_id FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id GROUP BY CO.order_id HAVING MAX(OI.order_quantity) > 6 OR COUNT(OI.product_id) > 3
SELECT DISTINCT CO.order_id, CO.order_date FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id GROUP BY CO.order_id HAVING SUM(OI.order_quantity) > 6 OR COUNT(OI.product_id) > 3
SELECT count(*) FROM building
SELECT count(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT avg(Population) FROM region
SELECT avg(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT T1.Name, T2.Name FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT b.Name, r.Name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT Name FROM region JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID HAVING COUNT(*) > 1
SELECT R.Name FROM region AS R JOIN building AS B ON R.Region_ID = B.Region_ID GROUP BY R.Region_ID HAVING COUNT(*) > 1
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Capital FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Address, T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT b.Address, r.Name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT Completed_Year, COUNT(*) AS Number_of_Buildings FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT count(*) FROM Services
SELECT count(*) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(Analytical_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Analytical_ID) AS Cnt FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) Temp);
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Services.Service_ID HAVING COUNT(Customers_and_Services.Customer_ID) > 3
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Services.Service_ID HAVING COUNT(Customers_and_Services.Customer_ID) > 3
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT DISTINCT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT count(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT count(*) FROM Customers_and_Services
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Details = 'Hardy Kutch' OR Status_Code = 'good'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch' UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID WHERE Customer_Details = 'Hardy Kutch' AND Status_Code = 'bad'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')) AND Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'bad')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT Service_Details FROM Services AS S JOIN Customer_Interactions AS CI ON S.Service_ID = CI.Service_ID JOIN Channels AS C ON CI.Channel_ID = C.Channel_ID WHERE C.Channel_Details = '15 ij'
SELECT * FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Service_ID IN (SELECT Service_ID FROM Services WHERE Service_Details = 'bad') AND Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = 'bad'))
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT count(*) FROM Integration_Platform JOIN Customer_Interactions ON Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID WHERE Status_Code = 'Successful'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT C.Customer_Details FROM Customers C JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details LIKE '%failed%'
SELECT C.Customer_Details FROM Customers C JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details = 'Fail'
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customers_and_Services_Details = 'unsatisfied')
SELECT Service_Details FROM Services JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Customers_and_Services_Details = 'unsatisfied'
SELECT count(*) FROM Vehicles
SELECT count(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014 OR Model_year = 2013
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013 INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014
SELECT Type_of_powertrain, count(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, count(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM Vehicles GROUP BY Type_of_powertrain))
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT Type_of_powertrain, COUNT(*) AS cnt FROM Vehicles GROUP BY Type_of_powertrain) AS Temp)
SELECT min(Annual_fuel_cost), max(Annual_fuel_cost), avg(Annual_fuel_cost) FROM Vehicles
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING count(*) >= 2
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers;
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM Customers WHERE membership_credit > (SELECT avg(membership_credit) FROM Customers)
SELECT avg(age) FROM Customers WHERE membership_credit > (SELECT avg(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT Vehicles.name, SUM(Renting_history.total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name
SELECT SUM(Renting_history.total_hours), Vehicles.name FROM Renting_history JOIN Vehicles ON Renting_history.vehicles_id = Vehicles.id GROUP BY Vehicles.name
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT C.name FROM Customers AS C JOIN Renting_history AS R ON C.id = R.customer_id GROUP BY C.name HAVING COUNT(*) >= 2
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2)
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id HAVING COUNT(Renting_history.id) = (SELECT MAX(count) FROM (SELECT COUNT(id) AS count FROM Renting_history GROUP BY vehicles_id))
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, SUM(Renting_history.total_hours) AS total_renting_hours FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY total_renting_hours DESC
SELECT V.name FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id GROUP BY V.name ORDER BY SUM(R.total_hours) DESC
SELECT D.name FROM Discount D JOIN Renting_history RH ON D.id = RH.discount_id GROUP BY D.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Discount WHERE id = (SELECT discount_id FROM Renting_history GROUP BY discount_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.total_hours > 30
SELECT V.name, V.Type_of_powertrain FROM Vehicles AS V JOIN Renting_history AS R ON V.id = R.vehicles_id GROUP BY V.id HAVING SUM(R.total_hours) > 30;
SELECT avg(City_fuel_economy_rate) , avg(Highway_fuel_economy_rate) , Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain
SELECT avg(City_fuel_economy_rate), avg(Highway_fuel_economy_rate), Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT avg(amount_of_loan) FROM Student_Loans
SELECT DISTINCT s.student_id, s.bio_data FROM Students s JOIN Classes c ON s.student_id = c.student_id LEFT JOIN ( SELECT student_id, COUNT(*) AS detention_count FROM Detention GROUP BY student_id ) d ON s.student_id = d.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT c.class_id) >= 2 AND COALESCE(d.detention_count, 0) < 2
SELECT s.student_id, s.bio_data FROM Students s WHERE (SELECT COUNT(*) FROM Classes WHERE student_id = s.student_id) >= 2 OR (SELECT COUNT(*) FROM Detention WHERE student_id = s.student_id) < 2
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT DISTINCT T.teacher_details FROM Teachers AS T JOIN Classes AS C ON T.teacher_id = C.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl WHERE sl.student_id IN (SELECT a.student_id FROM Achievements a GROUP BY a.student_id HAVING COUNT(*) >= 2)
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL WHERE SL.student_id IN (SELECT A.student_id FROM Achievements A GROUP BY A.student_id HAVING COUNT(A.achievement_id) >= 2)
SELECT teacher_details, teacher_id FROM Teachers WHERE teacher_id = (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT teacher_details, teacher_id FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT T1.bio_data, T1.student_details, T4.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Addresses AS T3 ON T2.address_id = T3.address_id JOIN Ref_Address_Types AS T4 ON T2.address_type_code = T4.address_type_code
SELECT S.bio_data, S.student_details, RAT.address_type_description FROM Students AS S JOIN Students_Addresses AS SA ON S.student_id = SA.student_id JOIN Ref_Address_Types AS RAT ON SA.address_type_code = RAT.address_type_code
SELECT T2.address_details, T1.bio_data FROM Students AS T1 JOIN Students_Addresses AS T3 ON T1.student_id = T3.student_id JOIN Addresses AS T2 ON T3.address_id = T2.address_id
SELECT T1.bio_data, T2.address_details FROM Students AS T1 JOIN Students_Addresses AS T3 ON T1.student_id = T3.student_id JOIN Addresses AS T2 ON T3.address_id = T2.address_id
SELECT bio_data, date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT bio_data, date_of_transcript FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT count(*), behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count(*) DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY student_id HAVING COUNT(behaviour_monitoring_id) = 3)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) as counts) OR COUNT(*) = 3)
SELECT S1.bio_data FROM Students S1 JOIN Behaviour_Monitoring BM ON S1.student_id = BM.student_id GROUP BY S1.student_id, BM.behaviour_monitoring_details HAVING COUNT(BM.behaviour_monitoring_details) = ( SELECT COUNT(*) AS max_count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY max_count DESC LIMIT 1 ) AND COUNT(DISTINCT BM.behaviour_monitoring_details) = 1
SELECT T1.bio_data FROM Students AS T1 JOIN Behaviour_Monitoring AS T2 ON T1.student_id = T2.student_id GROUP BY T2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.bio_data, T3.event_date FROM Students AS T1 JOIN Student_Events AS T3 ON T1.student_id = T3.student_id
SELECT T1.bio_data, T3.event_date FROM Students AS T1 JOIN Student_Events AS T3 ON T1.student_id = T3.student_id
SELECT COUNT(T1.student_id) AS number_of_students, T1.event_type_code, T2.event_type_description FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code GROUP BY T1.event_type_code, T2.event_type_description ORDER BY COUNT(T1.student_id) DESC LIMIT 1;
SELECT Ref_Event_Types.event_type_code, Ref_Event_Types.event_type_description, COUNT(DISTINCT Student_Events.student_id) AS num_students FROM Student_Events JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY Student_Events.event_type_code ORDER BY num_students DESC LIMIT 1
SELECT achievement_details, achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT achievement_details, achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT count(DISTINCT T.teacher_id) FROM Teachers AS T JOIN Classes AS C ON T.teacher_id = C.teacher_id LEFT JOIN Achievements AS A ON C.student_id = A.student_id WHERE A.achievement_id IS NULL
SELECT count(DISTINCT T.teacher_id) FROM Teachers AS T JOIN Classes AS C ON T.teacher_id = C.teacher_id LEFT JOIN Achievements AS A ON C.student_id = A.student_id WHERE A.achievement_id IS NULL
SELECT date_of_transcript , transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements;
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.teacher_details, T3.student_details FROM Classes AS T2 JOIN Teachers AS T1 ON T2.teacher_id = T1.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id
SELECT T1.teacher_details, T3.student_details FROM Classes AS T2 JOIN Teachers AS T1 ON T2.teacher_id = T1.teacher_id JOIN Students AS T3 ON T2.student_id = T3.student_id
SELECT teacher_id, COUNT(*) AS courses_taught FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT teacher_id, COUNT(*) AS number_of_courses FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1;
SELECT student_id, COUNT(*) AS course_count FROM Classes GROUP BY student_id ORDER BY course_count DESC LIMIT 1
SELECT student_id, COUNT(*) AS number_of_courses FROM Classes GROUP BY student_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT s.student_id, s.student_details FROM Students s JOIN Classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.student_details HAVING COUNT(DISTINCT c.class_id) = 2
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2)
SELECT D1.detention_type_code, D2.detention_type_description FROM Detention AS D1 JOIN Ref_Detention_Type AS D2 ON D1.detention_type_code = D2.detention_type_code GROUP BY D1.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT detention_type_code, detention_type_description FROM Detention JOIN Ref_Detention_Type ON Detention.detention_type_code = Ref_Detention_Type.detention_type_code GROUP BY Detention.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT bio_data, other_details FROM Students JOIN Student_Loans ON Students.student_id = Student_Loans.student_id WHERE amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT s.bio_data FROM Students s INNER JOIN Student_Loans sl ON s.student_id = sl.student_id ORDER BY sl.amount_of_loan ASC LIMIT 1
SELECT bio_data FROM Students WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)
SELECT t.date_of_transcript FROM Transcripts t JOIN Student_Loans sl ON t.student_id = sl.student_id WHERE sl.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans)
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans GROUP BY student_id ORDER BY SUM(amount_of_loan) DESC LIMIT 1)
SELECT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id WHERE c.student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1)
SELECT t.teacher_id, t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Transcripts tr ON c.student_id = tr.student_id WHERE tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id
SELECT student_id, SUM(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT S.student_id, S.bio_data, COUNT(*) AS course_count FROM Students AS S JOIN Classes AS C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) AS courses_count FROM Students LEFT JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id, Students.bio_data
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT address_type_code, address_type_description FROM Ref_Address_Types JOIN Students_Addresses ON Ref_Address_Types.address_type_code = Students_Addresses.address_type_code GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT address_type_code, address_type_description FROM Students_Addresses JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code GROUP BY address_type_code ORDER BY count(*) DESC LIMIT 1
SELECT S.bio_data FROM Students S WHERE S.student_id IN (SELECT SE.student_id FROM Student_Events SE) AND S.student_id NOT IN (SELECT SL.student_id FROM Student_Loans SL)
SELECT S.bio_data FROM Students S WHERE S.student_id IN (SELECT SE.student_id FROM Student_Events SE) AND S.student_id NOT IN (SELECT SL.student_id FROM Student_Loans SL)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa WHERE sa.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(*) = 2)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa JOIN Students s ON sa.student_id = s.student_id WHERE s.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(t.transcript_id) = 2)
SELECT datetime_detention_start FROM Detention ORDER BY datetime_detention_start
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author;
SELECT Name FROM Author;
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book
SELECT Title, ISBN, SalePrice FROM Book;
SELECT count(*) FROM Book
SELECT count(*) FROM Book
SELECT count(*) FROM Author
SELECT count(*) FROM Author
SELECT count(*) FROM Client
SELECT count(*) FROM Client
SELECT Name, Address FROM Client ORDER BY Name
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT B.Title, A.Name FROM Book AS B JOIN Author_Book AS AB ON B.ISBN = AB.ISBN JOIN Author AS A ON AB.Author = A.idAuthor
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Orders.IdOrder, Client.Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient
SELECT IdOrder, Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient;
SELECT Author.Name, COUNT(Author_Book.ISBN) AS NumberOfBooks FROM Author LEFT JOIN Author_Book ON Author.idAuthor = Author_Book.Author GROUP BY Author.idAuthor, Author.Name
SELECT Author.Name, COUNT(*) FROM Author JOIN Author_Book ON Author.idAuthor = Author_Book.Author GROUP BY Author.idAuthor
SELECT b.ISBN, COUNT(o.IdOrder) AS order_count FROM Book b LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN LEFT JOIN Orders o ON bo.IdOrder = o.IdOrder GROUP BY b.ISBN
SELECT ISBN, COUNT(*) FROM Books_Order GROUP BY ISBN
SELECT ISBN, SUM(amount) FROM Books_Order GROUP BY ISBN
SELECT ISBN, sum(amount) FROM Books_Order GROUP BY ISBN
SELECT T1.Title FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN ORDER BY COUNT(*) DESC LIMIT 1
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT B.Title, B.PurchasePrice FROM Book AS B JOIN Books_Order AS BO ON B.ISBN = BO.ISBN GROUP BY BO.ISBN ORDER BY SUM(BO.amount) DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order)
SELECT DISTINCT B.Title FROM Book AS B JOIN Books_Order AS BO ON B.ISBN = BO.ISBN
SELECT DISTINCT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient
SELECT DISTINCT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient
SELECT Client.Name, COUNT(Orders.IdOrder) AS NumberOfOrders FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient;
SELECT C.Name, COUNT(O.IdOrder) FROM Client C JOIN Orders O ON C.IdClient = O.IdClient GROUP BY C.IdClient
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Client.Name, SUM(Books_Order.amount) FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.IdClient
SELECT C.Name, SUM(B.amount) FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order B ON O.IdOrder = B.IdOrder GROUP BY C.Name
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder GROUP BY T1.IdClient ORDER BY SUM(T3.amount) DESC LIMIT 1
SELECT Name FROM Client WHERE IdClient = (SELECT IdOrder FROM Books_Order GROUP BY IdOrder ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book
SELECT max(SalePrice), min(SalePrice) FROM Book
SELECT avg(PurchasePrice) AS avg_purchase_price, avg(SalePrice) AS avg_sale_price FROM Book
SELECT avg(PurchasePrice) AS avg_purchase_price, avg(SalePrice) AS avg_sale_price FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT avg(SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell'
SELECT avg(SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell'
SELECT SalePrice FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato'
SELECT B.SalePrice FROM Book AS B JOIN Author_Book AS AB ON B.ISBN = AB.ISBN JOIN Author AS A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice LIMIT 1
SELECT B.Title FROM Book B JOIN Author A ON B.Author = A.idAuthor JOIN Author_Book AB ON B.ISBN = AB.ISBN WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice LIMIT 1
SELECT B.Title FROM Book AS B JOIN Author_Book AS AB ON B.ISBN = AB.ISBN JOIN Author AS A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Name FROM Author WHERE idAuthor IN (SELECT Author FROM Book WHERE Title = 'Pride and Prejudice')
SELECT Name FROM Author WHERE idAuthor IN (SELECT Author FROM Book WHERE Title = 'Pride and Prejudice')
SELECT Title FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%'
SELECT B.Title FROM Book AS B JOIN Author_Book AS AB ON B.ISBN = AB.ISBN JOIN Author AS A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT count(*) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT count(*) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice';
SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')) INTERSECT SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'The Little Prince'))
SELECT IdOrder FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice' OR Title = 'The Little Prince') GROUP BY IdOrder HAVING COUNT(DISTINCT ISBN) = 2
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name IN ('Peter Doe', 'James Smith')) GROUP BY ISBN HAVING COUNT(DISTINCT IdClient) = 2)
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe')) INTERSECT SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith'))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT count(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Type, max(Chapters), min(Chapters) FROM book GROUP BY Type
SELECT Title FROM book WHERE Type != 'Poet'
SELECT avg(Rating) FROM review
SELECT Title, Rating FROM book JOIN review ON book.Book_ID = review.Book_ID
SELECT Rating FROM review WHERE Book_ID = (SELECT Book_ID FROM book ORDER BY Chapters DESC LIMIT 1)
SELECT Rank FROM book JOIN review ON book.Book_ID = review.Book_ID ORDER BY Pages ASC LIMIT 1
SELECT Title FROM book WHERE Book_ID IN (SELECT Book_ID FROM review WHERE Rank = (SELECT MIN(Rank) FROM review))
SELECT avg(Readers_in_Million) FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE Type = 'Novel'
SELECT Type, COUNT(*) FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type HAVING COUNT(Type) = (SELECT MAX(CountType) FROM (SELECT COUNT(Type) AS CountType FROM book GROUP BY Type) Temp)
SELECT Type FROM book GROUP BY Type HAVING COUNT(*) >= 3
SELECT Title FROM book JOIN review ON book.Book_ID = review.Book_ID ORDER BY Rating ASC
SELECT Title, Audio FROM book JOIN review ON book.Book_ID = review.Book_ID ORDER BY Readers_in_Million DESC
SELECT count(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT Type FROM book WHERE Chapters > 75 INTERSECT SELECT Type FROM book WHERE Chapters < 50
SELECT count(DISTINCT Type) FROM book
SELECT type, title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC, Name ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality, Card_Credit FROM customer
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT avg(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT c.Card_Credit FROM customer c WHERE c.Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer)
SELECT Nationality, COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(*) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit < 50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit > 75
SELECT Nationality FROM customer WHERE Card_Credit > 50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit < 75
SELECT T2.Name, T3.Dish_Name FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN customer_order AS T3 ON T1.Customer_ID = T3.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer_order co JOIN customer c ON co.Customer_ID = c.Customer_ID
SELECT Name, Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID ORDER BY Quantity DESC
SELECT C.Name, CO.Dish_Name FROM customer_order AS CO JOIN customer AS C ON CO.Customer_ID = C.Customer_ID ORDER BY CO.Quantity DESC
SELECT customer.Name, SUM(customer_order.Quantity) FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID
SELECT customer.Name, SUM(customer_order.Quantity) FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name
SELECT Customer_ID FROM customer_order GROUP BY Customer_ID HAVING SUM(Quantity) > 1
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Customer_ID HAVING SUM(T2.Quantity) > 1;
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT Name FROM customer c LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE co.Customer_ID IS NULL
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT count(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE Nationality != 'England'
SELECT Name FROM member WHERE Age = 19 OR Age = 20
SELECT name FROM member WHERE age = (SELECT MAX(age) FROM member)
SELECT Nationality, COUNT(*) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT T1.Name, T2.Club_Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID JOIN club AS T3 ON T2.Club_ID = T3.Club_ID
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID JOIN club AS T3 ON T2.Club_ID = T3.Club_ID WHERE T3.Overall_Ranking > 100
SELECT Name FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader WHERE Year_Join < 2018)
SELECT Name FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader WHERE Club_ID IN (SELECT Club_ID FROM club WHERE Club_Name = 'Houston'))
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member WHERE Age > 22 INTERSECT SELECT Nationality FROM member WHERE Age < 19
SELECT avg(m.Age) FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets;
SELECT Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects;
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin' AND Parent_Document_Object_ID IS NOT NULL;
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT DO.Parent_Document_Object_ID, DO2.Owner FROM Document_Objects DO JOIN Document_Objects DO2 ON DO.Parent_Document_Object_ID = DO2.Document_Object_ID WHERE DO.Owner = 'Marlin'
SELECT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT count(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL;
SELECT Parent_Document_Object_ID AS Document_ID, COUNT(*) AS Number_of_Child_Documents FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS child_documents_count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections;
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Name FROM Collections WHERE Collection_ID = (SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name = 'Nice')
SELECT parent.Collection_Name FROM Collections AS parent INNER JOIN Collections AS child ON parent.Collection_ID = child.Parent_Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING count(*) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Related_Document_Object_ID FROM Document_Subset_Members JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Owner = 'Ransom'
SELECT Related_Document_Object_ID FROM Document_Objects AS DO JOIN Document_Subset_Members AS DSM ON DO.Document_Object_ID = DSM.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(*) FROM Collection_Subset_Members JOIN Collection_Subsets ON Collection_Subset_Members.Collection_Subset_ID = Collection_Subsets.Collection_Subset_ID GROUP BY Collection_Subset_ID
SELECT Collection_Subset_ID, Collection_Subset_Name, COUNT(*) FROM Collection_Subset_Members JOIN Collection_Subsets ON Collection_Subset_Members.Collection_Subset_ID = Collection_Subsets.Collection_Subset_ID GROUP BY Collection_Subset_ID
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS number_of_related_documents FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY number_of_related_documents ASC LIMIT 1
SELECT Document_Object_ID FROM Document_Objects d LEFT JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Document_Object_ID) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS NumberOfRelatedDocuments FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT DISTINCT d2.Owner FROM Document_Objects d1 JOIN Document_Subset_Members dsm ON d1.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Objects d2 ON dsm.Related_Document_Object_ID = d2.Document_Object_ID WHERE d1.Owner = 'Braeden'
SELECT DISTINCT T2.Owner FROM Document_Objects AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID = T2.Parent_Document_Object_ID WHERE T1.Owner = 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Owner = 'Braeden'
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID GROUP BY Document_Subset_ID, Document_Subset_Name
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID GROUP BY Document_Subset_ID
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS number_of_documents FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subset_ID ORDER BY number_of_documents DESC LIMIT 1
SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')
SELECT Document_Object_ID, Document_Subset_Name FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID
SELECT Document_Object_ID, Document_Subset_Name FROM Document_Objects DO JOIN Document_Subset_Members DSM ON DO.Document_Object_ID = DSM.Document_Object_ID JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID
SELECT C.Collection_Name FROM Collections C JOIN Documents_in_Collections DC ON C.Collection_ID = DC.Collection_ID JOIN Document_Objects DO ON DC.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT Collection_Name FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT count(*) FROM Documents_in_Collections AS DC JOIN Collections AS C ON DC.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT COUNT(*) FROM Documents_in_Collections AS doc JOIN Collections AS col ON doc.Collection_ID = col.Collection_ID WHERE col.Collection_Name = 'Best'
SELECT Document_Objects.Document_Object_ID FROM Document_Objects JOIN Documents_in_Collections ON Document_Objects.Document_Object_ID = Documents_in_Collections.Document_Object_ID JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best';
SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(*) AS NumberOfDocuments FROM Collections AS C JOIN Documents_in_Collections AS DC ON C.Collection_ID = DC.Collection_ID GROUP BY C.Collection_ID ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Collection_Name, Collection_ID, COUNT(Document_Object_ID) AS NumberOfDocuments FROM Collections JOIN Documents_in_Collections ON Collections.Collection_ID = Documents_in_Collections.Collection_ID WHERE Collection_Name = 'Best' GROUP BY Collections.Collection_ID ORDER BY COUNT(Document_Object_ID) DESC LIMIT 1;
SELECT D.Document_Object_ID FROM Documents_in_Collections AS DC JOIN Document_Objects AS D ON DC.Document_Object_ID = D.Document_Object_ID JOIN Collections AS C ON DC.Collection_ID = C.Collection_ID JOIN Document_Subset_Members AS DSM ON D.Document_Object_ID = DSM.Document_Object_ID JOIN Document_Subsets AS DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' AND C.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) INTERSECT SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID JOIN Document_Subset_Members ON Documents_in_Collections.Document_Object_ID = Document_Subset_Members.Document_Object_ID JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000' OR Collections.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') UNION SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T3 ON T1.Collection_ID = T3.Collection_ID JOIN Collections AS T2 ON T3.Related_Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best'
SELECT C.Collection_Name FROM Collections C INNER JOIN Collection_Subset_Members CSM ON C.Collection_ID = CSM.Related_Collection_ID INNER JOIN Collections CB ON CSM.Collection_ID = CB.Collection_ID WHERE CB.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collections AS C JOIN Collection_Subset_Members AS CSM ON C.Collection_ID = CSM.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT count(DISTINCT Related_Collection_ID) FROM Collections AS C JOIN Collection_Subset_Members AS CSM ON C.Collection_ID = CSM.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT CS.Collection_Subset_Name FROM Collection_Subsets CS JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID JOIN Collections C ON CSM.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subsets AS CS JOIN Collection_Subset_Members AS CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID JOIN Collections AS C ON CSM.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT Name FROM songs ORDER BY Name ASC
SELECT name , language FROM songs
SELECT max(voice_sound_quality), min(voice_sound_quality) FROM performance_score
SELECT T3.voice_sound_quality, T3.rhythm_tempo, T3.stage_presence FROM participants AS T1 JOIN performance_score AS T3 ON T1.id = T3.participant_id WHERE T1.name = 'Freeway';
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT T3.stage_presence FROM songs AS T1 JOIN performance_score AS T3 ON T1.id = T3.songs_id WHERE T1.language = 'English'
SELECT participants.id, participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id GROUP BY participants.id HAVING COUNT(performance_score.songs_id) >= 2
SELECT T1.id, T1.name, T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id GROUP BY T1.id ORDER BY COUNT(*) DESC
SELECT id, name FROM participants WHERE id IN (SELECT participant_id FROM performance_score WHERE voice_sound_quality = 5 OR rhythm_tempo = 5)
SELECT T1.voice_sound_quality FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T2.name = 'The Balkan Girls' AND T2.language = 'English'
SELECT songs.id, songs.name FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY songs.id, songs.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT count(*) FROM songs WHERE id NOT IN ( SELECT songs_id FROM performance_score )
SELECT avg(p.rhythm_tempo) AS average_rhythm, s.language FROM performance_score p JOIN songs s ON p.songs_id = s.id GROUP BY s.language
SELECT DISTINCT participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English'
SELECT name, popularity FROM participants WHERE id IN (SELECT participant_id FROM songs JOIN performance_score ON songs.id = performance_score.songs_id WHERE language = 'Croatian' INTERSECT SELECT participant_id FROM songs JOIN performance_score ON songs.id = performance_score.songs_id WHERE language = 'English')
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT original_artist FROM songs JOIN performance_score ON songs.id = performance_score.songs_id WHERE rhythm_tempo > 5 ORDER BY voice_sound_quality DESC
SELECT count(*) FROM City
SELECT count(*) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT count(DISTINCT country) FROM City
SELECT count(DISTINCT country) FROM City
SELECT city_name, city_code, state, country FROM City
SELECT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT city_name FROM City WHERE state = 'PA'
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT count(*) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT state, count(*) FROM City GROUP BY state
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT country, COUNT(*) FROM City GROUP BY country
SELECT count(*) , country FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM City GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY country))
SELECT country FROM City GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY country))
SELECT Fname, Lname FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT Fname || ' ' || LName AS full_name FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(*) FROM Student AS S JOIN City AS C ON S.city_code = C.city_code WHERE C.country = 'China'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country, COUNT(*) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT country, COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT city_code, COUNT(*) FROM Student GROUP BY city_code
SELECT city_code, COUNT(*) AS student_count FROM Student GROUP BY city_code
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT T3.state FROM Student AS T1 JOIN City AS T3 ON T1.city_code = T3.city_code GROUP BY T3.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY country HAVING COUNT(s.StuID) = (SELECT MIN(student_count) FROM (SELECT COUNT(StuID) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country))
SELECT T3.country FROM Student AS T1 JOIN City AS T3 ON T1.city_code = T3.city_code GROUP BY T3.country ORDER BY COUNT(*) ASC LIMIT 1
SELECT C.city_name FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.city_name HAVING COUNT(*) >= 3
SELECT City.city_name FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.city_code HAVING COUNT(*) >= 3
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING count(*) > 5
SELECT C.state FROM Student AS S JOIN City AS C ON S.city_code = C.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA';
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND Country != 'USA'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'EWR') OR (city1_code = 'EWR' AND city2_code = 'BOS')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'EWR') OR (city1_code = 'EWR' AND city2_code = 'BOS')
SELECT avg(distance), min(distance), max(distance) FROM Direct_distance
SELECT avg(distance), min(distance), max(distance) FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance) UNION SELECT city2_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000
SELECT city1_code FROM Direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT sum(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT sum(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT avg(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance LIMIT 1
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT C.city_name, AVG(D.distance) FROM City AS C JOIN Direct_distance AS D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT City.city_name, AVG(Direct_distance.distance) FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code GROUP BY City.city_name
SELECT dd.distance FROM Student s1 JOIN City c1 ON s1.city_code = c1.city_code JOIN Student s2 ON s1.city_code != s2.city_code JOIN City c2 ON s2.city_code = c2.city_code JOIN Direct_distance dd ON (c1.city_code = dd.city1_code AND c2.city_code = dd.city2_code) OR (c1.city_code = dd.city2_code AND c2.city_code = dd.city1_code) WHERE s1.Fname = 'Linda' AND s1.Lname = 'Smith' AND s2.Fname = 'Tracy' AND s2.Lname = 'Kim'
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE LName = 'Smith' AND Fname = 'Linda') AND city2_code = (SELECT city_code FROM Student WHERE LName = 'Kim' AND Fname = 'Tracy') OR city1_code = (SELECT city_code FROM Student WHERE LName = 'Kim' AND Fname = 'Tracy') AND city2_code = (SELECT city_code FROM Student WHERE LName = 'Smith' AND Fname = 'Linda')
SELECT S1.Fname, S1.LName FROM Student AS S1 JOIN City AS C1 ON S1.city_code = C1.city_code JOIN Direct_distance AS D ON C1.city_code = D.city1_code OR C1.city_code = D.city2_code JOIN Student AS S2 ON S2.city_code = D.city2_code OR S2.city_code = D.city1_code JOIN City AS C2 ON S2.city_code = C2.city_code WHERE S2.Fname = 'Linda' AND S2.LName = 'Smith' ORDER BY D.distance DESC LIMIT 1
SELECT S1.Fname || ' ' || S1.LName AS FullName FROM Student AS S1, Student AS S2, Direct_distance AS D WHERE S2.Fname = 'Linda' AND S2.LName = 'Smith' AND ((S1.city_code = D.city1_code AND S2.city_code = D.city2_code) OR (S1.city_code = D.city2_code AND S2.city_code = D.city1_code)) ORDER BY D.distance DESC LIMIT 1;
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code WHERE S.Fname = 'Linda'
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT Boats.bid, Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1;
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102)
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102)
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age > (SELECT MAX(age) FROM Sailors WHERE rating > 7)
SELECT DISTINCT T1.name FROM Sailors AS T1, Sailors AS T2 WHERE T1.age > T2.age AND T2.rating > 7
SELECT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid
SELECT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid GROUP BY Sailors.sid
SELECT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid GROUP BY T1.sid HAVING COUNT(DISTINCT T2.bid) > 1
SELECT S.name FROM Sailors AS S JOIN Reserves AS R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue'
SELECT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red') INTERSECT SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'blue')
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red' OR color = 'blue'))
SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red') INTERSECT SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'blue'))
SELECT DISTINCT s.sid, s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue') GROUP BY s.sid HAVING COUNT(DISTINCT b.color) = 2
SELECT sid FROM Sailors EXCEPT SELECT sid FROM Reserves
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid, name FROM Sailors EXCEPT SELECT sid, name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103;
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103)
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT DISTINCT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Sailors.rating > 2
SELECT DISTINCT Sailors.name, Sailors.sid FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Sailors.rating >= 3
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT count(*) FROM Sailors;
SELECT count(*) FROM Sailors
SELECT avg(age) FROM Sailors WHERE rating = 7
SELECT avg(age) FROM Sailors WHERE rating = 7
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT avg(rating), max(age) FROM Sailors
SELECT avg(rating), max(age) FROM Sailors
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid
SELECT count(*) , Boats.name FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.bid > 50 GROUP BY Boats.name
SELECT count(*) , bid FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT count(*) , bid FROM Reserves GROUP BY bid HAVING count(*) > 1
SELECT Boats.bid, Boats.name, COUNT(*) AS reservation_count FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Boats.bid HAVING COUNT(*) > 1;
SELECT count(*) , B.name FROM Reserves AS R JOIN Boats AS B ON R.bid = B.bid WHERE R.sid > 1 GROUP BY B.name
SELECT count(*), b.name FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid > 1 GROUP BY b.name
SELECT rating, avg(age) FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red') GROUP BY rating
SELECT S.rating, AVG(S.age) FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats WHERE color = 'red'
SELECT count(*) FROM Boats WHERE color = 'red'
SELECT Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age BETWEEN 20 AND 30
SELECT name FROM Boats WHERE bid IN (SELECT bid FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE age BETWEEN 20 AND 30))
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red')
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red')))
SELECT MAX(rating) FROM Sailors
SELECT max(rating) FROM Sailors
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.name = 'Melon'
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE name = 'Melon'))
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Model
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT Class, COUNT(*) AS cnt FROM headphone GROUP BY Class) AS Counts)
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) > 2
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) <= 2
SELECT class, count(*) FROM headphone WHERE Price > 200 GROUP BY class;
SELECT Class, count(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT count(DISTINCT Earpads) FROM headphone
SELECT count(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT Earpads, COUNT(*) FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2;
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Model, Class, Construction FROM headphone ORDER BY Price LIMIT 1
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT Construction, AVG(Price) AS AveragePrice FROM headphone GROUP BY Construction
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT DISTINCT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Model FROM headphone WHERE Price < (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(DISTINCT Neighborhood) FROM store
SELECT count(*) , Neighborhood FROM store GROUP BY Neighborhood
SELECT count(*) , Neighborhood FROM store GROUP BY Neighborhood
SELECT store.Name, SUM(stock.Quantity) AS TotalHeadphones FROM store JOIN stock ON store.Store_ID = stock.Store_ID GROUP BY store.Store_ID ORDER BY SUM(stock.Quantity) DESC LIMIT 1
SELECT S.Name, SUM(S.Quantity) FROM store AS T1 JOIN stock AS S ON T1.Store_ID = S.Store_ID GROUP BY T1.Store_ID
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID HAVING SUM(Quantity) = (SELECT MAX(total) FROM (SELECT SUM(Quantity) AS total FROM stock GROUP BY Headphone_ID)))
SELECT Model FROM headphone WHERE Headphone_ID = (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT SUM(T3.Quantity) FROM store AS T1 JOIN stock AS T3 ON T1.Store_ID = T3.Store_ID WHERE T1.Name = 'Woodman'
SELECT sum(T3.Quantity) FROM store AS T1 JOIN stock AS T3 ON T1.Store_ID = T3.Store_ID WHERE T1.Name = 'Woodman'
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT DISTINCT Store_ID FROM stock WHERE Quantity > 0)
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT count(*) FROM Author
SELECT count(DISTINCT author_id) FROM Author
SELECT count(*) FROM Paper
SELECT count(*) FROM Paper
SELECT count(*) FROM Affiliation
SELECT count(*) FROM Affiliation
SELECT count(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT count(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT count(*) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Paper.year = 2009 AND Affiliation.name = 'Columbia University'
SELECT COUNT(*) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')) AND year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University'
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University'
SELECT P.paper_id, P.title FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown'
SELECT P.title, P.paper_id FROM Paper AS P JOIN Author_list AS A ON P.paper_id = A.paper_id JOIN Author AS AU ON A.author_id = AU.author_id WHERE AU.name = 'Mckeown'
SELECT DISTINCT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name IN ('Stanford University', 'Columbia University') GROUP BY p.paper_id HAVING COUNT(DISTINCT a.name) = 2
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name IN ('Stanford', 'Columbia University') GROUP BY p.paper_id, p.title HAVING COUNT(DISTINCT a.name) = 2
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list AS AL1 ON Paper.paper_id = AL1.paper_id JOIN Author AS A1 ON AL1.author_id = A1.author_id JOIN Author_list AS AL2 ON Paper.paper_id = AL2.paper_id JOIN Author AS A2 ON AL2.author_id = A2.author_id WHERE A1.name = 'Mckeown, Kathleen' AND A2.name = 'Rambow, Owen'
SELECT P.paper_id, P.title FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY P.paper_id, P.title HAVING COUNT(DISTINCT A.name) = 2
SELECT p.paper_id, p.title FROM Paper p WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' AND al.paper_id = p.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Rambow' AND al.paper_id = p.paper_id)
SELECT Paper.paper_id, Paper.title FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown' AND Paper.paper_id NOT IN ( SELECT Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Rambow' )
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Author.name, COUNT(Author_list.paper_id) AS num_papers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id ORDER BY num_papers DESC
SELECT Author.name, COUNT(*) AS NumberOfPapers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id ORDER BY COUNT(*) DESC
SELECT A.affiliation_id, A.name, COUNT(DISTINCT AL.paper_id) AS number_of_papers FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.affiliation_id, A.name ORDER BY number_of_papers ASC
SELECT A.name FROM Affiliation AS A JOIN Author_list AS AL ON A.affiliation_id = AL.affiliation_id JOIN Paper AS P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id ORDER BY COUNT(P.paper_id) DESC
SELECT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id GROUP BY a.author_id, a.name HAVING COUNT(al.paper_id) > 50
SELECT Author.name FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY Author.author_id HAVING COUNT(*) > 50;
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(DISTINCT AL.paper_id) = 1
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(*) = 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY count(*) ASC LIMIT 1
SELECT count(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT count(*) FROM Citation WHERE cited_paper_id = 'A00-1002';
SELECT count(*) FROM Citation WHERE paper_id = 'D12-1027'
SELECT count(*) FROM Citation WHERE paper_id = 'D12-1027'
SELECT paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY cited_paper_id ORDER BY citation_count DESC LIMIT 1
SELECT paper_id, COUNT(cited_paper_id) AS num_citations FROM Citation GROUP BY paper_id ORDER BY num_citations DESC LIMIT 1
SELECT title FROM Paper WHERE paper_id = (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1)
SELECT title FROM Paper WHERE paper_id = (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1)
SELECT P1.paper_id, P1.title, COUNT(*) AS citation_count FROM Paper AS P1 JOIN Citation AS C ON P1.paper_id = C.cited_paper_id GROUP BY P1.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT T1.paper_id, T2.title, COUNT(*) AS citation_count FROM Citation AS T1 JOIN Paper AS T2 ON T1.cited_paper_id = T2.paper_id GROUP BY T1.cited_paper_id ORDER BY citation_count DESC LIMIT 10;
SELECT COUNT(*) FROM Citation WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id IN (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen'))
SELECT COUNT(*) FROM Citation WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen'))
SELECT COUNT(*) FROM Citation AS C JOIN Author_list AS A ON C.paper_id = A.paper_id JOIN Author AS AU ON A.author_id = AU.author_id WHERE AU.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation AS C JOIN Author_list AS A ON C.paper_id = A.paper_id JOIN Author AS AU ON A.author_id = AU.author_id WHERE AU.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(*) AS citation_count FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT A.name, COUNT(*) AS citation_count FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id JOIN Citation AS C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1;
SELECT DISTINCT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT DISTINCT P.venue, P.year FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT author_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Author_list.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id JOIN Paper AS P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT A.name FROM Affiliation AS A JOIN Author_list AS AL ON A.affiliation_id = AL.affiliation_id JOIN Paper AS P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 3
SELECT affiliation_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY affiliation_id ORDER BY COUNT(*) DESC LIMIT 3
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University' AND p.year <= 2009
SELECT COUNT(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University' AND p.year <= 2009
SELECT count(*) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT COUNT(paper_id) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University')) AND year BETWEEN 2000 AND 2009
SELECT p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id GROUP BY p.paper_id ORDER BY COUNT(al.author_id) DESC LIMIT 1
SELECT T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.paper_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(DISTINCT al.author_id) FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.paper_id IN (SELECT p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen') AND al.author_id NOT IN (SELECT a.author_id FROM Author a WHERE a.name = 'Mckeown, Kathleen')
SELECT count(DISTINCT al2.author_id) FROM Author_list al1 JOIN Author a1 ON al1.author_id = a1.author_id JOIN Author_list al2 ON al1.paper_id = al2.paper_id WHERE a1.name = 'Mckeown, Kathleen' AND al2.author_id != al1.author_id
SELECT T2.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.name = 'Mckeown, Kathleen' GROUP BY T2.name ORDER BY count(*) DESC LIMIT 1
SELECT name FROM Author WHERE author_id IN (SELECT a2.author_id FROM Author_list a1 JOIN Author_list a2 ON a1.paper_id = a2.paper_id AND a1.author_id != a2.author_id WHERE a1.author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen') GROUP BY a2.author_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT name FROM Affiliation WHERE address LIKE '%China%' ORDER BY (SELECT COUNT(*) FROM Author_list WHERE Author_list.affiliation_id = Affiliation.affiliation_id) DESC LIMIT 1
SELECT name FROM Affiliation WHERE affiliation_id IN (SELECT affiliation_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper)) AND address LIKE '%China%' GROUP BY affiliation_id ORDER BY COUNT(paper_id) DESC LIMIT 1
SELECT year, venue, count(*) FROM Paper WHERE venue LIKE '%conference%' GROUP BY year, venue
SELECT venue, year, COUNT(*) FROM Paper GROUP BY venue, year
SELECT affiliation_id, COUNT(*) FROM Author_list GROUP BY affiliation_id
SELECT T2.name, COUNT(*) FROM Author_list AS T1 JOIN Affiliation AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.affiliation_id
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(paper_id) > 50)
SELECT P.title FROM Paper P WHERE (SELECT COUNT(*) FROM Citation C WHERE C.paper_id = P.paper_id) > 50
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50))
SELECT count(DISTINCT A.author_id) FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING count(cited_paper_id) > 50) C ON AL.paper_id = C.paper_id WHERE C.paper_id IS NULL
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue IN ('NAACL', 'ACL') AND year = 2009))
SELECT DISTINCT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue IN ('NAACL', 'ACL') AND p.year = 2009 GROUP BY a.author_id HAVING COUNT(DISTINCT p.venue) = 2
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT count(*) FROM conference
SELECT count(*) FROM conference
SELECT DISTINCT "Conference_Name" FROM "conference"
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name , Year , Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name , COUNT(*) FROM conference AS C JOIN conference_participation AS CP ON C.Conference_ID = CP.Conference_ID GROUP BY C.Conference_Name
SELECT Conference_Name, COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year HAVING COUNT(Conference_ID) = (SELECT MIN(conference_count) FROM (SELECT COUNT(Conference_ID) AS conference_count FROM conference GROUP BY Year))
SELECT Year FROM conference GROUP BY Year ORDER BY count(*) LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(*) >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(*) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution;
SELECT count(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT count(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT Institution_Name, COUNT(*) FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE Founded > 1800 GROUP BY institution.Institution_ID
SELECT institution.Institution_ID, institution.Institution_Name, COUNT(staff.staff_ID) FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE institution.Founded > 1800 GROUP BY institution.Institution_ID, institution.Institution_Name
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE Age > (SELECT avg(Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT avg(Age) FROM staff)
SELECT max(Age), min(Age) FROM staff WHERE Nationality = 'United States'
SELECT max(Age), min(Age) FROM staff
SELECT DISTINCT Conference_Name FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID JOIN staff ON conference_participation.staff_ID = staff.staff_ID WHERE staff.Nationality = 'Canada'
SELECT DISTINCT conference.Conference_Name FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID JOIN staff ON conference_participation.staff_ID = staff.staff_ID WHERE staff.Nationality = 'Canada'
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') INTERSECT SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker' INTERSECT SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) INTERSECT SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'Naccl'))
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL') INTERSECT SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL'))
SELECT DISTINCT staff.name FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year = 2003 OR conference.Year = 2004
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year IN (2003, 2004)
SELECT Conference_Name, Year, COUNT(staff_ID) FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY Conference_Name, Year
SELECT conference.Conference_ID, conference.Conference_Name, conference.Year, COUNT(conference_participation.staff_ID) AS Number_of_Participants FROM conference LEFT JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY conference.Conference_ID, conference.Conference_Name, conference.Year
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2;
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY count(*) DESC LIMIT 2
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)))
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year = 2004)))
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT count(DISTINCT location) FROM Hangar
SELECT count(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT count(*) FROM PilotSkills WHERE age > 40
SELECT count(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT count(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY count(*) ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT count(DISTINCT plane_name) FROM PilotSkills
SELECT count(*) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT count(*) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT count(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT count(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT avg(age), min(age) FROM PilotSkills
SELECT avg(age), min(age) FROM PilotSkills
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT avg(age), plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name, avg(age) FROM PilotSkills GROUP BY plane_name
SELECT plane_type, count(*) FROM Planes GROUP BY plane_type
SELECT plane_name, count(*) FROM PilotSkills GROUP BY plane_name
SELECT ps.plane_name, ps.pilot_name FROM PilotSkills ps WHERE (ps.plane_name, ps.age) IN (SELECT plane_name, MAX(age) FROM PilotSkills GROUP BY plane_name) ORDER BY ps.plane_name
SELECT H.plane_name, PS.pilot_name FROM Hangar H INNER JOIN PilotSkills PS ON H.plane_name = PS.plane_name WHERE PS.age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT PS.plane_name, MAX(PS.age) AS oldest_age, PS.pilot_name FROM PilotSkills PS JOIN ( SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name ) AS MaxAges ON PS.plane_name = MaxAges.plane_name AND PS.age = MaxAges.max_age GROUP BY PS.plane_name;
SELECT plane_name, pilot_name FROM PilotSkills WHERE (plane_name, age) IN (SELECT plane_name, MAX(age) FROM PilotSkills GROUP BY plane_name)
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT COUNT(*) AS number_of_pilots, AVG(age) AS average_age, h.location FROM PilotSkills ps JOIN Hangar h ON ps.plane_name = h.plane_name GROUP BY h.location
SELECT Hangar.location, COUNT(DISTINCT PilotSkills.pilot_name) AS number_of_pilots, AVG(PilotSkills.age) AS average_age FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY Hangar.location
SELECT plane_name, COUNT(pilot_name) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT H.plane_name, COUNT(PS.pilot_name) AS NumberOfPilots FROM Hangar H JOIN PilotSkills PS ON H.plane_name = PS.plane_name GROUP BY H.plane_name HAVING AVG(PS.age) < 35
SELECT t2.location FROM PilotSkills AS t1 JOIN Hangar AS t2 ON t1.plane_name = t2.plane_name ORDER BY t1.age LIMIT 1
SELECT location FROM Hangar AS H JOIN PilotSkills AS P ON H.plane_name = P.plane_name ORDER BY P.age LIMIT 1
SELECT pilot_name, age FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin')
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT DISTINCT p1.pilot_name FROM PilotSkills p1 WHERE p1.age > (SELECT MIN(p2.age) FROM PilotSkills p2 WHERE p2.plane_name = 'Piper Cub') ORDER BY p1.pilot_name
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT count(*) FROM PilotSkills WHERE age > (SELECT min(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT count(*) FROM PilotSkills WHERE age > (SELECT min(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district ORDER BY Area_km DESC LIMIT 1
SELECT Area_km, Government_website FROM district ORDER BY Population ASC LIMIT 1
SELECT Name, Population FROM district WHERE Area_km > (SELECT avg(Area_km) FROM district)
SELECT max(Area_km), avg(Area_km) FROM district
SELECT SUM(Population) FROM district ORDER BY Area_km DESC LIMIT 3
SELECT District_ID, Name, Government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE '%.gov'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT avg(Points), avg(Age) FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT Name FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman)
SELECT Name FROM district WHERE District_ID = (SELECT District_ID FROM spokesman_district GROUP BY District_ID ORDER BY COUNT(Spokesman_ID) DESC LIMIT 1)
SELECT Name FROM spokesman WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman_district WHERE Start_year < 2004)
SELECT d.Name, COUNT(sd.Spokesman_ID) AS num_spokesmen FROM district d LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID, d.Name
SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman WHERE Rank_position = 1)) INTERSECT SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman WHERE Rank_position = 2))
SELECT Name FROM district AS d JOIN spokesman_district AS sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID HAVING COUNT(*) > 1
SELECT count(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT SUM(Population) AS total_population, AVG(Population) AS average_population FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title , location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures;
SELECT title, location FROM Sculptures
SELECT medium FROM Paintings WHERE paintingID = 80;
SELECT medium FROM Paintings WHERE paintingID = 80;
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year > 1920
SELECT DISTINCT A.birthYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT A.fname, A.lname FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname || ' ' || lname AS full_name FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT (MIN(deathYear - birthYear)) FROM Artists
SELECT (MIN(deathYear - birthYear) FROM Artists)
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY age DESC LIMIT 1
SELECT count(*) FROM Paintings WHERE location = 'gallery 240'
SELECT count(*) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT title, year FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE fname = 'Mary')
SELECT title, year FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE fname = 'Mary')
SELECT width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT Paintings.width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT location, medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT location, medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' INTERSECT SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'lithographic'
SELECT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium IN ('oil', 'lithographic') GROUP BY a.artistID HAVING COUNT(DISTINCT p.medium) = 2
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884 AND mediumOn = 'canvas')
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884)
SELECT DISTINCT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241')
SELECT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241')
SELECT medium, COUNT(*) FROM ( SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures ) AS Combined GROUP BY medium
SELECT medium, COUNT(*) FROM ( SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures ) AS Combined GROUP BY medium
SELECT avg(height_mm), medium FROM Paintings GROUP BY medium
SELECT avg(height_mm), medium FROM Paintings GROUP BY medium
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT count(*), location FROM Paintings WHERE year < 1900 GROUP BY location
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM Paintings WHERE medium = 'Oil' AND year > 1910
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 240'
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 240'
SELECT DISTINCT P1.title FROM Paintings P1 WHERE P1.height_mm > (SELECT MIN(P2.height_mm) FROM Paintings P2 WHERE P2.mediumOn = 'canvas')
SELECT DISTINCT T1.title FROM Paintings AS T1 JOIN Paintings AS T2 ON T1.height_mm > T2.height_mm WHERE T2.mediumOn = 'canvas'
SELECT DISTINCT paintingID FROM Paintings WHERE year < (SELECT min(year) FROM Paintings WHERE location = 'gallery 240')
SELECT DISTINCT T1.paintingID FROM Paintings AS T1 JOIN Paintings AS T2 ON T1.year < T2.year WHERE T2.location = 'gallery 240'
SELECT paintingID FROM Paintings ORDER BY year LIMIT 1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT fname || ' ' || lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE title LIKE '%female%')
SELECT A.fname || ' ' || A.lname AS full_name FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY width_mm
SELECT DISTINCT title FROM Paintings ORDER BY height_mm
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(Counted) FROM (SELECT sculptorID, COUNT(sculptureID) AS Counted FROM Sculptures GROUP BY sculptorID)))
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Sculptures GROUP BY sculptorID)))
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('on panel', 'on canvas')
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('panels', 'canvas')
SELECT location FROM Paintings WHERE year < 1885 INTERSECT SELECT location FROM Paintings WHERE year > 1930
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT avg(height_mm), avg(width_mm) FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT MAX(height_mm), paintingID FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, max(height_mm), max(width_mm) FROM Paintings GROUP BY year
SELECT year, max(height_mm), max(width_mm) FROM Paintings GROUP BY year
SELECT AVG(height_mm) AS AverageHeight, AVG(width_mm) AS AverageWidth, a.fname, a.lname FROM Paintings p JOIN Artists a ON p.painterID = a.artistID GROUP BY painterID ORDER BY a.lname, a.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(*) FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT A.fname, COUNT(*) AS num_paintings FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT deathYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings GROUP BY painterID HAVING COUNT(paintingID) <= 3)
SELECT A.deathYear FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) < 4
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT height_mm, paintingID FROM Paintings WHERE width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240') AND location = 'gallery 240'
SELECT p.paintingID FROM Paintings p WHERE p.year < ALL (SELECT year FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT p.paintingID FROM Paintings p WHERE p.height_mm > ALL (SELECT p2.height_mm FROM Paintings p2 WHERE p2.year > 1900)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE year > 1900)
SELECT A.fname, A.lname, COUNT(*) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY COUNT(*) DESC LIMIT 3
SELECT fname, lname FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE medium = 'oil' GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P) AND A.artistID NOT IN (SELECT S.sculptorID FROM Sculptures S)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas' GROUP BY location
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas'
SELECT count(*) FROM race
SELECT count(*) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT max(Age), min(Age) FROM driver
SELECT max(Age), min(Age) FROM driver
SELECT count(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT count(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T2.Driver_Name, T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT T2.Driver_Name, T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT Driver_Name, COUNT(Road) AS NumberOfRaces FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY Driver_Name
SELECT Driver_Name, COUNT(*) AS Races_Participated FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID, Driver_Name
SELECT Driver.Age FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Age FROM driver WHERE Driver_ID = (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT D.Driver_Name, D.Age FROM driver D WHERE D.Driver_ID IN (SELECT R.Driver_ID FROM race R GROUP BY R.Driver_ID HAVING COUNT(R.Road) >= 2)
SELECT d.Driver_Name, d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID HAVING COUNT(r.Road) >= 2
SELECT Race_Name FROM race JOIN driver ON race.Driver_ID = driver.Driver_ID WHERE driver.Age >= 26
SELECT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Constructor , COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Engine) = (SELECT MAX(count) FROM (SELECT COUNT(Engine) AS count FROM driver GROUP BY Engine))
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) >= 2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) >= 2
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe') INTERSECT SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe' INTERSECT SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT avg(justice_score) FROM countries
SELECT avg(justice_score) FROM countries
SELECT max(health_score), min(health_score) FROM countries WHERE name != 'Norway'
SELECT max(health_score), min(health_score) FROM countries WHERE name != 'Norway'
SELECT count(DISTINCT language_id) FROM official_languages
SELECT count(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT C.name AS Country_Name, L.name AS Language_Name FROM countries C JOIN official_languages OL ON C.id = OL.country_id JOIN languages L ON OL.language_id = L.id
SELECT T1.name AS country_name, T2.name AS language_name FROM countries AS T1 JOIN official_languages AS T3 ON T1.id = T3.country_id JOIN languages AS T2 ON T3.language_id = T2.id
SELECT l.name, COUNT(ol.country_id) AS num_countries FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.id
SELECT languages.name, COUNT(DISTINCT official_languages.country_id) AS num_countries FROM languages LEFT JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name HAVING COUNT(*) >= 2
SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(country_id) >= 2
SELECT AVG(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id IN (SELECT id FROM languages WHERE name = 'English'))
SELECT avg(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id = (SELECT id FROM languages WHERE name = 'English'))
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 3)
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name ORDER BY count(*) DESC LIMIT 3
SELECT languages.name FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY AVG(countries.overall_score) DESC
SELECT languages.name, AVG(countries.overall_score) AS avg_score FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY avg_score DESC
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id GROUP BY countries.id HAVING COUNT(official_languages.language_id) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id))
SELECT countries.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id GROUP BY countries.name ORDER BY COUNT(official_languages.language_id) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score > 95)) INTERSECT SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score < 90))
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score > 95) INTERSECT SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score < 90))
SELECT DISTINCT country, town_city FROM Addresses
SELECT country, town_city FROM Addresses
SELECT `county_state_province` FROM `Addresses` JOIN `Properties` ON `Addresses`.`address_id` = `Properties`.`property_address_id`
SELECT T2.county_state_province FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id = T2.property_address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT min(room_count) FROM Properties
SELECT MIN(room_count) FROM Properties
SELECT count(*) FROM Properties WHERE parking_lots = '1' OR garage_yn = '1'
SELECT count(*) FROM Properties WHERE parking_lots = '1' OR garage_yn = '1'
SELECT DISTINCT Ref_Age_Categories.age_category_description FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Users.other_user_details LIKE '%Mother%'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_description LIKE '%Mother%'
SELECT first_name FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id GROUP BY Users.user_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT first_name FROM Users WHERE user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(room_count) FROM Properties WHERE property_description LIKE '%garden%'
SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id IN (SELECT feature_id FROM Features WHERE feature_name = 'Garden'))
SELECT DISTINCT a.town_city FROM Properties p JOIN Addresses a ON p.property_address_id = a.address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'Swimming Pool'
SELECT town_city FROM Addresses WHERE address_id IN (SELECT property_address_id FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id = (SELECT feature_id FROM Features WHERE feature_name = 'Swimming Pool')))
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT avg(room_count) FROM Properties
SELECT avg(room_count) FROM Properties
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT count(DISTINCT room_size) FROM Rooms
SELECT user_id, search_string FROM User_Searches GROUP BY user_id, search_string HAVING COUNT(*) >= 2
SELECT user_id, search_seq FROM User_Searches GROUP BY user_id HAVING COUNT(*) >= 2
SELECT max(search_datetime) FROM User_Searches
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT T1.user_category_code, T1.user_id FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id GROUP BY T1.user_id HAVING COUNT(*) = 1
SELECT U.user_id, U.user_category_code FROM Users U WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) = 1)
SELECT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code = T2.age_category_code JOIN User_Searches AS T3 ON T2.user_id = T3.user_id ORDER BY T3.search_datetime ASC LIMIT 1
SELECT Ref_Age_Categories.age_category_description FROM Ref_Age_Categories JOIN Users ON Ref_Age_Categories.age_category_code = Users.age_category_code WHERE Users.user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC LIMIT 1)
SELECT login_name FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE age_category_description = 'Senior Citizen' ORDER BY first_name
SELECT login_name FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE age_category_description = 'Senior Citizen' ORDER BY first_name
SELECT COUNT(*) FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE is_buyer = '1')
SELECT COUNT(*) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT date_registered FROM Users WHERE login_name = 'ratione';
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1';
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1'
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Addresses A JOIN Users U ON A.address_id = U.user_address_id JOIN Ref_User_Categories R ON U.user_category_code = R.user_category_code WHERE R.user_category_description = 'Senior Citizen'
SELECT Addresses.line_1_number_building, Addresses.line_2_number_street, Addresses.town_city FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Ref_Age_Categories.age_category_description = 'Senior Citizen'
SELECT count(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING count(*) >= 2)
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS properties_with_features
SELECT property_id, COUNT(*) FROM Property_Photos GROUP BY property_id
SELECT count(*) , property_id FROM Property_Photos GROUP BY property_id
SELECT owner_user_id, COUNT(*) FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT owner_user_id, COUNT(*) FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT SUM(p.price_max) FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN ('single_mother', 'student')
SELECT SUM(p.price_max) FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN ('single_mother', 'student')
SELECT datestamp, property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY datestamp
SELECT datestamp, property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY datestamp
SELECT T1.property_type_description, T1.property_type_code FROM Ref_Property_Types AS T1 JOIN Properties AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Ref_Property_Types.property_type_code, Ref_Property_Types.property_type_description, COUNT(*) AS freq FROM Properties JOIN Ref_Property_Types ON Properties.property_type_code = Ref_Property_Types.property_type_code GROUP BY Properties.property_type_code HAVING freq = (SELECT MAX(freq) FROM (SELECT COUNT(*) AS freq FROM Properties GROUP BY property_type_code))
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'
SELECT country FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id WHERE Users.first_name = 'Robbie';
SELECT U.first_name, U.middle_name, U.last_name FROM Users AS U JOIN Properties AS P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id;
SELECT U.first_name || ' ' || U.middle_name || ' ' || U.last_name AS full_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id JOIN Addresses A ON U.user_address_id = A.address_id WHERE P.property_address_id = A.address_id
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT U.last_name, U.user_id FROM Users U WHERE U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2) AND U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2)
SELECT U.last_name, U.user_id FROM Users U JOIN User_Searches US ON U.user_id = US.user_id JOIN Properties P ON U.user_id = P.owner_user_id GROUP BY U.user_id HAVING COUNT(DISTINCT US.search_seq) <= 2 AND COUNT(DISTINCT P.property_id) >= 2
SELECT count(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight) AS MaxWeight, MIN(weight) AS MinWeight FROM bike
SELECT avg(price) FROM bike WHERE material = 'Carbon CC'
SELECT Name, Result FROM cyclist WHERE Nation != 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT B.id, B.product_name FROM bike AS B JOIN cyclists_own_bikes AS COB ON B.id = COB.bike_id GROUP BY B.id HAVING count(*) >= 4
SELECT cyclist.id, cyclist.name FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id = T3.id WHERE T3.result < '4:21.558'
SELECT bike.product_name, bike.price FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY bike.id HAVING COUNT(DISTINCT cyclist.name) = 2
SELECT c.name, c.nation, c.result FROM cyclist c WHERE c.id NOT IN (SELECT cob.cyclist_id FROM cyclists_own_bikes cob)
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist.id, COUNT(cyclists_own_bikes.bike_id) AS bike_count FROM cyclist JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id ORDER BY cyclist.id ASC;
SELECT g.Food, g.Flavor FROM goods g WHERE g.Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT Id, Flavor FROM goods WHERE Food = 'cake' AND Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT Flavor, Food FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Flavor = 'Apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
SELECT DISTINCT r.CustomerId FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT goods.Food, COUNT(DISTINCT receipts.CustomerId) FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY goods.Food
SELECT Food, COUNT(DISTINCT CustomerId) AS CustomerCount FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY Food
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) >= 15
SELECT T1.CustomerId FROM receipts AS T1 GROUP BY T1.CustomerId HAVING COUNT(*) >= 15
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT COUNT(*) FROM goods WHERE Food = 'Cake'
SELECT count(*) FROM goods WHERE Food = 'cake'
SELECT Flavor FROM goods WHERE Food = 'Croissant'
SELECT Flavor FROM goods WHERE Food = 'croissant'
SELECT DISTINCT T1.Item FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt = T2.ReceiptNumber WHERE T2.CustomerId = 15
SELECT DISTINCT goods.Flavor FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT Food, avg(Price), max(Price), min(Price) FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food
SELECT r.ReceiptNumber FROM receipts r WHERE EXISTS (SELECT 1 FROM items i WHERE i.Receipt = r.ReceiptNumber AND i.Item IN (SELECT Id FROM goods WHERE Food = 'Cake')) AND EXISTS (SELECT 1 FROM items i WHERE i.Receipt = r.ReceiptNumber AND i.Item IN (SELECT Id FROM goods WHERE Food = 'Cookie'))
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('cake', 'cookie') GROUP BY r.ReceiptNumber HAVING COUNT(DISTINCT g.Food) = 2
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'LOGAN') AND ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'Croissant'))
SELECT DISTINCT r.ReceiptNumber FROM receipts AS r JOIN customers AS c ON r.CustomerId = c.Id JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE c.LastName = 'Logan' AND g.Food = 'croissant';
SELECT r.ReceiptNumber, r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
SELECT ReceiptNumber, Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE Price = (SELECT MAX(Price) FROM goods))
SELECT items.Item FROM items GROUP BY items.Item ORDER BY COUNT(*) ASC LIMIT 1
SELECT t1.Item FROM items AS t1 GROUP BY t1.Item ORDER BY COUNT(*) ASC LIMIT 1
SELECT Food , COUNT(*) FROM goods GROUP BY Food
SELECT Food , count(*) FROM goods GROUP BY Food
SELECT avg(T1.Price), T1.Food FROM goods AS T1 GROUP BY T1.Food
SELECT avg(Price), Food FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Tart')
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < ALL (SELECT g2.Price FROM goods g2 WHERE g2.Food = 'Tart')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Price > 13
SELECT R.Date FROM receipts AS R JOIN items AS I ON R.ReceiptNumber = I.Receipt JOIN goods AS G ON I.Item = G.Id WHERE G.Price > 15
SELECT r.Date FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE g.Price > 15
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Flavor, Price FROM goods WHERE Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName
SELECT LastName FROM customers ORDER BY LastName
SELECT Id FROM goods ORDER BY Id ASC
SELECT DISTINCT Id FROM goods ORDER BY Id
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt LEFT JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie' OR r.CustomerId = 12
SELECT receipts.ReceiptNumber FROM receipts LEFT JOIN items ON receipts.ReceiptNumber = items.Receipt LEFT JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'apple' AND goods.Food = 'pie' OR receipts.CustomerId = 12
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT ReceiptNumber FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts) OR ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10))
SELECT ReceiptNumber FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10)) OR Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE Food IN ('Cookie', 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE (Food = 'Cookies' OR Food = 'Cakes') AND Price BETWEEN 3 AND 7
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId WHERE r.Date = (SELECT MIN(Date) FROM receipts)
SELECT C.FirstName || ' ' || C.LastName FROM customers C JOIN receipts R ON C.Id = R.CustomerId ORDER BY R.Date ASC LIMIT 1
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT min(Price) FROM goods WHERE Flavor = 'cheese'
SELECT g.Id FROM goods g WHERE g.Flavor = 'cheese' ORDER BY g.Price LIMIT 1
SELECT MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice, AVG(Price) AS AveragePrice, Flavor FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, max(Price), min(Price), avg(Price) FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT min(Price), max(Price), Food FROM goods GROUP BY Food ORDER BY Food
SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice, Food FROM goods WHERE Food IS NOT NULL GROUP BY Food ORDER BY Food
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(*) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(*) DESC LIMIT 3
SELECT CustomerId, count(*) AS times_shopped FROM receipts GROUP BY CustomerId ORDER BY times_shopped DESC LIMIT 1
SELECT T1.CustomerId, COUNT(*) FROM receipts AS T1 GROUP BY T1.CustomerId ORDER BY COUNT(*) DESC LIMIT 1;
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tart'
SELECT C.FirstName || ' ' || C.LastName AS full_name FROM customers C JOIN receipts R ON C.Id = R.CustomerId JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Flavor = 'apple' AND G.Food = 'Tarts'
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Croissant')
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Food = 'cake' AND Price >= (SELECT avg(Price) FROM goods WHERE Flavor = 'Tart')
SELECT Id FROM goods WHERE Price > (SELECT 2 * avg(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor FROM goods WHERE Food = 'Cake' ORDER BY Flavor;
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor;
SELECT g.Id, g.Flavor FROM goods g LEFT JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(i.Item) <= 10
SELECT goods.Id FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Flavor = 'chocolate' GROUP BY goods.Id HAVING COUNT(*) <= 10;
SELECT Flavor FROM goods WHERE Food = 'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food = 'Tart'
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3
SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT CustomerId FROM receipts AS R JOIN items AS I ON R.ReceiptNumber = I.Receipt JOIN goods AS G ON I.Item = G.Id GROUP BY CustomerId HAVING AVG(G.Price) > 5
SELECT Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id GROUP BY Receipt HAVING SUM(Price) > 100)
SELECT Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY Date HAVING sum(Price) > 100
SELECT count(*) FROM driver
SELECT count(*) FROM driver
SELECT Make, COUNT(*) FROM driver WHERE Points > 150 GROUP BY Make;
SELECT Make, count(*) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) FROM driver GROUP BY Make
SELECT Make, AVG(Age) FROM driver GROUP BY Make
SELECT avg(Laps) FROM driver WHERE Age < 20
SELECT avg(Laps) FROM driver WHERE Age < 20
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT max(Points), min(Points) FROM driver
SELECT max(Points), min(Points) FROM driver
SELECT count(*) FROM driver WHERE Points < 150
SELECT count(*) FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT D.Driver, C.Country FROM driver AS D JOIN country AS C ON D.Country = C.Country_Id
SELECT T1.Driver, T2.Country FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id
SELECT max(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT max(d.Points) FROM driver AS d JOIN country AS c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT avg(driver.Age) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Official_native_language = 'English'
SELECT avg(driver.Age) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Official_native_language = 'English'
SELECT C.Country FROM country C JOIN driver D ON C.Country_Id = D.Country WHERE D.Points > 150
SELECT DISTINCT country.Country FROM country JOIN driver ON country.Country_Id = driver.Country WHERE driver.Points > 150
SELECT Capital FROM country WHERE Country_Id = (SELECT Country FROM driver ORDER BY Points DESC LIMIT 1)
SELECT Capital FROM country WHERE Country_Id = (SELECT Country FROM driver ORDER BY Points DESC LIMIT 1)
SELECT Make, COUNT(*) FROM driver GROUP BY Make
SELECT Make, COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) >= 3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) >= 3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT C.Country FROM country C JOIN driver D ON C.Country_Id = D.Country WHERE D.Make = 'Dodge' INTERSECT SELECT C.Country FROM country C JOIN driver D ON C.Country_Id = D.Country WHERE D.Make = 'Chevrolet'
SELECT DISTINCT c.Country FROM country c WHERE c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Dodge' INTERSECT SELECT d.Country FROM driver d WHERE d.Make = 'Chevrolet')
SELECT sum(Points), avg(Points) FROM driver
SELECT sum(Points), avg(Points) FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver)
SELECT Manager, Sponsor FROM team JOIN team_driver ON team.Team_ID = team_driver.Team_ID GROUP BY team.Team_ID ORDER BY COUNT(team_driver.Driver_ID) DESC LIMIT 1
SELECT t.Manager, t.Sponsor FROM team t WHERE t.Team_ID IN (SELECT td.Team_ID FROM team_driver td GROUP BY td.Team_ID HAVING COUNT(td.Driver_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Driver_ID) AS count FROM team_driver GROUP BY Team_ID) AS counts))
SELECT T1.Manager, T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID HAVING count(T2.Driver_ID) >= 2
SELECT T.manager, T.Car_Owner FROM team T JOIN team_driver TD ON T.Team_ID = TD.Team_ID GROUP BY T.Team_ID HAVING COUNT(TD.Driver_ID) >= 2
SELECT count(*) FROM institution
SELECT count(*) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT City , Province FROM institution
SELECT City, Province FROM institution
SELECT max(Enrollment) , min(Enrollment) FROM institution
SELECT max(Enrollment) , min(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT i.Stadium FROM institution i WHERE i.Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Name , Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT Name, Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T1.Enrollment ASC LIMIT 1
SELECT C.Nickname FROM Championship C INNER JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID ORDER BY Number_of_Championships DESC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship ORDER BY Number_of_Championships DESC)
SELECT Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID GROUP BY Name HAVING COUNT(*) >= 1
SELECT Name FROM institution AS I JOIN Championship AS C ON I.Institution_ID = C.Institution_ID GROUP BY I.Institution_ID HAVING count(C.Number_of_Championships) >= 1
SELECT sum(Number_of_Championships) FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Affiliation = 'Public'
SELECT sum(T2.Number_of_Championships) FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Affiliation = 'Public'
SELECT Affiliation , COUNT(*) FROM institution GROUP BY Affiliation
SELECT Affiliation , COUNT(*) FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(Affiliation) = (SELECT MAX(count) FROM (SELECT COUNT(Affiliation) AS count FROM institution GROUP BY Affiliation))
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT Founded, COUNT(*) FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT Nickname FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID ORDER BY Capacity DESC
SELECT Nickname FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID ORDER BY institution.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City = 'Vancouver' OR City = 'Calgary'
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT COUNT(DISTINCT Province) FROM institution
SELECT count(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York'
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse
SELECT avg(Value), Location FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Location
SELECT avg(Value), sum(Value) FROM Boxes
SELECT avg(Value), sum(Value) FROM Boxes
SELECT avg(Capacity), sum(Capacity) FROM Warehouses
SELECT avg(Capacity), sum(Capacity) FROM Warehouses
SELECT Contents, avg(Value), max(Value) FROM Boxes GROUP BY Contents
SELECT avg(Value), max(Value), Contents FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes)
SELECT avg(Value) FROM Boxes
SELECT avg(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT count(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT Code FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location IN ('Chicago', 'New York')
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') INTERSECT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Contents FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors'))
SELECT DISTINCT w.Location FROM Warehouses w JOIN Boxes b ON w.Code = b.Warehouse WHERE b.Contents IN ('Rocks', 'Scissors')
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value LIMIT 1
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT B.Code FROM Boxes B WHERE B.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT Code, Contents FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT Code, Contents FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT SUM(b.Value) FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT SUM(b.Value) FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150
SELECT Contents, COUNT(*), SUM(Value) FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value), COUNT(*) FROM Boxes GROUP BY Contents
SELECT Location, sum(Capacity), avg(Capacity), max(Capacity) FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity), AVG(Capacity), MAX(Capacity) FROM Warehouses GROUP BY Location
SELECT sum(Capacity) FROM Warehouses
SELECT sum(Capacity) FROM Warehouses
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT W.Location, MAX(B.Value) FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT Warehouse, count(*) FROM Boxes GROUP BY Warehouse
SELECT COUNT(DISTINCT Location) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse WHERE Boxes.Contents = 'Rocks'
SELECT count(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks'
SELECT Boxes.Code, Warehouses.Location FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
SELECT B.Code, W.Location FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'Chicago'
SELECT Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'Chicago'
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT Warehouse, COUNT(DISTINCT Contents) FROM Boxes GROUP BY Warehouse
SELECT Warehouse, count(DISTINCT Contents) FROM Boxes GROUP BY Warehouse
SELECT W.Code FROM Warehouses W WHERE (SELECT SUM(B.Value) FROM Boxes B WHERE B.Warehouse = W.Code) > W.Capacity
SELECT W.Code FROM Warehouses AS W JOIN Boxes AS B ON W.Code = B.Warehouse GROUP BY W.Code HAVING COUNT(B.Code) > W.Capacity
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT sum(Value) FROM Boxes AS B JOIN Warehouses AS W ON B.Warehouse = W.Code WHERE W.Location != 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT count(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT count(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT max(Enrollment), avg(Enrollment), min(Enrollment) FROM university
SELECT max(Enrollment), avg(Enrollment), min(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT avg(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(*) FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(*) FROM university GROUP BY Home_Conference;
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY SUM(Enrollment) ASC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) T)
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT major.Major_Name, major_ranking.Rank FROM major JOIN major_ranking ON major.Major_ID = major_ranking.Major_ID JOIN university ON major_ranking.University_ID = university.University_ID WHERE university.University_Name = 'Augustana College'
SELECT mr.Rank, m.Major_Name FROM major_ranking mr INNER JOIN major m ON mr.Major_ID = m.Major_ID INNER JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT U.University_Name, U.City, U.State FROM university AS U JOIN major_ranking AS MR ON U.University_ID = MR.University_ID JOIN major AS M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT University_Name, City, State FROM university WHERE University_ID = (SELECT University_ID FROM major_ranking WHERE Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND Rank = 1)
SELECT U.University_Name FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID WHERE MR.Rank = 1 GROUP BY U.University_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT u.University_Name FROM university u WHERE NOT EXISTS (SELECT 1 FROM major_ranking mr WHERE mr.University_ID = u.University_ID AND mr.Rank = 1)
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') INTERSECT SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education'))
SELECT DISTINCT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name IN ('Accounting', 'Urban Education') GROUP BY u.University_ID HAVING COUNT(DISTINCT m.Major_Name) = 2
SELECT University_Name, Rank FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE State = 'Wisconsin'
SELECT University_Name, Rank FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE State = 'Wisconsin'
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM overall_ranking WHERE Research_point = (SELECT MAX(Research_point) FROM overall_ranking))
SELECT University_Name FROM university WHERE University_ID = (SELECT University_ID FROM overall_ranking ORDER BY Research_point DESC LIMIT 1)
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT University_Name FROM university AS u JOIN major_ranking AS mr ON u.University_ID = mr.University_ID JOIN major AS m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3
SELECT University_Name FROM university JOIN major_ranking ON university.University_ID = major_ranking.University_ID JOIN major ON major.Major_ID = major_ranking.Major_ID WHERE major.Major_Name = 'Accounting' AND major_ranking.Rank <= 3
SELECT SUM(Enrollment) FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank <= 5)
SELECT SUM(Enrollment) FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank <= 5)
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE O.Reputation_point >= 3
SELECT University_Name, Citation_point FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING count(*) > 2;
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING count(*) > 2;
SELECT Title FROM Movies WHERE Rating IS NULL OR Rating = ''
SELECT Title FROM Movies WHERE Rating IS NULL;
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT M.Title FROM Movies AS M JOIN MovieTheaters AS MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon';
SELECT Title, Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT M.Title, MT.Name FROM Movies M INNER JOIN MovieTheaters MT ON M.Code = MT.Movie
SELECT count(*) FROM Movies WHERE Rating = 'G'
SELECT count(*) FROM Movies WHERE Rating = 'G'
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT count(DISTINCT Code) FROM MovieTheaters
SELECT count(*) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))
SELECT M.Title FROM Movies M, MovieTheaters MT1, MovieTheaters MT2 WHERE MT1.Name = 'Odeon' AND MT2.Name = 'Imperial' AND MT1.Movie = MT2.Movie AND M.Code = MT1.Movie
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial') GROUP BY Movie HAVING COUNT(*) > 1)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title
SELECT Title FROM Movies ORDER BY Rating
SELECT Title FROM Movies ORDER BY Rating
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Name ORDER BY count(*) DESC LIMIT 1;
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Movie ORDER BY count(*) DESC LIMIT 1
SELECT M.Title FROM Movies AS M JOIN MovieTheaters AS MT ON M.Code = MT.Movie GROUP BY MT.Movie ORDER BY COUNT(*) DESC LIMIT 1
SELECT Rating, COUNT(*) AS num_movies FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
SELECT Title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating IS NULL
SELECT * FROM Movies WHERE Rating IS NULL OR Rating = ''
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Client.Name FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber ORDER BY Package.Weight DESC LIMIT 1
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Recipient WHERE p.Weight = (SELECT MAX(Weight) FROM Package)
SELECT sum(P.Weight) FROM Package AS P JOIN Client AS C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT SUM(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position, Salary FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT avg(Salary) FROM Employee WHERE Position = 'Intern'
SELECT avg(Salary) FROM Employee WHERE Position = 'Intern'
SELECT Level FROM Has_Clearance WHERE Employee = (SELECT EmployeeID FROM Employee WHERE Position = 'Physician')
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Position = 'Physician'
SELECT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT count(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT * FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT count(*) FROM Package AS P JOIN Client AS C1 ON P.Sender = C1.AccountNumber JOIN Client AS C2 ON P.Recipient = C2.AccountNumber WHERE C1.Name = 'Ogden Wernstrom' AND C2.Name = 'Leo Wong'
SELECT count(*) FROM Package JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT Contents FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb'
SELECT T1.Contents FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name = 'John Zoidfarb'
SELECT PackageNumber, Weight FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE '%John%' ORDER BY Weight DESC LIMIT 1
SELECT p.PackageNumber, p.Weight FROM Package p INNER JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name LIKE 'John%' ORDER BY p.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT Client.Name, COUNT(*) AS NumberOfPackages FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber ORDER BY COUNT(*) DESC LIMIT 1;
SELECT T1.Name, count(*) FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber ORDER BY count(*) DESC LIMIT 1
SELECT Client.Name, COUNT(*) AS NumberOfPackagesReceived FROM Client JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.AccountNumber ORDER BY COUNT(*) ASC LIMIT 1;
SELECT Recipient, COUNT(*) AS PackageCount FROM Package GROUP BY Recipient ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber HAVING COUNT(*) > 1
SELECT T1.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber HAVING COUNT(*) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry'
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars') AND Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars') OR Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
SELECT ShipmentID FROM Shipment WHERE Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela') AND Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars')
SELECT Planet.Name, COUNT(*) AS TotalShipments FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID
SELECT P.Name, COUNT(*) FROM Planet AS P JOIN Shipment AS S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT Name FROM Planet WHERE PlanetID = (SELECT Planet FROM Shipment GROUP BY Planet ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Planet.Name FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID ORDER BY COUNT(*) DESC LIMIT 1
SELECT E.Name, COUNT(S.ShipmentID) AS num_shipments FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.EmployeeID
SELECT COUNT(s.ShipmentID) AS num_shipments, e.Name AS manager_name FROM Shipment s JOIN Employee e ON s.Manager = e.EmployeeID GROUP BY s.Manager, e.Name
SELECT sum(P.Weight) FROM Package AS P JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Planet AS Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID, Planet.Name
SELECT sum(P.Weight) AS TotalWeight, Pl.Name FROM Package AS P JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Planet AS Pl ON S.Planet = Pl.PlanetID GROUP BY Pl.Name
SELECT P.Name FROM Planet AS P JOIN Shipment AS S ON P.PlanetID = S.Planet JOIN Package AS PK ON S.ShipmentID = PK.Shipment GROUP BY P.PlanetID HAVING SUM(PK.Weight) > 30;
SELECT P.Name FROM Planet AS P JOIN Shipment AS S ON P.PlanetID = S.Planet JOIN Package AS PK ON S.ShipmentID = PK.Shipment GROUP BY P.PlanetID HAVING SUM(PK.Weight) > 30;
SELECT Package.PackageNumber FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' AND Client.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Client ON Package.Sender = Client.AccountNumber JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT PackageNumber FROM Package AS P JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Planet AS Pl ON S.Planet = Pl.PlanetID JOIN Client AS C ON P.Sender = C.AccountNumber WHERE Pl.Name = 'Omicron Persei 8' OR C.Name = 'Zapp Brannigan'
SELECT count(*) FROM Package AS P JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Planet AS Pl ON S.Planet = Pl.PlanetID JOIN Client AS C ON P.Sender = C.AccountNumber WHERE Pl.Name = 'Omicron Persei 8' OR C.Name = 'Zapp Brannigan';
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30;
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT e.Name FROM Employee e WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE hc.Employee = e.EmployeeID AND p.Name = 'Mars')
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omega III'))
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omega III'))
SELECT P.Name FROM Planet AS P JOIN Has_Clearance AS HC ON P.PlanetID = HC.Planet GROUP BY P.PlanetID HAVING COUNT(*) = 1
SELECT Planet.Name FROM Planet JOIN Has_Clearance ON Planet.PlanetID = Has_Clearance.Planet GROUP BY Has_Clearance.Planet HAVING COUNT(*) = 1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT Name FROM Employee WHERE salary > (SELECT avg(salary) FROM Employee) OR salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT count(*) FROM game
SELECT count(*) FROM game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT avg(Units_sold_Millions) FROM game WHERE Developers <> 'Nintendo'
SELECT avg(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1;
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT count(*) FROM player WHERE Rank_of_the_year < 3
SELECT count(*) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, Rank_of_the_year FROM player WHERE Player_ID IN (SELECT Player_ID FROM game_player WHERE Game_ID IN (SELECT Game_ID FROM game WHERE Title = 'Super Mario World'))
SELECT Player_name, Rank_of_the_year FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game_player.Game_ID = game.Game_ID WHERE Title = 'Super Mario World'
SELECT DISTINCT T2.Developers FROM game_player AS T1 JOIN game AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T1.Player_ID = T3.Player_ID WHERE T3.College = 'Auburn'
SELECT DISTINCT game.Developers FROM game JOIN game_player ON game.Game_ID = game_player.Game_ID JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Auburn'
SELECT avg(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT AVG(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT Title, Platform_name FROM game JOIN platform ON game.Platform_ID = platform.Platform_ID
SELECT G.Title, P.Platform_name FROM game AS G JOIN platform AS P ON G.Platform_ID = P.Platform_ID
SELECT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA')
SELECT DISTINCT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA')
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) >= 2
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Oklahoma')) INTERSECT SELECT Title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Auburn'))
SELECT DISTINCT g.Title FROM game AS g JOIN game_player AS gp ON g.Game_ID = gp.Game_ID JOIN player AS p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma' OR p.College = 'Auburn'
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE Position = 'Guard')
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT avg(Year_Profits_billion), max(Year_Profits_billion) FROM press
SELECT Press_ID, avg(Year_Profits_billion), max(Year_Profits_billion) FROM press GROUP BY Press_ID
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT count(*) FROM author WHERE Age < 30
SELECT count(*) FROM author WHERE Age < 30
SELECT Gender, avg(Age) FROM author GROUP BY Gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT count(*) , Gender FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(*) FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(*) FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM' INTERSECT SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM' INTERSECT SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID HAVING COUNT(*) > 1
SELECT A.Name FROM author AS A JOIN book AS B ON A.Author_ID = B.Author_ID GROUP BY A.Author_ID HAVING COUNT(*) > 1
SELECT b.Title, a.Name AS Author_Name, p.Name AS Publisher_Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT book.Title, author.Name, press.Name FROM book JOIN author ON book.Author_ID = author.Author_ID JOIN press ON book.Press_ID = press.Press_ID ORDER BY book.Sale_Amount DESC LIMIT 3
SELECT press.Name, SUM(book.Sale_Amount) FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID
SELECT P.Name, SUM(B.Sale_Amount) FROM press AS P JOIN book AS B ON P.Press_ID = B.Press_ID GROUP BY P.Name
SELECT press.Name, COUNT(*) AS books_sold_over_1000 FROM book JOIN press ON book.Press_ID = press.Press_ID WHERE book.Sale_Amount > 1000 GROUP BY press.Press_ID;
SELECT P.name, COUNT(*) FROM press AS P JOIN book AS B ON P.Press_ID = B.Press_ID WHERE B.Sale_Amount > 1000 GROUP BY P.Press_ID
SELECT Name FROM author JOIN book ON author.Author_ID = book.Author_ID ORDER BY book.Sale_Amount DESC LIMIT 1
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book ORDER BY Sale_Amount DESC LIMIT 1)
SELECT A.Name, A.Gender FROM author AS A JOIN book AS B ON A.Author_ID = B.Author_ID GROUP BY A.Author_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT a.Name, a.Gender FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID ORDER BY COUNT(b.Book_ID) DESC LIMIT 1
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT Name, Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2
SELECT P.Name, P.Year_Profits_billion FROM press P JOIN book B ON P.Press_ID = B.Press_ID GROUP BY P.Press_ID HAVING COUNT(*) > 2
SELECT count(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT count(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT count(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT author_name, other_details FROM Documents WHERE document_name = 'Travel to China'
SELECT author_name, COUNT(*) FROM Documents GROUP BY author_name
SELECT author_name FROM Authors WHERE author_name = (SELECT author_name FROM Documents GROUP BY author_name ORDER BY COUNT(*) DESC LIMIT 1)
SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(*) >= 2
SELECT count(*) FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9)
SELECT count(*) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working';
SELECT count(*) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT count(*) FROM Staff
SELECT staff_id, staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT count(DISTINCT staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT count(DISTINCT document_id) FROM Documents_Processes
SELECT process_id FROM Documents_Processes;
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT bp.process_id FROM Business_Processes bp LEFT JOIN Documents_Processes dp ON bp.process_id = dp.process_id WHERE dp.document_id IS NULL
SELECT process_outcome_description, process_status_description FROM Process_Outcomes JOIN Documents_Processes ON Process_Outcomes.process_outcome_code = Documents_Processes.process_outcome_code JOIN Process_Status ON Documents_Processes.process_status_code = Process_Status.process_status_code WHERE Documents_Processes.document_id = 0
SELECT process_name FROM Business_Processes WHERE process_id IN (SELECT process_id FROM Documents WHERE document_name = 'Travel to Brazil')
SELECT process_id, COUNT(document_id) FROM Documents_Processes GROUP BY process_id
SELECT count(*) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
SELECT staff_id, COUNT(*) FROM Staff_in_Processes GROUP BY staff_id
SELECT staff_role_code, COUNT(*) AS num_document_processes FROM Staff_in_Processes GROUP BY staff_role_code
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3
SELECT count(*) FROM Agencies
SELECT count(*) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies;
SELECT count(*) FROM Clients
SELECT count(*) FROM Clients
SELECT client_id, client_details FROM Clients;
SELECT client_id, client_details FROM Clients;
SELECT A.agency_id, COUNT(C.client_id) AS client_count FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT agency_id, COUNT(*) FROM Clients GROUP BY agency_id
SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id ORDER BY COUNT(Clients.client_id) DESC LIMIT 1
SELECT agency_id, agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT agency_id, agency_details FROM Agencies AS A JOIN Clients AS C ON A.agency_id = C.agency_id GROUP BY A.agency_id HAVING count(*) >= 2
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id HAVING COUNT(*) >= 2
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT A.agency_details FROM Agencies AS A JOIN Clients AS C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT T1.client_details, T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id = T2.agency_id
SELECT C.client_details, A.agency_details FROM Clients AS C JOIN Agencies AS A ON C.agency_id = A.agency_id
SELECT sic_code, COUNT(*) FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(*) FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT count(*) FROM Invoices
SELECT count(*) FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT client_id, count(*) FROM Invoices GROUP BY client_id
SELECT client_id, COUNT(*) FROM Invoices GROUP BY client_id
SELECT C1.client_id, C1.client_details FROM Clients AS C1 JOIN Invoices AS I1 ON C1.client_id = I1.client_id GROUP BY C1.client_id ORDER BY COUNT(I1.invoice_id) DESC LIMIT 1
SELECT client_id, client_details FROM Clients JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(invoice_id) = (SELECT MAX(count) FROM (SELECT COUNT(invoice_id) AS count FROM Invoices GROUP BY invoice_status))
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.invoice_status, T1.invoice_details, T2.client_id, T2.client_details, T3.agency_id, T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Agencies AS T3 ON T2.agency_id = T3.agency_id
SELECT invoice_status, Invoices.invoice_details, Invoices.client_id, Clients.client_details, Clients.agency_id, Agencies.agency_details FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings;
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT i.invoice_id, i.invoice_status FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id WHERE p.payment_id IS NULL
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT count(*) FROM Payments
SELECT count(*) FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments;
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT invoice_id, invoice_status FROM Invoices
SELECT DISTINCT invoice_id, invoice_status FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id
SELECT i.invoice_id, COUNT(p.payment_id) AS payment_count FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id
SELECT invoice_id, COUNT(*) FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id GROUP BY T1.invoice_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT count(*) FROM Staff
SELECT count(*) FROM Staff
SELECT agency_id, COUNT(*) FROM Staff GROUP BY agency_id
SELECT agency_id, COUNT(*) FROM Staff GROUP BY agency_id
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY count(*) DESC LIMIT 1
SELECT T1.agency_id, T2.agency_details FROM Staff AS T1 JOIN Agencies AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT meeting_outcome, COUNT(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(*) FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id
SELECT meeting_type, client_id, COUNT(*) AS MeetingCount FROM Meetings GROUP BY client_id, meeting_type
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details FROM Meetings AS M JOIN Clients AS C ON M.client_id = C.client_id
SELECT T1.meeting_id, T1.meeting_outcome, T1.meeting_type, T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id
SELECT m.meeting_id, COUNT(sm.staff_id) AS staff_count FROM Meetings m LEFT JOIN Staff_in_Meetings sm ON m.meeting_id = sm.meeting_id GROUP BY m.meeting_id
SELECT meeting_id, COUNT(staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id ORDER BY num_meetings ASC LIMIT 1;
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id ORDER BY COUNT(meeting_id) ASC LIMIT 1
SELECT count(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT count(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT T1.staff_id, T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id = T2.staff_id WHERE T1.staff_details LIKE '%s%' GROUP BY T1.staff_id HAVING COUNT(*) >= 1
SELECT staff_id, staff_details FROM Staff WHERE staff_id IN (SELECT staff_id FROM Staff_in_Meetings) AND staff_details LIKE '%s%'
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C JOIN Meetings M ON C.client_id = M.client_id JOIN Invoices I ON C.client_id = I.client_id GROUP BY C.client_id, C.sic_code, C.agency_id HAVING COUNT(DISTINCT M.meeting_id) = 1
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C JOIN Meetings M ON C.client_id = M.client_id JOIN Invoices I ON C.client_id = I.client_id GROUP BY C.client_id, C.sic_code, C.agency_id HAVING COUNT(DISTINCT M.meeting_id) = 1
SELECT start_date_time, end_date_time, Clients.client_details, Staff.staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id JOIN Staff S ON SM.staff_id = S.staff_id
